
(SDEFUN |FR;convert;$If;1| ((|x| $) ($ |InputForm|))
        (SPROG
         ((|l| (|List| (|InputForm|))) (|iFun| (|List| (|InputForm|)))
          (|iExpon| (|InputForm|)) (|iFactor| (|InputForm|)) (#1=#:G199 NIL)
          (|rec| NIL)
          (|lf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
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
                                 (SPADCALL
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 14))
                                  (QREFELT $ 23))
                                 . #2#)
                           (LETT |iExpon|
                                 (SPADCALL (QVELT |rec| 2) (QREFELT $ 25))
                                 . #2#)
                           (LETT |iFun|
                                 (COND
                                  ((QEQCAR (QVELT |rec| 0) 0)
                                   (LIST (SPADCALL '|nilFactor| (QREFELT $ 27))
                                         |iFactor| |iExpon|))
                                  ((QEQCAR (QVELT |rec| 0) 1)
                                   (LIST
                                    (SPADCALL '|sqfrFactor| (QREFELT $ 27))
                                    |iFactor| |iExpon|))
                                  ((QEQCAR (QVELT |rec| 0) 3)
                                   (LIST
                                    (SPADCALL '|primeFactor| (QREFELT $ 27))
                                    |iFactor| |iExpon|))
                                  ((QEQCAR (QVELT |rec| 0) 2)
                                   (LIST
                                    (SPADCALL '|irreducibleFactor|
                                              (QREFELT $ 27))
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
                             (SPADCALL (SPADCALL '* (QREFELT $ 27)) |l|
                                       (QREFELT $ 30))))))))))))))) 

(SDEFUN |FR;nilFactor;RNni$;2| ((|r| R) (|i| |NonNegativeInteger|) ($ $))
        (SPADCALL |r| |i| (CONS 0 "nil") (QREFELT $ 35))) 

(SDEFUN |FR;sqfrFactor;RNni$;3| ((|r| R) (|i| |NonNegativeInteger|) ($ $))
        (SPADCALL |r| |i| (CONS 1 "sqfr") (QREFELT $ 35))) 

(SDEFUN |FR;irreducibleFactor;RNni$;4|
        ((|r| R) (|i| |NonNegativeInteger|) ($ $))
        (SPADCALL |r| |i| (CONS 2 "irred") (QREFELT $ 35))) 

(SDEFUN |FR;primeFactor;RNni$;5| ((|r| R) (|i| |NonNegativeInteger|) ($ $))
        (SPADCALL |r| |i| (CONS 3 "prime") (QREFELT $ 35))) 

