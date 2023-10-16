
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

(SDEFUN |FR;nilFactor;RNni$;2| ((|r| R) (|i| |NonNegativeInteger|) ($ $))
        (SPADCALL |r| |i| (CONS 0 "nil") (QREFELT $ 33))) 

(SDEFUN |FR;sqfrFactor;RNni$;3| ((|r| R) (|i| |NonNegativeInteger|) ($ $))
        (SPADCALL |r| |i| (CONS 1 "sqfr") (QREFELT $ 33))) 

(SDEFUN |FR;irreducibleFactor;RNni$;4|
        ((|r| R) (|i| |NonNegativeInteger|) ($ $))
        (SPADCALL |r| |i| (CONS 2 "irred") (QREFELT $ 33))) 

(SDEFUN |FR;primeFactor;RNni$;5| ((|r| R) (|i| |NonNegativeInteger|) ($ $))
        (SPADCALL |r| |i| (CONS 3 "prime") (QREFELT $ 33))) 

(SDEFUN |FR;unit?;$B;6| ((|u| $) ($ |Boolean|))
        (COND ((NULL (QCDR |u|)) (NULL (SPADCALL (QCAR |u|) (QREFELT $ 38))))
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
              (LIST (VECTOR (CONS 0 "nil") (|spadConstant| $ 43) 1)))) 

(SDEFUN |FR;zero?;$B;11| ((|u| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCDR |u|) 1 (QREFELT $ 44))
          (COND
           ((QEQCAR (QVELT (|SPADfirst| (QCDR |u|)) 0) 0)
            (COND
             ((SPADCALL (QVELT (|SPADfirst| (QCDR |u|)) 1) (QREFELT $ 38))
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
        (SPADCALL (SPADCALL |j| (QREFELT $ 47)) (QREFELT $ 48))) 

(SDEFUN |FR;characteristic;Nni;16| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 50))) 

(SDEFUN |FR;*;I2$;17| ((|i| |Integer|) (|u| $) ($ $))
        (SPADCALL (SPADCALL |i| (QREFELT $ 49)) |u| (QREFELT $ 52))) 

(SDEFUN |FR;*;R2$;18| ((|r| R) (|u| $) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 48)) |u| (QREFELT $ 52))) 

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
                                             (QREFELT $ 58))
                                   . #5#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 59))
                                     . #5#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #5#)
                                (LETT #1# 'T . #5#)))))))
                          (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 15))))
                    (QREFELT $ 59))))) 

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
            ((SPADCALL |u| (|spadConstant| $ 43) (QREFELT $ 17))
             (|spadConstant| $ 42))
            ((NULL |x|) (|FR;mkFF| |u| NIL $))
            (#8='T
             (SEQ
              (LETT |x|
                    (SPADCALL (CONS (|function| |FR;LispLessP|) $) |x|
                              (QREFELT $ 62))
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
                                                       (QREFELT $ 63))
                                             (EXIT
                                              (LETT |x| (CDR |x|) . #9#))))
                                           ((SPADCALL (QVELT |f1| 1)
                                                      (|spadConstant| $ 43)
                                                      (QREFELT $ 17))
                                            (PROGN
                                             (LETT #7# (|spadConstant| $ 42)
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
                                             (SPADCALL |p| |f| (QREFELT $ 64))
                                             (SPADCALL |p| (CDR |x|)
                                                       (QREFELT $ 63))
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
                                              (QREFELT $ 65)))))))))))))))
          #10# (EXIT #7#)))) 

(PUT '|FR;rational?;$B;22| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |FR;rational?;$B;22| ((|x| $) ($ |Boolean|)) 'T) 

(SDEFUN |FR;rationalIfCan;$U;23|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (CONS 0 (SPADCALL |x| (QREFELT $ 69)))) 

(SDEFUN |FR;rational;$F;24| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPROG
         ((#1=#:G322 NIL) (#2=#:G321 #3=(|Fraction| (|Integer|)))
          (#4=#:G323 #3#) (#5=#:G325 NIL) (|f| NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 72))
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
                                     (SPADCALL (QVELT |f| 1) (QREFELT $ 72))
                                     (QREFELT $ 73))
                                    (QVELT |f| 2) (QREFELT $ 74))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 75))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 76))))
                    (QREFELT $ 77))))) 

