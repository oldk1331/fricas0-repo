
(SDEFUN |SOLVEFOR;mapSolve;UPMR;1|
        ((|p| UP) (|fn| |Mapping| F F)
         ($ |Record| (|:| |solns| (|List| F))
          (|:| |maps| (|List| (|Record| (|:| |arg| F) (|:| |res| F))))))
        (SPROG ((|locmap| (|Mapping| F F)) (|slist| (|List| F)))
               (SEQ (LETT |locmap| |fn|) (SETELT $ 10 (IDENTITY |locmap|))
                    (SETELT $ 9 'T) (SETELT $ 8 NIL)
                    (LETT |slist| (SPADCALL |p| (QREFELT $ 12)))
                    (SETELT $ 9 NIL)
                    (LETT |locmap| (LIST #'|SOLVEFOR;mapSolve;UPMR;1!0|))
                    (SETELT $ 10 (IDENTITY |locmap|))
                    (EXIT (CONS |slist| (QREFELT $ 8)))))) 

(SDEFUN |SOLVEFOR;mapSolve;UPMR;1!0| ((|x| NIL) ($$ NIL)) (IDENTITY |x|)) 

(SDEFUN |SOLVEFOR;part| ((|s| F) ($ F))
        (SPROG ((|t| (F)))
               (SEQ
                (COND
                 ((QREFELT $ 9)
                  (SEQ (LETT |t| (SPADCALL |s| (QREFELT $ 10)))
                       (EXIT
                        (COND ((SPADCALL |t| |s| (QREFELT $ 18)) |s|)
                              (#1='T
                               (SEQ
                                (SETELT $ 8
                                        (CONS (CONS |t| |s|) (QREFELT $ 8)))
                                (EXIT |t|)))))))
                 (#1# |s|))))) 

(SDEFUN |SOLVEFOR;intsolve| ((|u| UP) ($ |List| F))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |u|
                      (QVELT
                       (SPADCALL
                        (SPADCALL (SPADCALL |u| (QREFELT $ 20)) (QREFELT $ 25))
                        1 (QREFELT $ 27))
                       1))
                (LETT |n| (SPADCALL |u| (QREFELT $ 29)))
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SPADCALL (SPADCALL |u| 1 (QREFELT $ 32))
                             (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 35)))
                  ((EQL |n| 2)
                   (SPADCALL (SPADCALL |u| 2 (QREFELT $ 32))
                             (SPADCALL |u| 1 (QREFELT $ 32))
                             (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 36)))
                  ((EQL |n| 3)
                   (SPADCALL (SPADCALL |u| 3 (QREFELT $ 32))
                             (SPADCALL |u| 2 (QREFELT $ 32))
                             (SPADCALL |u| 1 (QREFELT $ 32))
                             (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 37)))
                  ((EQL |n| 4)
                   (SPADCALL (SPADCALL |u| 4 (QREFELT $ 32))
                             (SPADCALL |u| 3 (QREFELT $ 32))
                             (SPADCALL |u| 2 (QREFELT $ 32))
                             (SPADCALL |u| 1 (QREFELT $ 32))
                             (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 38)))
                  ('T
                   (|error|
                    "All sqfr factors of polynomial must be of degree < 5"))))))) 

(SDEFUN |SOLVEFOR;solve;UPL;4| ((|u| UP) ($ |List| F))
        (SPROG
         ((|ls| (|List| F)) (#1=#:G132 NIL) (|i| NIL) (|lsf| (|List| F))
          (#2=#:G131 NIL) (|f| NIL))
         (SEQ (LETT |ls| NIL)
              (SEQ (LETT |f| NIL)
                   (LETT #2#
                         (SPADCALL (SPADCALL |u| (QREFELT $ 20))
                                   (QREFELT $ 25)))
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
                                      (SPADCALL |lsf| |ls| (QREFELT $ 39)))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ls|)))) 

(SDEFUN |SOLVEFOR;particularSolution;UPF;5| ((|u| UP) ($ F))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |u|
                      (QVELT
                       (SPADCALL
                        (SPADCALL (SPADCALL |u| (QREFELT $ 20)) (QREFELT $ 25))
                        1 (QREFELT $ 27))
                       1))
                (LETT |n| (SPADCALL |u| (QREFELT $ 29)))
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SPADCALL (SPADCALL |u| 1 (QREFELT $ 32))
                             (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 40)))
                  ((EQL |n| 2)
                   (SPADCALL (SPADCALL |u| 2 (QREFELT $ 32))
                             (SPADCALL |u| 1 (QREFELT $ 32))
                             (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 41)))
                  ((EQL |n| 3)
                   (SPADCALL (SPADCALL |u| 3 (QREFELT $ 32))
                             (SPADCALL |u| 2 (QREFELT $ 32))
                             (SPADCALL |u| 1 (QREFELT $ 32))
                             (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 42)))
                  ((EQL |n| 4)
                   (SPADCALL (SPADCALL |u| 4 (QREFELT $ 32))
                             (SPADCALL |u| 3 (QREFELT $ 32))
                             (SPADCALL |u| 2 (QREFELT $ 32))
                             (SPADCALL |u| 1 (QREFELT $ 32))
                             (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 43)))
                  ('T
                   (|error|
                    "All sqfr factors of polynomial must be of degree < 5"))))))) 

