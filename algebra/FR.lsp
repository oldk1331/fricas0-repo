
(/VERSIONCHECK 2) 

(DEFUN |FR;convert;$If;1| (|x| $)
  (PROG (|l| |iFun| |iExpon| |iFactor| #1=#:G194 |rec| |lf|)
    (RETURN
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
                   ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
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
                       (LETT |iExpon| (SPADCALL (QVELT |rec| 2) (QREFELT $ 27))
                             . #2#)
                       (LETT |iFun|
                             (COND
                              ((QEQCAR (QVELT |rec| 0) 0)
                               (LIST (SPADCALL '|nilFactor| (QREFELT $ 23))
                                     |iFactor| |iExpon|))
                              ((QEQCAR (QVELT |rec| 0) 1)
                               (LIST (SPADCALL '|sqfrFactor| (QREFELT $ 23))
                                     |iFactor| |iExpon|))
                              ((QEQCAR (QVELT |rec| 0) 3)
                               (LIST (SPADCALL '|primeFactor| (QREFELT $ 23))
                                     |iFactor| |iExpon|))
                              ((QEQCAR (QVELT |rec| 0) 2)
                               (LIST
                                (SPADCALL '|irreducibleFactor| (QREFELT $ 23))
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
                                   (QREFELT $ 25)))))))))))))))) 

(DEFUN |FR;nilFactor;RI$;2| (|r| |i| $)
  (SPADCALL |r| |i| (CONS 0 "nil") (QREFELT $ 32))) 

(DEFUN |FR;sqfrFactor;RI$;3| (|r| |i| $)
  (SPADCALL |r| |i| (CONS 1 "sqfr") (QREFELT $ 32))) 

(DEFUN |FR;irreducibleFactor;RI$;4| (|r| |i| $)
  (SPADCALL |r| |i| (CONS 2 "irred") (QREFELT $ 32))) 

(DEFUN |FR;primeFactor;RI$;5| (|r| |i| $)
  (SPADCALL |r| |i| (CONS 3 "prime") (QREFELT $ 32))) 

