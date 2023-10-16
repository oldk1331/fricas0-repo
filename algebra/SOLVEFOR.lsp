
(PUT '|SOLVEFOR;part| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |SOLVEFOR;part| ((|s| F) ($ F)) |s|) 

(SDEFUN |SOLVEFOR;intsolve| ((|u| UP) ($ |List| F))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |u|
                      (QVELT
                       (SPADCALL
                        (SPADCALL (SPADCALL |u| (QREFELT $ 9)) (QREFELT $ 14))
                        1 (QREFELT $ 16))
                       1))
                (LETT |n| (SPADCALL |u| (QREFELT $ 18)))
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SPADCALL (SPADCALL |u| 1 (QREFELT $ 21))
                             (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 25)))
                  ((EQL |n| 2)
                   (SPADCALL (SPADCALL |u| 2 (QREFELT $ 21))
                             (SPADCALL |u| 1 (QREFELT $ 21))
                             (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 26)))
                  ((EQL |n| 3)
                   (SPADCALL (SPADCALL |u| 3 (QREFELT $ 21))
                             (SPADCALL |u| 2 (QREFELT $ 21))
                             (SPADCALL |u| 1 (QREFELT $ 21))
                             (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 27)))
                  ((EQL |n| 4)
                   (SPADCALL (SPADCALL |u| 4 (QREFELT $ 21))
                             (SPADCALL |u| 3 (QREFELT $ 21))
                             (SPADCALL |u| 2 (QREFELT $ 21))
                             (SPADCALL |u| 1 (QREFELT $ 21))
                             (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 28)))
                  ('T
                   (|error|
                    "All sqfr factors of polynomial must be of degree < 5"))))))) 

(SDEFUN |SOLVEFOR;solve;UPL;3| ((|u| UP) ($ |List| F))
        (SPROG
         ((|ls| (|List| F)) (#1=#:G122 NIL) (|i| NIL) (|lsf| (|List| F))
          (#2=#:G121 NIL) (|f| NIL))
         (SEQ (LETT |ls| NIL)
              (SEQ (LETT |f| NIL)
                   (LETT #2#
                         (SPADCALL (SPADCALL |u| (QREFELT $ 9))
                                   (QREFELT $ 14)))
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lsf| (|SOLVEFOR;intsolve| (QVELT |f| 1) $))
                        (EXIT
                         (SEQ (LETT |i| 1) (LETT #1# (QVELT |f| 2)) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |ls|
                                      (SPADCALL |lsf| |ls| (QREFELT $ 29)))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ls|)))) 

(SDEFUN |SOLVEFOR;particularSolution;UPF;4| ((|u| UP) ($ F))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |u|
                      (QVELT
                       (SPADCALL
                        (SPADCALL (SPADCALL |u| (QREFELT $ 9)) (QREFELT $ 14))
                        1 (QREFELT $ 16))
                       1))
                (LETT |n| (SPADCALL |u| (QREFELT $ 18)))
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SPADCALL (SPADCALL |u| 1 (QREFELT $ 21))
                             (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 31)))
                  ((EQL |n| 2)
                   (SPADCALL (SPADCALL |u| 2 (QREFELT $ 21))
                             (SPADCALL |u| 1 (QREFELT $ 21))
                             (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 32)))
                  ((EQL |n| 3)
                   (SPADCALL (SPADCALL |u| 3 (QREFELT $ 21))
                             (SPADCALL |u| 2 (QREFELT $ 21))
                             (SPADCALL |u| 1 (QREFELT $ 21))
                             (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 33)))
                  ((EQL |n| 4)
                   (SPADCALL (SPADCALL |u| 4 (QREFELT $ 21))
                             (SPADCALL |u| 3 (QREFELT $ 21))
                             (SPADCALL |u| 2 (QREFELT $ 21))
                             (SPADCALL |u| 1 (QREFELT $ 21))
                             (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 34)))
                  ('T
                   (|error|
                    "All sqfr factors of polynomial must be of degree < 5"))))))) 