(SDEFUN |FR;elt;3$;25| ((|x| $) (|v| $) ($ $))
        (SPADCALL |x| (SPADCALL |v| (QREFELT $ 60)) (QREFELT $ 78))) 

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
                                           (SPADCALL |e| (QREFELT $ 81))
                                           (QREFELT $ 60))
                                          (SPADCALL
                                           (SPADCALL |e| (QREFELT $ 82))
                                           (QREFELT $ 60))
                                          (QREFELT $ 84))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 86))))) 

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
                                        (CONS (SPADCALL |v| (QREFELT $ 60))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 91))))) 

(SDEFUN |FR;convert;$F;28| ((|x| $) ($ |Float|))
        (SPROG
         ((#1=#:G341 NIL) (#2=#:G340 #3=(|Float|)) (#4=#:G342 #3#)
          (#5=#:G344 NIL) (|f| NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 94))
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
                                    (SPADCALL (QVELT |f| 1) (QREFELT $ 94))
                                    (QVELT |f| 2) (QREFELT $ 95))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 96))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 97))))
                    (QREFELT $ 96))))) 

(SDEFUN |FR;convert;$Df;29| ((|x| $) ($ |DoubleFloat|))
        (SPROG
         ((#1=#:G351 NIL) (#2=#:G350 #3=(|DoubleFloat|)) (#4=#:G352 #3#)
          (#5=#:G354 NIL) (|f| NIL))
         (SEQ
          (|mul_DF| (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 100))
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
                                    (SPADCALL (QVELT |f| 1) (QREFELT $ 100))
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
           ((OR (SPADCALL |u| (QREFELT $ 45)) (SPADCALL |v| (QREFELT $ 45)))
            |u|)
           ('T
            (COND ((SPADCALL |u| (QREFELT $ 46)) |v|)
                  ((SPADCALL |v| (QREFELT $ 46)) |u|)
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
                                    (QREFELT $ 102))
                          . #8#)
                    (EXIT
                     (|FR;mkFF|
                      (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                                (SPADCALL |v| (QREFELT $ 12)) (QREFELT $ 59))
                      |res| $)))))))))) 

(SDEFUN |FR;^;$Nni$;31| ((|u| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G390 NIL) (|x| NIL) (#2=#:G389 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 41)) ((EQL |n| 1) |u|)
                      ('T
                       (|FR;mkFF|
                        (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |n|
                                  (QREFELT $ 58))
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
            (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 104)))
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
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 104))
                                 |l|)
                                . #2#))
                         ('T
                          (LETT |l|
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 104))
                                  (SPADCALL (QVELT |rec| 2) (QREFELT $ 105))
                                  (QREFELT $ 106))
                                 |l|)
                                . #2#)))))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((NULL |l|)
                    (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 104)))
                   (#3#
                    (SEQ
                     (LETT |e|
                           (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                                 (#3#
                                  (SPADCALL (ELT $ 107) |l| (QREFELT $ 110))))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL (|spadConstant| $ 15)
                                  (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 17))
                        |e|)
                       (#3#
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 104))
                         |e| (QREFELT $ 107))))))))))))))) 

(SDEFUN |FR;retract;$R;33| ((|u| $) ($ R)) (SPADCALL |u| (QREFELT $ 60))) 

(SDEFUN |FR;retractIfCan;$U;34| ((|u| $) ($ |Union| R "failed"))
        (CONS 0 (SPADCALL |u| (QREFELT $ 60)))) 