(SDEFUN |SOLVEFOR;needDegree| ((|n| |Integer|) (|u| UP) ($ |Boolean|))
        (COND ((EQL (SPADCALL |u| (QREFELT $ 29)) |n|) 'T)
              ('T
               (|error|
                (STRCONC "Polynomial must be of degree " (STRINGIMAGE |n|)))))) 

(SDEFUN |SOLVEFOR;needLcoef| ((|cn| F) ($ |Boolean|))
        (COND ((SPADCALL |cn| (|spadConstant| $ 34) (QREFELT $ 45)) 'T)
              ('T (|error| "Leading coefficient must not be 0.")))) 

(SDEFUN |SOLVEFOR;needChar0| (($ |Boolean|))
        (COND ((EQL (SPADCALL (QREFELT $ 46)) 0) 'T)
              ('T
               (|error|
                "Formula defined only for fields of characteristic 0.")))) 

(SDEFUN |SOLVEFOR;linear;UPL;9| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 1 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 1 (QREFELT $ 32))
                        (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 35))))) 

(SDEFUN |SOLVEFOR;quadratic;UPL;10| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 2 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 2 (QREFELT $ 32))
                        (SPADCALL |u| 1 (QREFELT $ 32))
                        (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 36))))) 

(SDEFUN |SOLVEFOR;cubic;UPL;11| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 3 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 3 (QREFELT $ 32))
                        (SPADCALL |u| 2 (QREFELT $ 32))
                        (SPADCALL |u| 1 (QREFELT $ 32))
                        (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 37))))) 

(SDEFUN |SOLVEFOR;quartic;UPL;12| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 4 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 4 (QREFELT $ 32))
                        (SPADCALL |u| 3 (QREFELT $ 32))
                        (SPADCALL |u| 2 (QREFELT $ 32))
                        (SPADCALL |u| 1 (QREFELT $ 32))
                        (SPADCALL |u| 0 (QREFELT $ 32)) (QREFELT $ 38))))) 

