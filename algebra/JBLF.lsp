
(SDEFUN |JBLF;monom| ((|c| (D)) (|jv| (JB)) (% (|OutputForm|)))
        (COND ((SPADCALL |c| (QREFELT % 13)) (SPADCALL |jv| (QREFELT % 15)))
              ((SPADCALL |jv| (QREFELT % 16)) (SPADCALL |c| (QREFELT % 17)))
              ('T
               (SPADCALL (SPADCALL |c| (QREFELT % 17))
                         (SPADCALL |jv| (QREFELT % 15)) (QREFELT % 18))))) 

(SDEFUN |JBLF;coerce;%Of;2| ((|l| (%)) (% (|OutputForm|)))
        (SPROG
         ((|res| (|OutputForm|)) (#1=#:G64 NIL) (|c| NIL) (#2=#:G65 NIL)
          (|jv| NIL))
         (SEQ
          (COND ((SPADCALL |l| (QREFELT % 19)) (SPADCALL 0 (QREFELT % 21)))
                ('T
                 (SEQ
                  (LETT |res|
                        (|JBLF;monom| (|SPADfirst| (QCAR |l|))
                         (|SPADfirst| (QCDR |l|)) %))
                  (SEQ (LETT |jv| NIL) (LETT #2# (CDR (QCDR |l|)))
                       (LETT |c| NIL) (LETT #1# (CDR (QCAR |l|))) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL)
                             (ATOM #2#) (PROGN (LETT |jv| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res| (|JBLF;monom| |c| |jv| %)
                                         (QREFELT % 22)))))
                       (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(SDEFUN |JBLF;coerce;JB%;3| ((|jv| (JB)) (% (%)))
        (SPROG ((|jt| (|Symbol|)))
               (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 25)))
                    (EXIT
                     (COND ((EQUAL |jt| '|Const|) (|spadConstant| % 26))
                           ((EQUAL |jt| '|Indep|)
                            (CONS (LIST (SPADCALL |jv| (QREFELT % 27)))
                                  (LIST (|spadConstant| % 28))))
                           ('T
                            (CONS (LIST (|spadConstant| % 29))
                                  (LIST |jv|)))))))) 

(SDEFUN |JBLF;coerce;D%;4| ((|ex| (D)) (% (%)))
        (COND ((SPADCALL |ex| (QREFELT % 31)) (|spadConstant| % 32))
              ('T (CONS (LIST |ex|) (LIST (|spadConstant| % 28)))))) 

(SDEFUN |JBLF;coerce;SemL;5|
        ((|jm| (|SparseEchelonMatrix| JB D)) (% (|List| %)))
        (SPROG
         ((|res| (|List| %))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (#1=#:G76 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |jm| (QREFELT % 35))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |jm| |i| (QREFELT % 38)))
                        (EXIT
                         (COND
                          ((NULL (NULL (QCAR |r|)))
                           (LETT |res|
                                 (SPADCALL (CONS (QCDR |r|) (QCAR |r|)) |res|
                                           (QREFELT % 40)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 41)))))) 

(SDEFUN |JBLF;coerce;LSem;6|
        ((|ll| (|List| %)) (% (|SparseEchelonMatrix| JB D)))
        (SPROG
         ((#1=#:G86 NIL) (|l| NIL) (|i| NIL)
          (|res| (|SparseEchelonMatrix| JB D)) (|inds| (|List| JB))
          (#2=#:G85 NIL))
         (SEQ (LETT |inds| NIL)
              (SEQ (LETT |l| NIL) (LETT #2# |ll|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |l| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |inds|
                           (SPADCALL
                            (SPADCALL (ELT % 44) |inds| (QCDR |l|)
                                      (QREFELT % 47))
                            (QREFELT % 48)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |inds| (SPADCALL |ll| (QREFELT % 49))
                              (QREFELT % 50)))
              (SEQ (LETT |i| 1) (LETT |l| NIL) (LETT #1# |ll|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |res| |i| (QCDR |l|) (QCAR |l|)
                               (QREFELT % 53))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBLF;ground?;%B;7| ((|l| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |l| (QREFELT % 19)) 'T)
              ('T (SPADCALL (|SPADfirst| (QCDR |l|)) (QREFELT % 16))))) 

(SDEFUN |JBLF;ground;2%;8| ((|l| (%)) (% (%)))
        (COND
         ((NULL (SPADCALL (|spadConstant| % 28) (QCDR |l|) (QREFELT % 56)))
          (|spadConstant| % 32))
         ('T
          (CONS (LIST (SPADCALL (QCAR |l|) (QREFELT % 57)))
                (LIST (|spadConstant| % 28)))))) 

(SDEFUN |JBLF;retractIfCan;%U;9| ((|l| (%)) (% (|Union| D "failed")))
        (COND ((SPADCALL |l| (QREFELT % 19)) (CONS 0 (|spadConstant| % 59)))
              ((SPADCALL (|SPADfirst| (QCDR |l|)) (QREFELT % 16))
               (CONS 0 (|SPADfirst| (QCAR |l|))))
              ('T (CONS 1 "failed")))) 

(PUT '|JBLF;numerator;2%;10| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |JBLF;numerator;2%;10| ((|l| (%)) (% (%))) |l|) 

(SDEFUN |JBLF;denominator;2%;11| ((|l| (%)) (% (%))) (|spadConstant| % 26)) 

(SDEFUN |JBLF;retractIfCan;JbeU;12|
        ((|ex| (|JetBundleExpression| JB)) (% (|Union| % "failed")))
        (SPROG
         ((|resC| (|List| D)) (#1=#:G116 NIL) (|cd| #2=(|Union| D "failed"))
          (#3=#:G117 NIL) (|jv| NIL) (|resJ| (|List| JB)) (|pd| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |pd| (SPADCALL |ex| (QREFELT % 66)))
                (EXIT
                 (COND
                  ((QEQCAR |pd| 0)
                   (CONS 0
                         (CONS (LIST (QCDR |pd|))
                               (LIST (|spadConstant| % 28)))))
                  ('T
                   (SEQ (LETT |resJ| (SPADCALL |ex| (QREFELT % 67)))
                        (LETT |resC| NIL)
                        (SEQ (LETT |jv| NIL) (LETT #3# |resJ|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |jv| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |cd|
                                    (SPADCALL
                                     (SPADCALL |ex| |jv| (QREFELT % 68))
                                     (QREFELT % 66)))
                              (EXIT
                               (COND
                                ((QEQCAR |cd| 1)
                                 (PROGN
                                  (LETT #1# (CONS 1 "failed"))
                                  (GO #4=#:G115)))
                                ('T (LETT |resC| (CONS (QCDR |cd|) |resC|))))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (CONS 0 (CONS (NREVERSE |resC|) |resJ|)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |JBLF;retract;Jbe%;13| ((|ex| (|JetBundleExpression| JB)) (% (%)))
        (SPROG ((|pl| (|Union| % "failed")))
               (SEQ (LETT |pl| (SPADCALL |ex| (QREFELT % 69)))
                    (EXIT
                     (COND ((QEQCAR |pl| 1) (|error| "non-linear function"))
                           ('T (QCDR |pl|))))))) 

(SDEFUN |JBLF;zero?;%B;14| ((|l| (%)) (% (|Boolean|))) (NULL (QCDR |l|))) 

(SDEFUN |JBLF;=;2%B;15| ((|l1| (%)) (|l2| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT % 71)) (QREFELT % 19))) 

(PUT '|JBLF;Zero;%;16| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |JBLF;Zero;%;16| ((% (%))) (CONS NIL NIL)) 

(SDEFUN |JBLF;One;%;17| ((% (%)))
        (CONS (LIST (|spadConstant| % 29)) (LIST (|spadConstant| % 28)))) 

(SDEFUN |JBLF;-;2%;18| ((|l| (%)) (% (%)))
        (SPROG ((#1=#:G131 NIL) (|c| NIL) (#2=#:G130 NIL))
               (SEQ
                (CONS
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |c| (QREFELT % 73)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QCDR |l|))))) 

(SDEFUN |JBLF;+;3%;19| ((|l1| (%)) (|l2| (%)) (% (%)))
        (SPROG
         ((|lj2| (|List| JB)) (|lc2| (|List| D)) (|resJ| (|List| JB))
          (|resC| (|List| D)) (|sum| (D)) (#1=#:G150 NIL) (|c1| NIL)
          (#2=#:G151 NIL) (|j1| NIL))
         (SEQ
          (COND ((SPADCALL |l1| (QREFELT % 19)) |l2|)
                ((SPADCALL |l2| (QREFELT % 19)) |l1|)
                ('T
                 (SEQ (LETT |lc2| (SPADCALL (QCAR |l2|) (QREFELT % 75)))
                      (LETT |lj2| (SPADCALL (QCDR |l2|) (QREFELT % 76)))
                      (LETT |resC| NIL) (LETT |resJ| NIL)
                      (SEQ (LETT |j1| NIL) (LETT #2# (QCDR |l1|))
                           (LETT |c1| NIL) (LETT #1# (QCAR |l1|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#)) NIL)
                                 (ATOM #2#) (PROGN (LETT |j1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |lj2|) NIL)
                                          ('T
                                           (SPADCALL (|SPADfirst| |lj2|) |j1|
                                                     (QREFELT % 44)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |resC|
                                        (CONS (|SPADfirst| |lc2|) |resC|))
                                  (LETT |resJ|
                                        (CONS (|SPADfirst| |lj2|) |resJ|))
                                  (LETT |lc2| (CDR |lc2|))
                                  (EXIT (LETT |lj2| (CDR |lj2|))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (COND
                              ((OR (NULL |lj2|)
                                   (NULL
                                    (SPADCALL (|SPADfirst| |lj2|) |j1|
                                              (QREFELT % 77))))
                               (SEQ (LETT |resC| (CONS |c1| |resC|))
                                    (EXIT (LETT |resJ| (CONS |j1| |resJ|)))))
                              ('T
                               (SEQ
                                (LETT |sum|
                                      (SPADCALL |c1| (|SPADfirst| |lc2|)
                                                (QREFELT % 78)))
                                (COND
                                 ((NULL (SPADCALL |sum| (QREFELT % 31)))
                                  (SEQ (LETT |resC| (CONS |sum| |resC|))
                                       (EXIT
                                        (LETT |resJ| (CONS |j1| |resJ|))))))
                                (LETT |lc2| (CDR |lc2|))
                                (EXIT (LETT |lj2| (CDR |lj2|))))))))
                           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (CONS (SPADCALL (NREVERSE |resC|) |lc2| (QREFELT % 79))
                             (SPADCALL (NREVERSE |resJ|) |lj2|
                                       (QREFELT % 80)))))))))) 

(SDEFUN |JBLF;*;I2%;20| ((|i| (|Integer|)) (|l| (%)) (% (%)))
        (SPROG ((#1=#:G158 NIL) (|c| NIL) (#2=#:G157 NIL))
               (SEQ
                (COND ((ZEROP |i|) (|spadConstant| % 32)) ((EQL |i| 1) |l|)
                      ('T
                       (CONS
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |i| |c| (QREFELT % 82))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QCDR |l|))))))) 

(SDEFUN |JBLF;*;D2%;21| ((|ex| (D)) (|l| (%)) (% (%)))
        (SPROG ((#1=#:G165 NIL) (|c| NIL) (#2=#:G164 NIL))
               (SEQ
                (COND ((SPADCALL |ex| (QREFELT % 31)) (|spadConstant| % 32))
                      ((SPADCALL |ex| (QREFELT % 13)) |l|)
                      ('T
                       (CONS
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |ex| |c| (QREFELT % 84))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QCDR |l|))))))) 

(SDEFUN |JBLF;*;3%;22| ((|l1| (%)) (|l2| (%)) (% (%)))
        (COND
         ((OR (SPADCALL |l1| (QREFELT % 19)) (SPADCALL |l2| (QREFELT % 19)))
          (|spadConstant| % 32))
         ('T
          (COND
           ((SPADCALL (QCDR |l1|) (LIST (|spadConstant| % 28)) (QREFELT % 86))
            (SPADCALL (|SPADfirst| (QCAR |l1|)) |l2| (QREFELT % 85)))
           ((SPADCALL (QCDR |l2|) (LIST (|spadConstant| % 28)) (QREFELT % 86))
            (SPADCALL (|SPADfirst| (QCAR |l2|)) |l1| (QREFELT % 85)))
           ('T (|error| "non-linear function")))))) 

(SDEFUN |JBLF;recip;%U;23| ((|l| (%)) (% (|Union| % "failed")))
        (SPROG ((|rc| (|Union| D "failed")))
               (SEQ
                (COND
                 ((SPADCALL (QCDR |l|) (LIST (|spadConstant| % 28))
                            (QREFELT % 86))
                  (SEQ
                   (LETT |rc|
                         (SPADCALL (|SPADfirst| (QCAR |l|)) (QREFELT % 88)))
                   (EXIT
                    (COND
                     ((QEQCAR |rc| 0)
                      (CONS 0 (SPADCALL (QCDR |rc|) (QREFELT % 33))))
                     (#1='T (CONS 1 "failed"))))))
                 (#1# (CONS 1 "failed")))))) 

(SDEFUN |JBLF;exquo;2%U;24| ((|l1| (%)) (|l2| (%)) (% (|Union| % #1="failed")))
        (SPROG
         ((|newC| (|List| D)) (#2=#:G195 NIL) (|e| (|Union| D #1#))
          (#3=#:G196 NIL) (|c| NIL) (|d| (D)))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL (|SPADfirst| (QCDR |l2|)) (QREFELT % 16)))
             (CONS 1 "failed"))
            ('T
             (SEQ (LETT |d| (|SPADfirst| (QCAR |l2|))) (LETT |newC| NIL)
                  (SEQ (LETT |c| NIL) (LETT #3# (QCAR |l1|)) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |e| (SPADCALL |c| |d| (QREFELT % 90)))
                            (EXIT
                             (COND
                              ((QEQCAR |e| 1)
                               (PROGN
                                (LETT #2# (CONS 1 "failed"))
                                (GO #4=#:G194)))
                              ('T (LETT |newC| (CONS (QCDR |e|) |newC|))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 (CONS (NREVERSE |newC|) (QCDR |l1|))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |JBLF;gcd;3%;25| ((|l1| (%)) (|l2| (%)) (% (%)))
        (SPROG ((|g| (D)))
               (SEQ
                (COND
                 ((OR (> (LENGTH (QCDR |l1|)) 1) (> (LENGTH (QCDR |l2|)) 1))
                  (|spadConstant| % 26))
                 ('T
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|SPADfirst| (QCAR |l1|))
                                   (|SPADfirst| (QCAR |l2|)) (QREFELT % 92)))
                   (EXIT
                    (COND
                     ((SPADCALL (|SPADfirst| (QCDR |l1|))
                                (|SPADfirst| (QCDR |l2|)) (QREFELT % 77))
                      (CONS (LIST |g|) (QCDR |l1|)))
                     ('T (SPADCALL |g| (QREFELT % 33))))))))))) 

(SDEFUN |JBLF;jetVariables;%L;26| ((|l| (%)) (% (|List| JB)))
        (SPROG ((|res| (|List| JB)) (#1=#:G210 NIL) (|c| NIL))
               (SEQ
                (COND ((SPADCALL |l| (QREFELT % 19)) NIL)
                      (#2='T
                       (SEQ (LETT |res| NIL)
                            (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |c| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL (ELT % 44) |res|
                                                   (SPADCALL |c|
                                                             (QREFELT % 94))
                                                   (QREFELT % 47)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |res| (SPADCALL |res| (QREFELT % 48)))
                            (COND
                             ((SPADCALL (|spadConstant| % 28) (QCDR |l|)
                                        (QREFELT % 56))
                              (LETT |res|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 28) (QCDR |l|)
                                               (QREFELT % 95))
                                     |res| (QREFELT % 80))))
                             (#2#
                              (LETT |res|
                                    (SPADCALL (QCDR |l|) |res|
                                              (QREFELT % 96)))))
                            (EXIT |res|))))))) 

(SDEFUN |JBLF;differentiate;%S%;27| ((|l| (%)) (|s| (|Symbol|)) (% (%)))
        (SPROG
         ((|resJ| (|List| JB)) (|resC| (|List| D)) (|dc| (D)) (#1=#:G217 NIL)
          (|c| NIL) (#2=#:G218 NIL) (|j| NIL))
         (SEQ (LETT |resC| NIL) (LETT |resJ| NIL)
              (SEQ (LETT |j| NIL) (LETT #2# (QCDR |l|)) (LETT |c| NIL)
                   (LETT #1# (QCAR |l|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL) (ATOM #2#)
                         (PROGN (LETT |j| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |dc| (SPADCALL |c| |s| (QREFELT % 98)))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |dc| (QREFELT % 31)))
                           (SEQ (LETT |resC| (CONS |dc| |resC|))
                                (EXIT (LETT |resJ| (CONS |j| |resJ|))))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))) 

(SDEFUN |JBLF;differentiate;%JB%;28| ((|l| (%)) (|jv| (JB)) (% (%)))
        (SPROG
         ((|pos| (|Integer|)) (|resJ| (|List| JB)) (|resC| (|List| D))
          (|dc| (D)) (#1=#:G227 NIL) (|c| NIL) (#2=#:G228 NIL) (|j| NIL)
          (|jt| (|Symbol|)))
         (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 25)))
              (EXIT
               (COND
                ((EQUAL |jt| '|Indep|)
                 (SEQ (LETT |resC| NIL) (LETT |resJ| NIL)
                      (SEQ (LETT |j| NIL) (LETT #2# (QCDR |l|)) (LETT |c| NIL)
                           (LETT #1# (QCAR |l|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL)
                                 (ATOM #2#) (PROGN (LETT |j| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |dc| (SPADCALL |c| |jv| (QREFELT % 100)))
                                (EXIT
                                 (COND
                                  ((NULL (SPADCALL |dc| (QREFELT % 31)))
                                   (SEQ (LETT |resC| (CONS |dc| |resC|))
                                        (EXIT
                                         (LETT |resJ| (CONS |j| |resJ|))))))))
                           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
                (#3='T
                 (SEQ (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT % 101)))
                      (EXIT
                       (COND
                        ((< |pos| (PROGN (QCDR |l|) 1)) (|spadConstant| % 32))
                        (#3#
                         (CONS
                          (LIST (SPADCALL (QCAR |l|) |pos| (QREFELT % 102)))
                          (LIST (|spadConstant| % 28))))))))))))) 

(SDEFUN |JBLF;jacobiMatrix;LSem;29|
        ((|sys| (|List| %)) (% (|SparseEchelonMatrix| JB %)))
        (SPROG
         ((|rowC| (|List| %)) (|rowJ| (|List| JB)) (|dCo| (|List| D))
          (|dJV| (|List| JB)) (|dco| (D)) (#1=#:G269 NIL) (|co| NIL)
          (#2=#:G270 NIL) (|jv| NIL) (#3=#:G268 NIL) (|cjv| NIL)
          (|ents| (|List| %)) (#4=#:G267 NIL) (#5=#:G266 NIL) (#6=#:G265 NIL)
          (|eq| NIL) (|i| NIL) (|res| (|SparseEchelonMatrix| JB %))
          (#7=#:G264 NIL) (#8=#:G263 NIL) (#9=#:G262 NIL) (|cinds| (|List| JB))
          (#10=#:G261 NIL) (|inds| (|List| JB)) (#11=#:G260 NIL))
         (SEQ (LETT |inds| NIL) (LETT |cinds| NIL)
              (SEQ (LETT |eq| NIL) (LETT #11# |sys|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |inds|
                          (SPADCALL
                           (SPADCALL (ELT % 44) |inds| (QCDR |eq|)
                                     (QREFELT % 47))
                           (QREFELT % 48)))
                    (EXIT
                     (SEQ (LETT |co| NIL) (LETT #10# (QCAR |eq|)) G190
                          (COND
                           ((OR (NULL (< (LENGTH |cinds|) (QREFELT % 11)))
                                (ATOM #10#) (PROGN (LETT |co| (CAR #10#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |cinds|
                                  (SPADCALL
                                   (SPADCALL (ELT % 44) |cinds|
                                             (SPADCALL |co| (QREFELT % 94))
                                             (QREFELT % 47))
                                   (QREFELT % 48)))))
                          (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL |cinds|)
                 (SEQ
                  (LETT |res|
                        (SPADCALL |inds| (SPADCALL |sys| (QREFELT % 49))
                                  (QREFELT % 105)))
                  (SEQ (LETT |i| 1) (LETT |eq| NIL) (LETT #9# |sys|) G190
                       (COND
                        ((OR (ATOM #9#) (PROGN (LETT |eq| (CAR #9#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QCDR |eq|)
                                   (PROGN
                                    (LETT #8# NIL)
                                    (SEQ (LETT |co| NIL) (LETT #7# (QCAR |eq|))
                                         G190
                                         (COND
                                          ((OR (ATOM #7#)
                                               (PROGN
                                                (LETT |co| (CAR #7#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #8#
                                                 (CONS
                                                  (SPADCALL |co|
                                                            (QREFELT % 33))
                                                  #8#))))
                                         (LETT #7# (CDR #7#)) (GO G190) G191
                                         (EXIT (NREVERSE #8#))))
                                   (QREFELT % 106))))
                       (LETT #9# (PROG1 (CDR #9#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                ('T
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |inds| |cinds| (QREFELT % 96))
                                  (SPADCALL |sys| (QREFELT % 49))
                                  (QREFELT % 105)))
                  (SEQ (LETT |i| 1) (LETT |eq| NIL) (LETT #6# |sys|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |eq| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ents|
                              (PROGN
                               (LETT #5# NIL)
                               (SEQ (LETT |co| NIL) (LETT #4# (QCAR |eq|)) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN (LETT |co| (CAR #4#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #5#
                                            (CONS
                                             (SPADCALL |co| (QREFELT % 33))
                                             #5#))))
                                    (LETT #4# (CDR #4#)) (GO G190) G191
                                    (EXIT (NREVERSE #5#)))))
                        (LETT |rowJ| NIL) (LETT |rowC| NIL)
                        (SEQ (LETT |cjv| NIL) (LETT #3# |cinds|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |cjv| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |dJV| NIL) (LETT |dCo| NIL)
                                  (SEQ (LETT |jv| NIL) (LETT #2# (QCDR |eq|))
                                       (LETT |co| NIL) (LETT #1# (QCAR |eq|))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |co| (CAR #1#)) NIL)
                                             (ATOM #2#)
                                             (PROGN (LETT |jv| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |dco|
                                              (SPADCALL |co| |cjv|
                                                        (QREFELT % 100)))
                                        (EXIT
                                         (COND
                                          ((NULL
                                            (SPADCALL |dco| (QREFELT % 31)))
                                           (SEQ (LETT |dJV| (CONS |jv| |dJV|))
                                                (EXIT
                                                 (LETT |dCo|
                                                       (CONS |dco|
                                                             |dCo|))))))))
                                       (LETT #1#
                                             (PROG1 (CDR #1#)
                                               (LETT #2# (CDR #2#))))
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((NULL (NULL |dJV|))
                                     (SEQ (LETT |rowJ| (CONS |cjv| |rowJ|))
                                          (EXIT
                                           (LETT |rowC|
                                                 (SPADCALL
                                                  (CONS (NREVERSE |dCo|)
                                                        (NREVERSE |dJV|))
                                                  |rowC| (QREFELT % 40)))))))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |res| |i|
                                   (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                             (QREFELT % 96))
                                   (SPADCALL |ents|
                                             (SPADCALL |rowC| (QREFELT % 41))
                                             (QREFELT % 107))
                                   (QREFELT % 106))))
                       (LETT #6# (PROG1 (CDR #6#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))))) 

(SDEFUN |JBLF;jacobiMatrix;LLSem;30|
        ((|sys| (|List| %)) (|varlist| (|List| (|List| JB)))
         (% (|SparseEchelonMatrix| JB %)))
        (SPROG
         ((|rowC| (|List| %)) (|rowJ| (|List| JB)) (|dCo| (|List| D))
          (|dJV| (|List| JB)) (|dco| (D)) (#1=#:G303 NIL) (|co| NIL)
          (#2=#:G304 NIL) (|jv| NIL) (#3=#:G302 NIL) (|ijv| NIL)
          (|ivars| (|List| JB)) (|ents| (|List| %)) (#4=#:G301 NIL)
          (#5=#:G300 NIL) (#6=#:G298 NIL) (|eq| NIL) (#7=#:G299 NIL)
          (|vars| NIL) (|i| NIL) (|res| (|SparseEchelonMatrix| JB %))
          (|inds| (|List| JB)) (#8=#:G297 NIL))
         (SEQ (LETT |inds| (|SPADfirst| |varlist|))
              (SEQ (LETT |vars| NIL) (LETT #8# (CDR |varlist|)) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |vars| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |inds|
                           (SPADCALL
                            (SPADCALL (ELT % 44) |inds| |vars| (QREFELT % 47))
                            (QREFELT % 48)))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |inds| (SPADCALL |sys| (QREFELT % 49))
                              (QREFELT % 105)))
              (SEQ (LETT |i| 1) (LETT |vars| NIL) (LETT #7# |varlist|)
                   (LETT |eq| NIL) (LETT #6# |sys|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |eq| (CAR #6#)) NIL)
                         (ATOM #7#) (PROGN (LETT |vars| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ents|
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |co| NIL) (LETT #4# (QCAR |eq|)) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |co| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (SPADCALL |co| (QREFELT % 33))
                                              #5#))))
                                (LETT #4# (CDR #4#)) (GO G190) G191
                                (EXIT (NREVERSE #5#)))))
                    (LETT |ivars|
                          (SPADCALL (ELT % 110)
                                    (SPADCALL
                                     (CONS #'|JBLF;jacobiMatrix;LLSem;30!0| %)
                                     |vars| (QREFELT % 113))
                                    (QREFELT % 114)))
                    (EXIT
                     (COND
                      ((NULL |ivars|)
                       (SPADCALL |res| |i| (QCDR |eq|) |ents| (QREFELT % 106)))
                      ('T
                       (SEQ (LETT |rowJ| NIL) (LETT |rowC| NIL)
                            (SEQ (LETT |ijv| NIL) (LETT #3# |ivars|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |ijv| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |dJV| NIL) (LETT |dCo| NIL)
                                      (SEQ (LETT |jv| NIL)
                                           (LETT #2# (QCDR |eq|))
                                           (LETT |co| NIL)
                                           (LETT #1# (QCAR |eq|)) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |co| (CAR #1#))
                                                  NIL)
                                                 (ATOM #2#)
                                                 (PROGN
                                                  (LETT |jv| (CAR #2#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |dco|
                                                  (SPADCALL |co| |ijv|
                                                            (QREFELT % 100)))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |dco|
                                                          (QREFELT % 31)))
                                               (SEQ
                                                (LETT |dJV| (CONS |jv| |dJV|))
                                                (EXIT
                                                 (LETT |dCo|
                                                       (CONS |dco|
                                                             |dCo|))))))))
                                           (LETT #1#
                                                 (PROG1 (CDR #1#)
                                                   (LETT #2# (CDR #2#))))
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (COND
                                        ((NULL (NULL |dJV|))
                                         (SEQ (LETT |rowJ| (CONS |ijv| |rowJ|))
                                              (EXIT
                                               (LETT |rowC|
                                                     (SPADCALL
                                                      (CONS (NREVERSE |dCo|)
                                                            (NREVERSE |dJV|))
                                                      |rowC|
                                                      (QREFELT % 40)))))))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (SPADCALL |res| |i|
                                       (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                                 (QREFELT % 96))
                                       (SPADCALL |ents|
                                                 (SPADCALL |rowC|
                                                           (QREFELT % 41))
                                                 (QREFELT % 107))
                                       (QREFELT % 106))))))))
                   (LETT #6#
                         (PROG1 (CDR #6#)
                           (LETT #7#
                                 (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBLF;jacobiMatrix;LLSem;30!0| ((|x| NIL) (% NIL))
        (SPADCALL (SPADCALL |x| (QREFELT % 25)) '|Indep| (QREFELT % 111))) 

(SDEFUN |JBLF;leadingDer;%JB;31| ((|l| (%)) (% (JB)))
        (COND ((SPADCALL |l| (QREFELT % 19)) (|spadConstant| % 28))
              ('T (|SPADfirst| (QCDR |l|))))) 

(SDEFUN |JBLF;freeOf?;%JBB;32| ((|l| (%)) (|jv| (JB)) (% (|Boolean|)))
        (SPROG ((#1=#:G318 NIL) (|c| NIL) (#2=#:G317 NIL))
               (SEQ
                (COND
                 ((EQUAL (SPADCALL |jv| (QREFELT % 25)) '|Indep|)
                  (SPADCALL (ELT % 119)
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |c| |jv| (QREFELT % 118))
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            'T (QREFELT % 122)))
                 ('T (NULL (SPADCALL |jv| (QCDR |l|) (QREFELT % 56)))))))) 

(SDEFUN |JBLF;solveFor;%JBU;33|
        ((|l| (%)) (|jv| (JB)) (% (|Union| % "failed")))
        (SPROG
         ((#1=#:G333 NIL) (|c| NIL) (#2=#:G332 NIL) (|rc| (|Union| D "failed"))
          (|pos| (|Integer|)) (|jt| (|Symbol|)))
         (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 25)))
              (COND
               ((OR (EQUAL |jt| '|Const|) (EQUAL |jt| '|Indep|))
                (EXIT (CONS 1 "failed"))))
              (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT % 101)))
              (EXIT
               (COND ((< |pos| (PROGN (QCDR |l|) 1)) (CONS 1 "failed"))
                     ((EQL (LENGTH (QCDR |l|)) 1)
                      (CONS 0 (|spadConstant| % 32)))
                     (#3='T
                      (SEQ
                       (LETT |rc|
                             (SPADCALL
                              (SPADCALL (QCAR |l|) |pos| (QREFELT % 124))
                              (QREFELT % 88)))
                       (EXIT
                        (COND ((QEQCAR |rc| 1) (CONS 1 "failed"))
                              (#3#
                               (CONS 0
                                     (CONS
                                      (PROGN
                                       (LETT #2# NIL)
                                       (SEQ (LETT |c| NIL)
                                            (LETT #1#
                                                  (SPADCALL (QCAR |l|) |pos|
                                                            (QREFELT % 125)))
                                            G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |c| (CAR #1#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL |c| (QCDR |rc|)
                                                                (QREFELT % 84))
                                                      (QREFELT % 73))
                                                     #2#))))
                                            (LETT #1# (CDR #1#)) (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      (SPADCALL (QCDR |l|) |pos|
                                                (QREFELT % 126)))))))))))))) 

(SDEFUN |JBLF;subst;%JB2%;34| ((|l| (%)) (|jv| (JB)) (|exp| (%)) (% (%)))
        (SPROG
         ((|nl| (%)) (|c| (D)) (|pos| (|Integer|)) (|resJ| (|List| JB))
          (|resC| (|List| D)) (|nc| (D)) (#1=#:G343 NIL) (#2=#:G344 NIL)
          (|cj| NIL) (|xexp| (D)) (|jt| (|Symbol|)))
         (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 25)))
              (EXIT
               (COND
                ((EQUAL |jt| '|Const|)
                 (|error| "Substitution for 1 not allowed"))
                ((EQUAL |jt| '|Indep|)
                 (SEQ (LETT |xexp| (SPADCALL |exp| (QREFELT % 128)))
                      (LETT |resC| NIL) (LETT |resJ| NIL)
                      (SEQ (LETT |cj| NIL) (LETT #2# (QCDR |l|))
                           (LETT #1# (QCAR |l|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL)
                                 (ATOM #2#) (PROGN (LETT |cj| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |nc|
                                  (SPADCALL |c| |jv| |xexp| (QREFELT % 129)))
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |nc| (QREFELT % 31)))
                               (SEQ (LETT |resC| (CONS |nc| |resC|))
                                    (EXIT
                                     (LETT |resJ| (CONS |cj| |resJ|))))))))
                           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
                (#3='T
                 (SEQ (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT % 101)))
                      (EXIT
                       (COND ((ZEROP |pos|) |l|)
                             (#3#
                              (SEQ
                               (LETT |c|
                                     (SPADCALL (QCAR |l|) |pos|
                                               (QREFELT % 102)))
                               (LETT |nl|
                                     (CONS
                                      (SPADCALL (QCAR |l|) |pos|
                                                (QREFELT % 125))
                                      (SPADCALL (QCDR |l|) |pos|
                                                (QREFELT % 126))))
                               (EXIT
                                (SPADCALL |nl|
                                          (SPADCALL |c| |exp| (QREFELT % 85))
                                          (QREFELT % 81)))))))))))))) 

(SDEFUN |JBLF;simplify;LSemR;35|
        ((|sys| (|List| . #1=(%))) (|jm| (|SparseEchelonMatrix| JB . #1#))
         (%
          (|Record| (|:| |Sys| (|List| %))
                    (|:| JM (|SparseEchelonMatrix| JB %))
                    (|:| |Depend|
                         (|Union| "failed"
                                  (|List| (|List| (|NonNegativeInteger|))))))))
        (SPROG
         ((|dep| (|List| (|List| (|NonNegativeInteger|))))
          (|depj| (|List| (|NonNegativeInteger|))) (#2=#:G371 NIL)
          (#3=#:G391 NIL) (|k| NIL) (|rowC| (|List| %)) (|rowJ| (|List| JB))
          (|dCo| (|List| D)) (|dJV| (|List| JB)) (|dco| (D)) (#4=#:G389 NIL)
          (|co| NIL) (#5=#:G390 NIL) (|jv| NIL) (#6=#:G388 NIL) (|cjv| NIL)
          (|ents| (|List| %)) (#7=#:G387 NIL) (#8=#:G386 NIL) (#9=#:G385 NIL)
          (#10=#:G384 NIL) (#11=#:G383 NIL) (|eq| NIL) (|j| NIL)
          (|newJM| (|SparseEchelonMatrix| JB %)) (|cinds| (|List| JB))
          (|inds| (|List| JB)) (|maxR| (|Integer|)) (|minR| (|Integer|))
          (|Trafo| #12=(|Matrix| (|Fraction| D))) (|newSys| (|List| %))
          (|RRec|
           (|Record| (|:| |Ech| (|SparseEchelonMatrix| JB D)) (|:| |Lt| #12#)
                     (|:| |Pivots| (|List| D))
                     (|:| |Rank| (|NonNegativeInteger|)))))
         (SEQ
          (COND
           ((EQL (SPADCALL |sys| (QREFELT % 49)) 1)
            (VECTOR |sys| |jm| (CONS 1 (LIST (LIST 1)))))
           ('T
            (SEQ
             (LETT |RRec|
                   (SPADCALL (SPADCALL |sys| (QREFELT % 54)) (QREFELT % 132)))
             (LETT |newSys| (SPADCALL (QVELT |RRec| 0) (QREFELT % 43)))
             (LETT |Trafo| (QVELT |RRec| 1)) (LETT |minR| (PROGN |Trafo| 1))
             (LETT |maxR| (SPADCALL |Trafo| (QREFELT % 134)))
             (LETT |inds| (SPADCALL |jm| (QREFELT % 135)))
             (LETT |cinds| (SPADCALL |inds| (QREFELT % 76)))
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((NULL |cinds|) NIL)
                           ('T
                            (SPADCALL
                             (SPADCALL (|SPADfirst| |cinds|) (QREFELT % 25))
                             '|Indep| (QREFELT % 136)))))
                    (GO G191)))
                  (SEQ (EXIT (LETT |cinds| (CDR |cinds|)))) NIL (GO G190) G191
                  (EXIT NIL))
             (COND ((NULL (NULL |cinds|)) (LETT |cinds| (NREVERSE |cinds|))))
             (LETT |newJM|
                   (SPADCALL |inds| (SPADCALL |newSys| (QREFELT % 49))
                             (QREFELT % 105)))
             (LETT |dep| NIL)
             (SEQ (LETT |j| 1) (LETT |eq| NIL) (LETT #11# |newSys|) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#)) NIL))
                    (GO G191)))
                  (SEQ
                   (COND
                    ((NULL |cinds|)
                     (SPADCALL |newJM| |j| (QCDR |eq|)
                               (PROGN
                                (LETT #10# NIL)
                                (SEQ (LETT |co| NIL) (LETT #9# (QCAR |eq|))
                                     G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN (LETT |co| (CAR #9#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #10#
                                             (CONS
                                              (SPADCALL |co| (QREFELT % 33))
                                              #10#))))
                                     (LETT #9# (CDR #9#)) (GO G190) G191
                                     (EXIT (NREVERSE #10#))))
                               (QREFELT % 106)))
                    ('T
                     (SEQ
                      (LETT |ents|
                            (PROGN
                             (LETT #8# NIL)
                             (SEQ (LETT |co| NIL) (LETT #7# (QCAR |eq|)) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |co| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8#
                                          (CONS (SPADCALL |co| (QREFELT % 33))
                                                #8#))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT (NREVERSE #8#)))))
                      (LETT |rowJ| NIL) (LETT |rowC| NIL)
                      (SEQ (LETT |cjv| NIL) (LETT #6# |cinds|) G190
                           (COND
                            ((OR (ATOM #6#) (PROGN (LETT |cjv| (CAR #6#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |dJV| NIL) (LETT |dCo| NIL)
                                (SEQ (LETT |jv| NIL) (LETT #5# (QCDR |eq|))
                                     (LETT |co| NIL) (LETT #4# (QCAR |eq|))
                                     G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN (LETT |co| (CAR #4#)) NIL)
                                           (ATOM #5#)
                                           (PROGN (LETT |jv| (CAR #5#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |dco|
                                            (SPADCALL |co| |cjv|
                                                      (QREFELT % 100)))
                                      (EXIT
                                       (COND
                                        ((NULL (SPADCALL |dco| (QREFELT % 31)))
                                         (SEQ (LETT |dJV| (CONS |jv| |dJV|))
                                              (EXIT
                                               (LETT |dCo|
                                                     (CONS |dco| |dCo|))))))))
                                     (LETT #4#
                                           (PROG1 (CDR #4#)
                                             (LETT #5# (CDR #5#))))
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((NULL (NULL |dJV|))
                                   (SEQ (LETT |rowJ| (CONS |cjv| |rowJ|))
                                        (EXIT
                                         (LETT |rowC|
                                               (SPADCALL
                                                (CONS (NREVERSE |dCo|)
                                                      (NREVERSE |dJV|))
                                                |rowC| (QREFELT % 40)))))))))
                           (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (SPADCALL |newJM| |j|
                                 (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                           (QREFELT % 96))
                                 (SPADCALL |ents|
                                           (SPADCALL |rowC| (QREFELT % 41))
                                           (QREFELT % 107))
                                 (QREFELT % 106))))))
                   (LETT |depj| NIL)
                   (SEQ (LETT |k| |maxR|) (LETT #3# |minR|) G190
                        (COND ((< |k| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (QAREF2O |Trafo| |j| |k| 1 1)
                                       (QREFELT % 138)))
                            (LETT |depj|
                                  (CONS
                                   (PROG1
                                       (LETT #2#
                                             (+ (- |k| |minR|)
                                                (PROGN |depj| 1)))
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   |depj|))))))
                        (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                   (EXIT (LETT |dep| (CONS |depj| |dep|))))
                  (LETT #11# (PROG1 (CDR #11#) (LETT |j| (|inc_SI| |j|))))
                  (GO G190) G191 (EXIT NIL))
             (EXIT (VECTOR |newSys| |newJM| (CONS 1 (NREVERSE |dep|)))))))))) 

(SDEFUN |JBLF;simpOne;2%;36| ((|f| (%)) (% (%)))
        (COND
         ((EQL (LENGTH (QCDR |f|)) 1)
          (CONS (LIST (|spadConstant| % 29)) (QCDR |f|)))
         ('T |f|))) 

(DECLAIM (NOTINLINE |JetBundleLinearFunction;|)) 

(DEFUN |JetBundleLinearFunction| (&REST #1=#:G402)
  (SPROG NIL
         (PROG (#2=#:G403)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleLinearFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundleLinearFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleLinearFunction|)))))))))) 

(DEFUN |JetBundleLinearFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|JetBundleLinearFunction| DV$1 DV$2))
          (LETT % (GETREFV 152))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|lazyRepresentation|))
                                              (|HasSignature| |#2|
                                                              (LIST
                                                               '|retractIfCan|
                                                               (LIST
                                                                (LIST '|Union|
                                                                      (|devaluate|
                                                                       |#2|)
                                                                      (|devaluate|
                                                                       "failed"))
                                                                (LIST
                                                                 '|JetBundleExpression|
                                                                 (|devaluate|
                                                                  |#1|)))))))))
          (|haddProp| |$ConstructorCache| '|JetBundleLinearFunction|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8
                    (|Record| (|:| |Coeffs| (|List| |#2|))
                              (|:| |JVars| (|List| |#1|))))
          (QSETREFV % 11 (SPADCALL (QREFELT % 10)))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV % 69
                       (CONS (|dispatchFunction| |JBLF;retractIfCan;JbeU;12|)
                             %))
             (QSETREFV % 70
                       (CONS (|dispatchFunction| |JBLF;retract;Jbe%;13|) %)))))
          %))) 

(MAKEPROP '|JetBundleLinearFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|PositiveInteger|) (0 . |numIndVar|) '|nn| (|Boolean|)
              (4 . |one?|) (|OutputForm|) (9 . |coerce|) (14 . |one?|)
              (19 . |coerce|) (24 . *) |JBLF;zero?;%B;14|
              (|NonNegativeInteger|) (30 . |coerce|) (35 . +)
              |JBLF;coerce;%Of;2| (|Symbol|) (41 . |type|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBLF;One;%;17|) %))
              (46 . |coerce|) (51 . |One|) (55 . |One|) |JBLF;coerce;JB%;3|
              (59 . |zero?|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBLF;Zero;%;16|) %))
              |JBLF;coerce;D%;4| (|SparseEchelonMatrix| 6 7) (64 . |nrows|)
              (|Record| (|:| |Indices| 46) (|:| |Entries| 52)) (|Integer|)
              (69 . |row|) (|List| $$) (75 . |cons|) (81 . |reverse!|)
              (|List| %) |JBLF;coerce;SemL;5| (86 . >) (|Mapping| 12 6 6)
              (|List| 6) (92 . |merge|) (99 . |removeDuplicates!|) (104 . |#|)
              (109 . |new|) (|Void|) (|List| 7) (115 . |setRow!|)
              |JBLF;coerce;LSem;6| |JBLF;ground?;%B;7| (123 . |member?|)
              (129 . |last|) |JBLF;ground;2%;8| (134 . |Zero|)
              (|Union| 7 '"failed") |JBLF;retractIfCan;%U;9|
              |JBLF;numerator;2%;10| |JBLF;denominator;2%;11|
              (|Union| % '"failed") (|JetBundleExpression| 6)
              (138 . |retractIfCan|) (143 . |jetVariables|)
              (148 . |differentiate|) (154 . |retractIfCan|) (159 . |retract|)
              (164 . -) |JBLF;=;2%B;15| (170 . -) |JBLF;-;2%;18| (175 . |copy|)
              (180 . |copy|) (185 . =) (191 . +) (197 . |concat!|)
              (203 . |concat!|) |JBLF;+;3%;19| (209 . *) |JBLF;*;I2%;20|
              (215 . *) |JBLF;*;D2%;21| (221 . =) |JBLF;*;3%;22|
              (227 . |recip|) |JBLF;recip;%U;23| (232 . |exquo|)
              |JBLF;exquo;2%U;24| (238 . |gcd|) |JBLF;gcd;3%;25|
              (244 . |jetVariables|) (249 . |remove|) (255 . |append|)
              |JBLF;jetVariables;%L;26| (261 . |differentiate|)
              |JBLF;differentiate;%S%;27| (267 . |differentiate|)
              (273 . |position|) (279 . |qelt|) |JBLF;differentiate;%JB%;28|
              (|SparseEchelonMatrix| 6 $$) (285 . |new|) (291 . |setRow!|)
              (299 . |append|) (|SparseEchelonMatrix| 6 %)
              |JBLF;jacobiMatrix;LSem;29| (305 . <) (311 . =) (|Mapping| 12 6)
              (317 . |select|) (323 . |sort!|) (|List| 46)
              |JBLF;jacobiMatrix;LLSem;30| |JBLF;leadingDer;%JB;31|
              (329 . |freeOf?|) (335 . |and|) (|Mapping| 12 12 12) (|List| 12)
              (341 . |reduce|) |JBLF;freeOf?;%JBB;32| (348 . |elt|)
              (354 . |delete|) (360 . |delete|) |JBLF;solveFor;%JBU;33|
              (366 . |retract|) (371 . |subst|) |JBLF;subst;%JB2%;34|
              (|Record| (|:| |Ech| %) (|:| |Lt| 133) (|:| |Pivots| 52)
                        (|:| |Rank| 20))
              (378 . |primitiveRowEchelon|) (|Matrix| 137)
              (383 . |maxRowIndex|) (388 . |allIndices|) (393 . ~=)
              (|Fraction| 7) (399 . |zero?|) (|Union| '"failed" (|List| 145))
              (|Record| (|:| |Sys| 42) (|:| JM 108) (|:| |Depend| 139))
              |JBLF;simplify;LSemR;35| |JBLF;simpOne;2%;36| (|String|)
              (|List| 24) (|List| 20) (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 6 '"failed")
              (|Record| (|:| |DSys| 42) (|:| |JVars| 115))
              (|Record| (|:| |DPhi| %) (|:| |JVars| 46)))
           '#(~= 404 |zero?| 410 |unitNormal| 415 |unitCanonical| 420 |unit?|
              425 |symbol| 430 |subtractIfCan| 435 |subst| 441 |sortLD| 448
              |solveFor| 453 |simplify| 459 |simpOne| 465 |simpMod| 470
              |setNotation| 483 |sample| 488 |rightRecip| 492 |rightPower| 497
              |retractIfCan| 509 |retract| 524 |reduceMod| 539 |recip| 545
              |plenaryPower| 550 |orderDim| 556 |order| 563 |opposite?| 568
              |one?| 574 |numerator| 579 |numIndVar| 584 |numDepVar| 588
              |leftRecip| 592 |leftPower| 597 |leadingDer| 609 |lcmCoef| 614
              |lcm| 620 |latex| 631 |jetVariables| 636 |jacobiMatrix| 641
              |ground?| 652 |ground| 657 |getNotation| 662 |gcdPolynomial| 666
              |gcd| 672 |freeOf?| 683 |formalDiff2| 689 |formalDiff| 703
              |extractSymbol| 721 |exquo| 726 |dimension| 732 |differentiate|
              739 |denominator| 771 |dSubst| 776 |const?| 783 |commutator| 788
              |coerce| 794 |class| 829 |characteristic| 834 |autoReduce| 838
              |associator| 843 |associates?| 850 |antiCommutator| 856
              |annihilate?| 862 ^ 868 |Zero| 880 X 884 U 893 P 902 |One| 924 =
              928 - 934 + 945 * 951 |#2| 987)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0))
            (CONS
             '#(|JetBundleFunctionCategory&| |GcdDomain&| NIL NIL NIL
                |Algebra&| |EntireRing&| |PartialDifferentialRing&| NIL NIL
                |Rng&| |NonAssociativeAlgebra&| NIL |Module&| |Module&|
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL NIL
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| NIL
                |RetractableTo&| |RetractableTo&| NIL NIL |BasicType&| NIL NIL
                NIL NIL NIL)
             (CONS
              '#((|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| $$) (|EntireRing|) (|PartialDifferentialRing| 24)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRng|) (|Module| $$) (|Module| 7) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 7 7) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 7)
                 (|RightModule| 7) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|) (|Magma|)
                 (|SetCategory|) (|CommutativeStar|) (|RetractableTo| 6)
                 (|RetractableTo| 7) (|lazyRepresentation|) (|CoercibleTo| 14)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|CoercibleFrom| 6) (|CoercibleFrom| 7))
              (|makeByteWordVec2| 151
                                  '(0 6 9 10 1 7 12 0 13 1 6 14 0 15 1 6 12 0
                                    16 1 7 14 0 17 2 14 0 0 0 18 1 20 14 0 21 2
                                    14 0 0 0 22 1 6 24 0 25 1 7 0 6 27 0 6 0 28
                                    0 7 0 29 1 7 12 0 31 1 34 20 0 35 2 34 36 0
                                    37 38 2 39 0 2 0 40 1 39 0 0 41 2 6 12 0 0
                                    44 3 46 0 45 0 0 47 1 46 0 0 48 1 39 20 0
                                    49 2 34 0 46 37 50 4 34 51 0 37 46 52 53 2
                                    46 12 6 0 56 1 52 7 0 57 0 7 0 59 1 7 64 65
                                    66 1 65 46 0 67 2 65 0 0 6 68 1 0 64 65 69
                                    1 0 0 65 70 2 0 0 0 0 71 1 7 0 0 73 1 52 0
                                    0 75 1 46 0 0 76 2 6 12 0 0 77 2 7 0 0 0 78
                                    2 52 0 0 0 79 2 46 0 0 0 80 2 7 0 37 0 82 2
                                    7 0 0 0 84 2 46 12 0 0 86 1 7 64 0 88 2 7
                                    64 0 0 90 2 7 0 0 0 92 1 7 46 0 94 2 46 0 6
                                    0 95 2 46 0 0 0 96 2 7 0 0 24 98 2 7 0 0 6
                                    100 2 46 37 6 0 101 2 52 7 0 37 102 2 104 0
                                    46 37 105 4 104 51 0 37 46 39 106 2 39 0 0
                                    0 107 2 6 12 0 0 110 2 24 12 0 0 111 2 46 0
                                    112 0 113 2 46 0 45 0 114 2 7 12 0 6 118 2
                                    12 0 0 0 119 3 121 12 120 0 12 122 2 52 7 0
                                    37 124 2 52 0 0 37 125 2 46 0 0 37 126 1 0
                                    7 0 128 3 7 0 0 6 0 129 1 34 131 0 132 1
                                    133 37 0 134 1 104 46 0 135 2 24 12 0 0 136
                                    1 137 12 0 138 2 0 12 0 0 1 1 0 12 0 19 1 0
                                    148 0 1 1 0 0 0 1 1 0 12 0 1 1 0 108 42 1 2
                                    0 64 0 0 1 3 0 0 0 6 0 130 1 0 42 42 1 2 0
                                    64 0 6 127 2 0 140 42 108 141 1 0 0 0 142 2
                                    0 42 42 42 1 3 0 140 42 108 42 1 1 0 51 24
                                    1 0 0 0 1 1 0 64 0 1 2 0 0 0 9 1 2 0 0 0 20
                                    1 1 0 149 0 1 1 0 60 0 61 1 2 64 65 69 1 0
                                    6 0 1 1 0 7 0 128 1 2 0 65 70 2 0 42 42 42
                                    1 1 0 64 0 89 2 0 0 0 9 1 3 0 20 42 108 20
                                    1 1 0 20 0 1 2 0 12 0 0 1 1 0 12 0 1 1 0 0
                                    0 62 0 0 9 1 0 0 9 1 1 0 64 0 1 2 0 0 0 9 1
                                    2 0 0 0 20 1 1 0 6 0 117 2 0 147 0 0 1 2 0
                                    0 0 0 1 1 0 0 42 1 1 0 143 0 1 1 0 46 0 97
                                    1 0 108 42 109 2 0 108 42 115 116 1 0 12 0
                                    55 1 0 0 0 58 0 0 24 1 2 0 146 146 146 1 2
                                    0 0 0 0 93 1 0 0 42 1 2 0 12 0 6 123 3 0
                                    150 42 9 108 1 3 0 151 0 9 108 1 2 0 0 0
                                    145 1 2 0 0 0 9 1 2 0 42 42 9 1 1 0 108 108
                                    1 2 0 64 0 0 91 3 0 20 42 108 20 1 2 0 0 0
                                    24 99 2 0 0 0 144 1 3 0 0 0 144 145 1 3 0 0
                                    0 24 20 1 2 0 0 0 6 103 1 0 0 0 63 3 0 0 0
                                    6 0 1 1 0 12 0 1 2 0 0 0 0 1 1 0 14 0 23 1
                                    0 0 37 1 1 0 0 0 1 1 0 0 6 30 1 0 0 7 33 1
                                    0 42 34 43 1 0 34 42 54 1 0 20 0 1 0 0 20 1
                                    1 0 42 42 1 3 0 0 0 0 0 1 2 0 12 0 0 1 2 0
                                    0 0 0 1 2 0 12 0 0 1 2 0 0 0 9 1 2 0 0 0 20
                                    1 0 0 0 32 1 0 0 9 1 0 0 0 1 1 0 0 9 1 0 0
                                    0 1 2 0 0 9 145 1 2 0 0 9 20 1 1 0 0 145 1
                                    1 0 0 20 1 0 0 0 26 2 0 12 0 0 72 2 0 0 0 0
                                    71 1 0 0 0 74 2 0 0 0 0 81 2 0 0 9 0 1 2 0
                                    0 0 0 87 2 0 0 37 0 83 2 0 0 20 0 1 2 0 0 7
                                    0 85 2 0 0 0 7 1 2 0 0 0 144 1 2 0 0 0 24 1
                                    3 0 0 0 144 145 1 3 0 0 0 24 20 1)))))
           '|lookupComplete|)) 
