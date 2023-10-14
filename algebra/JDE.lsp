
(SDEFUN |JDE;setSimpMode;2Nni;1|
        ((|i| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|j| (|NonNegativeInteger|)))
               (SEQ (LETT |j| (QREFELT $ 13) |JDE;setSimpMode;2Nni;1|)
                    (SETELT $ 13 |i|) (EXIT |j|)))) 

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
                                  (SPADCALL |der| (|SPADfirst| |d|)
                                            (QREFELT $ 19))
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
                                                        (LETT |i| (CAR #3#)
                                                              . #10#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #4#
                                                         (CONS
                                                          (SPADCALL |der| |i|
                                                                    (QREFELT $
                                                                             19))
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
                                                        (LETT |i| (CAR #1#)
                                                              . #10#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #2#
                                                         (CONS
                                                          (SPADCALL |pro?| |i|
                                                                    (QREFELT $
                                                                             22))
                                                          #2#)
                                                         . #10#)))
                                                 (LETT #1# (CDR #1#) . #10#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #2#))))
                                           (QREFELT $ 28))
                                 . #10#)
                           (LETT |resDer| (CONS |j| |resDer|) . #10#)
                           (EXIT
                            (LETT |resPro?| (CONS |b| |resPro?|) . #10#)))))))
                      (LETT #5# (CDR #5#) . #10#) (GO G190) G191 (EXIT NIL))
                 (EXIT (CONS (NREVERSE |resDer|) (NREVERSE |resPro?|))))))))) 

(SDEFUN |JDE;copy;2$;3| ((|De| $) ($ $))
        (SPROG
         ((|newOrd| (|List| (|NonNegativeInteger|)))
          (|newSys| (|List| |SysRec|)) (#1=#:G177 NIL) (|sys| NIL)
          (#2=#:G176 NIL))
         (SEQ
          (LETT |newSys|
                (PROGN
                 (LETT #2# NIL . #3=(|JDE;copy;2$;3|))
                 (SEQ (LETT |sys| NIL . #3#) (LETT #1# (QCAR |De|) . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |sys| (CAR #1#) . #3#) NIL))
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
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |newOrd| (SPADCALL (QCDR |De|) (QREFELT $ 35)) . #3#)
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
                 (LETT #2# NIL . #3=(|JDE;retract;$L;5|))
                 (SEQ (LETT |sys| NIL . #3#) (LETT #1# (QCAR |De|) . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |sys| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |sys| 0) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL (ELT $ 39) |LSys| NIL (QREFELT $ 42)))))) 

(SDEFUN |JDE;jacobiMatrix;$L;6|
        ((|De| $) ($ |List| (|SparseEchelonMatrix| JB D)))
        (SPROG ((#1=#:G190 NIL) (|sys| NIL) (#2=#:G189 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|JDE;jacobiMatrix;$L;6|))
                 (SEQ (LETT |sys| NIL . #3#) (LETT #1# (QCAR |De|) . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |sys| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |sys| 1) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
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
                        ((OR (ATOM #1#)
                             (PROGN (LETT |eq| (CAR #1#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |tmp|
                               (CONS (SPADCALL |eq| (QREFELT $ 51))
                                     (CONS " " |tmp|))
                               . #4#)))
                       (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL (REVERSE |tmp|) (QREFELT $ 53))))))))) 

(SDEFUN |JDE;coerce;$Of;8| ((|De| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |De| (QREFELT $ 43)) (QREFELT $ 54))) 

(SDEFUN |JDE;display;$V;9| ((|De| $) ($ |Void|))
        (SPROG ((#1=#:G206 NIL) (|sys| NIL) (#2=#:G207 NIL) (|ord| NIL))
               (SEQ
                (SEQ (LETT |ord| NIL . #3=(|JDE;display;$V;9|))
                     (LETT #2# (QCDR |De|) . #3#) (LETT |sys| NIL . #3#)
                     (LETT #1# (QCAR |De|) . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |sys| (CAR #1#) . #3#) NIL)
                           (ATOM #2#) (PROGN (LETT |ord| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (SPADCALL
                       (SPADCALL "Order: " (SPADCALL |ord| (QREFELT $ 56))
                                 (QREFELT $ 57))
                       (QREFELT $ 59))
                      (SPADCALL "  System:" (QREFELT $ 59))
                      (SPADCALL
                       (SPADCALL "    "
                                 (SPADCALL (QVELT |sys| 0) (QREFELT $ 54))
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
                       (SPADCALL "    "
                                 (SPADCALL (QVELT |sys| 1) (QREFELT $ 60))
                                 (QREFELT $ 57))
                       (QREFELT $ 59))
                      (SPADCALL
                       (SPADCALL "    "
                                 (SPADCALL
                                  (SPADCALL (QVELT |sys| 1) (QREFELT $ 62))
                                  (QREFELT $ 63))
                                 (QREFELT $ 57))
                       (QREFELT $ 59))
                      (SPADCALL "  Last derivations:" (QREFELT $ 59))
                      (EXIT
                       (SPADCALL
                        (SPADCALL "    "
                                  (SPADCALL (QVELT |sys| 2) (QREFELT $ 64))
                                  (QREFELT $ 57))
                        (QREFELT $ 59))))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                           . #3#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL (QREFELT $ 65)))))) 

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
          (LETT |inds| (SPADCALL |jm| (QREFELT $ 62)) . #8#)
          (LETT |ljm| NIL . #8#)
          (SEQ (LETT |q| NIL . #8#) (LETT #5# |resOrd| . #8#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL
                         (SPADCALL (|SPADfirst| |inds|) (QREFELT $ 70)) |q|
                         (QREFELT $ 73)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |inds| (CDR |inds|) . #8#))) NIL
                     (GO G190) G191 (EXIT NIL))
                (EXIT
                 (LETT |ljm| (CONS (SPADCALL |inds| 1 (QREFELT $ 76)) |ljm|)
                       . #8#)))
               (LETT #5# (CDR #5#) . #8#) (GO G190) G191 (EXIT NIL))
          (LETT |vsys| (MAKEARR1 |nord| NIL) . #8#)
          (LETT |vder| (MAKEARR1 |nord| NIL) . #8#)
          (LETT |vjm| (SPADCALL (NREVERSE |ljm|) (QREFELT $ 78)) . #8#)
          (SEQ (LETT |j| (SPADCALL |jm| (QREFELT $ 67)) . #8#)
               (LETT |q| NIL . #8#) (LETT #4# (REVERSE |lord|) . #8#)
               (LETT |i| NIL . #8#) (LETT #3# (REVERSE |der|) . #8#)
               (LETT |eq| NIL . #8#) (LETT #2# (REVERSE |sys|) . #8#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#) . #8#) NIL)
                     (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #8#) NIL)
                     (ATOM #4#) (PROGN (LETT |q| (CAR #4#) . #8#) NIL)
                     (< |j| 1))
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
                    (QSETAREF1O |vsys| |pos|
                                (CONS |eq| (QAREF1O |vsys| |pos| 1)) 1)
                    (SPADCALL (QAREF1O |vjm| |pos| 1)
                              (SPADCALL |jm| |j| (QREFELT $ 69))
                              (QREFELT $ 82))
                    (EXIT
                     (QSETAREF1O |vder| |pos|
                                 (CONS |i| (QAREF1O |vder| |pos| 1)) 1)))))))
               (LETT #2#
                     (PROG1 (CDR #2#)
                       (LETT #3#
                             (PROG1 (CDR #3#)
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT |j| (+ |j| -1) . #8#))
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
                         (LETT #4# NIL . #5=(|JDE;makeSystem;L$;11|))
                         (SEQ (LETT |eq| NIL . #5#) (LETT #3# |sys| . #5#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |eq| (CAR #3#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS (SPADCALL |eq| (QREFELT $ 86)) #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (LETT |der|
                        (PROGN
                         (LETT #2# NIL . #5#)
                         (SEQ (LETT |eq| NIL . #5#) (LETT #1# |nsys| . #5#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |eq| (CAR #1#) . #5#) NIL))
                                (GO G191)))
                              (SEQ (EXIT (LETT #2# (CONS 1 #2#) . #5#)))
                              (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #5#)
                  (LETT |jm| (SPADCALL |nsys| (QREFELT $ 88)) . #5#)
                  (EXIT (|JDE;makeSystem2| |nsys| |jm| |der| $)))))))) 

(SDEFUN |JDE;join;3$;12| ((|De1| $) (|De2| $) ($ $))
        (SPROG
         ((|ord2| #1=(|List| (|NonNegativeInteger|))) (|ord1| #1#)
          (|sys2| #2=(|List| |SysRec|)) (|sys1| #2#)
          (|resOrd| (|List| (|NonNegativeInteger|)))
          (|resSys| (|List| |SysRec|)) (|rec| (|SysRec|)) (|rec2| (|SysRec|))
          (|rec1| (|SysRec|)) (|o2| #3=(|NonNegativeInteger|)) (|o1| #3#)
          (|cDe2| ($)) (|cDe1| ($)))
         (SEQ
          (LETT |cDe1| (SPADCALL |De1| (QREFELT $ 37)) . #4=(|JDE;join;3$;12|))
          (LETT |cDe2| (SPADCALL |De2| (QREFELT $ 37)) . #4#)
          (LETT |sys1| (QCAR |cDe1|) . #4#) (LETT |sys2| (QCAR |cDe2|) . #4#)
          (LETT |ord1| (QCDR |cDe1|) . #4#) (LETT |ord2| (QCDR |cDe2|) . #4#)
          (LETT |resSys| NIL . #4#) (LETT |resOrd| NIL . #4#)
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
                          . #4#)
                    (LETT |resOrd|
                          (SPADCALL (NREVERSE |ord2|) |resOrd| (QREFELT $ 92))
                          . #4#)
                    (EXIT (LETT |ord2| NIL . #4#))))
                  ((NULL |ord2|)
                   (SEQ
                    (LETT |resSys|
                          (SPADCALL (NREVERSE |sys1|) |resSys| (QREFELT $ 91))
                          . #4#)
                    (LETT |resOrd|
                          (SPADCALL (NREVERSE |ord1|) |resOrd| (QREFELT $ 92))
                          . #4#)
                    (EXIT (LETT |ord1| NIL . #4#))))
                  ('T
                   (SEQ (LETT |o1| (|SPADfirst| |ord1|) . #4#)
                        (LETT |o2| (|SPADfirst| |ord2|) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |o1| |o2| (QREFELT $ 73))
                           (SEQ
                            (LETT |resSys| (CONS (|SPADfirst| |sys1|) |resSys|)
                                  . #4#)
                            (LETT |resOrd| (CONS |o1| |resOrd|) . #4#)
                            (LETT |sys1| (CDR |sys1|) . #4#)
                            (EXIT (LETT |ord1| (CDR |ord1|) . #4#))))
                          ((SPADCALL |o2| |o1| (QREFELT $ 73))
                           (SEQ
                            (LETT |resSys| (CONS (|SPADfirst| |sys2|) |resSys|)
                                  . #4#)
                            (LETT |resOrd| (CONS |o2| |resOrd|) . #4#)
                            (LETT |sys2| (CDR |sys2|) . #4#)
                            (EXIT (LETT |ord2| (CDR |ord2|) . #4#))))
                          ('T
                           (SEQ (LETT |rec1| (|SPADfirst| |sys1|) . #4#)
                                (LETT |rec2| (|SPADfirst| |sys2|) . #4#)
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
                                      . #4#)
                                (LETT |resSys| (CONS |rec| |resSys|) . #4#)
                                (LETT |resOrd| (CONS |o1| |resOrd|) . #4#)
                                (LETT |sys1| (CDR |sys1|) . #4#)
                                (LETT |sys2| (CDR |sys2|) . #4#)
                                (LETT |ord1| (CDR |ord1|) . #4#)
                                (EXIT
                                 (LETT |ord2| (CDR |ord2|) . #4#)))))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (NREVERSE |resSys|) (NREVERSE |resOrd|)))))) 

(SDEFUN |JDE;insert;L2$;13| ((|sys| |List| D) (|De| $) ($ $))
        (SPROG ((|newDe| ($)))
               (SEQ
                (LETT |newDe| (SPADCALL |sys| (QREFELT $ 89))
                      |JDE;insert;L2$;13|)
                (EXIT (SPADCALL |De| |newDe| (QREFELT $ 96)))))) 

(SDEFUN |JDE;dimension;$2Nni;14|
        ((|De| $) (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (#1=#:G264 NIL)
          (|resSys| (|List| |SysRec|)) (|d| (|NonNegativeInteger|))
          (|simp?| (|Boolean|)) (|qq| (|Integer|)) (|j| NIL) (#2=#:G268 NIL)
          (|sys| NIL) (#3=#:G269 NIL) (|ord| NIL)
          (|tord| (|List| (|NonNegativeInteger|))) (|tsys| (|List| |SysRec|)))
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
                              (SPADCALL (|SPADfirst| |tord|) |q|
                                        (QREFELT $ 73)))
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
                                         (+ |res|
                                            (SPADCALL |j| (QREFELT $ 100)))
                                         . #4#)))
                                 (LETT |j| (+ |j| 1) . #4#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |qq| (- |ord| 1) . #4#)
                            (LETT |simp?|
                                  (COND (|simp?| (QVELT |sys| 4)) ('T 'NIL))
                                  . #4#)
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
                           (LETT #2#
                                 (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
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
                                                     '(|NonNegativeInteger|)
                                                     #1#))
                                  (QREFELT $ 98)))
                              . #4#)))
                      (PROGN (RPLACA |De| (NREVERSE |resSys|)) (QCAR |De|))
                      (EXIT |res|))))))) 

(SDEFUN |JDE;simplify;$R;15|
        ((|De| $) ($ |Record| (|:| |SDe| $) (|:| IC (|List| D))))
        (SPROG
         ((|u?| (|Boolean|)) (#1=#:G321 NIL) (#2=#:G334 NIL)
          (|j| (|NonNegativeInteger|)) (#3=#:G335 NIL) (|lj| (|List| JB))
          (#4=#:G333 NIL) (|eq| NIL) (|i| NIL)
          (|jm0| (|SparseEchelonMatrix| JB D))
          (|tord| (|List| (|NonNegativeInteger|))) (|tsys| (|List| |SysRec|))
          (|resOrd| #5=(|List| (|NonNegativeInteger|)))
          (|resSys| (|List| |SysRec|)) (|rec| (|SysRec|)) (|pos| (|Integer|))
          (|hord| #5#) (|djm| (|SparseEchelonMatrix| JB D))
          (|newPro?| (|List| (|Boolean|)))
          (|newDer| (|List| (|NonNegativeInteger|))) (|newEqs| #6=(|List| D))
          (|pos2| #7=(|Integer|)) (|pos1| #7#) (|ICs| #8=(|List| D))
          (|o| (|NonNegativeInteger|)) (#9=#:G331 NIL) (#10=#:G332 NIL)
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
         (SEQ (LETT |resSys| NIL . #12=(|JDE;simplify;$R;15|))
              (LETT |resOrd| NIL . #12#) (LETT |ICs| NIL . #12#)
              (LETT |cDe| (SPADCALL |De| (QREFELT $ 37)) . #12#)
              (LETT |tsys| (QCAR |cDe|) . #12#)
              (LETT |tord| (QCDR |cDe|) . #12#) (LETT |AllEqs| NIL . #12#)
              (COND
               ((SPADCALL (QREFELT $ 13) 0 (QREFELT $ 73))
                (LETT |AllEqs| (SPADCALL |cDe| (QREFELT $ 43)) . #12#)))
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |tord|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ (LETT |q| (|SPADfirst| |tord|) . #12#)
                        (LETT |sys| (|SPADfirst| |tsys|) . #12#)
                        (COND
                         ((QVELT |sys| 4)
                          (SEQ (LETT |resSys| (CONS |sys| |resSys|) . #12#)
                               (EXIT
                                (LETT |resOrd| (CONS |q| |resOrd|) . #12#))))
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
                                  (SEQ
                                   (EXIT
                                    (LETT |AllEqs| (CDR |AllEqs|) . #12#)))
                                  NIL (GO G190) G191 (EXIT NIL))))
                           (COND
                            ((SPADCALL (QREFELT $ 13) 0 (QREFELT $ 73))
                             (SEQ
                              (LETT |tmp|
                                    (SPADCALL (QVELT |sys| 0) (QVELT |sys| 1)
                                              |AllEqs| (QREFELT $ 106))
                                    . #12#)
                              (EXIT
                               (LETT |tmp|
                                     (SPADCALL (QVELT |tmp| 0) (QVELT |tmp| 1)
                                               (QREFELT $ 107))
                                     . #12#))))
                            ('T
                             (LETT |tmp|
                                   (SPADCALL (QVELT |sys| 0) (QVELT |sys| 1)
                                             (QREFELT $ 107))
                                   . #12#)))
                           (LETT |newEqs| (QVELT |tmp| 0) . #12#)
                           (LETT |newJM| (QVELT |tmp| 1) . #12#)
                           (LETT |ad|
                                 (|JDE;adapt| (QVELT |sys| 2) (QVELT |sys| 3)
                                  (QVELT |tmp| 2) $)
                                 . #12#)
                           (LETT |newDer| (QCAR |ad|) . #12#)
                           (LETT |newPro?| (QCDR |ad|) . #12#)
                           (LETT |j| 0 . #12#)
                           (SEQ (LETT |i| 1 . #12#) (LETT |pro?| NIL . #12#)
                                (LETT #10# |newPro?| . #12#)
                                (LETT |eq| NIL . #12#)
                                (LETT #9# |newEqs| . #12#) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |eq| (CAR #9#) . #12#) NIL)
                                      (ATOM #10#)
                                      (PROGN
                                       (LETT |pro?| (CAR #10#) . #12#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |o|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (QCAR
                                          (SPADCALL |newJM| (- |i| |j|)
                                                    (QREFELT $ 69))))
                                        (QREFELT $ 70))
                                       . #12#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |o| |q| (QREFELT $ 73))
                                    (|error| "order raised in simplify"))
                                   ((< |o| |q|)
                                    (SEQ (LETT |ICs| (CONS |eq| |ICs|) . #12#)
                                         (LETT |j| (+ |j| 1) . #12#)
                                         (LETT |pos1| (+ (- |i| |j|) 1) . #12#)
                                         (LETT |pos2|
                                               (+ (- |i| |j|)
                                                  (SPADCALL |newEqs|
                                                            (QREFELT $ 108)))
                                               . #12#)
                                         (LETT |newEqs|
                                               (SPADCALL |newEqs| |pos2|
                                                         (QREFELT $ 109))
                                               . #12#)
                                         (LETT |newDer|
                                               (SPADCALL |newDer| |pos2|
                                                         (QREFELT $ 110))
                                               . #12#)
                                         (LETT |newPro?|
                                               (SPADCALL |newPro?| |pos2|
                                                         (QREFELT $ 111))
                                               . #12#)
                                         (LETT |djm|
                                               (SPADCALL |newJM| |pos1| |pos1|
                                                         (QREFELT $ 112))
                                               . #12#)
                                         (SPADCALL |djm|
                                                   (CONS
                                                    #'|JDE;simplify;$R;15!0|
                                                    (VECTOR |o| $))
                                                   (QREFELT $ 114))
                                         (SPADCALL |newJM| |pos1|
                                                   (QREFELT $ 115))
                                         (LETT |pos|
                                               (SPADCALL |o| |tord|
                                                         (QREFELT $ 79))
                                               . #12#)
                                         (EXIT
                                          (COND
                                           ((>= |pos|
                                                (SPADCALL |tord|
                                                          (QREFELT $ 80)))
                                            (SEQ
                                             (LETT |rec|
                                                   (SPADCALL |tsys| |pos|
                                                             (QREFELT $ 116))
                                                   . #12#)
                                             (SPADCALL (QVELT |rec| 0) |eq|
                                                       (QREFELT $ 117))
                                             (SPADCALL (QVELT |rec| 1)
                                                       (SPADCALL |djm| 1
                                                                 (QREFELT $
                                                                          69))
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
                                                           (LIST 1)
                                                           (LIST |pro?|) 'NIL
                                                           'NIL 0)
                                                   . #12#)
                                             (LETT |hord| NIL . #12#)
                                             (LETT |pos|
                                                   (-
                                                    (SPADCALL |tord|
                                                              (QREFELT $ 80))
                                                    1)
                                                   . #12#)
                                             (SEQ G190
                                                  (COND
                                                   ((NULL
                                                     (COND ((NULL |tord|) 'NIL)
                                                           ('T
                                                            (SPADCALL
                                                             (|SPADfirst|
                                                              |tord|)
                                                             |o|
                                                             (QREFELT $ 73)))))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |hord|
                                                         (CONS
                                                          (|SPADfirst| |tord|)
                                                          |hord|)
                                                         . #12#)
                                                   (LETT |tord| (CDR |tord|)
                                                         . #12#)
                                                   (EXIT
                                                    (LETT |pos| (+ |pos| 1)
                                                          . #12#)))
                                                  NIL (GO G190) G191
                                                  (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL |tord|)
                                                (SEQ
                                                 (LETT |tord|
                                                       (NREVERSE
                                                        (CONS |o| |hord|))
                                                       . #12#)
                                                 (EXIT
                                                  (SPADCALL |tsys| |rec|
                                                            (QREFELT $ 122)))))
                                               ('T
                                                (SEQ
                                                 (LETT |tord|
                                                       (SPADCALL
                                                        (NREVERSE |hord|)
                                                        (CONS |o| |tord|)
                                                        (QREFELT $ 92))
                                                       . #12#)
                                                 (EXIT
                                                  (LETT |tsys|
                                                        (SPADCALL |rec| |tsys|
                                                                  |pos|
                                                                  (QREFELT $
                                                                           123))
                                                        . #12#)))))))))))))))
                                (LETT #9#
                                      (PROG1 (CDR #9#)
                                        (LETT #10#
                                              (PROG1 (CDR #10#)
                                                (LETT |i| (|inc_SI| |i|)
                                                      . #12#))
                                              . #12#))
                                      . #12#)
                                (GO G190) G191 (EXIT NIL))
                           (LETT |rec|
                                 (VECTOR |newEqs| |newJM| |newDer| |newPro?| 'T
                                         'NIL 0)
                                 . #12#)
                           (LETT |resSys| (CONS |rec| |resSys|) . #12#)
                           (EXIT (LETT |resOrd| (CONS |q| |resOrd|) . #12#)))))
                        (LETT |tsys| (CDR |tsys|) . #12#)
                        (EXIT (LETT |tord| (CDR |tord|) . #12#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((ZEROP |q|)
                (SEQ (LETT |jm0| (QVELT (|SPADfirst| |resSys|) 1) . #12#)
                     (EXIT
                      (SEQ (LETT |i| 1 . #12#) (LETT |eq| NIL . #12#)
                           (LETT #4# (QVELT (|SPADfirst| |resSys|) 0) . #12#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |eq| (CAR #4#) . #12#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |lj|
                                  (QCAR (SPADCALL |jm0| |i| (QREFELT $ 69)))
                                  . #12#)
                            (EXIT
                             (COND
                              ((NULL |lj|) (|error| "inconsistent system"))
                              ('T
                               (SEQ (LETT |u?| 'NIL . #12#)
                                    (SEQ (LETT #3# NIL . #12#)
                                         (LETT |j| 1 . #12#)
                                         (LETT #2# (QREFELT $ 12) . #12#) G190
                                         (COND
                                          ((OR (|greater_SI| |j| #2#) #3#)
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |u?|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (PROG1 (LETT #1# |j| . #12#)
                                                     (|check_subtype| (> #1# 0)
                                                                      '(|PositiveInteger|)
                                                                      #1#))
                                                   (QREFELT $ 124))
                                                  |lj| (QREFELT $ 125))
                                                 . #12#)))
                                         (LETT |j|
                                               (PROG1 (|inc_SI| |j|)
                                                 (LETT #3# |u?| . #12#))
                                               . #12#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((NULL |u?|)
                                       (|error|
                                        "independent variables not independent")))))))))
                           (LETT #4#
                                 (PROG1 (CDR #4#)
                                   (LETT |i| (|inc_SI| |i|) . #12#))
                                 . #12#)
                           (GO G190) G191 (EXIT NIL))))))
              (EXIT
               (CONS (CONS (NREVERSE |resSys|) (NREVERSE |resOrd|))
                     (NREVERSE |ICs|)))))) 

(SDEFUN |JDE;simplify;$R;15!0| ((|#1| NIL) ($$ NIL))
        (PROG ($ |o|)
          (LETT $ (QREFELT $$ 1) . #1=(|JDE;simplify;$R;15|))
          (LETT |o| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |#1| (QREFELT $ 70)) |o| (QREFELT $ 73)))))) 

(SDEFUN |JDE;project;$Nni$;16| ((|De| $) (|q| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|resOrd| (|List| (|NonNegativeInteger|)))
          (|resSys| (|List| |SysRec|)) (|check| (|Boolean|)) (|cDe| ($)))
         (SEQ
          (LETT |cDe| (SPADCALL |De| (QREFELT $ 37))
                . #1=(|JDE;project;$Nni$;16|))
          (EXIT
           (COND ((>= |q| (SPADCALL |De| (QREFELT $ 38))) |cDe|)
                 ('T
                  (SEQ (LETT |resSys| (QCAR |cDe|) . #1#)
                       (LETT |resOrd| (QCDR |cDe|) . #1#)
                       (LETT |check| 'T . #1#)
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
                                   (COND
                                    (|check| (QVELT (|SPADfirst| |resSys|) 4))
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
                       (EXIT (CONS |resSys| |resOrd|))))))))) 

(SDEFUN |JDE;prolong;$R;17|
        ((|De| $) ($ |Record| (|:| |SDe| $) (|:| IC (|List| D))))
        (SPROG
         ((|tmp| (|Record| (|:| |SDe| $) (|:| IC (|List| D)))) (|res| ($))
          (|pOrd| (|List| (|NonNegativeInteger|))) (|pSys| (|List| |SysRec|))
          (|lastOrd| #1=(|NonNegativeInteger|)) (#2=#:G386 NIL) (|j| NIL)
          (#3=#:G385 NIL) (|lastRec| (|SysRec|)) (|pRec| (|SysRec|))
          (#4=#:G384 NIL) (|i| NIL) (#5=#:G383 NIL) (#6=#:G382 NIL)
          (#7=#:G381 NIL) (|pJM| (|SparseEchelonMatrix| JB D))
          (|pIC| #8=(|List| D)) (|pJV| (|List| (|List| JB)))
          (|pDer| (|List| (|NonNegativeInteger|))) (|pEqs| #8#)
          (|FDiff| (|Record| (|:| |DPhi| D) (|:| |JVars| (|List| JB))))
          (#9=#:G353 NIL) (|jmeq| (|SparseEchelonMatrix| JB D))
          (#10=#:G378 NIL) (|eq| NIL) (#11=#:G379 NIL) (#12=#:G380 NIL)
          (|pro?| NIL) (|k| NIL) (#13=#:G376 NIL) (|rec| (|SysRec|))
          (#14=#:G377 NIL) (|ord| NIL) (#15=#:G375 NIL) (#16=#:G374 NIL)
          (#17=#:G373 NIL) (#18=#:G372 NIL) (#19=#:G344 NIL) (#20=#:G370 NIL)
          (#21=#:G371 NIL) (|q| #1#))
         (SEQ (LETT |pEqs| NIL . #22=(|JDE;prolong;$R;17|))
              (LETT |pDer| NIL . #22#) (LETT |pJV| NIL . #22#)
              (LETT |pIC| NIL . #22#)
              (LETT |rec| (|SPADfirst| (QCAR |De|)) . #22#)
              (LETT |q| (|SPADfirst| (QCDR |De|)) . #22#)
              (SEQ (LETT |k| 1 . #22#) (LETT |j| NIL . #22#)
                   (LETT #21# (QVELT |rec| 2) . #22#) (LETT |eq| NIL . #22#)
                   (LETT #20# (QVELT |rec| 0) . #22#) G190
                   (COND
                    ((OR (ATOM #20#) (PROGN (LETT |eq| (CAR #20#) . #22#) NIL)
                         (ATOM #21#) (PROGN (LETT |j| (CAR #21#) . #22#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |jmeq|
                          (SPADCALL (QVELT |rec| 1) |k| |k| (QREFELT $ 112))
                          . #22#)
                    (EXIT
                     (SEQ (LETT |i| (QREFELT $ 10) . #22#) G190
                          (COND ((< |i| |j|) (GO G191)))
                          (SEQ
                           (LETT |FDiff|
                                 (SPADCALL |eq|
                                           (PROG1 (LETT #19# |i| . #22#)
                                             (|check_subtype| (> #19# 0)
                                                              '(|PositiveInteger|)
                                                              #19#))
                                           |jmeq| (QREFELT $ 130))
                                 . #22#)
                           (LETT |pEqs| (CONS (QCAR |FDiff|) |pEqs|) . #22#)
                           (LETT |pDer| (CONS |i| |pDer|) . #22#)
                           (EXIT
                            (LETT |pJV| (CONS (QCDR |FDiff|) |pJV|) . #22#)))
                          (LETT |i| (+ |i| -1) . #22#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #20#
                         (PROG1 (CDR #20#)
                           (LETT #21#
                                 (PROG1 (CDR #21#)
                                   (LETT |k| (|inc_SI| |k|) . #22#))
                                 . #22#))
                         . #22#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |pEqs| (NREVERSE |pEqs|) . #22#)
              (LETT |pJV| (NREVERSE |pJV|) . #22#)
              (LETT |pDer| (NREVERSE |pDer|) . #22#)
              (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 132)) . #22#)
              (LETT |pRec|
                    (VECTOR |pEqs| |pJM| |pDer|
                            (PROGN
                             (LETT #18# NIL . #22#)
                             (SEQ (LETT |i| NIL . #22#)
                                  (LETT #17# |pDer| . #22#) G190
                                  (COND
                                   ((OR (ATOM #17#)
                                        (PROGN
                                         (LETT |i| (CAR #17#) . #22#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT (LETT #18# (CONS 'NIL #18#) . #22#)))
                                  (LETT #17# (CDR #17#) . #22#) (GO G190) G191
                                  (EXIT (NREVERSE #18#))))
                            'NIL 'NIL 0)
                    . #22#)
              (LETT |pSys| (LIST |pRec|) . #22#)
              (LETT |pOrd| (LIST (+ |q| 1)) . #22#)
              (LETT |lastRec| (MOVEVEC (MAKE-VEC 7) |rec|) . #22#)
              (QSETVELT |lastRec| 3
                        (PROGN
                         (LETT #16# NIL . #22#)
                         (SEQ (LETT |j| NIL . #22#)
                              (LETT #15# (QVELT |rec| 2) . #22#) G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |j| (CAR #15#) . #22#) NIL))
                                (GO G191)))
                              (SEQ (EXIT (LETT #16# (CONS 'T #16#) . #22#)))
                              (LETT #15# (CDR #15#) . #22#) (GO G190) G191
                              (EXIT (NREVERSE #16#)))))
              (LETT |lastOrd| |q| . #22#)
              (SEQ (LETT |ord| NIL . #22#) (LETT #14# (CDR (QCDR |De|)) . #22#)
                   (LETT |rec| NIL . #22#) (LETT #13# (CDR (QCAR |De|)) . #22#)
                   G190
                   (COND
                    ((OR (ATOM #13#) (PROGN (LETT |rec| (CAR #13#) . #22#) NIL)
                         (ATOM #14#)
                         (PROGN (LETT |ord| (CAR #14#) . #22#) NIL))
                     (GO G191)))
                   (SEQ (LETT |pEqs| NIL . #22#) (LETT |pDer| NIL . #22#)
                        (LETT |pJV| NIL . #22#)
                        (SEQ (LETT |k| 1 . #22#) (LETT |pro?| NIL . #22#)
                             (LETT #12# (QVELT |rec| 3) . #22#)
                             (LETT |j| NIL . #22#)
                             (LETT #11# (QVELT |rec| 2) . #22#)
                             (LETT |eq| NIL . #22#)
                             (LETT #10# (QVELT |rec| 0) . #22#) G190
                             (COND
                              ((OR (ATOM #10#)
                                   (PROGN (LETT |eq| (CAR #10#) . #22#) NIL)
                                   (ATOM #11#)
                                   (PROGN (LETT |j| (CAR #11#) . #22#) NIL)
                                   (ATOM #12#)
                                   (PROGN (LETT |pro?| (CAR #12#) . #22#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL |pro?|)
                                 (SEQ
                                  (LETT |jmeq|
                                        (SPADCALL (QVELT |rec| 1) |k| |k|
                                                  (QREFELT $ 112))
                                        . #22#)
                                  (EXIT
                                   (SEQ (LETT |i| (QREFELT $ 10) . #22#) G190
                                        (COND ((< |i| |j|) (GO G191)))
                                        (SEQ
                                         (LETT |FDiff|
                                               (SPADCALL |eq|
                                                         (PROG1
                                                             (LETT #9# |i|
                                                                   . #22#)
                                                           (|check_subtype|
                                                            (> #9# 0)
                                                            '(|PositiveInteger|)
                                                            #9#))
                                                         |jmeq|
                                                         (QREFELT $ 130))
                                               . #22#)
                                         (LETT |pEqs|
                                               (CONS (QCAR |FDiff|) |pEqs|)
                                               . #22#)
                                         (LETT |pDer| (CONS |i| |pDer|) . #22#)
                                         (EXIT
                                          (LETT |pJV|
                                                (CONS (QCDR |FDiff|) |pJV|)
                                                . #22#)))
                                        (LETT |i| (+ |i| -1) . #22#) (GO G190)
                                        G191 (EXIT NIL))))))))
                             (LETT #10#
                                   (PROG1 (CDR #10#)
                                     (LETT #11#
                                           (PROG1 (CDR #11#)
                                             (LETT #12#
                                                   (PROG1 (CDR #12#)
                                                     (LETT |k| (|inc_SI| |k|)
                                                           . #22#))
                                                   . #22#))
                                           . #22#))
                                   . #22#)
                             (GO G190) G191 (EXIT NIL))
                        (COND
                         ((NULL |pEqs|)
                          (SEQ (LETT |pSys| (CONS |lastRec| |pSys|) . #22#)
                               (EXIT
                                (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #22#))))
                         ('T
                          (SEQ (LETT |pIC| (APPEND |pIC| |pEqs|) . #22#)
                               (LETT |pJM|
                                     (SPADCALL |pEqs| |pJV| (QREFELT $ 132))
                                     . #22#)
                               (EXIT
                                (COND
                                 ((< (+ |ord| 1) |lastOrd|)
                                  (SEQ
                                   (LETT |pRec|
                                         (VECTOR |pEqs| |pJM| |pDer|
                                                 (PROGN
                                                  (LETT #7# NIL . #22#)
                                                  (SEQ (LETT |i| NIL . #22#)
                                                       (LETT #6# |pDer| . #22#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #6#)
                                                             (PROGN
                                                              (LETT |i|
                                                                    (CAR #6#)
                                                                    . #22#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #7#
                                                               (CONS 'NIL #7#)
                                                               . #22#)))
                                                       (LETT #6# (CDR #6#)
                                                             . #22#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #7#))))
                                                 'NIL 'NIL 0)
                                         . #22#)
                                   (LETT |pSys|
                                         (CONS |pRec| (CONS |lastRec| |pSys|))
                                         . #22#)
                                   (EXIT
                                    (LETT |pOrd|
                                          (CONS (+ |ord| 1)
                                                (CONS |lastOrd| |pOrd|))
                                          . #22#))))
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
                                                   (LETT #5# NIL . #22#)
                                                   (SEQ (LETT |i| NIL . #22#)
                                                        (LETT #4# |pDer|
                                                              . #22#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #4#)
                                                              (PROGN
                                                               (LETT |i|
                                                                     (CAR #4#)
                                                                     . #22#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #5#
                                                                (CONS 'NIL #5#)
                                                                . #22#)))
                                                        (LETT #4# (CDR #4#)
                                                              . #22#)
                                                        (GO G190) G191
                                                        (EXIT
                                                         (NREVERSE #5#)))))
                                          'NIL 'NIL 0)
                                         . #22#)
                                   (LETT |pSys| (CONS |pRec| |pSys|) . #22#)
                                   (EXIT
                                    (LETT |pOrd| (CONS |lastOrd| |pOrd|)
                                          . #22#)))))))))
                        (LETT |lastRec| (MOVEVEC (MAKE-VEC 7) |rec|) . #22#)
                        (QSETVELT |lastRec| 3
                                  (PROGN
                                   (LETT #3# NIL . #22#)
                                   (SEQ (LETT |j| NIL . #22#)
                                        (LETT #2# (QVELT |rec| 2) . #22#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |j| (CAR #2#) . #22#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3# (CONS 'T #3#) . #22#)))
                                        (LETT #2# (CDR #2#) . #22#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#)))))
                        (EXIT (LETT |lastOrd| |ord| . #22#)))
                   (LETT #13# (PROG1 (CDR #13#) (LETT #14# (CDR #14#) . #22#))
                         . #22#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |pSys| (CONS |lastRec| |pSys|) . #22#)
              (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #22#)
              (LETT |res| (CONS (NREVERSE |pSys|) (NREVERSE |pOrd|)) . #22#)
              (LETT |tmp| (SPADCALL |res| (QREFELT $ 127)) . #22#)
              (EXIT
               (CONS (QCAR |tmp|)
                     (SPADCALL |pIC| (QCDR |tmp|) (QREFELT $ 93))))))) 

(SDEFUN |JDE;prolong;$NniR;18|
        ((|De| $) (|q| |NonNegativeInteger|)
         ($ |Record| (|:| |SDe| $) (|:| IC (|List| D))))
        (SPROG
         ((|tmp| (|Record| (|:| |SDe| $) (|:| IC (|List| D)))) (|res| ($))
          (|pOrd| #1=(|List| (|NonNegativeInteger|)))
          (|pSys| (|List| |SysRec|)) (|lastOrd| #2=(|NonNegativeInteger|))
          (|lastRec| (|SysRec|)) (#3=#:G433 NIL) (|j| NIL) (#4=#:G432 NIL)
          (|pRec| (|SysRec|)) (#5=#:G431 NIL) (|i| NIL) (#6=#:G430 NIL)
          (#7=#:G429 NIL) (#8=#:G428 NIL) (|pIC| #9=(|List| D))
          (|pJM| (|SparseEchelonMatrix| JB D)) (|pDer| #1#)
          (|pJV| (|List| (|List| JB))) (|pEqs| #9#)
          (|FDiff| (|Record| (|:| |DPhi| D) (|:| |JVars| (|List| JB))))
          (#10=#:G401 NIL) (|jmeq| (|SparseEchelonMatrix| JB D))
          (#11=#:G425 NIL) (|eq| NIL) (#12=#:G426 NIL) (#13=#:G427 NIL)
          (|pro?| NIL) (|k| NIL) (#14=#:G423 NIL) (|rec| (|SysRec|))
          (#15=#:G424 NIL) (|ord| #2#) (#16=#:G422 NIL) (#17=#:G421 NIL)
          (#18=#:G391 NIL) (#19=#:G419 NIL) (#20=#:G420 NIL)
          (|tord| (|List| (|NonNegativeInteger|))) (|tsys| (|List| |SysRec|))
          (|cDe| ($)))
         (SEQ
          (LETT |cDe| (SPADCALL |De| (QREFELT $ 37))
                . #21=(|JDE;prolong;$NniR;18|))
          (LETT |tsys| (QCAR |cDe|) . #21#) (LETT |tord| (QCDR |cDe|) . #21#)
          (LETT |pSys| NIL . #21#) (LETT |pOrd| NIL . #21#)
          (LETT |pIC| NIL . #21#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL (|SPADfirst| |tord|) |q| (QREFELT $ 73)))
                 (GO G191)))
               (SEQ (LETT |pSys| (CONS (|SPADfirst| |tsys|) |pSys|) . #21#)
                    (LETT |pOrd| (CONS (|SPADfirst| |tord|) |pOrd|) . #21#)
                    (LETT |tsys| (CDR |tsys|) . #21#)
                    (EXIT (LETT |tord| (CDR |tord|) . #21#)))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (EQL (|SPADfirst| |tord|) |q|))
            (SEQ (LETT |pEqs| NIL . #21#) (LETT |pDer| NIL . #21#)
                 (LETT |pJV| NIL . #21#)
                 (LETT |rec| (|SPADfirst| |tsys|) . #21#)
                 (LETT |ord| (|SPADfirst| |tord|) . #21#)
                 (SEQ (LETT |k| 1 . #21#) (LETT |j| NIL . #21#)
                      (LETT #20# (QVELT |rec| 2) . #21#) (LETT |eq| NIL . #21#)
                      (LETT #19# (QVELT |rec| 0) . #21#) G190
                      (COND
                       ((OR (ATOM #19#)
                            (PROGN (LETT |eq| (CAR #19#) . #21#) NIL)
                            (ATOM #20#)
                            (PROGN (LETT |j| (CAR #20#) . #21#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |jmeq|
                             (SPADCALL (QVELT |rec| 1) |k| |k| (QREFELT $ 112))
                             . #21#)
                       (EXIT
                        (SEQ (LETT |i| (QREFELT $ 10) . #21#) G190
                             (COND ((< |i| |j|) (GO G191)))
                             (SEQ
                              (LETT |FDiff|
                                    (SPADCALL |eq|
                                              (PROG1 (LETT #18# |i| . #21#)
                                                (|check_subtype| (> #18# 0)
                                                                 '(|PositiveInteger|)
                                                                 #18#))
                                              |jmeq| (QREFELT $ 130))
                                    . #21#)
                              (LETT |pEqs| (CONS (QCAR |FDiff|) |pEqs|) . #21#)
                              (LETT |pDer| (CONS |i| |pDer|) . #21#)
                              (EXIT
                               (LETT |pJV| (CONS (QCDR |FDiff|) |pJV|)
                                     . #21#)))
                             (LETT |i| (+ |i| -1) . #21#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT #19#
                            (PROG1 (CDR #19#)
                              (LETT #20#
                                    (PROG1 (CDR #20#)
                                      (LETT |k| (|inc_SI| |k|) . #21#))
                                    . #21#))
                            . #21#)
                      (GO G190) G191 (EXIT NIL))
                 (LETT |pEqs| (NREVERSE |pEqs|) . #21#)
                 (LETT |pJV| (NREVERSE |pJV|) . #21#)
                 (LETT |pDer| (NREVERSE |pDer|) . #21#)
                 (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 132)) . #21#)
                 (LETT |pIC| |pEqs| . #21#)
                 (LETT |pRec|
                       (VECTOR |pEqs| |pJM| |pDer|
                               (PROGN
                                (LETT #17# NIL . #21#)
                                (SEQ (LETT |i| NIL . #21#)
                                     (LETT #16# |pDer| . #21#) G190
                                     (COND
                                      ((OR (ATOM #16#)
                                           (PROGN
                                            (LETT |i| (CAR #16#) . #21#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #17# (CONS 'NIL #17#) . #21#)))
                                     (LETT #16# (CDR #16#) . #21#) (GO G190)
                                     G191 (EXIT (NREVERSE #17#))))
                               'NIL 'NIL 0)
                       . #21#)
                 (LETT |pSys| (CONS |pRec| |pSys|) . #21#)
                 (EXIT (LETT |pOrd| (CONS (+ |ord| 1) |pOrd|) . #21#)))))
          (LETT |lastRec| (|SPADfirst| |tsys|) . #21#)
          (LETT |lastOrd| (|SPADfirst| |tord|) . #21#)
          (SEQ (LETT |ord| NIL . #21#) (LETT #15# (CDR |tord|) . #21#)
               (LETT |rec| NIL . #21#) (LETT #14# (CDR |tsys|) . #21#) G190
               (COND
                ((OR (ATOM #14#) (PROGN (LETT |rec| (CAR #14#) . #21#) NIL)
                     (ATOM #15#) (PROGN (LETT |ord| (CAR #15#) . #21#) NIL))
                 (GO G191)))
               (SEQ (LETT |pEqs| NIL . #21#) (LETT |pDer| NIL . #21#)
                    (LETT |pJV| NIL . #21#)
                    (SEQ (LETT |k| 1 . #21#) (LETT |pro?| NIL . #21#)
                         (LETT #13# (QVELT |rec| 3) . #21#)
                         (LETT |j| NIL . #21#)
                         (LETT #12# (QVELT |rec| 2) . #21#)
                         (LETT |eq| NIL . #21#)
                         (LETT #11# (QVELT |rec| 0) . #21#) G190
                         (COND
                          ((OR (ATOM #11#)
                               (PROGN (LETT |eq| (CAR #11#) . #21#) NIL)
                               (ATOM #12#)
                               (PROGN (LETT |j| (CAR #12#) . #21#) NIL)
                               (ATOM #13#)
                               (PROGN (LETT |pro?| (CAR #13#) . #21#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL |pro?|)
                             (SEQ
                              (LETT |jmeq|
                                    (SPADCALL (QVELT |rec| 1) |k| |k|
                                              (QREFELT $ 112))
                                    . #21#)
                              (EXIT
                               (SEQ (LETT |i| (QREFELT $ 10) . #21#) G190
                                    (COND ((< |i| |j|) (GO G191)))
                                    (SEQ
                                     (LETT |FDiff|
                                           (SPADCALL |eq|
                                                     (PROG1
                                                         (LETT #10# |i| . #21#)
                                                       (|check_subtype|
                                                        (> #10# 0)
                                                        '(|PositiveInteger|)
                                                        #10#))
                                                     |jmeq| (QREFELT $ 130))
                                           . #21#)
                                     (LETT |pEqs| (CONS (QCAR |FDiff|) |pEqs|)
                                           . #21#)
                                     (LETT |pDer| (CONS |i| |pDer|) . #21#)
                                     (EXIT
                                      (LETT |pJV| (CONS (QCDR |FDiff|) |pJV|)
                                            . #21#)))
                                    (LETT |i| (+ |i| -1) . #21#) (GO G190) G191
                                    (EXIT NIL))))))))
                         (LETT #11#
                               (PROG1 (CDR #11#)
                                 (LETT #12#
                                       (PROG1 (CDR #12#)
                                         (LETT #13#
                                               (PROG1 (CDR #13#)
                                                 (LETT |k| (|inc_SI| |k|)
                                                       . #21#))
                                               . #21#))
                                       . #21#))
                               . #21#)
                         (GO G190) G191 (EXIT NIL))
                    (COND
                     ((NULL |pEqs|)
                      (SEQ (LETT |pSys| (CONS |lastRec| |pSys|) . #21#)
                           (EXIT
                            (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #21#))))
                     ('T
                      (SEQ (LETT |pEqs| (NREVERSE |pEqs|) . #21#)
                           (LETT |pJV| (NREVERSE |pJV|) . #21#)
                           (LETT |pDer| (NREVERSE |pDer|) . #21#)
                           (LETT |pJM| (SPADCALL |pEqs| |pJV| (QREFELT $ 132))
                                 . #21#)
                           (LETT |pIC| (APPEND |pIC| |pEqs|) . #21#)
                           (COND
                            ((< (+ |ord| 1) |lastOrd|)
                             (SEQ
                              (LETT |pRec|
                                    (VECTOR |pEqs| |pJM| |pDer|
                                            (PROGN
                                             (LETT #8# NIL . #21#)
                                             (SEQ (LETT |i| NIL . #21#)
                                                  (LETT #7# |pDer| . #21#) G190
                                                  (COND
                                                   ((OR (ATOM #7#)
                                                        (PROGN
                                                         (LETT |i| (CAR #7#)
                                                               . #21#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #8# (CONS 'NIL #8#)
                                                          . #21#)))
                                                  (LETT #7# (CDR #7#) . #21#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #8#))))
                                            'NIL 'NIL 0)
                                    . #21#)
                              (LETT |pSys|
                                    (CONS |pRec| (CONS |lastRec| |pSys|))
                                    . #21#)
                              (EXIT
                               (LETT |pOrd|
                                     (CONS (+ |ord| 1) (CONS |lastOrd| |pOrd|))
                                     . #21#))))
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
                                                (LETT #6# NIL . #21#)
                                                (SEQ (LETT |i| NIL . #21#)
                                                     (LETT #5# |pDer| . #21#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #5#)
                                                           (PROGN
                                                            (LETT |i| (CAR #5#)
                                                                  . #21#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #6#
                                                             (CONS 'NIL #6#)
                                                             . #21#)))
                                                     (LETT #5# (CDR #5#)
                                                           . #21#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #6#))))
                                               (QREFELT $ 95))
                                     'NIL 'NIL 0)
                                    . #21#)
                              (LETT |pSys| (CONS |pRec| |pSys|) . #21#)
                              (EXIT
                               (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #21#)))))
                           (EXIT
                            (QSETVELT |rec| 3
                                      (PROGN
                                       (LETT #4# NIL . #21#)
                                       (SEQ (LETT |j| NIL . #21#)
                                            (LETT #3# (QVELT |rec| 2) . #21#)
                                            G190
                                            (COND
                                             ((OR (ATOM #3#)
                                                  (PROGN
                                                   (LETT |j| (CAR #3#) . #21#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4# (CONS 'T #4#) . #21#)))
                                            (LETT #3# (CDR #3#) . #21#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #4#)))))))))
                    (LETT |lastRec| |rec| . #21#)
                    (EXIT (LETT |lastOrd| |ord| . #21#)))
               (LETT #14# (PROG1 (CDR #14#) (LETT #15# (CDR #15#) . #21#))
                     . #21#)
               (GO G190) G191 (EXIT NIL))
          (LETT |pSys| (CONS |lastRec| |pSys|) . #21#)
          (LETT |pOrd| (CONS |lastOrd| |pOrd|) . #21#)
          (LETT |res| (CONS (NREVERSE |pSys|) (NREVERSE |pOrd|)) . #21#)
          (LETT |tmp| (SPADCALL |res| (QREFELT $ 127)) . #21#)
          (EXIT
           (CONS (QCAR |tmp|) (SPADCALL |pIC| (QCDR |tmp|) (QREFELT $ 93))))))) 

(SDEFUN |JDE;extractSymbol;$BSem;19|
        ((|De| $) (|solved?| |Boolean|) ($ |SparseEchelonMatrix| JB D))
        (SPROG ((|res| (|SparseEchelonMatrix| JB D)))
               (SEQ
                (LETT |res|
                      (SPADCALL (QVELT (|SPADfirst| (QCAR |De|)) 1)
                                (QREFELT $ 135))
                      . #1=(|JDE;extractSymbol;$BSem;19|))
                (COND
                 (|solved?|
                  (LETT |res| (QVELT (SPADCALL |res| (QREFELT $ 137)) 0)
                        . #1#)))
                (EXIT |res|)))) 

(SDEFUN |JDE;analyseSymbol;SemR;20|
        ((|Symb| |SparseEchelonMatrix| JB D)
         ($ |Record| (|:| |Rank| (|NonNegativeInteger|))
          (|:| |NumMultVar| (|NonNegativeInteger|))
          (|:| |Betas| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|LBeta| (|List| (|NonNegativeInteger|))) (|k| NIL)
          (|MSum| #1=(|NonNegativeInteger|))
          (|LastClass| (|NonNegativeInteger|)) (|BetaI| #1#) (#2=#:G449 NIL)
          (|CurClass| (|NonNegativeInteger|)) (#3=#:G448 NIL) (|jv| NIL)
          (|pivs|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (|ech| #4=(|SparseEchelonMatrix| JB D))
          (|tmp|
           (|Record| (|:| |Ech| #4#) (|:| |Lt| (|Matrix| D))
                     (|:| |Pivots| (|List| D))
                     (|:| |Rank| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |tmp| (SPADCALL |Symb| (QREFELT $ 137))
                . #5=(|JDE;analyseSymbol;SemR;20|))
          (LETT |ech| (QVELT |tmp| 0) . #5#)
          (LETT |pivs| (SPADCALL |ech| (QREFELT $ 139)) . #5#)
          (LETT |MSum| 0 . #5#) (LETT |BetaI| 0 . #5#)
          (LETT |LastClass| (QREFELT $ 10) . #5#) (LETT |LBeta| NIL . #5#)
          (SEQ (LETT |jv| NIL . #5#) (LETT #3# (QCAR |pivs|) . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |jv| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |CurClass| (SPADCALL |jv| (QREFELT $ 140)) . #5#)
                    (EXIT
                     (COND
                      ((EQL |CurClass| |LastClass|)
                       (LETT |BetaI| (+ |BetaI| 1) . #5#))
                      ('T
                       (SEQ (LETT |LBeta| (CONS |BetaI| |LBeta|) . #5#)
                            (LETT |MSum| (+ |MSum| (* |BetaI| |LastClass|))
                                  . #5#)
                            (SEQ (LETT |k| 2 . #5#)
                                 (LETT #2# (- |LastClass| |CurClass|) . #5#)
                                 G190 (COND ((|greater_SI| |k| #2#) (GO G191)))
                                 (SEQ
                                  (EXIT (LETT |LBeta| (CONS 0 |LBeta|) . #5#)))
                                 (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |BetaI| 1 . #5#)
                            (EXIT (LETT |LastClass| |CurClass| . #5#)))))))
               (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |LBeta| (CONS |BetaI| |LBeta|) . #5#)
          (LETT |MSum| (+ |MSum| (* |BetaI| |LastClass|)) . #5#)
          (SEQ (LETT |k| 2 . #5#) G190
               (COND ((|greater_SI| |k| |LastClass|) (GO G191)))
               (SEQ (EXIT (LETT |LBeta| (CONS 0 |LBeta|) . #5#)))
               (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR (QVELT |tmp| 3) |MSum| |LBeta|))))) 

(SDEFUN |JDE;prolongSymbol;2Sem;21|
        ((|Symb| |SparseEchelonMatrix| JB D) ($ |SparseEchelonMatrix| JB D))
        (SPROG
         ((|ninds| (|List| JB)) (#1=#:G459 NIL) (#2=#:G472 NIL) (#3=#:G484 NIL)
          (|jv| NIL) (#4=#:G483 NIL) (|i| NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (#5=#:G482 NIL) (|j| NIL) (|res| (|SparseEchelonMatrix| JB D))
          (|newInds| (|List| JB)) (#6=#:G457 NIL) (#7=#:G481 NIL)
          (#8=#:G480 NIL) (|oldInds| (|List| JB)))
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
                                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                                #1#))
                               |newInds|)
                              . #9#)))
                      (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                      (EXIT NIL))))
               (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |newInds|
                (SPADCALL (CONS #'|JDE;prolongSymbol;2Sem;21!0| $)
                          (SPADCALL |newInds| (QREFELT $ 146)) (QREFELT $ 148))
                . #9#)
          (LETT |res|
                (SPADCALL |newInds|
                          (SPADCALL (QREFELT $ 10)
                                    (SPADCALL |Symb| (QREFELT $ 67))
                                    (QREFELT $ 149))
                          (QREFELT $ 76))
                . #9#)
          (SEQ (LETT |j| 1 . #9#)
               (LETT #5# (SPADCALL |Symb| (QREFELT $ 67)) . #9#) G190
               (COND ((|greater_SI| |j| #5#) (GO G191)))
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
                                                                        (LETT
                                                                         #2#
                                                                         |i|
                                                                         . #9#)
                                                                      (|check_subtype|
                                                                       (> #2#
                                                                          0)
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
                                       (LETT #3# (CDR #3#) . #9#) (GO G190)
                                       G191 (EXIT (NREVERSE #4#))))
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
                          (LETT |i| (+ |i| -1) . #9#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |JDE;prolongSymbol;2Sem;21!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 145))) 

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
          (#2=#:G490 NIL) (|beta| NIL) (|k| NIL)
          (|oldBeta| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |oldBeta| (REVERSE (QVELT |mv| 2))
                . #3=(|JDE;prolongMV;2R;22|))
          (LETT |newBeta| NIL . #3#) (LETT |sum| 0 . #3#) (LETT |rank| 0 . #3#)
          (LETT |msum| 0 . #3#)
          (SEQ (LETT |k| (QREFELT $ 10) . #3#) (LETT |beta| NIL . #3#)
               (LETT #2# |oldBeta| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |beta| (CAR #2#) . #3#) NIL)
                     (< |k| 1))
                 (GO G191)))
               (SEQ (LETT |sum| (+ |sum| |beta|) . #3#)
                    (LETT |rank| (+ |rank| |sum|) . #3#)
                    (LETT |msum| (+ |msum| (* |k| |sum|)) . #3#)
                    (EXIT (LETT |newBeta| (CONS |sum| |newBeta|) . #3#)))
               (LETT #2# (PROG1 (CDR #2#) (LETT |k| (+ |k| -1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |rank| |msum| (NREVERSE |newBeta|)))))) 

(SDEFUN |JDE;power|
        ((|lc| |List| D) (|mu| |List| (|NonNegativeInteger|))
         (|mask| |List| (|PositiveInteger|)) ($ D))
        (SPROG ((|k| (|PositiveInteger|)) (|res| (D)))
               (SEQ (LETT |res| (|spadConstant| $ 75) . #1=(|JDE;power|))
                    (LETT |k| 1 . #1#)
                    (SEQ G190
                         (COND
                          ((NULL (COND ((NULL |mask|) 'NIL) ('T 'T)))
                           (GO G191)))
                         (SEQ
                          (SEQ G190
                               (COND
                                ((NULL (< |k| (|SPADfirst| |mask|)))
                                 (GO G191)))
                               (SEQ (LETT |mu| (CDR |mu|) . #1#)
                                    (EXIT (LETT |k| (+ |k| 1) . #1#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |res|
                                (SPADCALL |res|
                                          (SPADCALL (|SPADfirst| |lc|)
                                                    (|SPADfirst| |mu|)
                                                    (QREFELT $ 153))
                                          (QREFELT $ 154))
                                . #1#)
                          (LETT |lc| (CDR |lc|) . #1#)
                          (LETT |mask| (CDR |mask|) . #1#)
                          (LETT |mu| (CDR |mu|) . #1#)
                          (EXIT (LETT |k| (+ |k| 1) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |JDE;extPower|
        ((|llc| |Matrix| D) (|mu| |List| (|NonNegativeInteger|))
         (|nu| |List| (|NonNegativeInteger|)) ($ D))
        (SPROG
         ((|res| (D)) (|prod| (D)) (#1=#:G504 NIL) (|si| NIL) (#2=#:G505 NIL)
          (|mi| NIL) (#3=#:G503 NIL) (|s| NIL) (|q| (|NonNegativeInteger|))
          (|rmu| (|List| (|PositiveInteger|)))
          (|snu| (|List| (|List| (|PositiveInteger|)))))
         (SEQ
          (LETT |snu| (SPADCALL |nu| (QREFELT $ 156)) . #4=(|JDE;extPower|))
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
          (EXIT |res|)))) 

(SDEFUN |JDE;tableau;SemJdSem;25|
        ((|Symb| |SparseEchelonMatrix| JB D) (|chi| |JetDifferential| JB D)
         ($ |SparseEchelonMatrix| JB D))
        (SPROG
         ((|le| (|List| D)) (|li| (|List| JB)) (#1=#:G514 NIL) (#2=#:G529 NIL)
          (|i| NIL) (#3=#:G530 NIL) (|s| NIL)
          (|mu| (|List| (|NonNegativeInteger|))) (|a| #4=(|PositiveInteger|))
          (#5=#:G527 NIL) (|jv| NIL) (#6=#:G528 NIL) (|ent| NIL)
          (|sum| (|Vector| D))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (#7=#:G526 NIL) (|k| NIL) (|res| (|SparseEchelonMatrix| JB D))
          (#8=#:G508 NIL) (#9=#:G525 NIL) (|cinds| (|List| #4#))
          (#10=#:G524 NIL) (|d| NIL) (#11=#:G523 NIL) (|coeffs| (|List| D))
          (|diffs| (|List| JB)))
         (SEQ
          (LETT |diffs| (SPADCALL |chi| (QREFELT $ 161))
                . #12=(|JDE;tableau;SemJdSem;25|))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |diffs| (QREFELT $ 162))
                       (SPADCALL (QREFELT $ 10) (QREFELT $ 163))
                       (QREFELT $ 164))
             (|error| "illegal differential in tableau"))
            ('T
             (SEQ (LETT |coeffs| (SPADCALL |chi| (QREFELT $ 165)) . #12#)
                  (LETT |cinds|
                        (PROGN
                         (LETT #11# NIL . #12#)
                         (SEQ (LETT |d| NIL . #12#) (LETT #10# |diffs| . #12#)
                              G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |d| (CAR #10#) . #12#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #11#
                                      (CONS (SPADCALL |d| (QREFELT $ 166))
                                            #11#)
                                      . #12#)))
                              (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                              (EXIT (NREVERSE #11#))))
                        . #12#)
                  (LETT |res|
                        (SPADCALL
                         (PROGN
                          (LETT #9# NIL . #12#)
                          (SEQ (LETT |i| (QREFELT $ 12) . #12#) G190
                               (COND ((< |i| 1) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #9#
                                       (CONS
                                        (SPADCALL
                                         (PROG1 (LETT #8# |i| . #12#)
                                           (|check_subtype| (> #8# 0)
                                                            '(|PositiveInteger|)
                                                            #8#))
                                         (QREFELT $ 124))
                                        #9#)
                                       . #12#)))
                               (LETT |i| (+ |i| -1) . #12#) (GO G190) G191
                               (EXIT (NREVERSE #9#))))
                         (SPADCALL |Symb| (QREFELT $ 67)) (QREFELT $ 76))
                        . #12#)
                  (SEQ (LETT |k| 1 . #12#)
                       (LETT #7# (SPADCALL |Symb| (QREFELT $ 67)) . #12#) G190
                       (COND ((|greater_SI| |k| #7#) (GO G191)))
                       (SEQ
                        (LETT |r| (SPADCALL |Symb| |k| (QREFELT $ 69)) . #12#)
                        (LETT |sum|
                              (MAKEARR1 (QREFELT $ 12) (|spadConstant| $ 48))
                              . #12#)
                        (SEQ (LETT |ent| NIL . #12#)
                             (LETT #6# (QCDR |r|) . #12#)
                             (LETT |jv| NIL . #12#)
                             (LETT #5# (QCAR |r|) . #12#) G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |jv| (CAR #5#) . #12#) NIL)
                                   (ATOM #6#)
                                   (PROGN (LETT |ent| (CAR #6#) . #12#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |a| (SPADCALL |jv| (QREFELT $ 166)) . #12#)
                              (LETT |mu| (SPADCALL |jv| (QREFELT $ 167))
                                    . #12#)
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
                             (LETT #5#
                                   (PROG1 (CDR #5#)
                                     (LETT #6# (CDR #6#) . #12#))
                                   . #12#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |li| NIL . #12#) (LETT |le| NIL . #12#)
                        (SEQ (LETT |s| NIL . #12#)
                             (LETT #3# (SPADCALL |sum| (QREFELT $ 169)) . #12#)
                             (LETT |i| 1 . #12#)
                             (LETT #2# (QREFELT $ 12) . #12#) G190
                             (COND
                              ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                                   (PROGN (LETT |s| (CAR #3#) . #12#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |s| (QREFELT $ 170)))
                                 (SEQ
                                  (LETT |li|
                                        (CONS
                                         (SPADCALL
                                          (PROG1 (LETT #1# |i| . #12#)
                                            (|check_subtype| (> #1# 0)
                                                             '(|PositiveInteger|)
                                                             #1#))
                                          (QREFELT $ 124))
                                         |li|)
                                        . #12#)
                                  (EXIT
                                   (LETT |le| (CONS |s| |le|) . #12#)))))))
                             (LETT |i|
                                   (PROG1 (|inc_SI| |i|)
                                     (LETT #3# (CDR #3#) . #12#))
                                   . #12#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT (SPADCALL |res| |k| |li| |le| (QREFELT $ 150))))
                       (LETT |k| (|inc_SI| |k|) . #12#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |res|)))))))) 

(SDEFUN |JDE;tableau;SemLSem;26|
        ((|Symb| |SparseEchelonMatrix| JB D)
         (|lchi| |List| (|JetDifferential| JB D))
         ($ |SparseEchelonMatrix| JB D))
        (SPROG
         ((|rres|
           #1=(|Record| (|:| |Indices| (|List| JB))
                        (|:| |Entries| (|List| D))))
          (|s| (D)) (|mu| #2=(|List| (|NonNegativeInteger|))) (#3=#:G552 NIL)
          (|jv| NIL) (#4=#:G553 NIL) (|ent| NIL) (|r| #1#) (#5=#:G551 NIL)
          (|k| NIL) (|nu| #2#) (|a| (|PositiveInteger|)) (#6=#:G550 NIL)
          (|vv| NIL) (|res| (|SparseEchelonMatrix| JB D)) (#7=#:G534 NIL)
          (#8=#:G549 NIL) (|j| NIL) (|i| NIL) (#9=#:G548 NIL) (|chi| NIL)
          (|mco| (|Matrix| D)) (|inds| (|List| JB)) (#10=#:G532 NIL)
          (|q| (|NonNegativeInteger|)))
         (SEQ
          (LETT |q|
                (SPADCALL (|SPADfirst| (SPADCALL |Symb| (QREFELT $ 62)))
                          (QREFELT $ 70))
                . #11=(|JDE;tableau;SemLSem;26|))
          (LETT |inds|
                (SPADCALL |q|
                          (PROG1
                              (LETT #10#
                                    (+ (- (QREFELT $ 10) (LENGTH |lchi|)) 1)
                                    . #11#)
                            (|check_subtype| (> #10# 0) '(|PositiveInteger|)
                                             #10#))
                          (QREFELT $ 172))
                . #11#)
          (LETT |mco|
                (MAKE_MATRIX1 (LENGTH |lchi|) (QREFELT $ 10)
                              (|spadConstant| $ 48))
                . #11#)
          (SEQ (LETT |chi| NIL . #11#) (LETT #9# |lchi| . #11#)
               (LETT |i| 1 . #11#) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |chi| (CAR #9#) . #11#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #11#) (LETT #8# (QREFELT $ 10) . #11#) G190
                      (COND ((|greater_SI| |j| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |mco| |i| |j|
                                    (SPADCALL |chi|
                                              (SPADCALL
                                               (PROG1 (LETT #7# |j| . #11#)
                                                 (|check_subtype| (> #7# 0)
                                                                  '(|PositiveInteger|)
                                                                  #7#))
                                               (QREFELT $ 163))
                                              (QREFELT $ 173))
                                    1 1)))
                      (LETT |j| (|inc_SI| |j|) . #11#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #9# (CDR #9#) . #11#))
                     . #11#)
               (GO G190) G191 (EXIT NIL))
          (LETT |res|
                (SPADCALL |inds| (SPADCALL |Symb| (QREFELT $ 67))
                          (QREFELT $ 76))
                . #11#)
          (SEQ (LETT |vv| NIL . #11#) (LETT #6# (REVERSE |inds|) . #11#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |vv| (CAR #6#) . #11#) NIL))
                 (GO G191)))
               (SEQ (LETT |a| (SPADCALL |vv| (QREFELT $ 166)) . #11#)
                    (LETT |nu| (SPADCALL |vv| (QREFELT $ 167)) . #11#)
                    (EXIT
                     (SEQ (LETT |k| 1 . #11#)
                          (LETT #5# (SPADCALL |Symb| (QREFELT $ 67)) . #11#)
                          G190 (COND ((|greater_SI| |k| #5#) (GO G191)))
                          (SEQ
                           (LETT |r| (SPADCALL |Symb| |k| (QREFELT $ 69))
                                 . #11#)
                           (LETT |s| (|spadConstant| $ 48) . #11#)
                           (SEQ (LETT |ent| NIL . #11#)
                                (LETT #4# (QCDR |r|) . #11#)
                                (LETT |jv| NIL . #11#)
                                (LETT #3# (QCAR |r|) . #11#) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |jv| (CAR #3#) . #11#) NIL)
                                      (ATOM #4#)
                                      (PROGN
                                       (LETT |ent| (CAR #4#) . #11#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((EQL (SPADCALL |jv| (QREFELT $ 166)) |a|)
                                    (SEQ
                                     (LETT |mu| (SPADCALL |jv| (QREFELT $ 167))
                                           . #11#)
                                     (EXIT
                                      (LETT |s|
                                            (SPADCALL |s|
                                                      (SPADCALL |ent|
                                                                (|JDE;extPower|
                                                                 |mco| |mu|
                                                                 |nu| $)
                                                                (QREFELT $
                                                                         154))
                                                      (QREFELT $ 159))
                                            . #11#)))))))
                                (LETT #3#
                                      (PROG1 (CDR #3#)
                                        (LETT #4# (CDR #4#) . #11#))
                                      . #11#)
                                (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (COND
                             ((NULL (SPADCALL |s| (QREFELT $ 170)))
                              (SEQ
                               (LETT |rres| (SPADCALL |res| |k| (QREFELT $ 69))
                                     . #11#)
                               (PROGN
                                (RPLACA |rres| (CONS |vv| (QCAR |rres|)))
                                (QCAR |rres|))
                               (PROGN
                                (RPLACD |rres| (CONS |s| (QCDR |rres|)))
                                (QCDR |rres|))
                               (EXIT
                                (SPADCALL |res| |k| |rres|
                                          (QREFELT $ 81))))))))
                          (LETT |k| (|inc_SI| |k|) . #11#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #6# (CDR #6#) . #11#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |JetDifferentialEquation;|)) 

(DEFUN |JetDifferentialEquation| (&REST #1=#:G554)
  (SPROG NIL
         (PROG (#2=#:G555)
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
                  (HREM |$ConstructorCache| '|JetDifferentialEquation|)))))))))) 

(DEFUN |JetDifferentialEquation;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
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