(SDEFUN |FR;unit?;$B;6| ((|u| $) ($ |Boolean|))
        (COND ((NULL (QCDR |u|)) (NULL (SPADCALL (QCAR |u|) (QREFELT $ 40))))
              ('T NIL))) 

(PUT '|FR;factorList;$L;7| '|SPADreplace| 'QCDR) 

(SDEFUN |FR;factorList;$L;7|
        ((|u| $)
         ($ |List|
          (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                    (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
        (QCDR |u|)) 

(PUT '|FR;unit;$R;8| '|SPADreplace| 'QCAR) 

(SDEFUN |FR;unit;$R;8| ((|u| $) ($ R)) (QCAR |u|)) 

(SDEFUN |FR;numberOfFactors;$Nni;9| ((|u| $) ($ |NonNegativeInteger|))
        (LENGTH (QCDR |u|))) 

(SDEFUN |FR;Zero;$;10| (($ $))
        (CONS (|spadConstant| $ 15)
              (LIST (VECTOR (CONS 0 "nil") (|spadConstant| $ 45) 1)))) 

(SDEFUN |FR;zero?;$B;11| ((|u| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCDR |u|) 1 (QREFELT $ 46))
          (COND
           ((QEQCAR (QVELT (|SPADfirst| (QCDR |u|)) 0) 0)
            (COND
             ((SPADCALL (QVELT (|SPADfirst| (QCDR |u|)) 1) (QREFELT $ 40))
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
                    (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|))))
         ($ $))
        (CONS |r| |x|)) 

(SDEFUN |FR;coerce;I$;15| ((|j| |Integer|) ($ $))
        (SPADCALL (SPADCALL |j| (QREFELT $ 49)) (QREFELT $ 50))) 

(SDEFUN |FR;characteristic;Nni;16| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 52))) 

(SDEFUN |FR;*;I2$;17| ((|i| |Integer|) (|u| $) ($ $))
        (SPADCALL (SPADCALL |i| (QREFELT $ 51)) |u| (QREFELT $ 54))) 

(SDEFUN |FR;*;R2$;18| ((|r| R) (|u| $) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 50)) |u| (QREFELT $ 54))) 

(SDEFUN |FR;factors;$L;19|
        ((|u| $)
         ($ |List|
          (|Record| (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
        (SPROG ((#1=#:G275 NIL) (|fe| NIL) (#2=#:G274 NIL))
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

(SDEFUN |FR;expand;$R;20| ((|u| $) ($ R))
        (SPROG
         ((#1=#:G278 NIL) (#2=#:G277 (R)) (#3=#:G279 (R)) (#4=#:G281 NIL)
          (|y| NIL))
         (SEQ
          (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                    (PROGN
                     (LETT #1# NIL . #5=(|FR;expand;$R;20|))
                     (SEQ (LETT |y| NIL . #5#)
                          (LETT #4# (SPADCALL |u| (QREFELT $ 11)) . #5#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |y| (CAR #4#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (QVELT |y| 1) (QVELT |y| 2)
                                             (QREFELT $ 60))
                                   . #5#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 61))
                                     . #5#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #5#)
                                (LETT #1# 'T . #5#)))))))
                          (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 15))))
                    (QREFELT $ 61))))) 

(SDEFUN |FR;makeFR;RL$;21|
        ((|u| R)
         (|x| |List|
          (|Record|
           (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
           (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|))))
         ($ $))
        (SPROG
         ((|f|
           #5=(|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                        (|:| |exponent| (|NonNegativeInteger|))))
          (|p|
           #6=(|List|
               (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#))
                         (|:| |factor| R)
                         (|:| |exponent| (|NonNegativeInteger|)))))
          (#7=#:G311 NIL) (|f1| #5#) (|o| #6#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |u| (|spadConstant| $ 45) (QREFELT $ 17))
             (|spadConstant| $ 44))
            ((NULL |x|) (|FR;mkFF| |u| NIL $))
            (#8='T
             (SEQ
              (LETT |x|
                    (SPADCALL (CONS (|function| |FR;LispLessP|) $) |x|
                              (QREFELT $ 64))
                    . #9=(|FR;makeFR;RL$;21|))
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
                             ((SPADCALL (QVELT |f| 1) (|spadConstant| $ 45)
                                        (QREFELT $ 17))
                              (|spadConstant| $ 44))
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
                                                       (QREFELT $ 65))
                                             (EXIT
                                              (LETT |x| (CDR |x|) . #9#))))
                                           ((SPADCALL (QVELT |f1| 1)
                                                      (|spadConstant| $ 45)
                                                      (QREFELT $ 17))
                                            (PROGN
                                             (LETT #7# (|spadConstant| $ 44)
                                                   . #9#)
                                             (GO #10=#:G310)))
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
                                             (SPADCALL |p| |f| (QREFELT $ 66))
                                             (SPADCALL |p| (CDR |x|)
                                                       (QREFELT $ 65))
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
                                              (QREFELT $ 67)))))))))))))))
          #10# (EXIT #7#)))) 

(PUT '|FR;rational?;$B;22| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |FR;rational?;$B;22| ((|x| $) ($ |Boolean|)) 'T) 

(SDEFUN |FR;rationalIfCan;$U;23|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (CONS 0 (SPADCALL |x| (QREFELT $ 71)))) 

(SDEFUN |FR;rational;$F;24| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPROG
         ((#1=#:G322 NIL) (#2=#:G321 #3=(|Fraction| (|Integer|)))
          (#4=#:G323 #3#) (#5=#:G325 NIL) (|f| NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 74))
                    (PROGN
                     (LETT #1# NIL . #6=(|FR;rational;$F;24|))
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
                                     (SPADCALL (QVELT |f| 1) (QREFELT $ 74))
                                     (QREFELT $ 75))
                                    (QVELT |f| 2) (QREFELT $ 76))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 77))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 78))))
                    (QREFELT $ 79))))) 

(SDEFUN |FR;elt;3$;25| ((|x| $) (|v| $) ($ $))
        (SPADCALL |x| (SPADCALL |v| (QREFELT $ 62)) (QREFELT $ 80))) 

(SDEFUN |FR;eval;$L$;26| ((|x| $) (|l| |List| (|Equation| $)) ($ $))
        (SPROG ((#1=#:G330 NIL) (|e| NIL) (#2=#:G329 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #2# NIL . #3=(|FR;eval;$L$;26|))
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
                                           (SPADCALL |e| (QREFELT $ 83))
                                           (QREFELT $ 62))
                                          (SPADCALL
                                           (SPADCALL |e| (QREFELT $ 84))
                                           (QREFELT $ 62))
                                          (QREFELT $ 86))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 88))))) 

(SDEFUN |FR;eval;$LL$;27|
        ((|x| $) (|ls| |List| (|Symbol|)) (|lv| |List| $) ($ $))
        (SPROG ((#1=#:G334 NIL) (|v| NIL) (#2=#:G333 NIL))
               (SEQ
                (SPADCALL |x| |ls|
                          (PROGN
                           (LETT #2# NIL . #3=(|FR;eval;$LL$;27|))
                           (SEQ (LETT |v| NIL . #3#) (LETT #1# |lv| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |v| (QREFELT $ 62))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 93))))) 

(SDEFUN |FR;convert;$F;28| ((|x| $) ($ |Float|))
        (SPROG
         ((#1=#:G341 NIL) (#2=#:G340 #3=(|Float|)) (#4=#:G342 #3#)
          (#5=#:G344 NIL) (|f| NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 96))
                    (PROGN
                     (LETT #1# NIL . #6=(|FR;convert;$F;28|))
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
                                    (SPADCALL (QVELT |f| 1) (QREFELT $ 96))
                                    (QVELT |f| 2) (QREFELT $ 97))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 98))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 99))))
                    (QREFELT $ 98))))) 

(SDEFUN |FR;convert;$Df;29| ((|x| $) ($ |DoubleFloat|))
        (SPROG
         ((#1=#:G351 NIL) (#2=#:G350 #3=(|DoubleFloat|)) (#4=#:G352 #3#)
          (#5=#:G354 NIL) (|f| NIL))
         (SEQ
          (|mul_DF| (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 102))
                    (PROGN
                     (LETT #1# NIL . #6=(|FR;convert;$Df;29|))
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
                                    (SPADCALL (QVELT |f| 1) (QREFELT $ 102))
                                    (QVELT |f| 2))
                                   . #6#)
                             (COND (#1# (LETT #2# (|mul_DF| #2# #4#) . #6#))
                                   ('T
                                    (PROGN
                                     (LETT #2# #4# . #6#)
                                     (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T 1.0))))))) 

(SDEFUN |FR;*;3$;30| ((|u| $) (|v| $) ($ $))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
             (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
          (|lv|
           #5=(|List|
               (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#))
                         (|:| |factor| R)
                         (|:| |exponent| (|NonNegativeInteger|)))))
          (|lu| #5#)
          (|v1|
           #6=(|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                        (|:| |exponent| (|NonNegativeInteger|))))
          (|u1| #6#))
         (SEQ
          (COND
           ((OR (SPADCALL |u| (QREFELT $ 47)) (SPADCALL |v| (QREFELT $ 47)))
            |u|)
           ('T
            (COND ((SPADCALL |u| (QREFELT $ 48)) |v|)
                  ((SPADCALL |v| (QREFELT $ 48)) |u|)
                  (#7='T
                   (SEQ
                    (LETT |lu| (SPADCALL |u| (QREFELT $ 11))
                          . #8=(|FR;*;3$;30|))
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
                                    (QREFELT $ 104))
                          . #8#)
                    (EXIT
                     (|FR;mkFF|
                      (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                                (SPADCALL |v| (QREFELT $ 12)) (QREFELT $ 61))
                      |res| $)))))))))) 

(SDEFUN |FR;^;$Nni$;31| ((|u| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G390 NIL) (|x| NIL) (#2=#:G389 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 43)) ((EQL |n| 1) |u|)
                      ('T
                       (|FR;mkFF|
                        (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |n|
                                  (QREFELT $ 60))
                        (PROGN
                         (LETT #2# NIL . #3=(|FR;^;$Nni$;31|))
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
                                               (* |n| (QVELT |x| 2)))
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        $)))))) 

(SDEFUN |FR;coerce;$Of;32| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|e| (|OutputForm|)) (|l| (|List| (|OutputForm|))) (#1=#:G407 NIL)
          (|rec| NIL)
          (|lf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((NULL
             (LETT |lf| (REVERSE (SPADCALL |x| (QREFELT $ 11)))
                   . #2=(|FR;coerce;$Of;32|)))
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

(SDEFUN |FR;retract;$R;33| ((|u| $) ($ R)) (SPADCALL |u| (QREFELT $ 62))) 

(SDEFUN |FR;retractIfCan;$U;34| ((|u| $) ($ |Union| R "failed"))
        (CONS 0 (SPADCALL |u| (QREFELT $ 62)))) 

(SDEFUN |FR;LispLessP|
        ((|y| |Record|
          (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
          (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))
         (|y1| |Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
          (|:| |exponent| (|NonNegativeInteger|)))
         ($ |Boolean|))
        (COND
         ((QREFELT $ 32)
          (SPADCALL (QVELT |y| 1) (QVELT |y1| 1) (QREFELT $ 117)))
         ((QREFELT $ 33)
          (SPADCALL (QVELT |y| 1) (QVELT |y1| 1) (QREFELT $ 118)))
         ('T (NULL (GGREATERP (QVELT |y| 1) (QVELT |y1| 1)))))) 

(SDEFUN |FR;stricterFlag|
        ((|fl1| |Union| #1="nil" #2="sqfr" #3="irred" #4="prime")
         (|fl2| |Union| #1# #2# #3# #4#) ($ |Union| #1# #2# #3# #4#))
        (COND ((QEQCAR |fl1| 3) |fl1|)
              ((QEQCAR |fl1| 2) (COND ((QEQCAR |fl2| 3) |fl2|) (#5='T |fl1|)))
              ((QEQCAR |fl1| 1) (COND ((QEQCAR |fl2| 0) |fl1|) (#5# |fl2|)))
              (#5# |fl2|))) 

(SDEFUN |FR;coerce;R$;37| ((|r| R) ($ $)) (SPADCALL |r| (QREFELT $ 121))) 

(SDEFUN |FR;coerce;R$;38| ((|r| R) ($ $))
        (COND ((SPADCALL |r| (QREFELT $ 40)) (|spadConstant| $ 44))
              ((SPADCALL |r| (QREFELT $ 122)) (|FR;mkFF| |r| NIL $))
              ((|HasCategory| (QREFELT $ 6) '(|Field|))
               (|error| "zero divisor in a field"))
              ('T (SPADCALL (SPADCALL |r| (QREFELT $ 124)) (QREFELT $ 67))))) 

(SDEFUN |FR;coerce;R$;39| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 15) (QREFELT $ 17))
          (|spadConstant| $ 43))
         ('T
          (SPADCALL
           (|FR;mkFF| (|spadConstant| $ 15)
            (LIST (VECTOR (CONS 0 "nil") |r| 1)) $)
           (QREFELT $ 67))))) 

(SDEFUN |FR;=;2$B;40| ((|u| $) (|v| $) ($ |Boolean|))
        (SPROG
         ((|lv|
           #1=(|List|
               (|Record|
                (|:| |flag| (|Union| #2="nil" #3="sqfr" #4="irred" #5="prime"))
                (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
          (|lu| #1#) (#6=#:G450 NIL)
          (|v1|
           #7=(|Record| (|:| |flag| (|Union| #2# #3# #4# #5#)) (|:| |factor| R)
                        (|:| |exponent| (|NonNegativeInteger|))))
          (|u1| #7#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |u| (QREFELT $ 12))
                       (SPADCALL |v| (QREFELT $ 12)) (QREFELT $ 28))
             NIL)
            (#8='T
             (SEQ
              (LETT |lu| (SPADCALL |u| (QREFELT $ 11)) . #9=(|FR;=;2$B;40|))
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
                                      (QREFELT $ 125))
                            (SPADCALL (QVELT |u1| 1) (QVELT |v1| 1)
                                      (QREFELT $ 28)))
                           (PROGN (LETT #6# NIL . #9#) (GO #10=#:G449)))
                          ('T
                           (SEQ (LETT |lu| (CDR |lu|) . #9#)
                                (EXIT (LETT |lv| (CDR |lv|) . #9#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (COND ((NULL |lu|) (NULL |lv|)) (#8# NIL)))))))
          #10# (EXIT #6#)))) 

(SDEFUN |FR;-;2$;41| ((|u| $) ($ $))
        (COND ((SPADCALL |u| (QREFELT $ 47)) |u|)
              ('T
               (|FR;mkFF|
                (SPADCALL (SPADCALL |u| (QREFELT $ 12)) (QREFELT $ 127))
                (SPADCALL |u| (QREFELT $ 11)) $)))) 

(SDEFUN |FR;recip;$U;42| ((|u| $) ($ |Union| $ #1="failed"))
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
                         |FR;recip;$U;42|)
                   (EXIT
                    (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                          ('T (CONS 0 (|FR;mkFF| (QCDR |r|) NIL $))))))))))) 

(SDEFUN |FR;flagFactor;RNniU$;43|
        ((|r| R) (|i| |NonNegativeInteger|)
         (|fl| |Union| "nil" "sqfr" "irred" "prime") ($ $))
        (COND ((ZEROP |i|) (|spadConstant| $ 43))
              ((SPADCALL |r| (QREFELT $ 40)) (|spadConstant| $ 44))
              ('T
               (SPADCALL
                (|FR;mkFF| (|spadConstant| $ 15) (LIST (VECTOR |fl| |r| |i|))
                 $)
                (QREFELT $ 67))))) 

(SDEFUN |FR;differentiate;$M$;44| ((|u| $) (|deriv| |Mapping| R R) ($ $))
        (SPROG
         ((#1=#:G477 NIL) (#2=#:G476 ($)) (#3=#:G478 ($)) (#4=#:G480 NIL)
          (#5=#:G485 NIL) (|fact| NIL) (|ans| ($)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |deriv|)
                          (|FR;mkFF| (|spadConstant| $ 15)
                           (SPADCALL |u| (QREFELT $ 11)) $)
                          (QREFELT $ 56))
                . #6=(|FR;differentiate;$M$;44|))
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
                                               (QREFELT $ 132))
                                     (PROG2
                                         (LETT #4#
                                               (SPADCALL |u|
                                                         (SPADCALL
                                                          (QVELT |fact| 1) 1
                                                          (QREFELT $ 36))
                                                         (QREFELT $ 133))
                                               . #6#)
                                         (QCDR #4#)
                                       (|check_union2| (QEQCAR #4# 0) $
                                                       (|Union| $ "failed")
                                                       #4#))
                                     (QREFELT $ 56))
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
                      (COND (#1# #2#) ('T (|spadConstant| $ 44))))
                     (QREFELT $ 134)))))) 

(SDEFUN |FR;map;M2$;45| ((|fn| |Mapping| R R) (|u| $) ($ $))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G497 NIL) (|f| NIL) (#2=#:G496 NIL))
         (SEQ
          (LETT |l|
                (CONS
                 (VECTOR (CONS 0 "nil")
                         (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |fn|) 1)
                 (PROGN
                  (LETT #2# NIL . #3=(|FR;map;M2$;45|))
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
          (EXIT (SPADCALL (|spadConstant| $ 15) |l| (QREFELT $ 68)))))) 

(SDEFUN |FR;mergeFactors;3$;46| ((|f| $) (|g| $) ($ $))
        (|FR;mkFF|
         (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (SPADCALL |g| (QREFELT $ 12))
                   (QREFELT $ 61))
         (SPADCALL (CONS (|function| |FR;LispLessP|) $)
                   (SPADCALL |f| (QREFELT $ 11)) (SPADCALL |g| (QREFELT $ 11))
                   (QREFELT $ 138))
         $)) 

(SDEFUN |FR;exquo;2$U;47| ((|u| $) (|v| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((#2=#:G534 NIL)
          (|lu|
           #3=(|List|
               #4=(|Record|
                   (|:| |flag|
                        (|Union| #5="nil" #6="sqfr" #7="irred" #8="prime"))
                   (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #5# #6# #7# #8#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|lv| #3#) (|newfactor| #4#) (#9=#:G518 NIL) (|expn| (|Integer|))
          (|v1|
           #10=(|Record| (|:| |flag| (|Union| #5# #6# #7# #8#))
                         (|:| |factor| R)
                         (|:| |exponent| (|NonNegativeInteger|))))
          (|u1| #10#) (|newunit| (R)) (#11=#:G508 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |newunit|
                  (PROG2
                      (LETT #11#
                            (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                                      (SPADCALL |v| (QREFELT $ 12))
                                      (QREFELT $ 140))
                            . #12=(|FR;exquo;2$U;47|))
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
                                           (GO #13=#:G533)))
                                         ('T
                                          (SEQ
                                           (COND
                                            ((SPADCALL |expn| 0
                                                       (QREFELT $ 141))
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
                                           (QREFELT $ 104))
                                 $)))))))))
          #13# (EXIT #2#)))) 

(SDEFUN |FR;unitNormal;$R;48|
        ((|u| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (SPROG
         ((|vl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|as| (R)) (|un| (R)) (|e| (|NonNegativeInteger|))
          (|ucar|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R)))
          (#2=#:G554 NIL) (|x| NIL) (|ur| (|Union| R "failed")))
         (SEQ
          (LETT |ur|
                (SPADCALL
                 (LETT |un| (SPADCALL |u| (QREFELT $ 12))
                       . #3=(|FR;unitNormal;$R;48|))
                 (QREFELT $ 130))
                . #3#)
          (EXIT
           (COND
            ((QEQCAR |ur| 1)
             (VECTOR (|spadConstant| $ 43) |u| (|spadConstant| $ 43)))
            ('T
             (SEQ (LETT |as| (QCDR |ur|) . #3#) (LETT |vl| NIL . #3#)
                  (SEQ (LETT |x| NIL . #3#)
                       (LETT #2# (SPADCALL |u| (QREFELT $ 11)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ucar| (SPADCALL (QVELT |x| 1) (QREFELT $ 143))
                              . #3#)
                        (LETT |e| (QVELT |x| 2) . #3#)
                        (LETT |un|
                              (SPADCALL |un|
                                        (SPADCALL (QVELT |ucar| 0) |e|
                                                  (QREFELT $ 60))
                                        (QREFELT $ 61))
                              . #3#)
                        (LETT |as|
                              (SPADCALL |as|
                                        (SPADCALL (QVELT |ucar| 2) |e|
                                                  (QREFELT $ 60))
                                        (QREFELT $ 61))
                              . #3#)
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (QVELT |ucar| 1) (|spadConstant| $ 15)
                                      (QREFELT $ 17)))
                           (LETT |vl|
                                 (CONS
                                  (VECTOR (QVELT |x| 0) (QVELT |ucar| 1) |e|)
                                  |vl|)
                                 . #3#)))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR (|FR;mkFF| |un| NIL $)
                           (|FR;mkFF| (|spadConstant| $ 15) (NREVERSE |vl|) $)
                           (|FR;mkFF| |as| NIL $)))))))))) 

(SDEFUN |FR;unitNormalize;2$;49| ((|u| $) ($ $))
        (SPROG
         ((|uca|
           (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))))
         (SEQ
          (LETT |uca| (SPADCALL |u| (QREFELT $ 144)) |FR;unitNormalize;2$;49|)
          (EXIT
           (|FR;mkFF|
            (SPADCALL (SPADCALL (QVELT |uca| 0) (QREFELT $ 12))
                      (SPADCALL (QVELT |uca| 1) (QREFELT $ 12)) (QREFELT $ 61))
            (SPADCALL (QVELT |uca| 1) (QREFELT $ 11)) $))))) 

(SDEFUN |FR;+;3$;50| ((|u| $) (|v| $) ($ $))
        (SPROG ((#1=#:G561 NIL) (|u1| ($)))
               (SEQ
                (COND ((SPADCALL |u| (QREFELT $ 47)) |v|)
                      ((SPADCALL |v| (QREFELT $ 47)) |u|)
                      ('T
                       (SEQ
                        (LETT |u1| (SPADCALL |u| |v| (QREFELT $ 145))
                              . #2=(|FR;+;3$;50|))
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (PROG2
                                (LETT #1# (SPADCALL |u| |u1| (QREFELT $ 133))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) $
                                              (|Union| $ #3="failed") #1#))
                            (QREFELT $ 62))
                           (SPADCALL
                            (PROG2
                                (LETT #1# (SPADCALL |v| |u1| (QREFELT $ 133))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) $ (|Union| $ #3#)
                                              #1#))
                            (QREFELT $ 62))
                           (QREFELT $ 146))
                          |u1| (QREFELT $ 56))))))))) 

(SDEFUN |FR;gcd;3$;51| ((|u| $) (|v| $) ($ $))
        (SPROG
         ((|lv|
           #1=(|List|
               (|Record|
                (|:| |flag| (|Union| #2="nil" #3="sqfr" #4="irred" #5="prime"))
                (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
          (|lu| #1#)
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #2# #3# #4# #5#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|v1|
           #6=(|Record| (|:| |flag| (|Union| #2# #3# #4# #5#)) (|:| |factor| R)
                        (|:| |exponent| (|NonNegativeInteger|))))
          (|u1| #6#))
         (SEQ
          (COND
           ((OR (SPADCALL |u| (QREFELT $ 48)) (SPADCALL |v| (QREFELT $ 48)))
            |u|)
           ('T
            (COND ((SPADCALL |u| (QREFELT $ 47)) |v|)
                  ((SPADCALL |v| (QREFELT $ 47)) |u|)
                  ('T
                   (SEQ
                    (LETT |lu| (SPADCALL |u| (QREFELT $ 11))
                          . #7=(|FR;gcd;3$;51|))
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

(SDEFUN |FR;+;3$;52| ((|u| $) (|v| $) ($ $))
        (COND ((SPADCALL |u| (QREFELT $ 47)) |v|)
              ((SPADCALL |v| (QREFELT $ 47)) |u|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |u| (QREFELT $ 62))
                          (SPADCALL |v| (QREFELT $ 62)) (QREFELT $ 146))
                1 (QREFELT $ 38))))) 

(SDEFUN |FR;prime?;$B;53| ((|u| $) ($ |Boolean|))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ (LETT |l| (SPADCALL |u| (QREFELT $ 11)) |FR;prime?;$B;53|)
              (EXIT
               (COND
                ((SPADCALL |l| 1 (QREFELT $ 46))
                 (COND
                  ((EQL (QVELT (|SPADfirst| |l|) 2) 1)
                   (QEQCAR (QVELT (|SPADfirst| |l|) 0) 3))
                  (#1='T NIL)))
                (#1# NIL)))))) 

(DECLAIM (NOTINLINE |Factored;|)) 

(DEFUN |Factored| (#1=#:G606)
  (SPROG NIL
         (PROG (#2=#:G607)
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
  (SPROG ((|pv$| NIL) (#1=#:G605 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|Factored|))
          (LETT |dv$| (LIST '|Factored| DV$1) . #2#)
          (LETT $ (GETREFV 156) . #2#)
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
                                     (|:| |exponent|
                                          (|NonNegativeInteger|)))))))
          (COND
           ((|testBitVector| |pv$| 11)
            (QSETREFV $ 31 (CONS (|dispatchFunction| |FR;convert;$If;1|) $))))
          (QSETREFV $ 32 (|HasCategory| |#1| '(|OrderedSet|)))
          (QSETREFV $ 33 (|HasCategory| |#1| '(|Comparable|)))
          (COND
           ((|testBitVector| |pv$| 16)
            (PROGN
             (QSETREFV $ 69 (CONS (|dispatchFunction| |FR;rational?;$B;22|) $))
             (QSETREFV $ 73
                       (CONS (|dispatchFunction| |FR;rationalIfCan;$U;23|) $))
             (QSETREFV $ 71
                       (CONS (|dispatchFunction| |FR;rational;$F;24|) $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 81 (CONS (|dispatchFunction| |FR;elt;3$;25|) $))))
          (COND
           ((|testBitVector| |pv$| 4)
            (QSETREFV $ 90 (CONS (|dispatchFunction| |FR;eval;$L$;26|) $))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 94 (CONS (|dispatchFunction| |FR;eval;$LL$;27|) $))))
          (COND
           ((|testBitVector| |pv$| 15)
            (PROGN
             (QSETREFV $ 100 (CONS (|dispatchFunction| |FR;convert;$F;28|) $))
             (QSETREFV $ 103
                       (CONS (|dispatchFunction| |FR;convert;$Df;29|) $)))))
          (COND
           ((|testBitVector| |pv$| 16)
            (QSETREFV $ 50 (CONS (|dispatchFunction| |FR;coerce;R$;37|) $)))
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 50 (CONS (|dispatchFunction| |FR;coerce;R$;38|) $)))
           ('T
            (QSETREFV $ 50 (CONS (|dispatchFunction| |FR;coerce;R$;39|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 134 (CONS (|dispatchFunction| |FR;+;3$;50|) $))
             (QSETREFV $ 145 (CONS (|dispatchFunction| |FR;gcd;3$;51|) $))))
           ('T (QSETREFV $ 134 (CONS (|dispatchFunction| |FR;+;3$;52|) $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 147 (CONS (|dispatchFunction| |FR;prime?;$B;53|) $))))
          $))) 

(MAKEPROP '|Factored| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 8) (|:| |factor| 6) (|:| |exponent| 34))
              (|List| 9) |FR;factorList;$L;7| |FR;unit;$R;8| (|InputForm|)
              (0 . |convert|) (5 . |One|) (|Boolean|) (9 . =) (|Void|)
              (|String|) (|OutputForm|) (15 . |messagePrint|)
              (|InputFormFunctions1| 6) (20 . |coerceToType|) (|Integer|)
              (25 . |convert|) (|Symbol|) (30 . |convert|) (35 . ~=) (|List| $)
              (41 . |binary|) (47 . |convert|) '|orderedR?| '|comparableR?|
              (|NonNegativeInteger|) |FR;flagFactor;RNniU$;43|
              |FR;nilFactor;RNni$;2| |FR;sqfrFactor;RNni$;3|
              |FR;irreducibleFactor;RNni$;4| |FR;primeFactor;RNni$;5|
              (52 . |zero?|) |FR;unit?;$B;6| |FR;numberOfFactors;$Nni;9|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;One;$;12|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;Zero;$;10|) $))
              (57 . |Zero|) (61 . |size?|) |FR;zero?;$B;11| |FR;one?;$B;13|
              (67 . |coerce|) (72 . |coerce|) |FR;coerce;I$;15|
              (77 . |characteristic|) |FR;characteristic;Nni;16| |FR;*;3$;30|
              |FR;*;I2$;17| |FR;*;R2$;18|
              (|Record| (|:| |factor| 6) (|:| |exponent| 34)) (|List| 57)
              |FR;factors;$L;19| (81 . ^) (87 . *) |FR;expand;$R;20|
              (|Mapping| 16 9 9) (93 . |sort!|) (99 . |setrest!|)
              (105 . |setfirst!|) |FR;unitNormalize;2$;49| |FR;makeFR;RL$;21|
              (111 . |rational?|) (|Fraction| 24) (116 . |rational|)
              (|Union| 70 '"failed") (121 . |rationalIfCan|) (126 . |convert|)
              (131 . |coerce|) (136 . ^) (142 . *) (148 . |One|) (152 . *)
              (158 . |elt|) (164 . |elt|) (|Equation| $$) (170 . |lhs|)
              (175 . |rhs|) (|Equation| 6) (180 . =) (|List| 85) (186 . |eval|)
              (|List| 148) (192 . |eval|) (|List| 26) (|List| 6) (198 . |eval|)
              (205 . |eval|) (|Float|) (212 . |convert|) (217 . ^) (223 . *)
              (229 . |One|) (233 . |convert|) (|DoubleFloat|) (238 . |convert|)
              (243 . |convert|) (248 . |concat!|) |FR;^;$Nni$;31|
              (254 . |coerce|) (259 . |coerce|) (264 . ^) (270 . *)
              (|Mapping| 20 20 20) (|List| 20) (276 . |reduce|)
              |FR;coerce;$Of;32| |FR;retract;$R;33| (|Union| 6 '"failed")
              |FR;retractIfCan;$U;34| (282 . <) (288 . |smaller?|)
              (|Factored| 6) (|IntegerFactorizationPackage| 6) (294 . |factor|)
              (299 . |unit?|) (|Factored| $) (304 . |squareFree|) (309 . ~=)
              |FR;=;2$B;40| (315 . -) |FR;-;2$;41| (|Union| $ '"failed")
              (320 . |recip|) |FR;recip;$U;42| (325 . *) |FR;exquo;2$U;47|
              (331 . +) (|Mapping| 6 6) |FR;differentiate;$M$;44|
              |FR;map;M2$;45| (337 . |merge|) |FR;mergeFactors;3$;46|
              (344 . |exquo|) (350 . >)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (356 . |unitNormal|) |FR;unitNormal;$R;48| (361 . |gcd|)
              (367 . +) (373 . |prime?|) (|Equation| $)
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 34) (|Union| 24 '"failed") (|PositiveInteger|)
              (|HashState|) (|SingleInteger|))
           '#(~= 378 |zero?| 384 |unitNormalize| 389 |unitNormal| 394
              |unitCanonical| 399 |unit?| 404 |unit| 409 |subtractIfCan| 414
              |squareFreePart| 420 |squareFree| 425 |sqfrFactor| 430 |sample|
              436 |rightRecip| 440 |rightPower| 445 |retractIfCan| 457
              |retract| 472 |recip| 487 |rationalIfCan| 492 |rational?| 497
              |rational| 502 |primeFactor| 507 |prime?| 513 |opposite?| 518
              |one?| 524 |numberOfFactors| 529 |nilFactor| 534 |mergeFactors|
              540 |map| 546 |makeFR| 552 |leftRecip| 558 |leftPower| 563
              |lcmCoef| 575 |lcm| 581 |latex| 592 |irreducibleFactor| 597
              |hashUpdate!| 603 |hash| 609 |gcdPolynomial| 614 |gcd| 620
              |flagFactor| 631 |factors| 638 |factorList| 643 |factor| 648
              |exquo| 653 |expand| 659 |eval| 664 |elt| 744 |differentiate| 756
              |convert| 806 |commutator| 821 |coerce| 827 |characteristic| 852
              |associator| 856 |associates?| 863 |antiCommutator| 869
              |annihilate?| 875 ^ 881 |Zero| 893 |One| 897 D 901 = 951 - 957 +
              968 * 974)
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
                 (|PartialDifferentialRing| 26) (|DifferentialRing|) (|Ring|)
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
                 (|InnerEvalable| 26 6) (|InnerEvalable| 6 6) (|Eltable| 6 $$)
                 (|RetractableTo| 70) (|RetractableTo| 24)
                 (|InnerEvalable| 26 $$) (|InnerEvalable| $$ $$)
                 (|Eltable| $$ $$) (|ConvertibleTo| 13) (|ConvertibleTo| 101)
                 (|ConvertibleTo| 95))
              (|makeByteWordVec2| 155
                                  '(1 6 13 0 14 0 6 0 15 2 6 16 0 0 17 1 20 18
                                    19 21 1 22 13 13 23 1 13 0 24 25 1 13 0 26
                                    27 2 6 16 0 0 28 2 13 0 0 29 30 1 0 13 0 31
                                    1 6 16 0 40 0 6 0 45 2 10 16 0 34 46 1 6 0
                                    24 49 1 0 0 6 50 0 6 34 52 2 6 0 0 34 60 2
                                    6 0 0 0 61 2 10 0 63 0 64 2 10 0 0 0 65 2
                                    10 9 0 9 66 1 0 16 0 69 1 0 70 0 71 1 0 72
                                    0 73 1 6 24 0 74 1 70 0 24 75 2 70 0 0 24
                                    76 2 70 0 0 70 77 0 70 0 78 2 70 0 24 0 79
                                    2 0 0 0 6 80 2 0 0 0 0 81 1 82 2 0 83 1 82
                                    2 0 84 2 85 0 6 6 86 2 0 0 0 87 88 2 0 0 0
                                    89 90 3 0 0 0 91 92 93 3 0 0 0 91 29 94 1 6
                                    95 0 96 2 95 0 0 24 97 2 95 0 0 0 98 0 95 0
                                    99 1 0 95 0 100 1 6 101 0 102 1 0 101 0 103
                                    2 10 0 0 0 104 1 6 20 0 106 1 34 20 0 107 2
                                    20 0 0 0 108 2 20 0 0 0 109 2 111 20 110 0
                                    112 2 6 16 0 0 117 2 6 16 0 0 118 1 120 119
                                    6 121 1 6 16 0 122 1 6 123 0 124 2 34 16 0
                                    0 125 1 6 0 0 127 1 6 129 0 130 2 6 0 24 0
                                    132 2 0 0 0 0 134 3 10 0 63 0 0 138 2 6 129
                                    0 0 140 2 24 16 0 0 141 1 6 142 0 143 2 0 0
                                    0 0 145 2 6 0 0 0 146 1 0 16 0 147 2 0 16 0
                                    0 1 1 0 16 0 47 1 0 0 0 67 1 0 142 0 144 1
                                    0 0 0 1 1 0 16 0 41 1 0 6 0 12 2 0 129 0 0
                                    1 1 12 0 0 1 1 12 123 0 1 2 0 0 6 34 37 0 0
                                    0 1 1 0 129 0 1 2 0 0 0 34 1 2 0 0 0 153 1
                                    1 6 72 0 1 1 7 152 0 1 1 0 115 0 116 1 6 70
                                    0 1 1 7 24 0 1 1 0 6 0 114 1 0 129 0 131 1
                                    16 72 0 73 1 16 16 0 69 1 16 70 0 71 2 0 0
                                    6 34 39 1 12 16 0 147 2 0 16 0 0 1 1 0 16 0
                                    48 1 0 34 0 42 2 0 0 6 34 36 2 0 0 0 0 139
                                    2 0 0 135 0 137 2 0 0 6 10 68 1 0 129 0 1 2
                                    0 0 0 34 1 2 0 0 0 153 1 2 13 150 0 0 1 1
                                    13 0 29 1 2 13 0 0 0 1 1 0 19 0 1 2 0 0 6
                                    34 38 2 0 154 154 0 1 1 0 155 0 1 2 13 149
                                    149 149 1 1 13 0 29 1 2 13 0 0 0 145 3 0 0
                                    6 34 8 35 1 0 58 0 59 1 0 10 0 11 1 12 123
                                    0 1 2 0 129 0 0 133 1 0 6 0 62 2 9 0 0 148
                                    1 2 9 0 0 89 90 3 9 0 0 0 0 1 3 9 0 0 29 29
                                    1 2 4 0 0 85 1 2 4 0 0 87 88 3 4 0 0 6 6 1
                                    3 4 0 0 92 92 1 3 8 0 0 91 29 94 3 8 0 0 26
                                    0 1 3 3 0 0 91 92 93 3 3 0 0 26 6 1 2 10 0
                                    0 0 81 2 5 0 0 6 80 2 2 0 0 34 1 1 2 0 0 1
                                    3 1 0 0 91 151 1 2 1 0 0 91 1 3 1 0 0 26 34
                                    1 2 1 0 0 26 1 2 0 0 0 135 136 3 0 0 0 135
                                    34 1 1 11 13 0 31 1 15 101 0 103 1 15 95 0
                                    100 2 0 0 0 0 1 1 6 0 70 1 1 0 0 6 50 1 0 0
                                    0 1 1 0 0 24 51 1 0 20 0 113 0 0 34 53 3 0
                                    0 0 0 0 1 2 0 16 0 0 1 2 0 0 0 0 1 2 0 16 0
                                    0 1 2 0 0 0 34 105 2 0 0 0 153 1 0 0 0 44 0
                                    0 0 43 2 2 0 0 34 1 1 2 0 0 1 3 1 0 0 26 34
                                    1 3 1 0 0 91 151 1 2 1 0 0 26 1 2 1 0 0 91
                                    1 3 0 0 0 135 34 1 2 0 0 0 135 1 2 0 16 0 0
                                    126 2 0 0 0 0 1 1 0 0 0 128 2 0 0 0 0 134 2
                                    0 0 6 0 56 2 0 0 0 6 1 2 0 0 34 0 1 2 0 0
                                    24 0 55 2 0 0 0 0 54 2 0 0 153 0 1)))))
           '|lookupComplete|)) 
