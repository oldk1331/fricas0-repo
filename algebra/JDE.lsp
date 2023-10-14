
(DEFUN |JDE;setSimpMode;2Nni;1| (|i| $)
  (PROG (|j|)
    (RETURN
     (SEQ (LETT |j| (QREFELT $ 13) |JDE;setSimpMode;2Nni;1|) (SETELT $ 13 |i|)
          (EXIT |j|))))) 

(DEFUN |JDE;adapt| (|der| |pro?| |dep| $)
  (PROG (|resPro?| |resDer| |b| #1=#:G165 |i| #2=#:G164 |j| #3=#:G163 #4=#:G162
         #5=#:G161 |d| #6=#:G160 #7=#:G159 #8=#:G158 #9=#:G157)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |dep| 0)
        (CONS
         (PROGN
          (LETT #9# NIL . #10=(|JDE;adapt|))
          (SEQ (LETT |i| NIL . #10#) (LETT #8# |der| . #10#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#) . #10#) NIL))
                 (GO G191)))
               (SEQ (EXIT (LETT #9# (CONS 1 #9#) . #10#)))
               (LETT #8# (CDR #8#) . #10#) (GO G190) G191
               (EXIT (NREVERSE #9#))))
         (PROGN
          (LETT #7# NIL . #10#)
          (SEQ (LETT |i| NIL . #10#) (LETT #6# |der| . #10#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #10#) NIL))
                 (GO G191)))
               (SEQ (EXIT (LETT #7# (CONS 'NIL #7#) . #10#)))
               (LETT #6# (CDR #6#) . #10#) (GO G190) G191
               (EXIT (NREVERSE #7#))))))
       ('T
        (SEQ (LETT |resDer| NIL . #10#) (LETT |resPro?| NIL . #10#)
             (SEQ (LETT |d| NIL . #10#) (LETT #5# (QCDR |dep|) . #10#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |d| (CAR #5#) . #10#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((EQL (SPADCALL |d| (QREFELT $ 17)) 1)
                      (SEQ
                       (LETT |resDer|
                             (CONS
                              (SPADCALL |der| (|SPADfirst| |d|) (QREFELT $ 19))
                              |resDer|)
                             . #10#)
                       (EXIT
                        (LETT |resPro?|
                              (CONS
                               (SPADCALL |pro?| (|SPADfirst| |d|)
                                         (QREFELT $ 22))
                               |resPro?|)
                              . #10#))))
                     ('T
                      (SEQ
                       (LETT |j|
                             (SPADCALL (ELT $ 23)
                                       (PROGN
                                        (LETT #4# NIL . #10#)
                                        (SEQ (LETT |i| NIL . #10#)
                                             (LETT #3# |d| . #10#) G190
                                             (COND
                                              ((OR (ATOM #3#)
                                                   (PROGN
                                                    (LETT |i| (CAR #3#) . #10#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #4#
                                                     (CONS
                                                      (SPADCALL |der| |i|
                                                                (QREFELT $ 19))
                                                      #4#)
                                                     . #10#)))
                                             (LETT #3# (CDR #3#) . #10#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #4#))))
                                       (QREFELT $ 25))
                             . #10#)
                       (LETT |b|
                             (SPADCALL (ELT $ 26)
                                       (PROGN
                                        (LETT #2# NIL . #10#)
                                        (SEQ (LETT |i| NIL . #10#)
                                             (LETT #1# |d| . #10#) G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |i| (CAR #1#) . #10#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #2#
                                                     (CONS
                                                      (SPADCALL |pro?| |i|
                                                                (QREFELT $ 22))
                                                      #2#)
                                                     . #10#)))
                                             (LETT #1# (CDR #1#) . #10#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #2#))))
                                       (QREFELT $ 28))
                             . #10#)
                       (LETT |resDer| (CONS |j| |resDer|) . #10#)
                       (EXIT (LETT |resPro?| (CONS |b| |resPro?|) . #10#)))))))
                  (LETT #5# (CDR #5#) . #10#) (GO G190) G191 (EXIT NIL))
             (EXIT (CONS (NREVERSE |resDer|) (NREVERSE |resPro?|)))))))))) 

(DEFUN |JDE;copy;2$;3| (|De| $)
  (PROG (|newOrd| |newSys| #1=#:G176 |sys| #2=#:G175)
    (RETURN
     (SEQ
      (LETT |newSys|
            (PROGN
             (LETT #2# NIL . #3=(|JDE;copy;2$;3|))
             (SEQ (LETT |sys| NIL . #3#) (LETT #1# (QCAR |De|) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |sys| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (VECTOR (SPADCALL (QVELT |sys| 0) (QREFELT $ 32))
                                   (SPADCALL (QVELT |sys| 1) (QREFELT $ 34))
                                   (SPADCALL (QVELT |sys| 2) (QREFELT $ 35))
                                   (SPADCALL (QVELT |sys| 3) (QREFELT $ 36))
                                   (QVELT |sys| 4) (QVELT |sys| 5)
                                   (QVELT |sys| 6))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (LETT |newOrd| (SPADCALL (QCDR |De|) (QREFELT $ 35)) . #3#)
      (EXIT (CONS |newSys| |newOrd|)))))) 

(DEFUN |JDE;order;$Nni;4| (|De| $)
  (COND ((NULL (QCDR |De|)) 0) ('T (|SPADfirst| (QCDR |De|))))) 

(DEFUN |JDE;retract;$L;5| (|De| $)
  (PROG (|LSys| #1=#:G185 |sys| #2=#:G184)
    (RETURN
     (SEQ
      (LETT |LSys|
            (PROGN
             (LETT #2# NIL . #3=(|JDE;retract;$L;5|))
             (SEQ (LETT |sys| NIL . #3#) (LETT #1# (QCAR |De|) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |sys| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS (QVELT |sys| 0) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL (ELT $ 39) |LSys| NIL (QREFELT $ 42))))))) 

(DEFUN |JDE;jacobiMatrix;$L;6| (|De| $)
  (PROG (#1=#:G189 |sys| #2=#:G188)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|JDE;jacobiMatrix;$L;6|))
       (SEQ (LETT |sys| NIL . #3#) (LETT #1# (QCAR |De|) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |sys| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (QVELT |sys| 1) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |JDE;printSys;LOf;7| (|sys| $)
  (PROG (|tmp| #1=#:G197 |eq| |leq| #2=#:G196 #3=#:G195)
    (RETURN
     (SEQ
      (COND ((NULL |sys|) (SPADCALL (QREFELT $ 47)))
            ('T
             (SEQ
              (LETT |leq|
                    (PROGN
                     (LETT #3# NIL . #4=(|JDE;printSys;LOf;7|))
                     (SEQ (LETT |eq| NIL . #4#) (LETT #2# |sys| . #4#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |eq| (CAR #2#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |eq| (|spadConstant| $ 48)
                                             (QREFELT $ 50))
                                   #3#)
                                  . #4#)))
                          (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #4#)
              (LETT |tmp| NIL . #4#)
              (SEQ (LETT |eq| NIL . #4#) (LETT #1# |leq| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |tmp|
                           (CONS (SPADCALL |eq| (QREFELT $ 51))
                                 (CONS " " |tmp|))
                           . #4#)))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (REVERSE |tmp|) (QREFELT $ 53)))))))))) 

(DEFUN |JDE;coerce;$Of;8| (|De| $)
  (SPADCALL (SPADCALL |De| (QREFELT $ 43)) (QREFELT $ 54))) 

(DEFUN |JDE;display;$V;9| (|De| $)
  (PROG (#1=#:G205 |sys| #2=#:G206 |ord|)
    (RETURN
     (SEQ
      (SEQ (LETT |ord| NIL . #3=(|JDE;display;$V;9|))
           (LETT #2# (QCDR |De|) . #3#) (LETT |sys| NIL . #3#)
           (LETT #1# (QCAR |De|) . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |sys| (CAR #1#) . #3#) NIL) (ATOM #2#)
                 (PROGN (LETT |ord| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (SPADCALL
             (SPADCALL "Order: " (SPADCALL |ord| (QREFELT $ 56))
                       (QREFELT $ 57))
             (QREFELT $ 59))
            (SPADCALL "  System:" (QREFELT $ 59))
            (SPADCALL
             (SPADCALL "    " (SPADCALL (QVELT |sys| 0) (QREFELT $ 54))
                       (QREFELT $ 57))
             (QREFELT $ 59))
            (COND
             ((QVELT |sys| 4)
              (SPADCALL "    (system simplified)" (QREFELT $ 59))))
            (COND
             ((QVELT |sys| 5)
              (SPADCALL
               (SPADCALL "  Dimension: "
                         (SPADCALL (QVELT |sys| 6) (QREFELT $ 56))
                         (QREFELT $ 57))
               (QREFELT $ 59))))
            (SPADCALL "  Jacobi matrix:" (QREFELT $ 59))
            (SPADCALL
             (SPADCALL "    " (SPADCALL (QVELT |sys| 1) (QREFELT $ 60))
                       (QREFELT $ 57))
             (QREFELT $ 59))
            (SPADCALL
             (SPADCALL "    "
                       (SPADCALL (SPADCALL (QVELT |sys| 1) (QREFELT $ 62))
                                 (QREFELT $ 63))
                       (QREFELT $ 57))
             (QREFELT $ 59))
            (SPADCALL "  Last derivations:" (QREFELT $ 59))
            (EXIT
             (SPADCALL
              (SPADCALL "    " (SPADCALL (QVELT |sys| 2) (QREFELT $ 64))
                        (QREFELT $ 57))
              (QREFELT $ 59))))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (QREFELT $ 65))))))) 

(DEFUN |JDE;makeSystem2| (|sys| |jm| |der| $)
  (PROG (|resSys| |rec| #1=#:G227 |ord| |i| |pos| #2=#:G224 |eq| #3=#:G225
         #4=#:G226 |q| |j| |vjm| |vder| |vsys| |ljm| |inds| #5=#:G223 |nord|
         |resOrd| |lord| #6=#:G222 #7=#:G221)
    (RETURN
     (SEQ
      (LETT |lord|
            (PROGN
             (LETT #7# NIL . #8=(|JDE;makeSystem2|))
             (SEQ (LETT |i| 1 . #8#)
                  (LETT #6# (SPADCALL |jm| (QREFELT $ 67)) . #8#) G190
                  (COND ((|greater_SI| |i| #6#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #7#
                          (CONS
                           (SPADCALL
                            (|SPADfirst|
                             (QCAR (SPADCALL |jm| |i| (QREFELT $ 69))))
                            (QREFELT $ 70))
                           #7#)
                          . #8#)))
                  (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                  (EXIT (NREVERSE #7#))))
            . #8#)
      (LETT |resOrd|
            (REVERSE
             (SPADCALL (SPADCALL |lord| (QREFELT $ 71)) (QREFELT $ 72)))
            . #8#)
      (LETT |nord| (SPADCALL |resOrd| (QREFELT $ 17)) . #8#)
      (LETT |inds| (SPADCALL |jm| (QREFELT $ 62)) . #8#) (LETT |ljm| NIL . #8#)
      (SEQ (LETT |q| NIL . #8#) (LETT #5# |resOrd| . #8#) G190
           (COND
            ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#) . #8#) NIL)) (GO G191)))
           (SEQ
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL (SPADCALL (|SPADfirst| |inds|) (QREFELT $ 70))
                              |q| (QREFELT $ 73)))
                   (GO G191)))
                 (SEQ (EXIT (LETT |inds| (CDR |inds|) . #8#))) NIL (GO G190)
                 G191 (EXIT NIL))
            (EXIT
             (LETT |ljm| (CONS (SPADCALL |inds| 1 (QREFELT $ 76)) |ljm|)
                   . #8#)))
           (LETT #5# (CDR #5#) . #8#) (GO G190) G191 (EXIT NIL))
      (LETT |vsys| (MAKEARR1 |nord| NIL) . #8#)
      (LETT |vder| (MAKEARR1 |nord| NIL) . #8#)
      (LETT |vjm| (SPADCALL (NREVERSE |ljm|) (QREFELT $ 78)) . #8#)
      (SEQ (LETT |j| (SPADCALL |jm| (QREFELT $ 67)) . #8#) (LETT |q| NIL . #8#)
           (LETT #4# (REVERSE |lord|) . #8#) (LETT |i| NIL . #8#)
           (LETT #3# (REVERSE |der|) . #8#) (LETT |eq| NIL . #8#)
           (LETT #2# (REVERSE |sys|) . #8#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#) . #8#) NIL) (ATOM #3#)
                 (PROGN (LETT |i| (CAR #3#) . #8#) NIL) (ATOM #4#)
                 (PROGN (LETT |q| (CAR #4#) . #8#) NIL) (< |j| 1))
             (GO G191)))
           (SEQ
            (LETT |pos|
                  (- (+ (SPADCALL |q| |resOrd| (QREFELT $ 79)) 1)
                     (SPADCALL |resOrd| (QREFELT $ 80)))
                  . #8#)
            (EXIT
             (COND
              ((NULL (QAREF1O |vsys| |pos| 1))
               (SEQ (QSETAREF1O |vsys| |pos| (LIST |eq|) 1)
                    (SPADCALL (QAREF1O |vjm| |pos| 1) 1
                              (SPADCALL |jm| |j| (QREFELT $ 69))
                              (QREFELT $ 81))
                    (EXIT (QSETAREF1O |vder| |pos| (LIST |i|) 1))))
              ('T
               (SEQ
                (QSETAREF1O |vsys| |pos| (CONS |eq| (QAREF1O |vsys| |pos| 1))
                            1)
                (SPADCALL (QAREF1O |vjm| |pos| 1)
                          (SPADCALL |jm| |j| (QREFELT $ 69)) (QREFELT $ 82))
                (EXIT
                 (QSETAREF1O |vder| |pos| (CONS |i| (QAREF1O |vder| |pos| 1))
                             1)))))))
           (LETT #2#
                 (PROG1 (CDR #2#)
                   (LETT #3#
                         (PROG1 (CDR #3#)
                           (LETT #4#
                                 (PROG1 (CDR #4#) (LETT |j| (+ |j| -1) . #8#))
                                 . #8#))
                         . #8#))
                 . #8#)
           (GO G190) G191 (EXIT NIL))
      (LETT |resSys| NIL . #8#)
      (SEQ (LETT |i| (SPADCALL |vsys| (QREFELT $ 84)) . #8#)
           (LETT |ord| NIL . #8#) (LETT #1# |resOrd| . #8#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ord| (CAR #1#) . #8#) NIL))
             (GO G191)))
           (SEQ
            (LETT |rec|
                  (VECTOR (QAREF1O |vsys| |i| 1) (QAREF1O |vjm| |i| 1)
                          (QAREF1O |vder| |i| 1)
                          (SPADCALL
                           (SPADCALL (QAREF1O |vder| |i| 1) (QREFELT $ 17))
                           'NIL (QREFELT $ 85))
                          'NIL 'NIL 0)
                  . #8#)
            (EXIT (LETT |resSys| (CONS |rec| |resSys|) . #8#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1) . #8#)) . #8#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (CONS (NREVERSE |resSys|) |resOrd|)))))) 

(DEFUN |JDE;makeSystem;L$;11| (|sys| $)
  (PROG (|jm| |der| #1=#:G236 |eq| #2=#:G235 |nsys| #3=#:G234 #4=#:G233)
    (RETURN
     (SEQ
      (COND ((NULL |sys|) (CONS NIL NIL))
            ('T
             (SEQ
              (LETT |nsys|
                    (PROGN
                     (LETT #4# NIL . #5=(|JDE;makeSystem;L$;11|))
                     (SEQ (LETT |eq| NIL . #5#) (LETT #3# |sys| . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |eq| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (SPADCALL |eq| (QREFELT $ 86)) #4#)
                                  . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #5#)
              (LETT |der|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |eq| NIL . #5#) (LETT #1# |nsys| . #5#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |eq| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS 1 #2#) . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (LETT |jm| (SPADCALL |nsys| (QREFELT $ 88)) . #5#)
              (EXIT (|JDE;makeSystem2| |nsys| |jm| |der| $))))))))) 

(DEFUN |JDE;join;3$;12| (|De1| |De2| $)
  (PROG (|ord2| |ord1| |sys2| |sys1| |resOrd| |resSys| |rec| |rec2| |rec1| |o2|
         |o1| |cDe2| |cDe1|)
    (RETURN
     (SEQ (LETT |cDe1| (SPADCALL |De1| (QREFELT $ 37)) . #1=(|JDE;join;3$;12|))
          (LETT |cDe2| (SPADCALL |De2| (QREFELT $ 37)) . #1#)
          (LETT |sys1| (QCAR |cDe1|) . #1#) (LETT |sys2| (QCAR |cDe2|) . #1#)
          (LETT |ord1| (QCDR |cDe1|) . #1#) (LETT |ord2| (QCDR |cDe2|) . #1#)
          (LETT |resSys| NIL . #1#) (LETT |resOrd| NIL . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((NULL |ord1|) (COND ((NULL |ord2|) 'NIL) ('T 'T)))
                        ('T 'T)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL |ord1|)
                   (SEQ
                    (LETT |resSys|
                          (SPADCALL (NREVERSE |sys2|) |resSys| (QREFELT $ 91))
                          . #1#)
                    (LETT |resOrd|
                          (SPADCALL (NREVERSE |ord2|) |resOrd| (QREFELT $ 92))
                          . #1#)
                    (EXIT (LETT |ord2| NIL . #1#))))
                  ((NULL |ord2|)
                   (SEQ
                    (LETT |resSys|
                          (SPADCALL (NREVERSE |sys1|) |resSys| (QREFELT $ 91))
                          . #1#)
                    (LETT |resOrd|
                          (SPADCALL (NREVERSE |ord1|) |resOrd| (QREFELT $ 92))
                          . #1#)
                    (EXIT (LETT |ord1| NIL . #1#))))
                  ('T
                   (SEQ (LETT |o1| (|SPADfirst| |ord1|) . #1#)
                        (LETT |o2| (|SPADfirst| |ord2|) . #1#)
                        (EXIT
                         (COND
                          ((SPADCALL |o1| |o2| (QREFELT $ 73))
                           (SEQ
                            (LETT |resSys| (CONS (|SPADfirst| |sys1|) |resSys|)
                                  . #1#)
                            (LETT |resOrd| (CONS |o1| |resOrd|) . #1#)
                            (LETT |sys1| (CDR |sys1|) . #1#)
                            (EXIT (LETT |ord1| (CDR |ord1|) . #1#))))
                          ((SPADCALL |o2| |o1| (QREFELT $ 73))
                           (SEQ
                            (LETT |resSys| (CONS (|SPADfirst| |sys2|) |resSys|)
                                  . #1#)
                            (LETT |resOrd| (CONS |o2| |resOrd|) . #1#)
                            (LETT |sys2| (CDR |sys2|) . #1#)
                            (EXIT (LETT |ord2| (CDR |ord2|) . #1#))))
                          ('T
                           (SEQ (LETT |rec1| (|SPADfirst| |sys1|) . #1#)
                                (LETT |rec2| (|SPADfirst| |sys2|) . #1#)
                                (LETT |rec|
                                      (VECTOR
                                       (SPADCALL (QVELT |rec1| 0)
                                                 (QVELT |rec2| 0)
                                                 (QREFELT $ 93))
                                       (SPADCALL (QVELT |rec1| 1)
                                                 (QVELT |rec2| 1)
                                                 (QREFELT $ 94))
                                       (SPADCALL (QVELT |rec1| 2)
                                                 (QVELT |rec2| 2)
                                                 (QREFELT $ 92))
                                       (SPADCALL (QVELT |rec1| 3)
                                                 (QVELT |rec2| 3)
                                                 (QREFELT $ 95))
                                       'NIL 'NIL 0)
                                      . #1#)
                                (LETT |resSys| (CONS |rec| |resSys|) . #1#)
                                (LETT |resOrd| (CONS |o1| |resOrd|) . #1#)
                                (LETT |sys1| (CDR |sys1|) . #1#)
                                (LETT |sys2| (CDR |sys2|) . #1#)
                                (LETT |ord1| (CDR |ord1|) . #1#)
                                (EXIT
                                 (LETT |ord2| (CDR |ord2|) . #1#)))))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (NREVERSE |resSys|) (NREVERSE |resOrd|))))))) 

(DEFUN |JDE;insert;L2$;13| (|sys| |De| $)
  (PROG (|newDe|)
    (RETURN
     (SEQ (LETT |newDe| (SPADCALL |sys| (QREFELT $ 89)) |JDE;insert;L2$;13|)
          (EXIT (SPADCALL |De| |newDe| (QREFELT $ 96))))))) 

(DEFUN |JDE;dimension;$2Nni;14| (|De| |q| $)
  (PROG (|res| #1=#:G263 |resSys| |d| |simp?| |qq| |j| #2=#:G267 |sys|
         #3=#:G268 |ord| |tord| |tsys|)
    (RETURN
     (SEQ
      (COND ((NULL (QCDR |De|)) (SPADCALL |q| (QREFELT $ 98)))
            ('T
             (SEQ (LETT |simp?| 'T . #4=(|JDE;dimension;$2Nni;14|))
                  (LETT |tsys| (SPADCALL (QCAR |De|) (QREFELT $ 99)) . #4#)
                  (LETT |tord| (SPADCALL (QCDR |De|) (QREFELT $ 35)) . #4#)
                  (LETT |resSys| NIL . #4#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL (|SPADfirst| |tord|) |q| (QREFELT $ 73)))
                         (GO G191)))
                       (SEQ
                        (LETT |resSys| (CONS (|SPADfirst| |tsys|) |resSys|)
                              . #4#)
                        (LETT |tsys| (CDR |tsys|) . #4#)
                        (EXIT (LETT |tord| (CDR |tord|) . #4#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |qq| |q| . #4#) (LETT |res| 0 . #4#)
                  (SEQ (LETT |ord| NIL . #4#) (LETT #3# |tord| . #4#)
                       (LETT |sys| NIL . #4#) (LETT #2# |tsys| . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |sys| (CAR #2#) . #4#) NIL)
                             (ATOM #3#)
                             (PROGN (LETT |ord| (CAR #3#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (SEQ (LETT |j| (+ |ord| 1) . #4#) G190
                             (COND ((> |j| |qq|) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res|
                                     (+ |res| (SPADCALL |j| (QREFELT $ 100)))
                                     . #4#)))
                             (LETT |j| (+ |j| 1) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |qq| (- |ord| 1) . #4#)
                        (LETT |simp?|
                              (COND (|simp?| (QVELT |sys| 4)) ('T 'NIL)) . #4#)
                        (COND
                         ((QVELT |sys| 5)
                          (LETT |res| (+ |res| (QVELT |sys| 6)) . #4#))
                         ('T
                          (SEQ
                           (LETT |d|
                                 (SPADCALL (QVELT |sys| 0) (QVELT |sys| 1)
                                           |ord| (QREFELT $ 101))
                                 . #4#)
                           (LETT |res| (+ |res| |d|) . #4#)
                           (QSETVELT |sys| 5 'T)
                           (EXIT (QSETVELT |sys| 6 |d|)))))
                        (EXIT (LETT |resSys| (CONS |sys| |resSys|) . #4#)))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                             . #4#)
                       (GO G190) G191 (EXIT NIL))
                  (COND
                   ((NULL |simp?|)
                    (SPADCALL
                     "***** Warning: system not simplified in dimension"
                     (QREFELT $ 59))))
                  (COND
                   ((>= |qq| 0)
                    (LETT |res|
                          (+ |res|
                             (SPADCALL
                              (PROG1 (LETT #1# |qq| . #4#)
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 98)))
                          . #4#)))
                  (PROGN (RPLACA |De| (NREVERSE |resSys|)) (QCAR |De|))
                  (EXIT |res|)))))))) 

(DEFUN |JDE;simplify;$R;15| (|De| $)
  (PROG (|u?| #1=#:G320 #2=#:G333 |j| #3=#:G334 |lj| #4=#:G332 |eq| |i| |jm0|
         |tord| |tsys| |resOrd| |resSys| |rec| |pos| |hord| |djm| |newPro?|
         |newDer| |newEqs| |pos2| |pos1| |ICs| |o| #5=#:G330 #6=#:G331 |pro?|
         |ad| |newJM| |tmp| |AllEqs| |sys| |q| |cDe|)
    (RETURN
     (SEQ (LETT |resSys| NIL . #7=(|JDE;simplify;$R;15|))
          (LETT |resOrd| NIL . #7#) (LETT |ICs| NIL . #7#)
          (LETT |cDe| (SPADCALL |De| (QREFELT $ 37)) . #7#)
          (LETT |tsys| (QCAR |cDe|) . #7#) (LETT |tord| (QCDR |cDe|) . #7#)
          (LETT |AllEqs| NIL . #7#)
          (COND
           ((SPADCALL (QREFELT $ 13) 0 (QREFELT $ 73))
            (LETT |AllEqs| (SPADCALL |cDe| (QREFELT $ 43)) . #7#)))
          (SEQ G190
               (COND ((NULL (COND ((NULL |tord|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |q| (|SPADfirst| |tord|) . #7#)
                    (LETT |sys| (|SPADfirst| |tsys|) . #7#)
                    (COND
                     ((QVELT |sys| 4)
                      (SEQ (LETT |resSys| (CONS |sys| |resSys|) . #7#)
                           (EXIT (LETT |resOrd| (CONS |q| |resOrd|) . #7#))))
                     ('T
                      (SEQ
                       (COND
                        ((SPADCALL (QREFELT $ 13) 0 (QREFELT $ 73))
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND
                                  ((OR (NULL |AllEqs|)
                                       (<
                                        (SPADCALL (|SPADfirst| |AllEqs|)
                                                  (QREFELT $ 103))
                                        |q|))
                                   'NIL)
                                  ('T 'T)))
                                (GO G191)))
                              (SEQ (EXIT (LETT |AllEqs| (CDR |AllEqs|) . #7#)))
                              NIL (GO G190) G191 (EXIT NIL))))
                       (COND
                        ((SPADCALL (QREFELT $ 13) 0 (QREFELT $ 73))
                         (SEQ
                          (LETT |tmp|
                                (SPADCALL (QVELT |sys| 0) (QVELT |sys| 1)
                                          |AllEqs| (QREFELT $ 106))
                                . #7#)
                          (EXIT
                           (LETT |tmp|
                                 (SPADCALL (QVELT |tmp| 0) (QVELT |tmp| 1)
                                           (QREFELT $ 107))
                                 . #7#))))
                        ('T
                         (LETT |tmp|
                               (SPADCALL (QVELT |sys| 0) (QVELT |sys| 1)
                                         (QREFELT $ 107))
                               . #7#)))
                       (LETT |newEqs| (QVELT |tmp| 0) . #7#)
                       (LETT |newJM| (QVELT |tmp| 1) . #7#)
                       (LETT |ad|
                             (|JDE;adapt| (QVELT |sys| 2) (QVELT |sys| 3)
                              (QVELT |tmp| 2) $)
                             . #7#)
                       (LETT |newDer| (QCAR |ad|) . #7#)
                       (LETT |newPro?| (QCDR |ad|) . #7#) (LETT |j| 0 . #7#)
                       (SEQ (LETT |i| 1 . #7#) (LETT |pro?| NIL . #7#)
                            (LETT #6# |newPro?| . #7#) (LETT |eq| NIL . #7#)
                            (LETT #5# |newEqs| . #7#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |eq| (CAR #5#) . #7#) NIL)
                                  (ATOM #6#)
                                  (PROGN (LETT |pro?| (CAR #6#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |o|
                                   (SPADCALL
                                    (|SPADfirst|
                                     (QCAR
                                      (SPADCALL |newJM| (- |i| |j|)
                                                (QREFELT $ 69))))
                                    (QREFELT $ 70))
                                   . #7#)
                             (EXIT
                              (COND
                               ((SPADCALL |o| |q| (QREFELT $ 73))
                                (|error| "order raised in simplify"))
                               ((< |o| |q|)
                                (SEQ (LETT |ICs| (CONS |eq| |ICs|) . #7#)
                                     (LETT |j| (+ |j| 1) . #7#)
                                     (LETT |pos1| (+ (- |i| |j|) 1) . #7#)
                                     (LETT |pos2|
                                           (+ (- |i| |j|)
                                              (SPADCALL |newEqs|
                                                        (QREFELT $ 108)))
                                           . #7#)
                                     (LETT |newEqs|
                                           (SPADCALL |newEqs| |pos2|
                                                     (QREFELT $ 109))
                                           . #7#)
                                     (LETT |newDer|
                                           (SPADCALL |newDer| |pos2|
                                                     (QREFELT $ 110))
                                           . #7#)
                                     (LETT |newPro?|
                                           (SPADCALL |newPro?| |pos2|
                                                     (QREFELT $ 111))
                                           . #7#)
                                     (LETT |djm|
                                           (SPADCALL |newJM| |pos1| |pos1|
                                                     (QREFELT $ 112))
                                           . #7#)
                                     (SPADCALL |djm|
                                               (CONS #'|JDE;simplify;$R;15!0|
                                                     (VECTOR |o| $))
                                               (QREFELT $ 114))
                                     (SPADCALL |newJM| |pos1| (QREFELT $ 115))
                                     (LETT |pos|
                                           (SPADCALL |o| |tord| (QREFELT $ 79))
                                           . #7#)
                                     (EXIT
                                      (COND
                                       ((>= |pos|
                                            (SPADCALL |tord| (QREFELT $ 80)))
                                        (SEQ
                                         (LETT |rec|
                                               (SPADCALL |tsys| |pos|
                                                         (QREFELT $ 116))
                                               . #7#)
                                         (SPADCALL (QVELT |rec| 0) |eq|
                                                   (QREFELT $ 117))
                                         (SPADCALL (QVELT |rec| 1)
                                                   (SPADCALL |djm| 1
                                                             (QREFELT $ 69))
                                                   (QREFELT $ 118))
                                         (SPADCALL (QVELT |rec| 2) 1
                                                   (QREFELT $ 119))
                                         (SPADCALL (QVELT |rec| 3) |pro?|
                                                   (QREFELT $ 120))
                                         (QSETVELT |rec| 4 'NIL)
                                         (QSETVELT |rec| 5 'NIL)
                                         (QSETVELT |rec| 6 0)
                                         (EXIT
                                          (SPADCALL |tsys| |pos| |rec|
                                                    (QREFELT $ 121)))))
                                       ('T
                                        (SEQ
                                         (LETT |rec|
                                               (VECTOR (LIST |eq|) |djm|
                                                       (LIST 1) (LIST |pro?|)
                                                       'NIL 'NIL 0)
                                               . #7#)
                                         (LETT |hord| NIL . #7#)
                                         (LETT |pos|
                                               (-
                                                (SPADCALL |tord|
                                                          (QREFELT $ 80))
                                                1)
                                               . #7#)
                                         (SEQ G190
                                              (COND
                                               ((NULL
                                                 (COND ((NULL |tord|) 'NIL)
                                                       ('T
                                                        (SPADCALL
                                                         (|SPADfirst| |tord|)
                                                         |o| (QREFELT $ 73)))))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |hord|
                                                     (CONS (|SPADfirst| |tord|)
                                                           |hord|)
                                                     . #7#)
                                               (LETT |tord| (CDR |tord|) . #7#)
                                               (EXIT
                                                (LETT |pos| (+ |pos| 1)
                                                      . #7#)))
                                              NIL (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (COND
                                           ((NULL |tord|)
                                            (SEQ
                                             (LETT |tord|
                                                   (NREVERSE (CONS |o| |hord|))
                                                   . #7#)
                                             (EXIT
                                              (SPADCALL |tsys| |rec|
                                                        (QREFELT $ 122)))))
                                           ('T
                                            (SEQ
                                             (LETT |tord|
                                                   (SPADCALL (NREVERSE |hord|)
                                                             (CONS |o| |tord|)
                                                             (QREFELT $ 92))
                                                   . #7#)
                                             (EXIT
                                              (LETT |tsys|
                                                    (SPADCALL |rec| |tsys|
                                                              |pos|
                                                              (QREFELT $ 123))
                                                    . #7#)))))))))))))))
                            (LETT #5#
                                  (PROG1 (CDR #5#)
                                    (LETT #6#
                                          (PROG1 (CDR #6#)
                                            (LETT |i| (|inc_SI| |i|) . #7#))
                                          . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (LETT |rec|
                             (VECTOR |newEqs| |newJM| |newDer| |newPro?| 'T
                                     'NIL 0)
                             . #7#)
                       (LETT |resSys| (CONS |rec| |resSys|) . #7#)
                       (EXIT (LETT |resOrd| (CONS |q| |resOrd|) . #7#)))))
                    (LETT |tsys| (CDR |tsys|) . #7#)
                    (EXIT (LETT |tord| (CDR |tord|) . #7#)))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((ZEROP |q|)
            (SEQ (LETT |jm0| (QVELT (|SPADfirst| |resSys|) 1) . #7#)
                 (EXIT
                  (SEQ (LETT |i| 1 . #7#) (LETT |eq| NIL . #7#)
                       (LETT #4# (QVELT (|SPADfirst| |resSys|) 0) . #7#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |eq| (CAR #4#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |lj| (QCAR (SPADCALL |jm0| |i| (QREFELT $ 69)))
                              . #7#)
                        (EXIT
                         (COND ((NULL |lj|) (|error| "inconsistent system"))
                               ('T
                                (SEQ (LETT |u?| 'NIL . #7#)
                                     (SEQ (LETT #3# NIL . #7#)
                                          (LETT |j| 1 . #7#)
                                          (LETT #2# (QREFELT $ 12) . #7#) G190
                                          (COND
                                           ((OR (|greater_SI| |j| #2#) #3#)
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |u?|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (PROG1 (LETT #1# |j| . #7#)
                                                      (|check_subtype|
                                                       (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       #1#))
                                                    (QREFELT $ 124))
                                                   |lj| (QREFELT $ 125))
                                                  . #7#)))
                                          (LETT |j|
                                                (PROG1 (|inc_SI| |j|)
                                                  (LETT #3# |u?| . #7#))
                                                . #7#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL |u?|)
                                        (|error|
                                         "independent variables not independent")))))))))
                       (LETT #4#
                             (PROG1 (CDR #4#) (LETT |i| (|inc_SI| |i|) . #7#))
                             . #7#)
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT
           (CONS (CONS (NREVERSE |resSys|) (NREVERSE |resOrd|))
                 (NREVERSE |ICs|))))))) 

(DEFUN |JDE;simplify;$R;15!0| (|#1| $$)
  (PROG ($ |o|)
    (LETT $ (QREFELT $$ 1) . #1=(|JDE;simplify;$R;15|))
    (LETT |o| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |#1| (QREFELT $ 70)) |o| (QREFELT $ 73)))))) 

(DEFUN |JDE;project;$Nni$;16| (|De| |q| $)
  (PROG (|resOrd| |resSys| |check| |cDe|)
    (RETURN
     (SEQ
      (LETT |cDe| (SPADCALL |De| (QREFELT $ 37)) . #1=(|JDE;project;$Nni$;16|))
      (EXIT
       (COND ((>= |q| (SPADCALL |De| (QREFELT $ 38))) |cDe|)
             ('T
              (SEQ (LETT |resSys| (QCAR |cDe|) . #1#)
                   (LETT |resOrd| (QCDR |cDe|) . #1#) (LETT |check| 'T . #1#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((NULL |resOrd|) 'NIL)
                                 ('T
                                  (SPADCALL (|SPADfirst| |resOrd|) |q|
                                            (QREFELT $ 73)))))
                          (GO G191)))
                        (SEQ
                         (LETT |check|
                               (COND (|check| (QVELT (|SPADfirst| |resSys|) 4))
                                     ('T 'NIL))
                               . #1#)
                         (LETT |resSys| (CDR |resSys|) . #1#)
                         (EXIT (LETT |resOrd| (CDR |resOrd|) . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (COND
                    ((NULL |check|)
                     (SPADCALL
                      "***** Warning: projection of not simplified system"
                      (QREFELT $ 59))))
                   (EXIT (CONS |resSys| |resOrd|)))))))))) 

(DEFUN |JDE;prolong;$R;17| (|De| $)
  (PROG (|tmp| |res| |pOrd| |pSys| |lastOrd| #1=#:G385 |j| #2=#:G384 |lastRec|
         |pRec| #3=#:G383 |i| #4=#:G382 #5=#:G381 #6=#:G380 |pJM| |pIC| |pJV|
         |pDer| |pEqs| |FDiff| #7=#:G352 |jmeq| #8=#:G377 |eq| #9=#:G378
         #10=#:G379 |pro?| |k| #11=#:G375 |rec| #12=#:G376 |ord| #13=#:G374
         #14=#:G373 #15=#:G372 #16=#:G371 #17=#:G343 #18=#:G369 #19=#:G370 |q|)
    (RETURN
     (SEQ (LETT |pEqs| NIL . #20=(|JDE;prolong;$R;17|))
          (LETT |pDer| NIL . #20#) (LETT |pJV| NIL . #20#)
          (LETT |pIC| NIL . #20#) (LETT |rec| (|SPADfirst| (QCAR |De|)) . #20#)
          (LETT |q| (|SPADfirst| (QCDR |De|)) . #20#)
          (SEQ (LETT |k| 1 . #20#) (LETT |j| NIL . #20#)
               (LETT #19# (QVELT |rec| 2) . #20#) (LETT |eq| NIL . #20#)
               (LETT #18# (QVELT |rec| 0) . #20#) G190
               (COND
                ((OR (ATOM #18#) (PROGN (LETT |eq| (CAR #18#) . #20#) NIL)
                     (ATOM #19#) (PROGN (LETT |j| (CAR #19#) . #20#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |jmeq| (SPADCALL (QVELT |rec| 1) |k| |k| (QREFELT $ 112))
                      . #20#)
                (EXIT
                 (SEQ (LETT |i| (QREFELT $ 10) . #20#) G190
                      (COND ((< |i| |j|) (GO G191)))
                      (SEQ
                       (LETT |FDiff|
                             (SPADCALL |eq|
                                       (PROG1 (LETT #17# |i| . #20#)
                                         (|check_subtype| (> #17# 0)
                                                          '(|PositiveInteger|)
                                                          #17#))
                                       |jmeq| (QREFELT $ 130))
                             . #20#)
                       (LETT |pEqs| (CONS (QCAR |FDiff|) |pEqs|) . #20#)
                       (LETT |pDer| (CONS |i| |pDer|) . #20#)
                       (EXIT (LETT |pJV| (CONS (QCDR |FDiff|) |pJV|) . #20#)))
                      (LETT |i| (+ |i| -1) . #20#) (GO G190) G191 (EXIT NIL))))
               (LETT #18#
                     (PROG1 (CDR #18#)
                       (LETT #19#
                             (PROG1 (CDR #19#)
                               (LETT |k| (|inc_SI| |k|) . #20#))
                             . #20#))
                     . #20#)
               (GO G190) G191 (EXIT NIL))
          (LETT |pEqs| (NREVERSE |pEqs|) . #20#)
          (LETT |pJV| (NREVERSE |pJV|) . #20#)
          (LETT |pDer| (NREVERSE |pDer|) . #20#)
          (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 132)) . #20#)
          (LETT |pRec|
                (VECTOR |pEqs| |pJM| |pDer|
                        (PROGN
                         (LETT #16# NIL . #20#)
                         (SEQ (LETT |i| NIL . #20#) (LETT #15# |pDer| . #20#)
                              G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |i| (CAR #15#) . #20#) NIL))
                                (GO G191)))
                              (SEQ (EXIT (LETT #16# (CONS 'NIL #16#) . #20#)))
                              (LETT #15# (CDR #15#) . #20#) (GO G190) G191
                              (EXIT (NREVERSE #16#))))
                        'NIL 'NIL 0)
                . #20#)
          (LETT |pSys| (LIST |pRec|) . #20#)
          (LETT |pOrd| (LIST (+ |q| 1)) . #20#)
          (LETT |lastRec| (MOVEVEC (MAKE-VEC 7) |rec|) . #20#)
          (QSETVELT |lastRec| 3
                    (PROGN
                     (LETT #14# NIL . #20#)
                     (SEQ (LETT |j| NIL . #20#)
                          (LETT #13# (QVELT |rec| 2) . #20#) G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |j| (CAR #13#) . #20#) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #14# (CONS 'T #14#) . #20#)))
                          (LETT #13# (CDR #13#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #14#)))))
          (LETT |lastOrd| |q| . #20#)
          (SEQ (LETT |ord| NIL . #20#) (LETT #12# (CDR (QCDR |De|)) . #20#)
               (LETT |rec| NIL . #20#) (LETT #11# (CDR (QCAR |De|)) . #20#)
               G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |rec| (CAR #11#) . #20#) NIL)
                     (ATOM #12#) (PROGN (LETT |ord| (CAR #12#) . #20#) NIL))
                 (GO G191)))
               (SEQ (LETT |pEqs| NIL . #20#) (LETT |pDer| NIL . #20#)
                    (LETT |pJV| NIL . #20#)
                    (SEQ (LETT |k| 1 . #20#) (LETT |pro?| NIL . #20#)
                         (LETT #10# (QVELT |rec| 3) . #20#)
                         (LETT |j| NIL . #20#)
                         (LETT #9# (QVELT |rec| 2) . #20#)
                         (LETT |eq| NIL . #20#)
                         (LETT #8# (QVELT |rec| 0) . #20#) G190
                         (COND
                          ((OR (ATOM #8#)
                               (PROGN (LETT |eq| (CAR #8#) . #20#) NIL)
                               (ATOM #9#)
                               (PROGN (LETT |j| (CAR #9#) . #20#) NIL)
                               (ATOM #10#)
                               (PROGN (LETT |pro?| (CAR #10#) . #20#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL |pro?|)
                             (SEQ
                              (LETT |jmeq|
                                    (SPADCALL (QVELT |rec| 1) |k| |k|
                                              (QREFELT $ 112))
                                    . #20#)
                              (EXIT
                               (SEQ (LETT |i| (QREFELT $ 10) . #20#) G190
                                    (COND ((< |i| |j|) (GO G191)))
                                    (SEQ
                                     (LETT |FDiff|
                                           (SPADCALL |eq|
                                                     (PROG1
                                                         (LETT #7# |i| . #20#)
                                                       (|check_subtype|
                                                        (> #7# 0)
                                                        '(|PositiveInteger|)
                                                        #7#))
                                                     |jmeq| (QREFELT $ 130))
                                           . #20#)
                                     (LETT |pEqs| (CONS (QCAR |FDiff|) |pEqs|)
                                           . #20#)
                                     (LETT |pDer| (CONS |i| |pDer|) . #20#)
                                     (EXIT
                                      (LETT |pJV| (CONS (QCDR |FDiff|) |pJV|)
                                            . #20#)))
                                    (LETT |i| (+ |i| -1) . #20#) (GO G190) G191
                                    (EXIT NIL))))))))
                         (LETT #8#
                               (PROG1 (CDR #8#)
                                 (LETT #9#
                                       (PROG1 (CDR #9#)
                                         (LETT #10#
                                               (PROG1 (CDR #10#)
                                                 (LETT |k| (|inc_SI| |k|)
                                                       . #20#))
                                               . #20#))
                                       . #20#))
                               . #20#)
                         (GO G190) G191 (EXIT NIL))
                    (COND
                     ((NULL |pEqs|)
                      (SEQ (LETT |pSys| (CONS |lastRec| |pSys|) . #20#)
                           (EXIT
                            (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #20#))))
                     ('T
                      (SEQ (LETT |pIC| (APPEND |pIC| |pEqs|) . #20#)
                           (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 132))
                                 . #20#)
                           (EXIT
                            (COND
                             ((< (+ |ord| 1) |lastOrd|)
                              (SEQ
                               (LETT |pRec|
                                     (VECTOR |pEqs| |pJM| |pDer|
                                             (PROGN
                                              (LETT #6# NIL . #20#)
                                              (SEQ (LETT |i| NIL . #20#)
                                                   (LETT #5# |pDer| . #20#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #5#)
                                                         (PROGN
                                                          (LETT |i| (CAR #5#)
                                                                . #20#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #6# (CONS 'NIL #6#)
                                                           . #20#)))
                                                   (LETT #5# (CDR #5#) . #20#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #6#))))
                                             'NIL 'NIL 0)
                                     . #20#)
                               (LETT |pSys|
                                     (CONS |pRec| (CONS |lastRec| |pSys|))
                                     . #20#)
                               (EXIT
                                (LETT |pOrd|
                                      (CONS (+ |ord| 1)
                                            (CONS |lastOrd| |pOrd|))
                                      . #20#))))
                             ('T
                              (SEQ
                               (LETT |pRec|
                                     (VECTOR
                                      (APPEND (QVELT |lastRec| 0) |pEqs|)
                                      (SPADCALL (QVELT |lastRec| 1) |pJM|
                                                (QREFELT $ 94))
                                      (APPEND (QVELT |lastRec| 2) |pDer|)
                                      (APPEND (QVELT |lastRec| 3)
                                              (PROGN
                                               (LETT #4# NIL . #20#)
                                               (SEQ (LETT |i| NIL . #20#)
                                                    (LETT #3# |pDer| . #20#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #3#)
                                                          (PROGN
                                                           (LETT |i| (CAR #3#)
                                                                 . #20#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #4# (CONS 'NIL #4#)
                                                            . #20#)))
                                                    (LETT #3# (CDR #3#) . #20#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #4#)))))
                                      'NIL 'NIL 0)
                                     . #20#)
                               (LETT |pSys| (CONS |pRec| |pSys|) . #20#)
                               (EXIT
                                (LETT |pOrd| (CONS |lastOrd| |pOrd|)
                                      . #20#)))))))))
                    (LETT |lastRec| (MOVEVEC (MAKE-VEC 7) |rec|) . #20#)
                    (QSETVELT |lastRec| 3
                              (PROGN
                               (LETT #2# NIL . #20#)
                               (SEQ (LETT |j| NIL . #20#)
                                    (LETT #1# (QVELT |rec| 2) . #20#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |j| (CAR #1#) . #20#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT (LETT #2# (CONS 'T #2#) . #20#)))
                                    (LETT #1# (CDR #1#) . #20#) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))
                    (EXIT (LETT |lastOrd| |ord| . #20#)))
               (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #20#))
                     . #20#)
               (GO G190) G191 (EXIT NIL))
          (LETT |pSys| (CONS |lastRec| |pSys|) . #20#)
          (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #20#)
          (LETT |res| (CONS (NREVERSE |pSys|) (NREVERSE |pOrd|)) . #20#)
          (LETT |tmp| (SPADCALL |res| (QREFELT $ 127)) . #20#)
          (EXIT
           (CONS (QCAR |tmp|) (SPADCALL |pIC| (QCDR |tmp|) (QREFELT $ 93)))))))) 

(DEFUN |JDE;prolong;$NniR;18| (|De| |q| $)
  (PROG (|tmp| |res| |pOrd| |pSys| |lastOrd| |lastRec| #1=#:G432 |j| #2=#:G431
         |pRec| #3=#:G430 |i| #4=#:G429 #5=#:G428 #6=#:G427 |pIC| |pJM| |pDer|
         |pJV| |pEqs| |FDiff| #7=#:G400 |jmeq| #8=#:G424 |eq| #9=#:G425
         #10=#:G426 |pro?| |k| #11=#:G422 |rec| #12=#:G423 |ord| #13=#:G421
         #14=#:G420 #15=#:G390 #16=#:G418 #17=#:G419 |tord| |tsys| |cDe|)
    (RETURN
     (SEQ
      (LETT |cDe| (SPADCALL |De| (QREFELT $ 37))
            . #18=(|JDE;prolong;$NniR;18|))
      (LETT |tsys| (QCAR |cDe|) . #18#) (LETT |tord| (QCDR |cDe|) . #18#)
      (LETT |pSys| NIL . #18#) (LETT |pOrd| NIL . #18#) (LETT |pIC| NIL . #18#)
      (SEQ G190
           (COND
            ((NULL (SPADCALL (|SPADfirst| |tord|) |q| (QREFELT $ 73)))
             (GO G191)))
           (SEQ (LETT |pSys| (CONS (|SPADfirst| |tsys|) |pSys|) . #18#)
                (LETT |pOrd| (CONS (|SPADfirst| |tord|) |pOrd|) . #18#)
                (LETT |tsys| (CDR |tsys|) . #18#)
                (EXIT (LETT |tord| (CDR |tord|) . #18#)))
           NIL (GO G190) G191 (EXIT NIL))
      (COND
       ((NULL (EQL (|SPADfirst| |tord|) |q|))
        (SEQ (LETT |pEqs| NIL . #18#) (LETT |pDer| NIL . #18#)
             (LETT |pJV| NIL . #18#) (LETT |rec| (|SPADfirst| |tsys|) . #18#)
             (LETT |ord| (|SPADfirst| |tord|) . #18#)
             (SEQ (LETT |k| 1 . #18#) (LETT |j| NIL . #18#)
                  (LETT #17# (QVELT |rec| 2) . #18#) (LETT |eq| NIL . #18#)
                  (LETT #16# (QVELT |rec| 0) . #18#) G190
                  (COND
                   ((OR (ATOM #16#) (PROGN (LETT |eq| (CAR #16#) . #18#) NIL)
                        (ATOM #17#) (PROGN (LETT |j| (CAR #17#) . #18#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |jmeq|
                         (SPADCALL (QVELT |rec| 1) |k| |k| (QREFELT $ 112))
                         . #18#)
                   (EXIT
                    (SEQ (LETT |i| (QREFELT $ 10) . #18#) G190
                         (COND ((< |i| |j|) (GO G191)))
                         (SEQ
                          (LETT |FDiff|
                                (SPADCALL |eq|
                                          (PROG1 (LETT #15# |i| . #18#)
                                            (|check_subtype| (> #15# 0)
                                                             '(|PositiveInteger|)
                                                             #15#))
                                          |jmeq| (QREFELT $ 130))
                                . #18#)
                          (LETT |pEqs| (CONS (QCAR |FDiff|) |pEqs|) . #18#)
                          (LETT |pDer| (CONS |i| |pDer|) . #18#)
                          (EXIT
                           (LETT |pJV| (CONS (QCDR |FDiff|) |pJV|) . #18#)))
                         (LETT |i| (+ |i| -1) . #18#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT #16#
                        (PROG1 (CDR #16#)
                          (LETT #17#
                                (PROG1 (CDR #17#)
                                  (LETT |k| (|inc_SI| |k|) . #18#))
                                . #18#))
                        . #18#)
                  (GO G190) G191 (EXIT NIL))
             (LETT |pEqs| (NREVERSE |pEqs|) . #18#)
             (LETT |pJV| (NREVERSE |pJV|) . #18#)
             (LETT |pDer| (NREVERSE |pDer|) . #18#)
             (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 132)) . #18#)
             (LETT |pIC| |pEqs| . #18#)
             (LETT |pRec|
                   (VECTOR |pEqs| |pJM| |pDer|
                           (PROGN
                            (LETT #14# NIL . #18#)
                            (SEQ (LETT |i| NIL . #18#)
                                 (LETT #13# |pDer| . #18#) G190
                                 (COND
                                  ((OR (ATOM #13#)
                                       (PROGN
                                        (LETT |i| (CAR #13#) . #18#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT (LETT #14# (CONS 'NIL #14#) . #18#)))
                                 (LETT #13# (CDR #13#) . #18#) (GO G190) G191
                                 (EXIT (NREVERSE #14#))))
                           'NIL 'NIL 0)
                   . #18#)
             (LETT |pSys| (CONS |pRec| |pSys|) . #18#)
             (EXIT (LETT |pOrd| (CONS (+ |ord| 1) |pOrd|) . #18#)))))
      (LETT |lastRec| (|SPADfirst| |tsys|) . #18#)
      (LETT |lastOrd| (|SPADfirst| |tord|) . #18#)
      (SEQ (LETT |ord| NIL . #18#) (LETT #12# (CDR |tord|) . #18#)
           (LETT |rec| NIL . #18#) (LETT #11# (CDR |tsys|) . #18#) G190
           (COND
            ((OR (ATOM #11#) (PROGN (LETT |rec| (CAR #11#) . #18#) NIL)
                 (ATOM #12#) (PROGN (LETT |ord| (CAR #12#) . #18#) NIL))
             (GO G191)))
           (SEQ (LETT |pEqs| NIL . #18#) (LETT |pDer| NIL . #18#)
                (LETT |pJV| NIL . #18#)
                (SEQ (LETT |k| 1 . #18#) (LETT |pro?| NIL . #18#)
                     (LETT #10# (QVELT |rec| 3) . #18#) (LETT |j| NIL . #18#)
                     (LETT #9# (QVELT |rec| 2) . #18#) (LETT |eq| NIL . #18#)
                     (LETT #8# (QVELT |rec| 0) . #18#) G190
                     (COND
                      ((OR (ATOM #8#) (PROGN (LETT |eq| (CAR #8#) . #18#) NIL)
                           (ATOM #9#) (PROGN (LETT |j| (CAR #9#) . #18#) NIL)
                           (ATOM #10#)
                           (PROGN (LETT |pro?| (CAR #10#) . #18#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL |pro?|)
                         (SEQ
                          (LETT |jmeq|
                                (SPADCALL (QVELT |rec| 1) |k| |k|
                                          (QREFELT $ 112))
                                . #18#)
                          (EXIT
                           (SEQ (LETT |i| (QREFELT $ 10) . #18#) G190
                                (COND ((< |i| |j|) (GO G191)))
                                (SEQ
                                 (LETT |FDiff|
                                       (SPADCALL |eq|
                                                 (PROG1 (LETT #7# |i| . #18#)
                                                   (|check_subtype| (> #7# 0)
                                                                    '(|PositiveInteger|)
                                                                    #7#))
                                                 |jmeq| (QREFELT $ 130))
                                       . #18#)
                                 (LETT |pEqs| (CONS (QCAR |FDiff|) |pEqs|)
                                       . #18#)
                                 (LETT |pDer| (CONS |i| |pDer|) . #18#)
                                 (EXIT
                                  (LETT |pJV| (CONS (QCDR |FDiff|) |pJV|)
                                        . #18#)))
                                (LETT |i| (+ |i| -1) . #18#) (GO G190) G191
                                (EXIT NIL))))))))
                     (LETT #8#
                           (PROG1 (CDR #8#)
                             (LETT #9#
                                   (PROG1 (CDR #9#)
                                     (LETT #10#
                                           (PROG1 (CDR #10#)
                                             (LETT |k| (|inc_SI| |k|) . #18#))
                                           . #18#))
                                   . #18#))
                           . #18#)
                     (GO G190) G191 (EXIT NIL))
                (COND
                 ((NULL |pEqs|)
                  (SEQ (LETT |pSys| (CONS |lastRec| |pSys|) . #18#)
                       (EXIT (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #18#))))
                 ('T
                  (SEQ (LETT |pEqs| (NREVERSE |pEqs|) . #18#)
                       (LETT |pJV| (NREVERSE |pJV|) . #18#)
                       (LETT |pDer| (NREVERSE |pDer|) . #18#)
                       (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 132))
                             . #18#)
                       (LETT |pIC| (APPEND |pIC| |pEqs|) . #18#)
                       (COND
                        ((< (+ |ord| 1) |lastOrd|)
                         (SEQ
                          (LETT |pRec|
                                (VECTOR |pEqs| |pJM| |pDer|
                                        (PROGN
                                         (LETT #6# NIL . #18#)
                                         (SEQ (LETT |i| NIL . #18#)
                                              (LETT #5# |pDer| . #18#) G190
                                              (COND
                                               ((OR (ATOM #5#)
                                                    (PROGN
                                                     (LETT |i| (CAR #5#)
                                                           . #18#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #6# (CONS 'NIL #6#)
                                                      . #18#)))
                                              (LETT #5# (CDR #5#) . #18#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #6#))))
                                        'NIL 'NIL 0)
                                . #18#)
                          (LETT |pSys| (CONS |pRec| (CONS |lastRec| |pSys|))
                                . #18#)
                          (EXIT
                           (LETT |pOrd|
                                 (CONS (+ |ord| 1) (CONS |lastOrd| |pOrd|))
                                 . #18#))))
                        ('T
                         (SEQ
                          (LETT |pRec|
                                (VECTOR
                                 (SPADCALL (QVELT |lastRec| 0) |pEqs|
                                           (QREFELT $ 93))
                                 (SPADCALL (QVELT |lastRec| 1) |pJM|
                                           (QREFELT $ 94))
                                 (SPADCALL (QVELT |lastRec| 2) |pDer|
                                           (QREFELT $ 92))
                                 (SPADCALL (QVELT |lastRec| 3)
                                           (PROGN
                                            (LETT #4# NIL . #18#)
                                            (SEQ (LETT |i| NIL . #18#)
                                                 (LETT #3# |pDer| . #18#) G190
                                                 (COND
                                                  ((OR (ATOM #3#)
                                                       (PROGN
                                                        (LETT |i| (CAR #3#)
                                                              . #18#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #4# (CONS 'NIL #4#)
                                                         . #18#)))
                                                 (LETT #3# (CDR #3#) . #18#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #4#))))
                                           (QREFELT $ 95))
                                 'NIL 'NIL 0)
                                . #18#)
                          (LETT |pSys| (CONS |pRec| |pSys|) . #18#)
                          (EXIT
                           (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #18#)))))
                       (EXIT
                        (QSETVELT |rec| 3
                                  (PROGN
                                   (LETT #2# NIL . #18#)
                                   (SEQ (LETT |j| NIL . #18#)
                                        (LETT #1# (QVELT |rec| 2) . #18#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |j| (CAR #1#) . #18#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2# (CONS 'T #2#) . #18#)))
                                        (LETT #1# (CDR #1#) . #18#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#)))))))))
                (LETT |lastRec| |rec| . #18#)
                (EXIT (LETT |lastOrd| |ord| . #18#)))
           (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #18#)) . #18#)
           (GO G190) G191 (EXIT NIL))
      (LETT |pSys| (CONS |lastRec| |pSys|) . #18#)
      (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #18#)
      (LETT |res| (CONS (NREVERSE |pSys|) (NREVERSE |pOrd|)) . #18#)
      (LETT |tmp| (SPADCALL |res| (QREFELT $ 127)) . #18#)
      (EXIT
       (CONS (QCAR |tmp|) (SPADCALL |pIC| (QCDR |tmp|) (QREFELT $ 93)))))))) 

(DEFUN |JDE;extractSymbol;$BSem;19| (|De| |solved?| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res|
            (SPADCALL (QVELT (|SPADfirst| (QCAR |De|)) 1) (QREFELT $ 135))
            . #1=(|JDE;extractSymbol;$BSem;19|))
      (COND
       (|solved?|
        (LETT |res| (QVELT (SPADCALL |res| (QREFELT $ 137)) 0) . #1#)))
      (EXIT |res|))))) 

(DEFUN |JDE;analyseSymbol;SemR;20| (|Symb| $)
  (PROG (|LBeta| |k| |MSum| |LastClass| |BetaI| #1=#:G448 |CurClass| #2=#:G447
         |jv| |pivs| |ech| |tmp|)
    (RETURN
     (SEQ
      (LETT |tmp| (SPADCALL |Symb| (QREFELT $ 137))
            . #3=(|JDE;analyseSymbol;SemR;20|))
      (LETT |ech| (QVELT |tmp| 0) . #3#)
      (LETT |pivs| (SPADCALL |ech| (QREFELT $ 139)) . #3#)
      (LETT |MSum| 0 . #3#) (LETT |BetaI| 0 . #3#)
      (LETT |LastClass| (QREFELT $ 10) . #3#) (LETT |LBeta| NIL . #3#)
      (SEQ (LETT |jv| NIL . #3#) (LETT #2# (QCAR |pivs|) . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |jv| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (LETT |CurClass| (SPADCALL |jv| (QREFELT $ 140)) . #3#)
                (EXIT
                 (COND
                  ((EQL |CurClass| |LastClass|)
                   (LETT |BetaI| (+ |BetaI| 1) . #3#))
                  ('T
                   (SEQ (LETT |LBeta| (CONS |BetaI| |LBeta|) . #3#)
                        (LETT |MSum| (+ |MSum| (* |BetaI| |LastClass|)) . #3#)
                        (SEQ (LETT |k| 2 . #3#)
                             (LETT #1# (- |LastClass| |CurClass|) . #3#) G190
                             (COND ((|greater_SI| |k| #1#) (GO G191)))
                             (SEQ (EXIT (LETT |LBeta| (CONS 0 |LBeta|) . #3#)))
                             (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |BetaI| 1 . #3#)
                        (EXIT (LETT |LastClass| |CurClass| . #3#)))))))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |LBeta| (CONS |BetaI| |LBeta|) . #3#)
      (LETT |MSum| (+ |MSum| (* |BetaI| |LastClass|)) . #3#)
      (SEQ (LETT |k| 2 . #3#) G190
           (COND ((|greater_SI| |k| |LastClass|) (GO G191)))
           (SEQ (EXIT (LETT |LBeta| (CONS 0 |LBeta|) . #3#)))
           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (VECTOR (QVELT |tmp| 3) |MSum| |LBeta|)))))) 

(DEFUN |JDE;prolongSymbol;2Sem;21| (|Symb| $)
  (PROG (|ninds| #1=#:G458 #2=#:G471 #3=#:G483 |jv| #4=#:G482 |i| |r| #5=#:G481
         |j| |res| |newInds| #6=#:G456 #7=#:G480 #8=#:G479 |oldInds|)
    (RETURN
     (SEQ
      (LETT |oldInds| (SPADCALL |Symb| (QREFELT $ 62))
            . #9=(|JDE;prolongSymbol;2Sem;21|))
      (LETT |newInds| NIL . #9#)
      (SEQ (LETT |jv| NIL . #9#) (LETT #8# (REVERSE |oldInds|) . #9#) G190
           (COND
            ((OR (ATOM #8#) (PROGN (LETT |jv| (CAR #8#) . #9#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |i| 1 . #9#) (LETT #7# (QREFELT $ 10) . #9#) G190
                  (COND ((|greater_SI| |i| #7#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT |newInds|
                          (CONS
                           (PROG2
                               (LETT #1#
                                     (SPADCALL |jv|
                                               (PROG1 (LETT #6# |i| . #9#)
                                                 (|check_subtype| (> #6# 0)
                                                                  '(|PositiveInteger|)
                                                                  #6#))
                                               (QREFELT $ 144))
                                     . #9#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                           |newInds|)
                          . #9#)))
                  (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))))
           (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
      (LETT |newInds|
            (SPADCALL (CONS #'|JDE;prolongSymbol;2Sem;21!0| $)
                      (SPADCALL |newInds| (QREFELT $ 146)) (QREFELT $ 148))
            . #9#)
      (LETT |res|
            (SPADCALL |newInds|
                      (SPADCALL (QREFELT $ 10) (SPADCALL |Symb| (QREFELT $ 67))
                                (QREFELT $ 149))
                      (QREFELT $ 76))
            . #9#)
      (SEQ (LETT |j| 1 . #9#) (LETT #5# (SPADCALL |Symb| (QREFELT $ 67)) . #9#)
           G190 (COND ((|greater_SI| |j| #5#) (GO G191)))
           (SEQ (LETT |r| (SPADCALL |Symb| |j| (QREFELT $ 69)) . #9#)
                (EXIT
                 (SEQ (LETT |i| (QREFELT $ 10) . #9#) G190
                      (COND ((< |i| 1) (GO G191)))
                      (SEQ
                       (LETT |ninds|
                             (PROGN
                              (LETT #4# NIL . #9#)
                              (SEQ (LETT |jv| NIL . #9#)
                                   (LETT #3# (QCAR |r|) . #9#) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |jv| (CAR #3#) . #9#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL |jv|
                                                                (PROG1
                                                                    (LETT #2#
                                                                          |i|
                                                                          . #9#)
                                                                  (|check_subtype|
                                                                   (> #2# 0)
                                                                   '(|PositiveInteger|)
                                                                   #2#))
                                                                (QREFELT $
                                                                         144))
                                                      . #9#)
                                                (QCDR #1#)
                                              (|check_union| (QEQCAR #1# 0)
                                                             (QREFELT $ 6)
                                                             #1#))
                                            #4#)
                                           . #9#)))
                                   (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                                   (EXIT (NREVERSE #4#))))
                             . #9#)
                       (EXIT
                        (SPADCALL |res|
                                  (+
                                   (-
                                    (SPADCALL (QREFELT $ 10) |j|
                                              (QREFELT $ 149))
                                    |i|)
                                   1)
                                  |ninds| (QCDR |r|) (QREFELT $ 150))))
                      (LETT |i| (+ |i| -1) . #9#) (GO G190) G191 (EXIT NIL))))
           (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |JDE;prolongSymbol;2Sem;21!0| (|x| |y| $)
  (SPADCALL |y| |x| (QREFELT $ 145))) 

(DEFUN |JDE;prolongMV;2R;22| (|mv| $)
  (PROG (|newBeta| |msum| |rank| |sum| #1=#:G489 |beta| |k| |oldBeta|)
    (RETURN
     (SEQ
      (LETT |oldBeta| (REVERSE (QVELT |mv| 2)) . #2=(|JDE;prolongMV;2R;22|))
      (LETT |newBeta| NIL . #2#) (LETT |sum| 0 . #2#) (LETT |rank| 0 . #2#)
      (LETT |msum| 0 . #2#)
      (SEQ (LETT |k| (QREFELT $ 10) . #2#) (LETT |beta| NIL . #2#)
           (LETT #1# |oldBeta| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |beta| (CAR #1#) . #2#) NIL)
                 (< |k| 1))
             (GO G191)))
           (SEQ (LETT |sum| (+ |sum| |beta|) . #2#)
                (LETT |rank| (+ |rank| |sum|) . #2#)
                (LETT |msum| (+ |msum| (* |k| |sum|)) . #2#)
                (EXIT (LETT |newBeta| (CONS |sum| |newBeta|) . #2#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT |k| (+ |k| -1) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (VECTOR |rank| |msum| (NREVERSE |newBeta|))))))) 

(DEFUN |JDE;power| (|lc| |mu| |mask| $)
  (PROG (|k| |res|)
    (RETURN
     (SEQ (LETT |res| (|spadConstant| $ 75) . #1=(|JDE;power|))
          (LETT |k| 1 . #1#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |mask|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (SEQ G190
                     (COND ((NULL (< |k| (|SPADfirst| |mask|))) (GO G191)))
                     (SEQ (LETT |mu| (CDR |mu|) . #1#)
                          (EXIT (LETT |k| (+ |k| 1) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL (|SPADfirst| |lc|) (|SPADfirst| |mu|)
                                          (QREFELT $ 153))
                                (QREFELT $ 154))
                      . #1#)
                (LETT |lc| (CDR |lc|) . #1#) (LETT |mask| (CDR |mask|) . #1#)
                (LETT |mu| (CDR |mu|) . #1#) (EXIT (LETT |k| (+ |k| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |JDE;extPower| (|llc| |mu| |nu| $)
  (PROG (|res| |prod| #1=#:G503 |si| #2=#:G504 |mi| #3=#:G502 |s| |q| |rmu|
         |snu|)
    (RETURN
     (SEQ (LETT |snu| (SPADCALL |nu| (QREFELT $ 156)) . #4=(|JDE;extPower|))
          (LETT |rmu| (SPADCALL |mu| (QREFELT $ 158)) . #4#)
          (LETT |q| (LENGTH (|SPADfirst| |snu|)) . #4#)
          (LETT |res| (|spadConstant| $ 48) . #4#)
          (SEQ (LETT |s| NIL . #4#) (LETT #3# |snu| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |prod| (|spadConstant| $ 75) . #4#)
                    (SEQ (LETT |mi| NIL . #4#) (LETT #2# |rmu| . #4#)
                         (LETT |si| NIL . #4#) (LETT #1# |s| . #4#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |si| (CAR #1#) . #4#) NIL)
                               (ATOM #2#)
                               (PROGN (LETT |mi| (CAR #2#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |prod|
                                 (SPADCALL |prod|
                                           (QAREF2O |llc|
                                                    (+ (- (QREFELT $ 10) |si|)
                                                       1)
                                                    |mi| 1 1)
                                           (QREFELT $ 154))
                                 . #4#)))
                         (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#))
                               . #4#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res| (SPADCALL |res| |prod| (QREFELT $ 159))
                           . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |JDE;tableau;SemJdSem;25| (|Symb| |chi| $)
  (PROG (|le| |li| #1=#:G513 #2=#:G528 |i| #3=#:G529 |s| |mu| |a| #4=#:G526
         |jv| #5=#:G527 |ent| |sum| |r| #6=#:G525 |k| |res| #7=#:G507 #8=#:G524
         |cinds| #9=#:G523 |d| #10=#:G522 |coeffs| |diffs|)
    (RETURN
     (SEQ
      (LETT |diffs| (SPADCALL |chi| (QREFELT $ 161))
            . #11=(|JDE;tableau;SemJdSem;25|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |diffs| (QREFELT $ 162))
                   (SPADCALL (QREFELT $ 10) (QREFELT $ 163)) (QREFELT $ 164))
         (|error| "illegal differential in tableau"))
        ('T
         (SEQ (LETT |coeffs| (SPADCALL |chi| (QREFELT $ 165)) . #11#)
              (LETT |cinds|
                    (PROGN
                     (LETT #10# NIL . #11#)
                     (SEQ (LETT |d| NIL . #11#) (LETT #9# |diffs| . #11#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |d| (CAR #9#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS (SPADCALL |d| (QREFELT $ 166)) #10#)
                                  . #11#)))
                          (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #11#)
              (LETT |res|
                    (SPADCALL
                     (PROGN
                      (LETT #8# NIL . #11#)
                      (SEQ (LETT |i| (QREFELT $ 12) . #11#) G190
                           (COND ((< |i| 1) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #8#
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #7# |i| . #11#)
                                       (|check_subtype| (> #7# 0)
                                                        '(|PositiveInteger|)
                                                        #7#))
                                     (QREFELT $ 124))
                                    #8#)
                                   . #11#)))
                           (LETT |i| (+ |i| -1) . #11#) (GO G190) G191
                           (EXIT (NREVERSE #8#))))
                     (SPADCALL |Symb| (QREFELT $ 67)) (QREFELT $ 76))
                    . #11#)
              (SEQ (LETT |k| 1 . #11#)
                   (LETT #6# (SPADCALL |Symb| (QREFELT $ 67)) . #11#) G190
                   (COND ((|greater_SI| |k| #6#) (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |Symb| |k| (QREFELT $ 69)) . #11#)
                        (LETT |sum|
                              (MAKEARR1 (QREFELT $ 12) (|spadConstant| $ 48))
                              . #11#)
                        (SEQ (LETT |ent| NIL . #11#)
                             (LETT #5# (QCDR |r|) . #11#)
                             (LETT |jv| NIL . #11#)
                             (LETT #4# (QCAR |r|) . #11#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |jv| (CAR #4#) . #11#) NIL)
                                   (ATOM #5#)
                                   (PROGN (LETT |ent| (CAR #5#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |a| (SPADCALL |jv| (QREFELT $ 166)) . #11#)
                              (LETT |mu| (SPADCALL |jv| (QREFELT $ 167))
                                    . #11#)
                              (EXIT
                               (QSETAREF1O |sum| |a|
                                           (SPADCALL (QAREF1O |sum| |a| 1)
                                                     (SPADCALL |ent|
                                                               (|JDE;power|
                                                                |coeffs| |mu|
                                                                |cinds| $)
                                                               (QREFELT $ 154))
                                                     (QREFELT $ 159))
                                           1)))
                             (LETT #4#
                                   (PROG1 (CDR #4#)
                                     (LETT #5# (CDR #5#) . #11#))
                                   . #11#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |li| NIL . #11#) (LETT |le| NIL . #11#)
                        (SEQ (LETT |s| NIL . #11#)
                             (LETT #3# (SPADCALL |sum| (QREFELT $ 169)) . #11#)
                             (LETT |i| 1 . #11#)
                             (LETT #2# (QREFELT $ 12) . #11#) G190
                             (COND
                              ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                                   (PROGN (LETT |s| (CAR #3#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |s| (QREFELT $ 170)))
                                 (SEQ
                                  (LETT |li|
                                        (CONS
                                         (SPADCALL
                                          (PROG1 (LETT #1# |i| . #11#)
                                            (|check_subtype| (> #1# 0)
                                                             '(|PositiveInteger|)
                                                             #1#))
                                          (QREFELT $ 124))
                                         |li|)
                                        . #11#)
                                  (EXIT
                                   (LETT |le| (CONS |s| |le|) . #11#)))))))
                             (LETT |i|
                                   (PROG1 (|inc_SI| |i|)
                                     (LETT #3# (CDR #3#) . #11#))
                                   . #11#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT (SPADCALL |res| |k| |li| |le| (QREFELT $ 150))))
                   (LETT |k| (|inc_SI| |k|) . #11#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|))))))))) 

(DEFUN |JDE;tableau;SemLSem;26| (|Symb| |lchi| $)
  (PROG (|rres| |s| |mu| #1=#:G551 |jv| #2=#:G552 |ent| |r| #3=#:G550 |k| |nu|
         |a| #4=#:G549 |vv| |res| #5=#:G533 #6=#:G548 |j| |i| #7=#:G547 |chi|
         |mco| |inds| #8=#:G531 |q|)
    (RETURN
     (SEQ
      (LETT |q|
            (SPADCALL (|SPADfirst| (SPADCALL |Symb| (QREFELT $ 62)))
                      (QREFELT $ 70))
            . #9=(|JDE;tableau;SemLSem;26|))
      (LETT |inds|
            (SPADCALL |q|
                      (PROG1
                          (LETT #8# (+ (- (QREFELT $ 10) (LENGTH |lchi|)) 1)
                                . #9#)
                        (|check_subtype| (> #8# 0) '(|PositiveInteger|) #8#))
                      (QREFELT $ 172))
            . #9#)
      (LETT |mco|
            (MAKE_MATRIX1 (LENGTH |lchi|) (QREFELT $ 10) (|spadConstant| $ 48))
            . #9#)
      (SEQ (LETT |chi| NIL . #9#) (LETT #7# |lchi| . #9#) (LETT |i| 1 . #9#)
           G190
           (COND
            ((OR (ATOM #7#) (PROGN (LETT |chi| (CAR #7#) . #9#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #9#) (LETT #6# (QREFELT $ 10) . #9#) G190
                  (COND ((|greater_SI| |j| #6#) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF2O |mco| |i| |j|
                                (SPADCALL |chi|
                                          (SPADCALL
                                           (PROG1 (LETT #5# |j| . #9#)
                                             (|check_subtype| (> #5# 0)
                                                              '(|PositiveInteger|)
                                                              #5#))
                                           (QREFELT $ 163))
                                          (QREFELT $ 173))
                                1 1)))
                  (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #7# (CDR #7#) . #9#)) . #9#)
           (GO G190) G191 (EXIT NIL))
      (LETT |res|
            (SPADCALL |inds| (SPADCALL |Symb| (QREFELT $ 67)) (QREFELT $ 76))
            . #9#)
      (SEQ (LETT |vv| NIL . #9#) (LETT #4# (REVERSE |inds|) . #9#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |vv| (CAR #4#) . #9#) NIL))
             (GO G191)))
           (SEQ (LETT |a| (SPADCALL |vv| (QREFELT $ 166)) . #9#)
                (LETT |nu| (SPADCALL |vv| (QREFELT $ 167)) . #9#)
                (EXIT
                 (SEQ (LETT |k| 1 . #9#)
                      (LETT #3# (SPADCALL |Symb| (QREFELT $ 67)) . #9#) G190
                      (COND ((|greater_SI| |k| #3#) (GO G191)))
                      (SEQ
                       (LETT |r| (SPADCALL |Symb| |k| (QREFELT $ 69)) . #9#)
                       (LETT |s| (|spadConstant| $ 48) . #9#)
                       (SEQ (LETT |ent| NIL . #9#) (LETT #2# (QCDR |r|) . #9#)
                            (LETT |jv| NIL . #9#) (LETT #1# (QCAR |r|) . #9#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |jv| (CAR #1#) . #9#) NIL)
                                  (ATOM #2#)
                                  (PROGN (LETT |ent| (CAR #2#) . #9#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL (SPADCALL |jv| (QREFELT $ 166)) |a|)
                                (SEQ
                                 (LETT |mu| (SPADCALL |jv| (QREFELT $ 167))
                                       . #9#)
                                 (EXIT
                                  (LETT |s|
                                        (SPADCALL |s|
                                                  (SPADCALL |ent|
                                                            (|JDE;extPower|
                                                             |mco| |mu| |nu| $)
                                                            (QREFELT $ 154))
                                                  (QREFELT $ 159))
                                        . #9#)))))))
                            (LETT #1#
                                  (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                  . #9#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |s| (QREFELT $ 170)))
                          (SEQ
                           (LETT |rres| (SPADCALL |res| |k| (QREFELT $ 69))
                                 . #9#)
                           (PROGN
                            (RPLACA |rres| (CONS |vv| (QCAR |rres|)))
                            (QCAR |rres|))
                           (PROGN
                            (RPLACD |rres| (CONS |s| (QCDR |rres|)))
                            (QCDR |rres|))
                           (EXIT
                            (SPADCALL |res| |k| |rres| (QREFELT $ 81))))))))
                      (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191
                      (EXIT NIL))))
           (LETT #4# (CDR #4#) . #9#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DECLAIM (NOTINLINE |JetDifferentialEquation;|)) 

(DEFUN |JetDifferentialEquation| (&REST #1=#:G553)
  (PROG ()
    (RETURN
     (PROG (#2=#:G554)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|JetDifferentialEquation|)
                                           '|domainEqualList|)
                . #3=(|JetDifferentialEquation|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |JetDifferentialEquation;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|JetDifferentialEquation|))))))))))) 

(DEFUN |JetDifferentialEquation;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|JetDifferentialEquation|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|JetDifferentialEquation| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 176) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|JetDifferentialEquation|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
      (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
      (QSETREFV $ 13 0)
      (QSETREFV $ 29
                (|Record| (|:| |Eqs| (|List| |#2|))
                          (|:| JM (|SparseEchelonMatrix| |#1| |#2|))
                          (|:| |Deriv| (|List| (|NonNegativeInteger|)))
                          (|:| |Prolonged?| (|List| (|Boolean|)))
                          (|:| |Simp?| (|Boolean|)) (|:| |Dim?| (|Boolean|))
                          (|:| |Dim| (|NonNegativeInteger|))))
      (QSETREFV $ 30
                (|Record| (|:| |Sys| (|List| (QREFELT $ 29)))
                          (|:| |Order| (|List| (|NonNegativeInteger|)))))
      $)))) 

(MAKEPROP '|JetDifferentialEquation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |numIndVar|) '|nn| (4 . |numDepVar|)
              '|mm| '|simpMode| (|NonNegativeInteger|) |JDE;setSimpMode;2Nni;1|
              (|List| 14) (8 . |#|) (|Integer|) (13 . |qelt|) (|Boolean|)
              (|List| 20) (19 . |qelt|) (25 . |min|) (|Mapping| 14 14 14)
              (31 . |reduce|) (37 . |and|) (|Mapping| 20 20 20) (43 . |reduce|)
              '|SysRec| '|Rep| (|List| 7) (49 . |copy|)
              (|SparseEchelonMatrix| 6 7) (54 . |copy|) (59 . |copy|)
              (64 . |copy|) |JDE;copy;2$;3| |JDE;order;$Nni;4| (69 . |append|)
              (|Mapping| 31 31 31) (|List| 31) (75 . |reduce|)
              |JDE;retract;$L;5| (|List| 33) |JDE;jacobiMatrix;$L;6|
              (|OutputForm|) (82 . |empty|) (86 . |Zero|) (|Equation| 7)
              (90 . =) (96 . |coerce|) (|List| $) (101 . |vconcat|)
              |JDE;printSys;LOf;7| |JDE;coerce;$Of;8| (106 . |coerce|)
              (111 . |hconcat|) (|Void|) (117 . |print|) (122 . |coerce|)
              (|List| 6) (127 . |allIndices|) (132 . |coerce|) (137 . |coerce|)
              (142 . |void|) |JDE;display;$V;9| (146 . |nrows|)
              (|Record| (|:| |Indices| 61) (|:| |Entries| 31)) (151 . |row|)
              (157 . |order|) (162 . |removeDuplicates|) (167 . |sort|)
              (172 . >) (178 . |One|) (182 . |One|) (186 . |new|) (|Vector| 33)
              (192 . |construct|) (197 . |position|) (203 . |minIndex|)
              (208 . |setRow!|) (215 . |consRow!|) (|Vector| 31)
              (221 . |minIndex|) (226 . |new|) (232 . |numerator|)
              (|SparseEchelonMatrix| 6 $) (237 . |jacobiMatrix|)
              |JDE;makeSystem;L$;11| (|List| 29) (242 . |concat!|)
              (248 . |concat!|) (254 . |concat!|) (260 . |join|)
              (266 . |concat!|) |JDE;join;3$;12| |JDE;insert;L2$;13|
              (272 . |dimJ|) (277 . |copy|) (282 . |dimS|) (287 . |orderDim|)
              |JDE;dimension;$2Nni;14| (294 . |order|)
              (|Union| '"failed" (|List| 16))
              (|Record| (|:| |Sys| 52) (|:| JM 87) (|:| |Depend| 104))
              (299 . |simpMod|) (306 . |simplify|) (312 . |minIndex|)
              (317 . |delete|) (323 . |delete|) (329 . |delete|)
              (335 . |extract|) (|Mapping| 20 6) (342 . |sortedPurge!|)
              (348 . |deleteRow!|) (354 . |qelt|) (360 . |concat!|)
              (366 . |appendRow!|) (372 . |concat!|) (378 . |concat!|)
              (384 . |qsetelt!|) (391 . |concat!|) (397 . |insert!|) (404 . U)
              (409 . |member?|) (|Record| (|:| |SDe| $) (|:| IC 31))
              |JDE;simplify;$R;15| |JDE;project;$Nni$;16|
              (|Record| (|:| |DPhi| $) (|:| |JVars| 61)) (415 . |formalDiff2|)
              (|List| 61) (422 . |jacobiMatrix|) |JDE;prolong;$R;17|
              |JDE;prolong;$NniR;18| (428 . |extractSymbol|)
              (|Record| (|:| |Ech| $) (|:| |Lt| (|Matrix| 7)) (|:| |Pivots| 31)
                        (|:| |Rank| 14))
              (433 . |rowEchelon|) |JDE;extractSymbol;$BSem;19|
              (438 . |pivots|) (443 . |class|)
              (|Record| (|:| |Rank| 14) (|:| |NumMultVar| 14) (|:| |Betas| 16))
              |JDE;analyseSymbol;SemR;20| (|Union| $ '"0")
              (448 . |differentiate|) (454 . <) (460 . |removeDuplicates!|)
              (|Mapping| 20 6 6) (465 . |sort!|) (471 . *) (477 . |setRow!|)
              |JDE;prolongSymbol;2Sem;21| |JDE;prolongMV;2R;22| (485 . ^)
              (491 . *) (|List| 157) (497 . |allRepeated|) (|List| 8)
              (502 . |m2r|) (507 . +) (|JetDifferential| 6 7)
              (513 . |differentials|) (518 . |last|) (523 . X) (528 . >)
              (534 . |coefficients|) (539 . |index|) (544 . |multiIndex|)
              (|Vector| 7) (549 . |entries|) (554 . |zero?|)
              |JDE;tableau;SemJdSem;25| (559 . |variables|)
              (565 . |coefficient|) (|List| 160) |JDE;tableau;SemLSem;26|)
           '#(|tableau| 571 |simplify| 583 |setSimpMode| 588 |retract| 593
              |prolongSymbol| 598 |prolongMV| 603 |prolong| 608 |project| 619
              |printSys| 625 |order| 630 |makeSystem| 635 |join| 640
              |jacobiMatrix| 646 |insert| 651 |extractSymbol| 657 |display| 663
              |dimension| 668 |copy| 674 |coerce| 679 |analyseSymbol| 684)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 175
                                                 '(0 6 8 9 0 6 8 11 1 16 14 0
                                                   17 2 16 14 0 18 19 2 21 20 0
                                                   18 22 2 14 0 0 0 23 2 16 14
                                                   24 0 25 2 20 0 0 0 26 2 21
                                                   20 27 0 28 1 31 0 0 32 1 33
                                                   0 0 34 1 16 0 0 35 1 21 0 0
                                                   36 2 31 0 0 0 39 3 41 31 40
                                                   0 31 42 0 46 0 47 0 7 0 48 2
                                                   49 0 7 7 50 1 49 46 0 51 1
                                                   46 0 52 53 1 14 46 0 56 2 46
                                                   0 0 0 57 1 46 58 0 59 1 33
                                                   46 0 60 1 33 61 0 62 1 61 46
                                                   0 63 1 16 46 0 64 0 58 0 65
                                                   1 33 14 0 67 2 33 68 0 18 69
                                                   1 6 14 0 70 1 16 0 0 71 1 16
                                                   0 0 72 2 14 20 0 0 73 0 6 0
                                                   74 0 7 0 75 2 33 0 61 18 76
                                                   1 77 0 44 78 2 16 18 14 0 79
                                                   1 16 18 0 80 3 33 58 0 18 68
                                                   81 2 33 58 0 68 82 1 83 18 0
                                                   84 2 21 0 14 20 85 1 7 0 0
                                                   86 1 7 87 52 88 2 90 0 0 0
                                                   91 2 16 0 0 0 92 2 31 0 0 0
                                                   93 2 33 0 0 0 94 2 21 0 0 0
                                                   95 1 6 14 14 98 1 90 0 0 99
                                                   1 6 14 14 100 3 7 14 52 87
                                                   14 101 1 7 14 0 103 3 7 105
                                                   52 87 52 106 2 7 105 52 87
                                                   107 1 31 18 0 108 2 31 0 0
                                                   18 109 2 16 0 0 18 110 2 21
                                                   0 0 18 111 3 33 0 0 18 18
                                                   112 2 33 58 0 113 114 2 33
                                                   58 0 18 115 2 90 29 0 18 116
                                                   2 31 0 0 7 117 2 33 58 0 68
                                                   118 2 16 0 0 14 119 2 21 0 0
                                                   20 120 3 90 29 0 18 29 121 2
                                                   90 0 0 29 122 3 90 0 29 0 18
                                                   123 1 6 0 8 124 2 61 20 6 0
                                                   125 3 7 129 0 8 87 130 2 7
                                                   87 52 131 132 1 7 87 87 135
                                                   1 33 136 0 137 1 33 68 0 139
                                                   1 6 14 0 140 2 6 143 0 8 144
                                                   2 6 20 0 0 145 1 61 0 0 146
                                                   2 61 0 147 0 148 2 14 0 8 0
                                                   149 4 33 58 0 18 61 31 150 2
                                                   7 0 0 14 153 2 7 0 0 0 154 1
                                                   6 155 16 156 1 6 157 16 158
                                                   2 7 0 0 0 159 1 160 61 0 161
                                                   1 61 6 0 162 1 6 0 8 163 2 6
                                                   20 0 0 164 1 160 31 0 165 1
                                                   6 8 0 166 1 6 16 0 167 1 168
                                                   31 0 169 1 7 20 0 170 2 6 52
                                                   14 8 172 2 160 7 0 6 173 2 0
                                                   33 33 174 175 2 0 33 33 160
                                                   171 1 0 126 0 127 1 0 14 14
                                                   15 1 0 31 0 43 1 0 33 33 151
                                                   1 0 141 141 152 1 0 126 0
                                                   133 2 0 126 0 14 134 2 0 0 0
                                                   14 128 1 0 46 31 54 1 0 14 0
                                                   38 1 0 0 31 89 2 0 0 0 0 96
                                                   1 0 44 0 45 2 0 0 31 0 97 2
                                                   0 33 0 20 138 1 0 58 0 66 2
                                                   0 14 0 14 102 1 0 0 0 37 1 0
                                                   46 0 55 1 0 141 33 142)))))
           '|lookupComplete|)) 
