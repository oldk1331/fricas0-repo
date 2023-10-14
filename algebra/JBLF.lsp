
(/VERSIONCHECK 2) 

(DEFUN |JBLF;monom| (|c| |jv| $)
  (COND ((SPADCALL |c| (QREFELT $ 13)) (SPADCALL |jv| (QREFELT $ 15)))
        ((SPADCALL |jv| (QREFELT $ 16)) (SPADCALL |c| (QREFELT $ 17)))
        ('T
         (SPADCALL (SPADCALL |c| (QREFELT $ 17)) (SPADCALL |jv| (QREFELT $ 15))
                   (QREFELT $ 18))))) 

(DEFUN |JBLF;coerce;$Of;2| (|l| $)
  (PROG (|res| #1=#:G166 |c| #2=#:G167 |jv|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |l| (QREFELT $ 19)) (SPADCALL 0 (QREFELT $ 21)))
            ('T
             (SEQ
              (LETT |res|
                    (|JBLF;monom| (|SPADfirst| (QCAR |l|))
                     (|SPADfirst| (QCDR |l|)) $)
                    . #3=(|JBLF;coerce;$Of;2|))
              (SEQ (LETT |jv| NIL . #3#) (LETT #2# (CDR (QCDR |l|)) . #3#)
                   (LETT |c| NIL . #3#) (LETT #1# (CDR (QCAR |l|)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |jv| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| (|JBLF;monom| |c| |jv| $)
                                     (QREFELT $ 22))
                           . #3#)))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))))))) 

(DEFUN |JBLF;coerce;JB$;3| (|jv| $)
  (PROG (|jt|)
    (RETURN
     (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 25)) |JBLF;coerce;JB$;3|)
          (EXIT
           (COND ((EQUAL |jt| '|Const|) (|spadConstant| $ 26))
                 ((EQUAL |jt| '|Indep|)
                  (CONS (LIST (SPADCALL |jv| (QREFELT $ 27)))
                        (LIST (SPADCALL (QREFELT $ 28)))))
                 ('T (CONS (LIST (|spadConstant| $ 29)) (LIST |jv|))))))))) 

(DEFUN |JBLF;coerce;D$;4| (|ex| $)
  (COND ((SPADCALL |ex| (QREFELT $ 31)) (|spadConstant| $ 32))
        ('T (CONS (LIST |ex|) (LIST (SPADCALL (QREFELT $ 28))))))) 

(DEFUN |JBLF;coerce;SemL;5| (|jm| $)
  (PROG (|res| |r| #1=#:G177 |i|)
    (RETURN
     (SEQ (LETT |res| (SPADCALL (QREFELT $ 36)) . #2=(|JBLF;coerce;SemL;5|))
          (SEQ (LETT |i| 1 . #2#)
               (LETT #1# (SPADCALL |jm| (QREFELT $ 38)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |r| (SPADCALL |jm| |i| (QREFELT $ 41)) . #2#)
                    (EXIT
                     (COND
                      ((NULL (NULL (QCAR |r|)))
                       (LETT |res|
                             (SPADCALL (CONS (QCDR |r|) (QCAR |r|)) |res|
                                       (QREFELT $ 42))
                             . #2#)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |res| (QREFELT $ 43))))))) 

(DEFUN |JBLF;coerce;LSem;6| (|ll| $)
  (PROG (#1=#:G185 |l| |i| |res| |inds| #2=#:G184)
    (RETURN
     (SEQ (LETT |inds| NIL . #3=(|JBLF;coerce;LSem;6|))
          (SEQ (LETT |l| NIL . #3#) (LETT #2# |ll| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |l| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |inds|
                       (SPADCALL
                        (SPADCALL (ELT $ 46) |inds| (QCDR |l|) (QREFELT $ 49))
                        (QREFELT $ 50))
                       . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |res|
                (SPADCALL |inds| (SPADCALL |ll| (QREFELT $ 51)) (QREFELT $ 52))
                . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT |l| NIL . #3#) (LETT #1# |ll| . #3#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |res| |i| (QCDR |l|) (QCAR |l|) (QREFELT $ 55))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |JBLF;ground?;$B;7| (|l| $)
  (COND ((SPADCALL |l| (QREFELT $ 19)) 'T)
        ('T (SPADCALL (|SPADfirst| (QCDR |l|)) (QREFELT $ 16))))) 

(DEFUN |JBLF;ground;2$;8| (|l| $)
  (COND
   ((NULL (SPADCALL (SPADCALL (QREFELT $ 28)) (QCDR |l|) (QREFELT $ 58)))
    (|spadConstant| $ 32))
   ('T
    (CONS (LIST (SPADCALL (QCAR |l|) (QREFELT $ 59)))
          (LIST (SPADCALL (QREFELT $ 28))))))) 

(DEFUN |JBLF;retractIfCan;$U;9| (|l| $)
  (COND ((SPADCALL |l| (QREFELT $ 19)) (CONS 0 (|spadConstant| $ 61)))
        ((SPADCALL (|SPADfirst| (QCDR |l|)) (QREFELT $ 16))
         (CONS 0 (|SPADfirst| (QCAR |l|))))
        ('T (CONS 1 "failed")))) 

(PUT '|JBLF;numerator;2$;10| '|SPADreplace| '(XLAM (|l|) |l|)) 

(DEFUN |JBLF;numerator;2$;10| (|l| $) |l|) 

(DEFUN |JBLF;denominator;2$;11| (|l| $) (|spadConstant| $ 26)) 

(DEFUN |JBLF;retractIfCan;JbeU;12| (|ex| $)
  (PROG (|resC| #1=#:G213 |cd| #2=#:G214 |jv| |resJ| |pd|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |pd| (SPADCALL |ex| (QREFELT $ 68))
              . #3=(|JBLF;retractIfCan;JbeU;12|))
        (EXIT
         (COND
          ((QEQCAR |pd| 0)
           (CONS 0 (CONS (LIST (QCDR |pd|)) (LIST (SPADCALL (QREFELT $ 28))))))
          ('T
           (SEQ (LETT |resJ| (SPADCALL |ex| (QREFELT $ 69)) . #3#)
                (LETT |resC| NIL . #3#)
                (SEQ (LETT |jv| NIL . #3#) (LETT #2# |resJ| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |jv| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |cd|
                            (SPADCALL (SPADCALL |ex| |jv| (QREFELT $ 70))
                                      (QREFELT $ 68))
                            . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |cd| 1)
                         (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                        ('T (LETT |resC| (CONS (QCDR |cd|) |resC|) . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (CONS (NREVERSE |resC|) |resJ|)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |JBLF;retract;Jbe$;13| (|ex| $)
  (PROG (|pl|)
    (RETURN
     (SEQ (LETT |pl| (SPADCALL |ex| (QREFELT $ 71)) |JBLF;retract;Jbe$;13|)
          (EXIT
           (COND ((QEQCAR |pl| 1) (|error| "non-linear function"))
                 ('T (QCDR |pl|)))))))) 

(DEFUN |JBLF;zero?;$B;14| (|l| $) (NULL (QCDR |l|))) 

(DEFUN |JBLF;=;2$B;15| (|l1| |l2| $)
  (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 73)) (QREFELT $ 19))) 

(PUT '|JBLF;Zero;$;16| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(DEFUN |JBLF;Zero;$;16| ($) (CONS NIL NIL)) 

(DEFUN |JBLF;One;$;17| ($)
  (CONS (LIST (|spadConstant| $ 29)) (LIST (SPADCALL (QREFELT $ 28))))) 

(DEFUN |JBLF;-;2$;18| (|l| $)
  (PROG (#1=#:G227 |c| #2=#:G226)
    (RETURN
     (SEQ
      (CONS
       (PROGN
        (LETT #2# NIL . #3=(|JBLF;-;2$;18|))
        (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 75)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QCDR |l|)))))) 

(DEFUN |JBLF;+;3$;19| (|l1| |l2| $)
  (PROG (|lj2| |lc2| |resJ| |resC| |sum| #1=#:G244 |c1| #2=#:G245 |j1|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |l1| (QREFELT $ 19)) |l2|)
            ((SPADCALL |l2| (QREFELT $ 19)) |l1|)
            ('T
             (SEQ
              (LETT |lc2| (SPADCALL (QCAR |l2|) (QREFELT $ 77))
                    . #3=(|JBLF;+;3$;19|))
              (LETT |lj2| (SPADCALL (QCDR |l2|) (QREFELT $ 78)) . #3#)
              (LETT |resC| NIL . #3#) (LETT |resJ| NIL . #3#)
              (SEQ (LETT |j1| NIL . #3#) (LETT #2# (QCDR |l1|) . #3#)
                   (LETT |c1| NIL . #3#) (LETT #1# (QCAR |l1|) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |j1| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |lj2|) 'NIL)
                                  ('T
                                   (SPADCALL (|SPADfirst| |lj2|) |j1|
                                             (QREFELT $ 46)))))
                           (GO G191)))
                         (SEQ
                          (LETT |resC| (CONS (|SPADfirst| |lc2|) |resC|) . #3#)
                          (LETT |resJ| (CONS (|SPADfirst| |lj2|) |resJ|) . #3#)
                          (LETT |lc2| (CDR |lc2|) . #3#)
                          (EXIT (LETT |lj2| (CDR |lj2|) . #3#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((OR (NULL |lj2|)
                           (NULL
                            (SPADCALL (|SPADfirst| |lj2|) |j1|
                                      (QREFELT $ 79))))
                       (SEQ (LETT |resC| (CONS |c1| |resC|) . #3#)
                            (EXIT (LETT |resJ| (CONS |j1| |resJ|) . #3#))))
                      ('T
                       (SEQ
                        (LETT |sum|
                              (SPADCALL |c1| (|SPADfirst| |lc2|)
                                        (QREFELT $ 80))
                              . #3#)
                        (COND
                         ((NULL (SPADCALL |sum| (QREFELT $ 31)))
                          (SEQ (LETT |resC| (CONS |sum| |resC|) . #3#)
                               (EXIT (LETT |resJ| (CONS |j1| |resJ|) . #3#)))))
                        (LETT |lc2| (CDR |lc2|) . #3#)
                        (EXIT (LETT |lj2| (CDR |lj2|) . #3#)))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS (SPADCALL (NREVERSE |resC|) |lc2| (QREFELT $ 81))
                     (SPADCALL (NREVERSE |resJ|) |lj2| (QREFELT $ 82))))))))))) 

(DEFUN |JBLF;*;I2$;20| (|i| |l| $)
  (PROG (#1=#:G251 |c| #2=#:G250)
    (RETURN
     (SEQ
      (COND ((ZEROP |i|) (|spadConstant| $ 32)) ((EQL |i| 1) |l|)
            ('T
             (CONS
              (PROGN
               (LETT #2# NIL . #3=(|JBLF;*;I2$;20|))
               (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |i| |c| (QREFELT $ 84)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (QCDR |l|)))))))) 

(DEFUN |JBLF;*;D2$;21| (|ex| |l| $)
  (PROG (#1=#:G257 |c| #2=#:G256)
    (RETURN
     (SEQ
      (COND ((SPADCALL |ex| (QREFELT $ 31)) (|spadConstant| $ 32))
            ((SPADCALL |ex| (QREFELT $ 13)) |l|)
            ('T
             (CONS
              (PROGN
               (LETT #2# NIL . #3=(|JBLF;*;D2$;21|))
               (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |ex| |c| (QREFELT $ 86)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (QCDR |l|)))))))) 

(DEFUN |JBLF;*;3$;22| (|l1| |l2| $)
  (COND
   ((OR (SPADCALL |l1| (QREFELT $ 19)) (SPADCALL |l2| (QREFELT $ 19)))
    (|spadConstant| $ 32))
   ('T
    (COND
     ((SPADCALL (QCDR |l1|) (LIST (SPADCALL (QREFELT $ 28))) (QREFELT $ 88))
      (SPADCALL (|SPADfirst| (QCAR |l1|)) |l2| (QREFELT $ 87)))
     ((SPADCALL (QCDR |l2|) (LIST (SPADCALL (QREFELT $ 28))) (QREFELT $ 88))
      (SPADCALL (|SPADfirst| (QCAR |l2|)) |l1| (QREFELT $ 87)))
     ('T (|error| "non-linear function")))))) 

(DEFUN |JBLF;recip;$U;23| (|l| $)
  (PROG (|rc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QCDR |l|) (LIST (SPADCALL (QREFELT $ 28))) (QREFELT $ 88))
        (SEQ
         (LETT |rc| (SPADCALL (|SPADfirst| (QCAR |l|)) (QREFELT $ 90))
               |JBLF;recip;$U;23|)
         (EXIT
          (COND
           ((QEQCAR |rc| 0) (CONS 0 (SPADCALL (QCDR |rc|) (QREFELT $ 33))))
           (#1='T (CONS 1 "failed"))))))
       (#1# (CONS 1 "failed"))))))) 

(DEFUN |JBLF;exquo;2$U;24| (|l1| |l2| $)
  (PROG (|newC| #1=#:G285 |e| #2=#:G286 |c| |d|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL (SPADCALL (|SPADfirst| (QCDR |l2|)) (QREFELT $ 16)))
         (CONS 1 "failed"))
        ('T
         (SEQ (LETT |d| (|SPADfirst| (QCAR |l2|)) . #3=(|JBLF;exquo;2$U;24|))
              (LETT |newC| NIL . #3#)
              (SEQ (LETT |c| NIL . #3#) (LETT #2# (QCAR |l1|) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |e| (SPADCALL |c| |d| (QREFELT $ 92)) . #3#)
                        (EXIT
                         (COND
                          ((QEQCAR |e| 1)
                           (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                          ('T (LETT |newC| (CONS (QCDR |e|) |newC|) . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 (CONS (NREVERSE |newC|) (QCDR |l1|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |JBLF;gcd;3$;25| (|l1| |l2| $)
  (PROG (|g|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL (LENGTH (QCDR |l1|)) 1 (QREFELT $ 94))
            (SPADCALL (LENGTH (QCDR |l2|)) 1 (QREFELT $ 94)))
        (|spadConstant| $ 26))
       ('T
        (SEQ
         (LETT |g|
               (SPADCALL (|SPADfirst| (QCAR |l1|)) (|SPADfirst| (QCAR |l2|))
                         (QREFELT $ 95))
               |JBLF;gcd;3$;25|)
         (EXIT
          (COND
           ((SPADCALL (|SPADfirst| (QCDR |l1|)) (|SPADfirst| (QCDR |l2|))
                      (QREFELT $ 79))
            (CONS (LIST |g|) (QCDR |l1|)))
           ('T (SPADCALL |g| (QREFELT $ 33)))))))))))) 

(DEFUN |JBLF;jetVariables;$L;26| (|l| $)
  (PROG (|res| #1=#:G299 |c|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |l| (QREFELT $ 19)) NIL)
            (#2='T
             (SEQ (LETT |res| NIL . #3=(|JBLF;jetVariables;$L;26|))
                  (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |res|
                               (SPADCALL (ELT $ 46) |res|
                                         (SPADCALL |c| (QREFELT $ 97))
                                         (QREFELT $ 49))
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                  (LETT |res| (SPADCALL |res| (QREFELT $ 50)) . #3#)
                  (COND
                   ((SPADCALL (SPADCALL (QREFELT $ 28)) (QCDR |l|)
                              (QREFELT $ 58))
                    (LETT |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT $ 28)) (QCDR |l|)
                                     (QREFELT $ 98))
                           |res| (QREFELT $ 82))
                          . #3#))
                   (#2# (LETT |res| (APPEND (QCDR |l|) |res|) . #3#)))
                  (EXIT |res|)))))))) 

(DEFUN |JBLF;differentiate;$S$;27| (|l| |s| $)
  (PROG (|resJ| |resC| |dc| #1=#:G305 |c| #2=#:G306 |j|)
    (RETURN
     (SEQ (LETT |resC| NIL . #3=(|JBLF;differentiate;$S$;27|))
          (LETT |resJ| NIL . #3#)
          (SEQ (LETT |j| NIL . #3#) (LETT #2# (QCDR |l|) . #3#)
               (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                     (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |dc| (SPADCALL |c| |s| (QREFELT $ 100)) . #3#)
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |dc| (QREFELT $ 31)))
                       (SEQ (LETT |resC| (CONS |dc| |resC|) . #3#)
                            (EXIT (LETT |resJ| (CONS |j| |resJ|) . #3#)))))))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|))))))) 

(DEFUN |JBLF;differentiate;$JB$;28| (|l| |jv| $)
  (PROG (|pos| |resJ| |resC| |dc| #1=#:G314 |c| #2=#:G315 |j| |jt|)
    (RETURN
     (SEQ
      (LETT |jt| (SPADCALL |jv| (QREFELT $ 25))
            . #3=(|JBLF;differentiate;$JB$;28|))
      (EXIT
       (COND
        ((EQUAL |jt| '|Indep|)
         (SEQ (LETT |resC| NIL . #3#) (LETT |resJ| NIL . #3#)
              (SEQ (LETT |j| NIL . #3#) (LETT #2# (QCDR |l|) . #3#)
                   (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |dc| (SPADCALL |c| |jv| (QREFELT $ 102)) . #3#)
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |dc| (QREFELT $ 31)))
                           (SEQ (LETT |resC| (CONS |dc| |resC|) . #3#)
                                (EXIT
                                 (LETT |resJ| (CONS |j| |resJ|) . #3#)))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
        (#4='T
         (SEQ (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT $ 103)) . #3#)
              (EXIT
               (COND
                ((< |pos| (SPADCALL (QCDR |l|) (QREFELT $ 104)))
                 (|spadConstant| $ 32))
                (#4#
                 (CONS (LIST (SPADCALL (QCAR |l|) |pos| (QREFELT $ 105)))
                       (LIST (SPADCALL (QREFELT $ 28))))))))))))))) 

(DEFUN |JBLF;jacobiMatrix;LSem;29| (|sys| $)
  (PROG (|rowC| |rowJ| |dCo| |dJV| |dco| #1=#:G348 |co| #2=#:G349 |jv|
         #3=#:G347 |cjv| |ents| #4=#:G346 #5=#:G345 #6=#:G344 |eq| |i| |res|
         #7=#:G343 #8=#:G342 #9=#:G341 |cinds| #10=#:G340 |inds| #11=#:G339)
    (RETURN
     (SEQ (LETT |inds| NIL . #12=(|JBLF;jacobiMatrix;LSem;29|))
          (LETT |cinds| NIL . #12#)
          (SEQ (LETT |eq| NIL . #12#) (LETT #11# |sys| . #12#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#) . #12#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |inds|
                      (SPADCALL
                       (SPADCALL (ELT $ 46) |inds| (QCDR |eq|) (QREFELT $ 49))
                       (QREFELT $ 50))
                      . #12#)
                (EXIT
                 (SEQ (LETT |co| NIL . #12#) (LETT #10# (QCAR |eq|) . #12#)
                      G190
                      (COND
                       ((OR (NULL (< (LENGTH |cinds|) (QREFELT $ 11)))
                            (ATOM #10#)
                            (PROGN (LETT |co| (CAR #10#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |cinds|
                              (SPADCALL
                               (SPADCALL (ELT $ 46) |cinds|
                                         (SPADCALL |co| (QREFELT $ 97))
                                         (QREFELT $ 49))
                               (QREFELT $ 50))
                              . #12#)))
                      (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                      (EXIT NIL))))
               (LETT #11# (CDR #11#) . #12#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL |cinds|)
             (SEQ
              (LETT |res|
                    (SPADCALL |inds| (SPADCALL |sys| (QREFELT $ 51))
                              (QREFELT $ 108))
                    . #12#)
              (SEQ (LETT |i| 1 . #12#) (LETT |eq| NIL . #12#)
                   (LETT #9# |sys| . #12#) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |eq| (CAR #9#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |res| |i| (QCDR |eq|)
                               (PROGN
                                (LETT #8# NIL . #12#)
                                (SEQ (LETT |co| NIL . #12#)
                                     (LETT #7# (QCAR |eq|) . #12#) G190
                                     (COND
                                      ((OR (ATOM #7#)
                                           (PROGN
                                            (LETT |co| (CAR #7#) . #12#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #8#
                                             (CONS
                                              (SPADCALL |co| (QREFELT $ 33))
                                              #8#)
                                             . #12#)))
                                     (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                                     (EXIT (NREVERSE #8#))))
                               (QREFELT $ 109))))
                   (LETT #9# (PROG1 (CDR #9#) (LETT |i| (|inc_SI| |i|) . #12#))
                         . #12#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))
            ('T
             (SEQ
              (LETT |res|
                    (SPADCALL (APPEND |inds| |cinds|)
                              (SPADCALL |sys| (QREFELT $ 51)) (QREFELT $ 108))
                    . #12#)
              (SEQ (LETT |i| 1 . #12#) (LETT |eq| NIL . #12#)
                   (LETT #6# |sys| . #12#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |eq| (CAR #6#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ents|
                          (PROGN
                           (LETT #5# NIL . #12#)
                           (SEQ (LETT |co| NIL . #12#)
                                (LETT #4# (QCAR |eq|) . #12#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |co| (CAR #4#) . #12#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (SPADCALL |co| (QREFELT $ 33))
                                              #5#)
                                        . #12#)))
                                (LETT #4# (CDR #4#) . #12#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          . #12#)
                    (LETT |rowJ| NIL . #12#)
                    (LETT |rowC| (SPADCALL (QREFELT $ 36)) . #12#)
                    (SEQ (LETT |cjv| NIL . #12#) (LETT #3# |cinds| . #12#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |cjv| (CAR #3#) . #12#) NIL))
                           (GO G191)))
                         (SEQ (LETT |dJV| NIL . #12#) (LETT |dCo| NIL . #12#)
                              (SEQ (LETT |jv| NIL . #12#)
                                   (LETT #2# (QCDR |eq|) . #12#)
                                   (LETT |co| NIL . #12#)
                                   (LETT #1# (QCAR |eq|) . #12#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |co| (CAR #1#) . #12#)
                                          NIL)
                                         (ATOM #2#)
                                         (PROGN
                                          (LETT |jv| (CAR #2#) . #12#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |dco|
                                          (SPADCALL |co| |cjv| (QREFELT $ 102))
                                          . #12#)
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |dco| (QREFELT $ 31)))
                                       (SEQ
                                        (LETT |dJV| (CONS |jv| |dJV|) . #12#)
                                        (EXIT
                                         (LETT |dCo| (CONS |dco| |dCo|)
                                               . #12#)))))))
                                   (LETT #1#
                                         (PROG1 (CDR #1#)
                                           (LETT #2# (CDR #2#) . #12#))
                                         . #12#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND
                                ((NULL (NULL |dJV|))
                                 (SEQ (LETT |rowJ| (CONS |cjv| |rowJ|) . #12#)
                                      (EXIT
                                       (LETT |rowC|
                                             (SPADCALL
                                              (CONS (NREVERSE |dCo|)
                                                    (NREVERSE |dJV|))
                                              |rowC| (QREFELT $ 42))
                                             . #12#)))))))
                         (LETT #3# (CDR #3#) . #12#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |res| |i| (APPEND (QCDR |eq|) (NREVERSE |rowJ|))
                               (SPADCALL |ents|
                                         (SPADCALL |rowC| (QREFELT $ 43))
                                         (QREFELT $ 110))
                               (QREFELT $ 109))))
                   (LETT #6# (PROG1 (CDR #6#) (LETT |i| (|inc_SI| |i|) . #12#))
                         . #12#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|))))))))) 

(DEFUN |JBLF;jacobiMatrix;LLSem;30| (|sys| |varlist| $)
  (PROG (|rowC| |rowJ| |dCo| |dJV| |dco| #1=#:G375 |co| #2=#:G376 |jv|
         #3=#:G374 |ijv| |ivars| |ents| #4=#:G373 #5=#:G372 #6=#:G370 |eq|
         #7=#:G371 |vars| |i| |res| |inds| #8=#:G369)
    (RETURN
     (SEQ
      (LETT |inds| (|SPADfirst| |varlist|) . #9=(|JBLF;jacobiMatrix;LLSem;30|))
      (SEQ (LETT |vars| NIL . #9#) (LETT #8# (CDR |varlist|) . #9#) G190
           (COND
            ((OR (ATOM #8#) (PROGN (LETT |vars| (CAR #8#) . #9#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |inds|
                   (SPADCALL (SPADCALL (ELT $ 46) |inds| |vars| (QREFELT $ 49))
                             (QREFELT $ 50))
                   . #9#)))
           (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
      (LETT |res|
            (SPADCALL |inds| (SPADCALL |sys| (QREFELT $ 51)) (QREFELT $ 108))
            . #9#)
      (SEQ (LETT |i| 1 . #9#) (LETT |vars| NIL . #9#)
           (LETT #7# |varlist| . #9#) (LETT |eq| NIL . #9#)
           (LETT #6# |sys| . #9#) G190
           (COND
            ((OR (ATOM #6#) (PROGN (LETT |eq| (CAR #6#) . #9#) NIL) (ATOM #7#)
                 (PROGN (LETT |vars| (CAR #7#) . #9#) NIL))
             (GO G191)))
           (SEQ
            (LETT |ents|
                  (PROGN
                   (LETT #5# NIL . #9#)
                   (SEQ (LETT |co| NIL . #9#) (LETT #4# (QCAR |eq|) . #9#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |co| (CAR #4#) . #9#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #5# (CONS (SPADCALL |co| (QREFELT $ 33)) #5#)
                                . #9#)))
                        (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #9#)
            (LETT |ivars|
                  (SPADCALL (ELT $ 113)
                            (SPADCALL (CONS #'|JBLF;jacobiMatrix;LLSem;30!0| $)
                                      |vars| (QREFELT $ 116))
                            (QREFELT $ 117))
                  . #9#)
            (EXIT
             (COND
              ((NULL |ivars|)
               (SPADCALL |res| |i| (QCDR |eq|) |ents| (QREFELT $ 109)))
              ('T
               (SEQ (LETT |rowJ| NIL . #9#)
                    (LETT |rowC| (SPADCALL (QREFELT $ 36)) . #9#)
                    (SEQ (LETT |ijv| NIL . #9#) (LETT #3# |ivars| . #9#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |ijv| (CAR #3#) . #9#) NIL))
                           (GO G191)))
                         (SEQ (LETT |dJV| NIL . #9#) (LETT |dCo| NIL . #9#)
                              (SEQ (LETT |jv| NIL . #9#)
                                   (LETT #2# (QCDR |eq|) . #9#)
                                   (LETT |co| NIL . #9#)
                                   (LETT #1# (QCAR |eq|) . #9#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |co| (CAR #1#) . #9#)
                                          NIL)
                                         (ATOM #2#)
                                         (PROGN
                                          (LETT |jv| (CAR #2#) . #9#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |dco|
                                          (SPADCALL |co| |ijv| (QREFELT $ 102))
                                          . #9#)
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |dco| (QREFELT $ 31)))
                                       (SEQ
                                        (LETT |dJV| (CONS |jv| |dJV|) . #9#)
                                        (EXIT
                                         (LETT |dCo| (CONS |dco| |dCo|)
                                               . #9#)))))))
                                   (LETT #1#
                                         (PROG1 (CDR #1#)
                                           (LETT #2# (CDR #2#) . #9#))
                                         . #9#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND
                                ((NULL (NULL |dJV|))
                                 (SEQ (LETT |rowJ| (CONS |ijv| |rowJ|) . #9#)
                                      (EXIT
                                       (LETT |rowC|
                                             (SPADCALL
                                              (CONS (NREVERSE |dCo|)
                                                    (NREVERSE |dJV|))
                                              |rowC| (QREFELT $ 42))
                                             . #9#)))))))
                         (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |res| |i| (APPEND (QCDR |eq|) (NREVERSE |rowJ|))
                               (SPADCALL |ents|
                                         (SPADCALL |rowC| (QREFELT $ 43))
                                         (QREFELT $ 110))
                               (QREFELT $ 109))))))))
           (LETT #6#
                 (PROG1 (CDR #6#)
                   (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|) . #9#))
                         . #9#))
                 . #9#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |JBLF;jacobiMatrix;LLSem;30!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 25)) '|Indep| (QREFELT $ 114))) 

(DEFUN |JBLF;leadingDer;$JB;31| (|l| $)
  (COND ((SPADCALL |l| (QREFELT $ 19)) (SPADCALL (QREFELT $ 28)))
        ('T (|SPADfirst| (QCDR |l|))))) 

(DEFUN |JBLF;freeOf?;$JBB;32| (|l| |jv| $)
  (PROG (#1=#:G388 |c| #2=#:G387)
    (RETURN
     (SEQ
      (COND
       ((EQUAL (SPADCALL |jv| (QREFELT $ 25)) '|Indep|)
        (SPADCALL (ELT $ 122)
                  (PROGN
                   (LETT #2# NIL . #3=(|JBLF;freeOf?;$JBB;32|))
                   (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS (SPADCALL |c| |jv| (QREFELT $ 121)) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  'T (QREFELT $ 125)))
       ((SPADCALL |jv| (QCDR |l|) (QREFELT $ 58)) 'NIL) ('T 'T)))))) 

(DEFUN |JBLF;solveFor;$JBU;33| (|l| |jv| $)
  (PROG (#1=#:G402 |c| #2=#:G401 |rc| |pos| |jt|)
    (RETURN
     (SEQ
      (LETT |jt| (SPADCALL |jv| (QREFELT $ 25)) . #3=(|JBLF;solveFor;$JBU;33|))
      (COND
       ((OR (EQUAL |jt| '|Const|) (EQUAL |jt| '|Indep|))
        (EXIT (CONS 1 "failed"))))
      (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT $ 103)) . #3#)
      (EXIT
       (COND
        ((< |pos| (SPADCALL (QCDR |l|) (QREFELT $ 104))) (CONS 1 "failed"))
        ((EQL (LENGTH (QCDR |l|)) 1) (CONS 0 (|spadConstant| $ 32)))
        (#4='T
         (SEQ
          (LETT |rc|
                (SPADCALL (SPADCALL (QCAR |l|) |pos| (QREFELT $ 127))
                          (QREFELT $ 90))
                . #3#)
          (EXIT
           (COND ((QEQCAR |rc| 1) (CONS 1 "failed"))
                 (#4#
                  (CONS 0
                        (CONS
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |c| NIL . #3#)
                               (LETT #1#
                                     (SPADCALL (QCAR |l|) |pos|
                                               (QREFELT $ 128))
                                     . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |c| (QCDR |rc|)
                                                   (QREFELT $ 86))
                                         (QREFELT $ 75))
                                        #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (SPADCALL (QCDR |l|) |pos|
                                   (QREFELT $ 129))))))))))))))) 

(DEFUN |JBLF;subst;$JB2$;34| (|l| |jv| |exp| $)
  (PROG (|nl| |c| |pos| |resJ| |resC| |nc| #1=#:G411 #2=#:G412 |cj| |xexp|
         |jt|)
    (RETURN
     (SEQ
      (LETT |jt| (SPADCALL |jv| (QREFELT $ 25)) . #3=(|JBLF;subst;$JB2$;34|))
      (EXIT
       (COND ((EQUAL |jt| '|Const|) (|error| "Substitution for 1 not allowed"))
             ((EQUAL |jt| '|Indep|)
              (SEQ (LETT |xexp| (SPADCALL |exp| (QREFELT $ 131)) . #3#)
                   (LETT |resC| NIL . #3#) (LETT |resJ| NIL . #3#)
                   (SEQ (LETT |cj| NIL . #3#) (LETT #2# (QCDR |l|) . #3#)
                        (LETT |c| NIL . #3#) (LETT #1# (QCAR |l|) . #3#) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                              (ATOM #2#)
                              (PROGN (LETT |cj| (CAR #2#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |nc| (SPADCALL |c| |jv| |xexp| (QREFELT $ 132))
                               . #3#)
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |nc| (QREFELT $ 31)))
                            (SEQ (LETT |resC| (CONS |nc| |resC|) . #3#)
                                 (EXIT
                                  (LETT |resJ| (CONS |cj| |resJ|) . #3#)))))))
                        (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                              . #3#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
             (#4='T
              (SEQ
               (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT $ 103)) . #3#)
               (EXIT
                (COND ((ZEROP |pos|) |l|)
                      (#4#
                       (SEQ
                        (LETT |c| (SPADCALL (QCAR |l|) |pos| (QREFELT $ 105))
                              . #3#)
                        (LETT |nl|
                              (CONS (SPADCALL (QCAR |l|) |pos| (QREFELT $ 128))
                                    (SPADCALL (QCDR |l|) |pos|
                                              (QREFELT $ 129)))
                              . #3#)
                        (EXIT
                         (SPADCALL |nl| (SPADCALL |c| |exp| (QREFELT $ 87))
                                   (QREFELT $ 83))))))))))))))) 

(DEFUN |JBLF;simplify;LSemR;35| (|sys| |jm| $)
  (PROG (|dep| |depj| #1=#:G432 |kb| |k| |rowC| |rowJ| |dCo| |dJV| |dco|
         #2=#:G450 |co| #3=#:G451 |jv| #4=#:G449 |cjv| |ents| #5=#:G448
         #6=#:G447 #7=#:G446 #8=#:G445 #9=#:G444 |eq| |j| |newJM| |cinds|
         |inds| |maxR| |minR| |Trafo| |newSys| |RRec|)
    (RETURN
     (SEQ
      (COND
       ((EQL (SPADCALL |sys| (QREFELT $ 51)) 1)
        (VECTOR |sys| |jm| (CONS 1 (LIST (LIST 1)))))
       ('T
        (SEQ
         (LETT |RRec|
               (SPADCALL (SPADCALL |sys| (QREFELT $ 56)) (QREFELT $ 135))
               . #10=(|JBLF;simplify;LSemR;35|))
         (LETT |newSys| (SPADCALL (QVELT |RRec| 0) (QREFELT $ 45)) . #10#)
         (LETT |Trafo| (QVELT |RRec| 1) . #10#) (LETT |minR| 1 . #10#)
         (LETT |maxR| (SPADCALL |Trafo| (QREFELT $ 137)) . #10#)
         (LETT |inds| (SPADCALL |jm| (QREFELT $ 138)) . #10#)
         (LETT |cinds| (SPADCALL |inds| (QREFELT $ 78)) . #10#)
         (SEQ G190
              (COND
               ((NULL
                 (COND ((NULL |cinds|) 'NIL)
                       ('T
                        (SPADCALL
                         (SPADCALL (|SPADfirst| |cinds|) (QREFELT $ 25))
                         '|Indep| (QREFELT $ 139)))))
                (GO G191)))
              (SEQ (EXIT (LETT |cinds| (CDR |cinds|) . #10#))) NIL (GO G190)
              G191 (EXIT NIL))
         (COND
          ((NULL (NULL |cinds|)) (LETT |cinds| (NREVERSE |cinds|) . #10#)))
         (LETT |newJM|
               (SPADCALL |inds| (SPADCALL |newSys| (QREFELT $ 51))
                         (QREFELT $ 108))
               . #10#)
         (LETT |dep| NIL . #10#)
         (SEQ (LETT |j| 1 . #10#) (LETT |eq| NIL . #10#)
              (LETT #9# |newSys| . #10#) G190
              (COND
               ((OR (ATOM #9#) (PROGN (LETT |eq| (CAR #9#) . #10#) NIL))
                (GO G191)))
              (SEQ
               (COND
                ((NULL |cinds|)
                 (SPADCALL |newJM| |j| (QCDR |eq|)
                           (PROGN
                            (LETT #8# NIL . #10#)
                            (SEQ (LETT |co| NIL . #10#)
                                 (LETT #7# (QCAR |eq|) . #10#) G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN
                                        (LETT |co| (CAR #7#) . #10#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #8#
                                         (CONS (SPADCALL |co| (QREFELT $ 33))
                                               #8#)
                                         . #10#)))
                                 (LETT #7# (CDR #7#) . #10#) (GO G190) G191
                                 (EXIT (NREVERSE #8#))))
                           (QREFELT $ 109)))
                ('T
                 (SEQ
                  (LETT |ents|
                        (PROGN
                         (LETT #6# NIL . #10#)
                         (SEQ (LETT |co| NIL . #10#)
                              (LETT #5# (QCAR |eq|) . #10#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |co| (CAR #5#) . #10#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS (SPADCALL |co| (QREFELT $ 33)) #6#)
                                      . #10#)))
                              (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                              (EXIT (NREVERSE #6#))))
                        . #10#)
                  (LETT |rowJ| NIL . #10#)
                  (LETT |rowC| (SPADCALL (QREFELT $ 36)) . #10#)
                  (SEQ (LETT |cjv| NIL . #10#) (LETT #4# |cinds| . #10#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |cjv| (CAR #4#) . #10#) NIL))
                         (GO G191)))
                       (SEQ (LETT |dJV| NIL . #10#) (LETT |dCo| NIL . #10#)
                            (SEQ (LETT |jv| NIL . #10#)
                                 (LETT #3# (QCDR |eq|) . #10#)
                                 (LETT |co| NIL . #10#)
                                 (LETT #2# (QCAR |eq|) . #10#) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |co| (CAR #2#) . #10#) NIL)
                                       (ATOM #3#)
                                       (PROGN
                                        (LETT |jv| (CAR #3#) . #10#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |dco|
                                        (SPADCALL |co| |cjv| (QREFELT $ 102))
                                        . #10#)
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |dco| (QREFELT $ 31)))
                                     (SEQ (LETT |dJV| (CONS |jv| |dJV|) . #10#)
                                          (EXIT
                                           (LETT |dCo| (CONS |dco| |dCo|)
                                                 . #10#)))))))
                                 (LETT #2#
                                       (PROG1 (CDR #2#)
                                         (LETT #3# (CDR #3#) . #10#))
                                       . #10#)
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (COND
                              ((NULL (NULL |dJV|))
                               (SEQ (LETT |rowJ| (CONS |cjv| |rowJ|) . #10#)
                                    (EXIT
                                     (LETT |rowC|
                                           (SPADCALL
                                            (CONS (NREVERSE |dCo|)
                                                  (NREVERSE |dJV|))
                                            |rowC| (QREFELT $ 42))
                                           . #10#)))))))
                       (LETT #4# (CDR #4#) . #10#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL |newJM| |j| (APPEND (QCDR |eq|) (NREVERSE |rowJ|))
                             (SPADCALL |ents| (SPADCALL |rowC| (QREFELT $ 43))
                                       (QREFELT $ 110))
                             (QREFELT $ 109))))))
               (LETT |depj| NIL . #10#)
               (SEQ (LETT |k| |maxR| . #10#) G190
                    (COND ((< |k| |minR|) (GO G191)))
                    (SEQ
                     (LETT |kb|
                           (- (+ |k| (SPADCALL |sys| (QREFELT $ 140))) |minR|)
                           . #10#)
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL (QAREF2O |Trafo| |j| |k| 1 1)
                                   (QREFELT $ 142)))
                        (LETT |depj|
                              (CONS
                               (PROG1
                                   (LETT #1#
                                         (+ (- |k| |minR|)
                                            (SPADCALL |depj| (QREFELT $ 144)))
                                         . #10#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               |depj|)
                              . #10#)))))
                    (LETT |k| (+ |k| -1) . #10#) (GO G190) G191 (EXIT NIL))
               (EXIT (LETT |dep| (CONS |depj| |dep|) . #10#)))
              (LETT #9# (PROG1 (CDR #9#) (LETT |j| (|inc_SI| |j|) . #10#))
                    . #10#)
              (GO G190) G191 (EXIT NIL))
         (EXIT (VECTOR |newSys| |newJM| (CONS 1 (NREVERSE |dep|))))))))))) 

(DEFUN |JBLF;simpOne;2$;36| (|f| $)
  (COND
   ((EQL (LENGTH (QCDR |f|)) 1) (CONS (LIST (|spadConstant| $ 29)) (QCDR |f|)))
   ('T |f|))) 

(DECLAIM (NOTINLINE |JetBundleLinearFunction;|)) 

(DEFUN |JetBundleLinearFunction| (&REST #1=#:G462)
  (PROG ()
    (RETURN
     (PROG (#2=#:G463)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|JetBundleLinearFunction|)
                                           '|domainEqualList|)
                . #3=(|JetBundleLinearFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |JetBundleLinearFunction;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|JetBundleLinearFunction|))))))))))) 

(DEFUN |JetBundleLinearFunction;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|JetBundleLinearFunction|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|JetBundleLinearFunction| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 159) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|lazyRepresentation|))
                                          (|HasSignature| |#2|
                                                          (LIST '|retractIfCan|
                                                                (LIST
                                                                 (LIST '|Union|
                                                                       (|devaluate|
                                                                        |#2|)
                                                                       (|devaluate|
                                                                        "failed"))
                                                                 (LIST
                                                                  '|JetBundleExpression|
                                                                  (|devaluate|
                                                                   |#1|)))))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|JetBundleLinearFunction|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|Record| (|:| |Coeffs| (|List| |#2|))
                          (|:| |JVars| (|List| |#1|))))
      (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 71
                   (CONS (|dispatchFunction| |JBLF;retractIfCan;JbeU;12|) $))
         (QSETREFV $ 72
                   (CONS (|dispatchFunction| |JBLF;retract;Jbe$;13|) $)))))
      $)))) 

(MAKEPROP '|JetBundleLinearFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|PositiveInteger|) (0 . |numIndVar|) '|nn| (|Boolean|)
              (4 . |one?|) (|OutputForm|) (9 . |coerce|) (14 . |one?|)
              (19 . |coerce|) (24 . *) |JBLF;zero?;$B;14|
              (|NonNegativeInteger|) (30 . |coerce|) (35 . +)
              |JBLF;coerce;$Of;2| (|Symbol|) (41 . |type|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBLF;One;$;17|) $))
              (46 . |coerce|) (51 . |One|) (55 . |One|) |JBLF;coerce;JB$;3|
              (59 . |zero?|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBLF;Zero;$;16|) $))
              |JBLF;coerce;D$;4| (64 . |empty|) (|List| $$) (68 . |empty|)
              (|SparseEchelonMatrix| 6 7) (72 . |nrows|)
              (|Record| (|:| |Indices| 48) (|:| |Entries| 54)) (|Integer|)
              (77 . |row|) (83 . |cons|) (89 . |reverse!|) (|List| $)
              |JBLF;coerce;SemL;5| (94 . >) (|Mapping| 12 6 6) (|List| 6)
              (100 . |merge|) (107 . |removeDuplicates!|) (112 . |#|)
              (117 . |new|) (|Void|) (|List| 7) (123 . |setRow!|)
              |JBLF;coerce;LSem;6| |JBLF;ground?;$B;7| (131 . |member?|)
              (137 . |last|) |JBLF;ground;2$;8| (142 . |Zero|)
              (|Union| 7 '"failed") |JBLF;retractIfCan;$U;9|
              |JBLF;numerator;2$;10| |JBLF;denominator;2$;11|
              (|Union| $ '"failed") (|JetBundleExpression| 6)
              (146 . |retractIfCan|) (151 . |jetVariables|)
              (156 . |differentiate|) (162 . |retractIfCan|) (167 . |retract|)
              (172 . -) |JBLF;=;2$B;15| (178 . -) |JBLF;-;2$;18| (183 . |copy|)
              (188 . |copy|) (193 . =) (199 . +) (205 . |concat!|)
              (211 . |concat!|) |JBLF;+;3$;19| (217 . *) |JBLF;*;I2$;20|
              (223 . *) |JBLF;*;D2$;21| (229 . =) |JBLF;*;3$;22|
              (235 . |recip|) |JBLF;recip;$U;23| (240 . |exquo|)
              |JBLF;exquo;2$U;24| (246 . >) (252 . |gcd|) |JBLF;gcd;3$;25|
              (258 . |jetVariables|) (263 . |remove|) |JBLF;jetVariables;$L;26|
              (269 . |differentiate|) |JBLF;differentiate;$S$;27|
              (275 . |differentiate|) (281 . |position|) (287 . |minIndex|)
              (292 . |qelt|) |JBLF;differentiate;$JB$;28|
              (|SparseEchelonMatrix| 6 $$) (298 . |new|) (304 . |setRow!|)
              (312 . |append|) (|SparseEchelonMatrix| 6 $)
              |JBLF;jacobiMatrix;LSem;29| (318 . <) (324 . =) (|Mapping| 12 6)
              (330 . |select|) (336 . |sort!|) (|List| 48)
              |JBLF;jacobiMatrix;LLSem;30| |JBLF;leadingDer;$JB;31|
              (342 . |freeOf?|) (348 . |and|) (|Mapping| 12 12 12) (|List| 12)
              (354 . |reduce|) |JBLF;freeOf?;$JBB;32| (361 . |elt|)
              (367 . |delete|) (373 . |delete|) |JBLF;solveFor;$JBU;33|
              (379 . |retract|) (384 . |subst|) |JBLF;subst;$JB2$;34|
              (|Record| (|:| |Ech| $) (|:| |Lt| 136) (|:| |Pivots| 54)
                        (|:| |Rank| 20))
              (391 . |primitiveRowEchelon|) (|Matrix| 141)
              (396 . |maxRowIndex|) (401 . |allIndices|) (406 . ~=)
              (412 . |minIndex|) (|Fraction| 7) (417 . |zero?|) (|List| 20)
              (422 . |minIndex|) (|Union| '"failed" (|List| 143))
              (|Record| (|:| |Sys| 44) (|:| JM 111) (|:| |Depend| 145))
              |JBLF;simplify;LSemR;35| |JBLF;simpOne;2$;36|
              (|Record| (|:| |DSys| 44) (|:| |JVars| 118))
              (|Record| (|:| |DPhi| $) (|:| |JVars| 48)) (|Union| 6 '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|List| 24) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 427 |zero?| 433 |unitNormal| 438 |unitCanonical| 443 |unit?|
              448 |symbol| 453 |subtractIfCan| 458 |subst| 464 |sortLD| 471
              |solveFor| 476 |simplify| 482 |simpOne| 488 |simpMod| 493
              |setNotation| 506 |sample| 511 |retractIfCan| 515 |retract| 530
              |reduceMod| 545 |recip| 551 |orderDim| 556 |order| 563 |one?| 568
              |numerator| 573 |numIndVar| 578 |numDepVar| 582 |leadingDer| 586
              |lcmCoef| 591 |lcm| 597 |latex| 608 |jetVariables| 613
              |jacobiMatrix| 618 |hashUpdate!| 629 |hash| 635 |ground?| 640
              |ground| 645 |getNotation| 650 |gcdPolynomial| 654 |gcd| 660
              |freeOf?| 671 |formalDiff2| 677 |formalDiff| 691 |extractSymbol|
              709 |exquo| 714 |dimension| 720 |differentiate| 727 |denominator|
              759 |dSubst| 764 |const?| 771 |coerce| 776 |class| 811
              |characteristic| 816 |autoReduce| 820 |associates?| 825 ^ 831
              |Zero| 843 X 847 U 856 P 865 |One| 887 = 891 - 897 + 908 * 914
              |#2| 950)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 1))
            (CONS
             '#(|JetBundleFunctionCategory&| |GcdDomain&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |Module&| |EntireRing&| |Module&|
                NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |SetCategory&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|LeftOreRing|) (|Algebra| $$)
                 (|PartialDifferentialRing| 24) (|Module| 7) (|EntireRing|)
                 (|Module| $$) (|CommutativeRing|) (|BiModule| 7 7)
                 (|BiModule| $$ $$) (|Ring|) (|RightModule| 7) (|LeftModule| 7)
                 (|LeftModule| $$) (|RightModule| $$) (|Rng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|RetractableTo| 7) (|RetractableTo| 6)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 14) (|lazyRepresentation|))
              (|makeByteWordVec2| 158
                                  '(0 6 9 10 1 7 12 0 13 1 6 14 0 15 1 6 12 0
                                    16 1 7 14 0 17 2 14 0 0 0 18 1 20 14 0 21 2
                                    14 0 0 0 22 1 6 24 0 25 1 7 0 6 27 0 6 0 28
                                    0 7 0 29 1 7 12 0 31 0 14 0 34 0 35 0 36 1
                                    37 20 0 38 2 37 39 0 40 41 2 35 0 2 0 42 1
                                    35 0 0 43 2 6 12 0 0 46 3 48 0 47 0 0 49 1
                                    48 0 0 50 1 35 20 0 51 2 37 0 48 40 52 4 37
                                    53 0 40 48 54 55 2 48 12 6 0 58 1 54 7 0 59
                                    0 7 0 61 1 7 66 67 68 1 67 48 0 69 2 67 0 0
                                    6 70 1 0 66 67 71 1 0 0 67 72 2 0 0 0 0 73
                                    1 7 0 0 75 1 54 0 0 77 1 48 0 0 78 2 6 12 0
                                    0 79 2 7 0 0 0 80 2 54 0 0 0 81 2 48 0 0 0
                                    82 2 7 0 40 0 84 2 7 0 0 0 86 2 48 12 0 0
                                    88 1 7 66 0 90 2 7 66 0 0 92 2 20 12 0 0 94
                                    2 7 0 0 0 95 1 7 48 0 97 2 48 0 6 0 98 2 7
                                    0 0 24 100 2 7 0 0 6 102 2 48 40 6 0 103 1
                                    48 40 0 104 2 54 7 0 40 105 2 107 0 48 40
                                    108 4 107 53 0 40 48 35 109 2 35 0 0 0 110
                                    2 6 12 0 0 113 2 24 12 0 0 114 2 48 0 115 0
                                    116 2 48 0 47 0 117 2 7 12 0 6 121 2 12 0 0
                                    0 122 3 124 12 123 0 12 125 2 54 7 0 40 127
                                    2 54 0 0 40 128 2 48 0 0 40 129 1 0 7 0 131
                                    3 7 0 0 6 0 132 1 37 134 0 135 1 136 40 0
                                    137 1 107 48 0 138 2 24 12 0 0 139 1 35 40
                                    0 140 1 141 12 0 142 1 143 40 0 144 2 0 12
                                    0 0 1 1 0 12 0 19 1 0 152 0 1 1 0 0 0 1 1 0
                                    12 0 1 1 0 111 44 1 2 0 66 0 0 1 3 0 0 0 6
                                    0 133 1 0 44 44 1 2 0 66 0 6 130 2 0 146 44
                                    111 147 1 0 0 0 148 2 0 44 44 44 1 3 0 146
                                    44 111 44 1 1 0 53 24 1 0 0 0 1 1 2 66 67
                                    71 1 0 62 0 63 1 0 151 0 1 1 2 0 67 72 1 0
                                    7 0 131 1 0 6 0 1 2 0 44 44 44 1 1 0 66 0
                                    91 3 0 20 44 111 20 1 1 0 20 0 1 1 0 12 0 1
                                    1 0 0 0 64 0 0 9 1 0 0 9 1 1 0 6 0 120 2 0
                                    153 0 0 1 2 0 0 0 0 1 1 0 0 44 1 1 0 157 0
                                    1 1 0 48 0 99 2 0 111 44 118 119 1 0 111 44
                                    112 2 0 156 156 0 1 1 0 158 0 1 1 0 12 0 57
                                    1 0 0 0 60 0 0 24 1 2 0 154 154 154 1 1 0 0
                                    44 1 2 0 0 0 0 96 2 0 12 0 6 126 3 0 149 44
                                    9 111 1 3 0 150 0 9 111 1 2 0 44 44 9 1 2 0
                                    0 0 143 1 2 0 0 0 9 1 1 0 111 111 1 2 0 66
                                    0 0 93 3 0 20 44 111 20 1 2 0 0 0 6 106 3 0
                                    0 0 155 143 1 2 0 0 0 155 1 3 0 0 0 24 20 1
                                    2 0 0 0 24 101 1 0 0 0 65 3 0 0 0 6 0 1 1 0
                                    12 0 1 1 0 37 44 56 1 0 44 37 45 1 0 0 7 33
                                    1 0 0 6 30 1 0 0 0 1 1 0 0 40 1 1 0 14 0 23
                                    1 0 20 0 1 0 0 20 1 1 0 44 44 1 2 0 12 0 0
                                    1 2 0 0 0 20 1 2 0 0 0 9 1 0 0 0 32 0 0 0 1
                                    1 0 0 9 1 0 0 0 1 1 0 0 9 1 1 0 0 20 1 1 0
                                    0 143 1 2 0 0 9 20 1 2 0 0 9 143 1 0 0 0 26
                                    2 0 12 0 0 74 1 0 0 0 76 2 0 0 0 0 73 2 0 0
                                    0 0 83 2 0 0 7 0 87 2 0 0 0 7 1 2 0 0 0 0
                                    89 2 0 0 40 0 85 2 0 0 20 0 1 2 0 0 9 0 1 3
                                    0 0 0 155 143 1 2 0 0 0 155 1 3 0 0 0 24 20
                                    1 2 0 0 0 24 1)))))
           '|lookupComplete|)) 
