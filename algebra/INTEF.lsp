
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

(SDEFUN |INTEF;unklimint|
        ((|f| F) (|x| |Symbol|) (|lu| |List| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
        (SPROG
         ((#1=#:G231 NIL) (#2=#:G232 NIL) (|c| (F)) (#3=#:G233 NIL) (|u| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |u| NIL . #4=(|INTEF;unklimint|))
                   (LETT #3# |lu| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |u| (|spadConstant| $ 31) (QREFELT $ 76))
                       (COND
                        ((SPADCALL
                          (SPADCALL
                           (LETT |c|
                                 (SPADCALL (SPADCALL |f| |u| (QREFELT $ 80))
                                           (SPADCALL |u| |x| (QREFELT $ 19))
                                           (QREFELT $ 32))
                                 . #4#)
                           |x| (QREFELT $ 19))
                          (QREFELT $ 78))
                         (PROGN
                          (LETT #1#
                                (PROGN
                                 (LETT #2#
                                       (CONS 0
                                             (CONS (|spadConstant| $ 31)
                                                   (LIST (CONS |c| |u|))))
                                       . #4#)
                                 (GO #5=#:G230))
                                . #4#)
                          (GO #6=#:G228))))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
             #6# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))
          #5# (EXIT #2#)))) 

(SDEFUN |INTEF;unkextint|
        ((|f| F) (|x| |Symbol|) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
        (SPROG ((|c| (F)) (|g'| (F)))
               (COND
                ((OR
                  (SPADCALL
                   (LETT |g'| (SPADCALL |g| |x| (QREFELT $ 19))
                         . #1=(|INTEF;unkextint|))
                   (QREFELT $ 78))
                  (NULL
                   (SPADCALL
                    (SPADCALL
                     (LETT |c| (SPADCALL |f| |g'| (QREFELT $ 32)) . #1#) |x|
                     (QREFELT $ 19))
                    (QREFELT $ 78))))
                 (CONS 1 "failed"))
                ('T (CONS 0 (CONS (|spadConstant| $ 31) |c|)))))) 

(SDEFUN |INTEF;diffint1|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F)
         ($ |Union| (|IntegrationResult| F) "failed"))
        (SPROG
         ((|f3| (F)) (|nres3| (|IntegrationResult| F))
          (|nres2| (|IntegrationResult| F)) (|nrat| (F)) (|alpha| (F))
          (#1=#:G259 NIL)
          (|nlogs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| F))
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (|cpol| #2=(|SparseUnivariatePolynomial| F)) (#3=#:G260 NIL)
          (|lg| NIL)
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|))) (|:| |coeff| #2#)
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (|nres| (|IntegrationResult| F)) (|f2| (F)) (|dv| (|Symbol|))
          (|k1| (F)) (|args| (|List| F)) (|f1| (F))
          (|nfu|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |nfu|
                  (SPADCALL (SPADCALL |f| (QREFELT $ 77)) |k| (QREFELT $ 94))
                  . #4=(|INTEF;diffint1|))
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |nfu| (QREFELT $ 96)) 1 (QREFELT $ 97))
               (CONS 1 "failed"))
              (#5='T
               (SEQ
                (LETT |f1|
                      (SPADCALL
                       (SPADCALL (SPADCALL |nfu| (QREFELT $ 98))
                                 (QREFELT $ 75))
                       (SPADCALL (SPADCALL |f| (QREFELT $ 74)) (QREFELT $ 75))
                       (QREFELT $ 32))
                      . #4#)
                (LETT |args| (SPADCALL |k| (QREFELT $ 18)) . #4#)
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 97))
                   (|error| "internal error, k is not a diff"))
                  (#5#
                   (SEQ
                    (LETT |k1|
                          (SPADCALL (SPADCALL |args| 1 (QREFELT $ 99))
                                    (SPADCALL
                                     (SPADCALL |args| 2 (QREFELT $ 99))
                                     (QREFELT $ 100))
                                    (SPADCALL |args| 3 (QREFELT $ 99))
                                    (QREFELT $ 101))
                          . #4#)
                    (LETT |dv| (SPADCALL (QREFELT $ 102)) . #4#)
                    (LETT |f2|
                          (SPADCALL |f1| |k1| (SPADCALL |dv| (QREFELT $ 83))
                                    (QREFELT $ 103))
                          . #4#)
                    (LETT |nres| (SPADCALL |f2| |dv| (QREFELT $ 43)) . #4#)
                    (COND
                     ((NULL (NULL (SPADCALL |nres| (QREFELT $ 104))))
                      (EXIT (CONS 1 "failed"))))
                    (LETT |logs| (SPADCALL |nres| (QREFELT $ 105)) . #4#)
                    (LETT |nlogs| NIL . #4#)
                    (LETT |nrat| (|spadConstant| $ 31) . #4#)
                    (SEQ (LETT |lg| NIL . #4#) (LETT #3# |logs| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |lg| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ (LETT |cpol| (QVELT |lg| 1) . #4#)
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (CONS #'|INTEF;diffint1!0| (VECTOR $ |x|))
                                  (SPADCALL |cpol| (QREFELT $ 108))
                                  (QREFELT $ 110))
                                 (LETT |nlogs| (CONS |lg| |nlogs|) . #4#))
                                ((SPADCALL (SPADCALL |cpol| (QREFELT $ 111)) 1
                                           (QREFELT $ 97))
                                 (PROGN
                                  (LETT #1# (CONS 1 "failed") . #4#)
                                  (GO #6=#:G258)))
                                ('T
                                 (SEQ
                                  (LETT |alpha|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |cpol| 0 (QREFELT $ 112))
                                          (SPADCALL |cpol| (QREFELT $ 113))
                                          (QREFELT $ 32))
                                         (QREFELT $ 114))
                                        . #4#)
                                  (EXIT
                                   (LETT |nrat|
                                         (SPADCALL |nrat|
                                                   (SPADCALL
                                                    (SPADCALL (QVELT |lg| 0)
                                                              |alpha|
                                                              (QREFELT $ 116))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QVELT |lg| 2)
                                                                (QREFELT $ 91)
                                                                |alpha|
                                                                (QREFELT $
                                                                         117))
                                                      (QREFELT $ 118))
                                                     (QREFELT $ 79))
                                                    (QREFELT $ 80))
                                                   (QREFELT $ 119))
                                         . #4#)))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                    (LETT |nres2|
                          (SPADCALL
                           (SPADCALL (SPADCALL |nres| (QREFELT $ 120)) |nrat|
                                     (QREFELT $ 119))
                           (NREVERSE |nlogs|) NIL (QREFELT $ 88))
                          . #4#)
                    (LETT |nres3|
                          (SPADCALL
                           (CONS #'|INTEF;diffint1!1| (VECTOR |k1| $ |dv|))
                           |nres2| (QREFELT $ 123))
                          . #4#)
                    (LETT |f3|
                          (SPADCALL |f| (SPADCALL |nres3| |x| (QREFELT $ 124))
                                    (QREFELT $ 125))
                          . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |k| (SPADCALL |f3| (QREFELT $ 127))
                                 (QREFELT $ 129))
                       (|error| "internal error, f still contains k"))
                      (#5#
                       (CONS 0
                             (SPADCALL |nres3|
                                       (SPADCALL |f3| |x| (QREFELT $ 43))
                                       (QREFELT $ 56))))))))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |INTEF;diffint1!1| ((|x1| NIL) ($$ NIL))
        (PROG (|dv| $ |k1|)
          (LETT |dv| (QREFELT $$ 2) . #1=(|INTEF;diffint1|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |k1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |dv| (QREFELT $ 121)) |k1|
                      (QREFELT $ 101)))))) 

(SDEFUN |INTEF;diffint1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;diffint1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| |x| (QREFELT $ 106)) (|spadConstant| $ 31)
                      (QREFELT $ 107)))))) 

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
         (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 131)) . #1=(|INTEF;isx?|))
              (EXIT
               (COND ((QEQCAR |k| 1) 'NIL)
                     (#2='T
                      (SEQ
                       (LETT |r| (SPADCALL (QCDR |k|) (QREFELT $ 133)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |r| 1) 'NIL)
                              (#2# (EQUAL (QCDR |r|) |x|))))))))))) 

(SDEFUN |INTEF;alg_split_root0|
        ((|f| F) (|r| |Kernel| F) (|n| |Integer|) ($ |List| F))
        (SPROG
         ((#1=#:G282 NIL) (|i| NIL) (#2=#:G281 NIL)
          (|q| (|SparseUnivariatePolynomial| F)) (|f1| (F)) (|f0| (F))
          (|ef| (F)))
         (SEQ
          (COND
           ((EQL |n| 2)
            (SEQ
             (LETT |ef|
                   (SPADCALL |f| |r|
                             (SPADCALL (SPADCALL |r| (QREFELT $ 134))
                                       (QREFELT $ 114))
                             (QREFELT $ 101))
                   . #3=(|INTEF;alg_split_root0|))
             (LETT |f0|
                   (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 119))
                             (SPADCALL 2 (QREFELT $ 135)) (QREFELT $ 32))
                   . #3#)
             (LETT |f1|
                   (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 125))
                             (SPADCALL 2 (QREFELT $ 135)) (QREFELT $ 32))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL |r| (SPADCALL |f0| (QREFELT $ 127)) (QREFELT $ 129))
                (SEQ (SPADCALL (SPADCALL |f0| (QREFELT $ 137)) (QREFELT $ 139))
                     (EXIT
                      (|error| "alg_split_root0: roots did not cancel 1"))))
               (#4='T
                (SEQ
                 (LETT |f1|
                       (SPADCALL |f1| (SPADCALL |r| (QREFELT $ 134))
                                 (QREFELT $ 32))
                       . #3#)
                 (EXIT
                  (COND
                   ((SPADCALL |r| (SPADCALL |f1| (QREFELT $ 127))
                              (QREFELT $ 129))
                    (SEQ
                     (SPADCALL (SPADCALL |f1| (QREFELT $ 137)) (QREFELT $ 139))
                     (EXIT
                      (|error| "alg_split_root0: roots did not cancel 2"))))
                   (#4# (LIST |f0| |f1|))))))))))
           (#4#
            (SEQ
             (LETT |q|
                   (SPADCALL |f| |r| (SPADCALL |r| (QREFELT $ 140))
                             (QREFELT $ 141))
                   . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |q| |i| (QREFELT $ 112)) #2#)
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |INTEF;alg_split_roots|
        ((|f| F) (|r1| |Kernel| F) (|r2| |Kernel| F)
         ($ |List|
          (|Record| (|:| |fun| F) (|:| |nroot| F) (|:| |npow1| (|Integer|))
                    (|:| |npow2| (|Integer|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |fun| F) (|:| |nroot| F) (|:| |npow1| (|Integer|))
                      (|:| |npow2| (|Integer|)))))
          (|nrr| (F)) (|nr| (F)) (|bb2| (F)) (#1=#:G285 NIL) (|bb1| (F))
          (|nn| (|Integer|)) (|np2| (|Integer|)) (|nn2| (|Integer|))
          (|g2| #2=(|Integer|)) (#3=#:G296 NIL) (|f2| NIL) (#4=#:G297 NIL)
          (|pow2| NIL) (|np1| (|Integer|)) (|nn1| (|Integer|)) (|g1| #2#)
          (|l2| #5=(|List| F)) (#6=#:G294 NIL) (|f1| NIL) (#7=#:G295 NIL)
          (|pow1| NIL) (|rop| (|BasicOperator|)) (|l1| #5#) (|b2| (F))
          (|n2| #8=(|Integer|)) (|b1| (F)) (|n1| #8#) (|a2| #9=(|List| F))
          (|a1| #9#))
         (SEQ
          (LETT |a1| (SPADCALL |r1| (QREFELT $ 18))
                . #10=(|INTEF;alg_split_roots|))
          (LETT |a2| (SPADCALL |r2| (QREFELT $ 18)) . #10#)
          (LETT |n1|
                (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 99)) (QREFELT $ 142))
                . #10#)
          (LETT |b1| (SPADCALL |a1| 1 (QREFELT $ 99)) . #10#)
          (LETT |n2|
                (SPADCALL (SPADCALL |a2| 2 (QREFELT $ 99)) (QREFELT $ 142))
                . #10#)
          (LETT |b2| (SPADCALL |a2| 1 (QREFELT $ 99)) . #10#)
          (LETT |l1| (|INTEF;alg_split_root0| |f| |r1| |n1| $) . #10#)
          (LETT |res| NIL . #10#)
          (LETT |rop| (SPADCALL |r1| (QREFELT $ 15)) . #10#)
          (SEQ (LETT |pow1| 0 . #10#) (LETT #7# (- |n1| 1) . #10#)
               (LETT |f1| NIL . #10#) (LETT #6# |l1| . #10#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |f1| (CAR #6#) . #10#) NIL)
                     (|greater_SI| |pow1| #7#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |f1| (|spadConstant| $ 31) (QREFELT $ 107))
                   "iterate")
                  ('T
                   (SEQ
                    (LETT |l2| (|INTEF;alg_split_root0| |f1| |r2| |n2| $)
                          . #10#)
                    (LETT |g1| (GCD |n1| |pow1|) . #10#)
                    (LETT |nn1|
                          (PROG2
                              (LETT #1# (SPADCALL |n1| |g1| (QREFELT $ 144))
                                    . #10#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
                          . #10#)
                    (LETT |np1|
                          (PROG2
                              (LETT #1# (SPADCALL |pow1| |g1| (QREFELT $ 144))
                                    . #10#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
                          . #10#)
                    (EXIT
                     (SEQ (LETT |pow2| 0 . #10#) (LETT #4# (- |n2| 1) . #10#)
                          (LETT |f2| NIL . #10#) (LETT #3# |l2| . #10#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |f2| (CAR #3#) . #10#) NIL)
                                (|greater_SI| |pow2| #4#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |f2| (|spadConstant| $ 31)
                                        (QREFELT $ 107))
                              "iterate")
                             ('T
                              (SEQ (LETT |g2| (GCD |n2| |pow2|) . #10#)
                                   (LETT |nn2|
                                         (PROG2
                                             (LETT #1#
                                                   (SPADCALL |n2| |g2|
                                                             (QREFELT $ 144))
                                                   . #10#)
                                             (QCDR #1#)
                                           (|check_union| (QEQCAR #1# 0)
                                                          (|Integer|) #1#))
                                         . #10#)
                                   (LETT |np2|
                                         (PROG2
                                             (LETT #1#
                                                   (SPADCALL |pow2| |g2|
                                                             (QREFELT $ 144))
                                                   . #10#)
                                             (QCDR #1#)
                                           (|check_union| (QEQCAR #1# 0)
                                                          (|Integer|) #1#))
                                         . #10#)
                                   (LETT |nn|
                                         (SPADCALL |nn1| |nn2| (QREFELT $ 145))
                                         . #10#)
                                   (LETT |bb1|
                                         (SPADCALL |b1|
                                                   (* |np1|
                                                      (PROG2
                                                          (LETT #1#
                                                                (SPADCALL |nn|
                                                                          |nn1|
                                                                          (QREFELT
                                                                           $
                                                                           144))
                                                                . #10#)
                                                          (QCDR #1#)
                                                        (|check_union|
                                                         (QEQCAR #1# 0)
                                                         (|Integer|) #1#)))
                                                   (QREFELT $ 146))
                                         . #10#)
                                   (LETT |bb2|
                                         (SPADCALL |b2|
                                                   (* |np2|
                                                      (PROG2
                                                          (LETT #1#
                                                                (SPADCALL |nn|
                                                                          |nn2|
                                                                          (QREFELT
                                                                           $
                                                                           144))
                                                                . #10#)
                                                          (QCDR #1#)
                                                        (|check_union|
                                                         (QEQCAR #1# 0)
                                                         (|Integer|) #1#)))
                                                   (QREFELT $ 146))
                                         . #10#)
                                   (LETT |nr|
                                         (SPADCALL |rop|
                                                   (LIST
                                                    (SPADCALL |bb1| |bb2|
                                                              (QREFELT $ 80))
                                                    (SPADCALL |nn|
                                                              (QREFELT $ 135)))
                                                   (QREFELT $ 148))
                                         . #10#)
                                   (LETT |nrr|
                                         (COND
                                          ((SPADCALL (+ |pow1| |pow2|) 0
                                                     (QREFELT $ 149))
                                           |nr|)
                                          ('T (|spadConstant| $ 21)))
                                         . #10#)
                                   (EXIT
                                    (LETT |res|
                                          (CONS
                                           (VECTOR
                                            (SPADCALL |f2| |nrr|
                                                      (QREFELT $ 80))
                                            |nrr| |pow1| |pow2|)
                                           |res|)
                                          . #10#)))))))
                          (LETT #3#
                                (PROG1 (CDR #3#)
                                  (LETT |pow2| (|inc_SI| |pow2|) . #10#))
                                . #10#)
                          (GO G190) G191 (EXIT NIL))))))))
               (LETT #6#
                     (PROG1 (CDR #6#) (LETT |pow1| (|inc_SI| |pow1|) . #10#))
                     . #10#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

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
          (|oroot| (F)) (#1=#:G318 NIL)
          (|al|
           (|List|
            (|Record| (|:| |fun| F) (|:| |nroot| F) (|:| |npow1| (|Integer|))
                      (|:| |npow2| (|Integer|)))))
          (|kx| (|Kernel| F)) (|xf| (F)))
         (SEQ (LETT |xf| (SPADCALL |x| (QREFELT $ 83)) . #2=(|INTEF;alglfint|))
              (EXIT
               (COND
                ((QEQCAR
                  (SPADCALL
                   (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 151)) . #2#)
                   (QREFELT $ 133))
                  0)
                 (|INTEF;addx| (SPADCALL |f| |kx| |k| (QREFELT $ 153)) |xf| $))
                ((SPADCALL |kx| '|exp| (QREFELT $ 13))
                 (|INTEF;addx| (|INTEF;algexpint| |f| |kx| |k| |x| $) |xf| $))
                ((|INTEF;prim?| |kx| |x| $)
                 (|INTEF;addx| (|INTEF;algprimint| |f| |kx| |k| |x| $) |xf| $))
                ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9)
                           (QREFELT $ 16))
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) '|nthRoot|
                              (QREFELT $ 154))
                    (COND
                     ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) '|nthRoot|
                                (QREFELT $ 154))
                      (COND
                       ((NULL
                         (SPADCALL |kx|
                                   (SPADCALL (SPADCALL |k| (QREFELT $ 134))
                                             (QREFELT $ 155))
                                   (QREFELT $ 129)))
                        (EXIT
                         (SEQ
                          (LETT |al| (|INTEF;alg_split_roots| |f| |k| |kx| $)
                                . #2#)
                          (LETT |res| (|spadConstant| $ 156) . #2#)
                          (SEQ (LETT |rec| NIL . #2#) (LETT #1# |al| . #2#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |ir1|
                                      (SPADCALL (QVELT |rec| 0) |x|
                                                (QREFELT $ 43))
                                      . #2#)
                                (COND
                                 ((SPADCALL (+ (QVELT |rec| 2) (QVELT |rec| 3))
                                            0 (QREFELT $ 149))
                                  (SEQ
                                   (LETT |oroot|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |k| (QREFELT $ 134))
                                           (QVELT |rec| 2) (QREFELT $ 146))
                                          (SPADCALL
                                           (SPADCALL |kx| (QREFELT $ 134))
                                           (QVELT |rec| 3) (QREFELT $ 146))
                                          (QREFELT $ 80))
                                         . #2#)
                                   (EXIT
                                    (LETT |ir1|
                                          (SPADCALL
                                           (CONS #'|INTEF;alglfint!0|
                                                 (VECTOR |oroot| $ |rec|))
                                           |ir1| (QREFELT $ 123))
                                          . #2#)))))
                                (EXIT
                                 (LETT |res|
                                       (SPADCALL |res| |ir1| (QREFELT $ 56))
                                       . #2#)))
                               (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT |res|)))))))))
                  (LETT |rec|
                        (SPADCALL (SPADCALL |kx| (QREFELT $ 134))
                                  (SPADCALL |k| (QREFELT $ 134))
                                  (QREFELT $ 159))
                        . #2#)
                  (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 160)) . #2#)
                  (EXIT
                   (SPADCALL (CONS #'|INTEF;alglfint!1| (VECTOR |rec| $ |y|))
                             (SPADCALL
                              (SPADCALL |f| (LIST |kx| |k|)
                                        (LIST
                                         (SPADCALL (QVELT |rec| 1) |y|
                                                   (QREFELT $ 161))
                                         (SPADCALL (QVELT |rec| 2) |y|
                                                   (QREFELT $ 161)))
                                        (QREFELT $ 162))
                              |x| (QREFELT $ 43))
                             (QREFELT $ 123)))))
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

(SDEFUN |INTEF;alglfextint|
        ((|f| F) (|k| |Kernel| F) (|l| |List| (|Kernel| F)) (|x| |Symbol|)
         (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) #1="failed"))
        (SPROG
         ((|u2|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "reject"
                    "failed"))
          (|r| (|Record| (|:| |ratpart| F) (|:| |coeff| F)))
          (|ky| (|Kernel| F))
          (|u| (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) #1#))
          (|lrhs| (|List| F)) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (|kx| (|Kernel| F)))
         (SEQ
          (COND
           ((QEQCAR
             (SPADCALL
              (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 151))
                    . #2=(|INTEF;alglfextint|))
              (QREFELT $ 133))
             0)
            (SPADCALL |f| |kx| |k| |g| (QREFELT $ 163)))
           ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9)
                      (QREFELT $ 16))
            (SEQ
             (LETT |rec|
                   (SPADCALL (SPADCALL |kx| (QREFELT $ 134))
                             (SPADCALL |k| (QREFELT $ 134)) (QREFELT $ 159))
                   . #2#)
             (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 160)) . #2#)
             (LETT |lrhs|
                   (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 161))
                         (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 161)))
                   . #2#)
             (LETT |u|
                   (SPADCALL
                    (SPADCALL |f| (LIST |kx| |k|) |lrhs| (QREFELT $ 162)) |x|
                    (SPADCALL |g| (LIST |kx| |k|) |lrhs| (QREFELT $ 162))
                    (QREFELT $ 36))
                   . #2#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#3='T
                     (SEQ (LETT |ky| (SPADCALL |y| (QREFELT $ 100)) . #2#)
                          (LETT |r| (QCDR |u|) . #2#)
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL (QCAR |r|) |ky| (QVELT |rec| 0)
                                            (QREFELT $ 101))
                                  (SPADCALL (QCDR |r|) |ky| (QVELT |rec| 0)
                                            (QREFELT $ 101)))))))))))
           ((OR (SPADCALL |kx| '|exp| (QREFELT $ 13))
                (SPADCALL |kx| '|log| (QREFELT $ 13)))
            (SEQ (LETT |u2| (|INTEF;try_change_var2| |f| |kx| |x| |g| $) . #2#)
                 (EXIT
                  (COND ((QEQCAR |u2| 2) (CONS 1 "failed"))
                        ((QEQCAR |u2| 0) (CONS 0 (QCDR |u2|)))
                        (#3#
                         (|error| "failed - cannot handle that integrand"))))))
           ('T (|INTEF;unkextint| |f| |x| |g| $)))))) 

(SDEFUN |INTEF;alglflogint|
        ((|f| F) (|k| |Kernel| F) (|l| |List| (|Kernel| F)) (|x| |Symbol|)
         (|lu| |List| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          #1="failed"))
        (SPROG
         ((#2=#:G361 NIL) (|rc| NIL) (#3=#:G360 NIL)
          (|r|
           (|Record| (|:| |mainpart| F)
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| F) (|:| |logand| F))))))
          (|ky| (|Kernel| F))
          (|u|
           (|Union|
            (|Record| (|:| |mainpart| F)
                      (|:| |limitedlogs|
                           (|List|
                            (|Record| (|:| |coeff| F) (|:| |logand| F)))))
            #1#))
          (|lrhs| (|List| F)) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (|kx| (|Kernel| F)))
         (SEQ
          (COND
           ((QEQCAR
             (SPADCALL
              (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 151))
                    . #4=(|INTEF;alglflogint|))
              (QREFELT $ 133))
             0)
            (SPADCALL |f| |kx| |k| |lu| (QREFELT $ 164)))
           ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9)
                      (QREFELT $ 16))
            (SEQ
             (LETT |rec|
                   (SPADCALL (SPADCALL |kx| (QREFELT $ 134))
                             (SPADCALL |k| (QREFELT $ 134)) (QREFELT $ 159))
                   . #4#)
             (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 160)) . #4#)
             (LETT |lrhs|
                   (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 161))
                         (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 161)))
                   . #4#)
             (LETT |u|
                   (SPADCALL
                    (SPADCALL |f| (LIST |kx| |k|) |lrhs| (QREFELT $ 162)) |x|
                    (SPADCALL
                     (CONS #'|INTEF;alglflogint!0| (VECTOR $ |lrhs| |k| |kx|))
                     |lu| (QREFELT $ 165))
                    (QREFELT $ 63))
                   . #4#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    ('T
                     (SEQ (LETT |ky| (SPADCALL |y| (QREFELT $ 100)) . #4#)
                          (LETT |r| (QCDR |u|) . #4#)
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL (QCAR |r|) |ky| (QVELT |rec| 0)
                                            (QREFELT $ 101))
                                  (PROGN
                                   (LETT #3# NIL . #4#)
                                   (SEQ (LETT |rc| NIL . #4#)
                                        (LETT #2# (QCDR |r|) . #4#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |rc| (CAR #2#) . #4#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (CONS
                                                  (SPADCALL (QCAR |rc|) |ky|
                                                            (QVELT |rec| 0)
                                                            (QREFELT $ 101))
                                                  (SPADCALL (QCDR |rc|) |ky|
                                                            (QVELT |rec| 0)
                                                            (QREFELT $ 101)))
                                                 #3#)
                                                . #4#)))
                                        (LETT #2# (CDR #2#) . #4#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#)))))))))))))
           ((OR (SPADCALL |kx| '|exp| (QREFELT $ 13))
                (SPADCALL |kx| '|log| (QREFELT $ 13)))
            (|error| "failed - cannot handle that integrand"))
           ('T (|INTEF;unklimint| |f| |x| |lu| $)))))) 

(SDEFUN |INTEF;alglflogint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|kx| |k| |lrhs| $)
          (LETT |kx| (QREFELT $$ 3) . #1=(|INTEF;alglflogint|))
          (LETT |k| (QREFELT $$ 2) . #1#)
          (LETT |lrhs| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (SPADCALL |x1| (LIST |kx| |k|) |lrhs| (QREFELT $ 162)))))) 

(SDEFUN |INTEF;lfintegrate;FSIr;15|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPADCALL |f| |x| (CONS (|function| |INTEF;lfintegrate0|) $)
                  (ELT $ 170) (QREFELT $ 173))) 

(SDEFUN |INTEF;lfintegrate;FSIr;16|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (|INTEF;lfintegrate0| |f| |x| $)) 

(SDEFUN |INTEF;lfintegrate;FSIr;17|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (|INTEF;lfintegrate0| |f| |x| $)) 

(SDEFUN |INTEF;lfintegrate;FSIr;18|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (|INTEF;lfintegrate0| |f| |x| $)) 

(SDEFUN |INTEF;lfintegrate0| ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPROG ((|k| (|Kernel| F)) (|l| (|List| (|Kernel| F))) (|xf| (F)))
               (SEQ
                (COND ((SPADCALL |f| (QREFELT $ 78)) (|spadConstant| $ 156))
                      (#1='T
                       (SEQ
                        (LETT |xf| (SPADCALL |x| (QREFELT $ 83))
                              . #2=(|INTEF;lfintegrate0|))
                        (EXIT
                         (COND
                          ((NULL
                            (LETT |l|
                                  (SPADCALL (SPADCALL |f| (QREFELT $ 127)) |x|
                                            (QREFELT $ 174))
                                  . #2#))
                           (SPADCALL (SPADCALL |xf| |f| (QREFELT $ 80))
                                     (QREFELT $ 81)))
                          ((QEQCAR
                            (SPADCALL
                             (LETT |k| (SPADCALL |l| (QREFELT $ 175)) . #2#)
                             (QREFELT $ 133))
                            0)
                           (SPADCALL
                            (CONS #'|INTEF;lfintegrate0!0| (VECTOR $ |k|))
                            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                                      (QREFELT $ 177))
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
        (SPROG ((#1=#:G397 NIL) (|ne| NIL) (#2=#:G396 NIL))
               (SEQ
                (COND ((SPADCALL |i| (QREFELT $ 178)) |i|)
                      ('T
                       (SPADCALL (SPADCALL |i| (QREFELT $ 120))
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
                                 (SPADCALL (SPADCALL |t| (QREFELT $ 134)) |x|
                                           (QREFELT $ 19))
                                 (QREFELT $ 32))
                       (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 83)))
                       (QREFELT $ 179))
                      . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |g| |x| (QREFELT $ 180))
                   (CONS 0
                         (SPADCALL
                          (CONS #'|INTEF;tryChangeVar!0| (VECTOR |t| $ |z|))
                          (SPADCALL |g| |z| (QREFELT $ 43)) (QREFELT $ 123))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |INTEF;tryChangeVar!0| ((|x1| NIL) ($$ NIL))
        (PROG (|z| $ |t|)
          (LETT |z| (QREFELT $$ 2) . #1=(|INTEF;tryChangeVar|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |t| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |z| (QREFELT $ 121))
                      (SPADCALL |t| (QREFELT $ 134)) (QREFELT $ 101)))))) 

(SDEFUN |INTEF;try_change_var2|
        ((|f| F) (|t| |Kernel| F) (|x| |Symbol|) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "reject"
          "failed"))
        (SPROG
         ((|res2|
           (|Union|
            (|Record| (|:| |mainpart| F)
                      (|:| |limitedlogs|
                           (|List|
                            (|Record| (|:| |coeff| F) (|:| |logand| F)))))
            "failed"))
          (|res1|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
          (|g1| (F)) (|f1| (F)) (|z| (|Symbol|)))
         (SEQ
          (LETT |z| (SPADCALL (QREFELT $ 102)) . #1=(|INTEF;try_change_var2|))
          (LETT |f1|
                (SPADCALL
                 (SPADCALL |f|
                           (SPADCALL (SPADCALL |t| (QREFELT $ 134)) |x|
                                     (QREFELT $ 19))
                           (QREFELT $ 32))
                 (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 83)))
                 (QREFELT $ 179))
                . #1#)
          (COND
           ((NULL (SPADCALL |f1| |x| (QREFELT $ 180)))
            (EXIT (CONS 1 "reject"))))
          (LETT |g1|
                (SPADCALL
                 (SPADCALL |g|
                           (SPADCALL (SPADCALL |t| (QREFELT $ 134)) |x|
                                     (QREFELT $ 19))
                           (QREFELT $ 32))
                 (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 83)))
                 (QREFELT $ 179))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |g1| |x| (QREFELT $ 180))
             (SEQ (LETT |res1| (SPADCALL |f1| |z| |g1| (QREFELT $ 36)) . #1#)
                  (EXIT
                   (COND ((QEQCAR |res1| 1) (CONS 2 "failed"))
                         (#2='T
                          (CONS 0
                                (CONS
                                 (SPADCALL (QCAR (QCDR |res1|))
                                           (SPADCALL |z| (QREFELT $ 121))
                                           (SPADCALL |t| (QREFELT $ 134))
                                           (QREFELT $ 101))
                                 (QCDR (QCDR |res1|)))))))))
            (#2#
             (SEQ (LETT |res2| (SPADCALL |f1| |z| NIL (QREFELT $ 63)) . #1#)
                  (EXIT
                   (COND ((QEQCAR |res2| 1) (CONS 1 "reject"))
                         (#2#
                          (CONS 0
                                (CONS
                                 (SPADCALL (QCAR (QCDR |res2|))
                                           (SPADCALL |z| (QREFELT $ 121))
                                           (SPADCALL |t| (QREFELT $ 134))
                                           (QREFELT $ 101))
                                 (|spadConstant| $ 31))))))))))))) 

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
                                  (QREFELT $ 183)))))))) 

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
                                         (QREFELT $ 181))
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
                                  (QREFELT $ 183)))))))) 

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
                              (SPADCALL (SPADCALL |t| (QREFELT $ 134)) |x|
                                        (QREFELT $ 19))
                              (QREFELT $ 57))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;algprimint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;lfextendedint;FSFU;25|
        ((|f| F) (|x| |Symbol|) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
        (SPROG
         ((|g1| (F)) (|l1| #1=(|List| (|Kernel| F))) (|k| (|Kernel| F))
          (|l| #1#))
         (SEQ
          (COND
           ((NULL
             (LETT |l|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 127)) |x|
                             (QREFELT $ 174))
                   . #2=(|INTEF;lfextendedint;FSFU;25|)))
            (CONS 0
                  (CONS
                   (SPADCALL (SPADCALL |x| (QREFELT $ 83)) |f| (QREFELT $ 80))
                   (|spadConstant| $ 31))))
           ((QEQCAR
             (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 175)) . #2#)
                       (QREFELT $ 133))
             0)
            (SEQ
             (LETT |g1|
                   (COND
                    ((OR
                      (NULL
                       (LETT |l1|
                             (SPADCALL (SPADCALL |g| (QREFELT $ 127)) |x|
                                       (QREFELT $ 174))
                             . #2#))
                      (NULL
                       (SPADCALL (SPADCALL |l1| (QREFELT $ 175)) |k|
                                 (QREFELT $ 184))))
                     (|spadConstant| $ 31))
                    ('T |g|))
                   . #2#)
             (EXIT
              (SPADCALL (CONS #'|INTEF;lfextendedint;FSFU;25!0| (VECTOR $ |k|))
                        (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                                  (SPADCALL |g1| |k| (QREFELT $ 39))
                                  (QREFELT $ 187))
                        (QREFELT $ 188)))))
           ((SPADCALL |k| '|exp| (QREFELT $ 13))
            (|INTEF;expextint| |f| |x| |k| |g| $))
           ((|INTEF;prim?| |k| |x| $) (|INTEF;primextint| |f| |x| |k| |g| $))
           ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9)
                      (QREFELT $ 16))
            (|INTEF;alglfextint| |f| |k| |l| |x| |g| $))
           ('T (|INTEF;unkextint| |f| |x| |g| $)))))) 

(SDEFUN |INTEF;lfextendedint;FSFU;25!0| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lfextendedint;FSFU;25|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;lflogint;FSLU;26|
        ((|f| F) (|x| |Symbol|) (|lu| |List| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
        (SPROG
         ((#1=#:G474 NIL) (|u| NIL) (#2=#:G473 NIL) (|k| (|Kernel| F))
          (|l| (|List| (|Kernel| F))))
         (SEQ
          (COND
           ((NULL
             (LETT |l|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 127)) |x|
                             (QREFELT $ 174))
                   . #3=(|INTEF;lflogint;FSLU;26|)))
            (CONS 0
                  (CONS
                   (SPADCALL (SPADCALL |x| (QREFELT $ 83)) |f| (QREFELT $ 80))
                   NIL)))
           ((QEQCAR
             (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 175)) . #3#)
                       (QREFELT $ 133))
             0)
            (SPADCALL (CONS #'|INTEF;lflogint;FSLU;26!0| (VECTOR $ |k|))
                      (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                                (PROGN
                                 (LETT #2# NIL . #3#)
                                 (SEQ (LETT |u| NIL . #3#)
                                      (LETT #1# |lu| . #3#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |u| (CAR #1#) . #3#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |u| |k|
                                                         (QREFELT $ 39))
                                               #2#)
                                              . #3#)))
                                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                (QREFELT $ 193))
                      (QREFELT $ 194)))
           ((SPADCALL |k| '|exp| (QREFELT $ 13))
            (|INTEF;explflogint| |f| |x| |k| |lu| $))
           ((|INTEF;prim?| |k| |x| $)
            (|INTEF;primlflogint| |f| |x| |k| |lu| $))
           ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9)
                      (QREFELT $ 16))
            (|INTEF;alglflogint| |f| |k| |l| |x| |lu| $))
           ('T (|INTEF;unklimint| |f| |x| |lu| $)))))) 

(SDEFUN |INTEF;lflogint;FSLU;26!0| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lflogint;FSLU;26|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;lfinfieldint;FSU;27|
        ((|f| F) (|x| |Symbol|) ($ |Union| F "failed"))
        (SPROG
         ((|u|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed")))
         (SEQ
          (LETT |u| (SPADCALL |f| |x| (|spadConstant| $ 31) (QREFELT $ 36))
                |INTEF;lfinfieldint;FSU;27|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCAR (QCDR |u|))))))))) 

(SDEFUN |INTEF;primextint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) #1="failed"))
        (SPROG
         ((|u2| (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) #1#))
          (|u1|
           (|Union|
            (|Record|
             (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |a0| F))
            (|Record|
             (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coeff| (|Fraction| (|SparseUnivariatePolynomial| F))))
            "failed"))
          (|lk| (|List| (|Kernel| F))) (#2=#:G506 NIL) (|a| NIL)
          (#3=#:G505 NIL))
         (SEQ
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|INTEF;primextint|))
                  (SEQ (LETT |a| NIL . #4#)
                       (LETT #2# (SPADCALL |f| (QREFELT $ 155)) . #4#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND
                            ((SPADCALL |k| |a| (QREFELT $ 197))
                             (SPADCALL |a| '|log| (QREFELT $ 13)))
                            (#5='T 'NIL))
                           (LETT #3# (CONS |a| #3#) . #4#)))))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 |x| (QREFELT $ 174))
                . #4#)
          (LETT |u1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;primextint!1| (VECTOR |k| |x| $))
                          (CONS #'|INTEF;primextint!2| (VECTOR $ |lk| |k| |x|))
                          (SPADCALL |g| |k| (QREFELT $ 39)) (QREFELT $ 201))
                . #4#)
          (EXIT
           (COND ((QEQCAR |u1| 2) (CONS 1 "failed"))
                 ((QEQCAR |u1| 1)
                  (CONS 0
                        (CONS (SPADCALL (QCAR (QCDR |u1|)) |k| (QREFELT $ 51))
                              (SPADCALL (QCDR (QCDR |u1|)) |k|
                                        (QREFELT $ 51)))))
                 (#5#
                  (SEQ
                   (LETT |u2|
                         (SPADCALL (QCDR (QCDR |u1|)) |x| |g| (QREFELT $ 36))
                         . #4#)
                   (EXIT
                    (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                          (#5#
                           (CONS 0
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL (QCAR (QCDR |u1|)) |k|
                                             (QREFELT $ 51))
                                   (QCAR (QCDR |u2|)) (QREFELT $ 119))
                                  (QCDR (QCDR |u2|)))))))))))))) 

(SDEFUN |INTEF;primextint!2| ((|x3| NIL) ($$ NIL))
        (PROG (|x| |k| |lk| $)
          (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primextint|))
          (LETT |k| (QREFELT $$ 2) . #1#)
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 198)))))) 

(SDEFUN |INTEF;primextint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |k|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;primextint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;primextint!0| (VECTOR $ |x|))
                             (SPADCALL
                              (SPADCALL (SPADCALL |k| (QREFELT $ 134)) |x|
                                        (QREFELT $ 19))
                              (QREFELT $ 57))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;primextint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;expextint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) #1="failed"))
        (SPROG
         ((|u2| (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) #1#))
          (|u1|
           (|Union|
            (|Record|
             (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |a0| F))
            (|Record|
             (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coeff| (|Fraction| (|SparseUnivariatePolynomial| F))))
            "failed")))
         (SEQ
          (LETT |u1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;expextint!1| (VECTOR |k| |x| $))
                          (CONS #'|INTEF;expextint!4| (VECTOR |x| $ |k|))
                          (SPADCALL |g| |k| (QREFELT $ 39)) (QREFELT $ 206))
                . #2=(|INTEF;expextint|))
          (EXIT
           (COND ((QEQCAR |u1| 2) (CONS 1 "failed"))
                 ((QEQCAR |u1| 1)
                  (CONS 0
                        (CONS (SPADCALL (QCAR (QCDR |u1|)) |k| (QREFELT $ 51))
                              (SPADCALL (QCDR (QCDR |u1|)) |k|
                                        (QREFELT $ 51)))))
                 (#3='T
                  (SEQ
                   (LETT |u2|
                         (SPADCALL (QCDR (QCDR |u1|)) |x| |g| (QREFELT $ 36))
                         . #2#)
                   (EXIT
                    (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                          (#3#
                           (CONS 0
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL (QCAR (QCDR |u1|)) |k|
                                             (QREFELT $ 51))
                                   (QCAR (QCDR |u2|)) (QREFELT $ 119))
                                  (QCDR (QCDR |u2|)))))))))))))) 

(SDEFUN |INTEF;expextint!4| ((|x3| NIL) (|x4| NIL) ($$ NIL))
        (PROG (|k| $ |x|)
          (LETT |k| (QREFELT $$ 2) . #1=(|INTEF;expextint|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x3|
                             (SPADCALL (SPADCALL |k| (QREFELT $ 18))
                                       (QREFELT $ 181))
                             |x4| |x|
                             (CONS #'|INTEF;expextint!2| (VECTOR $ |x|))
                             (CONS #'|INTEF;expextint!3| (VECTOR $ |x|))
                             (QREFELT $ 204))))))) 

(SDEFUN |INTEF;expextint!3| ((|x7| NIL) (|x8| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x7| |x| |x8| (QREFELT $ 36)))))) 

(SDEFUN |INTEF;expextint!2| ((|x5| NIL) (|x6| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x5| |x| |x6| (QREFELT $ 63)))))) 

(SDEFUN |INTEF;expextint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |k|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;expextint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;expextint!0| (VECTOR $ |x|))
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 18))
                                         (QREFELT $ 181))
                               |x| (QREFELT $ 19))
                              (|spadConstant| $ 33) (QREFELT $ 24))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;expextint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;denint_dummy|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Record|
          (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |ir|
               (|IntegrationResult|
                (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (VECTOR (|spadConstant| $ 207) |f| (|spadConstant| $ 208))) 

(SDEFUN |INTEF;primint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|r1|
           (|Record|
            (|:| |answer|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |a0| F)))
          (|denint|
           (|Mapping|
            (|Record|
             (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |ir|
                  (|IntegrationResult|
                   (|Fraction| (|SparseUnivariatePolynomial| F)))))
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|lk| (|List| (|Kernel| F))) (#1=#:G582 NIL) (|a| NIL)
          (#2=#:G581 NIL))
         (SEQ
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|INTEF;primint|))
                  (SEQ (LETT |a| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 155)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND
                            ((SPADCALL |k| |a| (QREFELT $ 197))
                             (SPADCALL |a| '|log| (QREFELT $ 13)))
                            (#4='T 'NIL))
                           (LETT #2# (CONS |a| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| (QREFELT $ 174))
                . #3#)
          (LETT |denint|
                (COND
                 ((SPADCALL |k| '|log| (QREFELT $ 13))
                  (CONS #'|INTEF;primint!0| (VECTOR (QREFELT $ 214) |x| |k|)))
                 (#4# (CONS (|function| |INTEF;denint_dummy|) $)))
                . #3#)
          (LETT |r1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;primint!2| (VECTOR |k| |x| $))
                          |denint|
                          (CONS #'|INTEF;primint!3| (VECTOR $ |lk| |k| |x|))
                          (QREFELT $ 219))
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

(SDEFUN |INTEF;primint!3| ((|x3| NIL) ($$ NIL))
        (PROG (|x| |k| |lk| $)
          (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primint|))
          (LETT |k| (QREFELT $$ 2) . #1#)
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 198)))))) 

(SDEFUN |INTEF;primint!2| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |k|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;primint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;primint!1| (VECTOR $ |x|))
                             (SPADCALL
                              (SPADCALL (SPADCALL |k| (QREFELT $ 134)) |x|
                                        (QREFELT $ 19))
                              (QREFELT $ 57))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;primint!1| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;primint!0| ((|rf| NIL) ($$ NIL))
        (PROG (|k| |x| |denint_li|)
          (LETT |k| (QREFELT $$ 2) . #1=(|INTEF;primint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |denint_li| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |rf| |k| |x| |denint_li|))))) 

(SDEFUN |INTEF;lfextlimint;FSKLU;32|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) #1="failed"))
        (SPROG
         ((#2=#:G601 NIL) (#3=#:G600 (F)) (#4=#:G602 (F)) (#5=#:G613 NIL)
          (|c| NIL) (|cf| (F))
          (|u2|
           (|Union|
            (|Record| (|:| |mainpart| F)
                      (|:| |limitedlogs|
                           (|List|
                            (|Record| (|:| |coeff| F) (|:| |logand| F)))))
            "failed"))
          (#6=#:G612 NIL) (|u| NIL) (#7=#:G611 NIL)
          (|lg| (|List| (|Kernel| F))) (#8=#:G610 NIL) (|kk| NIL)
          (#9=#:G609 NIL) (|twr| (|List| (|Kernel| F))) (#10=#:G608 NIL)
          (|u1| (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) #1#)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u1|
                   (SPADCALL |f| |x|
                             (SPADCALL (SPADCALL |k| (QREFELT $ 134)) |x|
                                       (QREFELT $ 19))
                             (QREFELT $ 36))
                   . #11=(|INTEF;lfextlimint;FSKLU;32|))
             (EXIT
              (COND
               ((NULL (QEQCAR |u1| 1))
                (PROGN (LETT #10# |u1| . #11#) (GO #12=#:G606))))))
            (LETT |twr| (SPADCALL |f| (QREFELT $ 155)) . #11#)
            (EXIT
             (COND
              ((OR
                (NULL
                 (LETT |lg|
                       (PROGN
                        (LETT #9# NIL . #11#)
                        (SEQ (LETT |kk| NIL . #11#) (LETT #8# |lk| . #11#) G190
                             (COND
                              ((OR (ATOM #8#)
                                   (PROGN (LETT |kk| (CAR #8#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((COND
                                  ((SPADCALL |kk| |twr| (QREFELT $ 129)) 'NIL)
                                  (#13='T 'T))
                                 (LETT #9# (CONS |kk| #9#) . #11#)))))
                             (LETT #8# (CDR #8#) . #11#) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
                       . #11#))
                (NULL (SPADCALL |k| '|log| (QREFELT $ 13))))
               (CONS 1 "failed"))
              ('T
               (SEQ
                (LETT |u2|
                      (SPADCALL |f| |x|
                                (PROGN
                                 (LETT #7# NIL . #11#)
                                 (SEQ (LETT |u| NIL . #11#)
                                      (LETT #6#
                                            (SPADCALL |lg| (LIST |k|)
                                                      (QREFELT $ 220))
                                            . #11#)
                                      G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN
                                             (LETT |u| (CAR #6#) . #11#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #7#
                                              (CONS
                                               (|SPADfirst|
                                                (SPADCALL |u| (QREFELT $ 18)))
                                               #7#)
                                              . #11#)))
                                      (LETT #6# (CDR #6#) . #11#) (GO G190)
                                      G191 (EXIT (NREVERSE #7#))))
                                (QREFELT $ 63))
                      . #11#)
                (EXIT
                 (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                       (#13#
                        (SEQ
                         (LETT |cf|
                               (|INTEF;cfind|
                                (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                                (QCDR (QCDR |u2|)) $)
                               . #11#)
                         (EXIT
                          (CONS 0
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QCAR (QCDR |u2|))
                                            (SPADCALL |cf|
                                                      (SPADCALL |k|
                                                                (QREFELT $
                                                                         134))
                                                      (QREFELT $ 80))
                                            (QREFELT $ 125))
                                  (PROGN
                                   (LETT #2# NIL . #11#)
                                   (SEQ (LETT |c| NIL . #11#)
                                        (LETT #5# (QCDR (QCDR |u2|)) . #11#)
                                        G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN
                                               (LETT |c| (CAR #5#) . #11#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #4#
                                                 (SPADCALL (QCAR |c|)
                                                           (SPADCALL (QCDR |c|)
                                                                     (QREFELT $
                                                                              79))
                                                           (QREFELT $ 80))
                                                 . #11#)
                                           (COND
                                            (#2#
                                             (LETT #3#
                                                   (SPADCALL #3# #4#
                                                             (QREFELT $ 119))
                                                   . #11#))
                                            ('T
                                             (PROGN
                                              (LETT #3# #4# . #11#)
                                              (LETT #2# 'T . #11#)))))))
                                        (LETT #5# (CDR #5#) . #11#) (GO G190)
                                        G191 (EXIT NIL))
                                   (COND (#2# #3#)
                                         (#13# (|spadConstant| $ 31))))
                                  (QREFELT $ 119))
                                 |cf|)))))))))))))
          #12# (EXIT #10#)))) 

(SDEFUN |INTEF;cfind|
        ((|f| F) (|l| |List| (|Record| (|:| |coeff| F) (|:| |logand| F)))
         ($ F))
        (SPROG ((#1=#:G619 NIL) (#2=#:G620 NIL) (#3=#:G621 NIL) (|u| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |u| NIL . #4=(|INTEF;cfind|))
                         (LETT #3# |l| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |u| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |f| (QCDR |u|) (QREFELT $ 107))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (QCAR |u|) . #4#)
                                     (GO #5=#:G618))
                                    . #4#)
                              (GO #6=#:G616))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (|spadConstant| $ 31))))
                #5# (EXIT #2#)))) 

(SDEFUN |INTEF;risch_de_solver|
        ((|x3| |Integer|) (|x4| F) (|eta| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG NIL
               (SPADCALL |x3| |eta| |x4| |x|
                         (CONS #'|INTEF;risch_de_solver!0| (VECTOR $ |x|))
                         (CONS #'|INTEF;risch_de_solver!1| (VECTOR $ |x|))
                         (QREFELT $ 223)))) 

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
                                (VECTOR (QREFELT $ 216) |x| |k|))
                          (CONS #'|INTEF;expint!3| (VECTOR $ |x| |eta|))
                          (QREFELT $ 225))
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

(SDEFUN |INTEF;primlflogint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) (|lu| |List| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          #1="failed"))
        (SPROG
         ((|u2|
           (|Union|
            (|Record| (|:| |mainpart| F)
                      (|:| |limitedlogs|
                           (|List|
                            (|Record| (|:| |coeff| F) (|:| |logand| F)))))
            #1#))
          (|l| (|List| (|Record| (|:| |coeff| F) (|:| |logand| F))))
          (#2=#:G676 NIL) (|lg| NIL) (#3=#:G675 NIL)
          (|u1|
           (|Union|
            (|Record|
             (|:| |answer|
                  (|Record|
                   (|:| |mainpart|
                        (|Fraction| (|SparseUnivariatePolynomial| F)))
                   (|:| |limitedlogs|
                        (|List|
                         (|Record|
                          (|:| |coeff|
                               (|Fraction| (|SparseUnivariatePolynomial| F)))
                          (|:| |logand|
                               (|Fraction|
                                (|SparseUnivariatePolynomial| F))))))))
             (|:| |a0| F))
            "failed"))
          (#4=#:G674 NIL) (|u| NIL) (#5=#:G673 NIL)
          (|lk| (|List| (|Kernel| F))) (#6=#:G672 NIL) (|a| NIL)
          (#7=#:G671 NIL))
         (SEQ
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #7# NIL . #8=(|INTEF;primlflogint|))
                  (SEQ (LETT |a| NIL . #8#)
                       (LETT #6# (SPADCALL |f| (QREFELT $ 155)) . #8#) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |a| (CAR #6#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND
                            ((SPADCALL |k| |a| (QREFELT $ 197))
                             (SPADCALL |a| '|log| (QREFELT $ 13)))
                            (#9='T 'NIL))
                           (LETT #7# (CONS |a| #7#) . #8#)))))
                       (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #7#))))
                 |x| (QREFELT $ 174))
                . #8#)
          (LETT |u1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;primlflogint!1| (VECTOR |k| |x| $))
                          (CONS #'|INTEF;primlflogint!2|
                                (VECTOR $ |lk| |k| |x|))
                          (PROGN
                           (LETT #5# NIL . #8#)
                           (SEQ (LETT |u| NIL . #8#) (LETT #4# |lu| . #8#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |u| (CAR #4#) . #8#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (SPADCALL |u| |k| (QREFELT $ 39))
                                              #5#)
                                        . #8#)))
                                (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          (QREFELT $ 228))
                . #8#)
          (EXIT
           (COND ((QEQCAR |u1| 1) (CONS 1 "failed"))
                 (#9#
                  (SEQ
                   (LETT |l|
                         (PROGN
                          (LETT #3# NIL . #8#)
                          (SEQ (LETT |lg| NIL . #8#)
                               (LETT #2# (QCDR (QCAR (QCDR |u1|))) . #8#) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |lg| (CAR #2#) . #8#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS
                                        (CONS
                                         (SPADCALL (QCAR |lg|) |k|
                                                   (QREFELT $ 51))
                                         (SPADCALL (QCDR |lg|) |k|
                                                   (QREFELT $ 51)))
                                        #3#)
                                       . #8#)))
                               (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         . #8#)
                   (LETT |u2|
                         (SPADCALL (QCDR (QCDR |u1|)) |x| |lu| (QREFELT $ 63))
                         . #8#)
                   (EXIT
                    (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                          (#9#
                           (CONS 0
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL (QCAR (QCAR (QCDR |u1|))) |k|
                                             (QREFELT $ 51))
                                   (QCAR (QCDR |u2|)) (QREFELT $ 119))
                                  (SPADCALL (QCDR (QCDR |u2|)) |l|
                                            (QREFELT $ 230)))))))))))))) 

(SDEFUN |INTEF;primlflogint!2| ((|x3| NIL) ($$ NIL))
        (PROG (|x| |k| |lk| $)
          (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primlflogint|))
          (LETT |k| (QREFELT $$ 2) . #1#)
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 198)))))) 

(SDEFUN |INTEF;primlflogint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |k|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;primlflogint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1|
                             (CONS #'|INTEF;primlflogint!0| (VECTOR $ |x|))
                             (SPADCALL
                              (SPADCALL (SPADCALL |k| (QREFELT $ 134)) |x|
                                        (QREFELT $ 19))
                              (QREFELT $ 57))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;primlflogint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;explflogint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) (|lu| |List| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          #1="failed"))
        (SPROG
         ((|u2|
           (|Union|
            (|Record| (|:| |mainpart| F)
                      (|:| |limitedlogs|
                           (|List|
                            (|Record| (|:| |coeff| F) (|:| |logand| F)))))
            #1#))
          (|l| (|List| (|Record| (|:| |coeff| F) (|:| |logand| F))))
          (#2=#:G706 NIL) (|lg| NIL) (#3=#:G705 NIL)
          (|u1|
           (|Union|
            (|Record|
             (|:| |answer|
                  (|Record|
                   (|:| |mainpart|
                        (|Fraction| (|SparseUnivariatePolynomial| F)))
                   (|:| |limitedlogs|
                        (|List|
                         (|Record|
                          (|:| |coeff|
                               (|Fraction| (|SparseUnivariatePolynomial| F)))
                          (|:| |logand|
                               (|Fraction|
                                (|SparseUnivariatePolynomial| F))))))))
             (|:| |a0| F))
            "failed"))
          (#4=#:G704 NIL) (|u| NIL) (#5=#:G703 NIL) (|eta| (F)))
         (SEQ
          (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                . #6=(|INTEF;explflogint|))
          (LETT |u1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;explflogint!1| (VECTOR |eta| |x| $))
                          (CONS #'|INTEF;explflogint!4| (VECTOR $ |x| |eta|))
                          (PROGN
                           (LETT #5# NIL . #6#)
                           (SEQ (LETT |u| NIL . #6#) (LETT #4# |lu| . #6#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |u| (CAR #4#) . #6#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (SPADCALL |u| |k| (QREFELT $ 39))
                                              #5#)
                                        . #6#)))
                                (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          (QREFELT $ 231))
                . #6#)
          (EXIT
           (COND ((QEQCAR |u1| 1) (CONS 1 "failed"))
                 (#7='T
                  (SEQ
                   (LETT |l|
                         (PROGN
                          (LETT #3# NIL . #6#)
                          (SEQ (LETT |lg| NIL . #6#)
                               (LETT #2# (QCDR (QCAR (QCDR |u1|))) . #6#) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |lg| (CAR #2#) . #6#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS
                                        (CONS
                                         (SPADCALL (QCAR |lg|) |k|
                                                   (QREFELT $ 51))
                                         (SPADCALL (QCDR |lg|) |k|
                                                   (QREFELT $ 51)))
                                        #3#)
                                       . #6#)))
                               (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         . #6#)
                   (LETT |u2|
                         (SPADCALL (QCDR (QCDR |u1|)) |x| |lu| (QREFELT $ 63))
                         . #6#)
                   (EXIT
                    (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                          (#7#
                           (CONS 0
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL (QCAR (QCAR (QCDR |u1|))) |k|
                                             (QREFELT $ 51))
                                   (QCAR (QCDR |u2|)) (QREFELT $ 119))
                                  (SPADCALL (QCDR (QCDR |u2|)) |l|
                                            (QREFELT $ 230)))))))))))))) 

(SDEFUN |INTEF;explflogint!4| ((|x1| NIL) (|x2| NIL) ($$ NIL))
        (PROG (|eta| |x| $)
          (LETT |eta| (QREFELT $$ 2) . #1=(|INTEF;explflogint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| |eta| |x2| |x|
                             (CONS #'|INTEF;explflogint!2| (VECTOR $ |x|))
                             (CONS #'|INTEF;explflogint!3| (VECTOR $ |x|))
                             (QREFELT $ 204))))))) 

(SDEFUN |INTEF;explflogint!3| ((|x5| NIL) (|x6| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x5| |x| |x6| (QREFELT $ 36)))))) 

(SDEFUN |INTEF;explflogint!2| ((|x3| NIL) (|x4| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x3| |x| |x4| (QREFELT $ 63)))))) 

(SDEFUN |INTEF;explflogint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |eta|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;explflogint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |eta| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;explflogint!0| (VECTOR $ |x|))
                             (SPADCALL (SPADCALL |eta| |x| (QREFELT $ 19))
                                       (|spadConstant| $ 33) (QREFELT $ 24))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;explflogint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DECLAIM (NOTINLINE |ElementaryIntegration;|)) 

(DEFUN |ElementaryIntegration| (&REST #1=#:G707)
  (SPROG NIL
         (PROG (#2=#:G708)
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
           (LETT $ (GETREFV 232) . #1#)
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
                (QSETREFV $ 166
                          (COND
                           ((|HasCategory| |#2|
                                           '(|LiouvillianFunctionCategory|))
                            (|HasCategory| |#2| '(|RetractableTo| (|Symbol|))))
                           ('T 'NIL)))
                (COND
                 ((QREFELT $ 166)
                  (PROGN
                   (QSETREFV $ 43
                             (CONS
                              (|dispatchFunction| |INTEF;lfintegrate;FSIr;15|)
                              $))))
                 ('T
                  (QSETREFV $ 43
                            (CONS
                             (|dispatchFunction| |INTEF;lfintegrate;FSIr;16|)
                             $))))))
              ('T
               (QSETREFV $ 43
                         (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;17|)
                               $)))))
            ('T
             (QSETREFV $ 43
                       (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;18|)
                             $))))
           (QSETREFV $ 214
                     (SEQ
                      (COND
                       ((|domainEqual| |#1| (|Integer|))
                        (COND
                         ((|domainEqual| |#2| (|Expression| (|Integer|)))
                          (EXIT (ELT $ 213))))))
                      (COND
                       ((|domainEqual| |#1| (|Complex| (|Integer|)))
                        (COND
                         ((|domainEqual| |#2|
                                         (|Expression|
                                          (|Complex| (|Integer|))))
                          (EXIT (ELT $ 213))))))
                      (EXIT (CONS #'|ElementaryIntegration!0| $))))
           (QSETREFV $ 216
                     (SEQ
                      (COND
                       ((|domainEqual| |#1| (|Integer|))
                        (COND
                         ((|domainEqual| |#2| (|Expression| (|Integer|)))
                          (EXIT (ELT $ 215))))))
                      (COND
                       ((|domainEqual| |#1| (|Complex| (|Integer|)))
                        (COND
                         ((|domainEqual| |#2|
                                         (|Expression|
                                          (|Complex| (|Integer|))))
                          (EXIT (ELT $ 215))))))
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
              (|Union| 34 '"failed") |INTEF;lfextendedint;FSFU;25|
              (|Fraction| 92) (|Kernel| $) (83 . |univariate|) (|Fraction| 23)
              (89 . *) (|IntegrationResult| 7) (95 . |lfintegrate|)
              (|Record| (|:| |answer| 53) (|:| |a0| 42)) (|Mapping| 23 23)
              (|Mapping| 35 7) (|Mapping| 42 7)
              (|TranscendentalIntegration| 7 23) (101 . |lambintegrate|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6 93 7)
              (111 . |multivariate|) (|Mapping| 7 40) (|IntegrationResult| 40)
              (|IntegrationResultFunctions2| 40 7) (117 . |map|) (123 . +)
              (129 . |coerce|) (|PositiveInteger|) (134 . *)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| 229))
              (|Union| 61 '"failed") |INTEF;lflogint;FSLU;26|
              (|Union| 17 '"failed") (|Integer|) (|Mapping| 62 7 17)
              (|Mapping| 35 7 7) (|ElementaryRischDESystem| 6 7)
              (140 . |rischDEsys|) (|Record| (|:| |answer| 53) (|:| |a0| 7))
              (|Mapping| 64 65 7 7) (151 . |tanintegrate|)
              (|SparseMultivariatePolynomial| 6 38) (158 . |denom|)
              (163 . |coerce|) (168 . ~=) (174 . |numer|) (179 . |zero?|)
              (184 . |log|) (189 . *) (195 . |coerce|) (200 . |Zero|)
              (204 . |coerce|)
              (|Record| (|:| |scalar| 115) (|:| |coeff| 23) (|:| |logand| 23))
              (|List| 84) (|Record| (|:| |integrand| 7) (|:| |intvar| 7))
              (|List| 86) (209 . |mkAnswer|) (|SingletonAsOrderedSet|)
              (216 . |create|) '|dummy| (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 12) (220 . |univariate|)
              (|SparseUnivariatePolynomial| 93) (226 . |degree|) (231 . ~=)
              (237 . |leadingCoefficient|) (242 . |elt|) (248 . |retract|)
              (253 . |eval|) (260 . |new|) (264 . |eval|) (271 . |notelem|)
              (276 . |logpart|) (281 . D) (287 . =) (293 . |coefficients|)
              (|Mapping| 10 7) (298 . |every?|) (304 . |degree|)
              (309 . |coefficient|) (315 . |leadingCoefficient|) (320 . -)
              (|Fraction| 65) (325 . *) (331 . |eval|) (338 . |retract|)
              (343 . +) (349 . |ratpart|) (354 . |kernel|)
              (|IntegrationResultFunctions2| 7 7) (359 . |map|)
              (365 . |differentiate|) (371 . -) (|List| 38) (377 . |kernels|)
              (|List| 12) (382 . |member?|) (|Union| 38 '"failed")
              (388 . |retractIfCan|) (|Union| 11 '"failed")
              (393 . |symbolIfCan|) (398 . |coerce|) (403 . |coerce|)
              (|OutputForm|) (408 . |coerce|) (|Void|) (413 . |print|)
              (418 . |minPoly|) (423 . |univariate|) (430 . |retract|)
              (|Union| $ '"failed") (435 . |exquo|) (441 . |lcm|) (447 . ^)
              (|List| $) (453 . |kernel|) (459 . >) (|IntegrationTools| 6 7)
              (465 . |ksec|) (|PureAlgebraicIntegration| 6 7 7)
              (472 . |palgint|) (479 . |is?|) (485 . |tower|) (490 . |Zero|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 23) (|:| |pol2| 23)
                        (|:| |prim| 23))
              (|FunctionSpacePrimitiveElement| 6 7) (494 . |primitiveElement|)
              (500 . |rootOf|) (505 . |elt|) (511 . |eval|)
              (518 . |palgextint|) (526 . |palglimint|) (534 . |map|) '#:G135
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 167 '"failed") (|PatternMatchIntegration| 6 7)
              (540 . |pmintegrate|) (|Mapping| 42 7 11) (|Mapping| 168 7 11)
              (546 . |intPatternMatch|) (554 . |varselect|) (560 . |kmax|)
              (|RationalIntegration| 7 23) (565 . |integrate|) (570 . |elem?|)
              (575 . |subst|) (582 . |freeOf?|) (588 . |first|)
              (|AlgebraicIntegration| 6 7) (593 . |algint|) (601 . =)
              (|Record| (|:| |ratpart| 40) (|:| |coeff| 40))
              (|Union| 185 '"failed") (607 . |extendedint|) (613 . |map|)
              (|Record| (|:| |coeff| 40) (|:| |logand| 40))
              (|Record| (|:| |mainpart| 40) (|:| |limitedlogs| (|List| 189)))
              (|Union| 190 '"failed") (|List| 40) (619 . |limitedint|)
              (625 . |map|) (|Union| 7 '"failed") |INTEF;lfinfieldint;FSU;27|
              (631 . ~=) |INTEF;lfextlimint;FSKLU;32|
              (|Record| (|:| |answer| 40) (|:| |a0| 7))
              (|Union| 199 185 '"failed") (637 . |primextendedint|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |sol?| 10))
              (|ElementaryRischDE| 6 7) (645 . |rischDE|) (|Mapping| 202 65 7)
              (655 . |expextendedint|) (663 . |Zero|) (667 . |Zero|)
              (|Record| (|:| |answer| 210) (|:| |logpart| 210)
                        (|:| |ir| (|IntegrationResult| 210)))
              (|Fraction| (|SparseUnivariatePolynomial| (|Expression| 6)))
              (|Kernel| (|Expression| 6)) (|DenominatorIntegration| 6)
              (671 . |li_int|) '|denint_li| (678 . |poly_int|) '|denint_poly|
              (|Record| (|:| |answer| 40) (|:| |logpart| 40) (|:| |ir| 53))
              (|Mapping| 217 40) (685 . |primintegrate|) (693 . |union|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| 10))
              (|ElementaryRischDEX2| 6 7) (699 . |risch_de_ext|)
              (|Mapping| 221 65 7) (709 . |expintegrate|)
              (|Record| (|:| |answer| 190) (|:| |a0| 7))
              (|Union| 226 '"failed") (717 . |primlogint|) (|List| 60)
              (725 . |concat|) (731 . |explogint|))
           '#(|lflogint| 739 |lfintegrate| 746 |lfinfieldint| 752 |lfextlimint|
              758 |lfextendedint| 766)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 231
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
                                                   89 0 90 2 93 92 0 12 94 1 95
                                                   22 0 96 2 22 10 0 0 97 1 95
                                                   93 0 98 2 17 7 0 65 99 1 7
                                                   38 0 100 3 7 0 0 38 0 101 0
                                                   11 0 102 3 7 0 0 0 0 103 1
                                                   42 87 0 104 1 42 85 0 105 2
                                                   7 0 0 11 106 2 7 10 0 0 107
                                                   1 23 17 0 108 2 17 10 109 0
                                                   110 1 23 22 0 111 2 23 7 0
                                                   22 112 1 23 7 0 113 1 7 0 0
                                                   114 2 7 0 115 0 116 3 23 0 0
                                                   89 7 117 1 23 7 0 118 2 7 0
                                                   0 0 119 1 42 7 0 120 1 12 0
                                                   11 121 2 122 42 28 42 123 2
                                                   42 7 0 11 124 2 7 0 0 0 125
                                                   1 7 126 0 127 2 128 10 12 0
                                                   129 1 7 130 0 131 1 12 132 0
                                                   133 1 7 0 38 134 1 7 0 65
                                                   135 1 7 136 0 137 1 136 138
                                                   0 139 1 7 92 38 140 3 50 23
                                                   7 12 23 141 1 7 65 0 142 2
                                                   65 143 0 0 144 2 65 0 0 0
                                                   145 2 7 0 0 65 146 2 7 0 14
                                                   147 148 2 65 10 0 0 149 3
                                                   150 12 12 128 11 151 3 152
                                                   42 7 12 12 153 2 14 10 0 11
                                                   154 1 7 126 0 155 0 42 0 156
                                                   2 158 157 7 7 159 1 7 0 92
                                                   160 2 23 7 0 7 161 3 7 0 0
                                                   126 147 162 4 152 35 7 12 12
                                                   7 163 4 152 62 7 12 12 17
                                                   164 2 17 0 28 0 165 2 169
                                                   168 7 11 170 4 150 42 7 11
                                                   171 172 173 2 150 128 128 11
                                                   174 1 150 12 128 175 1 176
                                                   53 40 177 1 42 10 0 178 3 7
                                                   0 0 126 147 179 2 7 10 0 11
                                                   180 1 17 7 0 181 4 182 42 7
                                                   12 12 45 183 2 12 10 0 0 184
                                                   2 176 186 40 40 187 2 54 35
                                                   52 186 188 2 176 191 40 192
                                                   193 2 54 62 52 191 194 2 12
                                                   10 0 0 197 4 48 200 40 45 46
                                                   40 201 6 203 202 65 7 7 11
                                                   66 67 204 4 48 200 40 45 205
                                                   40 206 0 40 0 207 0 53 0 208
                                                   3 212 209 210 211 11 213 3
                                                   212 209 210 211 11 215 4 48
                                                   70 40 45 218 46 219 2 150
                                                   128 128 128 220 6 222 221 65
                                                   7 7 11 66 67 223 4 48 70 40
                                                   45 218 224 225 4 48 227 40
                                                   45 46 192 228 2 229 0 0 0
                                                   230 4 48 227 40 45 205 192
                                                   231 3 0 62 7 11 17 63 2 0 42
                                                   7 11 43 2 0 195 7 11 196 4 0
                                                   35 7 11 12 128 198 3 0 35 7
                                                   11 7 36)))))
           '|lookupComplete|)) 