(SDEFUN |SOLVEFOR;needDegree| ((|n| |Integer|) (|u| UP) ($ |Boolean|))
        (COND ((EQL (SPADCALL |u| (QREFELT $ 18)) |n|) 'T)
              ('T
               (|error|
                (STRCONC "Polynomial must be of degree " (STRINGIMAGE |n|)))))) 

(SDEFUN |SOLVEFOR;needLcoef| ((|cn| F) ($ |Boolean|))
        (COND ((SPADCALL |cn| (|spadConstant| $ 23) (QREFELT $ 37)) 'T)
              ('T (|error| "Leading coefficient must not be 0.")))) 

(SDEFUN |SOLVEFOR;needChar0| (($ |Boolean|))
        (COND ((EQL (SPADCALL (QREFELT $ 38)) 0) 'T)
              ('T
               (|error|
                "Formula defined only for fields of characteristic 0.")))) 

(SDEFUN |SOLVEFOR;linear;UPL;8| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 1 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 1 (QREFELT $ 21))
                        (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 25))))) 

(SDEFUN |SOLVEFOR;quadratic;UPL;9| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 2 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 2 (QREFELT $ 21))
                        (SPADCALL |u| 1 (QREFELT $ 21))
                        (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 26))))) 

(SDEFUN |SOLVEFOR;cubic;UPL;10| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 3 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 3 (QREFELT $ 21))
                        (SPADCALL |u| 2 (QREFELT $ 21))
                        (SPADCALL |u| 1 (QREFELT $ 21))
                        (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 27))))) 

(SDEFUN |SOLVEFOR;quartic;UPL;11| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 4 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 4 (QREFELT $ 21))
                        (SPADCALL |u| 3 (QREFELT $ 21))
                        (SPADCALL |u| 2 (QREFELT $ 21))
                        (SPADCALL |u| 1 (QREFELT $ 21))
                        (SPADCALL |u| 0 (QREFELT $ 21)) (QREFELT $ 28))))) 

(SDEFUN |SOLVEFOR;equ| ((|x| F) (|y| F) ($ |Boolean|))
        (COND
         ((QEQCAR (SPADCALL (SPADCALL |x| |y| (QREFELT $ 43)) (QREFELT $ 45))
                  1)
          'T)
         ('T NIL))) 

(SDEFUN |SOLVEFOR;linear;2FL;13| ((|c1| F) (|c0| F) ($ |List| F))
        (SEQ (|SOLVEFOR;needLcoef| |c1| $)
             (EXIT
              (LIST
               (SPADCALL (SPADCALL |c0| |c1| (QREFELT $ 46)) (QREFELT $ 47)))))) 

(SDEFUN |SOLVEFOR;aLinear;3F;14| ((|c1| F) (|c0| F) ($ F))
        (|SPADfirst| (SPADCALL |c1| |c0| (QREFELT $ 25)))) 

(SDEFUN |SOLVEFOR;quadratic;3FL;15| ((|c2| F) (|c1| F) (|c0| F) ($ |List| F))
        (SPROG ((D (F)))
               (SEQ (|SOLVEFOR;needLcoef| |c2| $) (|SOLVEFOR;needChar0| $)
                    (EXIT
                     (COND
                      ((SPADCALL |c0| (|spadConstant| $ 23) (QREFELT $ 48))
                       (CONS (|spadConstant| $ 23)
                             (SPADCALL |c2| |c1| (QREFELT $ 25))))
                      ((SPADCALL |c1| (|spadConstant| $ 23) (QREFELT $ 48))
                       (LIST
                        (SPADCALL
                         (SPADCALL (SPADCALL |c0| |c2| (QREFELT $ 46))
                                   (QREFELT $ 47))
                         (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |c0| |c2| (QREFELT $ 46))
                                    (QREFELT $ 47))
                          (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51))
                         (QREFELT $ 47))))
                      ('T
                       (SEQ
                        (LETT D
                              (SPADCALL
                               (|SOLVEFOR;part|
                                (SPADCALL (SPADCALL |c1| 2 (QREFELT $ 53))
                                          (SPADCALL
                                           (SPADCALL 4 |c2| (QREFELT $ 54))
                                           |c0| (QREFELT $ 55))
                                          (QREFELT $ 43))
                                $)
                               (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51)))
                        (EXIT
                         (LIST
                          (SPADCALL
                           (SPADCALL (SPADCALL |c1| (QREFELT $ 47)) D
                                     (QREFELT $ 56))
                           (SPADCALL 2 |c2| (QREFELT $ 54)) (QREFELT $ 46))
                          (SPADCALL
                           (SPADCALL (SPADCALL |c1| (QREFELT $ 47)) D
                                     (QREFELT $ 43))
                           (SPADCALL 2 |c2| (QREFELT $ 54))
                           (QREFELT $ 46))))))))))) 

(SDEFUN |SOLVEFOR;aQuadratic;4F;16| ((|c2| F) (|c1| F) (|c0| F) ($ F))
        (SPROG ((D (F)))
               (SEQ (|SOLVEFOR;needLcoef| |c2| $) (|SOLVEFOR;needChar0| $)
                    (EXIT
                     (COND
                      ((SPADCALL |c0| (|spadConstant| $ 23) (QREFELT $ 48))
                       (|spadConstant| $ 23))
                      ((SPADCALL |c1| (|spadConstant| $ 23) (QREFELT $ 48))
                       (SPADCALL
                        (SPADCALL (SPADCALL |c0| |c2| (QREFELT $ 46))
                                  (QREFELT $ 47))
                        (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51)))
                      ('T
                       (SEQ
                        (LETT D
                              (SPADCALL
                               (|SOLVEFOR;part|
                                (SPADCALL (SPADCALL |c1| 2 (QREFELT $ 53))
                                          (SPADCALL
                                           (SPADCALL 4 |c2| (QREFELT $ 54))
                                           |c0| (QREFELT $ 55))
                                          (QREFELT $ 43))
                                $)
                               (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51)))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |c1| (QREFELT $ 47)) D
                                    (QREFELT $ 56))
                          (SPADCALL 2 |c2| (QREFELT $ 54))
                          (QREFELT $ 46)))))))))) 