(SDEFUN |SOLVEFOR;equ| ((|x| F) (|y| F) ($ |Boolean|))
        (COND
         ((QEQCAR (SPADCALL (SPADCALL |x| |y| (QREFELT $ 51)) (QREFELT $ 53))
                  1)
          'T)
         ('T NIL))) 

(SDEFUN |SOLVEFOR;linear;2FL;14| ((|c1| F) (|c0| F) ($ |List| F))
        (SEQ (|SOLVEFOR;needLcoef| |c1| $)
             (EXIT
              (LIST
               (SPADCALL (SPADCALL |c0| |c1| (QREFELT $ 54)) (QREFELT $ 55)))))) 

(SDEFUN |SOLVEFOR;aLinear;3F;15| ((|c1| F) (|c0| F) ($ F))
        (|SPADfirst| (SPADCALL |c1| |c0| (QREFELT $ 35)))) 

(SDEFUN |SOLVEFOR;quadratic;3FL;16| ((|c2| F) (|c1| F) (|c0| F) ($ |List| F))
        (SPROG ((D (F)))
               (SEQ (|SOLVEFOR;needLcoef| |c2| $) (|SOLVEFOR;needChar0| $)
                    (EXIT
                     (COND
                      ((SPADCALL |c0| (|spadConstant| $ 34) (QREFELT $ 18))
                       (CONS (|spadConstant| $ 34)
                             (SPADCALL |c2| |c1| (QREFELT $ 35))))
                      ((SPADCALL |c1| (|spadConstant| $ 34) (QREFELT $ 18))
                       (LIST
                        (SPADCALL
                         (SPADCALL (SPADCALL |c0| |c2| (QREFELT $ 54))
                                   (QREFELT $ 55))
                         (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |c0| |c2| (QREFELT $ 54))
                                    (QREFELT $ 55))
                          (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58))
                         (QREFELT $ 55))))
                      ('T
                       (SEQ
                        (LETT D
                              (SPADCALL
                               (|SOLVEFOR;part|
                                (SPADCALL (SPADCALL |c1| 2 (QREFELT $ 60))
                                          (SPADCALL
                                           (SPADCALL 4 |c2| (QREFELT $ 61))
                                           |c0| (QREFELT $ 62))
                                          (QREFELT $ 51))
                                $)
                               (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58)))
                        (EXIT
                         (LIST
                          (SPADCALL
                           (SPADCALL (SPADCALL |c1| (QREFELT $ 55)) D
                                     (QREFELT $ 63))
                           (SPADCALL 2 |c2| (QREFELT $ 61)) (QREFELT $ 54))
                          (SPADCALL
                           (SPADCALL (SPADCALL |c1| (QREFELT $ 55)) D
                                     (QREFELT $ 51))
                           (SPADCALL 2 |c2| (QREFELT $ 61))
                           (QREFELT $ 54))))))))))) 

(SDEFUN |SOLVEFOR;aQuadratic;4F;17| ((|c2| F) (|c1| F) (|c0| F) ($ F))
        (SPROG ((D (F)))
               (SEQ (|SOLVEFOR;needLcoef| |c2| $) (|SOLVEFOR;needChar0| $)
                    (EXIT
                     (COND
                      ((SPADCALL |c0| (|spadConstant| $ 34) (QREFELT $ 18))
                       (|spadConstant| $ 34))
                      ((SPADCALL |c1| (|spadConstant| $ 34) (QREFELT $ 18))
                       (SPADCALL
                        (SPADCALL (SPADCALL |c0| |c2| (QREFELT $ 54))
                                  (QREFELT $ 55))
                        (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58)))
                      ('T
                       (SEQ
                        (LETT D
                              (SPADCALL
                               (|SOLVEFOR;part|
                                (SPADCALL (SPADCALL |c1| 2 (QREFELT $ 60))
                                          (SPADCALL
                                           (SPADCALL 4 |c2| (QREFELT $ 61))
                                           |c0| (QREFELT $ 62))
                                          (QREFELT $ 51))
                                $)
                               (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58)))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |c1| (QREFELT $ 55)) D
                                    (QREFELT $ 63))
                          (SPADCALL 2 |c2| (QREFELT $ 61))
                          (QREFELT $ 54)))))))))) 