(SDEFUN |FR;LispLessP|
        ((|y| |Record|
          (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
          (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))
         (|y1| |Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
          (|:| |exponent| (|NonNegativeInteger|)))
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

(SDEFUN |FR;coerce;R$;37| ((|r| R) ($ $)) (SPADCALL |r| (QREFELT $ 119))) 

(SDEFUN |FR;coerce;R$;38| ((|r| R) ($ $))
        (COND ((SPADCALL |r| (QREFELT $ 38)) (|spadConstant| $ 42))
              ((SPADCALL |r| (QREFELT $ 120)) (|FR;mkFF| |r| NIL $))
              ((|HasCategory| (QREFELT $ 6) '(|Field|))
               (|error| "zero divisor in a field"))
              ('T (SPADCALL (SPADCALL |r| (QREFELT $ 122)) (QREFELT $ 65))))) 

(SDEFUN |FR;coerce;R$;39| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 15) (QREFELT $ 17))
          (|spadConstant| $ 41))
         ('T
          (SPADCALL
           (|FR;mkFF| (|spadConstant| $ 15)
            (LIST (VECTOR (CONS 0 "nil") |r| 1)) $)
           (QREFELT $ 65))))) 

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
                                      (QREFELT $ 123))
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
        (COND ((SPADCALL |u| (QREFELT $ 45)) |u|)
              ('T
               (|FR;mkFF|
                (SPADCALL (SPADCALL |u| (QREFELT $ 12)) (QREFELT $ 125))
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
                                   (QREFELT $ 128))
                         |FR;recip;$U;42|)
                   (EXIT
                    (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                          ('T (CONS 0 (|FR;mkFF| (QCDR |r|) NIL $))))))))))) 

(SDEFUN |FR;flagFactor;RNniU$;43|
        ((|r| R) (|i| |NonNegativeInteger|)
         (|fl| |Union| "nil" "sqfr" "irred" "prime") ($ $))
        (COND ((ZEROP |i|) (|spadConstant| $ 41))
              ((SPADCALL |r| (QREFELT $ 38)) (|spadConstant| $ 42))
              ('T
               (SPADCALL
                (|FR;mkFF| (|spadConstant| $ 15) (LIST (VECTOR |fl| |r| |i|))
                 $)
                (QREFELT $ 65))))) 

(SDEFUN |FR;differentiate;$M$;44| ((|u| $) (|deriv| |Mapping| R R) ($ $))
        (SPROG
         ((#1=#:G477 NIL) (#2=#:G476 ($)) (#3=#:G478 ($)) (#4=#:G480 NIL)
          (#5=#:G485 NIL) (|fact| NIL) (|ans| ($)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |deriv|)
                          (|FR;mkFF| (|spadConstant| $ 15)
                           (SPADCALL |u| (QREFELT $ 11)) $)
                          (QREFELT $ 54))
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
                                               (QREFELT $ 130))
                                     (PROG2
                                         (LETT #4#
                                               (SPADCALL |u|
                                                         (SPADCALL
                                                          (QVELT |fact| 1) 1
                                                          (QREFELT $ 34))
                                                         (QREFELT $ 131))
                                               . #6#)
                                         (QCDR #4#)
                                       (|check_union2| (QEQCAR #4# 0) $
                                                       (|Union| $ "failed")
                                                       #4#))
                                     (QREFELT $ 54))
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
          (EXIT (SPADCALL (|spadConstant| $ 15) |l| (QREFELT $ 66)))))) 

(SDEFUN |FR;mergeFactors;3$;46| ((|f| $) (|g| $) ($ $))
        (|FR;mkFF|
         (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (SPADCALL |g| (QREFELT $ 12))
                   (QREFELT $ 59))
         (SPADCALL (CONS (|function| |FR;LispLessP|) $)
                   (SPADCALL |f| (QREFELT $ 11)) (SPADCALL |g| (QREFELT $ 11))
                   (QREFELT $ 136))
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
                                      (QREFELT $ 138))
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
                                           (QREFELT $ 102))
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
                 (QREFELT $ 128))
                . #3#)
          (EXIT
           (COND
            ((QEQCAR |ur| 1)
             (VECTOR (|spadConstant| $ 41) |u| (|spadConstant| $ 41)))
            ('T
             (SEQ (LETT |as| (QCDR |ur|) . #3#) (LETT |vl| NIL . #3#)
                  (SEQ (LETT |x| NIL . #3#)
                       (LETT #2# (SPADCALL |u| (QREFELT $ 11)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ucar| (SPADCALL (QVELT |x| 1) (QREFELT $ 141))
                              . #3#)
                        (LETT |e| (QVELT |x| 2) . #3#)
                        (LETT |un|
                              (SPADCALL |un|
                                        (SPADCALL (QVELT |ucar| 0) |e|
                                                  (QREFELT $ 58))
                                        (QREFELT $ 59))
                              . #3#)
                        (LETT |as|
                              (SPADCALL |as|
                                        (SPADCALL (QVELT |ucar| 2) |e|
                                                  (QREFELT $ 58))
                                        (QREFELT $ 59))
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
          (LETT |uca| (SPADCALL |u| (QREFELT $ 142)) |FR;unitNormalize;2$;49|)
          (EXIT
           (|FR;mkFF|
            (SPADCALL (SPADCALL (QVELT |uca| 0) (QREFELT $ 12))
                      (SPADCALL (QVELT |uca| 1) (QREFELT $ 12)) (QREFELT $ 59))
            (SPADCALL (QVELT |uca| 1) (QREFELT $ 11)) $))))) 

(SDEFUN |FR;+;3$;50| ((|u| $) (|v| $) ($ $))
        (SPROG ((#1=#:G561 NIL) (|u1| ($)))
               (SEQ
                (COND ((SPADCALL |u| (QREFELT $ 45)) |v|)
                      ((SPADCALL |v| (QREFELT $ 45)) |u|)
                      ('T
                       (SEQ
                        (LETT |u1| (SPADCALL |u| |v| (QREFELT $ 143))
                              . #2=(|FR;+;3$;50|))
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (PROG2
                                (LETT #1# (SPADCALL |u| |u1| (QREFELT $ 131))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) $
                                              (|Union| $ #3="failed") #1#))
                            (QREFELT $ 60))
                           (SPADCALL
                            (PROG2
                                (LETT #1# (SPADCALL |v| |u1| (QREFELT $ 131))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) $ (|Union| $ #3#)
                                              #1#))
                            (QREFELT $ 60))
                           (QREFELT $ 144))
                          |u1| (QREFELT $ 54))))))))) 

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
           ((OR (SPADCALL |u| (QREFELT $ 46)) (SPADCALL |v| (QREFELT $ 46)))
            |u|)
           ('T
            (COND ((SPADCALL |u| (QREFELT $ 45)) |v|)
                  ((SPADCALL |v| (QREFELT $ 45)) |u|)
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
        (COND ((SPADCALL |u| (QREFELT $ 45)) |v|)
              ((SPADCALL |v| (QREFELT $ 45)) |u|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |u| (QREFELT $ 60))
                          (SPADCALL |v| (QREFELT $ 60)) (QREFELT $ 144))
                1 (QREFELT $ 36))))) 

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
                ((SPADCALL |l| 1 (QREFELT $ 44))
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
          (LETT $ (GETREFV 154) . #2#)
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
            (QSETREFV $ 29 (CONS (|dispatchFunction| |FR;convert;$If;1|) $))))
          (QSETREFV $ 30 (|HasCategory| |#1| '(|OrderedSet|)))
          (QSETREFV $ 31 (|HasCategory| |#1| '(|Comparable|)))
          (COND
           ((|testBitVector| |pv$| 16)
            (PROGN
             (QSETREFV $ 67 (CONS (|dispatchFunction| |FR;rational?;$B;22|) $))
             (QSETREFV $ 71
                       (CONS (|dispatchFunction| |FR;rationalIfCan;$U;23|) $))
             (QSETREFV $ 69
                       (CONS (|dispatchFunction| |FR;rational;$F;24|) $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 79 (CONS (|dispatchFunction| |FR;elt;3$;25|) $))))
          (COND
           ((|testBitVector| |pv$| 4)
            (QSETREFV $ 88 (CONS (|dispatchFunction| |FR;eval;$L$;26|) $))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 92 (CONS (|dispatchFunction| |FR;eval;$LL$;27|) $))))
          (COND
           ((|testBitVector| |pv$| 15)
            (PROGN
             (QSETREFV $ 98 (CONS (|dispatchFunction| |FR;convert;$F;28|) $))
             (QSETREFV $ 101
                       (CONS (|dispatchFunction| |FR;convert;$Df;29|) $)))))
          (COND
           ((|testBitVector| |pv$| 16)
            (QSETREFV $ 48 (CONS (|dispatchFunction| |FR;coerce;R$;37|) $)))
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 48 (CONS (|dispatchFunction| |FR;coerce;R$;38|) $)))
           ('T
            (QSETREFV $ 48 (CONS (|dispatchFunction| |FR;coerce;R$;39|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 132 (CONS (|dispatchFunction| |FR;+;3$;50|) $))
             (QSETREFV $ 143 (CONS (|dispatchFunction| |FR;gcd;3$;51|) $))))
           ('T (QSETREFV $ 132 (CONS (|dispatchFunction| |FR;+;3$;52|) $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 145 (CONS (|dispatchFunction| |FR;prime?;$B;53|) $))))
          $))) 

(MAKEPROP '|Factored| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 8) (|:| |factor| 6) (|:| |exponent| 32))
              (|List| 9) |FR;factorList;$L;7| |FR;unit;$R;8| (|InputForm|)
              (0 . |convert|) (5 . |One|) (|Boolean|) (9 . =) (|Void|)
              (|String|) (|OutputForm|) (15 . |messagePrint|) (|Symbol|)
              (20 . |convert|) (|List| $) (25 . |binary|) (|Integer|)
              (31 . |convert|) (36 . ~=) (42 . |convert|) '|orderedR?|
              '|comparableR?| (|NonNegativeInteger|) |FR;flagFactor;RNniU$;43|
              |FR;nilFactor;RNni$;2| |FR;sqfrFactor;RNni$;3|
              |FR;irreducibleFactor;RNni$;4| |FR;primeFactor;RNni$;5|
              (47 . |zero?|) |FR;unit?;$B;6| |FR;numberOfFactors;$Nni;9|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;One;$;12|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;Zero;$;10|) $))
              (52 . |Zero|) (56 . |size?|) |FR;zero?;$B;11| |FR;one?;$B;13|
              (62 . |coerce|) (67 . |coerce|) |FR;coerce;I$;15|
              (72 . |characteristic|) |FR;characteristic;Nni;16| |FR;*;3$;30|
              |FR;*;I2$;17| |FR;*;R2$;18|
              (|Record| (|:| |factor| 6) (|:| |exponent| 32)) (|List| 55)
              |FR;factors;$L;19| (76 . ^) (82 . *) |FR;expand;$R;20|
              (|Mapping| 16 9 9) (88 . |sort!|) (94 . |setrest!|)
              (100 . |setfirst!|) |FR;unitNormalize;2$;49| |FR;makeFR;RL$;21|
              (106 . |rational?|) (|Fraction| 26) (111 . |rational|)
              (|Union| 68 '"failed") (116 . |rationalIfCan|) (121 . |convert|)
              (126 . |coerce|) (131 . ^) (137 . *) (143 . |One|) (147 . *)
              (153 . |elt|) (159 . |elt|) (|Equation| $$) (165 . |lhs|)
              (170 . |rhs|) (|Equation| 6) (175 . =) (|List| 83) (181 . |eval|)
              (|List| 146) (187 . |eval|) (|List| 22) (|List| 6) (193 . |eval|)
              (200 . |eval|) (|Float|) (207 . |convert|) (212 . ^) (218 . *)
              (224 . |One|) (228 . |convert|) (|DoubleFloat|) (233 . |convert|)
              (238 . |convert|) (243 . |concat!|) |FR;^;$Nni$;31|
              (249 . |coerce|) (254 . |coerce|) (259 . ^) (265 . *)
              (|Mapping| 20 20 20) (|List| 20) (271 . |reduce|)
              |FR;coerce;$Of;32| |FR;retract;$R;33| (|Union| 6 '"failed")
              |FR;retractIfCan;$U;34| (277 . <) (283 . |smaller?|)
              (|Factored| 6) (|IntegerFactorizationPackage| 6) (289 . |factor|)
              (294 . |unit?|) (|Factored| $) (299 . |squareFree|) (304 . ~=)
              |FR;=;2$B;40| (310 . -) |FR;-;2$;41| (|Union| $ '"failed")
              (315 . |recip|) |FR;recip;$U;42| (320 . *) |FR;exquo;2$U;47|
              (326 . +) (|Mapping| 6 6) |FR;differentiate;$M$;44|
              |FR;map;M2$;45| (332 . |merge|) |FR;mergeFactors;3$;46|
              (339 . |exquo|) (345 . >)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (351 . |unitNormal|) |FR;unitNormal;$R;48| (356 . |gcd|)
              (362 . +) (368 . |prime?|) (|Equation| $)
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 32) (|Union| 26 '"failed") (|PositiveInteger|)
              (|HashState|) (|SingleInteger|))
           '#(~= 373 |zero?| 379 |unitNormalize| 384 |unitNormal| 389
              |unitCanonical| 394 |unit?| 399 |unit| 404 |subtractIfCan| 409
              |squareFreePart| 415 |squareFree| 420 |sqfrFactor| 425 |sample|
              431 |rightRecip| 435 |rightPower| 440 |retractIfCan| 452
              |retract| 467 |recip| 482 |rationalIfCan| 487 |rational?| 492
              |rational| 497 |primeFactor| 502 |prime?| 508 |opposite?| 513
              |one?| 519 |numberOfFactors| 524 |nilFactor| 529 |mergeFactors|
              535 |map| 541 |makeFR| 547 |leftRecip| 553 |leftPower| 558
              |lcmCoef| 570 |lcm| 576 |latex| 587 |irreducibleFactor| 592
              |hashUpdate!| 598 |hash| 604 |gcdPolynomial| 609 |gcd| 615
              |flagFactor| 626 |factors| 633 |factorList| 638 |factor| 643
              |exquo| 648 |expand| 654 |eval| 659 |elt| 739 |differentiate| 751
              |convert| 801 |commutator| 816 |coerce| 822 |characteristic| 847
              |associator| 851 |associates?| 858 |antiCommutator| 864
              |annihilate?| 870 ^ 876 |Zero| 888 |One| 892 D 896 = 946 - 952 +
              963 * 969)
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
                 (|RetractableTo| 68) (|RetractableTo| 26)
                 (|InnerEvalable| 22 $$) (|InnerEvalable| $$ $$)
                 (|Eltable| $$ $$) (|ConvertibleTo| 13) (|ConvertibleTo| 99)
                 (|ConvertibleTo| 93))
              (|makeByteWordVec2| 153
                                  '(1 6 13 0 14 0 6 0 15 2 6 16 0 0 17 1 20 18
                                    19 21 1 13 0 22 23 2 13 0 0 24 25 1 13 0 26
                                    27 2 6 16 0 0 28 1 0 13 0 29 1 6 16 0 38 0
                                    6 0 43 2 10 16 0 32 44 1 6 0 26 47 1 0 0 6
                                    48 0 6 32 50 2 6 0 0 32 58 2 6 0 0 0 59 2
                                    10 0 61 0 62 2 10 0 0 0 63 2 10 9 0 9 64 1
                                    0 16 0 67 1 0 68 0 69 1 0 70 0 71 1 6 26 0
                                    72 1 68 0 26 73 2 68 0 0 26 74 2 68 0 0 68
                                    75 0 68 0 76 2 68 0 26 0 77 2 0 0 0 6 78 2
                                    0 0 0 0 79 1 80 2 0 81 1 80 2 0 82 2 83 0 6
                                    6 84 2 0 0 0 85 86 2 0 0 0 87 88 3 0 0 0 89
                                    90 91 3 0 0 0 89 24 92 1 6 93 0 94 2 93 0 0
                                    26 95 2 93 0 0 0 96 0 93 0 97 1 0 93 0 98 1
                                    6 99 0 100 1 0 99 0 101 2 10 0 0 0 102 1 6
                                    20 0 104 1 32 20 0 105 2 20 0 0 0 106 2 20
                                    0 0 0 107 2 109 20 108 0 110 2 6 16 0 0 115
                                    2 6 16 0 0 116 1 118 117 6 119 1 6 16 0 120
                                    1 6 121 0 122 2 32 16 0 0 123 1 6 0 0 125 1
                                    6 127 0 128 2 6 0 26 0 130 2 0 0 0 0 132 3
                                    10 0 61 0 0 136 2 6 127 0 0 138 2 26 16 0 0
                                    139 1 6 140 0 141 2 0 0 0 0 143 2 6 0 0 0
                                    144 1 0 16 0 145 2 0 16 0 0 1 1 0 16 0 45 1
                                    0 0 0 65 1 0 140 0 142 1 0 0 0 1 1 0 16 0
                                    39 1 0 6 0 12 2 0 127 0 0 1 1 12 0 0 1 1 12
                                    121 0 1 2 0 0 6 32 35 0 0 0 1 1 0 127 0 1 2
                                    0 0 0 32 1 2 0 0 0 151 1 1 6 70 0 1 1 7 150
                                    0 1 1 0 113 0 114 1 6 68 0 1 1 7 26 0 1 1 0
                                    6 0 112 1 0 127 0 129 1 16 70 0 71 1 16 16
                                    0 67 1 16 68 0 69 2 0 0 6 32 37 1 12 16 0
                                    145 2 0 16 0 0 1 1 0 16 0 46 1 0 32 0 40 2
                                    0 0 6 32 34 2 0 0 0 0 137 2 0 0 133 0 135 2
                                    0 0 6 10 66 1 0 127 0 1 2 0 0 0 32 1 2 0 0
                                    0 151 1 2 13 148 0 0 1 1 13 0 24 1 2 13 0 0
                                    0 1 1 0 19 0 1 2 0 0 6 32 36 2 0 152 152 0
                                    1 1 0 153 0 1 2 13 147 147 147 1 1 13 0 24
                                    1 2 13 0 0 0 143 3 0 0 6 32 8 33 1 0 56 0
                                    57 1 0 10 0 11 1 12 121 0 1 2 0 127 0 0 131
                                    1 0 6 0 60 2 9 0 0 146 1 2 9 0 0 87 88 3 9
                                    0 0 0 0 1 3 9 0 0 24 24 1 2 4 0 0 83 1 2 4
                                    0 0 85 86 3 4 0 0 6 6 1 3 4 0 0 90 90 1 3 8
                                    0 0 89 24 92 3 8 0 0 22 0 1 3 3 0 0 89 90
                                    91 3 3 0 0 22 6 1 2 10 0 0 0 79 2 5 0 0 6
                                    78 2 2 0 0 32 1 1 2 0 0 1 3 1 0 0 89 149 1
                                    2 1 0 0 89 1 3 1 0 0 22 32 1 2 1 0 0 22 1 2
                                    0 0 0 133 134 3 0 0 0 133 32 1 1 11 13 0 29
                                    1 15 99 0 101 1 15 93 0 98 2 0 0 0 0 1 1 6
                                    0 68 1 1 0 0 6 48 1 0 0 0 1 1 0 0 26 49 1 0
                                    20 0 111 0 0 32 51 3 0 0 0 0 0 1 2 0 16 0 0
                                    1 2 0 0 0 0 1 2 0 16 0 0 1 2 0 0 0 32 103 2
                                    0 0 0 151 1 0 0 0 42 0 0 0 41 2 2 0 0 32 1
                                    1 2 0 0 1 3 1 0 0 22 32 1 3 1 0 0 89 149 1
                                    2 1 0 0 22 1 2 1 0 0 89 1 3 0 0 0 133 32 1
                                    2 0 0 0 133 1 2 0 16 0 0 124 2 0 0 0 0 1 1
                                    0 0 0 126 2 0 0 0 0 132 2 0 0 6 0 54 2 0 0
                                    0 6 1 2 0 0 32 0 1 2 0 0 26 0 53 2 0 0 0 0
                                    52 2 0 0 151 0 1)))))
           '|lookupComplete|)) 