(SDEFUN |SOLVEFOR;cubic;4FL;17|
        ((|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ |List| F))
        (SPROG
         ((#1=#:G166 NIL) (|u| NIL) (#2=#:G165 NIL) (S (F)) (D (F)) (R (F))
          (Q (F)) (#3=#:G164 NIL) (#4=#:G163 NIL) (P (F)) (#5=#:G162 NIL)
          (#6=#:G161 NIL) (|a3| (F)) (|a2| (F)) (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c3| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 23) (QREFELT $ 48))
                 (CONS (|spadConstant| $ 23)
                       (SPADCALL |c3| |c2| |c1| (QREFELT $ 26))))
                (#7='T
                 (SEQ (LETT |a1| (SPADCALL |c2| |c3| (QREFELT $ 46)))
                      (LETT |a2| (SPADCALL |c1| |c3| (QREFELT $ 46)))
                      (LETT |a3| (SPADCALL |c0| |c3| (QREFELT $ 46)))
                      (COND
                       ((SPADCALL |a1| (|spadConstant| $ 23) (QREFELT $ 48))
                        (COND
                         ((SPADCALL |a2| (|spadConstant| $ 23) (QREFELT $ 48))
                          (EXIT
                           (PROGN
                            (LETT #6# NIL)
                            (SEQ (LETT |u| NIL)
                                 (LETT #5#
                                       (LIST (|spadConstant| $ 20)
                                             (QREFELT $ 58)
                                             (SPADCALL (QREFELT $ 58) 2
                                                       (QREFELT $ 53))))
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |u| (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6#
                                         (CONS
                                          (SPADCALL |u|
                                                    (SPADCALL
                                                     (SPADCALL |a3|
                                                               (QREFELT $ 47))
                                                     (SPADCALL 1 3
                                                               (QREFELT $ 50))
                                                     (QREFELT $ 51))
                                                    (QREFELT $ 55))
                                          #6#))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT (NREVERSE #6#)))))))))
                      (LETT P
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL |a1| (SPADCALL 3 (QREFELT $ 57))
                                        (QREFELT $ 46))
                              (QREFELT $ 47))
                             $))
                      (EXIT
                       (COND
                        ((|SOLVEFOR;equ| (SPADCALL |a1| 2 (QREFELT $ 53))
                          (SPADCALL 3 |a2| (QREFELT $ 54)) $)
                         (SEQ
                          (LETT S
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a3| (QREFELT $ 47))
                                            (SPADCALL
                                             (SPADCALL |a1| 3 (QREFELT $ 53))
                                             (SPADCALL 27 (QREFELT $ 57))
                                             (QREFELT $ 46))
                                            (QREFELT $ 56))
                                  (SPADCALL 1 3 (QREFELT $ 50)) (QREFELT $ 51))
                                 $))
                          (EXIT
                           (PROGN
                            (LETT #4# NIL)
                            (SEQ (LETT |u| NIL)
                                 (LETT #3#
                                       (LIST (|spadConstant| $ 20)
                                             (QREFELT $ 58)
                                             (SPADCALL (QREFELT $ 58) 2
                                                       (QREFELT $ 53))))
                                 G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |u| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (SPADCALL P
                                                    (SPADCALL S |u|
                                                              (QREFELT $ 55))
                                                    (QREFELT $ 56))
                                          #4#))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT (NREVERSE #4#)))))))
                        (#7#
                         (SEQ
                          (LETT Q
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 3 |a2| (QREFELT $ 54))
                                            (SPADCALL |a1| 2 (QREFELT $ 53))
                                            (QREFELT $ 43))
                                  (SPADCALL 9 (QREFELT $ 57)) (QREFELT $ 46))
                                 $))
                          (LETT R
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 9 |a1| (QREFELT $ 54))
                                              |a2| (QREFELT $ 55))
                                    (SPADCALL 27 |a3| (QREFELT $ 54))
                                    (QREFELT $ 43))
                                   (SPADCALL 2 (SPADCALL |a1| 3 (QREFELT $ 53))
                                             (QREFELT $ 54))
                                   (QREFELT $ 43))
                                  (SPADCALL 54 (QREFELT $ 57)) (QREFELT $ 46))
                                 $))
                          (LETT D
                                (SPADCALL
                                 (|SOLVEFOR;part|
                                  (SPADCALL (SPADCALL Q 3 (QREFELT $ 53))
                                            (SPADCALL R 2 (QREFELT $ 53))
                                            (QREFELT $ 56))
                                  $)
                                 (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51)))
                          (LETT S
                                (SPADCALL
                                 (|SOLVEFOR;part| (SPADCALL R D (QREFELT $ 56))
                                  $)
                                 (SPADCALL 1 3 (QREFELT $ 50)) (QREFELT $ 51)))
                          (EXIT
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |u| NIL)
                                 (LETT #1#
                                       (LIST (|spadConstant| $ 20)
                                             (QREFELT $ 58)
                                             (SPADCALL (QREFELT $ 58) 2
                                                       (QREFELT $ 53))))
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |u| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL P
                                                     (SPADCALL S |u|
                                                               (QREFELT $ 55))
                                                     (QREFELT $ 56))
                                           (SPADCALL Q
                                                     (SPADCALL S |u|
                                                               (QREFELT $ 55))
                                                     (QREFELT $ 46))
                                           (QREFELT $ 43))
                                          #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#)))))))))))))))) 

(SDEFUN |SOLVEFOR;aCubic;5F;18| ((|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ F))
        (SPROG
         ((S (F)) (D (F)) (R (F)) (Q (F)) (P (F)) (|a3| (F)) (|a2| (F))
          (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c3| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 23) (QREFELT $ 48))
                 (|spadConstant| $ 23))
                (#1='T
                 (SEQ (LETT |a1| (SPADCALL |c2| |c3| (QREFELT $ 46)))
                      (LETT |a2| (SPADCALL |c1| |c3| (QREFELT $ 46)))
                      (LETT |a3| (SPADCALL |c0| |c3| (QREFELT $ 46)))
                      (COND
                       ((SPADCALL |a1| (|spadConstant| $ 23) (QREFELT $ 48))
                        (COND
                         ((SPADCALL |a2| (|spadConstant| $ 23) (QREFELT $ 48))
                          (EXIT
                           (SPADCALL (SPADCALL |a3| (QREFELT $ 47))
                                     (SPADCALL 1 3 (QREFELT $ 50))
                                     (QREFELT $ 51)))))))
                      (LETT P
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL |a1| (SPADCALL 3 (QREFELT $ 57))
                                        (QREFELT $ 46))
                              (QREFELT $ 47))
                             $))
                      (EXIT
                       (COND
                        ((|SOLVEFOR;equ| (SPADCALL |a1| 2 (QREFELT $ 53))
                          (SPADCALL 3 |a2| (QREFELT $ 54)) $)
                         (SEQ
                          (LETT S
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a3| (QREFELT $ 47))
                                            (SPADCALL
                                             (SPADCALL |a1| 3 (QREFELT $ 53))
                                             (SPADCALL 27 (QREFELT $ 57))
                                             (QREFELT $ 46))
                                            (QREFELT $ 56))
                                  (SPADCALL 1 3 (QREFELT $ 50)) (QREFELT $ 51))
                                 $))
                          (EXIT (SPADCALL P S (QREFELT $ 56)))))
                        (#1#
                         (SEQ
                          (LETT Q
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 3 |a2| (QREFELT $ 54))
                                            (SPADCALL |a1| 2 (QREFELT $ 53))
                                            (QREFELT $ 43))
                                  (SPADCALL 9 (QREFELT $ 57)) (QREFELT $ 46))
                                 $))
                          (LETT R
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 9 |a1| (QREFELT $ 54))
                                              |a2| (QREFELT $ 55))
                                    (SPADCALL 27 |a3| (QREFELT $ 54))
                                    (QREFELT $ 43))
                                   (SPADCALL 2 (SPADCALL |a1| 3 (QREFELT $ 53))
                                             (QREFELT $ 54))
                                   (QREFELT $ 43))
                                  (SPADCALL 54 (QREFELT $ 57)) (QREFELT $ 46))
                                 $))
                          (LETT D
                                (SPADCALL
                                 (|SOLVEFOR;part|
                                  (SPADCALL (SPADCALL Q 3 (QREFELT $ 53))
                                            (SPADCALL R 2 (QREFELT $ 53))
                                            (QREFELT $ 56))
                                  $)
                                 (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51)))
                          (LETT S
                                (SPADCALL
                                 (|SOLVEFOR;part| (SPADCALL R D (QREFELT $ 56))
                                  $)
                                 (SPADCALL 1 3 (QREFELT $ 50)) (QREFELT $ 51)))
                          (EXIT
                           (SPADCALL (SPADCALL P S (QREFELT $ 56))
                                     (SPADCALL Q S (QREFELT $ 46))
                                     (QREFELT $ 43)))))))))))))) 