(DEFUN |FR;unit?;$B;6| (|u| $)
  (COND
   ((NULL (QCDR |u|))
    (COND ((SPADCALL (QCAR |u|) (QREFELT $ 37)) 'NIL) (#1='T 'T)))
   (#1# 'NIL))) 

(PUT '|FR;factorList;$L;7| '|SPADreplace| 'QCDR) 

(DEFUN |FR;factorList;$L;7| (|u| $) (QCDR |u|)) 

(PUT '|FR;unit;$R;8| '|SPADreplace| 'QCAR) 

(DEFUN |FR;unit;$R;8| (|u| $) (QCAR |u|)) 

(DEFUN |FR;numberOfFactors;$Nni;9| (|u| $) (LENGTH (QCDR |u|))) 

(DEFUN |FR;Zero;$;10| ($)
  (CONS (|spadConstant| $ 15)
        (LIST (VECTOR (CONS 0 "nil") (|spadConstant| $ 43) 1)))) 

(DEFUN |FR;zero?;$B;11| (|u| $)
  (COND
   ((EQL (LENGTH (QCDR |u|)) 1)
    (COND
     ((QEQCAR (QVELT (|SPADfirst| (QCDR |u|)) 0) 0)
      (COND
       ((SPADCALL (QVELT (|SPADfirst| (QCDR |u|)) 1) (QREFELT $ 37))
        (SPADCALL (QCAR |u|) (|spadConstant| $ 15) (QREFELT $ 17)))
       (#1='T 'NIL)))
     (#1# 'NIL)))
   (#1# 'NIL))) 

(DEFUN |FR;One;$;12| ($) (CONS (|spadConstant| $ 15) NIL)) 

(DEFUN |FR;one?;$B;13| (|u| $)
  (COND
   ((NULL (QCDR |u|))
    (SPADCALL (QCAR |u|) (|spadConstant| $ 15) (QREFELT $ 17)))
   ('T 'NIL))) 

(PUT '|FR;mkFF| '|SPADreplace| 'CONS) 

(DEFUN |FR;mkFF| (|r| |x| $) (CONS |r| |x|)) 

(DEFUN |FR;coerce;I$;15| (|j| $)
  (SPADCALL (SPADCALL |j| (QREFELT $ 46)) (QREFELT $ 47))) 

(DEFUN |FR;characteristic;Nni;16| ($) (SPADCALL (QREFELT $ 49))) 

(DEFUN |FR;*;I2$;17| (|i| |u| $)
  (SPADCALL (SPADCALL |i| (QREFELT $ 48)) |u| (QREFELT $ 51))) 

(DEFUN |FR;*;R2$;18| (|r| |u| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 47)) |u| (QREFELT $ 51))) 

(DEFUN |FR;factors;$L;19| (|u| $)
  (PROG (#1=#:G272 |fe| #2=#:G271)
    (RETURN
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
              (LETT #2# (CONS (CONS (QVELT |fe| 1) (QVELT |fe| 2)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |FR;expand;$R;20| (|u| $) (SPADCALL |u| (QREFELT $ 57))) 

(DEFUN |FR;negexp?| (|x| $)
  (PROG (#1=#:G276 #2=#:G275 #3=#:G277 #4=#:G279 |y|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|FR;negexp?|))
       (SEQ (LETT |y| NIL . #5#) (LETT #4# (SPADCALL |x| (QREFELT $ 11)) . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |y| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# (MINUSP (QVELT |y| 2)) . #5#)
               (COND (#1# (LETT #2# (COND (#2# 'T) ('T #3#)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T 'NIL))))))) 

(DEFUN |FR;makeFR;RL$;22| (|u| |l| $)
  (SPADCALL (|FR;mkFF| |u| (|FR;SimplifyFactorization| |l| $) $)
            (QREFELT $ 59))) 

(PUT '|FR;rational?;$B;23| '|SPADreplace| '(XLAM (|x|) 'T)) 

(DEFUN |FR;rational?;$B;23| (|x| $) 'T) 

(DEFUN |FR;rationalIfCan;$U;24| (|x| $) (CONS 0 (SPADCALL |x| (QREFELT $ 63)))) 

(DEFUN |FR;rational;$F;25| (|x| $)
  (PROG (#1=#:G292 #2=#:G291 #3=#:G293 #4=#:G295 |f|)
    (RETURN
     (SEQ
      (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 66))
                (PROGN
                 (LETT #1# NIL . #5=(|FR;rational;$F;25|))
                 (SEQ (LETT |f| NIL . #5#)
                      (LETT #4# (SPADCALL |x| (QREFELT $ 11)) . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QVELT |f| 1) (QREFELT $ 66))
                                 (QREFELT $ 67))
                                (QVELT |f| 2) (QREFELT $ 68))
                               . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 69)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 70))))
                (QREFELT $ 71)))))) 

(DEFUN |FR;elt;3$;26| (|x| |v| $)
  (SPADCALL |x| (SPADCALL |v| (QREFELT $ 58)) (QREFELT $ 72))) 

(DEFUN |FR;eval;$L$;27| (|x| |l| $)
  (PROG (#1=#:G300 |e| #2=#:G299)
    (RETURN
     (SEQ
      (SPADCALL |x|
                (PROGN
                 (LETT #2# NIL . #3=(|FR;eval;$L$;27|))
                 (SEQ (LETT |e| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |e| (QREFELT $ 75))
                                          (QREFELT $ 58))
                                (SPADCALL (SPADCALL |e| (QREFELT $ 76))
                                          (QREFELT $ 58))
                                (QREFELT $ 78))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 80)))))) 

(DEFUN |FR;eval;$LL$;28| (|x| |ls| |lv| $)
  (PROG (#1=#:G304 |v| #2=#:G303)
    (RETURN
     (SEQ
      (SPADCALL |x| |ls|
                (PROGN
                 (LETT #2# NIL . #3=(|FR;eval;$LL$;28|))
                 (SEQ (LETT |v| NIL . #3#) (LETT #1# |lv| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 58)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 85)))))) 

(DEFUN |FR;convert;$F;29| (|x| $)
  (PROG (#1=#:G311 #2=#:G310 #3=#:G312 #4=#:G314 |f|)
    (RETURN
     (SEQ
      (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 88))
                (PROGN
                 (LETT #1# NIL . #5=(|FR;convert;$F;29|))
                 (SEQ (LETT |f| NIL . #5#)
                      (LETT #4# (SPADCALL |x| (QREFELT $ 11)) . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL
                                (SPADCALL (QVELT |f| 1) (QREFELT $ 88))
                                (QVELT |f| 2) (QREFELT $ 89))
                               . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 90)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 91))))
                (QREFELT $ 90)))))) 

(DEFUN |FR;convert;$Df;30| (|x| $)
  (PROG (#1=#:G321 #2=#:G320 #3=#:G322 #4=#:G324 |f|)
    (RETURN
     (SEQ
      (|mul_DF| (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 94))
                (PROGN
                 (LETT #1# NIL . #5=(|FR;convert;$Df;30|))
                 (SEQ (LETT |f| NIL . #5#)
                      (LETT #4# (SPADCALL |x| (QREFELT $ 11)) . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (|expt_DF_I|
                                (SPADCALL (QVELT |f| 1) (QREFELT $ 94))
                                (QVELT |f| 2))
                               . #5#)
                         (COND (#1# (LETT #2# (|mul_DF| #2# #3#) . #5#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #5#)
                                 (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T 1.0)))))))) 

(DEFUN |FR;*;3$;31| (|u| |v| $)
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
                       (SPADCALL (SPADCALL |v| (QREFELT $ 11)) (QREFELT $ 98))
                       (QREFELT $ 99))
             $)
            $)))))) 

(DEFUN |FR;^;$Nni$;32| (|u| |n| $)
  (PROG (#1=#:G339 |x| #2=#:G338)
    (RETURN
     (SEQ
      (|FR;mkFF| (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |n| (QREFELT $ 100))
       (PROGN
        (LETT #2# NIL . #3=(|FR;^;$Nni$;32|))
        (SEQ (LETT |x| NIL . #3#)
             (LETT #1# (SPADCALL |u| (QREFELT $ 11)) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (VECTOR (QVELT |x| 0) (QVELT |x| 1)
                              (SPADCALL |n| (QVELT |x| 2) (QREFELT $ 101)))
                      #2#)
                     . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       $))))) 

(DEFUN |FR;SimplifyFactorization| (|x| $)
  (SEQ
   (COND ((NULL |x|) NIL)
         ('T
          (SEQ
           (LETT |x|
                 (SPADCALL (CONS (|function| |FR;LispLessP|) $) |x|
                           (QREFELT $ 104))
                 . #1=(|FR;SimplifyFactorization|))
           (LETT |x|
                 (|FR;SimplifyFactorization1| (|SPADfirst| |x|) (CDR |x|) $)
                 . #1#)
           (COND
            ((QREFELT $ 31)
             (LETT |x|
                   (SPADCALL (CONS (|function| |FR;LispLessP|) $) |x|
                             (QREFELT $ 104))
                   . #1#)))
           (EXIT |x|)))))) 

(DEFUN |FR;SimplifyFactorization1| (|f| |x| $)
  (PROG (|l| |f1|)
    (RETURN
     (SEQ
      (COND
       ((NULL |x|)
        (COND ((ZEROP (QVELT |f| 2)) NIL)
              (#1='T (SPADCALL |f| (QREFELT $ 105)))))
       (#1#
        (SEQ (LETT |f1| (|SPADfirst| |x|) . #2=(|FR;SimplifyFactorization1|))
             (EXIT
              (COND
               ((SPADCALL (QVELT |f| 1) (QVELT |f1| 1) (QREFELT $ 17))
                (|FR;SimplifyFactorization1|
                 (VECTOR (|FR;stricterFlag| (QVELT |f| 0) (QVELT |f1| 0) $)
                         (QVELT |f| 1) (+ (QVELT |f| 2) (QVELT |f1| 2)))
                 (CDR |x|) $))
               (#1#
                (SEQ
                 (LETT |l|
                       (|FR;SimplifyFactorization1| (|SPADfirst| |x|) (CDR |x|)
                        $)
                       . #2#)
                 (EXIT
                  (COND ((ZEROP (QVELT |f| 2)) |l|)
                        (#1# (CONS |f| |l|))))))))))))))) 

(DEFUN |FR;coerce;$Of;35| (|x| $)
  (PROG (|e| |l| #1=#:G376 |rec| |lf|)
    (RETURN
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
                   ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
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
                            (CONS (SPADCALL (QVELT |rec| 1) (QREFELT $ 106))
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
                             (#3# (SPADCALL (ELT $ 109) |l| (QREFELT $ 112))))
                       . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL (|spadConstant| $ 15)
                              (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 17))
                    |e|)
                   (#3#
                    (SPADCALL
                     (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 106))
                     |e| (QREFELT $ 109)))))))))))))))) 

(DEFUN |FR;retract;$R;36| (|u| $)
  (COND ((|FR;negexp?| |u| $) (|error| "Negative exponent in factored object"))
        ('T (|FR;qexpand| |u| $)))) 

(DEFUN |FR;qexpand| (|u| $)
  (PROG (#1=#:G381 #2=#:G380 #3=#:G382 #4=#:G384 #5=#:G386 |y|)
    (RETURN
     (SEQ
      (SPADCALL (SPADCALL |u| (QREFELT $ 12))
                (PROGN
                 (LETT #1# NIL . #6=(|FR;qexpand|))
                 (SEQ (LETT |y| NIL . #6#)
                      (LETT #5# (SPADCALL |u| (QREFELT $ 11)) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |y| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL (QVELT |y| 1)
                                         (PROG1 (LETT #4# (QVELT |y| 2) . #6#)
                                           (|check_subtype| (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            #4#))
                                         (QREFELT $ 100))
                               . #6#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 97)) . #6#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #6#)
                            (LETT #1# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 15))))
                (QREFELT $ 97)))))) 

(DEFUN |FR;retractIfCan;$U;38| (|u| $)
  (COND ((|FR;negexp?| |u| $) (CONS 1 "failed"))
        ('T (CONS 0 (|FR;qexpand| |u| $))))) 

(DEFUN |FR;LispLessP| (|y| |y1| $)
  (COND
   ((QREFELT $ 30) (SPADCALL (QVELT |y| 1) (QVELT |y1| 1) (QREFELT $ 116)))
   ((QREFELT $ 31) (SPADCALL (QVELT |y| 1) (QVELT |y1| 1) (QREFELT $ 117)))
   (#1='T (COND ((GGREATERP (QVELT |y| 1) (QVELT |y1| 1)) 'NIL) (#1# 'T))))) 

(DEFUN |FR;stricterFlag| (|fl1| |fl2| $)
  (COND ((QEQCAR |fl1| 3) |fl1|)
        ((QEQCAR |fl1| 2) (COND ((QEQCAR |fl2| 3) |fl2|) (#1='T |fl1|)))
        ((QEQCAR |fl1| 1) (COND ((QEQCAR |fl2| 0) |fl1|) (#1# |fl2|)))
        (#1# |fl2|))) 

(DEFUN |FR;coerce;R$;41| (|r| $) (SPADCALL |r| (QREFELT $ 120))) 

(DEFUN |FR;coerce;R$;42| (|r| $)
  (COND ((SPADCALL |r| (QREFELT $ 37)) (|spadConstant| $ 42))
        ((SPADCALL |r| (QREFELT $ 121)) (|FR;mkFF| |r| NIL $))
        ((|HasCategory| (QREFELT $ 6) '(|Field|))
         (|error| "zero divisor in a field"))
        ('T (SPADCALL (SPADCALL |r| (QREFELT $ 123)) (QREFELT $ 59))))) 

(DEFUN |FR;coerce;R$;43| (|r| $)
  (COND
   ((SPADCALL |r| (|spadConstant| $ 15) (QREFELT $ 17)) (|spadConstant| $ 41))
   ('T
    (SPADCALL
     (|FR;mkFF| (|spadConstant| $ 15) (LIST (VECTOR (CONS 0 "nil") |r| 1)) $)
     (QREFELT $ 59))))) 

(DEFUN |FR;=;2$B;44| (|u| |v| $)
  (COND
   ((SPADCALL (SPADCALL |u| (QREFELT $ 12)) (SPADCALL |v| (QREFELT $ 12))
              (QREFELT $ 17))
    (COND
     ((EQL (LENGTH (QCDR |u|)) (LENGTH (QCDR |v|)))
      (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 56)) (QREFELT $ 125))
                (SPADCALL (SPADCALL |v| (QREFELT $ 56)) (QREFELT $ 125))
                (QREFELT $ 126)))
     (#1='T 'NIL)))
   (#1# 'NIL))) 

(DEFUN |FR;-;2$;45| (|u| $)
  (COND ((SPADCALL |u| (QREFELT $ 44)) |u|)
        ('T
         (|FR;mkFF| (SPADCALL (SPADCALL |u| (QREFELT $ 12)) (QREFELT $ 127))
          (SPADCALL |u| (QREFELT $ 11)) $)))) 

(DEFUN |FR;recip;$U;46| (|u| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (COND ((NULL (NULL (SPADCALL |u| (QREFELT $ 11)))) (CONS 1 "failed"))
            ('T
             (SEQ
              (LETT |r|
                    (SPADCALL (SPADCALL |u| (QREFELT $ 12)) (QREFELT $ 130))
                    |FR;recip;$U;46|)
              (EXIT
               (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                     ('T (CONS 0 (|FR;mkFF| (QCDR |r|) NIL $)))))))))))) 

(DEFUN |FR;reciprocal| (|u| $)
  (PROG (#1=#:G456 |y| #2=#:G455 #3=#:G445)
    (RETURN
     (SEQ
      (|FR;mkFF|
       (PROG2
           (LETT #3# (SPADCALL (SPADCALL |u| (QREFELT $ 12)) (QREFELT $ 130))
                 . #4=(|FR;reciprocal|))
           (QCDR #3#)
         (|check_union| (QEQCAR #3# 0) (QREFELT $ 6) #3#))
       (PROGN
        (LETT #2# NIL . #4#)
        (SEQ (LETT |y| NIL . #4#)
             (LETT #1# (SPADCALL |u| (QREFELT $ 11)) . #4#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (VECTOR (QVELT |y| 0) (QVELT |y| 1) (- (QVELT |y| 2)))
                      #2#)
                     . #4#)))
             (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       $))))) 

(DEFUN |FR;exponent;$I;48| (|u| $)
  (PROG (|fl|)
    (RETURN
     (COND
      ((OR (NULL (LETT |fl| (SPADCALL |u| (QREFELT $ 11)) |FR;exponent;$I;48|))
           (SPADCALL |u| (QREFELT $ 44)))
       0)
      ('T (QVELT (|SPADfirst| |fl|) 2)))))) 

(DEFUN |FR;nthExponent;$2I;49| (|u| |i| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| (SPADCALL |u| (QREFELT $ 11)) |FR;nthExponent;$2I;49|)
          (COND
           ((OR (OR (SPADCALL |u| (QREFELT $ 44)) (< |i| 1))
                (SPADCALL |i| (LENGTH |l|) (QREFELT $ 133)))
            (EXIT 0)))
          (EXIT
           (QVELT
            (SPADCALL |l| (- (+ (SPADCALL |l| (QREFELT $ 134)) |i|) 1)
                      (QREFELT $ 135))
            2)))))) 

(DEFUN |FR;nthFactor;$IR;50| (|u| |i| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |u| (QREFELT $ 44)) (|spadConstant| $ 43))
            ((ZEROP |i|) (SPADCALL |u| (QREFELT $ 12)))
            ('T
             (SEQ
              (LETT |l| (SPADCALL |u| (QREFELT $ 11)) |FR;nthFactor;$IR;50|)
              (COND
               ((OR (MINUSP |i|) (SPADCALL |i| (LENGTH |l|) (QREFELT $ 133)))
                (EXIT (|spadConstant| $ 15))))
              (EXIT
               (QVELT
                (SPADCALL |l| (- (+ (SPADCALL |l| (QREFELT $ 134)) |i|) 1)
                          (QREFELT $ 135))
                1))))))))) 

(DEFUN |FR;nthFlag;$IU;51| (|u| |i| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| (SPADCALL |u| (QREFELT $ 11)) |FR;nthFlag;$IU;51|)
          (COND
           ((OR (OR (SPADCALL |u| (QREFELT $ 44)) (< |i| 1))
                (SPADCALL |i| (LENGTH |l|) (QREFELT $ 133)))
            (EXIT (CONS 0 "nil"))))
          (EXIT
           (QVELT
            (SPADCALL |l| (- (+ (SPADCALL |l| (QREFELT $ 134)) |i|) 1)
                      (QREFELT $ 135))
            0)))))) 

(DEFUN |FR;flagFactor;RIU$;52| (|r| |i| |fl| $)
  (COND ((ZEROP |i|) (|spadConstant| $ 41))
        ((SPADCALL |r| (QREFELT $ 37)) (|spadConstant| $ 42))
        ('T
         (SPADCALL
          (|FR;mkFF| (|spadConstant| $ 15) (LIST (VECTOR |fl| |r| |i|)) $)
          (QREFELT $ 59))))) 

(DEFUN |FR;differentiate;$M$;53| (|u| |deriv| $)
  (PROG (#1=#:G502 #2=#:G501 #3=#:G503 #4=#:G498 #5=#:G507 |fact| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |deriv|)
                      (PROG2
                          (LETT #4#
                                (SPADCALL |u|
                                          (SPADCALL
                                           (SPADCALL |u| (QREFELT $ 12))
                                           (QREFELT $ 47))
                                          (QREFELT $ 139))
                                . #6=(|FR;differentiate;$M$;53|))
                          (QCDR #4#)
                        (|check_union| (QEQCAR #4# 0) $ #4#))
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
                                           (SPADCALL (QVELT |fact| 1) |deriv|)
                                           (QREFELT $ 140))
                                 (PROG2
                                     (LETT #4#
                                           (SPADCALL |u|
                                                     (SPADCALL (QVELT |fact| 1)
                                                               1
                                                               (QREFELT $ 33))
                                                     (QREFELT $ 139))
                                           . #6#)
                                     (QCDR #4#)
                                   (|check_union| (QEQCAR #4# 0) $ #4#))
                                 (QREFELT $ 53))
                                . #6#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 141))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) ('T (|spadConstant| $ 42))))
                 (QREFELT $ 141))))))) 

(DEFUN |FR;map;M2$;54| (|fn| |u| $)
  (PROG (#1=#:G511 #2=#:G510 #3=#:G512 #4=#:G514 |f|)
    (RETURN
     (SEQ
      (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |fn|)
                (PROGN
                 (LETT #1# NIL . #5=(|FR;map;M2$;54|))
                 (SEQ (LETT |f| NIL . #5#)
                      (LETT #4# (SPADCALL |u| (QREFELT $ 11)) . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
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
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 51)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 41))))
                (QREFELT $ 53)))))) 

(DEFUN |FR;exquo;2$U;55| (|u| |v| $)
  (PROG (|x1| |goodQuotient| |v1|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |x1| (SPADCALL |v| (QREFELT $ 11)) . #1=(|FR;exquo;2$U;55|)))
        (CONS 0
              (SPADCALL
               (QVELT (SPADCALL (SPADCALL |v| (QREFELT $ 57)) (QREFELT $ 146))
                      2)
               |u| (QREFELT $ 53))))
       ((NULL (SPADCALL |u| (QREFELT $ 11))) (CONS 1 "failed"))
       (#2='T
        (SEQ
         (LETT |v1| (SPADCALL |u| (|FR;reciprocal| |v| $) (QREFELT $ 51))
               . #1#)
         (LETT |goodQuotient| 'T . #1#)
         (SEQ G190
              (COND
               ((NULL
                 (COND (|goodQuotient| (COND ((NULL |x1|) 'NIL) ('T 'T)))
                       ('T 'NIL)))
                (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((< (QVELT (|SPADfirst| |x1|) 2) 0)
                  (LETT |goodQuotient| 'NIL . #1#))
                 ('T (LETT |x1| (CDR |x1|) . #1#)))))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT
          (COND (|goodQuotient| (CONS 0 |v1|)) (#2# (CONS 1 "failed"))))))))))) 

(DEFUN |FR;unitNormal;$R;56| (|u| $)
  (PROG (|vl| |as| |un| |e| #1=#:G535 |ucar| #2=#:G550 |x| |ur|)
    (RETURN
     (SEQ
      (LETT |ur|
            (SPADCALL
             (LETT |un| (SPADCALL |u| (QREFELT $ 12))
                   . #3=(|FR;unitNormal;$R;56|))
             (QREFELT $ 130))
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
                    (LETT |ucar| (SPADCALL (QVELT |x| 1) (QREFELT $ 146))
                          . #3#)
                    (LETT |e|
                          (PROG1 (LETT #1# (ABS (QVELT |x| 2)) . #3#)
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
                          . #3#)
                    (COND
                     ((< (QVELT |x| 2) 0)
                      (SEQ
                       (LETT |un|
                             (SPADCALL |un|
                                       (SPADCALL (QVELT |ucar| 2) |e|
                                                 (QREFELT $ 100))
                                       (QREFELT $ 97))
                             . #3#)
                       (EXIT
                        (LETT |as|
                              (SPADCALL |as|
                                        (SPADCALL (QVELT |ucar| 0) |e|
                                                  (QREFELT $ 100))
                                        (QREFELT $ 97))
                              . #3#))))
                     ('T
                      (SEQ
                       (LETT |un|
                             (SPADCALL |un|
                                       (SPADCALL (QVELT |ucar| 0) |e|
                                                 (QREFELT $ 100))
                                       (QREFELT $ 97))
                             . #3#)
                       (EXIT
                        (LETT |as|
                              (SPADCALL |as|
                                        (SPADCALL (QVELT |ucar| 2) |e|
                                                  (QREFELT $ 100))
                                        (QREFELT $ 97))
                              . #3#)))))
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
                             . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (VECTOR (|FR;mkFF| |un| NIL $)
                       (|FR;mkFF| (|spadConstant| $ 15) (NREVERSE |vl|) $)
                       (|FR;mkFF| |as| NIL $))))))))))) 

(DEFUN |FR;unitNormalize;2$;57| (|u| $)
  (PROG (|uca|)
    (RETURN
     (SEQ (LETT |uca| (SPADCALL |u| (QREFELT $ 147)) |FR;unitNormalize;2$;57|)
          (EXIT
           (|FR;mkFF|
            (SPADCALL (SPADCALL (QVELT |uca| 0) (QREFELT $ 12))
                      (SPADCALL (QVELT |uca| 1) (QREFELT $ 12)) (QREFELT $ 97))
            (SPADCALL (QVELT |uca| 1) (QREFELT $ 11)) $)))))) 

(DEFUN |FR;+;3$;58| (|u| |v| $)
  (PROG (|v1| |u1|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |u| (QREFELT $ 44)) |v|)
            ((SPADCALL |v| (QREFELT $ 44)) |u|)
            ('T
             (SEQ
              (LETT |v1|
                    (|FR;reciprocal|
                     (LETT |u1| (SPADCALL |u| |v| (QREFELT $ 148))
                           . #1=(|FR;+;3$;58|))
                     $)
                    . #1#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |u| |v1| (QREFELT $ 51)) (QREFELT $ 58))
                 (SPADCALL (SPADCALL |v| |v1| (QREFELT $ 51)) (QREFELT $ 58))
                 (QREFELT $ 149))
                |u1| (QREFELT $ 53)))))))))) 

(DEFUN |FR;gcd;3$;59| (|u| |v| $)
  (PROG (|x1| |f3| |f1| |i| |y| |f2| #1=#:G585 |j| #2=#:G584 |x|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |u| (|spadConstant| $ 41) (QREFELT $ 96))
            (SPADCALL |v| (|spadConstant| $ 41) (QREFELT $ 96)))
        (|spadConstant| $ 41))
       ('T
        (COND ((SPADCALL |u| (QREFELT $ 44)) |v|)
              ((SPADCALL |v| (QREFELT $ 44)) |u|)
              ('T
               (SEQ (LETT |f1| NIL . #3=(|FR;gcd;3$;59|))
                    (LETT |f2| |f1| . #3#) (LETT |f3| NIL . #3#)
                    (LETT |x|
                          (SPADCALL (SPADCALL |u| (QREFELT $ 11))
                                    (SPADCALL |v| (QREFELT $ 11))
                                    (QREFELT $ 99))
                          . #3#)
                    (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 134)) . #3#)
                         (LETT #2# (SPADCALL |x| (QREFELT $ 150)) . #3#) G190
                         (COND ((> |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |i| |f1| (QREFELT $ 152)))
                             (SEQ (LETT |f1| (CONS |i| |f1|) . #3#)
                                  (LETT |f2| (LIST |i|) . #3#)
                                  (SEQ (LETT |j| (+ |i| 1) . #3#)
                                       (LETT #1# (SPADCALL |x| (QREFELT $ 150))
                                             . #3#)
                                       G190 (COND ((> |j| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((SPADCALL
                                            (QVELT
                                             (SPADCALL |x| |i| (QREFELT $ 135))
                                             1)
                                            (QVELT
                                             (SPADCALL |x| |j| (QREFELT $ 135))
                                             1)
                                            (QREFELT $ 17))
                                           (SEQ
                                            (LETT |f1| (CONS |j| |f1|) . #3#)
                                            (EXIT
                                             (LETT |f2| (CONS |j| |f2|)
                                                   . #3#)))))))
                                       (LETT |j| (+ |j| 1) . #3#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT
                                   (LETT |f3| (CONS |f2| |f3|) . #3#)))))))
                         (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                    (LETT |x1| NIL . #3#)
                    (SEQ G190
                         (COND
                          ((NULL (COND ((NULL |f3|) 'NIL) ('T 'T))) (GO G191)))
                         (SEQ (LETT |f1| (|SPADfirst| |f3|) . #3#)
                              (COND
                               ((SPADCALL (LENGTH |f1|) 1 (QREFELT $ 153))
                                (SEQ (LETT |i| (|SPADfirst| |f1|) . #3#)
                                     (LETT |y|
                                           (MOVEVEC (MAKE-VEC 3)
                                                    (SPADCALL |x| |i|
                                                              (QREFELT $ 135)))
                                           . #3#)
                                     (LETT |f1| (CDR |f1|) . #3#)
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (COND ((NULL |f1|) 'NIL) ('T 'T)))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |i| (|SPADfirst| |f1|) . #3#)
                                           (COND
                                            ((<
                                              (QVELT
                                               (SPADCALL |x| |i|
                                                         (QREFELT $ 135))
                                               2)
                                              (QVELT |y| 2))
                                             (QSETVELT |y| 2
                                                       (QVELT
                                                        (SPADCALL |x| |i|
                                                                  (QREFELT $
                                                                           135))
                                                        2))))
                                           (EXIT (LETT |f1| (CDR |f1|) . #3#)))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (LETT |x1| (CONS |y| |x1|) . #3#)))))
                              (EXIT (LETT |f3| (CDR |f3|) . #3#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND
                     ((QREFELT $ 31)
                      (LETT |x1|
                            (SPADCALL (CONS (|function| |FR;LispLessP|) $) |x1|
                                      (QREFELT $ 104))
                            . #3#)))
                    (EXIT (|FR;mkFF| (|spadConstant| $ 15) |x1| $))))))))))) 

(DEFUN |FR;+;3$;60| (|u| |v| $)
  (COND ((SPADCALL |u| (QREFELT $ 44)) |v|) ((SPADCALL |v| (QREFELT $ 44)) |u|)
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |u| (QREFELT $ 58)) (SPADCALL |v| (QREFELT $ 58))
                    (QREFELT $ 149))
          1 (QREFELT $ 35))))) 

(DEFUN |FR;prime?;$B;61| (|u| $)
  (PROG (|l|)
    (RETURN
     (COND
      ((OR
        (OR (NULL (LETT |l| (SPADCALL |u| (QREFELT $ 11)) |FR;prime?;$B;61|))
            (NULL (NULL (CDR |l|))))
        (NULL (EQL (QVELT (|SPADfirst| |l|) 2) 1)))
       'NIL)
      ('T (QEQCAR (QVELT (|SPADfirst| |l|) 0) 3)))))) 

(DECLAIM (NOTINLINE |Factored;|)) 

(DEFUN |Factored| (#1=#:G605)
  (PROG ()
    (RETURN
     (PROG (#2=#:G606)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Factored|))))))))))) 

(DEFUN |Factored;| (|#1|)
  (PROG (|pv$| #1=#:G604 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|Factored|))
      (LETT |dv$| (LIST '|Factored| DV$1) . #2#)
      (LETT $ (GETREFV 163) . #2#)
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
                                                         (LIST '|InnerEvalable|
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
                                          (|HasCategory| |#1| '(|Evalable| $))
                                          (|HasCategory| |#1| '(|Eltable| $ $))
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
                                 (|:| |flg|
                                      (|Union| "nil" "sqfr" "irred" "prime"))
                                 (|:| |fctr| |#1|)
                                 (|:| |xpnt| (|Integer|)))))))
      (COND
       ((|testBitVector| |pv$| 11)
        (QSETREFV $ 29 (CONS (|dispatchFunction| |FR;convert;$If;1|) $))))
      (QSETREFV $ 30 (|HasCategory| |#1| '(|OrderedSet|)))
      (QSETREFV $ 31 (|HasCategory| |#1| '(|Comparable|)))
      (COND
       ((|testBitVector| |pv$| 16)
        (PROGN
         (QSETREFV $ 61 (CONS (|dispatchFunction| |FR;rational?;$B;23|) $))
         (QSETREFV $ 65 (CONS (|dispatchFunction| |FR;rationalIfCan;$U;24|) $))
         (QSETREFV $ 63 (CONS (|dispatchFunction| |FR;rational;$F;25|) $)))))
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
         (QSETREFV $ 95 (CONS (|dispatchFunction| |FR;convert;$Df;30|) $)))))
      (COND
       ((|testBitVector| |pv$| 16)
        (QSETREFV $ 47 (CONS (|dispatchFunction| |FR;coerce;R$;41|) $)))
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 47 (CONS (|dispatchFunction| |FR;coerce;R$;42|) $)))
       ('T (QSETREFV $ 47 (CONS (|dispatchFunction| |FR;coerce;R$;43|) $))))
      (COND
       ((|testBitVector| |pv$| 13)
        (PROGN
         (QSETREFV $ 141 (CONS (|dispatchFunction| |FR;+;3$;58|) $))
         (QSETREFV $ 148 (CONS (|dispatchFunction| |FR;gcd;3$;59|) $))))
       ('T (QSETREFV $ 141 (CONS (|dispatchFunction| |FR;+;3$;60|) $))))
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 154 (CONS (|dispatchFunction| |FR;prime?;$B;61|) $))))
      $)))) 

(MAKEPROP '|Factored| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 8) (|:| |fctr| 6) (|:| |xpnt| 26))
              (|List| 9) |FR;factorList;$L;7| |FR;unit;$R;8| (|InputForm|)
              (0 . |convert|) (5 . |One|) (|Boolean|) (9 . =) (|Void|)
              (|String|) (|OutputForm|) (15 . |messagePrint|) (|Symbol|)
              (20 . |convert|) (|List| $) (25 . |binary|) (|Integer|)
              (31 . |convert|) (36 . ~=) (42 . |convert|) '|orderedR?|
              '|comparableR?| |FR;flagFactor;RIU$;52| |FR;nilFactor;RI$;2|
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
              |FR;expand;$R;20| |FR;unitNormalize;2$;57| |FR;makeFR;RL$;22|
              (70 . |rational?|) (|Fraction| 26) (75 . |rational|)
              (|Union| 62 '"failed") (80 . |rationalIfCan|) (85 . |convert|)
              (90 . |coerce|) (95 . ^) (101 . *) (107 . |One|) (111 . *)
              (117 . |elt|) (123 . |elt|) (|Equation| $$) (129 . |lhs|)
              (134 . |rhs|) (|Equation| 6) (139 . =) (|List| 77) (145 . |eval|)
              (|List| 155) (151 . |eval|) (|List| 22) (|List| 6) (157 . |eval|)
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
              |FR;exponent;$I;48| (323 . >) (329 . |minIndex|) (334 . |elt|)
              |FR;nthExponent;$2I;49| |FR;nthFactor;$IR;50| |FR;nthFlag;$IU;51|
              |FR;exquo;2$U;55| (340 . *) (346 . +) (|Mapping| 6 6)
              |FR;differentiate;$M$;53| |FR;map;M2$;54|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (352 . |unitNormal|) |FR;unitNormal;$R;56| (357 . |gcd|)
              (363 . +) (369 . |maxIndex|) (|List| 26) (374 . |member?|)
              (380 . >) (386 . |prime?|) (|Equation| $)
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 39) (|Union| 26 '"failed") (|PositiveInteger|)
              (|HashState|) (|SingleInteger|))
           '#(~= 391 |zero?| 397 |unitNormalize| 402 |unitNormal| 407
              |unitCanonical| 412 |unit?| 417 |unit| 422 |subtractIfCan| 427
              |squareFreePart| 433 |squareFree| 438 |sqfrFactor| 443 |sample|
              449 |retractIfCan| 453 |retract| 468 |recip| 483 |rationalIfCan|
              488 |rational?| 493 |rational| 498 |primeFactor| 503 |prime?| 509
              |opposite?| 514 |one?| 520 |numberOfFactors| 525 |nthFlag| 530
              |nthFactor| 536 |nthExponent| 542 |nilFactor| 548 |map| 554
              |makeFR| 560 |lcmCoef| 566 |lcm| 572 |latex| 583
              |irreducibleFactor| 588 |hashUpdate!| 594 |hash| 600
              |gcdPolynomial| 605 |gcd| 611 |flagFactor| 622 |factors| 629
              |factorList| 634 |factor| 639 |exquo| 644 |exponent| 650 |expand|
              655 |eval| 660 |elt| 740 |differentiate| 752 |convert| 802
              |coerce| 817 |characteristic| 842 |associates?| 846 |annihilate?|
              852 ^ 858 |Zero| 870 |One| 874 D 878 = 928 - 934 + 945 * 951)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(12 14 0 0 0 0 13 0 0 0 0 1 2 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 4 9 15 0 0 0 0 0 0 3 4
                                  5 6 7 8 9 10 11 15 15))
            (CONS
             '#(|UniqueFactorizationDomain&| |GcdDomain&| NIL |Algebra&|
                |DifferentialExtension&| |Algebra&| NIL NIL |Module&|
                |EntireRing&| |Module&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL |Ring&| NIL NIL NIL |Rng&| NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |FullyEvalableOver&| |SemiGroup&| |AbelianSemiGroup&|
                |FullyRetractableTo&| |SetCategory&| |Evalable&| |Evalable&|
                NIL |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                |InnerEvalable&| |InnerEvalable&| NIL |RetractableTo&|
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&| NIL NIL NIL
                NIL)
             (CONS
              '#((|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|Algebra| 6) (|DifferentialExtension| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|CommutativeRing|) (|Module| 6)
                 (|EntireRing|) (|Module| $$) (|PartialDifferentialRing| 22)
                 (|DifferentialRing|) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|Ring|) (|RightModule| 6) (|LeftModule| 6) (|LeftModule| $$)
                 (|Rng|) (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|FullyEvalableOver| 6) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|Evalable| 6) (|Evalable| $$) (|RealConstant|)
                 (|RetractableTo| 6) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 20)
                 (|InnerEvalable| 22 6) (|InnerEvalable| 6 6) (|Eltable| 6 $$)
                 (|RetractableTo| 62) (|RetractableTo| 26)
                 (|InnerEvalable| 22 $$) (|InnerEvalable| $$ $$)
                 (|Eltable| $$ $$) (|ConvertibleTo| 13) (|ConvertibleTo| 93)
                 (|ConvertibleTo| 87))
              (|makeByteWordVec2| 162
                                  '(1 6 13 0 14 0 6 0 15 2 6 16 0 0 17 1 20 18
                                    19 21 1 13 0 22 23 2 13 0 0 24 25 1 13 0 26
                                    27 2 6 16 0 0 28 1 0 13 0 29 1 6 16 0 37 0
                                    6 0 43 1 6 0 26 46 1 0 0 6 47 0 6 39 49 1 0
                                    16 0 61 1 0 62 0 63 1 0 64 0 65 1 6 26 0 66
                                    1 62 0 26 67 2 62 0 0 26 68 2 62 0 0 0 69 0
                                    62 0 70 2 62 0 26 0 71 2 0 0 0 6 72 2 0 0 0
                                    0 73 1 74 2 0 75 1 74 2 0 76 2 77 0 6 6 78
                                    2 0 0 0 79 80 2 0 0 0 81 82 3 0 0 0 83 84
                                    85 3 0 0 0 83 24 86 1 6 87 0 88 2 87 0 0 26
                                    89 2 87 0 0 0 90 0 87 0 91 1 0 87 0 92 1 6
                                    93 0 94 1 0 93 0 95 2 6 0 0 0 97 1 10 0 0
                                    98 2 10 0 0 0 99 2 6 0 0 39 100 2 26 0 39 0
                                    101 2 10 0 103 0 104 1 10 0 9 105 1 6 20 0
                                    106 1 26 20 0 107 2 20 0 0 0 108 2 20 0 0 0
                                    109 2 111 20 110 0 112 2 6 16 0 0 116 2 6
                                    16 0 0 117 1 119 118 6 120 1 6 16 0 121 1 6
                                    122 0 123 1 124 0 55 125 2 124 16 0 0 126 1
                                    6 0 0 127 1 6 129 0 130 2 26 16 0 0 133 1
                                    10 26 0 134 2 10 9 0 26 135 2 6 0 26 0 140
                                    2 0 0 0 0 141 1 6 145 0 146 2 0 0 0 0 148 2
                                    6 0 0 0 149 1 10 26 0 150 2 151 16 26 0 152
                                    2 39 16 0 0 153 1 0 16 0 154 2 0 16 0 0 1 1
                                    0 16 0 44 1 0 0 0 59 1 0 145 0 147 1 0 0 0
                                    1 1 0 16 0 38 1 0 6 0 12 2 0 129 0 0 1 1 12
                                    0 0 1 1 12 122 0 1 2 0 0 6 26 34 0 0 0 1 1
                                    6 64 0 1 1 7 159 0 1 1 0 114 0 115 1 6 62 0
                                    1 1 7 26 0 1 1 0 6 0 57 1 0 129 0 131 1 16
                                    64 0 65 1 16 16 0 61 1 16 62 0 63 2 0 0 6
                                    26 36 1 12 16 0 154 2 0 16 0 0 1 1 0 16 0
                                    45 1 0 39 0 40 2 0 8 0 26 138 2 0 6 0 26
                                    137 2 0 26 0 26 136 2 0 0 6 26 33 2 0 0 142
                                    0 144 2 0 0 6 10 60 2 13 157 0 0 1 1 13 0
                                    24 1 2 13 0 0 0 1 1 0 19 0 1 2 0 0 6 26 35
                                    2 0 161 161 0 1 1 0 162 0 1 2 13 156 156
                                    156 1 1 13 0 24 1 2 13 0 0 0 148 3 0 0 6 26
                                    8 32 1 0 55 0 56 1 0 10 0 11 1 12 122 0 1 2
                                    0 129 0 0 139 1 0 26 0 132 1 0 6 0 58 2 9 0
                                    0 81 82 3 9 0 0 0 0 1 2 9 0 0 155 1 3 9 0 0
                                    24 24 1 2 4 0 0 79 80 3 4 0 0 6 6 1 2 4 0 0
                                    77 1 3 4 0 0 84 84 1 3 8 0 0 22 0 1 3 8 0 0
                                    83 24 86 3 3 0 0 22 6 1 3 3 0 0 83 84 85 2
                                    10 0 0 0 73 2 5 0 0 6 72 2 2 0 0 39 1 1 2 0
                                    0 1 3 1 0 0 83 158 1 2 1 0 0 83 1 3 1 0 0
                                    22 39 1 2 1 0 0 22 1 2 0 0 0 142 143 3 0 0
                                    0 142 39 1 1 11 13 0 29 1 15 87 0 92 1 15
                                    93 0 95 1 6 0 62 1 1 0 0 6 47 1 0 0 0 1 1 0
                                    0 26 48 1 0 20 0 113 0 0 39 50 2 0 16 0 0 1
                                    2 0 16 0 0 1 2 0 0 0 39 102 2 0 0 0 160 1 0
                                    0 0 42 0 0 0 41 2 2 0 0 39 1 1 2 0 0 1 3 1
                                    0 0 22 39 1 3 1 0 0 83 158 1 2 1 0 0 22 1 2
                                    1 0 0 83 1 3 0 0 0 142 39 1 2 0 0 0 142 1 2
                                    0 16 0 0 96 1 0 0 0 128 2 0 0 0 0 1 2 0 0 0
                                    0 141 2 0 0 0 6 1 2 0 0 6 0 53 2 0 0 26 0
                                    52 2 0 0 0 0 51 2 0 0 39 0 1 2 0 0 160 0
                                    1)))))
           '|lookupComplete|)) 