(SDEFUN |SOLVEFOR;cubic;4FL;18|
        ((|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ |List| F))
        (SPROG
         ((#1=#:G176 NIL) (|u| NIL) (#2=#:G175 NIL) (S (F)) (D (F)) (R (F))
          (Q (F)) (#3=#:G174 NIL) (#4=#:G173 NIL) (P (F)) (#5=#:G172 NIL)
          (#6=#:G171 NIL) (|a3| (F)) (|a2| (F)) (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c3| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 34) (QREFELT $ 18))
                 (CONS (|spadConstant| $ 34)
                       (SPADCALL |c3| |c2| |c1| (QREFELT $ 36))))
                (#7='T
                 (SEQ (LETT |a1| (SPADCALL |c2| |c3| (QREFELT $ 54)))
                      (LETT |a2| (SPADCALL |c1| |c3| (QREFELT $ 54)))
                      (LETT |a3| (SPADCALL |c0| |c3| (QREFELT $ 54)))
                      (COND
                       ((SPADCALL |a1| (|spadConstant| $ 34) (QREFELT $ 18))
                        (COND
                         ((SPADCALL |a2| (|spadConstant| $ 34) (QREFELT $ 18))
                          (EXIT
                           (PROGN
                            (LETT #6# NIL)
                            (SEQ (LETT |u| NIL)
                                 (LETT #5#
                                       (LIST (|spadConstant| $ 31)
                                             (QREFELT $ 65)
                                             (SPADCALL (QREFELT $ 65) 2
                                                       (QREFELT $ 60))))
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
                                                               (QREFELT $ 55))
                                                     (SPADCALL 1 3
                                                               (QREFELT $ 57))
                                                     (QREFELT $ 58))
                                                    (QREFELT $ 62))
                                          #6#))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT (NREVERSE #6#)))))))))
                      (LETT P
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL |a1| (SPADCALL 3 (QREFELT $ 64))
                                        (QREFELT $ 54))
                              (QREFELT $ 55))
                             $))
                      (EXIT
                       (COND
                        ((|SOLVEFOR;equ| (SPADCALL |a1| 2 (QREFELT $ 60))
                          (SPADCALL 3 |a2| (QREFELT $ 61)) $)
                         (SEQ
                          (LETT S
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a3| (QREFELT $ 55))
                                            (SPADCALL
                                             (SPADCALL |a1| 3 (QREFELT $ 60))
                                             (SPADCALL 27 (QREFELT $ 64))
                                             (QREFELT $ 54))
                                            (QREFELT $ 63))
                                  (SPADCALL 1 3 (QREFELT $ 57)) (QREFELT $ 58))
                                 $))
                          (EXIT
                           (PROGN
                            (LETT #4# NIL)
                            (SEQ (LETT |u| NIL)
                                 (LETT #3#
                                       (LIST (|spadConstant| $ 31)
                                             (QREFELT $ 65)
                                             (SPADCALL (QREFELT $ 65) 2
                                                       (QREFELT $ 60))))
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
                                                              (QREFELT $ 62))
                                                    (QREFELT $ 63))
                                          #4#))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT (NREVERSE #4#)))))))
                        (#7#
                         (SEQ
                          (LETT Q
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 3 |a2| (QREFELT $ 61))
                                            (SPADCALL |a1| 2 (QREFELT $ 60))
                                            (QREFELT $ 51))
                                  (SPADCALL 9 (QREFELT $ 64)) (QREFELT $ 54))
                                 $))
                          (LETT R
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 9 |a1| (QREFELT $ 61))
                                              |a2| (QREFELT $ 62))
                                    (SPADCALL 27 |a3| (QREFELT $ 61))
                                    (QREFELT $ 51))
                                   (SPADCALL 2 (SPADCALL |a1| 3 (QREFELT $ 60))
                                             (QREFELT $ 61))
                                   (QREFELT $ 51))
                                  (SPADCALL 54 (QREFELT $ 64)) (QREFELT $ 54))
                                 $))
                          (LETT D
                                (SPADCALL
                                 (|SOLVEFOR;part|
                                  (SPADCALL (SPADCALL Q 3 (QREFELT $ 60))
                                            (SPADCALL R 2 (QREFELT $ 60))
                                            (QREFELT $ 63))
                                  $)
                                 (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58)))
                          (LETT S
                                (SPADCALL
                                 (|SOLVEFOR;part| (SPADCALL R D (QREFELT $ 63))
                                  $)
                                 (SPADCALL 1 3 (QREFELT $ 57)) (QREFELT $ 58)))
                          (EXIT
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |u| NIL)
                                 (LETT #1#
                                       (LIST (|spadConstant| $ 31)
                                             (QREFELT $ 65)
                                             (SPADCALL (QREFELT $ 65) 2
                                                       (QREFELT $ 60))))
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
                                                               (QREFELT $ 62))
                                                     (QREFELT $ 63))
                                           (SPADCALL Q
                                                     (SPADCALL S |u|
                                                               (QREFELT $ 62))
                                                     (QREFELT $ 54))
                                           (QREFELT $ 51))
                                          #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#)))))))))))))))) 

