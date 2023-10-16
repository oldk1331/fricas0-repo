
(SDEFUN |FR;convert;$If;1| ((|x| $) ($ |InputForm|))
        (SPROG
         ((|l| (|List| (|InputForm|))) (|iFun| (|List| (|InputForm|)))
          (|iExpon| (|InputForm|)) (|iFactor| (|InputForm|)) (#1=#:G189 NIL)
          (|rec| NIL)
          (|lf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|))))))
         (SEQ
          (COND
           ((NULL
             (LETT |lf| (REVERSE (SPADCALL |x| (QREFELT $ 11)))
                   . #2=(|FR;convert;$If;1|)))
            (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 14)))
           (#3='T
            (SEQ (LETT |l| NIL . #2#)
                 (SEQ (LETT |rec| NIL . #2#) (LETT #1# |lf| . #2#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |rec| 1) (|spadConstant| $ 15)
                                    (QREFELT $ 17))
                          (SPADCALL
                           "WARNING (convert$Factored): 1 should not appear as factor."
                           (QREFELT $ 21)))
                         ('T
                          (SEQ
                           (LETT |iFactor|
                                 (SPADCALL (SPADCALL '|::| (QREFELT $ 23))
                                           (LIST
                                            (SPADCALL (QVELT |rec| 1)
                                                      (QREFELT $ 14))
                                            (|devaluate| (QREFELT $ 6)))
                                           (QREFELT $ 25))
                                 . #2#)
                           (LETT |iExpon|
                                 (SPADCALL (QVELT |rec| 2) (QREFELT $ 27))
                                 . #2#)
                           (LETT |iFun|
                                 (COND
                                  ((QEQCAR (QVELT |rec| 0) 0)
                                   (LIST (SPADCALL '|nilFactor| (QREFELT $ 23))
                                         |iFactor| |iExpon|))
                                  ((QEQCAR (QVELT |rec| 0) 1)
                                   (LIST
                                    (SPADCALL '|sqfrFactor| (QREFELT $ 23))
                                    |iFactor| |iExpon|))
                                  ((QEQCAR (QVELT |rec| 0) 3)
                                   (LIST
                                    (SPADCALL '|primeFactor| (QREFELT $ 23))
                                    |iFactor| |iExpon|))
                                  ((QEQCAR (QVELT |rec| 0) 2)
                                   (LIST
                                    (SPADCALL '|irreducibleFactor|
                                              (QREFELT $ 23))
                                    |iFactor| |iExpon|))
                                  ('T NIL))
                                 . #2#)
                           (EXIT (LETT |l| (CONS |iFun| |l|) . #2#)))))))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((NULL |l|)
                    (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 14)))
                   (#3#
                    (SEQ
                     (COND
                      ((SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                 (|spadConstant| $ 15) (QREFELT $ 28))
                       (LETT |l|
                             (CONS
                              (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                        (QREFELT $ 14))
                              |l|)
                             . #2#)))
                     (EXIT
                      (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                            (#3#
                             (SPADCALL (SPADCALL '* (QREFELT $ 23)) |l|
                                       (QREFELT $ 25))))))))))))))) 

(SDEFUN |FR;nilFactor;RI$;2| ((|r| R) (|i| |Integer|) ($ $))
        (SPADCALL |r| |i| (CONS 0 "nil") (QREFELT $ 32))) 

(SDEFUN |FR;sqfrFactor;RI$;3| ((|r| R) (|i| |Integer|) ($ $))
        (SPADCALL |r| |i| (CONS 1 "sqfr") (QREFELT $ 32))) 

(SDEFUN |FR;irreducibleFactor;RI$;4| ((|r| R) (|i| |Integer|) ($ $))
        (SPADCALL |r| |i| (CONS 2 "irred") (QREFELT $ 32))) 

(SDEFUN |FR;primeFactor;RI$;5| ((|r| R) (|i| |Integer|) ($ $))
        (SPADCALL |r| |i| (CONS 3 "prime") (QREFELT $ 32))) 

(SDEFUN |FR;unit?;$B;6| ((|u| $) ($ |Boolean|))
        (COND ((NULL (QCDR |u|)) (NULL (SPADCALL (QCAR |u|) (QREFELT $ 37))))
              ('T NIL))) 

(PUT '|FR;factorList;$L;7| '|SPADreplace| 'QCDR) 

(SDEFUN |FR;factorList;$L;7|
        ((|u| $)
         ($ |List|
          (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                    (|:| |factor| R) (|:| |exponent| (|Integer|)))))
        (QCDR |u|)) 

(PUT '|FR;unit;$R;8| '|SPADreplace| 'QCAR) 

(SDEFUN |FR;unit;$R;8| ((|u| $) ($ R)) (QCAR |u|)) 

(SDEFUN |FR;numberOfFactors;$Nni;9| ((|u| $) ($ |NonNegativeInteger|))
        (LENGTH (QCDR |u|))) 

(SDEFUN |FR;Zero;$;10| (($ $))
        (CONS (|spadConstant| $ 15)
              (LIST (VECTOR (CONS 0 "nil") (|spadConstant| $ 43) 1)))) 

(SDEFUN |FR;zero?;$B;11| ((|u| $) ($ |Boolean|))
        (COND
         ((EQL (LENGTH (QCDR |u|)) 1)
          (COND
           ((QEQCAR (QVELT (|SPADfirst| (QCDR |u|)) 0) 0)
            (COND
             ((SPADCALL (QVELT (|SPADfirst| (QCDR |u|)) 1) (QREFELT $ 37))
              (SPADCALL (QCAR |u|) (|spadConstant| $ 15) (QREFELT $ 17)))
             (#1='T NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |FR;One;$;12| (($ $)) (CONS (|spadConstant| $ 15) NIL)) 

(SDEFUN |FR;one?;$B;13| ((|u| $) ($ |Boolean|))
        (COND
         ((NULL (QCDR |u|))
          (SPADCALL (QCAR |u|) (|spadConstant| $ 15) (QREFELT $ 17)))
         ('T NIL))) 

(PUT '|FR;mkFF| '|SPADreplace| 'CONS) 

(SDEFUN |FR;mkFF|
        ((|r| R)
         (|x| |List|
          (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                    (|:| |factor| R) (|:| |exponent| (|Integer|))))
         ($ $))
        (CONS |r| |x|)) 

(SDEFUN |FR;coerce;I$;15| ((|j| |Integer|) ($ $))
        (SPADCALL (SPADCALL |j| (QREFELT $ 46)) (QREFELT $ 47))) 

(SDEFUN |FR;characteristic;Nni;16| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 49))) 

(SDEFUN |FR;*;I2$;17| ((|i| |Integer|) (|u| $) ($ $))
        (SPADCALL (SPADCALL |i| (QREFELT $ 48)) |u| (QREFELT $ 51))) 

(SDEFUN |FR;*;R2$;18| ((|r| R) (|u| $) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 47)) |u| (QREFELT $ 51))) 

(SDEFUN |FR;factors;$L;19|
        ((|u| $)
         ($ |List| (|Record| (|:| |factor| R) (|:| |exponent| (|Integer|)))))
        (SPROG ((#1=#:G267 NIL) (|fe| NIL) (#2=#:G266 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FR;factors;$L;19|))
                 (SEQ (LETT |fe| NIL . #3#)
                      (LETT #1# (SPADCALL |u| (QREFELT $ 11)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |fe| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS (QVELT |fe| 1) (QVELT |fe| 2)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FR;expand;$R;20| ((|u| $) ($ R)) (SPADCALL |u| (QREFELT $ 57))) 

(SDEFUN |FR;negexp?| ((|x| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G271 NIL) (#2=#:G270 #3=(|Boolean|)) (#4=#:G272 #3#)
          (#5=#:G274 NIL) (|y| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|FR;negexp?|))
           (SEQ (LETT |y| NIL . #6#)
                (LETT #5# (SPADCALL |x| (QREFELT $ 11)) . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |y| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (MINUSP (QVELT |y| 2)) . #6#)
                   (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#)) . #6#))
                         ('T
                          (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T NIL)))))) 

(SDEFUN |FR;makeFR;RL$;22|
        ((|u| R)
         (|l| |List|
          (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                    (|:| |factor| R) (|:| |exponent| (|Integer|))))
         ($ $))
        (SPADCALL (|FR;mkFF| |u| (|FR;SimplifyFactorization| |l| $) $)
                  (QREFELT $ 59))) 

(PUT '|FR;rational?;$B;23| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |FR;rational?;$B;23| ((|x| $) ($ |Boolean|)) 'T) 

(SDEFUN |FR;rationalIfCan;$U;24|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (CONS 0 (SPADCALL |x| (QREFELT $ 63)))) 

(SDEFUN |FR;rational;$F;25| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPROG
         ((#1=#:G287 NIL) (#2=#:G286 #3=(|Fraction| (|Integer|)))
          (#4=#:G288 #3#) (#5=#:G290 NIL) (|f| NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 66))
                    (PROGN
                     (LETT #1# NIL . #6=(|FR;rational;$F;25|))
                     (SEQ (LETT |f| NIL . #6#)
                          (LETT #5# (SPADCALL |x| (QREFELT $ 11)) . #6#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |f| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QVELT |f| 1) (QREFELT $ 66))
                                     (QREFELT $ 67))
                                    (QVELT |f| 2) (QREFELT $ 68))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 69))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 70))))
                    (QREFELT $ 71))))) 

(SDEFUN |FR;elt;3$;26| ((|x| $) (|v| $) ($ $))
        (SPADCALL |x| (SPADCALL |v| (QREFELT $ 58)) (QREFELT $ 72))) 

(SDEFUN |FR;eval;$L$;27| ((|x| $) (|l| |List| (|Equation| $)) ($ $))
        (SPROG ((#1=#:G295 NIL) (|e| NIL) (#2=#:G294 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #2# NIL . #3=(|FR;eval;$L$;27|))
                           (SEQ (LETT |e| NIL . #3#) (LETT #1# |l| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |e| (QREFELT $ 75))
                                           (QREFELT $ 58))
                                          (SPADCALL
                                           (SPADCALL |e| (QREFELT $ 76))
                                           (QREFELT $ 58))
                                          (QREFELT $ 78))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 80))))) 

(SDEFUN |FR;eval;$LL$;28|
        ((|x| $) (|ls| |List| (|Symbol|)) (|lv| |List| $) ($ $))
        (SPROG ((#1=#:G299 NIL) (|v| NIL) (#2=#:G298 NIL))
               (SEQ
                (SPADCALL |x| |ls|
                          (PROGN
                           (LETT #2# NIL . #3=(|FR;eval;$LL$;28|))
                           (SEQ (LETT |v| NIL . #3#) (LETT #1# |lv| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |v| (QREFELT $ 58))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 85))))) 

(SDEFUN |FR;convert;$F;29| ((|x| $) ($ |Float|))
        (SPROG
         ((#1=#:G306 NIL) (#2=#:G305 #3=(|Float|)) (#4=#:G307 #3#)
          (#5=#:G309 NIL) (|f| NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 88))
                    (PROGN
                     (LETT #1# NIL . #6=(|FR;convert;$F;29|))
                     (SEQ (LETT |f| NIL . #6#)
                          (LETT #5# (SPADCALL |x| (QREFELT $ 11)) . #6#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |f| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (SPADCALL
                                    (SPADCALL (QVELT |f| 1) (QREFELT $ 88))
                                    (QVELT |f| 2) (QREFELT $ 89))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 90))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 91))))
                    (QREFELT $ 90))))) 

(SDEFUN |FR;convert;$Df;30| ((|x| $) ($ |DoubleFloat|))
        (SPROG
         ((#1=#:G316 NIL) (#2=#:G315 #3=(|DoubleFloat|)) (#4=#:G317 #3#)
          (#5=#:G319 NIL) (|f| NIL))
         (SEQ
          (|mul_DF| (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 94))
                    (PROGN
                     (LETT #1# NIL . #6=(|FR;convert;$Df;30|))
                     (SEQ (LETT |f| NIL . #6#)
                          (LETT #5# (SPADCALL |x| (QREFELT $ 11)) . #6#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |f| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (|expt_DF_I|
                                    (SPADCALL (QVELT |f| 1) (QREFELT $ 94))
                                    (QVELT |f| 2))
                                   . #6#)
                             (COND (#1# (LETT #2# (|mul_DF| #2# #4#) . #6#))
                                   ('T
                                    (PROGN
                                     (LETT #2# #4# . #6#)
                                     (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T 1.0))))))) 

(SDEFUN |FR;*;3$;31| ((|u| $) (|v| $) ($ $))
        (COND
         ((OR (SPADCALL |u| (QREFELT $ 44)) (SPADCALL |v| (QREFELT $ 44)))
          (|spadConstant| $ 42))
         ('T
          (COND ((SPADCALL |u| (|spadConstant| $ 41) (QREFELT $ 96)) |v|)
                ((SPADCALL |v| (|spadConstant| $ 41) (QREFELT $ 96)) |u|)
                ('T
                 (|FR;mkFF|
                  (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                            (SPADCALL |v| (QREFELT $ 12)) (QREFELT $ 97))
                  (|FR;SimplifyFactorization|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 11))
                             (SPADCALL (SPADCALL |v| (QREFELT $ 11))
                                       (QREFELT $ 98))
                             (QREFELT $ 99))
                   $)
                  $)))))) 

(SDEFUN |FR;^;$Nni$;32| ((|u| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G334 NIL) (|x| NIL) (#2=#:G333 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 41)) ((EQL |n| 1) |u|)
                      ('T
                       (|FR;mkFF|
                        (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |n|
                                  (QREFELT $ 100))
                        (PROGN
                         (LETT #2# NIL . #3=(|FR;^;$Nni$;32|))
                         (SEQ (LETT |x| NIL . #3#)
                              (LETT #1# (SPADCALL |u| (QREFELT $ 11)) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (VECTOR (QVELT |x| 0) (QVELT |x| 1)
                                               (SPADCALL |n| (QVELT |x| 2)
                                                         (QREFELT $ 101)))
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        $)))))) 

(SDEFUN |FR;SimplifyFactorization|
        ((|x| |List|
          (|Record|
           (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
           (|:| |factor| R) (|:| |exponent| (|Integer|))))
         ($ |List|
          (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                    (|:| |exponent| (|Integer|)))))
        (SEQ
         (COND ((NULL |x|) NIL)
               ('T
                (SEQ
                 (LETT |x|
                       (SPADCALL (CONS (|function| |FR;LispLessP|) $) |x|
                                 (QREFELT $ 104))
                       . #5=(|FR;SimplifyFactorization|))
                 (LETT |x|
                       (|FR;SimplifyFactorization1| (|SPADfirst| |x|) (CDR |x|)
                        $)
                       . #5#)
                 (COND
                  ((QREFELT $ 31)
                   (LETT |x|
                         (SPADCALL (CONS (|function| |FR;LispLessP|) $) |x|
                                   (QREFELT $ 104))
                         . #5#)))
                 (EXIT |x|)))))) 

(SDEFUN |FR;SimplifyFactorization1|
        ((|f| |Record|
          (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
          (|:| |factor| R) (|:| |exponent| (|Integer|)))
         (|x| |List|
          (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                    (|:| |exponent| (|Integer|))))
         ($ |List|
          (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|Integer|)))))
          (|f1|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|Integer|)))))
         (SEQ
          (COND
           ((NULL |x|)
            (COND ((ZEROP (QVELT |f| 2)) NIL)
                  (#5='T (SPADCALL |f| (QREFELT $ 105)))))
           (#5#
            (SEQ
             (LETT |f1| (|SPADfirst| |x|) . #6=(|FR;SimplifyFactorization1|))
             (EXIT
              (COND
               ((SPADCALL (QVELT |f| 1) (QVELT |f1| 1) (QREFELT $ 17))
                (|FR;SimplifyFactorization1|
                 (VECTOR (|FR;stricterFlag| (QVELT |f| 0) (QVELT |f1| 0) $)
                         (QVELT |f| 1) (+ (QVELT |f| 2) (QVELT |f1| 2)))
                 (CDR |x|) $))
               (#5#
                (SEQ
                 (LETT |l|
                       (|FR;SimplifyFactorization1| (|SPADfirst| |x|) (CDR |x|)
                        $)
                       . #6#)
                 (EXIT
                  (COND ((ZEROP (QVELT |f| 2)) |l|)
                        (#5# (CONS |f| |l|)))))))))))))) 

(SDEFUN |FR;coerce;$Of;35| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|e| (|OutputForm|)) (|l| (|List| (|OutputForm|))) (#1=#:G375 NIL)
          (|rec| NIL)
          (|lf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|))))))
         (SEQ
          (COND
           ((NULL
             (LETT |lf| (REVERSE (SPADCALL |x| (QREFELT $ 11)))
                   . #2=(|FR;coerce;$Of;35|)))
            (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 106)))
           (#3='T
            (SEQ (LETT |l| NIL . #2#)
                 (SEQ (LETT |rec| NIL . #2#) (LETT #1# |lf| . #2#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |rec| 1) (|spadConstant| $ 15)
                                    (QREFELT $ 17))
                          (SPADCALL
                           "WARNING (coerce$Factored): 1 should not appear as factor."
                           (QREFELT $ 21)))
                         ((EQL (QVELT |rec| 2) 1)
                          (LETT |l|
                                (CONS
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 106))
                                 |l|)
                                . #2#))
                         ('T
                          (LETT |l|
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 106))
                                  (SPADCALL (QVELT |rec| 2) (QREFELT $ 107))
                                  (QREFELT $ 108))
                                 |l|)
                                . #2#)))))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((NULL |l|)
                    (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 106)))
                   (#3#
                    (SEQ
                     (LETT |e|
                           (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                                 (#3#
                                  (SPADCALL (ELT $ 109) |l| (QREFELT $ 112))))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL (|spadConstant| $ 15)
                                  (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 17))
                        |e|)
                       (#3#
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 106))
                         |e| (QREFELT $ 109))))))))))))))) 

(SDEFUN |FR;retract;$R;36| ((|u| $) ($ R))
        (COND
         ((|FR;negexp?| |u| $)
          (|error| "Negative exponent in factored object"))
         ('T (|FR;qexpand| |u| $)))) 

(SDEFUN |FR;qexpand| ((|u| $) ($ R))
        (SPROG
         ((#1=#:G380 NIL) (#2=#:G379 (R)) (#3=#:G381 (R)) (#4=#:G383 NIL)
          (#5=#:G385 NIL) (|y| NIL))
         (SEQ
          (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                    (PROGN
                     (LETT #1# NIL . #6=(|FR;qexpand|))
                     (SEQ (LETT |y| NIL . #6#)
                          (LETT #5# (SPADCALL |u| (QREFELT $ 11)) . #6#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |y| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (QVELT |y| 1)
                                             (PROG1
                                                 (LETT #4# (QVELT |y| 2) . #6#)
                                               (|check_subtype2| (>= #4# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #4#))
                                             (QREFELT $ 100))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 97))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 15))))
                    (QREFELT $ 97))))) 

(SDEFUN |FR;retractIfCan;$U;38| ((|u| $) ($ |Union| R "failed"))
        (COND ((|FR;negexp?| |u| $) (CONS 1 "failed"))
              ('T (CONS 0 (|FR;qexpand| |u| $))))) 

(SDEFUN |FR;LispLessP|
        ((|y| |Record|
          (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
          (|:| |factor| R) (|:| |exponent| (|Integer|)))
         (|y1| |Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
          (|:| |exponent| (|Integer|)))
         ($ |Boolean|))
        (COND
         ((QREFELT $ 30)
          (SPADCALL (QVELT |y| 1) (QVELT |y1| 1) (QREFELT $ 116)))
         ((QREFELT $ 31)
          (SPADCALL (QVELT |y| 1) (QVELT |y1| 1) (QREFELT $ 117)))
         ('T (NULL (GGREATERP (QVELT |y| 1) (QVELT |y1| 1)))))) 

(SDEFUN |FR;stricterFlag|
        ((|fl1| |Union| #1="nil" #2="sqfr" #3="irred" #4="prime")
         (|fl2| |Union| #1# #2# #3# #4#) ($ |Union| #1# #2# #3# #4#))
        (COND ((QEQCAR |fl1| 3) |fl1|)
              ((QEQCAR |fl1| 2) (COND ((QEQCAR |fl2| 3) |fl2|) (#5='T |fl1|)))
              ((QEQCAR |fl1| 1) (COND ((QEQCAR |fl2| 0) |fl1|) (#5# |fl2|)))
              (#5# |fl2|))) 

(SDEFUN |FR;coerce;R$;41| ((|r| R) ($ $)) (SPADCALL |r| (QREFELT $ 120))) 

(SDEFUN |FR;coerce;R$;42| ((|r| R) ($ $))
        (COND ((SPADCALL |r| (QREFELT $ 37)) (|spadConstant| $ 42))
              ((SPADCALL |r| (QREFELT $ 121)) (|FR;mkFF| |r| NIL $))
              ((|HasCategory| (QREFELT $ 6) '(|Field|))
               (|error| "zero divisor in a field"))
              ('T (SPADCALL (SPADCALL |r| (QREFELT $ 123)) (QREFELT $ 59))))) 

(SDEFUN |FR;coerce;R$;43| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 15) (QREFELT $ 17))
          (|spadConstant| $ 41))
         ('T
          (SPADCALL
           (|FR;mkFF| (|spadConstant| $ 15)
            (LIST (VECTOR (CONS 0 "nil") |r| 1)) $)
           (QREFELT $ 59))))) 

(SDEFUN |FR;=;2$B;44| ((|u| $) (|v| $) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |u| (QREFELT $ 12)) (SPADCALL |v| (QREFELT $ 12))
                    (QREFELT $ 17))
          (COND
           ((EQL (LENGTH (QCDR |u|)) (LENGTH (QCDR |v|)))
            (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 56)) (QREFELT $ 125))
                      (SPADCALL (SPADCALL |v| (QREFELT $ 56)) (QREFELT $ 125))
                      (QREFELT $ 126)))
           (#1='T NIL)))
         (#1# NIL))) 

(SDEFUN |FR;-;2$;45| ((|u| $) ($ $))
        (COND ((SPADCALL |u| (QREFELT $ 44)) |u|)
              ('T
               (|FR;mkFF|
                (SPADCALL (SPADCALL |u| (QREFELT $ 12)) (QREFELT $ 127))
                (SPADCALL |u| (QREFELT $ 11)) $)))) 

(SDEFUN |FR;recip;$U;46| ((|u| $) ($ |Union| $ #1="failed"))
        (SPROG ((|r| (|Union| R #1#)))
               (SEQ
                (COND
                 ((NULL (NULL (SPADCALL |u| (QREFELT $ 11))))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |r|
                         (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                                   (QREFELT $ 130))
                         |FR;recip;$U;46|)
                   (EXIT
                    (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                          ('T (CONS 0 (|FR;mkFF| (QCDR |r|) NIL $))))))))))) 

(SDEFUN |FR;flagFactor;RIU$;47|
        ((|r| R) (|i| |Integer|) (|fl| |Union| "nil" "sqfr" "irred" "prime")
         ($ $))
        (COND ((ZEROP |i|) (|spadConstant| $ 41))
              ((SPADCALL |r| (QREFELT $ 37)) (|spadConstant| $ 42))
              ('T
               (SPADCALL
                (|FR;mkFF| (|spadConstant| $ 15) (LIST (VECTOR |fl| |r| |i|))
                 $)
                (QREFELT $ 59))))) 

(SDEFUN |FR;differentiate;$M$;48| ((|u| $) (|deriv| |Mapping| R R) ($ $))
        (SPROG
         ((#1=#:G457 NIL) (#2=#:G456 ($)) (#3=#:G458 ($)) (#4=#:G453 NIL)
          (#5=#:G462 NIL) (|fact| NIL) (|ans| ($)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |deriv|)
                          (PROG2
                              (LETT #4#
                                    (SPADCALL |u|
                                              (SPADCALL
                                               (SPADCALL |u| (QREFELT $ 12))
                                               (QREFELT $ 47))
                                              (QREFELT $ 132))
                                    . #6=(|FR;differentiate;$M$;48|))
                              (QCDR #4#)
                            (|check_union2| (QEQCAR #4# 0) $
                                            (|Union| $ #7="failed") #4#))
                          (QREFELT $ 53))
                . #6#)
          (EXIT
           (SPADCALL |ans|
                     (PROGN
                      (LETT #1# NIL . #6#)
                      (SEQ (LETT |fact| NIL . #6#)
                           (LETT #5# (SPADCALL |u| (QREFELT $ 11)) . #6#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |fact| (CAR #5#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3#
                                    (SPADCALL
                                     (SPADCALL (QVELT |fact| 2)
                                               (SPADCALL (QVELT |fact| 1)
                                                         |deriv|)
                                               (QREFELT $ 133))
                                     (PROG2
                                         (LETT #4#
                                               (SPADCALL |u|
                                                         (SPADCALL
                                                          (QVELT |fact| 1) 1
                                                          (QREFELT $ 33))
                                                         (QREFELT $ 132))
                                               . #6#)
                                         (QCDR #4#)
                                       (|check_union2| (QEQCAR #4# 0) $
                                                       (|Union| $ #7#) #4#))
                                     (QREFELT $ 53))
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 134))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 42))))
                     (QREFELT $ 134)))))) 

(SDEFUN |FR;map;M2$;49| ((|fn| |Mapping| R R) (|u| $) ($ $))
        (SPROG
         ((#1=#:G466 NIL) (#2=#:G465 ($)) (#3=#:G467 ($)) (#4=#:G469 NIL)
          (|f| NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |fn|)
                    (PROGN
                     (LETT #1# NIL . #5=(|FR;map;M2$;49|))
                     (SEQ (LETT |f| NIL . #5#)
                          (LETT #4# (SPADCALL |u| (QREFELT $ 11)) . #5#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (SPADCALL (QVELT |f| 1) |fn|)
                                             (QVELT |f| 2) (QREFELT $ 35))
                                   . #5#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 51))
                                     . #5#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #5#)
                                (LETT #1# 'T . #5#)))))))
                          (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 41))))
                    (QREFELT $ 53))))) 

(SDEFUN |FR;exquo;2$U;50| ((|u| $) (|v| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((#2=#:G501 NIL)
          (|lu|
           #3=(|List|
               #4=(|Record|
                   (|:| |flag|
                        (|Union| #5="nil" #6="sqfr" #7="irred" #8="prime"))
                   (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #5# #6# #7# #8#)) (|:| |factor| R)
                      (|:| |exponent| (|Integer|)))))
          (|lv| #3#) (|newfactor| #4#) (#9=#:G485 NIL) (|expn| (|Integer|))
          (|v1|
           #10=(|Record| (|:| |flag| (|Union| #5# #6# #7# #8#))
                         (|:| |factor| R) (|:| |exponent| (|Integer|))))
          (|u1| #10#) (|newunit| (R)) (#11=#:G475 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |newunit|
                  (PROG2
                      (LETT #11#
                            (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                                      (SPADCALL |v| (QREFELT $ 12))
                                      (QREFELT $ 138))
                            . #12=(|FR;exquo;2$U;50|))
                      (QCDR #11#)
                    (|check_union2| (QEQCAR #11# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) #1#) #11#))
                  . #12#)
            (LETT |lu| (SPADCALL |u| (QREFELT $ 11)) . #12#)
            (LETT |lv| (SPADCALL |v| (QREFELT $ 11)) . #12#)
            (EXIT
             (COND ((NULL |lv|) (CONS 0 (|FR;mkFF| |newunit| |lu| $)))
                   ('T
                    (SEQ (LETT |res| NIL . #12#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND ((NULL |lu|) NIL)
                                       ('T (NULL (NULL |lv|)))))
                                (GO G191)))
                              (SEQ (LETT |u1| (|SPADfirst| |lu|) . #12#)
                                   (LETT |v1| (|SPADfirst| |lv|) . #12#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL (QVELT |u1| 1) (QVELT |v1| 1)
                                                (QREFELT $ 17))
                                      (SEQ
                                       (LETT |expn|
                                             (- (QVELT |u1| 2) (QVELT |v1| 2))
                                             . #12#)
                                       (EXIT
                                        (COND
                                         ((< |expn| 0)
                                          (PROGN
                                           (LETT #2# (CONS 1 "failed") . #12#)
                                           (GO #13=#:G500)))
                                         ('T
                                          (SEQ
                                           (COND
                                            ((SPADCALL |expn| 0
                                                       (QREFELT $ 139))
                                             (SEQ
                                              (LETT |newfactor|
                                                    (VECTOR
                                                     (|FR;stricterFlag|
                                                      (QVELT |u1| 0)
                                                      (QVELT |v1| 0) $)
                                                     (QVELT |u1| 1)
                                                     (PROG1
                                                         (LETT #9# |expn|
                                                               . #12#)
                                                       (|check_subtype2|
                                                        (>= #9# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #9#)))
                                                    . #12#)
                                              (EXIT
                                               (LETT |res|
                                                     (CONS |newfactor| |res|)
                                                     . #12#)))))
                                           (LETT |lu| (CDR |lu|) . #12#)
                                           (EXIT
                                            (LETT |lv| (CDR |lv|)
                                                  . #12#))))))))
                                     ((|FR;LispLessP| |u1| |v1| $)
                                      (SEQ
                                       (LETT |res| (CONS |u1| |res|) . #12#)
                                       (EXIT (LETT |lu| (CDR |lu|) . #12#))))
                                     ('T
                                      (PROGN
                                       (LETT #2# (CONS 1 "failed") . #12#)
                                       (GO #13#))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (COND ((NULL (NULL |lv|)) (EXIT (CONS 1 "failed"))))
                         (EXIT
                          (CONS 0
                                (|FR;mkFF| |newunit|
                                 (SPADCALL (NREVERSE |res|) |lu|
                                           (QREFELT $ 140))
                                 $)))))))))
          #13# (EXIT #2#)))) 

(SDEFUN |FR;unitNormal;$R;51|
        ((|u| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (SPROG
         ((|vl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (|as| (R)) (|un| (R)) (|e| (|NonNegativeInteger|)) (#2=#:G509 NIL)
          (|ucar|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R)))
          (#3=#:G525 NIL) (|x| NIL) (|ur| (|Union| R "failed")))
         (SEQ
          (LETT |ur|
                (SPADCALL
                 (LETT |un| (SPADCALL |u| (QREFELT $ 12))
                       . #4=(|FR;unitNormal;$R;51|))
                 (QREFELT $ 130))
                . #4#)
          (EXIT
           (COND
            ((QEQCAR |ur| 1)
             (VECTOR (|spadConstant| $ 41) |u| (|spadConstant| $ 41)))
            ('T
             (SEQ (LETT |as| (QCDR |ur|) . #4#) (LETT |vl| NIL . #4#)
                  (SEQ (LETT |x| NIL . #4#)
                       (LETT #3# (SPADCALL |u| (QREFELT $ 11)) . #4#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ucar| (SPADCALL (QVELT |x| 1) (QREFELT $ 142))
                              . #4#)
                        (LETT |e|
                              (PROG1 (LETT #2# (ABS (QVELT |x| 2)) . #4#)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              . #4#)
                        (COND
                         ((< (QVELT |x| 2) 0)
                          (SEQ
                           (LETT |un|
                                 (SPADCALL |un|
                                           (SPADCALL (QVELT |ucar| 2) |e|
                                                     (QREFELT $ 100))
                                           (QREFELT $ 97))
                                 . #4#)
                           (EXIT
                            (LETT |as|
                                  (SPADCALL |as|
                                            (SPADCALL (QVELT |ucar| 0) |e|
                                                      (QREFELT $ 100))
                                            (QREFELT $ 97))
                                  . #4#))))
                         ('T
                          (SEQ
                           (LETT |un|
                                 (SPADCALL |un|
                                           (SPADCALL (QVELT |ucar| 0) |e|
                                                     (QREFELT $ 100))
                                           (QREFELT $ 97))
                                 . #4#)
                           (EXIT
                            (LETT |as|
                                  (SPADCALL |as|
                                            (SPADCALL (QVELT |ucar| 2) |e|
                                                      (QREFELT $ 100))
                                            (QREFELT $ 97))
                                  . #4#)))))
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (QVELT |ucar| 1) (|spadConstant| $ 15)
                                      (QREFELT $ 17)))
                           (LETT |vl|
                                 (CONS
                                  (VECTOR (QVELT |x| 0) (QVELT |ucar| 1)
                                          (QVELT |x| 2))
                                  |vl|)
                                 . #4#)))))
                       (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR (|FR;mkFF| |un| NIL $)
                           (|FR;mkFF| (|spadConstant| $ 15) (NREVERSE |vl|) $)
                           (|FR;mkFF| |as| NIL $)))))))))) 

(SDEFUN |FR;unitNormalize;2$;52| ((|u| $) ($ $))
        (SPROG
         ((|uca|
           (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))))
         (SEQ
          (LETT |uca| (SPADCALL |u| (QREFELT $ 143)) |FR;unitNormalize;2$;52|)
          (EXIT
           (|FR;mkFF|
            (SPADCALL (SPADCALL (QVELT |uca| 0) (QREFELT $ 12))
                      (SPADCALL (QVELT |uca| 1) (QREFELT $ 12)) (QREFELT $ 97))
            (SPADCALL (QVELT |uca| 1) (QREFELT $ 11)) $))))) 

(SDEFUN |FR;+;3$;53| ((|u| $) (|v| $) ($ $))
        (SPROG ((#1=#:G532 NIL) (|u1| ($)))
               (SEQ
                (COND ((SPADCALL |u| (QREFELT $ 44)) |v|)
                      ((SPADCALL |v| (QREFELT $ 44)) |u|)
                      ('T
                       (SEQ
                        (LETT |u1| (SPADCALL |u| |v| (QREFELT $ 144))
                              . #2=(|FR;+;3$;53|))
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (PROG2
                                (LETT #1# (SPADCALL |u| |u1| (QREFELT $ 132))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) $
                                              (|Union| $ #3="failed") #1#))
                            (QREFELT $ 58))
                           (SPADCALL
                            (PROG2
                                (LETT #1# (SPADCALL |v| |u1| (QREFELT $ 132))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) $ (|Union| $ #3#)
                                              #1#))
                            (QREFELT $ 58))
                           (QREFELT $ 145))
                          |u1| (QREFELT $ 53))))))))) 

(SDEFUN |FR;gcd;3$;54| ((|u| $) (|v| $) ($ $))
        (SPROG
         ((|x1|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
             (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (|f3| (|List| (|List| (|Integer|)))) (|f1| #5=(|List| (|Integer|)))
          (|i| (|Integer|))
          (|y|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|Integer|))))
          (|f2| #5#) (#6=#:G564 NIL) (|j| NIL) (#7=#:G563 NIL)
          (|x|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|Integer|))))))
         (SEQ
          (COND
           ((OR (SPADCALL |u| (|spadConstant| $ 41) (QREFELT $ 96))
                (SPADCALL |v| (|spadConstant| $ 41) (QREFELT $ 96)))
            (|spadConstant| $ 41))
           ('T
            (COND ((SPADCALL |u| (QREFELT $ 44)) |v|)
                  ((SPADCALL |v| (QREFELT $ 44)) |u|)
                  ('T
                   (SEQ (LETT |f1| NIL . #8=(|FR;gcd;3$;54|))
                        (LETT |f2| |f1| . #8#) (LETT |f3| NIL . #8#)
                        (LETT |x|
                              (SPADCALL (SPADCALL |u| (QREFELT $ 11))
                                        (SPADCALL |v| (QREFELT $ 11))
                                        (QREFELT $ 99))
                              . #8#)
                        (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 146)) . #8#)
                             (LETT #7# (SPADCALL |x| (QREFELT $ 147)) . #8#)
                             G190 (COND ((> |i| #7#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |i| |f1| (QREFELT $ 149)))
                                 (SEQ (LETT |f1| (CONS |i| |f1|) . #8#)
                                      (LETT |f2| (LIST |i|) . #8#)
                                      (SEQ (LETT |j| (+ |i| 1) . #8#)
                                           (LETT #6#
                                                 (SPADCALL |x| (QREFELT $ 147))
                                                 . #8#)
                                           G190 (COND ((> |j| #6#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((SPADCALL
                                                (QVELT
                                                 (SPADCALL |x| |i|
                                                           (QREFELT $ 150))
                                                 1)
                                                (QVELT
                                                 (SPADCALL |x| |j|
                                                           (QREFELT $ 150))
                                                 1)
                                                (QREFELT $ 17))
                                               (SEQ
                                                (LETT |f1| (CONS |j| |f1|)
                                                      . #8#)
                                                (EXIT
                                                 (LETT |f2| (CONS |j| |f2|)
                                                       . #8#)))))))
                                           (LETT |j| (+ |j| 1) . #8#) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT
                                       (LETT |f3| (CONS |f2| |f3|) . #8#)))))))
                             (LETT |i| (+ |i| 1) . #8#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |x1| NIL . #8#)
                        (SEQ G190 (COND ((NULL (NULL (NULL |f3|))) (GO G191)))
                             (SEQ (LETT |f1| (|SPADfirst| |f3|) . #8#)
                                  (COND
                                   ((SPADCALL (LENGTH |f1|) 1 (QREFELT $ 151))
                                    (SEQ (LETT |i| (|SPADfirst| |f1|) . #8#)
                                         (LETT |y|
                                               (MOVEVEC (MAKE-VEC 3)
                                                        (SPADCALL |x| |i|
                                                                  (QREFELT $
                                                                           150)))
                                               . #8#)
                                         (LETT |f1| (CDR |f1|) . #8#)
                                         (SEQ G190
                                              (COND
                                               ((NULL (NULL (NULL |f1|)))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |i| (|SPADfirst| |f1|)
                                                     . #8#)
                                               (COND
                                                ((<
                                                  (QVELT
                                                   (SPADCALL |x| |i|
                                                             (QREFELT $ 150))
                                                   2)
                                                  (QVELT |y| 2))
                                                 (QSETVELT |y| 2
                                                           (QVELT
                                                            (SPADCALL |x| |i|
                                                                      (QREFELT
                                                                       $ 150))
                                                            2))))
                                               (EXIT
                                                (LETT |f1| (CDR |f1|) . #8#)))
                                              NIL (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (LETT |x1| (CONS |y| |x1|) . #8#)))))
                                  (EXIT (LETT |f3| (CDR |f3|) . #8#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((QREFELT $ 31)
                          (LETT |x1|
                                (SPADCALL (CONS (|function| |FR;LispLessP|) $)
                                          |x1| (QREFELT $ 104))
                                . #8#)))
                        (EXIT (|FR;mkFF| (|spadConstant| $ 15) |x1| $)))))))))) 

(SDEFUN |FR;+;3$;55| ((|u| $) (|v| $) ($ $))
        (COND ((SPADCALL |u| (QREFELT $ 44)) |v|)
              ((SPADCALL |v| (QREFELT $ 44)) |u|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |u| (QREFELT $ 58))
                          (SPADCALL |v| (QREFELT $ 58)) (QREFELT $ 145))
                1 (QREFELT $ 35))))) 

(SDEFUN |FR;prime?;$B;56| ((|u| $) ($ |Boolean|))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|))))))
         (COND
          ((OR
            (OR
             (NULL (LETT |l| (SPADCALL |u| (QREFELT $ 11)) |FR;prime?;$B;56|))
             (NULL (NULL (CDR |l|))))
            (NULL (EQL (QVELT (|SPADfirst| |l|) 2) 1)))
           NIL)
          ('T (QEQCAR (QVELT (|SPADfirst| |l|) 0) 3))))) 

(DECLAIM (NOTINLINE |Factored;|)) 

(DEFUN |Factored| (#1=#:G584)
  (SPROG NIL
         (PROG (#2=#:G585)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Factored|)
                                               '|domainEqualList|)
                    . #3=(|Factored|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Factored;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Factored|)))))))))) 

(DEFUN |Factored;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G583 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|Factored|))
          (LETT |dv$| (LIST '|Factored| DV$1) . #2#)
          (LETT $ (GETREFV 161) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#1|
                                                             '(|DifferentialRing|))
                                              (|HasCategory| |#1|
                                                             (LIST
                                                              '|InnerEvalable|
                                                              '(|Symbol|)
                                                              (|devaluate|
                                                               |#1|)))
                                              (|HasCategory| |#1|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#1|)))
                                              (|HasCategory| |#1|
                                                             (LIST '|Eltable|
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   (|devaluate|
                                                                    |#1|)))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|InnerEvalable|
                                                               (|Symbol|) $))
                                              (|HasCategory| |#1|
                                                             '(|Evalable| $))
                                              (|HasCategory| |#1|
                                                             '(|Eltable| $ $))
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#1|
                                                             '(|UniqueFactorizationDomain|))
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|GcdDomain|))
                                                    . #2#)
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|UniqueFactorizationDomain|)))
                                              (|HasCategory| |#1|
                                                             '(|RealConstant|))
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|Factored| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |unt| |#1|)
                              (|:| |fct|
                                   (|List|
                                    (|Record|
                                     (|:| |flag|
                                          (|Union| "nil" "sqfr" "irred"
                                                   "prime"))
                                     (|:| |factor| |#1|)
                                     (|:| |exponent| (|Integer|)))))))
          (COND
           ((|testBitVector| |pv$| 11)
            (QSETREFV $ 29 (CONS (|dispatchFunction| |FR;convert;$If;1|) $))))
          (QSETREFV $ 30 (|HasCategory| |#1| '(|OrderedSet|)))
          (QSETREFV $ 31 (|HasCategory| |#1| '(|Comparable|)))
          (COND
           ((|testBitVector| |pv$| 16)
            (PROGN
             (QSETREFV $ 61 (CONS (|dispatchFunction| |FR;rational?;$B;23|) $))
             (QSETREFV $ 65
                       (CONS (|dispatchFunction| |FR;rationalIfCan;$U;24|) $))
             (QSETREFV $ 63
                       (CONS (|dispatchFunction| |FR;rational;$F;25|) $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 73 (CONS (|dispatchFunction| |FR;elt;3$;26|) $))))
          (COND
           ((|testBitVector| |pv$| 4)
            (QSETREFV $ 82 (CONS (|dispatchFunction| |FR;eval;$L$;27|) $))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 86 (CONS (|dispatchFunction| |FR;eval;$LL$;28|) $))))
          (COND
           ((|testBitVector| |pv$| 15)
            (PROGN
             (QSETREFV $ 92 (CONS (|dispatchFunction| |FR;convert;$F;29|) $))
             (QSETREFV $ 95
                       (CONS (|dispatchFunction| |FR;convert;$Df;30|) $)))))
          (COND
           ((|testBitVector| |pv$| 16)
            (QSETREFV $ 47 (CONS (|dispatchFunction| |FR;coerce;R$;41|) $)))
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 47 (CONS (|dispatchFunction| |FR;coerce;R$;42|) $)))
           ('T
            (QSETREFV $ 47 (CONS (|dispatchFunction| |FR;coerce;R$;43|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 134 (CONS (|dispatchFunction| |FR;+;3$;53|) $))
             (QSETREFV $ 144 (CONS (|dispatchFunction| |FR;gcd;3$;54|) $))))
           ('T (QSETREFV $ 134 (CONS (|dispatchFunction| |FR;+;3$;55|) $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 152 (CONS (|dispatchFunction| |FR;prime?;$B;56|) $))))
          $))) 

(MAKEPROP '|Factored| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 8) (|:| |factor| 6) (|:| |exponent| 26))
              (|List| 9) |FR;factorList;$L;7| |FR;unit;$R;8| (|InputForm|)
              (0 . |convert|) (5 . |One|) (|Boolean|) (9 . =) (|Void|)
              (|String|) (|OutputForm|) (15 . |messagePrint|) (|Symbol|)
              (20 . |convert|) (|List| $) (25 . |binary|) (|Integer|)
              (31 . |convert|) (36 . ~=) (42 . |convert|) '|orderedR?|
              '|comparableR?| |FR;flagFactor;RIU$;47| |FR;nilFactor;RI$;2|
              |FR;sqfrFactor;RI$;3| |FR;irreducibleFactor;RI$;4|
              |FR;primeFactor;RI$;5| (47 . |zero?|) |FR;unit?;$B;6|
              (|NonNegativeInteger|) |FR;numberOfFactors;$Nni;9|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;One;$;12|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;Zero;$;10|) $))
              (52 . |Zero|) |FR;zero?;$B;11| |FR;one?;$B;13| (56 . |coerce|)
              (61 . |coerce|) |FR;coerce;I$;15| (66 . |characteristic|)
              |FR;characteristic;Nni;16| |FR;*;3$;31| |FR;*;I2$;17|
              |FR;*;R2$;18| (|Record| (|:| |factor| 6) (|:| |exponent| 26))
              (|List| 54) |FR;factors;$L;19| |FR;retract;$R;36|
              |FR;expand;$R;20| |FR;unitNormalize;2$;52| |FR;makeFR;RL$;22|
              (70 . |rational?|) (|Fraction| 26) (75 . |rational|)
              (|Union| 62 '"failed") (80 . |rationalIfCan|) (85 . |convert|)
              (90 . |coerce|) (95 . ^) (101 . *) (107 . |One|) (111 . *)
              (117 . |elt|) (123 . |elt|) (|Equation| $$) (129 . |lhs|)
              (134 . |rhs|) (|Equation| 6) (139 . =) (|List| 77) (145 . |eval|)
              (|List| 153) (151 . |eval|) (|List| 22) (|List| 6) (157 . |eval|)
              (164 . |eval|) (|Float|) (171 . |convert|) (176 . ^) (182 . *)
              (188 . |One|) (192 . |convert|) (|DoubleFloat|) (197 . |convert|)
              (202 . |convert|) |FR;=;2$B;44| (207 . *) (213 . |copy|)
              (218 . |concat|) (224 . ^) (230 . *) |FR;^;$Nni$;32|
              (|Mapping| 16 9 9) (236 . |sort!|) (242 . |list|)
              (247 . |coerce|) (252 . |coerce|) (257 . ^) (263 . *)
              (|Mapping| 20 20 20) (|List| 20) (269 . |reduce|)
              |FR;coerce;$Of;35| (|Union| 6 '"failed") |FR;retractIfCan;$U;38|
              (275 . <) (281 . |smaller?|) (|Factored| 6)
              (|IntegerFactorizationPackage| 6) (287 . |factor|)
              (292 . |unit?|) (|Factored| $) (297 . |squareFree|) (|Set| 54)
              (302 . |set|) (307 . =) (313 . -) |FR;-;2$;45|
              (|Union| $ '"failed") (318 . |recip|) |FR;recip;$U;46|
              |FR;exquo;2$U;50| (323 . *) (329 . +) (|Mapping| 6 6)
              |FR;differentiate;$M$;48| |FR;map;M2$;49| (335 . |exquo|)
              (341 . >) (347 . |concat!|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (353 . |unitNormal|) |FR;unitNormal;$R;51| (358 . |gcd|)
              (364 . +) (370 . |minIndex|) (375 . |maxIndex|) (|List| 26)
              (380 . |member?|) (386 . |elt|) (392 . >) (398 . |prime?|)
              (|Equation| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 39) (|Union| 26 '"failed") (|PositiveInteger|)
              (|HashState|) (|SingleInteger|))
           '#(~= 403 |zero?| 409 |unitNormalize| 414 |unitNormal| 419
              |unitCanonical| 424 |unit?| 429 |unit| 434 |subtractIfCan| 439
              |squareFreePart| 445 |squareFree| 450 |sqfrFactor| 455 |sample|
              461 |rightRecip| 465 |rightPower| 470 |retractIfCan| 482
              |retract| 497 |recip| 512 |rationalIfCan| 517 |rational?| 522
              |rational| 527 |primeFactor| 532 |prime?| 538 |opposite?| 543
              |one?| 549 |numberOfFactors| 554 |nilFactor| 559 |map| 565
              |makeFR| 571 |leftRecip| 577 |leftPower| 582 |lcmCoef| 594 |lcm|
              600 |latex| 611 |irreducibleFactor| 616 |hashUpdate!| 622 |hash|
              628 |gcdPolynomial| 633 |gcd| 639 |flagFactor| 650 |factors| 657
              |factorList| 662 |factor| 667 |exquo| 672 |expand| 678 |eval| 683
              |elt| 763 |differentiate| 775 |convert| 825 |commutator| 840
              |coerce| 846 |characteristic| 871 |associator| 875 |associates?|
              882 |antiCommutator| 888 |annihilate?| 894 ^ 900 |Zero| 912 |One|
              916 D 920 = 970 - 976 + 987 * 993)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(12 14 0 0 0 13 0 0 0 1 2 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 9 15 0
                                  0 0 0 0 0 3 4 5 6 7 8 9 10 11 15 15))
            (CONS
             '#(|UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |DifferentialExtension&| NIL |Algebra&| |EntireRing&|
                |Algebra&| |PartialDifferentialRing&| |DifferentialRing&| NIL
                |Rng&| NIL |Module&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL
                |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |FullyEvalableOver&|
                |Magma&| |AbelianSemiGroup&| |FullyRetractableTo&| NIL
                |SetCategory&| |Evalable&| |Evalable&| NIL |RetractableTo&| NIL
                NIL NIL |BasicType&| NIL |InnerEvalable&| |InnerEvalable&| NIL
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|CommutativeRing|) (|DifferentialExtension| 6)
                 (|LeftOreRing|) (|Algebra| 6) (|EntireRing|) (|Algebra| $$)
                 (|PartialDifferentialRing| 22) (|DifferentialRing|) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| 6) (|Module| $$) (|SemiRng|)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| 6) (|LeftModule| 6) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|RightModule| $$) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|FullyEvalableOver| 6) (|Magma|) (|AbelianSemiGroup|)
                 (|FullyRetractableTo| 6) (|CommutativeStar|) (|SetCategory|)
                 (|Evalable| 6) (|Evalable| $$) (|RealConstant|)
                 (|RetractableTo| 6) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 20)
                 (|InnerEvalable| 22 6) (|InnerEvalable| 6 6) (|Eltable| 6 $$)
                 (|RetractableTo| 62) (|RetractableTo| 26)
                 (|InnerEvalable| 22 $$) (|InnerEvalable| $$ $$)
                 (|Eltable| $$ $$) (|ConvertibleTo| 13) (|ConvertibleTo| 93)
                 (|ConvertibleTo| 87))
              (|makeByteWordVec2| 160
                                  '(1 6 13 0 14 0 6 0 15 2 6 16 0 0 17 1 20 18
                                    19 21 1 13 0 22 23 2 13 0 0 24 25 1 13 0 26
                                    27 2 6 16 0 0 28 1 0 13 0 29 1 6 16 0 37 0
                                    6 0 43 1 6 0 26 46 1 0 0 6 47 0 6 39 49 1 0
                                    16 0 61 1 0 62 0 63 1 0 64 0 65 1 6 26 0 66
                                    1 62 0 26 67 2 62 0 0 26 68 2 62 0 0 62 69
                                    0 62 0 70 2 62 0 26 0 71 2 0 0 0 6 72 2 0 0
                                    0 0 73 1 74 2 0 75 1 74 2 0 76 2 77 0 6 6
                                    78 2 0 0 0 79 80 2 0 0 0 81 82 3 0 0 0 83
                                    84 85 3 0 0 0 83 24 86 1 6 87 0 88 2 87 0 0
                                    26 89 2 87 0 0 0 90 0 87 0 91 1 0 87 0 92 1
                                    6 93 0 94 1 0 93 0 95 2 6 0 0 0 97 1 10 0 0
                                    98 2 10 0 0 0 99 2 6 0 0 39 100 2 26 0 39 0
                                    101 2 10 0 103 0 104 1 10 0 9 105 1 6 20 0
                                    106 1 26 20 0 107 2 20 0 0 0 108 2 20 0 0 0
                                    109 2 111 20 110 0 112 2 6 16 0 0 116 2 6
                                    16 0 0 117 1 119 118 6 120 1 6 16 0 121 1 6
                                    122 0 123 1 124 0 55 125 2 124 16 0 0 126 1
                                    6 0 0 127 1 6 129 0 130 2 6 0 26 0 133 2 0
                                    0 0 0 134 2 6 129 0 0 138 2 26 16 0 0 139 2
                                    10 0 0 0 140 1 6 141 0 142 2 0 0 0 0 144 2
                                    6 0 0 0 145 1 10 26 0 146 1 10 26 0 147 2
                                    148 16 26 0 149 2 10 9 0 26 150 2 39 16 0 0
                                    151 1 0 16 0 152 2 0 16 0 0 1 1 0 16 0 44 1
                                    0 0 0 59 1 0 141 0 143 1 0 0 0 1 1 0 16 0
                                    38 1 0 6 0 12 2 0 129 0 0 1 1 12 0 0 1 1 12
                                    122 0 1 2 0 0 6 26 34 0 0 0 1 1 0 129 0 1 2
                                    0 0 0 39 1 2 0 0 0 158 1 1 6 64 0 1 1 7 157
                                    0 1 1 0 114 0 115 1 6 62 0 1 1 7 26 0 1 1 0
                                    6 0 57 1 0 129 0 131 1 16 64 0 65 1 16 16 0
                                    61 1 16 62 0 63 2 0 0 6 26 36 1 12 16 0 152
                                    2 0 16 0 0 1 1 0 16 0 45 1 0 39 0 40 2 0 0
                                    6 26 33 2 0 0 135 0 137 2 0 0 6 10 60 1 0
                                    129 0 1 2 0 0 0 39 1 2 0 0 0 158 1 2 13 155
                                    0 0 1 2 13 0 0 0 1 1 13 0 24 1 1 0 19 0 1 2
                                    0 0 6 26 35 2 0 159 159 0 1 1 0 160 0 1 2
                                    13 154 154 154 1 2 13 0 0 0 144 1 13 0 24 1
                                    3 0 0 6 26 8 32 1 0 55 0 56 1 0 10 0 11 1
                                    12 122 0 1 2 0 129 0 0 132 1 0 6 0 58 2 9 0
                                    0 81 82 3 9 0 0 0 0 1 2 9 0 0 153 1 3 9 0 0
                                    24 24 1 2 4 0 0 79 80 3 4 0 0 6 6 1 2 4 0 0
                                    77 1 3 4 0 0 84 84 1 3 8 0 0 22 0 1 3 8 0 0
                                    83 24 86 3 3 0 0 22 6 1 3 3 0 0 83 84 85 2
                                    10 0 0 0 73 2 5 0 0 6 72 2 2 0 0 39 1 1 2 0
                                    0 1 3 1 0 0 83 156 1 2 1 0 0 83 1 3 1 0 0
                                    22 39 1 2 1 0 0 22 1 3 0 0 0 135 39 1 2 0 0
                                    0 135 136 1 11 13 0 29 1 15 87 0 92 1 15 93
                                    0 95 2 0 0 0 0 1 1 6 0 62 1 1 0 0 6 47 1 0
                                    0 0 1 1 0 0 26 48 1 0 20 0 113 0 0 39 50 3
                                    0 0 0 0 0 1 2 0 16 0 0 1 2 0 0 0 0 1 2 0 16
                                    0 0 1 2 0 0 0 39 102 2 0 0 0 158 1 0 0 0 42
                                    0 0 0 41 2 2 0 0 39 1 1 2 0 0 1 3 1 0 0 83
                                    156 1 3 1 0 0 22 39 1 2 1 0 0 22 1 2 1 0 0
                                    83 1 2 0 0 0 135 1 3 0 0 0 135 39 1 2 0 16
                                    0 0 96 2 0 0 0 0 1 1 0 0 0 128 2 0 0 0 0
                                    134 2 0 0 0 6 1 2 0 0 6 0 53 2 0 0 39 0 1 2
                                    0 0 26 0 52 2 0 0 0 0 51 2 0 0 158 0 1)))))
           '|lookupComplete|)) 