(SDEFUN |SOLVEFOR;quartic;5FL;19|
        ((|c4| F) (|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ |List| F))
        (SPROG
         ((#1=#:G178 NIL) (|s| NIL) (#2=#:G177 NIL) (|slist| (|List| F))
          (|rt| (F)) (|t0| (F)) (|r| (F)) (|q| (F)) (|p| (F)) (|a4| (F))
          (|a3| (F)) (|a2| (F)) (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c4| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 23) (QREFELT $ 48))
                 (CONS (|spadConstant| $ 23)
                       (SPADCALL |c4| |c3| |c2| |c1| (QREFELT $ 27))))
                (#3='T
                 (SEQ (LETT |a1| (SPADCALL |c3| |c4| (QREFELT $ 46)))
                      (LETT |a2| (SPADCALL |c2| |c4| (QREFELT $ 46)))
                      (LETT |a3| (SPADCALL |c1| |c4| (QREFELT $ 46)))
                      (LETT |a4| (SPADCALL |c0| |c4| (QREFELT $ 46)))
                      (COND
                       ((SPADCALL |a1| (|spadConstant| $ 23) (QREFELT $ 48))
                        (COND
                         ((SPADCALL |a2| (|spadConstant| $ 23) (QREFELT $ 48))
                          (COND
                           ((SPADCALL |a3| (|spadConstant| $ 23)
                                      (QREFELT $ 48))
                            (EXIT
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 20)
                                        (|spadConstant| $ 23)
                                        (SPADCALL
                                         (SPADCALL |a4| (QREFELT $ 47))
                                         (SPADCALL 1 2 (QREFELT $ 50))
                                         (QREFELT $ 51))
                                        (QREFELT $ 26))
                              (SPADCALL (|spadConstant| $ 20)
                                        (|spadConstant| $ 23)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |a4| (QREFELT $ 47))
                                          (SPADCALL 1 2 (QREFELT $ 50))
                                          (QREFELT $ 51))
                                         (QREFELT $ 47))
                                        (QREFELT $ 26))
                              (QREFELT $ 29)))))))))
                      (LETT |p|
                            (|SOLVEFOR;part|
                             (SPADCALL |a2|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL 3 |a1| (QREFELT $ 54)) |a1|
                                         (QREFELT $ 55))
                                        (SPADCALL 8 (QREFELT $ 57))
                                        (QREFELT $ 46))
                                       (QREFELT $ 43))
                             $))
                      (LETT |q|
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL |a3|
                                        (SPADCALL
                                         (SPADCALL |a1| |a2| (QREFELT $ 55))
                                         (SPADCALL 2 (QREFELT $ 57))
                                         (QREFELT $ 46))
                                        (QREFELT $ 43))
                              (SPADCALL (SPADCALL |a1| 3 (QREFELT $ 53))
                                        (SPADCALL 8 (QREFELT $ 57))
                                        (QREFELT $ 46))
                              (QREFELT $ 56))
                             $))
                      (LETT |r|
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |a4|
                                         (SPADCALL
                                          (SPADCALL |a1| |a3| (QREFELT $ 55))
                                          (SPADCALL 4 (QREFELT $ 57))
                                          (QREFELT $ 46))
                                         (QREFELT $ 43))
                               (SPADCALL
                                (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 53)) |a2|
                                          (QREFELT $ 55))
                                (SPADCALL 16 (QREFELT $ 57)) (QREFELT $ 46))
                               (QREFELT $ 56))
                              (SPADCALL
                               (SPADCALL 3 (SPADCALL |a1| 4 (QREFELT $ 53))
                                         (QREFELT $ 54))
                               (SPADCALL 256 (QREFELT $ 57)) (QREFELT $ 46))
                              (QREFELT $ 43))
                             $))
                      (COND
                       ((|SOLVEFOR;equ| |q| (|spadConstant| $ 23) $)
                        (LETT |t0|
                              (|SOLVEFOR;part|
                               (SPADCALL 2
                                         (SPADCALL |r|
                                                   (SPADCALL 1 2
                                                             (QREFELT $ 50))
                                                   (QREFELT $ 51))
                                         (QREFELT $ 54))
                               $)))
                       (#3#
                        (LETT |t0|
                              (SPADCALL (|spadConstant| $ 20)
                                        (SPADCALL |p| (QREFELT $ 47))
                                        (SPADCALL
                                         (SPADCALL 4 |r| (QREFELT $ 54))
                                         (QREFELT $ 47))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL 4 |p| (QREFELT $ 54)) |r|
                                          (QREFELT $ 55))
                                         (SPADCALL |q| 2 (QREFELT $ 53))
                                         (QREFELT $ 43))
                                        (QREFELT $ 33)))))
                      (LETT |rt|
                            (SPADCALL
                             (|SOLVEFOR;part|
                              (SPADCALL |t0| |p| (QREFELT $ 43)) $)
                             (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51)))
                      (LETT |slist|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 20) |rt|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |q| |rt| (QREFELT $ 46))
                                          (QREFELT $ 47))
                                         |t0| (QREFELT $ 56))
                                        (SPADCALL 2 (QREFELT $ 57))
                                        (QREFELT $ 46))
                                       (QREFELT $ 26))
                             (SPADCALL (|spadConstant| $ 20)
                                       (SPADCALL |rt| (QREFELT $ 47))
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |q| |rt| (QREFELT $ 46))
                                         |t0| (QREFELT $ 56))
                                        (SPADCALL 2 (QREFELT $ 57))
                                        (QREFELT $ 46))
                                       (QREFELT $ 26))
                             (QREFELT $ 29)))
                      (EXIT
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |s| NIL) (LETT #1# |slist|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL |s|
                                                (SPADCALL |a1|
                                                          (SPADCALL 4
                                                                    (QREFELT $
                                                                             57))
                                                          (QREFELT $ 46))
                                                (QREFELT $ 43))
                                      #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |SOLVEFOR;aQuartic;6F;20|
        ((|c4| F) (|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ F))
        (SPROG
         ((|s| (F)) (|rt| (F)) (|t0| (F)) (|r| (F)) (|q| (F)) (|p| (F))
          (|a4| (F)) (|a3| (F)) (|a2| (F)) (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c4| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 23) (QREFELT $ 48))
                 (|spadConstant| $ 23))
                (#1='T
                 (SEQ (LETT |a1| (SPADCALL |c3| |c4| (QREFELT $ 46)))
                      (LETT |a2| (SPADCALL |c2| |c4| (QREFELT $ 46)))
                      (LETT |a3| (SPADCALL |c1| |c4| (QREFELT $ 46)))
                      (LETT |a4| (SPADCALL |c0| |c4| (QREFELT $ 46)))
                      (COND
                       ((SPADCALL |a1| (|spadConstant| $ 23) (QREFELT $ 48))
                        (COND
                         ((SPADCALL |a2| (|spadConstant| $ 23) (QREFELT $ 48))
                          (COND
                           ((SPADCALL |a3| (|spadConstant| $ 23)
                                      (QREFELT $ 48))
                            (EXIT
                             (SPADCALL (SPADCALL |a4| (QREFELT $ 47))
                                       (SPADCALL 1 4 (QREFELT $ 50))
                                       (QREFELT $ 51)))))))))
                      (LETT |p|
                            (|SOLVEFOR;part|
                             (SPADCALL |a2|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL 3 |a1| (QREFELT $ 54)) |a1|
                                         (QREFELT $ 55))
                                        (SPADCALL 8 (QREFELT $ 57))
                                        (QREFELT $ 46))
                                       (QREFELT $ 43))
                             $))
                      (LETT |q|
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL |a3|
                                        (SPADCALL
                                         (SPADCALL |a1| |a2| (QREFELT $ 55))
                                         (SPADCALL 2 (QREFELT $ 57))
                                         (QREFELT $ 46))
                                        (QREFELT $ 43))
                              (SPADCALL
                               (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 53)) |a1|
                                         (QREFELT $ 55))
                               (SPADCALL 8 (QREFELT $ 57)) (QREFELT $ 46))
                              (QREFELT $ 56))
                             $))
                      (LETT |r|
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |a4|
                                         (SPADCALL
                                          (SPADCALL |a1| |a3| (QREFELT $ 55))
                                          (SPADCALL 4 (QREFELT $ 57))
                                          (QREFELT $ 46))
                                         (QREFELT $ 43))
                               (SPADCALL
                                (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 53)) |a2|
                                          (QREFELT $ 55))
                                (SPADCALL 16 (QREFELT $ 57)) (QREFELT $ 46))
                               (QREFELT $ 56))
                              (SPADCALL
                               (SPADCALL 3 (SPADCALL |a1| 4 (QREFELT $ 53))
                                         (QREFELT $ 54))
                               (SPADCALL 256 (QREFELT $ 57)) (QREFELT $ 46))
                              (QREFELT $ 43))
                             $))
                      (COND
                       ((|SOLVEFOR;equ| |q| (|spadConstant| $ 23) $)
                        (LETT |t0|
                              (|SOLVEFOR;part|
                               (SPADCALL 2
                                         (SPADCALL |r|
                                                   (SPADCALL 1 2
                                                             (QREFELT $ 50))
                                                   (QREFELT $ 51))
                                         (QREFELT $ 54))
                               $)))
                       (#1#
                        (LETT |t0|
                              (SPADCALL (|spadConstant| $ 20)
                                        (SPADCALL |p| (QREFELT $ 47))
                                        (SPADCALL
                                         (SPADCALL 4 |r| (QREFELT $ 54))
                                         (QREFELT $ 47))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL 4 |p| (QREFELT $ 54)) |r|
                                          (QREFELT $ 55))
                                         (SPADCALL |q| 2 (QREFELT $ 53))
                                         (QREFELT $ 43))
                                        (QREFELT $ 33)))))
                      (LETT |rt|
                            (SPADCALL
                             (|SOLVEFOR;part|
                              (SPADCALL |t0| |p| (QREFELT $ 43)) $)
                             (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51)))
                      (LETT |s|
                            (SPADCALL (|spadConstant| $ 20) |rt|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |q| |rt| (QREFELT $ 46))
                                         (QREFELT $ 47))
                                        |t0| (QREFELT $ 56))
                                       (SPADCALL 2 (QREFELT $ 57))
                                       (QREFELT $ 46))
                                      (QREFELT $ 32)))
                      (EXIT
                       (SPADCALL |s|
                                 (SPADCALL |a1| (SPADCALL 4 (QREFELT $ 57))
                                           (QREFELT $ 46))
                                 (QREFELT $ 43)))))))))) 