(SDEFUN |SOLVEFOR;aCubic;5F;19| ((|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ F))
        (SPROG
         ((S (F)) (D (F)) (R (F)) (Q (F)) (P (F)) (|a3| (F)) (|a2| (F))
          (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c3| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 34) (QREFELT $ 18))
                 (|spadConstant| $ 34))
                (#1='T
                 (SEQ (LETT |a1| (SPADCALL |c2| |c3| (QREFELT $ 54)))
                      (LETT |a2| (SPADCALL |c1| |c3| (QREFELT $ 54)))
                      (LETT |a3| (SPADCALL |c0| |c3| (QREFELT $ 54)))
                      (COND
                       ((SPADCALL |a1| (|spadConstant| $ 34) (QREFELT $ 18))
                        (COND
                         ((SPADCALL |a2| (|spadConstant| $ 34) (QREFELT $ 18))
                          (EXIT
                           (SPADCALL (SPADCALL |a3| (QREFELT $ 55))
                                     (SPADCALL 1 3 (QREFELT $ 57))
                                     (QREFELT $ 58)))))))
                      (LETT P
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL |a1| (SPADCALL 3 (QREFELT $ 64))
                                        (QREFELT $ 54))
                              (QREFELT $ 55))
                             $))
                      (EXIT
                       (COND
                        ((|SOLVEFOR;equ| (SPADCALL |a1| 2 (QREFELT $ 60))
                          (SPADCALL 3 |a2| (QREFELT $ 61)) $)
                         (SEQ
                          (LETT S
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a3| (QREFELT $ 55))
                                            (SPADCALL
                                             (SPADCALL |a1| 3 (QREFELT $ 60))
                                             (SPADCALL 27 (QREFELT $ 64))
                                             (QREFELT $ 54))
                                            (QREFELT $ 63))
                                  (SPADCALL 1 3 (QREFELT $ 57)) (QREFELT $ 58))
                                 $))
                          (EXIT (SPADCALL P S (QREFELT $ 63)))))
                        (#1#
                         (SEQ
                          (LETT Q
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 3 |a2| (QREFELT $ 61))
                                            (SPADCALL |a1| 2 (QREFELT $ 60))
                                            (QREFELT $ 51))
                                  (SPADCALL 9 (QREFELT $ 64)) (QREFELT $ 54))
                                 $))
                          (LETT R
                                (|SOLVEFOR;part|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 9 |a1| (QREFELT $ 61))
                                              |a2| (QREFELT $ 62))
                                    (SPADCALL 27 |a3| (QREFELT $ 61))
                                    (QREFELT $ 51))
                                   (SPADCALL 2 (SPADCALL |a1| 3 (QREFELT $ 60))
                                             (QREFELT $ 61))
                                   (QREFELT $ 51))
                                  (SPADCALL 54 (QREFELT $ 64)) (QREFELT $ 54))
                                 $))
                          (LETT D
                                (SPADCALL
                                 (|SOLVEFOR;part|
                                  (SPADCALL (SPADCALL Q 3 (QREFELT $ 60))
                                            (SPADCALL R 2 (QREFELT $ 60))
                                            (QREFELT $ 63))
                                  $)
                                 (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58)))
                          (LETT S
                                (SPADCALL
                                 (|SOLVEFOR;part| (SPADCALL R D (QREFELT $ 63))
                                  $)
                                 (SPADCALL 1 3 (QREFELT $ 57)) (QREFELT $ 58)))
                          (EXIT
                           (SPADCALL (SPADCALL P S (QREFELT $ 63))
                                     (SPADCALL Q S (QREFELT $ 54))
                                     (QREFELT $ 51)))))))))))))) 

