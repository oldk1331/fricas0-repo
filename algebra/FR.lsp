
(SDEFUN |FR;convert;$If;1| ((|x| $) ($ |InputForm|))
        (SPROG
         ((|l| (|List| (|InputForm|))) (|iFun| (|List| (|InputForm|)))
          (|iExpon| (|InputForm|)) (|iFactor| (|InputForm|)) (#1=#:G203 NIL)
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
        (SPROG ((#1=#:G281 NIL) (|fe| NIL) (#2=#:G280 NIL))
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
         ((#1=#:G285 NIL) (#2=#:G284 #3=(|Boolean|)) (#4=#:G286 #3#)
          (#5=#:G288 NIL) (|y| NIL))
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
         (|x| |List|
          (|Record|
           (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
           (|:| |factor| R) (|:| |exponent| (|Integer|))))
         ($ $))
        (SPROG
         ((|f|
           #5=(|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                        (|:| |exponent| (|Integer|))))
          (|p|
           #6=(|List|
               (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#))
                         (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (#7=#:G318 NIL) (|f1| #5#) (|o| #6#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |u| (|spadConstant| $ 43) (QREFELT $ 17))
             (|spadConstant| $ 42))
            ((NULL |x|) (|FR;mkFF| |u| NIL $))
            (#8='T
             (SEQ
              (LETT |x|
                    (SPADCALL (CONS (|function| |FR;LispLessP|) $) |x|
                              (QREFELT $ 60))
                    . #9=(|FR;makeFR;RL$;22|))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |x|) NIL)
                            ('T (EQL (QVELT (|SPADfirst| |x|) 2) 0))))
                     (GO G191)))
                   (SEQ (EXIT (LETT |x| (CDR |x|) . #9#))) NIL (GO G190) G191
                   (EXIT NIL))
              (EXIT
               (COND ((NULL |x|) (|FR;mkFF| |u| NIL $))
                     (#8#
                      (SEQ (LETT |o| |x| . #9#) (LETT |p| |x| . #9#)
                           (LETT |f| (|SPADfirst| |p|) . #9#)
                           (EXIT
                            (COND
                             ((SPADCALL (QVELT |f| 1) (|spadConstant| $ 43)
                                        (QREFELT $ 17))
                              (|spadConstant| $ 42))
                             (#8#
                              (SEQ (LETT |x| (CDR |x|) . #9#)
                                   (SEQ G190
                                        (COND
                                         ((NULL (NULL (NULL |x|))) (GO G191)))
                                        (SEQ
                                         (LETT |f1| (|SPADfirst| |x|) . #9#)
                                         (EXIT
                                          (COND
                                           ((EQL (QVELT |f1| 2) 0)
                                            (SEQ
                                             (SPADCALL |p| (CDR |x|)
                                                       (QREFELT $ 61))
                                             (EXIT
                                              (LETT |x| (CDR |x|) . #9#))))
                                           ((SPADCALL (QVELT |f1| 1)
                                                      (|spadConstant| $ 43)
                                                      (QREFELT $ 17))
                                            (PROGN
                                             (LETT #7# (|spadConstant| $ 42)
                                                   . #9#)
                                             (GO #10=#:G317)))
                                           ((SPADCALL (QVELT |f1| 1)
                                                      (QVELT |f| 1)
                                                      (QREFELT $ 17))
                                            (SEQ
                                             (LETT |f|
                                                   (VECTOR
                                                    (|FR;stricterFlag|
                                                     (QVELT |f| 0)
                                                     (QVELT |f1| 0) $)
                                                    (QVELT |f| 1)
                                                    (+ (QVELT |f| 2)
                                                       (QVELT |f1| 2)))
                                                   . #9#)
                                             (SPADCALL |p| |f| (QREFELT $ 62))
                                             (SPADCALL |p| (CDR |x|)
                                                       (QREFELT $ 61))
                                             (EXIT
                                              (LETT |x| (CDR |x|) . #9#))))
                                           ('T
                                            (SEQ (LETT |p| |x| . #9#)
                                                 (LETT |f| |f1| . #9#)
                                                 (EXIT
                                                  (LETT |x| (CDR |x|)
                                                        . #9#)))))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (SPADCALL (|FR;mkFF| |u| |o| $)
                                              (QREFELT $ 63)))))))))))))))
          #10# (EXIT #7#)))) 

(PUT '|FR;rational?;$B;23| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |FR;rational?;$B;23| ((|x| $) ($ |Boolean|)) 'T) 

(SDEFUN |FR;rationalIfCan;$U;24|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (CONS 0 (SPADCALL |x| (QREFELT $ 67)))) 

(SDEFUN |FR;rational;$F;25| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPROG
         ((#1=#:G329 NIL) (#2=#:G328 #3=(|Fraction| (|Integer|)))
          (#4=#:G330 #3#) (#5=#:G332 NIL) (|f| NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 70))
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
                                     (SPADCALL (QVELT |f| 1) (QREFELT $ 70))
                                     (QREFELT $ 71))
                                    (QVELT |f| 2) (QREFELT $ 72))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 73))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 74))))
                    (QREFELT $ 75))))) 

(SDEFUN |FR;elt;3$;26| ((|x| $) (|v| $) ($ $))
        (SPADCALL |x| (SPADCALL |v| (QREFELT $ 58)) (QREFELT $ 76))) 

(SDEFUN |FR;eval;$L$;27| ((|x| $) (|l| |List| (|Equation| $)) ($ $))
        (SPROG ((#1=#:G337 NIL) (|e| NIL) (#2=#:G336 NIL))
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
                                           (SPADCALL |e| (QREFELT $ 79))
                                           (QREFELT $ 58))
                                          (SPADCALL
                                           (SPADCALL |e| (QREFELT $ 80))
                                           (QREFELT $ 58))
                                          (QREFELT $ 82))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 84))))) 

(SDEFUN |FR;eval;$LL$;28|
        ((|x| $) (|ls| |List| (|Symbol|)) (|lv| |List| $) ($ $))
        (SPROG ((#1=#:G341 NIL) (|v| NIL) (#2=#:G340 NIL))
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
                          (QREFELT $ 89))))) 

(SDEFUN |FR;convert;$F;29| ((|x| $) ($ |Float|))
        (SPROG
         ((#1=#:G348 NIL) (#2=#:G347 #3=(|Float|)) (#4=#:G349 #3#)
          (#5=#:G351 NIL) (|f| NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 92))
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
                                    (SPADCALL (QVELT |f| 1) (QREFELT $ 92))
                                    (QVELT |f| 2) (QREFELT $ 93))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 94))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 95))))
                    (QREFELT $ 94))))) 

(SDEFUN |FR;convert;$Df;30| ((|x| $) ($ |DoubleFloat|))
        (SPROG
         ((#1=#:G358 NIL) (#2=#:G357 #3=(|DoubleFloat|)) (#4=#:G359 #3#)
          (#5=#:G361 NIL) (|f| NIL))
         (SEQ
          (|mul_DF| (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 98))
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
                                    (SPADCALL (QVELT |f| 1) (QREFELT $ 98))
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
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
             (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (|lv|
           #5=(|List|
               (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#))
                         (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (|lu| #5#)
          (|v1|
           #6=(|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                        (|:| |exponent| (|Integer|))))
          (|u1| #6#))
         (SEQ
          (COND
           ((OR (SPADCALL |u| (QREFELT $ 44)) (SPADCALL |v| (QREFELT $ 44)))
            |u|)
           ('T
            (COND ((SPADCALL |u| (QREFELT $ 45)) |v|)
                  ((SPADCALL |v| (QREFELT $ 45)) |u|)
                  (#7='T
                   (SEQ
                    (LETT |lu| (SPADCALL |u| (QREFELT $ 11))
                          . #8=(|FR;*;3$;31|))
                    (LETT |lv| (SPADCALL |v| (QREFELT $ 11)) . #8#)
                    (LETT |res| NIL . #8#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |lu|) NIL) ('T (NULL (NULL |lv|)))))
                           (GO G191)))
                         (SEQ (LETT |u1| (|SPADfirst| |lu|) . #8#)
                              (LETT |v1| (|SPADfirst| |lv|) . #8#)
                              (EXIT
                               (COND
                                ((SPADCALL (QVELT |u1| 1) (QVELT |v1| 1)
                                           (QREFELT $ 17))
                                 (SEQ
                                  (LETT |res|
                                        (CONS
                                         (VECTOR
                                          (|FR;stricterFlag| (QVELT |u1| 0)
                                           (QVELT |v1| 0) $)
                                          (QVELT |u1| 1)
                                          (+ (QVELT |u1| 2) (QVELT |v1| 2)))
                                         |res|)
                                        . #8#)
                                  (LETT |lu| (CDR |lu|) . #8#)
                                  (EXIT (LETT |lv| (CDR |lv|) . #8#))))
                                ((|FR;LispLessP| |u1| |v1| $)
                                 (SEQ (LETT |res| (CONS |u1| |res|) . #8#)
                                      (EXIT (LETT |lu| (CDR |lu|) . #8#))))
                                ('T
                                 (SEQ (LETT |res| (CONS |v1| |res|) . #8#)
                                      (EXIT (LETT |lv| (CDR |lv|) . #8#)))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |res|
                          (SPADCALL (NREVERSE |res|)
                                    (COND ((NULL |lu|) |lv|) (#7# |lu|))
                                    (QREFELT $ 100))
                          . #8#)
                    (EXIT
                     (|FR;mkFF|
                      (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                                (SPADCALL |v| (QREFELT $ 12)) (QREFELT $ 101))
                      |res| $)))))))))) 

(SDEFUN |FR;^;$Nni$;32| ((|u| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G397 NIL) (|x| NIL) (#2=#:G396 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 41)) ((EQL |n| 1) |u|)
                      ('T
                       (|FR;mkFF|
                        (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |n|
                                  (QREFELT $ 102))
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
                                                         (QREFELT $ 103)))
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        $)))))) 

(SDEFUN |FR;coerce;$Of;33| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|e| (|OutputForm|)) (|l| (|List| (|OutputForm|))) (#1=#:G414 NIL)
          (|rec| NIL)
          (|lf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|))))))
         (SEQ
          (COND
           ((NULL
             (LETT |lf| (REVERSE (SPADCALL |x| (QREFELT $ 11)))
                   . #2=(|FR;coerce;$Of;33|)))
            (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 105)))
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
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 105))
                                 |l|)
                                . #2#))
                         ('T
                          (LETT |l|
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 105))
                                  (SPADCALL (QVELT |rec| 2) (QREFELT $ 106))
                                  (QREFELT $ 107))
                                 |l|)
                                . #2#)))))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((NULL |l|)
                    (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 105)))
                   (#3#
                    (SEQ
                     (LETT |e|
                           (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                                 (#3#
                                  (SPADCALL (ELT $ 108) |l| (QREFELT $ 111))))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL (|spadConstant| $ 15)
                                  (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 17))
                        |e|)
                       (#3#
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 105))
                         |e| (QREFELT $ 108))))))))))))))) 

(SDEFUN |FR;retract;$R;34| ((|u| $) ($ R))
        (COND
         ((|FR;negexp?| |u| $)
          (|error| "Negative exponent in factored object"))
         ('T (|FR;qexpand| |u| $)))) 

(SDEFUN |FR;qexpand| ((|u| $) ($ R))
        (SPROG
         ((#1=#:G419 NIL) (#2=#:G418 (R)) (#3=#:G420 (R)) (#4=#:G422 NIL)
          (#5=#:G424 NIL) (|y| NIL))
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
                                             (QREFELT $ 102))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 101))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 15))))
                    (QREFELT $ 101))))) 

(SDEFUN |FR;retractIfCan;$U;36| ((|u| $) ($ |Union| R "failed"))
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
          (SPADCALL (QVELT |y| 1) (QVELT |y1| 1) (QREFELT $ 115)))
         ((QREFELT $ 31)
          (SPADCALL (QVELT |y| 1) (QVELT |y1| 1) (QREFELT $ 116)))
         ('T (NULL (GGREATERP (QVELT |y| 1) (QVELT |y1| 1)))))) 

(SDEFUN |FR;stricterFlag|
        ((|fl1| |Union| #1="nil" #2="sqfr" #3="irred" #4="prime")
         (|fl2| |Union| #1# #2# #3# #4#) ($ |Union| #1# #2# #3# #4#))
        (COND ((QEQCAR |fl1| 3) |fl1|)
              ((QEQCAR |fl1| 2) (COND ((QEQCAR |fl2| 3) |fl2|) (#5='T |fl1|)))
              ((QEQCAR |fl1| 1) (COND ((QEQCAR |fl2| 0) |fl1|) (#5# |fl2|)))
              (#5# |fl2|))) 

(SDEFUN |FR;coerce;R$;39| ((|r| R) ($ $)) (SPADCALL |r| (QREFELT $ 119))) 

(SDEFUN |FR;coerce;R$;40| ((|r| R) ($ $))
        (COND ((SPADCALL |r| (QREFELT $ 37)) (|spadConstant| $ 42))
              ((SPADCALL |r| (QREFELT $ 120)) (|FR;mkFF| |r| NIL $))
              ((|HasCategory| (QREFELT $ 6) '(|Field|))
               (|error| "zero divisor in a field"))
              ('T (SPADCALL (SPADCALL |r| (QREFELT $ 122)) (QREFELT $ 63))))) 

(SDEFUN |FR;coerce;R$;41| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 15) (QREFELT $ 17))
          (|spadConstant| $ 41))
         ('T
          (SPADCALL
           (|FR;mkFF| (|spadConstant| $ 15)
            (LIST (VECTOR (CONS 0 "nil") |r| 1)) $)
           (QREFELT $ 63))))) 

(SDEFUN |FR;=;2$B;42| ((|u| $) (|v| $) ($ |Boolean|))
        (SPROG
         ((|lv|
           #1=(|List|
               (|Record|
                (|:| |flag| (|Union| #2="nil" #3="sqfr" #4="irred" #5="prime"))
                (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (|lu| #1#) (#6=#:G467 NIL)
          (|v1|
           #7=(|Record| (|:| |flag| (|Union| #2# #3# #4# #5#)) (|:| |factor| R)
                        (|:| |exponent| (|Integer|))))
          (|u1| #7#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |u| (QREFELT $ 12))
                       (SPADCALL |v| (QREFELT $ 12)) (QREFELT $ 28))
             NIL)
            (#8='T
             (SEQ
              (LETT |lu| (SPADCALL |u| (QREFELT $ 11)) . #9=(|FR;=;2$B;42|))
              (LETT |lv| (SPADCALL |v| (QREFELT $ 11)) . #9#)
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |lu|) NIL) ('T (NULL (NULL |lv|)))))
                     (GO G191)))
                   (SEQ (LETT |u1| (|SPADfirst| |lu|) . #9#)
                        (LETT |v1| (|SPADfirst| |lv|) . #9#)
                        (EXIT
                         (COND
                          ((OR
                            (SPADCALL (QVELT |u1| 2) (QVELT |v1| 2)
                                      (QREFELT $ 123))
                            (SPADCALL (QVELT |u1| 1) (QVELT |v1| 1)
                                      (QREFELT $ 28)))
                           (PROGN (LETT #6# NIL . #9#) (GO #10=#:G466)))
                          ('T
                           (SEQ (LETT |lu| (CDR |lu|) . #9#)
                                (EXIT (LETT |lv| (CDR |lv|) . #9#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (COND ((NULL |lu|) (NULL |lv|)) (#8# NIL)))))))
          #10# (EXIT #6#)))) 

(SDEFUN |FR;-;2$;43| ((|u| $) ($ $))
        (COND ((SPADCALL |u| (QREFELT $ 44)) |u|)
              ('T
               (|FR;mkFF|
                (SPADCALL (SPADCALL |u| (QREFELT $ 12)) (QREFELT $ 125))
                (SPADCALL |u| (QREFELT $ 11)) $)))) 

(SDEFUN |FR;recip;$U;44| ((|u| $) ($ |Union| $ #1="failed"))
        (SPROG ((|r| (|Union| R #1#)))
               (SEQ
                (COND
                 ((NULL (NULL (SPADCALL |u| (QREFELT $ 11))))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |r|
                         (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                                   (QREFELT $ 128))
                         |FR;recip;$U;44|)
                   (EXIT
                    (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                          ('T (CONS 0 (|FR;mkFF| (QCDR |r|) NIL $))))))))))) 

(SDEFUN |FR;flagFactor;RIU$;45|
        ((|r| R) (|i| |Integer|) (|fl| |Union| "nil" "sqfr" "irred" "prime")
         ($ $))
        (COND ((ZEROP |i|) (|spadConstant| $ 41))
              ((SPADCALL |r| (QREFELT $ 37)) (|spadConstant| $ 42))
              ('T
               (SPADCALL
                (|FR;mkFF| (|spadConstant| $ 15) (LIST (VECTOR |fl| |r| |i|))
                 $)
                (QREFELT $ 63))))) 

(SDEFUN |FR;differentiate;$M$;46| ((|u| $) (|deriv| |Mapping| R R) ($ $))
        (SPROG
         ((#1=#:G497 NIL) (#2=#:G496 ($)) (#3=#:G498 ($)) (#4=#:G493 NIL)
          (#5=#:G502 NIL) (|fact| NIL) (|ans| ($)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |deriv|)
                          (PROG2
                              (LETT #4#
                                    (SPADCALL |u|
                                              (SPADCALL
                                               (SPADCALL |u| (QREFELT $ 12))
                                               (QREFELT $ 47))
                                              (QREFELT $ 130))
                                    . #6=(|FR;differentiate;$M$;46|))
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
                                               (QREFELT $ 131))
                                     (PROG2
                                         (LETT #4#
                                               (SPADCALL |u|
                                                         (SPADCALL
                                                          (QVELT |fact| 1) 1
                                                          (QREFELT $ 33))
                                                         (QREFELT $ 130))
                                               . #6#)
                                         (QCDR #4#)
                                       (|check_union2| (QEQCAR #4# 0) $
                                                       (|Union| $ #7#) #4#))
                                     (QREFELT $ 53))
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 132))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 42))))
                     (QREFELT $ 132)))))) 

(SDEFUN |FR;map;M2$;47| ((|fn| |Mapping| R R) (|u| $) ($ $))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (#1=#:G514 NIL) (|f| NIL) (#2=#:G513 NIL))
         (SEQ
          (LETT |l|
                (CONS
                 (VECTOR (CONS 0 "nil")
                         (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |fn|) 1)
                 (PROGN
                  (LETT #2# NIL . #3=(|FR;map;M2$;47|))
                  (SEQ (LETT |f| NIL . #3#)
                       (LETT #1# (SPADCALL |u| (QREFELT $ 11)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (VECTOR (CONS 0 "nil")
                                        (SPADCALL (QVELT |f| 1) |fn|)
                                        (QVELT |f| 2))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
                . #3#)
          (EXIT (SPADCALL (|spadConstant| $ 15) |l| (QREFELT $ 64)))))) 

(SDEFUN |FR;exquo;2$U;48| ((|u| $) (|v| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((#2=#:G546 NIL)
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
          (|lv| #3#) (|newfactor| #4#) (#9=#:G530 NIL) (|expn| (|Integer|))
          (|v1|
           #10=(|Record| (|:| |flag| (|Union| #5# #6# #7# #8#))
                         (|:| |factor| R) (|:| |exponent| (|Integer|))))
          (|u1| #10#) (|newunit| (R)) (#11=#:G520 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |newunit|
                  (PROG2
                      (LETT #11#
                            (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                                      (SPADCALL |v| (QREFELT $ 12))
                                      (QREFELT $ 136))
                            . #12=(|FR;exquo;2$U;48|))
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
                                           (GO #13=#:G545)))
                                         ('T
                                          (SEQ
                                           (COND
                                            ((SPADCALL |expn| 0
                                                       (QREFELT $ 137))
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
                                           (QREFELT $ 100))
                                 $)))))))))
          #13# (EXIT #2#)))) 

(SDEFUN |FR;unitNormal;$R;49|
        ((|u| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (SPROG
         ((|vl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (|as| (R)) (|un| (R)) (|e| (|NonNegativeInteger|)) (#2=#:G554 NIL)
          (|ucar|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R)))
          (#3=#:G570 NIL) (|x| NIL) (|ur| (|Union| R "failed")))
         (SEQ
          (LETT |ur|
                (SPADCALL
                 (LETT |un| (SPADCALL |u| (QREFELT $ 12))
                       . #4=(|FR;unitNormal;$R;49|))
                 (QREFELT $ 128))
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
                        (LETT |ucar| (SPADCALL (QVELT |x| 1) (QREFELT $ 139))
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
                                                     (QREFELT $ 102))
                                           (QREFELT $ 101))
                                 . #4#)
                           (EXIT
                            (LETT |as|
                                  (SPADCALL |as|
                                            (SPADCALL (QVELT |ucar| 0) |e|
                                                      (QREFELT $ 102))
                                            (QREFELT $ 101))
                                  . #4#))))
                         ('T
                          (SEQ
                           (LETT |un|
                                 (SPADCALL |un|
                                           (SPADCALL (QVELT |ucar| 0) |e|
                                                     (QREFELT $ 102))
                                           (QREFELT $ 101))
                                 . #4#)
                           (EXIT
                            (LETT |as|
                                  (SPADCALL |as|
                                            (SPADCALL (QVELT |ucar| 2) |e|
                                                      (QREFELT $ 102))
                                            (QREFELT $ 101))
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

(SDEFUN |FR;unitNormalize;2$;50| ((|u| $) ($ $))
        (SPROG
         ((|uca|
           (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))))
         (SEQ
          (LETT |uca| (SPADCALL |u| (QREFELT $ 140)) |FR;unitNormalize;2$;50|)
          (EXIT
           (|FR;mkFF|
            (SPADCALL (SPADCALL (QVELT |uca| 0) (QREFELT $ 12))
                      (SPADCALL (QVELT |uca| 1) (QREFELT $ 12))
                      (QREFELT $ 101))
            (SPADCALL (QVELT |uca| 1) (QREFELT $ 11)) $))))) 

(SDEFUN |FR;+;3$;51| ((|u| $) (|v| $) ($ $))
        (SPROG ((#1=#:G577 NIL) (|u1| ($)))
               (SEQ
                (COND ((SPADCALL |u| (QREFELT $ 44)) |v|)
                      ((SPADCALL |v| (QREFELT $ 44)) |u|)
                      ('T
                       (SEQ
                        (LETT |u1| (SPADCALL |u| |v| (QREFELT $ 141))
                              . #2=(|FR;+;3$;51|))
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (PROG2
                                (LETT #1# (SPADCALL |u| |u1| (QREFELT $ 130))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) $
                                              (|Union| $ #3="failed") #1#))
                            (QREFELT $ 58))
                           (SPADCALL
                            (PROG2
                                (LETT #1# (SPADCALL |v| |u1| (QREFELT $ 130))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) $ (|Union| $ #3#)
                                              #1#))
                            (QREFELT $ 58))
                           (QREFELT $ 142))
                          |u1| (QREFELT $ 53))))))))) 

(SDEFUN |FR;gcd;3$;52| ((|u| $) (|v| $) ($ $))
        (SPROG
         ((|lv|
           #1=(|List|
               (|Record|
                (|:| |flag| (|Union| #2="nil" #3="sqfr" #4="irred" #5="prime"))
                (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (|lu| #1#)
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #2# #3# #4# #5#)) (|:| |factor| R)
                      (|:| |exponent| (|Integer|)))))
          (|v1|
           #6=(|Record| (|:| |flag| (|Union| #2# #3# #4# #5#)) (|:| |factor| R)
                        (|:| |exponent| (|Integer|))))
          (|u1| #6#))
         (SEQ
          (COND
           ((OR (SPADCALL |u| (QREFELT $ 45)) (SPADCALL |v| (QREFELT $ 45)))
            |u|)
           ('T
            (COND ((SPADCALL |u| (QREFELT $ 44)) |v|)
                  ((SPADCALL |v| (QREFELT $ 44)) |u|)
                  ('T
                   (SEQ
                    (LETT |lu| (SPADCALL |u| (QREFELT $ 11))
                          . #7=(|FR;gcd;3$;52|))
                    (LETT |lv| (SPADCALL |v| (QREFELT $ 11)) . #7#)
                    (LETT |res| NIL . #7#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |lu|) NIL) ('T (NULL (NULL |lv|)))))
                           (GO G191)))
                         (SEQ (LETT |u1| (|SPADfirst| |lu|) . #7#)
                              (LETT |v1| (|SPADfirst| |lv|) . #7#)
                              (EXIT
                               (COND
                                ((SPADCALL (QVELT |u1| 1) (QVELT |v1| 1)
                                           (QREFELT $ 17))
                                 (SEQ
                                  (LETT |res|
                                        (CONS
                                         (VECTOR
                                          (|FR;stricterFlag| (QVELT |u1| 0)
                                           (QVELT |v1| 0) $)
                                          (QVELT |u1| 1)
                                          (MIN (QVELT |u1| 2) (QVELT |v1| 2)))
                                         |res|)
                                        . #7#)
                                  (LETT |lu| (CDR |lu|) . #7#)
                                  (EXIT (LETT |lv| (CDR |lv|) . #7#))))
                                ((|FR;LispLessP| |u1| |v1| $)
                                 (LETT |lu| (CDR |lu|) . #7#))
                                ('T (LETT |lv| (CDR |lv|) . #7#)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (|FR;mkFF| (|spadConstant| $ 15) (NREVERSE |res|)
                      $)))))))))) 

(SDEFUN |FR;+;3$;53| ((|u| $) (|v| $) ($ $))
        (COND ((SPADCALL |u| (QREFELT $ 44)) |v|)
              ((SPADCALL |v| (QREFELT $ 44)) |u|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |u| (QREFELT $ 58))
                          (SPADCALL |v| (QREFELT $ 58)) (QREFELT $ 142))
                1 (QREFELT $ 35))))) 

(SDEFUN |FR;prime?;$B;54| ((|u| $) ($ |Boolean|))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|))))))
         (COND
          ((OR
            (OR
             (NULL (LETT |l| (SPADCALL |u| (QREFELT $ 11)) |FR;prime?;$B;54|))
             (NULL (NULL (CDR |l|))))
            (NULL (EQL (QVELT (|SPADfirst| |l|) 2) 1)))
           NIL)
          ('T (QEQCAR (QVELT (|SPADfirst| |l|) 0) 3))))) 

(DECLAIM (NOTINLINE |Factored;|)) 

(DEFUN |Factored| (#1=#:G623)
  (SPROG NIL
         (PROG (#2=#:G624)
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
  (SPROG ((|pv$| NIL) (#1=#:G622 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|Factored|))
          (LETT |dv$| (LIST '|Factored| DV$1) . #2#)
          (LETT $ (GETREFV 152) . #2#)
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
             (QSETREFV $ 65 (CONS (|dispatchFunction| |FR;rational?;$B;23|) $))
             (QSETREFV $ 69
                       (CONS (|dispatchFunction| |FR;rationalIfCan;$U;24|) $))
             (QSETREFV $ 67
                       (CONS (|dispatchFunction| |FR;rational;$F;25|) $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 77 (CONS (|dispatchFunction| |FR;elt;3$;26|) $))))
          (COND
           ((|testBitVector| |pv$| 4)
            (QSETREFV $ 86 (CONS (|dispatchFunction| |FR;eval;$L$;27|) $))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 90 (CONS (|dispatchFunction| |FR;eval;$LL$;28|) $))))
          (COND
           ((|testBitVector| |pv$| 15)
            (PROGN
             (QSETREFV $ 96 (CONS (|dispatchFunction| |FR;convert;$F;29|) $))
             (QSETREFV $ 99
                       (CONS (|dispatchFunction| |FR;convert;$Df;30|) $)))))
          (COND
           ((|testBitVector| |pv$| 16)
            (QSETREFV $ 47 (CONS (|dispatchFunction| |FR;coerce;R$;39|) $)))
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 47 (CONS (|dispatchFunction| |FR;coerce;R$;40|) $)))
           ('T
            (QSETREFV $ 47 (CONS (|dispatchFunction| |FR;coerce;R$;41|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 132 (CONS (|dispatchFunction| |FR;+;3$;51|) $))
             (QSETREFV $ 141 (CONS (|dispatchFunction| |FR;gcd;3$;52|) $))))
           ('T (QSETREFV $ 132 (CONS (|dispatchFunction| |FR;+;3$;53|) $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 143 (CONS (|dispatchFunction| |FR;prime?;$B;54|) $))))
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
              '|comparableR?| |FR;flagFactor;RIU$;45| |FR;nilFactor;RI$;2|
              |FR;sqfrFactor;RI$;3| |FR;irreducibleFactor;RI$;4|
              |FR;primeFactor;RI$;5| (47 . |zero?|) |FR;unit?;$B;6|
              (|NonNegativeInteger|) |FR;numberOfFactors;$Nni;9|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;One;$;12|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;Zero;$;10|) $))
              (52 . |Zero|) |FR;zero?;$B;11| |FR;one?;$B;13| (56 . |coerce|)
              (61 . |coerce|) |FR;coerce;I$;15| (66 . |characteristic|)
              |FR;characteristic;Nni;16| |FR;*;3$;31| |FR;*;I2$;17|
              |FR;*;R2$;18| (|Record| (|:| |factor| 6) (|:| |exponent| 26))
              (|List| 54) |FR;factors;$L;19| |FR;retract;$R;34|
              |FR;expand;$R;20| (|Mapping| 16 9 9) (70 . |sort!|)
              (76 . |setrest!|) (82 . |setfirst!|) |FR;unitNormalize;2$;50|
              |FR;makeFR;RL$;22| (88 . |rational?|) (|Fraction| 26)
              (93 . |rational|) (|Union| 66 '"failed") (98 . |rationalIfCan|)
              (103 . |convert|) (108 . |coerce|) (113 . ^) (119 . *)
              (125 . |One|) (129 . *) (135 . |elt|) (141 . |elt|)
              (|Equation| $$) (147 . |lhs|) (152 . |rhs|) (|Equation| 6)
              (157 . =) (|List| 81) (163 . |eval|) (|List| 144) (169 . |eval|)
              (|List| 22) (|List| 6) (175 . |eval|) (182 . |eval|) (|Float|)
              (189 . |convert|) (194 . ^) (200 . *) (206 . |One|)
              (210 . |convert|) (|DoubleFloat|) (215 . |convert|)
              (220 . |convert|) (225 . |concat!|) (231 . *) (237 . ^) (243 . *)
              |FR;^;$Nni$;32| (249 . |coerce|) (254 . |coerce|) (259 . ^)
              (265 . *) (|Mapping| 20 20 20) (|List| 20) (271 . |reduce|)
              |FR;coerce;$Of;33| (|Union| 6 '"failed") |FR;retractIfCan;$U;36|
              (277 . <) (283 . |smaller?|) (|Factored| 6)
              (|IntegerFactorizationPackage| 6) (289 . |factor|)
              (294 . |unit?|) (|Factored| $) (299 . |squareFree|) (304 . ~=)
              |FR;=;2$B;42| (310 . -) |FR;-;2$;43| (|Union| $ '"failed")
              (315 . |recip|) |FR;recip;$U;44| |FR;exquo;2$U;48| (320 . *)
              (326 . +) (|Mapping| 6 6) |FR;differentiate;$M$;46|
              |FR;map;M2$;47| (332 . |exquo|) (338 . >)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (344 . |unitNormal|) |FR;unitNormal;$R;49| (349 . |gcd|)
              (355 . +) (361 . |prime?|) (|Equation| $)
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 39) (|Union| 26 '"failed") (|PositiveInteger|)
              (|HashState|) (|SingleInteger|))
           '#(~= 366 |zero?| 372 |unitNormalize| 377 |unitNormal| 382
              |unitCanonical| 387 |unit?| 392 |unit| 397 |subtractIfCan| 402
              |squareFreePart| 408 |squareFree| 413 |sqfrFactor| 418 |sample|
              424 |rightRecip| 428 |rightPower| 433 |retractIfCan| 445
              |retract| 460 |recip| 475 |rationalIfCan| 480 |rational?| 485
              |rational| 490 |primeFactor| 495 |prime?| 501 |opposite?| 506
              |one?| 512 |numberOfFactors| 517 |nilFactor| 522 |map| 528
              |makeFR| 534 |leftRecip| 540 |leftPower| 545 |lcmCoef| 557 |lcm|
              563 |latex| 574 |irreducibleFactor| 579 |hashUpdate!| 585 |hash|
              591 |gcdPolynomial| 596 |gcd| 602 |flagFactor| 613 |factors| 620
              |factorList| 625 |factor| 630 |exquo| 635 |expand| 641 |eval| 646
              |elt| 726 |differentiate| 738 |convert| 788 |commutator| 803
              |coerce| 809 |characteristic| 834 |associator| 838 |associates?|
              845 |antiCommutator| 851 |annihilate?| 857 ^ 863 |Zero| 875 |One|
              879 D 883 = 933 - 939 + 950 * 956)
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
                 (|RetractableTo| 66) (|RetractableTo| 26)
                 (|InnerEvalable| 22 $$) (|InnerEvalable| $$ $$)
                 (|Eltable| $$ $$) (|ConvertibleTo| 13) (|ConvertibleTo| 97)
                 (|ConvertibleTo| 91))
              (|makeByteWordVec2| 151
                                  '(1 6 13 0 14 0 6 0 15 2 6 16 0 0 17 1 20 18
                                    19 21 1 13 0 22 23 2 13 0 0 24 25 1 13 0 26
                                    27 2 6 16 0 0 28 1 0 13 0 29 1 6 16 0 37 0
                                    6 0 43 1 6 0 26 46 1 0 0 6 47 0 6 39 49 2
                                    10 0 59 0 60 2 10 0 0 0 61 2 10 9 0 9 62 1
                                    0 16 0 65 1 0 66 0 67 1 0 68 0 69 1 6 26 0
                                    70 1 66 0 26 71 2 66 0 0 26 72 2 66 0 0 66
                                    73 0 66 0 74 2 66 0 26 0 75 2 0 0 0 6 76 2
                                    0 0 0 0 77 1 78 2 0 79 1 78 2 0 80 2 81 0 6
                                    6 82 2 0 0 0 83 84 2 0 0 0 85 86 3 0 0 0 87
                                    88 89 3 0 0 0 87 24 90 1 6 91 0 92 2 91 0 0
                                    26 93 2 91 0 0 0 94 0 91 0 95 1 0 91 0 96 1
                                    6 97 0 98 1 0 97 0 99 2 10 0 0 0 100 2 6 0
                                    0 0 101 2 6 0 0 39 102 2 26 0 39 0 103 1 6
                                    20 0 105 1 26 20 0 106 2 20 0 0 0 107 2 20
                                    0 0 0 108 2 110 20 109 0 111 2 6 16 0 0 115
                                    2 6 16 0 0 116 1 118 117 6 119 1 6 16 0 120
                                    1 6 121 0 122 2 26 16 0 0 123 1 6 0 0 125 1
                                    6 127 0 128 2 6 0 26 0 131 2 0 0 0 0 132 2
                                    6 127 0 0 136 2 26 16 0 0 137 1 6 138 0 139
                                    2 0 0 0 0 141 2 6 0 0 0 142 1 0 16 0 143 2
                                    0 16 0 0 1 1 0 16 0 44 1 0 0 0 63 1 0 138 0
                                    140 1 0 0 0 1 1 0 16 0 38 1 0 6 0 12 2 0
                                    127 0 0 1 1 12 0 0 1 1 12 121 0 1 2 0 0 6
                                    26 34 0 0 0 1 1 0 127 0 1 2 0 0 0 39 1 2 0
                                    0 0 149 1 1 6 68 0 1 1 7 148 0 1 1 0 113 0
                                    114 1 6 66 0 1 1 7 26 0 1 1 0 6 0 57 1 0
                                    127 0 129 1 16 68 0 69 1 16 16 0 65 1 16 66
                                    0 67 2 0 0 6 26 36 1 12 16 0 143 2 0 16 0 0
                                    1 1 0 16 0 45 1 0 39 0 40 2 0 0 6 26 33 2 0
                                    0 133 0 135 2 0 0 6 10 64 1 0 127 0 1 2 0 0
                                    0 39 1 2 0 0 0 149 1 2 13 146 0 0 1 2 13 0
                                    0 0 1 1 13 0 24 1 1 0 19 0 1 2 0 0 6 26 35
                                    2 0 150 150 0 1 1 0 151 0 1 2 13 145 145
                                    145 1 2 13 0 0 0 141 1 13 0 24 1 3 0 0 6 26
                                    8 32 1 0 55 0 56 1 0 10 0 11 1 12 121 0 1 2
                                    0 127 0 0 130 1 0 6 0 58 2 9 0 0 85 86 3 9
                                    0 0 0 0 1 2 9 0 0 144 1 3 9 0 0 24 24 1 2 4
                                    0 0 83 84 3 4 0 0 6 6 1 2 4 0 0 81 1 3 4 0
                                    0 88 88 1 3 8 0 0 22 0 1 3 8 0 0 87 24 90 3
                                    3 0 0 22 6 1 3 3 0 0 87 88 89 2 10 0 0 0 77
                                    2 5 0 0 6 76 2 2 0 0 39 1 1 2 0 0 1 3 1 0 0
                                    87 147 1 2 1 0 0 87 1 3 1 0 0 22 39 1 2 1 0
                                    0 22 1 3 0 0 0 133 39 1 2 0 0 0 133 134 1
                                    11 13 0 29 1 15 91 0 96 1 15 97 0 99 2 0 0
                                    0 0 1 1 6 0 66 1 1 0 0 6 47 1 0 0 0 1 1 0 0
                                    26 48 1 0 20 0 112 0 0 39 50 3 0 0 0 0 0 1
                                    2 0 16 0 0 1 2 0 0 0 0 1 2 0 16 0 0 1 2 0 0
                                    0 39 104 2 0 0 0 149 1 0 0 0 42 0 0 0 41 2
                                    2 0 0 39 1 1 2 0 0 1 3 1 0 0 87 147 1 3 1 0
                                    0 22 39 1 2 1 0 0 22 1 2 1 0 0 87 1 2 0 0 0
                                    133 1 3 0 0 0 133 39 1 2 0 16 0 0 124 2 0 0
                                    0 0 1 1 0 0 0 126 2 0 0 0 0 132 2 0 0 0 6 1
                                    2 0 0 6 0 53 2 0 0 39 0 1 2 0 0 26 0 52 2 0
                                    0 0 0 51 2 0 0 149 0 1)))))
           '|lookupComplete|)) 
