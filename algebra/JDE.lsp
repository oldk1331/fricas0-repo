
(SDEFUN |JDE;setSimpMode;2Nni;1|
        ((|i| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|j| (|NonNegativeInteger|)))
               (SEQ (LETT |j| (QREFELT $ 13)) (SETELT $ 13 |i|) (EXIT |j|)))) 

(SDEFUN |JDE;adapt|
        ((|der| |List| (|NonNegativeInteger|)) (|pro?| |List| (|Boolean|))
         (|dep| |Union| "failed" (|List| (|List| (|NonNegativeInteger|))))
         ($ |Record| (|:| |Der| (|List| (|NonNegativeInteger|)))
          (|:| |Pro?| (|List| (|Boolean|)))))
        (SPROG
         ((|resPro?| (|List| (|Boolean|)))
          (|resDer| (|List| (|NonNegativeInteger|))) (|b| (|Boolean|))
          (#1=#:G166 NIL) (|i| NIL) (#2=#:G165 NIL)
          (|j| (|NonNegativeInteger|)) (#3=#:G164 NIL) (#4=#:G163 NIL)
          (#5=#:G162 NIL) (|d| NIL) (#6=#:G161 NIL) (#7=#:G160 NIL)
          (#8=#:G159 NIL) (#9=#:G158 NIL))
         (SEQ
          (COND
           ((QEQCAR |dep| 0)
            (CONS
             (PROGN
              (LETT #9# NIL)
              (SEQ (LETT |i| NIL) (LETT #8# |der|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #9# (CONS 1 #9#)))) (LETT #8# (CDR #8#))
                   (GO G190) G191 (EXIT (NREVERSE #9#))))
             (PROGN
              (LETT #7# NIL)
              (SEQ (LETT |i| NIL) (LETT #6# |der|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #7# (CONS NIL #7#)))) (LETT #6# (CDR #6#))
                   (GO G190) G191 (EXIT (NREVERSE #7#))))))
           ('T
            (SEQ (LETT |resDer| NIL) (LETT |resPro?| NIL)
                 (SEQ (LETT |d| NIL) (LETT #5# (QCDR |dep|)) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |d| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((EQL (SPADCALL |d| (QREFELT $ 17)) 1)
                          (SEQ
                           (LETT |resDer|
                                 (CONS
                                  (SPADCALL |der| (|SPADfirst| |d|)
                                            (QREFELT $ 19))
                                  |resDer|))
                           (EXIT
                            (LETT |resPro?|
                                  (CONS
                                   (SPADCALL |pro?| (|SPADfirst| |d|)
                                             (QREFELT $ 22))
                                   |resPro?|)))))
                         ('T
                          (SEQ
                           (LETT |j|
                                 (SPADCALL (ELT $ 23)
                                           (PROGN
                                            (LETT #4# NIL)
                                            (SEQ (LETT |i| NIL) (LETT #3# |d|)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #3#)
                                                       (PROGN
                                                        (LETT |i| (CAR #3#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #4#
                                                         (CONS
                                                          (SPADCALL |der| |i|
                                                                    (QREFELT $
                                                                             19))
                                                          #4#))))
                                                 (LETT #3# (CDR #3#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #4#))))
                                           (QREFELT $ 25)))
                           (LETT |b|
                                 (SPADCALL (ELT $ 26)
                                           (PROGN
                                            (LETT #2# NIL)
                                            (SEQ (LETT |i| NIL) (LETT #1# |d|)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #1#)
                                                       (PROGN
                                                        (LETT |i| (CAR #1#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #2#
                                                         (CONS
                                                          (SPADCALL |pro?| |i|
                                                                    (QREFELT $
                                                                             22))
                                                          #2#))))
                                                 (LETT #1# (CDR #1#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #2#))))
                                           (QREFELT $ 28)))
                           (LETT |resDer| (CONS |j| |resDer|))
                           (EXIT (LETT |resPro?| (CONS |b| |resPro?|))))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (EXIT (CONS (NREVERSE |resDer|) (NREVERSE |resPro?|))))))))) 

(SDEFUN |JDE;copy;2$;3| ((|De| $) ($ $))
        (SPROG
         ((|newOrd| (|List| (|NonNegativeInteger|)))
          (|newSys| (|List| |SysRec|)) (#1=#:G177 NIL) (|sys| NIL)
          (#2=#:G176 NIL))
         (SEQ
          (LETT |newSys|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |sys| NIL) (LETT #1# (QCAR |De|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sys| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR
                                (SPADCALL (QVELT |sys| 0) (QREFELT $ 32))
                                (SPADCALL (QVELT |sys| 1) (QREFELT $ 34))
                                (SPADCALL (QVELT |sys| 2) (QREFELT $ 35))
                                (SPADCALL (QVELT |sys| 3) (QREFELT $ 36))
                                (QVELT |sys| 4) (QVELT |sys| 5)
                                (QVELT |sys| 6))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |newOrd| (SPADCALL (QCDR |De|) (QREFELT $ 35)))
          (EXIT (CONS |newSys| |newOrd|))))) 

(SDEFUN |JDE;order;$Nni;4| ((|De| $) ($ |NonNegativeInteger|))
        (COND ((NULL (QCDR |De|)) 0) ('T (|SPADfirst| (QCDR |De|))))) 

(SDEFUN |JDE;retract;$L;5| ((|De| $) ($ |List| D))
        (SPROG
         ((|LSys| (|List| (|List| D))) (#1=#:G186 NIL) (|sys| NIL)
          (#2=#:G185 NIL))
         (SEQ
          (LETT |LSys|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |sys| NIL) (LETT #1# (QCAR |De|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sys| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |sys| 0) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL (ELT $ 39) |LSys| NIL (QREFELT $ 42)))))) 

(SDEFUN |JDE;jacobiMatrix;$L;6|
        ((|De| $) ($ |List| (|SparseEchelonMatrix| JB D)))
        (SPROG ((#1=#:G190 NIL) (|sys| NIL) (#2=#:G189 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |sys| NIL) (LETT #1# (QCAR |De|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sys| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |sys| 1) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |JDE;printSys;LOf;7| ((|sys| |List| D) ($ |OutputForm|))
        (SPROG
         ((|tmp| (|List| (|OutputForm|))) (#1=#:G198 NIL) (|eq| NIL)
          (|leq| (|List| (|Equation| D))) (#2=#:G197 NIL) (#3=#:G196 NIL))
         (SEQ
          (COND ((NULL |sys|) (SPADCALL (QREFELT $ 47)))
                ('T
                 (SEQ
                  (LETT |leq|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |eq| NIL) (LETT #2# |sys|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |eq| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL |eq| (|spadConstant| $ 48)
                                                 (QREFELT $ 50))
                                       #3#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (LETT |tmp| NIL)
                  (SEQ (LETT |eq| NIL) (LETT #1# |leq|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |tmp|
                               (CONS (SPADCALL |eq| (QREFELT $ 51))
                                     (CONS (SPADCALL " " (QREFELT $ 53))
                                           |tmp|)))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL (REVERSE |tmp|) (QREFELT $ 55))))))))) 

(SDEFUN |JDE;coerce;$Of;8| ((|De| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |De| (QREFELT $ 43)) (QREFELT $ 56))) 

(SDEFUN |JDE;display;$V;9| ((|De| $) ($ |Void|))
        (SPROG ((#1=#:G206 NIL) (|sys| NIL) (#2=#:G207 NIL) (|ord| NIL))
               (SEQ
                (SEQ (LETT |ord| NIL) (LETT #2# (QCDR |De|)) (LETT |sys| NIL)
                     (LETT #1# (QCAR |De|)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |sys| (CAR #1#)) NIL)
                           (ATOM #2#) (PROGN (LETT |ord| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (SPADCALL
                       (SPADCALL (SPADCALL "Order: " (QREFELT $ 53))
                                 (SPADCALL |ord| (QREFELT $ 58))
                                 (QREFELT $ 59))
                       (QREFELT $ 61))
                      (SPADCALL (SPADCALL "  System:" (QREFELT $ 53))
                                (QREFELT $ 61))
                      (SPADCALL
                       (SPADCALL (SPADCALL "    " (QREFELT $ 53))
                                 (SPADCALL (QVELT |sys| 0) (QREFELT $ 56))
                                 (QREFELT $ 59))
                       (QREFELT $ 61))
                      (COND
                       ((QVELT |sys| 4)
                        (SPADCALL
                         (SPADCALL "    (system simplified)" (QREFELT $ 53))
                         (QREFELT $ 61))))
                      (COND
                       ((QVELT |sys| 5)
                        (SPADCALL
                         (SPADCALL (SPADCALL "  Dimension: " (QREFELT $ 53))
                                   (SPADCALL (QVELT |sys| 6) (QREFELT $ 58))
                                   (QREFELT $ 59))
                         (QREFELT $ 61))))
                      (SPADCALL (SPADCALL "  Jacobi matrix:" (QREFELT $ 53))
                                (QREFELT $ 61))
                      (SPADCALL
                       (SPADCALL (SPADCALL "    " (QREFELT $ 53))
                                 (SPADCALL (QVELT |sys| 1) (QREFELT $ 62))
                                 (QREFELT $ 59))
                       (QREFELT $ 61))
                      (SPADCALL
                       (SPADCALL (SPADCALL "    " (QREFELT $ 53))
                                 (SPADCALL
                                  (SPADCALL (QVELT |sys| 1) (QREFELT $ 64))
                                  (QREFELT $ 65))
                                 (QREFELT $ 59))
                       (QREFELT $ 61))
                      (SPADCALL (SPADCALL "  Last derivations:" (QREFELT $ 53))
                                (QREFELT $ 61))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL "    " (QREFELT $ 53))
                                  (SPADCALL (QVELT |sys| 2) (QREFELT $ 66))
                                  (QREFELT $ 59))
                        (QREFELT $ 61))))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL (QREFELT $ 67)))))) 

(SDEFUN |JDE;makeSystem2|
        ((|sys| |List| D) (|jm| |SparseEchelonMatrix| JB D)
         (|der| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|resSys| (|List| |SysRec|)) (|rec| (|SysRec|)) (#1=#:G228 NIL)
          (|ord| NIL) (|i| NIL) (|pos| (|Integer|)) (#2=#:G225 NIL) (|eq| NIL)
          (#3=#:G226 NIL) (#4=#:G227 NIL) (|q| NIL) (|j| NIL)
          (|vjm| (|Vector| (|SparseEchelonMatrix| JB D)))
          (|vder| (|Vector| (|List| (|NonNegativeInteger|))))
          (|vsys| (|Vector| (|List| D)))
          (|ljm| (|List| (|SparseEchelonMatrix| JB D))) (|inds| (|List| JB))
          (#5=#:G224 NIL) (|nord| (|NonNegativeInteger|))
          (|resOrd| (|List| (|NonNegativeInteger|)))
          (|lord| (|List| (|NonNegativeInteger|))) (#6=#:G223 NIL)
          (#7=#:G222 NIL))
         (SEQ
          (LETT |lord|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |i| 1) (LETT #6# (SPADCALL |jm| (QREFELT $ 69)))
                      G190 (COND ((|greater_SI| |i| #6#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (SPADCALL
                                (|SPADfirst|
                                 (QCAR (SPADCALL |jm| |i| (QREFELT $ 71))))
                                (QREFELT $ 72))
                               #7#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #7#)))))
          (LETT |resOrd|
                (REVERSE
                 (SPADCALL (SPADCALL |lord| (QREFELT $ 73)) (QREFELT $ 74))))
          (LETT |nord| (SPADCALL |resOrd| (QREFELT $ 17)))
          (LETT |inds| (SPADCALL |jm| (QREFELT $ 64))) (LETT |ljm| NIL)
          (SEQ (LETT |q| NIL) (LETT #5# |resOrd|) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#)) NIL)) (GO G191)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL
                         (SPADCALL (|SPADfirst| |inds|) (QREFELT $ 72)) |q|
                         (QREFELT $ 75)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |inds| (CDR |inds|)))) NIL (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (LETT |ljm| (CONS (SPADCALL |inds| 1 (QREFELT $ 78)) |ljm|))))
               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
          (LETT |vsys| (MAKEARR1 |nord| NIL))
          (LETT |vder| (MAKEARR1 |nord| NIL))
          (LETT |vjm| (SPADCALL (NREVERSE |ljm|) (QREFELT $ 80)))
          (SEQ (LETT |j| (SPADCALL |jm| (QREFELT $ 69))) (LETT |q| NIL)
               (LETT #4# (REVERSE |lord|)) (LETT |i| NIL)
               (LETT #3# (REVERSE |der|)) (LETT |eq| NIL)
               (LETT #2# (REVERSE |sys|)) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL) (ATOM #3#)
                     (PROGN (LETT |i| (CAR #3#)) NIL) (ATOM #4#)
                     (PROGN (LETT |q| (CAR #4#)) NIL) (< |j| 1))
                 (GO G191)))
               (SEQ
                (LETT |pos|
                      (- (+ (SPADCALL |q| |resOrd| (QREFELT $ 81)) 1)
                         (SPADCALL |resOrd| (QREFELT $ 82))))
                (EXIT
                 (COND
                  ((NULL (QAREF1O |vsys| |pos| 1))
                   (SEQ (QSETAREF1O |vsys| |pos| (LIST |eq|) 1)
                        (SPADCALL (QAREF1O |vjm| |pos| 1) 1
                                  (SPADCALL |jm| |j| (QREFELT $ 71))
                                  (QREFELT $ 83))
                        (EXIT (QSETAREF1O |vder| |pos| (LIST |i|) 1))))
                  ('T
                   (SEQ
                    (QSETAREF1O |vsys| |pos|
                                (CONS |eq| (QAREF1O |vsys| |pos| 1)) 1)
                    (SPADCALL (QAREF1O |vjm| |pos| 1)
                              (SPADCALL |jm| |j| (QREFELT $ 71))
                              (QREFELT $ 84))
                    (EXIT
                     (QSETAREF1O |vder| |pos|
                                 (CONS |i| (QAREF1O |vder| |pos| 1)) 1)))))))
               (LETT #2#
                     (PROG1 (CDR #2#)
                       (LETT #3#
                             (PROG1 (CDR #3#)
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT |j| (+ |j| -1))))))))
               (GO G190) G191 (EXIT NIL))
          (LETT |resSys| NIL)
          (SEQ (LETT |i| (SPADCALL |vsys| (QREFELT $ 86))) (LETT |ord| NIL)
               (LETT #1# |resOrd|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ord| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (LETT |rec|
                      (VECTOR (QAREF1O |vsys| |i| 1) (QAREF1O |vjm| |i| 1)
                              (QAREF1O |vder| |i| 1)
                              (SPADCALL
                               (SPADCALL (QAREF1O |vder| |i| 1) (QREFELT $ 17))
                               NIL (QREFELT $ 87))
                              NIL NIL 0))
                (EXIT (LETT |resSys| (CONS |rec| |resSys|))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT (CONS (NREVERSE |resSys|) |resOrd|))))) 

(SDEFUN |JDE;makeSystem;L$;11| ((|sys| |List| D) ($ $))
        (SPROG
         ((|jm| (|SparseEchelonMatrix| JB D))
          (|der| (|List| (|NonNegativeInteger|))) (#1=#:G237 NIL) (|eq| NIL)
          (#2=#:G236 NIL) (|nsys| (|List| D)) (#3=#:G235 NIL) (#4=#:G234 NIL))
         (SEQ
          (COND ((NULL |sys|) (CONS NIL NIL))
                ('T
                 (SEQ
                  (LETT |nsys|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |eq| NIL) (LETT #3# |sys|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |eq| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS (SPADCALL |eq| (QREFELT $ 88))
                                            #4#))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #4#)))))
                  (LETT |der|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |eq| NIL) (LETT #1# |nsys|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |eq| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ (EXIT (LETT #2# (CONS 1 #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (LETT |jm| (SPADCALL |nsys| (QREFELT $ 90)))
                  (EXIT (|JDE;makeSystem2| |nsys| |jm| |der| $)))))))) 

(SDEFUN |JDE;join;3$;12| ((|De1| $) (|De2| $) ($ $))
        (SPROG
         ((|ord2| #1=(|List| (|NonNegativeInteger|))) (|ord1| #1#)
          (|sys2| #2=(|List| |SysRec|)) (|sys1| #2#)
          (|resOrd| (|List| (|NonNegativeInteger|)))
          (|resSys| (|List| |SysRec|)) (|rec| (|SysRec|)) (|rec2| (|SysRec|))
          (|rec1| (|SysRec|)) (|o2| #3=(|NonNegativeInteger|)) (|o1| #3#)
          (|cDe2| ($)) (|cDe1| ($)))
         (SEQ (LETT |cDe1| (SPADCALL |De1| (QREFELT $ 37)))
              (LETT |cDe2| (SPADCALL |De2| (QREFELT $ 37)))
              (LETT |sys1| (QCAR |cDe1|)) (LETT |sys2| (QCAR |cDe2|))
              (LETT |ord1| (QCDR |cDe1|)) (LETT |ord2| (QCDR |cDe2|))
              (LETT |resSys| NIL) (LETT |resOrd| NIL)
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |ord1|) (NULL (NULL |ord2|))) ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL |ord1|)
                       (SEQ
                        (LETT |resSys|
                              (SPADCALL (NREVERSE |sys2|) |resSys|
                                        (QREFELT $ 93)))
                        (LETT |resOrd|
                              (SPADCALL (NREVERSE |ord2|) |resOrd|
                                        (QREFELT $ 94)))
                        (EXIT (LETT |ord2| NIL))))
                      ((NULL |ord2|)
                       (SEQ
                        (LETT |resSys|
                              (SPADCALL (NREVERSE |sys1|) |resSys|
                                        (QREFELT $ 93)))
                        (LETT |resOrd|
                              (SPADCALL (NREVERSE |ord1|) |resOrd|
                                        (QREFELT $ 94)))
                        (EXIT (LETT |ord1| NIL))))
                      ('T
                       (SEQ (LETT |o1| (|SPADfirst| |ord1|))
                            (LETT |o2| (|SPADfirst| |ord2|))
                            (EXIT
                             (COND
                              ((SPADCALL |o1| |o2| (QREFELT $ 75))
                               (SEQ
                                (LETT |resSys|
                                      (CONS (|SPADfirst| |sys1|) |resSys|))
                                (LETT |resOrd| (CONS |o1| |resOrd|))
                                (LETT |sys1| (CDR |sys1|))
                                (EXIT (LETT |ord1| (CDR |ord1|)))))
                              ((SPADCALL |o2| |o1| (QREFELT $ 75))
                               (SEQ
                                (LETT |resSys|
                                      (CONS (|SPADfirst| |sys2|) |resSys|))
                                (LETT |resOrd| (CONS |o2| |resOrd|))
                                (LETT |sys2| (CDR |sys2|))
                                (EXIT (LETT |ord2| (CDR |ord2|)))))
                              ('T
                               (SEQ (LETT |rec1| (|SPADfirst| |sys1|))
                                    (LETT |rec2| (|SPADfirst| |sys2|))
                                    (LETT |rec|
                                          (VECTOR
                                           (SPADCALL (QVELT |rec1| 0)
                                                     (QVELT |rec2| 0)
                                                     (QREFELT $ 95))
                                           (SPADCALL (QVELT |rec1| 1)
                                                     (QVELT |rec2| 1)
                                                     (QREFELT $ 96))
                                           (SPADCALL (QVELT |rec1| 2)
                                                     (QVELT |rec2| 2)
                                                     (QREFELT $ 94))
                                           (SPADCALL (QVELT |rec1| 3)
                                                     (QVELT |rec2| 3)
                                                     (QREFELT $ 97))
                                           NIL NIL 0))
                                    (LETT |resSys| (CONS |rec| |resSys|))
                                    (LETT |resOrd| (CONS |o1| |resOrd|))
                                    (LETT |sys1| (CDR |sys1|))
                                    (LETT |sys2| (CDR |sys2|))
                                    (LETT |ord1| (CDR |ord1|))
                                    (EXIT (LETT |ord2| (CDR |ord2|))))))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resSys|) (NREVERSE |resOrd|)))))) 

(SDEFUN |JDE;insert;L2$;13| ((|sys| |List| D) (|De| $) ($ $))
        (SPROG ((|newDe| ($)))
               (SEQ (LETT |newDe| (SPADCALL |sys| (QREFELT $ 91)))
                    (EXIT (SPADCALL |De| |newDe| (QREFELT $ 98)))))) 

(SDEFUN |JDE;dimension;$2Nni;14|
        ((|De| $) (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (#1=#:G264 NIL)
          (|resSys| (|List| |SysRec|)) (|d| (|NonNegativeInteger|))
          (|simp?| (|Boolean|)) (|qq| (|Integer|)) (#2=#:G270 NIL) (|j| NIL)
          (#3=#:G268 NIL) (|sys| NIL) (#4=#:G269 NIL) (|ord| NIL)
          (|tord| (|List| (|NonNegativeInteger|))) (|tsys| (|List| |SysRec|)))
         (SEQ
          (COND ((NULL (QCDR |De|)) (SPADCALL |q| (QREFELT $ 100)))
                ('T
                 (SEQ (LETT |simp?| 'T)
                      (LETT |tsys| (SPADCALL (QCAR |De|) (QREFELT $ 101)))
                      (LETT |tord| (SPADCALL (QCDR |De|) (QREFELT $ 35)))
                      (LETT |resSys| NIL)
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL (|SPADfirst| |tord|) |q|
                                        (QREFELT $ 75)))
                             (GO G191)))
                           (SEQ
                            (LETT |resSys|
                                  (CONS (|SPADfirst| |tsys|) |resSys|))
                            (LETT |tsys| (CDR |tsys|))
                            (EXIT (LETT |tord| (CDR |tord|))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |qq| |q|) (LETT |res| 0)
                      (SEQ (LETT |ord| NIL) (LETT #4# |tord|) (LETT |sys| NIL)
                           (LETT #3# |tsys|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |sys| (CAR #3#)) NIL)
                                 (ATOM #4#) (PROGN (LETT |ord| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (SEQ (LETT |j| (+ |ord| 1)) (LETT #2# |qq|) G190
                                 (COND ((> |j| #2#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |res|
                                         (+ |res|
                                            (SPADCALL |j| (QREFELT $ 102))))))
                                 (LETT |j| (+ |j| 1)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |qq| (- |ord| 1))
                            (LETT |simp?|
                                  (COND (|simp?| (QVELT |sys| 4)) ('T NIL)))
                            (COND
                             ((QVELT |sys| 5)
                              (LETT |res| (+ |res| (QVELT |sys| 6))))
                             ('T
                              (SEQ
                               (LETT |d|
                                     (SPADCALL (QVELT |sys| 0) (QVELT |sys| 1)
                                               |ord| (QREFELT $ 103)))
                               (LETT |res| (+ |res| |d|)) (QSETVELT |sys| 5 'T)
                               (EXIT (QSETVELT |sys| 6 |d|)))))
                            (EXIT (LETT |resSys| (CONS |sys| |resSys|))))
                           (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                           (GO G190) G191 (EXIT NIL))
                      (COND
                       ((NULL |simp?|)
                        (SPADCALL
                         (SPADCALL
                          "***** Warning: system not simplified in dimension"
                          (QREFELT $ 53))
                         (QREFELT $ 61))))
                      (COND
                       ((>= |qq| 0)
                        (LETT |res|
                              (+ |res|
                                 (SPADCALL
                                  (PROG1 (LETT #1# |qq|)
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 100))))))
                      (PROGN (RPLACA |De| (NREVERSE |resSys|)) (QCAR |De|))
                      (EXIT |res|))))))) 

(SDEFUN |JDE;simplify;$R;15|
        ((|De| $) ($ |Record| (|:| |SDe| $) (|:| IC (|List| D))))
        (SPROG
         ((|u?| (|Boolean|)) (#1=#:G322 NIL) (#2=#:G335 NIL)
          (|j| (|NonNegativeInteger|)) (#3=#:G336 NIL) (|lj| (|List| JB))
          (#4=#:G334 NIL) (|eq| NIL) (|i| NIL)
          (|jm0| (|SparseEchelonMatrix| JB D))
          (|tord| (|List| (|NonNegativeInteger|))) (|tsys| (|List| |SysRec|))
          (|resOrd| #5=(|List| (|NonNegativeInteger|)))
          (|resSys| (|List| |SysRec|)) (|rec| (|SysRec|)) (|pos| (|Integer|))
          (|hord| #5#) (|djm| (|SparseEchelonMatrix| JB D))
          (|newPro?| (|List| (|Boolean|)))
          (|newDer| (|List| (|NonNegativeInteger|))) (|newEqs| #6=(|List| D))
          (|pos2| #7=(|Integer|)) (|pos1| #7#) (|ICs| #8=(|List| D))
          (|o| (|NonNegativeInteger|)) (#9=#:G332 NIL) (#10=#:G333 NIL)
          (|pro?| NIL)
          (|ad|
           (|Record| (|:| |Der| (|List| (|NonNegativeInteger|)))
                     (|:| |Pro?| (|List| (|Boolean|)))))
          (|newJM| #11=(|SparseEchelonMatrix| JB D))
          (|tmp|
           (|Record| (|:| |Sys| #6#) (|:| JM #11#)
                     (|:| |Depend|
                          (|Union| "failed"
                                   (|List| (|List| (|NonNegativeInteger|)))))))
          (|AllEqs| #8#) (|sys| (|SysRec|)) (|q| (|NonNegativeInteger|))
          (|cDe| ($)))
         (SEQ (LETT |resSys| NIL) (LETT |resOrd| NIL) (LETT |ICs| NIL)
              (LETT |cDe| (SPADCALL |De| (QREFELT $ 37)))
              (LETT |tsys| (QCAR |cDe|)) (LETT |tord| (QCDR |cDe|))
              (LETT |AllEqs| NIL)
              (COND
               ((SPADCALL (QREFELT $ 13) 0 (QREFELT $ 75))
                (LETT |AllEqs| (SPADCALL |cDe| (QREFELT $ 43)))))
              (SEQ G190 (COND ((NULL (NULL (NULL |tord|))) (GO G191)))
                   (SEQ (LETT |q| (|SPADfirst| |tord|))
                        (LETT |sys| (|SPADfirst| |tsys|))
                        (COND
                         ((QVELT |sys| 4)
                          (SEQ (LETT |resSys| (CONS |sys| |resSys|))
                               (EXIT (LETT |resOrd| (CONS |q| |resOrd|)))))
                         ('T
                          (SEQ
                           (COND
                            ((SPADCALL (QREFELT $ 13) 0 (QREFELT $ 75))
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND ((NULL |AllEqs|) NIL)
                                           ('T
                                            (NULL
                                             (<
                                              (SPADCALL (|SPADfirst| |AllEqs|)
                                                        (QREFELT $ 105))
                                              |q|)))))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT |AllEqs| (CDR |AllEqs|))))
                                  NIL (GO G190) G191 (EXIT NIL))))
                           (COND
                            ((SPADCALL (QREFELT $ 13) 0 (QREFELT $ 75))
                             (SEQ
                              (LETT |tmp|
                                    (SPADCALL (QVELT |sys| 0) (QVELT |sys| 1)
                                              |AllEqs| (QREFELT $ 108)))
                              (EXIT
                               (LETT |tmp|
                                     (SPADCALL (QVELT |tmp| 0) (QVELT |tmp| 1)
                                               (QREFELT $ 109))))))
                            ('T
                             (LETT |tmp|
                                   (SPADCALL (QVELT |sys| 0) (QVELT |sys| 1)
                                             (QREFELT $ 109)))))
                           (LETT |newEqs| (QVELT |tmp| 0))
                           (LETT |newJM| (QVELT |tmp| 1))
                           (LETT |ad|
                                 (|JDE;adapt| (QVELT |sys| 2) (QVELT |sys| 3)
                                  (QVELT |tmp| 2) $))
                           (LETT |newDer| (QCAR |ad|))
                           (LETT |newPro?| (QCDR |ad|)) (LETT |j| 0)
                           (SEQ (LETT |i| 1) (LETT |pro?| NIL)
                                (LETT #10# |newPro?|) (LETT |eq| NIL)
                                (LETT #9# |newEqs|) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |eq| (CAR #9#)) NIL)
                                      (ATOM #10#)
                                      (PROGN (LETT |pro?| (CAR #10#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |o|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (QCAR
                                          (SPADCALL |newJM| (- |i| |j|)
                                                    (QREFELT $ 71))))
                                        (QREFELT $ 72)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |o| |q| (QREFELT $ 75))
                                    (|error| "order raised in simplify"))
                                   ((< |o| |q|)
                                    (SEQ (LETT |ICs| (CONS |eq| |ICs|))
                                         (LETT |j| (+ |j| 1))
                                         (LETT |pos1| (+ (- |i| |j|) 1))
                                         (LETT |pos2|
                                               (+ (- |i| |j|)
                                                  (SPADCALL |newEqs|
                                                            (QREFELT $ 110))))
                                         (LETT |newEqs|
                                               (SPADCALL |newEqs| |pos2|
                                                         (QREFELT $ 111)))
                                         (LETT |newDer|
                                               (SPADCALL |newDer| |pos2|
                                                         (QREFELT $ 112)))
                                         (LETT |newPro?|
                                               (SPADCALL |newPro?| |pos2|
                                                         (QREFELT $ 113)))
                                         (LETT |djm|
                                               (SPADCALL |newJM| |pos1| |pos1|
                                                         (QREFELT $ 114)))
                                         (SPADCALL |djm|
                                                   (CONS
                                                    #'|JDE;simplify;$R;15!0|
                                                    (VECTOR |o| $))
                                                   (QREFELT $ 116))
                                         (SPADCALL |newJM| |pos1|
                                                   (QREFELT $ 117))
                                         (LETT |pos|
                                               (SPADCALL |o| |tord|
                                                         (QREFELT $ 81)))
                                         (EXIT
                                          (COND
                                           ((>= |pos|
                                                (SPADCALL |tord|
                                                          (QREFELT $ 82)))
                                            (SEQ
                                             (LETT |rec|
                                                   (SPADCALL |tsys| |pos|
                                                             (QREFELT $ 118)))
                                             (SPADCALL (QVELT |rec| 0) |eq|
                                                       (QREFELT $ 119))
                                             (SPADCALL (QVELT |rec| 1)
                                                       (SPADCALL |djm| 1
                                                                 (QREFELT $
                                                                          71))
                                                       (QREFELT $ 120))
                                             (SPADCALL (QVELT |rec| 2) 1
                                                       (QREFELT $ 121))
                                             (SPADCALL (QVELT |rec| 3) |pro?|
                                                       (QREFELT $ 122))
                                             (QSETVELT |rec| 4 NIL)
                                             (QSETVELT |rec| 5 NIL)
                                             (QSETVELT |rec| 6 0)
                                             (EXIT
                                              (SPADCALL |tsys| |pos| |rec|
                                                        (QREFELT $ 123)))))
                                           ('T
                                            (SEQ
                                             (LETT |rec|
                                                   (VECTOR (LIST |eq|) |djm|
                                                           (LIST 1)
                                                           (LIST |pro?|) NIL
                                                           NIL 0))
                                             (LETT |hord| NIL)
                                             (LETT |pos|
                                                   (-
                                                    (SPADCALL |tord|
                                                              (QREFELT $ 82))
                                                    1))
                                             (SEQ G190
                                                  (COND
                                                   ((NULL
                                                     (COND ((NULL |tord|) NIL)
                                                           ('T
                                                            (SPADCALL
                                                             (|SPADfirst|
                                                              |tord|)
                                                             |o|
                                                             (QREFELT $ 75)))))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |hord|
                                                         (CONS
                                                          (|SPADfirst| |tord|)
                                                          |hord|))
                                                   (LETT |tord| (CDR |tord|))
                                                   (EXIT
                                                    (LETT |pos| (+ |pos| 1))))
                                                  NIL (GO G190) G191
                                                  (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL |tord|)
                                                (SEQ
                                                 (LETT |tord|
                                                       (NREVERSE
                                                        (CONS |o| |hord|)))
                                                 (EXIT
                                                  (SPADCALL |tsys| |rec|
                                                            (QREFELT $ 124)))))
                                               ('T
                                                (SEQ
                                                 (LETT |tord|
                                                       (SPADCALL
                                                        (NREVERSE |hord|)
                                                        (CONS |o| |tord|)
                                                        (QREFELT $ 94)))
                                                 (EXIT
                                                  (LETT |tsys|
                                                        (SPADCALL |rec| |tsys|
                                                                  |pos|
                                                                  (QREFELT $
                                                                           125)))))))))))))))))
                                (LETT #9#
                                      (PROG1 (CDR #9#)
                                        (LETT #10#
                                              (PROG1 (CDR #10#)
                                                (LETT |i| (|inc_SI| |i|))))))
                                (GO G190) G191 (EXIT NIL))
                           (LETT |rec|
                                 (VECTOR |newEqs| |newJM| |newDer| |newPro?| 'T
                                         NIL 0))
                           (LETT |resSys| (CONS |rec| |resSys|))
                           (EXIT (LETT |resOrd| (CONS |q| |resOrd|))))))
                        (LETT |tsys| (CDR |tsys|))
                        (EXIT (LETT |tord| (CDR |tord|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((ZEROP |q|)
                (SEQ (LETT |jm0| (QVELT (|SPADfirst| |resSys|) 1))
                     (EXIT
                      (SEQ (LETT |i| 1) (LETT |eq| NIL)
                           (LETT #4# (QVELT (|SPADfirst| |resSys|) 0)) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |eq| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |lj|
                                  (QCAR (SPADCALL |jm0| |i| (QREFELT $ 71))))
                            (EXIT
                             (COND
                              ((NULL |lj|) (|error| "inconsistent system"))
                              ('T
                               (SEQ (LETT |u?| NIL)
                                    (SEQ (LETT #3# NIL) (LETT |j| 1)
                                         (LETT #2# (QREFELT $ 12)) G190
                                         (COND
                                          ((OR (|greater_SI| |j| #2#) #3#)
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |u?|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (PROG1 (LETT #1# |j|)
                                                     (|check_subtype2|
                                                      (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      '(|NonNegativeInteger|)
                                                      #1#))
                                                   (QREFELT $ 126))
                                                  |lj| (QREFELT $ 127)))))
                                         (LETT |j|
                                               (PROG1 (|inc_SI| |j|)
                                                 (LETT #3# |u?|)))
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((NULL |u?|)
                                       (|error|
                                        "independent variables not independent")))))))))
                           (LETT #4#
                                 (PROG1 (CDR #4#) (LETT |i| (|inc_SI| |i|))))
                           (GO G190) G191 (EXIT NIL))))))
              (EXIT
               (CONS (CONS (NREVERSE |resSys|) (NREVERSE |resOrd|))
                     (NREVERSE |ICs|)))))) 

(SDEFUN |JDE;simplify;$R;15!0| ((|#1| NIL) ($$ NIL))
        (PROG ($ |o|)
          (LETT $ (QREFELT $$ 1))
          (LETT |o| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |#1| (QREFELT $ 72)) |o| (QREFELT $ 75)))))) 

(SDEFUN |JDE;project;$Nni$;16| ((|De| $) (|q| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|resOrd| (|List| (|NonNegativeInteger|)))
          (|resSys| (|List| |SysRec|)) (|check| (|Boolean|)) (|cDe| ($)))
         (SEQ (LETT |cDe| (SPADCALL |De| (QREFELT $ 37)))
              (EXIT
               (COND ((>= |q| (SPADCALL |De| (QREFELT $ 38))) |cDe|)
                     ('T
                      (SEQ (LETT |resSys| (QCAR |cDe|))
                           (LETT |resOrd| (QCDR |cDe|)) (LETT |check| 'T)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND ((NULL |resOrd|) NIL)
                                         ('T
                                          (SPADCALL (|SPADfirst| |resOrd|) |q|
                                                    (QREFELT $ 75)))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |check|
                                       (COND
                                        (|check|
                                         (QVELT (|SPADfirst| |resSys|) 4))
                                        ('T NIL)))
                                 (LETT |resSys| (CDR |resSys|))
                                 (EXIT (LETT |resOrd| (CDR |resOrd|))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (COND
                            ((NULL |check|)
                             (SPADCALL
                              (SPADCALL
                               "***** Warning: projection of not simplified system"
                               (QREFELT $ 53))
                              (QREFELT $ 61))))
                           (EXIT (CONS |resSys| |resOrd|))))))))) 

(SDEFUN |JDE;prolong;$R;17|
        ((|De| $) ($ |Record| (|:| |SDe| $) (|:| IC (|List| D))))
        (SPROG
         ((|tmp| (|Record| (|:| |SDe| $) (|:| IC (|List| D)))) (|res| ($))
          (|pOrd| (|List| (|NonNegativeInteger|))) (|pSys| (|List| |SysRec|))
          (|lastOrd| #1=(|NonNegativeInteger|)) (#2=#:G389 NIL) (|j| NIL)
          (#3=#:G388 NIL) (|lastRec| (|SysRec|)) (|pRec| (|SysRec|))
          (#4=#:G387 NIL) (|i| NIL) (#5=#:G386 NIL) (#6=#:G385 NIL)
          (#7=#:G384 NIL) (|pJM| (|SparseEchelonMatrix| JB D))
          (|pIC| #8=(|List| D)) (|pJV| (|List| (|List| JB)))
          (|pDer| (|List| (|NonNegativeInteger|))) (|pEqs| #8#)
          (|FDiff| (|Record| (|:| |DPhi| D) (|:| |JVars| (|List| JB))))
          (#9=#:G354 NIL) (#10=#:G383 NIL)
          (|jmeq| (|SparseEchelonMatrix| JB D)) (#11=#:G380 NIL) (|eq| NIL)
          (#12=#:G381 NIL) (#13=#:G382 NIL) (|pro?| NIL) (|k| NIL)
          (#14=#:G378 NIL) (|rec| (|SysRec|)) (#15=#:G379 NIL) (|ord| NIL)
          (#16=#:G377 NIL) (#17=#:G376 NIL) (#18=#:G375 NIL) (#19=#:G374 NIL)
          (#20=#:G345 NIL) (#21=#:G373 NIL) (#22=#:G371 NIL) (#23=#:G372 NIL)
          (|q| #1#))
         (SEQ (LETT |pEqs| NIL) (LETT |pDer| NIL) (LETT |pJV| NIL)
              (LETT |pIC| NIL) (LETT |rec| (|SPADfirst| (QCAR |De|)))
              (LETT |q| (|SPADfirst| (QCDR |De|)))
              (SEQ (LETT |k| 1) (LETT |j| NIL) (LETT #23# (QVELT |rec| 2))
                   (LETT |eq| NIL) (LETT #22# (QVELT |rec| 0)) G190
                   (COND
                    ((OR (ATOM #22#) (PROGN (LETT |eq| (CAR #22#)) NIL)
                         (ATOM #23#) (PROGN (LETT |j| (CAR #23#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |jmeq|
                          (SPADCALL (QVELT |rec| 1) |k| |k| (QREFELT $ 114)))
                    (EXIT
                     (SEQ (LETT |i| (QREFELT $ 10)) (LETT #21# |j|) G190
                          (COND ((< |i| #21#) (GO G191)))
                          (SEQ
                           (LETT |FDiff|
                                 (SPADCALL |eq|
                                           (PROG1 (LETT #20# |i|)
                                             (|check_subtype2| (> #20# 0)
                                                               '(|PositiveInteger|)
                                                               '(|NonNegativeInteger|)
                                                               #20#))
                                           |jmeq| (QREFELT $ 132)))
                           (LETT |pEqs| (CONS (QCAR |FDiff|) |pEqs|))
                           (LETT |pDer| (CONS |i| |pDer|))
                           (EXIT (LETT |pJV| (CONS (QCDR |FDiff|) |pJV|))))
                          (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))))
                   (LETT #22#
                         (PROG1 (CDR #22#)
                           (LETT #23#
                                 (PROG1 (CDR #23#)
                                   (LETT |k| (|inc_SI| |k|))))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |pEqs| (NREVERSE |pEqs|)) (LETT |pJV| (NREVERSE |pJV|))
              (LETT |pDer| (NREVERSE |pDer|))
              (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 134)))
              (LETT |pRec|
                    (VECTOR |pEqs| |pJM| |pDer|
                            (PROGN
                             (LETT #19# NIL)
                             (SEQ (LETT |i| NIL) (LETT #18# |pDer|) G190
                                  (COND
                                   ((OR (ATOM #18#)
                                        (PROGN (LETT |i| (CAR #18#)) NIL))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT #19# (CONS NIL #19#))))
                                  (LETT #18# (CDR #18#)) (GO G190) G191
                                  (EXIT (NREVERSE #19#))))
                            NIL NIL 0))
              (LETT |pSys| (LIST |pRec|)) (LETT |pOrd| (LIST (+ |q| 1)))
              (LETT |lastRec| (MOVEVEC (MAKE_VEC 7) |rec|))
              (QSETVELT |lastRec| 3
                        (PROGN
                         (LETT #17# NIL)
                         (SEQ (LETT |j| NIL) (LETT #16# (QVELT |rec| 2)) G190
                              (COND
                               ((OR (ATOM #16#)
                                    (PROGN (LETT |j| (CAR #16#)) NIL))
                                (GO G191)))
                              (SEQ (EXIT (LETT #17# (CONS 'T #17#))))
                              (LETT #16# (CDR #16#)) (GO G190) G191
                              (EXIT (NREVERSE #17#)))))
              (LETT |lastOrd| |q|)
              (SEQ (LETT |ord| NIL) (LETT #15# (CDR (QCDR |De|)))
                   (LETT |rec| NIL) (LETT #14# (CDR (QCAR |De|))) G190
                   (COND
                    ((OR (ATOM #14#) (PROGN (LETT |rec| (CAR #14#)) NIL)
                         (ATOM #15#) (PROGN (LETT |ord| (CAR #15#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pEqs| NIL) (LETT |pDer| NIL) (LETT |pJV| NIL)
                        (SEQ (LETT |k| 1) (LETT |pro?| NIL)
                             (LETT #13# (QVELT |rec| 3)) (LETT |j| NIL)
                             (LETT #12# (QVELT |rec| 2)) (LETT |eq| NIL)
                             (LETT #11# (QVELT |rec| 0)) G190
                             (COND
                              ((OR (ATOM #11#)
                                   (PROGN (LETT |eq| (CAR #11#)) NIL)
                                   (ATOM #12#)
                                   (PROGN (LETT |j| (CAR #12#)) NIL)
                                   (ATOM #13#)
                                   (PROGN (LETT |pro?| (CAR #13#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL |pro?|)
                                 (SEQ
                                  (LETT |jmeq|
                                        (SPADCALL (QVELT |rec| 1) |k| |k|
                                                  (QREFELT $ 114)))
                                  (EXIT
                                   (SEQ (LETT |i| (QREFELT $ 10))
                                        (LETT #10# |j|) G190
                                        (COND ((< |i| #10#) (GO G191)))
                                        (SEQ
                                         (LETT |FDiff|
                                               (SPADCALL |eq|
                                                         (PROG1 (LETT #9# |i|)
                                                           (|check_subtype2|
                                                            (> #9# 0)
                                                            '(|PositiveInteger|)
                                                            '(|NonNegativeInteger|)
                                                            #9#))
                                                         |jmeq|
                                                         (QREFELT $ 132)))
                                         (LETT |pEqs|
                                               (CONS (QCAR |FDiff|) |pEqs|))
                                         (LETT |pDer| (CONS |i| |pDer|))
                                         (EXIT
                                          (LETT |pJV|
                                                (CONS (QCDR |FDiff|) |pJV|))))
                                        (LETT |i| (+ |i| -1)) (GO G190) G191
                                        (EXIT NIL))))))))
                             (LETT #11#
                                   (PROG1 (CDR #11#)
                                     (LETT #12#
                                           (PROG1 (CDR #12#)
                                             (LETT #13#
                                                   (PROG1 (CDR #13#)
                                                     (LETT |k|
                                                           (|inc_SI|
                                                            |k|))))))))
                             (GO G190) G191 (EXIT NIL))
                        (COND
                         ((NULL |pEqs|)
                          (SEQ (LETT |pSys| (CONS |lastRec| |pSys|))
                               (EXIT (LETT |pOrd| (CONS |lastOrd| |pOrd|)))))
                         ('T
                          (SEQ
                           (LETT |pIC| (SPADCALL |pIC| |pEqs| (QREFELT $ 39)))
                           (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 134)))
                           (EXIT
                            (COND
                             ((< (+ |ord| 1) |lastOrd|)
                              (SEQ
                               (LETT |pRec|
                                     (VECTOR |pEqs| |pJM| |pDer|
                                             (PROGN
                                              (LETT #7# NIL)
                                              (SEQ (LETT |i| NIL)
                                                   (LETT #6# |pDer|) G190
                                                   (COND
                                                    ((OR (ATOM #6#)
                                                         (PROGN
                                                          (LETT |i| (CAR #6#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #7#
                                                           (CONS NIL #7#))))
                                                   (LETT #6# (CDR #6#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #7#))))
                                             NIL NIL 0))
                               (LETT |pSys|
                                     (CONS |pRec| (CONS |lastRec| |pSys|)))
                               (EXIT
                                (LETT |pOrd|
                                      (CONS (+ |ord| 1)
                                            (CONS |lastOrd| |pOrd|))))))
                             ('T
                              (SEQ
                               (LETT |pRec|
                                     (VECTOR
                                      (SPADCALL (QVELT |lastRec| 0) |pEqs|
                                                (QREFELT $ 39))
                                      (SPADCALL (QVELT |lastRec| 1) |pJM|
                                                (QREFELT $ 96))
                                      (SPADCALL (QVELT |lastRec| 2) |pDer|
                                                (QREFELT $ 135))
                                      (SPADCALL (QVELT |lastRec| 3)
                                                (PROGN
                                                 (LETT #5# NIL)
                                                 (SEQ (LETT |i| NIL)
                                                      (LETT #4# |pDer|) G190
                                                      (COND
                                                       ((OR (ATOM #4#)
                                                            (PROGN
                                                             (LETT |i|
                                                                   (CAR #4#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #5#
                                                              (CONS NIL #5#))))
                                                      (LETT #4# (CDR #4#))
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #5#))))
                                                (QREFELT $ 136))
                                      NIL NIL 0))
                               (LETT |pSys| (CONS |pRec| |pSys|))
                               (EXIT
                                (LETT |pOrd| (CONS |lastOrd| |pOrd|))))))))))
                        (LETT |lastRec| (MOVEVEC (MAKE_VEC 7) |rec|))
                        (QSETVELT |lastRec| 3
                                  (PROGN
                                   (LETT #3# NIL)
                                   (SEQ (LETT |j| NIL)
                                        (LETT #2# (QVELT |rec| 2)) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN (LETT |j| (CAR #2#)) NIL))
                                          (GO G191)))
                                        (SEQ (EXIT (LETT #3# (CONS 'T #3#))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT (NREVERSE #3#)))))
                        (EXIT (LETT |lastOrd| |ord|)))
                   (LETT #14# (PROG1 (CDR #14#) (LETT #15# (CDR #15#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |pSys| (CONS |lastRec| |pSys|))
              (LETT |pOrd| (CONS |lastOrd| |pOrd|))
              (LETT |res| (CONS (NREVERSE |pSys|) (NREVERSE |pOrd|)))
              (LETT |tmp| (SPADCALL |res| (QREFELT $ 129)))
              (EXIT
               (CONS (QCAR |tmp|)
                     (SPADCALL |pIC| (QCDR |tmp|) (QREFELT $ 95))))))) 

(SDEFUN |JDE;prolong;$NniR;18|
        ((|De| $) (|q| |NonNegativeInteger|)
         ($ |Record| (|:| |SDe| $) (|:| IC (|List| D))))
        (SPROG
         ((|tmp| (|Record| (|:| |SDe| $) (|:| IC (|List| D)))) (|res| ($))
          (|pOrd| #1=(|List| (|NonNegativeInteger|)))
          (|pSys| (|List| |SysRec|)) (|lastOrd| #2=(|NonNegativeInteger|))
          (|lastRec| (|SysRec|)) (#3=#:G438 NIL) (|j| NIL) (#4=#:G437 NIL)
          (|pRec| (|SysRec|)) (#5=#:G436 NIL) (|i| NIL) (#6=#:G435 NIL)
          (#7=#:G434 NIL) (#8=#:G433 NIL) (|pIC| #9=(|List| D))
          (|pJM| (|SparseEchelonMatrix| JB D)) (|pDer| #1#)
          (|pJV| (|List| (|List| JB))) (|pEqs| #9#)
          (|FDiff| (|Record| (|:| |DPhi| D) (|:| |JVars| (|List| JB))))
          (#10=#:G404 NIL) (#11=#:G432 NIL)
          (|jmeq| (|SparseEchelonMatrix| JB D)) (#12=#:G429 NIL) (|eq| NIL)
          (#13=#:G430 NIL) (#14=#:G431 NIL) (|pro?| NIL) (|k| NIL)
          (#15=#:G427 NIL) (|rec| (|SysRec|)) (#16=#:G428 NIL) (|ord| #2#)
          (#17=#:G426 NIL) (#18=#:G425 NIL) (#19=#:G394 NIL) (#20=#:G424 NIL)
          (#21=#:G422 NIL) (#22=#:G423 NIL)
          (|tord| (|List| (|NonNegativeInteger|))) (|tsys| (|List| |SysRec|))
          (|cDe| ($)))
         (SEQ (LETT |cDe| (SPADCALL |De| (QREFELT $ 37)))
              (LETT |tsys| (QCAR |cDe|)) (LETT |tord| (QCDR |cDe|))
              (LETT |pSys| NIL) (LETT |pOrd| NIL) (LETT |pIC| NIL)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL (|SPADfirst| |tord|) |q| (QREFELT $ 75)))
                     (GO G191)))
                   (SEQ (LETT |pSys| (CONS (|SPADfirst| |tsys|) |pSys|))
                        (LETT |pOrd| (CONS (|SPADfirst| |tord|) |pOrd|))
                        (LETT |tsys| (CDR |tsys|))
                        (EXIT (LETT |tord| (CDR |tord|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL (EQL (|SPADfirst| |tord|) |q|))
                (SEQ (LETT |pEqs| NIL) (LETT |pDer| NIL) (LETT |pJV| NIL)
                     (LETT |rec| (|SPADfirst| |tsys|))
                     (LETT |ord| (|SPADfirst| |tord|))
                     (SEQ (LETT |k| 1) (LETT |j| NIL)
                          (LETT #22# (QVELT |rec| 2)) (LETT |eq| NIL)
                          (LETT #21# (QVELT |rec| 0)) G190
                          (COND
                           ((OR (ATOM #21#) (PROGN (LETT |eq| (CAR #21#)) NIL)
                                (ATOM #22#) (PROGN (LETT |j| (CAR #22#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |jmeq|
                                 (SPADCALL (QVELT |rec| 1) |k| |k|
                                           (QREFELT $ 114)))
                           (EXIT
                            (SEQ (LETT |i| (QREFELT $ 10)) (LETT #20# |j|) G190
                                 (COND ((< |i| #20#) (GO G191)))
                                 (SEQ
                                  (LETT |FDiff|
                                        (SPADCALL |eq|
                                                  (PROG1 (LETT #19# |i|)
                                                    (|check_subtype2|
                                                     (> #19# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #19#))
                                                  |jmeq| (QREFELT $ 132)))
                                  (LETT |pEqs| (CONS (QCAR |FDiff|) |pEqs|))
                                  (LETT |pDer| (CONS |i| |pDer|))
                                  (EXIT
                                   (LETT |pJV| (CONS (QCDR |FDiff|) |pJV|))))
                                 (LETT |i| (+ |i| -1)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT #21#
                                (PROG1 (CDR #21#)
                                  (LETT #22#
                                        (PROG1 (CDR #22#)
                                          (LETT |k| (|inc_SI| |k|))))))
                          (GO G190) G191 (EXIT NIL))
                     (LETT |pEqs| (NREVERSE |pEqs|))
                     (LETT |pJV| (NREVERSE |pJV|))
                     (LETT |pDer| (NREVERSE |pDer|))
                     (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 134)))
                     (LETT |pIC| |pEqs|)
                     (LETT |pRec|
                           (VECTOR |pEqs| |pJM| |pDer|
                                   (PROGN
                                    (LETT #18# NIL)
                                    (SEQ (LETT |i| NIL) (LETT #17# |pDer|) G190
                                         (COND
                                          ((OR (ATOM #17#)
                                               (PROGN
                                                (LETT |i| (CAR #17#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT (LETT #18# (CONS NIL #18#))))
                                         (LETT #17# (CDR #17#)) (GO G190) G191
                                         (EXIT (NREVERSE #18#))))
                                   NIL NIL 0))
                     (LETT |pSys| (CONS |pRec| |pSys|))
                     (EXIT (LETT |pOrd| (CONS (+ |ord| 1) |pOrd|))))))
              (LETT |lastRec| (|SPADfirst| |tsys|))
              (LETT |lastOrd| (|SPADfirst| |tord|))
              (SEQ (LETT |ord| NIL) (LETT #16# (CDR |tord|)) (LETT |rec| NIL)
                   (LETT #15# (CDR |tsys|)) G190
                   (COND
                    ((OR (ATOM #15#) (PROGN (LETT |rec| (CAR #15#)) NIL)
                         (ATOM #16#) (PROGN (LETT |ord| (CAR #16#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pEqs| NIL) (LETT |pDer| NIL) (LETT |pJV| NIL)
                        (SEQ (LETT |k| 1) (LETT |pro?| NIL)
                             (LETT #14# (QVELT |rec| 3)) (LETT |j| NIL)
                             (LETT #13# (QVELT |rec| 2)) (LETT |eq| NIL)
                             (LETT #12# (QVELT |rec| 0)) G190
                             (COND
                              ((OR (ATOM #12#)
                                   (PROGN (LETT |eq| (CAR #12#)) NIL)
                                   (ATOM #13#)
                                   (PROGN (LETT |j| (CAR #13#)) NIL)
                                   (ATOM #14#)
                                   (PROGN (LETT |pro?| (CAR #14#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL |pro?|)
                                 (SEQ
                                  (LETT |jmeq|
                                        (SPADCALL (QVELT |rec| 1) |k| |k|
                                                  (QREFELT $ 114)))
                                  (EXIT
                                   (SEQ (LETT |i| (QREFELT $ 10))
                                        (LETT #11# |j|) G190
                                        (COND ((< |i| #11#) (GO G191)))
                                        (SEQ
                                         (LETT |FDiff|
                                               (SPADCALL |eq|
                                                         (PROG1 (LETT #10# |i|)
                                                           (|check_subtype2|
                                                            (> #10# 0)
                                                            '(|PositiveInteger|)
                                                            '(|NonNegativeInteger|)
                                                            #10#))
                                                         |jmeq|
                                                         (QREFELT $ 132)))
                                         (LETT |pEqs|
                                               (CONS (QCAR |FDiff|) |pEqs|))
                                         (LETT |pDer| (CONS |i| |pDer|))
                                         (EXIT
                                          (LETT |pJV|
                                                (CONS (QCDR |FDiff|) |pJV|))))
                                        (LETT |i| (+ |i| -1)) (GO G190) G191
                                        (EXIT NIL))))))))
                             (LETT #12#
                                   (PROG1 (CDR #12#)
                                     (LETT #13#
                                           (PROG1 (CDR #13#)
                                             (LETT #14#
                                                   (PROG1 (CDR #14#)
                                                     (LETT |k|
                                                           (|inc_SI|
                                                            |k|))))))))
                             (GO G190) G191 (EXIT NIL))
                        (COND
                         ((NULL |pEqs|)
                          (SEQ (LETT |pSys| (CONS |lastRec| |pSys|))
                               (EXIT (LETT |pOrd| (CONS |lastOrd| |pOrd|)))))
                         ('T
                          (SEQ (LETT |pEqs| (NREVERSE |pEqs|))
                               (LETT |pJV| (NREVERSE |pJV|))
                               (LETT |pDer| (NREVERSE |pDer|))
                               (LETT |pJM|
                                     (SPADCALL |pEqs| |pJV| (QREFELT $ 134)))
                               (LETT |pIC|
                                     (SPADCALL |pIC| |pEqs| (QREFELT $ 39)))
                               (COND
                                ((< (+ |ord| 1) |lastOrd|)
                                 (SEQ
                                  (LETT |pRec|
                                        (VECTOR |pEqs| |pJM| |pDer|
                                                (PROGN
                                                 (LETT #8# NIL)
                                                 (SEQ (LETT |i| NIL)
                                                      (LETT #7# |pDer|) G190
                                                      (COND
                                                       ((OR (ATOM #7#)
                                                            (PROGN
                                                             (LETT |i|
                                                                   (CAR #7#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #8#
                                                              (CONS NIL #8#))))
                                                      (LETT #7# (CDR #7#))
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #8#))))
                                                NIL NIL 0))
                                  (LETT |pSys|
                                        (CONS |pRec| (CONS |lastRec| |pSys|)))
                                  (EXIT
                                   (LETT |pOrd|
                                         (CONS (+ |ord| 1)
                                               (CONS |lastOrd| |pOrd|))))))
                                ('T
                                 (SEQ
                                  (LETT |pRec|
                                        (VECTOR
                                         (SPADCALL (QVELT |lastRec| 0) |pEqs|
                                                   (QREFELT $ 95))
                                         (SPADCALL (QVELT |lastRec| 1) |pJM|
                                                   (QREFELT $ 96))
                                         (SPADCALL (QVELT |lastRec| 2) |pDer|
                                                   (QREFELT $ 94))
                                         (SPADCALL (QVELT |lastRec| 3)
                                                   (PROGN
                                                    (LETT #6# NIL)
                                                    (SEQ (LETT |i| NIL)
                                                         (LETT #5# |pDer|) G190
                                                         (COND
                                                          ((OR (ATOM #5#)
                                                               (PROGN
                                                                (LETT |i|
                                                                      (CAR
                                                                       #5#))
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #6#
                                                                 (CONS NIL
                                                                       #6#))))
                                                         (LETT #5# (CDR #5#))
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #6#))))
                                                   (QREFELT $ 97))
                                         NIL NIL 0))
                                  (LETT |pSys| (CONS |pRec| |pSys|))
                                  (EXIT
                                   (LETT |pOrd| (CONS |lastOrd| |pOrd|))))))
                               (EXIT
                                (QSETVELT |rec| 3
                                          (PROGN
                                           (LETT #4# NIL)
                                           (SEQ (LETT |j| NIL)
                                                (LETT #3# (QVELT |rec| 2)) G190
                                                (COND
                                                 ((OR (ATOM #3#)
                                                      (PROGN
                                                       (LETT |j| (CAR #3#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #4# (CONS 'T #4#))))
                                                (LETT #3# (CDR #3#)) (GO G190)
                                                G191
                                                (EXIT (NREVERSE #4#)))))))))
                        (LETT |lastRec| |rec|) (EXIT (LETT |lastOrd| |ord|)))
                   (LETT #15# (PROG1 (CDR #15#) (LETT #16# (CDR #16#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |pSys| (CONS |lastRec| |pSys|))
              (LETT |pOrd| (CONS |lastOrd| |pOrd|))
              (LETT |res| (CONS (NREVERSE |pSys|) (NREVERSE |pOrd|)))
              (LETT |tmp| (SPADCALL |res| (QREFELT $ 129)))
              (EXIT
               (CONS (QCAR |tmp|)
                     (SPADCALL |pIC| (QCDR |tmp|) (QREFELT $ 95))))))) 

(SDEFUN |JDE;extractSymbol;$BSem;19|
        ((|De| $) (|solved?| |Boolean|) ($ |SparseEchelonMatrix| JB D))
        (SPROG ((|res| (|SparseEchelonMatrix| JB D)))
               (SEQ
                (LETT |res|
                      (SPADCALL (QVELT (|SPADfirst| (QCAR |De|)) 1)
                                (QREFELT $ 139)))
                (COND
                 (|solved?|
                  (LETT |res| (QVELT (SPADCALL |res| (QREFELT $ 141)) 0))))
                (EXIT |res|)))) 

(SDEFUN |JDE;analyseSymbol;SemR;20|
        ((|Symb| |SparseEchelonMatrix| JB D)
         ($ |Record| (|:| |Rank| (|NonNegativeInteger|))
          (|:| |NumMultVar| (|NonNegativeInteger|))
          (|:| |Betas| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|LBeta| (|List| (|NonNegativeInteger|))) (#1=#:G455 NIL) (|k| NIL)
          (|MSum| #2=(|NonNegativeInteger|))
          (|LastClass| (|NonNegativeInteger|)) (|BetaI| #2#) (#3=#:G454 NIL)
          (|CurClass| (|NonNegativeInteger|)) (#4=#:G453 NIL) (|jv| NIL)
          (|pivs|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (|ech| #5=(|SparseEchelonMatrix| JB D))
          (|tmp|
           (|Record| (|:| |Ech| #5#) (|:| |Lt| (|Matrix| D))
                     (|:| |Pivots| (|List| D))
                     (|:| |Rank| (|NonNegativeInteger|)))))
         (SEQ (LETT |tmp| (SPADCALL |Symb| (QREFELT $ 141)))
              (LETT |ech| (QVELT |tmp| 0))
              (LETT |pivs| (SPADCALL |ech| (QREFELT $ 143))) (LETT |MSum| 0)
              (LETT |BetaI| 0) (LETT |LastClass| (QREFELT $ 10))
              (LETT |LBeta| NIL)
              (SEQ (LETT |jv| NIL) (LETT #4# (QCAR |pivs|)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |jv| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |CurClass| (SPADCALL |jv| (QREFELT $ 144)))
                        (EXIT
                         (COND
                          ((EQL |CurClass| |LastClass|)
                           (LETT |BetaI| (+ |BetaI| 1)))
                          ('T
                           (SEQ (LETT |LBeta| (CONS |BetaI| |LBeta|))
                                (LETT |MSum|
                                      (+ |MSum| (* |BetaI| |LastClass|)))
                                (SEQ (LETT |k| 2)
                                     (LETT #3# (- |LastClass| |CurClass|)) G190
                                     (COND ((|greater_SI| |k| #3#) (GO G191)))
                                     (SEQ
                                      (EXIT (LETT |LBeta| (CONS 0 |LBeta|))))
                                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |BetaI| 1)
                                (EXIT (LETT |LastClass| |CurClass|)))))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (LETT |LBeta| (CONS |BetaI| |LBeta|))
              (LETT |MSum| (+ |MSum| (* |BetaI| |LastClass|)))
              (SEQ (LETT |k| 2) (LETT #1# |LastClass|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (EXIT (LETT |LBeta| (CONS 0 |LBeta|))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |tmp| 3) |MSum| |LBeta|))))) 

(SDEFUN |JDE;prolongSymbol;2Sem;21|
        ((|Symb| |SparseEchelonMatrix| JB D) ($ |SparseEchelonMatrix| JB D))
        (SPROG
         ((|ninds| (|List| JB)) (#1=#:G465 NIL) (#2=#:G478 NIL) (#3=#:G490 NIL)
          (|jv| NIL) (#4=#:G489 NIL) (|i| NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (#5=#:G488 NIL) (|j| NIL) (|res| (|SparseEchelonMatrix| JB D))
          (|newInds| (|List| JB)) (#6=#:G463 NIL) (#7=#:G487 NIL)
          (#8=#:G486 NIL) (|oldInds| (|List| JB)))
         (SEQ (LETT |oldInds| (SPADCALL |Symb| (QREFELT $ 64)))
              (LETT |newInds| NIL)
              (SEQ (LETT |jv| NIL) (LETT #8# (REVERSE |oldInds|)) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |jv| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #7# (QREFELT $ 10)) G190
                          (COND ((|greater_SI| |i| #7#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |newInds|
                                  (CONS
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL |jv|
                                                       (PROG1 (LETT #6# |i|)
                                                         (|check_subtype2|
                                                          (> #6# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #6#))
                                                       (QREFELT $ 148)))
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 6)
                                                     (|Union| (QREFELT $ 6)
                                                              #9="0")
                                                     #1#))
                                   |newInds|))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |newInds|
                    (SPADCALL (CONS #'|JDE;prolongSymbol;2Sem;21!0| $)
                              (SPADCALL |newInds| (QREFELT $ 150))
                              (QREFELT $ 152)))
              (LETT |res|
                    (SPADCALL |newInds|
                              (SPADCALL (QREFELT $ 10)
                                        (SPADCALL |Symb| (QREFELT $ 69))
                                        (QREFELT $ 153))
                              (QREFELT $ 78)))
              (SEQ (LETT |j| 1) (LETT #5# (SPADCALL |Symb| (QREFELT $ 69)))
                   G190 (COND ((|greater_SI| |j| #5#) (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |Symb| |j| (QREFELT $ 71)))
                        (EXIT
                         (SEQ (LETT |i| (QREFELT $ 10)) G190
                              (COND ((< |i| 1) (GO G191)))
                              (SEQ
                               (LETT |ninds|
                                     (PROGN
                                      (LETT #4# NIL)
                                      (SEQ (LETT |jv| NIL)
                                           (LETT #3# (QCAR |r|)) G190
                                           (COND
                                            ((OR (ATOM #3#)
                                                 (PROGN
                                                  (LETT |jv| (CAR #3#))
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
                                                                            (LETT
                                                                             #2#
                                                                             |i|)
                                                                          (|check_subtype2|
                                                                           (>
                                                                            #2#
                                                                            0)
                                                                           '(|PositiveInteger|)
                                                                           '(|NonNegativeInteger|)
                                                                           #2#))
                                                                        (QREFELT
                                                                         $
                                                                         148)))
                                                        (QCDR #1#)
                                                      (|check_union2|
                                                       (QEQCAR #1# 0)
                                                       (QREFELT $ 6)
                                                       (|Union| (QREFELT $ 6)
                                                                #9#)
                                                       #1#))
                                                    #4#))))
                                           (LETT #3# (CDR #3#)) (GO G190) G191
                                           (EXIT (NREVERSE #4#)))))
                               (EXIT
                                (SPADCALL |res|
                                          (+
                                           (-
                                            (SPADCALL (QREFELT $ 10) |j|
                                                      (QREFELT $ 153))
                                            |i|)
                                           1)
                                          |ninds| (QCDR |r|) (QREFELT $ 154))))
                              (LETT |i| (+ |i| -1)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JDE;prolongSymbol;2Sem;21!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 149))) 

(SDEFUN |JDE;prolongMV;2R;22|
        ((|mv| |Record| (|:| |Rank| (|NonNegativeInteger|))
          (|:| |NumMultVar| (|NonNegativeInteger|))
          (|:| |Betas| (|List| (|NonNegativeInteger|))))
         ($ |Record| (|:| |Rank| (|NonNegativeInteger|))
          (|:| |NumMultVar| (|NonNegativeInteger|))
          (|:| |Betas| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|newBeta| (|List| (|NonNegativeInteger|)))
          (|msum| #1=(|NonNegativeInteger|)) (|rank| #1#) (|sum| #1#)
          (#2=#:G496 NIL) (|beta| NIL) (|k| NIL)
          (|oldBeta| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |oldBeta| (REVERSE (QVELT |mv| 2))) (LETT |newBeta| NIL)
              (LETT |sum| 0) (LETT |rank| 0) (LETT |msum| 0)
              (SEQ (LETT |k| (QREFELT $ 10)) (LETT |beta| NIL)
                   (LETT #2# |oldBeta|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |beta| (CAR #2#)) NIL)
                         (< |k| 1))
                     (GO G191)))
                   (SEQ (LETT |sum| (+ |sum| |beta|))
                        (LETT |rank| (+ |rank| |sum|))
                        (LETT |msum| (+ |msum| (* |k| |sum|)))
                        (EXIT (LETT |newBeta| (CONS |sum| |newBeta|))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |k| (+ |k| -1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (VECTOR |rank| |msum| (NREVERSE |newBeta|)))))) 

(SDEFUN |JDE;power|
        ((|lc| |List| D) (|mu| |List| (|NonNegativeInteger|))
         (|mask| |List| (|PositiveInteger|)) ($ D))
        (SPROG ((|k| (|PositiveInteger|)) (|res| (D)))
               (SEQ (LETT |res| (|spadConstant| $ 77)) (LETT |k| 1)
                    (SEQ G190 (COND ((NULL (NULL (NULL |mask|))) (GO G191)))
                         (SEQ
                          (SEQ G190
                               (COND
                                ((NULL (< |k| (|SPADfirst| |mask|)))
                                 (GO G191)))
                               (SEQ (LETT |mu| (CDR |mu|))
                                    (EXIT (LETT |k| (+ |k| 1))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |res|
                                (SPADCALL |res|
                                          (SPADCALL (|SPADfirst| |lc|)
                                                    (|SPADfirst| |mu|)
                                                    (QREFELT $ 157))
                                          (QREFELT $ 158)))
                          (LETT |lc| (CDR |lc|)) (LETT |mask| (CDR |mask|))
                          (LETT |mu| (CDR |mu|)) (EXIT (LETT |k| (+ |k| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |JDE;extPower|
        ((|llc| |Matrix| D) (|mu| |List| (|NonNegativeInteger|))
         (|nu| |List| (|NonNegativeInteger|)) ($ D))
        (SPROG
         ((|res| (D)) (|prod| (D)) (#1=#:G510 NIL) (|si| NIL) (#2=#:G511 NIL)
          (|mi| NIL) (#3=#:G509 NIL) (|s| NIL) (|q| (|NonNegativeInteger|))
          (|rmu| (|List| (|PositiveInteger|)))
          (|snu| (|List| (|List| (|PositiveInteger|)))))
         (SEQ (LETT |snu| (SPADCALL |nu| (QREFELT $ 160)))
              (LETT |rmu| (SPADCALL |mu| (QREFELT $ 162)))
              (LETT |q| (LENGTH (|SPADfirst| |snu|)))
              (LETT |res| (|spadConstant| $ 48))
              (SEQ (LETT |s| NIL) (LETT #3# |snu|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |prod| (|spadConstant| $ 77))
                        (SEQ (LETT |mi| NIL) (LETT #2# |rmu|) (LETT |si| NIL)
                             (LETT #1# |s|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |si| (CAR #1#)) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |mi| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |prod|
                                     (SPADCALL |prod|
                                               (QAREF2O |llc|
                                                        (+
                                                         (- (QREFELT $ 10)
                                                            |si|)
                                                         1)
                                                        |mi| 1 1)
                                               (QREFELT $ 158)))))
                             (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |prod| (QREFELT $ 163)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JDE;tableau;SemJdSem;25|
        ((|Symb| |SparseEchelonMatrix| JB D) (|chi| |JetDifferential| JB D)
         ($ |SparseEchelonMatrix| JB D))
        (SPROG
         ((|le| (|List| D)) (|li| (|List| JB)) (#1=#:G520 NIL) (#2=#:G535 NIL)
          (|i| NIL) (#3=#:G536 NIL) (|s| NIL)
          (|mu| (|List| (|NonNegativeInteger|))) (|a| #4=(|PositiveInteger|))
          (#5=#:G533 NIL) (|jv| NIL) (#6=#:G534 NIL) (|ent| NIL)
          (|sum| (|Vector| D))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (#7=#:G532 NIL) (|k| NIL) (|res| (|SparseEchelonMatrix| JB D))
          (#8=#:G514 NIL) (#9=#:G531 NIL) (|cinds| (|List| #4#))
          (#10=#:G530 NIL) (|d| NIL) (#11=#:G529 NIL) (|coeffs| (|List| D))
          (|diffs| (|List| JB)))
         (SEQ (LETT |diffs| (SPADCALL |chi| (QREFELT $ 165)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |diffs| (QREFELT $ 166))
                           (SPADCALL (QREFELT $ 10) (QREFELT $ 167))
                           (QREFELT $ 168))
                 (|error| "illegal differential in tableau"))
                ('T
                 (SEQ (LETT |coeffs| (SPADCALL |chi| (QREFELT $ 169)))
                      (LETT |cinds|
                            (PROGN
                             (LETT #11# NIL)
                             (SEQ (LETT |d| NIL) (LETT #10# |diffs|) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN (LETT |d| (CAR #10#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #11#
                                          (CONS (SPADCALL |d| (QREFELT $ 170))
                                                #11#))))
                                  (LETT #10# (CDR #10#)) (GO G190) G191
                                  (EXIT (NREVERSE #11#)))))
                      (LETT |res|
                            (SPADCALL
                             (PROGN
                              (LETT #9# NIL)
                              (SEQ (LETT |i| (QREFELT $ 12)) G190
                                   (COND ((< |i| 1) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #9#
                                           (CONS
                                            (SPADCALL
                                             (PROG1 (LETT #8# |i|)
                                               (|check_subtype2| (> #8# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #8#))
                                             (QREFELT $ 126))
                                            #9#))))
                                   (LETT |i| (+ |i| -1)) (GO G190) G191
                                   (EXIT (NREVERSE #9#))))
                             (SPADCALL |Symb| (QREFELT $ 69)) (QREFELT $ 78)))
                      (SEQ (LETT |k| 1)
                           (LETT #7# (SPADCALL |Symb| (QREFELT $ 69))) G190
                           (COND ((|greater_SI| |k| #7#) (GO G191)))
                           (SEQ (LETT |r| (SPADCALL |Symb| |k| (QREFELT $ 71)))
                                (LETT |sum|
                                      (MAKEARR1 (QREFELT $ 12)
                                                (|spadConstant| $ 48)))
                                (SEQ (LETT |ent| NIL) (LETT #6# (QCDR |r|))
                                     (LETT |jv| NIL) (LETT #5# (QCAR |r|)) G190
                                     (COND
                                      ((OR (ATOM #5#)
                                           (PROGN (LETT |jv| (CAR #5#)) NIL)
                                           (ATOM #6#)
                                           (PROGN (LETT |ent| (CAR #6#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |a|
                                            (SPADCALL |jv| (QREFELT $ 170)))
                                      (LETT |mu|
                                            (SPADCALL |jv| (QREFELT $ 171)))
                                      (EXIT
                                       (QSETAREF1O |sum| |a|
                                                   (SPADCALL
                                                    (QAREF1O |sum| |a| 1)
                                                    (SPADCALL |ent|
                                                              (|JDE;power|
                                                               |coeffs| |mu|
                                                               |cinds| $)
                                                              (QREFELT $ 158))
                                                    (QREFELT $ 163))
                                                   1)))
                                     (LETT #5#
                                           (PROG1 (CDR #5#)
                                             (LETT #6# (CDR #6#))))
                                     (GO G190) G191 (EXIT NIL))
                                (LETT |li| NIL) (LETT |le| NIL)
                                (SEQ (LETT |s| NIL)
                                     (LETT #3#
                                           (SPADCALL |sum| (QREFELT $ 173)))
                                     (LETT |i| 1) (LETT #2# (QREFELT $ 12))
                                     G190
                                     (COND
                                      ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                                           (PROGN (LETT |s| (CAR #3#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((NULL (SPADCALL |s| (QREFELT $ 174)))
                                         (SEQ
                                          (LETT |li|
                                                (CONS
                                                 (SPADCALL
                                                  (PROG1 (LETT #1# |i|)
                                                    (|check_subtype2| (> #1# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|NonNegativeInteger|)
                                                                      #1#))
                                                  (QREFELT $ 126))
                                                 |li|))
                                          (EXIT
                                           (LETT |le| (CONS |s| |le|))))))))
                                     (LETT |i|
                                           (PROG1 (|inc_SI| |i|)
                                             (LETT #3# (CDR #3#))))
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (SPADCALL |res| |k| |li| |le|
                                           (QREFELT $ 154))))
                           (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |JDE;tableau;SemLSem;26|
        ((|Symb| |SparseEchelonMatrix| JB D)
         (|lchi| |List| (|JetDifferential| JB D))
         ($ |SparseEchelonMatrix| JB D))
        (SPROG
         ((|rres|
           #1=(|Record| (|:| |Indices| (|List| JB))
                        (|:| |Entries| (|List| D))))
          (|s| (D)) (|mu| #2=(|List| (|NonNegativeInteger|))) (#3=#:G558 NIL)
          (|jv| NIL) (#4=#:G559 NIL) (|ent| NIL) (|r| #1#) (#5=#:G557 NIL)
          (|k| NIL) (|nu| #2#) (|a| (|PositiveInteger|)) (#6=#:G556 NIL)
          (|vv| NIL) (|res| (|SparseEchelonMatrix| JB D)) (#7=#:G540 NIL)
          (#8=#:G555 NIL) (|j| NIL) (|i| NIL) (#9=#:G554 NIL) (|chi| NIL)
          (|mco| (|Matrix| D)) (|inds| (|List| JB)) (#10=#:G538 NIL)
          (|q| (|NonNegativeInteger|)))
         (SEQ
          (LETT |q|
                (SPADCALL (|SPADfirst| (SPADCALL |Symb| (QREFELT $ 64)))
                          (QREFELT $ 72)))
          (LETT |inds|
                (SPADCALL |q|
                          (PROG1
                              (LETT #10#
                                    (+ (- (QREFELT $ 10) (LENGTH |lchi|)) 1))
                            (|check_subtype2| (> #10# 0) '(|PositiveInteger|)
                                              '(|Integer|) #10#))
                          (QREFELT $ 176)))
          (LETT |mco|
                (MAKE_MATRIX1 (LENGTH |lchi|) (QREFELT $ 10)
                              (|spadConstant| $ 48)))
          (SEQ (LETT |chi| NIL) (LETT #9# |lchi|) (LETT |i| 1) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |chi| (CAR #9#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #8# (QREFELT $ 10)) G190
                      (COND ((|greater_SI| |j| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |mco| |i| |j|
                                    (SPADCALL |chi|
                                              (SPADCALL
                                               (PROG1 (LETT #7# |j|)
                                                 (|check_subtype2| (> #7# 0)
                                                                   '(|PositiveInteger|)
                                                                   '(|NonNegativeInteger|)
                                                                   #7#))
                                               (QREFELT $ 167))
                                              (QREFELT $ 177))
                                    1 1)))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #9# (CDR #9#)))) (GO G190)
               G191 (EXIT NIL))
          (LETT |res|
                (SPADCALL |inds| (SPADCALL |Symb| (QREFELT $ 69))
                          (QREFELT $ 78)))
          (SEQ (LETT |vv| NIL) (LETT #6# (REVERSE |inds|)) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |vv| (CAR #6#)) NIL)) (GO G191)))
               (SEQ (LETT |a| (SPADCALL |vv| (QREFELT $ 170)))
                    (LETT |nu| (SPADCALL |vv| (QREFELT $ 171)))
                    (EXIT
                     (SEQ (LETT |k| 1)
                          (LETT #5# (SPADCALL |Symb| (QREFELT $ 69))) G190
                          (COND ((|greater_SI| |k| #5#) (GO G191)))
                          (SEQ (LETT |r| (SPADCALL |Symb| |k| (QREFELT $ 71)))
                               (LETT |s| (|spadConstant| $ 48))
                               (SEQ (LETT |ent| NIL) (LETT #4# (QCDR |r|))
                                    (LETT |jv| NIL) (LETT #3# (QCAR |r|)) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |jv| (CAR #3#)) NIL)
                                          (ATOM #4#)
                                          (PROGN (LETT |ent| (CAR #4#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((EQL (SPADCALL |jv| (QREFELT $ 170))
                                             |a|)
                                        (SEQ
                                         (LETT |mu|
                                               (SPADCALL |jv| (QREFELT $ 171)))
                                         (EXIT
                                          (LETT |s|
                                                (SPADCALL |s|
                                                          (SPADCALL |ent|
                                                                    (|JDE;extPower|
                                                                     |mco| |mu|
                                                                     |nu| $)
                                                                    (QREFELT $
                                                                             158))
                                                          (QREFELT $
                                                                   163)))))))))
                                    (LETT #3#
                                          (PROG1 (CDR #3#)
                                            (LETT #4# (CDR #4#))))
                                    (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (COND
                                 ((NULL (SPADCALL |s| (QREFELT $ 174)))
                                  (SEQ
                                   (LETT |rres|
                                         (SPADCALL |res| |k| (QREFELT $ 71)))
                                   (PROGN
                                    (RPLACA |rres| (CONS |vv| (QCAR |rres|)))
                                    (QCAR |rres|))
                                   (PROGN
                                    (RPLACD |rres| (CONS |s| (QCDR |rres|)))
                                    (QCDR |rres|))
                                   (EXIT
                                    (SPADCALL |res| |k| |rres|
                                              (QREFELT $ 83))))))))
                          (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                          (EXIT NIL))))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |JetDifferentialEquation;|)) 

(DEFUN |JetDifferentialEquation| (&REST #1=#:G560)
  (SPROG NIL
         (PROG (#2=#:G561)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetDifferentialEquation|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetDifferentialEquation;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetDifferentialEquation|)))))))))) 

(DEFUN |JetDifferentialEquation;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|JetDifferentialEquation| DV$1 DV$2))
          (LETT $ (GETREFV 180))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
                              (|:| |Simp?| (|Boolean|))
                              (|:| |Dim?| (|Boolean|))
                              (|:| |Dim| (|NonNegativeInteger|))))
          (QSETREFV $ 30
                    (|Record| (|:| |Sys| (|List| (QREFELT $ 29)))
                              (|:| |Order| (|List| (|NonNegativeInteger|)))))
          $))) 

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
              (90 . =) (96 . |coerce|) (|String|) (101 . |message|) (|List| $)
              (106 . |vconcat|) |JDE;printSys;LOf;7| |JDE;coerce;$Of;8|
              (111 . |coerce|) (116 . |hconcat|) (|Void|) (122 . |print|)
              (127 . |coerce|) (|List| 6) (132 . |allIndices|) (137 . |coerce|)
              (142 . |coerce|) (147 . |void|) |JDE;display;$V;9|
              (151 . |nrows|) (|Record| (|:| |Indices| 63) (|:| |Entries| 31))
              (156 . |row|) (162 . |order|) (167 . |removeDuplicates|)
              (172 . |sort|) (177 . >) (183 . |One|) (187 . |One|)
              (191 . |new|) (|Vector| 33) (197 . |construct|)
              (202 . |position|) (208 . |minIndex|) (213 . |setRow!|)
              (220 . |consRow!|) (|Vector| 31) (226 . |minIndex|) (231 . |new|)
              (237 . |numerator|) (|SparseEchelonMatrix| 6 $)
              (242 . |jacobiMatrix|) |JDE;makeSystem;L$;11| (|List| 29)
              (247 . |concat!|) (253 . |concat!|) (259 . |concat!|)
              (265 . |join|) (271 . |concat!|) |JDE;join;3$;12|
              |JDE;insert;L2$;13| (277 . |dimJ|) (282 . |copy|) (287 . |dimS|)
              (292 . |orderDim|) |JDE;dimension;$2Nni;14| (299 . |order|)
              (|Union| '"failed" (|List| 16))
              (|Record| (|:| |Sys| 54) (|:| JM 89) (|:| |Depend| 106))
              (304 . |simpMod|) (311 . |simplify|) (317 . |minIndex|)
              (322 . |delete|) (328 . |delete|) (334 . |delete|)
              (340 . |extract|) (|Mapping| 20 6) (347 . |sortedPurge!|)
              (353 . |deleteRow!|) (359 . |qelt|) (365 . |concat!|)
              (371 . |appendRow!|) (377 . |concat!|) (383 . |concat!|)
              (389 . |qsetelt!|) (396 . |concat!|) (402 . |insert!|) (409 . U)
              (414 . |member?|) (|Record| (|:| |SDe| $) (|:| IC 31))
              |JDE;simplify;$R;15| |JDE;project;$Nni$;16|
              (|Record| (|:| |DPhi| $) (|:| |JVars| 63)) (420 . |formalDiff2|)
              (|List| 63) (427 . |jacobiMatrix|) (433 . |append|)
              (439 . |append|) |JDE;prolong;$R;17| |JDE;prolong;$NniR;18|
              (445 . |extractSymbol|)
              (|Record| (|:| |Ech| $) (|:| |Lt| (|Matrix| 7)) (|:| |Pivots| 31)
                        (|:| |Rank| 14))
              (450 . |rowEchelon|) |JDE;extractSymbol;$BSem;19|
              (455 . |pivots|) (460 . |class|)
              (|Record| (|:| |Rank| 14) (|:| |NumMultVar| 14) (|:| |Betas| 16))
              |JDE;analyseSymbol;SemR;20| (|Union| $ '"0")
              (465 . |differentiate|) (471 . <) (477 . |removeDuplicates!|)
              (|Mapping| 20 6 6) (482 . |sort!|) (488 . *) (494 . |setRow!|)
              |JDE;prolongSymbol;2Sem;21| |JDE;prolongMV;2R;22| (502 . ^)
              (508 . *) (|List| 161) (514 . |allRepeated|) (|List| 8)
              (519 . |m2r|) (524 . +) (|JetDifferential| 6 7)
              (530 . |differentials|) (535 . |last|) (540 . X) (545 . >)
              (551 . |coefficients|) (556 . |index|) (561 . |multiIndex|)
              (|Vector| 7) (566 . |entries|) (571 . |zero?|)
              |JDE;tableau;SemJdSem;25| (576 . |variables|)
              (582 . |coefficient|) (|List| 164) |JDE;tableau;SemLSem;26|)
           '#(|tableau| 588 |simplify| 600 |setSimpMode| 605 |retract| 610
              |prolongSymbol| 615 |prolongMV| 620 |prolong| 625 |project| 636
              |printSys| 642 |order| 647 |makeSystem| 652 |join| 657
              |jacobiMatrix| 663 |insert| 668 |extractSymbol| 674 |display| 680
              |dimension| 685 |copy| 691 |coerce| 696 |analyseSymbol| 701)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|order| ((|NonNegativeInteger|) $$)) T)
                                   '((|coerce| ((|OutputForm|) $$)) T)
                                   '((|printSys|
                                      ((|OutputForm|) (|List| |#2|)))
                                     T)
                                   '((|display| ((|Void|) $$)) T)
                                   '((|copy| ($$ $$)) T)
                                   '((|retract| ((|List| |#2|) $$)) T)
                                   '((|jacobiMatrix|
                                      ((|List|
                                        (|SparseEchelonMatrix| |#1| |#2|))
                                       $$))
                                     T)
                                   '((|makeSystem| ($$ (|List| |#2|))) T)
                                   '((|join| ($$ $$ $$)) T)
                                   '((|insert| ($$ (|List| |#2|) $$)) T)
                                   '((|dimension|
                                      ((|NonNegativeInteger|) $$
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|setSimpMode|
                                      ((|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|simplify|
                                      ((|Record| (|:| |SDe| $$)
                                                 (|:| IC (|List| |#2|)))
                                       $$))
                                     T)
                                   '((|extractSymbol|
                                      ((|SparseEchelonMatrix| |#1| |#2|) $$
                                       (|Boolean|)))
                                     T)
                                   '((|analyseSymbol|
                                      ((|Record|
                                        (|:| |Rank| (|NonNegativeInteger|))
                                        (|:| |NumMultVar|
                                             (|NonNegativeInteger|))
                                        (|:| |Betas|
                                             (|List| (|NonNegativeInteger|))))
                                       (|SparseEchelonMatrix| |#1| |#2|)))
                                     T)
                                   '((|prolongSymbol|
                                      ((|SparseEchelonMatrix| |#1| |#2|)
                                       (|SparseEchelonMatrix| |#1| |#2|)))
                                     T)
                                   '((|prolongMV|
                                      ((|Record|
                                        (|:| |Rank| (|NonNegativeInteger|))
                                        (|:| |NumMultVar|
                                             (|NonNegativeInteger|))
                                        (|:| |Betas|
                                             (|List| (|NonNegativeInteger|))))
                                       (|Record|
                                        (|:| |Rank| (|NonNegativeInteger|))
                                        (|:| |NumMultVar|
                                             (|NonNegativeInteger|))
                                        (|:| |Betas|
                                             (|List|
                                              (|NonNegativeInteger|))))))
                                     T)
                                   '((|project| ($$ $$ (|NonNegativeInteger|)))
                                     T)
                                   '((|prolong|
                                      ((|Record| (|:| |SDe| $$)
                                                 (|:| IC (|List| |#2|)))
                                       $$))
                                     T)
                                   '((|prolong|
                                      ((|Record| (|:| |SDe| $$)
                                                 (|:| IC (|List| |#2|)))
                                       $$ (|NonNegativeInteger|)))
                                     T)
                                   '((|tableau|
                                      ((|SparseEchelonMatrix| |#1| |#2|)
                                       (|SparseEchelonMatrix| |#1| |#2|)
                                       (|JetDifferential| |#1| |#2|)))
                                     T)
                                   '((|tableau|
                                      ((|SparseEchelonMatrix| |#1| |#2|)
                                       (|SparseEchelonMatrix| |#1| |#2|)
                                       (|List| (|JetDifferential| |#1| |#2|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 179
                                            '(0 6 8 9 0 6 8 11 1 16 14 0 17 2
                                              16 14 0 18 19 2 21 20 0 18 22 2
                                              14 0 0 0 23 2 16 14 24 0 25 2 20
                                              0 0 0 26 2 21 20 27 0 28 1 31 0 0
                                              32 1 33 0 0 34 1 16 0 0 35 1 21 0
                                              0 36 2 31 0 0 0 39 3 41 31 40 0
                                              31 42 0 46 0 47 0 7 0 48 2 49 0 7
                                              7 50 1 49 46 0 51 1 46 0 52 53 1
                                              46 0 54 55 1 14 46 0 58 2 46 0 0
                                              0 59 1 46 60 0 61 1 33 46 0 62 1
                                              33 63 0 64 1 63 46 0 65 1 16 46 0
                                              66 0 60 0 67 1 33 14 0 69 2 33 70
                                              0 18 71 1 6 14 0 72 1 16 0 0 73 1
                                              16 0 0 74 2 14 20 0 0 75 0 6 0 76
                                              0 7 0 77 2 33 0 63 18 78 1 79 0
                                              44 80 2 16 18 14 0 81 1 16 18 0
                                              82 3 33 60 0 18 70 83 2 33 60 0
                                              70 84 1 85 18 0 86 2 21 0 14 20
                                              87 1 7 0 0 88 1 7 89 54 90 2 92 0
                                              0 0 93 2 16 0 0 0 94 2 31 0 0 0
                                              95 2 33 0 0 0 96 2 21 0 0 0 97 1
                                              6 14 14 100 1 92 0 0 101 1 6 14
                                              14 102 3 7 14 54 89 14 103 1 7 14
                                              0 105 3 7 107 54 89 54 108 2 7
                                              107 54 89 109 1 31 18 0 110 2 31
                                              0 0 18 111 2 16 0 0 18 112 2 21 0
                                              0 18 113 3 33 0 0 18 18 114 2 33
                                              60 0 115 116 2 33 60 0 18 117 2
                                              92 29 0 18 118 2 31 0 0 7 119 2
                                              33 60 0 70 120 2 16 0 0 14 121 2
                                              21 0 0 20 122 3 92 29 0 18 29 123
                                              2 92 0 0 29 124 3 92 0 29 0 18
                                              125 1 6 0 8 126 2 63 20 6 0 127 3
                                              7 131 0 8 89 132 2 7 89 54 133
                                              134 2 16 0 0 0 135 2 21 0 0 0 136
                                              1 7 89 89 139 1 33 140 0 141 1 33
                                              70 0 143 1 6 14 0 144 2 6 147 0 8
                                              148 2 6 20 0 0 149 1 63 0 0 150 2
                                              63 0 151 0 152 2 14 0 8 0 153 4
                                              33 60 0 18 63 31 154 2 7 0 0 14
                                              157 2 7 0 0 0 158 1 6 159 16 160
                                              1 6 161 16 162 2 7 0 0 0 163 1
                                              164 63 0 165 1 63 6 0 166 1 6 0 8
                                              167 2 6 20 0 0 168 1 164 31 0 169
                                              1 6 8 0 170 1 6 16 0 171 1 172 31
                                              0 173 1 7 20 0 174 2 6 54 14 8
                                              176 2 164 7 0 6 177 2 0 33 33 178
                                              179 2 0 33 33 164 175 1 0 128 0
                                              129 1 0 14 14 15 1 0 31 0 43 1 0
                                              33 33 155 1 0 145 145 156 1 0 128
                                              0 137 2 0 128 0 14 138 2 0 0 0 14
                                              130 1 0 46 31 56 1 0 14 0 38 1 0
                                              0 31 91 2 0 0 0 0 98 1 0 44 0 45
                                              2 0 0 31 0 99 2 0 33 0 20 142 1 0
                                              60 0 68 2 0 14 0 14 104 1 0 0 0
                                              37 1 0 46 0 57 1 0 145 33
                                              146)))))
           '|lookupComplete|)) 