(SDEFUN |SOLVEFOR;quartic;5FL;20|
        ((|c4| F) (|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ |List| F))
        (SPROG
         ((#1=#:G188 NIL) (|s| NIL) (#2=#:G187 NIL) (|slist| (|List| F))
          (|rt| (F)) (|t0| (F)) (|r| (F)) (|q| (F)) (|p| (F)) (|a4| (F))
          (|a3| (F)) (|a2| (F)) (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c4| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 34) (QREFELT $ 18))
                 (CONS (|spadConstant| $ 34)
                       (SPADCALL |c4| |c3| |c2| |c1| (QREFELT $ 37))))
                (#3='T
                 (SEQ (LETT |a1| (SPADCALL |c3| |c4| (QREFELT $ 54)))
                      (LETT |a2| (SPADCALL |c2| |c4| (QREFELT $ 54)))
                      (LETT |a3| (SPADCALL |c1| |c4| (QREFELT $ 54)))
                      (LETT |a4| (SPADCALL |c0| |c4| (QREFELT $ 54)))
                      (COND
                       ((SPADCALL |a1| (|spadConstant| $ 34) (QREFELT $ 18))
                        (COND
                         ((SPADCALL |a2| (|spadConstant| $ 34) (QREFELT $ 18))
                          (COND
                           ((SPADCALL |a3| (|spadConstant| $ 34)
                                      (QREFELT $ 18))
                            (EXIT
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 31)
                                        (|spadConstant| $ 34)
                                        (SPADCALL
                                         (SPADCALL |a4| (QREFELT $ 55))
                                         (SPADCALL 1 2 (QREFELT $ 57))
                                         (QREFELT $ 58))
                                        (QREFELT $ 36))
                              (SPADCALL (|spadConstant| $ 31)
                                        (|spadConstant| $ 34)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |a4| (QREFELT $ 55))
                                          (SPADCALL 1 2 (QREFELT $ 57))
                                          (QREFELT $ 58))
                                         (QREFELT $ 55))
                                        (QREFELT $ 36))
                              (QREFELT $ 39)))))))))
                      (LETT |p|
                            (|SOLVEFOR;part|
                             (SPADCALL |a2|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL 3 |a1| (QREFELT $ 61)) |a1|
                                         (QREFELT $ 62))
                                        (SPADCALL 8 (QREFELT $ 64))
                                        (QREFELT $ 54))
                                       (QREFELT $ 51))
                             $))
                      (LETT |q|
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL |a3|
                                        (SPADCALL
                                         (SPADCALL |a1| |a2| (QREFELT $ 62))
                                         (SPADCALL 2 (QREFELT $ 64))
                                         (QREFELT $ 54))
                                        (QREFELT $ 51))
                              (SPADCALL (SPADCALL |a1| 3 (QREFELT $ 60))
                                        (SPADCALL 8 (QREFELT $ 64))
                                        (QREFELT $ 54))
                              (QREFELT $ 63))
                             $))
                      (LETT |r|
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |a4|
                                         (SPADCALL
                                          (SPADCALL |a1| |a3| (QREFELT $ 62))
                                          (SPADCALL 4 (QREFELT $ 64))
                                          (QREFELT $ 54))
                                         (QREFELT $ 51))
                               (SPADCALL
                                (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 60)) |a2|
                                          (QREFELT $ 62))
                                (SPADCALL 16 (QREFELT $ 64)) (QREFELT $ 54))
                               (QREFELT $ 63))
                              (SPADCALL
                               (SPADCALL 3 (SPADCALL |a1| 4 (QREFELT $ 60))
                                         (QREFELT $ 61))
                               (SPADCALL 256 (QREFELT $ 64)) (QREFELT $ 54))
                              (QREFELT $ 51))
                             $))
                      (COND
                       ((|SOLVEFOR;equ| |q| (|spadConstant| $ 34) $)
                        (LETT |t0|
                              (|SOLVEFOR;part|
                               (SPADCALL 2
                                         (SPADCALL |r|
                                                   (SPADCALL 1 2
                                                             (QREFELT $ 57))
                                                   (QREFELT $ 58))
                                         (QREFELT $ 61))
                               $)))
                       (#3#
                        (LETT |t0|
                              (SPADCALL (|spadConstant| $ 31)
                                        (SPADCALL |p| (QREFELT $ 55))
                                        (SPADCALL
                                         (SPADCALL 4 |r| (QREFELT $ 61))
                                         (QREFELT $ 55))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL 4 |p| (QREFELT $ 61)) |r|
                                          (QREFELT $ 62))
                                         (SPADCALL |q| 2 (QREFELT $ 60))
                                         (QREFELT $ 51))
                                        (QREFELT $ 42)))))
                      (LETT |rt|
                            (SPADCALL
                             (|SOLVEFOR;part|
                              (SPADCALL |t0| |p| (QREFELT $ 51)) $)
                             (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58)))
                      (LETT |slist|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 31) |rt|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |q| |rt| (QREFELT $ 54))
                                          (QREFELT $ 55))
                                         |t0| (QREFELT $ 63))
                                        (SPADCALL 2 (QREFELT $ 64))
                                        (QREFELT $ 54))
                                       (QREFELT $ 36))
                             (SPADCALL (|spadConstant| $ 31)
                                       (SPADCALL |rt| (QREFELT $ 55))
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |q| |rt| (QREFELT $ 54))
                                         |t0| (QREFELT $ 63))
                                        (SPADCALL 2 (QREFELT $ 64))
                                        (QREFELT $ 54))
                                       (QREFELT $ 36))
                             (QREFELT $ 39)))
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
                                                                             64))
                                                          (QREFELT $ 54))
                                                (QREFELT $ 51))
                                      #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |SOLVEFOR;aQuartic;6F;21|
        ((|c4| F) (|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ F))
        (SPROG
         ((|s| (F)) (|rt| (F)) (|t0| (F)) (|r| (F)) (|q| (F)) (|p| (F))
          (|a4| (F)) (|a3| (F)) (|a2| (F)) (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c4| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 34) (QREFELT $ 18))
                 (|spadConstant| $ 34))
                (#1='T
                 (SEQ (LETT |a1| (SPADCALL |c3| |c4| (QREFELT $ 54)))
                      (LETT |a2| (SPADCALL |c2| |c4| (QREFELT $ 54)))
                      (LETT |a3| (SPADCALL |c1| |c4| (QREFELT $ 54)))
                      (LETT |a4| (SPADCALL |c0| |c4| (QREFELT $ 54)))
                      (COND
                       ((SPADCALL |a1| (|spadConstant| $ 34) (QREFELT $ 18))
                        (COND
                         ((SPADCALL |a2| (|spadConstant| $ 34) (QREFELT $ 18))
                          (COND
                           ((SPADCALL |a3| (|spadConstant| $ 34)
                                      (QREFELT $ 18))
                            (EXIT
                             (SPADCALL (SPADCALL |a4| (QREFELT $ 55))
                                       (SPADCALL 1 4 (QREFELT $ 57))
                                       (QREFELT $ 58)))))))))
                      (LETT |p|
                            (|SOLVEFOR;part|
                             (SPADCALL |a2|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL 3 |a1| (QREFELT $ 61)) |a1|
                                         (QREFELT $ 62))
                                        (SPADCALL 8 (QREFELT $ 64))
                                        (QREFELT $ 54))
                                       (QREFELT $ 51))
                             $))
                      (LETT |q|
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL |a3|
                                        (SPADCALL
                                         (SPADCALL |a1| |a2| (QREFELT $ 62))
                                         (SPADCALL 2 (QREFELT $ 64))
                                         (QREFELT $ 54))
                                        (QREFELT $ 51))
                              (SPADCALL
                               (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 60)) |a1|
                                         (QREFELT $ 62))
                               (SPADCALL 8 (QREFELT $ 64)) (QREFELT $ 54))
                              (QREFELT $ 63))
                             $))
                      (LETT |r|
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |a4|
                                         (SPADCALL
                                          (SPADCALL |a1| |a3| (QREFELT $ 62))
                                          (SPADCALL 4 (QREFELT $ 64))
                                          (QREFELT $ 54))
                                         (QREFELT $ 51))
                               (SPADCALL
                                (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 60)) |a2|
                                          (QREFELT $ 62))
                                (SPADCALL 16 (QREFELT $ 64)) (QREFELT $ 54))
                               (QREFELT $ 63))
                              (SPADCALL
                               (SPADCALL 3 (SPADCALL |a1| 4 (QREFELT $ 60))
                                         (QREFELT $ 61))
                               (SPADCALL 256 (QREFELT $ 64)) (QREFELT $ 54))
                              (QREFELT $ 51))
                             $))
                      (COND
                       ((|SOLVEFOR;equ| |q| (|spadConstant| $ 34) $)
                        (LETT |t0|
                              (|SOLVEFOR;part|
                               (SPADCALL 2
                                         (SPADCALL |r|
                                                   (SPADCALL 1 2
                                                             (QREFELT $ 57))
                                                   (QREFELT $ 58))
                                         (QREFELT $ 61))
                               $)))
                       (#1#
                        (LETT |t0|
                              (SPADCALL (|spadConstant| $ 31)
                                        (SPADCALL |p| (QREFELT $ 55))
                                        (SPADCALL
                                         (SPADCALL 4 |r| (QREFELT $ 61))
                                         (QREFELT $ 55))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL 4 |p| (QREFELT $ 61)) |r|
                                          (QREFELT $ 62))
                                         (SPADCALL |q| 2 (QREFELT $ 60))
                                         (QREFELT $ 51))
                                        (QREFELT $ 42)))))
                      (LETT |rt|
                            (SPADCALL
                             (|SOLVEFOR;part|
                              (SPADCALL |t0| |p| (QREFELT $ 51)) $)
                             (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58)))
                      (LETT |s|
                            (SPADCALL (|spadConstant| $ 31) |rt|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |q| |rt| (QREFELT $ 54))
                                         (QREFELT $ 55))
                                        |t0| (QREFELT $ 63))
                                       (SPADCALL 2 (QREFELT $ 64))
                                       (QREFELT $ 54))
                                      (QREFELT $ 41)))
                      (EXIT
                       (SPADCALL |s|
                                 (SPADCALL |a1| (SPADCALL 4 (QREFELT $ 64))
                                           (QREFELT $ 54))
                                 (QREFELT $ 51)))))))))) 