(DECLAIM (NOTINLINE |PolynomialSolveByFormulas;|)) 

(DEFUN |PolynomialSolveByFormulas| (&REST #1=#:G183)
  (SPROG NIL
         (PROG (#2=#:G184)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialSolveByFormulas|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialSolveByFormulas;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialSolveByFormulas|)))))))))) 

(DEFUN |PolynomialSolveByFormulas;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|PolynomialSolveByFormulas| DV$1 DV$2))
          (LETT $ (GETREFV 59))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PolynomialSolveByFormulas|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 58
                    (SPADCALL
                     (SPADCALL (SPADCALL (|spadConstant| $ 20) (QREFELT $ 47))
                               (SPADCALL
                                (SPADCALL (SPADCALL 3 (QREFELT $ 57))
                                          (QREFELT $ 47))
                                (SPADCALL 1 2 (QREFELT $ 50)) (QREFELT $ 51))
                               (QREFELT $ 56))
                     (SPADCALL 2 (QREFELT $ 57)) (QREFELT $ 46)))
          $))) 

(MAKEPROP '|PolynomialSolveByFormulas| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Factored| $) (0 . |squareFree|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 10) (|:| |factor| 6) (|:| |exponent| 17))
              (|List| 11) (|Factored| 6) (5 . |factorList|) (|Integer|)
              (10 . |elt|) (|NonNegativeInteger|) (16 . |degree|) (21 . |One|)
              (25 . |One|) (29 . |coefficient|) (35 . |Zero|) (39 . |Zero|)
              (|List| 7) |SOLVEFOR;linear;2FL;13| |SOLVEFOR;quadratic;3FL;15|
              |SOLVEFOR;cubic;4FL;17| |SOLVEFOR;quartic;5FL;19| (43 . |append|)
              |SOLVEFOR;solve;UPL;3| |SOLVEFOR;aLinear;3F;14|
              |SOLVEFOR;aQuadratic;4F;16| |SOLVEFOR;aCubic;5F;18|
              |SOLVEFOR;aQuartic;6F;20| |SOLVEFOR;particularSolution;UPF;4|
              (|Boolean|) (49 . ~=) (55 . |characteristic|)
              |SOLVEFOR;linear;UPL;8| |SOLVEFOR;quadratic;UPL;9|
              |SOLVEFOR;cubic;UPL;10| |SOLVEFOR;quartic;UPL;11| (59 . -)
              (|Union| $ '"failed") (65 . |recip|) (70 . /) (76 . -) (81 . =)
              (|Fraction| 15) (87 . /) (93 . ^) (|PositiveInteger|) (99 . ^)
              (105 . *) (111 . *) (117 . +) (123 . |coerce|) '|w3|)
           '#(|solve| 128 |quartic| 133 |quadratic| 147 |particularSolution|
              159 |linear| 164 |cubic| 175 |aQuartic| 188 |aQuadratic| 197
              |aLinear| 204 |aCubic| 210)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|solve| ((|List| |#2|) |#1|)) T)
                                   '((|particularSolution| (|#2| |#1|)) T)
                                   '((|linear| ((|List| |#2|) |#1|)) T)
                                   '((|quadratic| ((|List| |#2|) |#1|)) T)
                                   '((|cubic| ((|List| |#2|) |#1|)) T)
                                   '((|quartic| ((|List| |#2|) |#1|)) T)
                                   '((|linear| ((|List| |#2|) |#2| |#2|)) T)
                                   '((|quadratic|
                                      ((|List| |#2|) |#2| |#2| |#2|))
                                     T)
                                   '((|cubic|
                                      ((|List| |#2|) |#2| |#2| |#2| |#2|))
                                     T)
                                   '((|quartic|
                                      ((|List| |#2|) |#2| |#2| |#2| |#2| |#2|))
                                     T)
                                   '((|aLinear| (|#2| |#2| |#2|)) T)
                                   '((|aQuadratic| (|#2| |#2| |#2| |#2|)) T)
                                   '((|aCubic| (|#2| |#2| |#2| |#2| |#2|)) T)
                                   '((|aQuartic|
                                      (|#2| |#2| |#2| |#2| |#2| |#2|))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 57
                                            '(1 6 8 0 9 1 13 12 0 14 2 12 11 0
                                              15 16 1 6 17 0 18 0 6 0 19 0 7 0
                                              20 2 6 7 0 17 21 0 6 0 22 0 7 0
                                              23 2 24 0 0 0 29 2 7 36 0 0 37 0
                                              7 17 38 2 7 0 0 0 43 1 7 44 0 45
                                              2 7 0 0 0 46 1 7 0 0 47 2 7 36 0
                                              0 48 2 49 0 15 15 50 2 7 0 0 49
                                              51 2 7 0 0 52 53 2 7 0 52 0 54 2
                                              7 0 0 0 55 2 7 0 0 0 56 1 7 0 15
                                              57 1 0 24 6 30 1 0 24 6 42 5 0 24
                                              7 7 7 7 7 28 1 0 24 6 40 3 0 24 7
                                              7 7 26 1 0 7 6 35 1 0 24 6 39 2 0
                                              24 7 7 25 1 0 24 6 41 4 0 24 7 7
                                              7 7 27 5 0 7 7 7 7 7 7 34 3 0 7 7
                                              7 7 32 2 0 7 7 7 31 4 0 7 7 7 7 7
                                              33)))))
           '|lookupComplete|)) 