(DECLAIM (NOTINLINE |PolynomialSolveByFormulas;|)) 

(DEFUN |PolynomialSolveByFormulas| (&REST #1=#:G193)
  (SPROG NIL
         (PROG (#2=#:G194)
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
          (LETT $ (GETREFV 66))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PolynomialSolveByFormulas|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 NIL)
          (QSETREFV $ 9 NIL)
          (QSETREFV $ 10 NIL)
          (QSETREFV $ 65
                    (SPADCALL
                     (SPADCALL (SPADCALL (|spadConstant| $ 31) (QREFELT $ 55))
                               (SPADCALL
                                (SPADCALL (SPADCALL 3 (QREFELT $ 64))
                                          (QREFELT $ 55))
                                (SPADCALL 1 2 (QREFELT $ 57)) (QREFELT $ 58))
                               (QREFELT $ 63))
                     (SPADCALL 2 (QREFELT $ 64)) (QREFELT $ 54)))
          $))) 

(MAKEPROP '|PolynomialSolveByFormulas| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|maplist|
              '|mapSolving?| '|map| (|List| 7) |SOLVEFOR;solve;UPL;4|
              (|Record| (|:| |arg| 7) (|:| |res| 7))
              (|Record| (|:| |solns| 11) (|:| |maps| (|List| 13)))
              (|Mapping| 7 7) |SOLVEFOR;mapSolve;UPMR;1| (|Boolean|) (0 . =)
              (|Factored| $) (6 . |squareFree|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 21) (|:| |factor| 6) (|:| |exponent| 28))
              (|List| 22) (|Factored| 6) (11 . |factorList|) (|Integer|)
              (16 . |elt|) (|NonNegativeInteger|) (22 . |degree|) (27 . |One|)
              (31 . |One|) (35 . |coefficient|) (41 . |Zero|) (45 . |Zero|)
              |SOLVEFOR;linear;2FL;14| |SOLVEFOR;quadratic;3FL;16|
              |SOLVEFOR;cubic;4FL;18| |SOLVEFOR;quartic;5FL;20| (49 . |append|)
              |SOLVEFOR;aLinear;3F;15| |SOLVEFOR;aQuadratic;4F;17|
              |SOLVEFOR;aCubic;5F;19| |SOLVEFOR;aQuartic;6F;21|
              |SOLVEFOR;particularSolution;UPF;5| (55 . ~=)
              (61 . |characteristic|) |SOLVEFOR;linear;UPL;9|
              |SOLVEFOR;quadratic;UPL;10| |SOLVEFOR;cubic;UPL;11|
              |SOLVEFOR;quartic;UPL;12| (65 . -) (|Union| $ '"failed")
              (71 . |recip|) (76 . /) (82 . -) (|Fraction| 26) (87 . /)
              (93 . ^) (|PositiveInteger|) (99 . ^) (105 . *) (111 . *)
              (117 . +) (123 . |coerce|) '|w3|)
           '#(|solve| 128 |quartic| 133 |quadratic| 147 |particularSolution|
              159 |mapSolve| 164 |linear| 170 |cubic| 181 |aQuartic| 194
              |aQuadratic| 203 |aLinear| 210 |aCubic| 216)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 64
                                                 '(2 7 17 0 0 18 1 6 19 0 20 1
                                                   24 23 0 25 2 23 22 0 26 27 1
                                                   6 28 0 29 0 6 0 30 0 7 0 31
                                                   2 6 7 0 28 32 0 6 0 33 0 7 0
                                                   34 2 11 0 0 0 39 2 7 17 0 0
                                                   45 0 7 28 46 2 7 0 0 0 51 1
                                                   7 52 0 53 2 7 0 0 0 54 1 7 0
                                                   0 55 2 56 0 26 26 57 2 7 0 0
                                                   56 58 2 7 0 0 59 60 2 7 0 59
                                                   0 61 2 7 0 0 0 62 2 7 0 0 0
                                                   63 1 7 0 26 64 1 0 11 6 12 1
                                                   0 11 6 50 5 0 11 7 7 7 7 7
                                                   38 1 0 11 6 48 3 0 11 7 7 7
                                                   36 1 0 7 6 44 2 0 14 6 15 16
                                                   1 0 11 6 47 2 0 11 7 7 35 1
                                                   0 11 6 49 4 0 11 7 7 7 7 37
                                                   5 0 7 7 7 7 7 7 43 3 0 7 7 7
                                                   7 41 2 0 7 7 7 40 4 0 7 7 7
                                                   7 7 42)))))
           '|lookupComplete|)) 
