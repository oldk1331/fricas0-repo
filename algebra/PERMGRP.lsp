
(SDEFUN |PERMGRP;shortenWord|
        ((|lw| |List| (|NonNegativeInteger|)) (|gp| $)
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|do_res| #1=(|Boolean|)) (|flag1| #1#)
          (|newlw| (|List| (|NonNegativeInteger|))) (#2=#:G180 NIL)
          (|anzahl| (|NonNegativeInteger|)) (|flag2| #1#)
          (|res| (|List| #3=(|NonNegativeInteger|))) (|test| #3#)
          (#4=#:G184 NIL) (|el| NIL) (|pos| (|Integer|)) (#5=#:G183 NIL)
          (|i| NIL) (|orderList| (|List| (|NonNegativeInteger|)))
          (#6=#:G182 NIL) (|gen| NIL) (#7=#:G181 NIL)
          (|gpgens| (|List| (|Permutation| S))))
         (SEQ (LETT |gpgens| (SPADCALL |gp| (QREFELT $ 9)))
              (LETT |orderList|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |gen| NIL) (LETT #6# |gpgens|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |gen| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS (SPADCALL |gen| (QREFELT $ 12)) #7#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |newlw| (SPADCALL |lw| (QREFELT $ 14)))
              (SEQ (LETT |i| 1)
                   (LETT #5# (SPADCALL |orderList| (QREFELT $ 16))) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |orderList| |i| (QREFELT $ 17)) 1)
                       (SEQ G190
                            (COND
                             ((NULL (SPADCALL |i| |newlw| (QREFELT $ 19)))
                              (GO G191)))
                            (SEQ
                             (LETT |pos| (SPADCALL |i| |newlw| (QREFELT $ 20)))
                             (EXIT
                              (LETT |newlw|
                                    (SPADCALL |newlw| |pos| (QREFELT $ 21)))))
                            NIL (GO G190) G191 (EXIT NIL))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((< (SPADCALL |newlw| (QREFELT $ 22)) 2) |newlw|)
                     ('T
                      (SEQ (LETT |test| (|SPADfirst| |newlw|))
                           (LETT |anzahl| 0) (LETT |flag1| 'T)
                           (LETT |do_res| NIL)
                           (SEQ G190 (COND ((NULL |flag1|) (GO G191)))
                                (SEQ (LETT |test| (|SPADfirst| |newlw|))
                                     (LETT |anzahl| 1)
                                     (COND
                                      (|do_res| (LETT |res| (LIST |test|))))
                                     (LETT |flag2| 'T)
                                     (SEQ (LETT |el| NIL) (LETT #4# |newlw|)
                                          G190
                                          (COND
                                           ((OR (ATOM #4#)
                                                (PROGN
                                                 (LETT |el| (CAR #4#))
                                                 NIL)
                                                (NULL |flag2|))
                                            (GO G191)))
                                          (SEQ
                                           (COND
                                            (|do_res|
                                             (LETT |res| (CONS |el| |res|))))
                                           (LETT |anzahl| (+ |anzahl| 1))
                                           (EXIT
                                            (COND
                                             ((EQL |anzahl| 1)
                                              (LETT |test| |el|))
                                             ((SPADCALL |test| |el|
                                                        (QREFELT $ 24))
                                              (SEQ (LETT |test| |el|)
                                                   (EXIT (LETT |anzahl| 1))))
                                             ('T
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((EQL |anzahl|
                                                       (SPADCALL |orderList|
                                                                 |test|
                                                                 (QREFELT $
                                                                          17)))
                                                  (PROGN
                                                   (LETT #2#
                                                         (SEQ
                                                          (COND
                                                           (|do_res|
                                                            (LETT |res|
                                                                  (SPADCALL
                                                                   |res|
                                                                   |anzahl|
                                                                   (QREFELT $
                                                                            25))))
                                                           ('T
                                                            (LETT |flag2|
                                                                  NIL)))
                                                          (EXIT
                                                           (LETT |anzahl| 0))))
                                                   (GO #8=#:G171)))))
                                               #8# (EXIT #2#))))))
                                          (LETT #4# (CDR #4#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND
                                      (|do_res|
                                       (LETT |newlw| (NREVERSE |res|))))
                                     (LETT |flag1| |do_res|)
                                     (EXIT (LETT |do_res| (NULL |flag2|))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT |newlw|)))))))) 

(SDEFUN |PERMGRP;times!|
        ((|res| |Vector| (|NonNegativeInteger|))
         (|p| |Vector| (|NonNegativeInteger|))
         (|q| |Vector| (|NonNegativeInteger|)) ($ |Void|))
        (SPROG ((#1=#:G188 NIL) (|i| NIL) (|degree| (|NonNegativeInteger|)))
               (SEQ (LETT |degree| (SPADCALL |p| (QREFELT $ 27)))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #1# |degree|) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1O |res| |i|
                                        (QAREF1O |p| (QAREF1O |q| |i| 1) 1)
                                        1)))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |PERMGRP;times|
        ((|p| |Vector| (|NonNegativeInteger|))
         (|q| |Vector| (|NonNegativeInteger|))
         ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|)))
         (SEQ (LETT |degree| (SPADCALL |p| (QREFELT $ 27)))
              (LETT |res| (SPADCALL |degree| 0 (QREFELT $ 28)))
              (|PERMGRP;times!| |res| |p| |q| $) (EXIT |res|)))) 

(SDEFUN |PERMGRP;inv|
        ((|p| |Vector| (|NonNegativeInteger|))
         ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G194 NIL) (|i| NIL) (|q| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|)))
         (SEQ (LETT |degree| (SPADCALL |p| (QREFELT $ 27)))
              (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28)))
              (SEQ (LETT |i| 1) (LETT #1# |degree|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (EXIT (QSETAREF1O |q| (QAREF1O |p| |i| 1) |i| 1)))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |q|)))) 

(SDEFUN |PERMGRP;testIdentity|
        ((|p| |Vector| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G200 NIL) (#2=#:G201 NIL) (#3=#:G202 NIL) (|i| NIL)
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |degree| (SPADCALL |p| (QREFELT $ 27)))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| 1) (LETT #3# |degree|) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1O |p| |i| 1) |i| (QREFELT $ 24))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G199)))
                            (GO #5=#:G197))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #1#))
                (EXIT 'T)))
          #4# (EXIT #2#)))) 

(SDEFUN |PERMGRP;cosetRep1|
        ((|ppt| |NonNegativeInteger|) (|do_words| |Boolean|)
         (|o| |Record| (|:| |orb| #1=(|List| (|NonNegativeInteger|)))
          (|:| |svc| #2=(|Vector| (|Integer|))))
         (|grpv| |Vector| (|Vector| (|NonNegativeInteger|)))
         (|wordv| |Vector| (|List| (|NonNegativeInteger|)))
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((#3=#:G213 NIL) (|p| (|Integer|))
          (|word| (|List| (|NonNegativeInteger|)))
          (|xelt| #4=(|Vector| (|NonNegativeInteger|)))
          (|tmpv| #5=(|Vector| (|NonNegativeInteger|))) (|#G25| #5#)
          (|#G24| #4#) (|x| (|Vector| (|NonNegativeInteger|))) (|osvc| #2#)
          (|oorb| #1#) (#6=#:G214 NIL) (#7=#:G216 NIL) (|n| NIL)
          (#8=#:G215 NIL) (|degree| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((EQL (QVSIZE |grpv|) 0) (|error| "cosetRep needs nonempty group"))
            (#9='T
             (SEQ
              (LETT |degree|
                    (SPADCALL (SPADCALL |grpv| 1 (QREFELT $ 30))
                              (QREFELT $ 27)))
              (LETT |xelt|
                    (PROGN
                     (LETT #8# (GETREFV |degree|))
                     (SEQ (LETT |n| 1) (LETT #7# |degree|) (LETT #6# 0) G190
                          (COND ((|greater_SI| |n| #7#) (GO G191)))
                          (SEQ (EXIT (SETELT #8# #6# |n|)))
                          (LETT #6#
                                (PROG1 (|inc_SI| #6#)
                                  (LETT |n| (|inc_SI| |n|))))
                          (GO G190) G191 (EXIT NIL))
                     #8#))
              (LETT |word| NIL) (LETT |oorb| (QCAR |o|))
              (LETT |osvc| (QCDR |o|)) (LETT |p| (QAREF1O |osvc| |ppt| 1))
              (EXIT
               (COND
                ((< |p| 0)
                 (PROGN (LETT #3# (CONS |xelt| |word|)) (GO #10=#:G212)))
                (#9#
                 (SEQ (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)))
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ (LETT |x| (QAREF1O |grpv| |p| 1))
                                 (|PERMGRP;times!| |tmpv| |x| |xelt| $)
                                 (PROGN
                                  (LETT |#G24| |xelt|)
                                  (LETT |#G25| |tmpv|)
                                  (LETT |tmpv| |#G24|)
                                  (LETT |xelt| |#G25|))
                                 (COND
                                  (|do_words|
                                   (LETT |word|
                                         (SPADCALL
                                          (SPADCALL |wordv| |p| (QREFELT $ 32))
                                          |word| (QREFELT $ 33)))))
                                 (LETT |ppt| (QAREF1O |x| |ppt| 1))
                                 (LETT |p| (QAREF1O |osvc| |ppt| 1))
                                 (EXIT
                                  (COND
                                   ((< |p| 0)
                                    (PROGN
                                     (LETT #3# (CONS |xelt| |word|))
                                     (GO #10#))))))
                            NIL (GO G190) G191 (EXIT NIL)))))))))))
          #10# (EXIT #3#)))) 

(SDEFUN |PERMGRP;strip1|
        ((|element| |Vector| (|NonNegativeInteger|))
         (|orbit| |Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
          (|:| |svc| (|Vector| (|Integer|))))
         (|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|words| |List| (|List| (|NonNegativeInteger|)))
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|cr|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|point| (|NonNegativeInteger|))
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|do_words| (|Boolean|))
          (|grpv| (|Vector| (|Vector| (|NonNegativeInteger|)))))
         (SEQ (LETT |grpv| (SPADCALL |group| (QREFELT $ 35)))
              (LETT |wordv| (MAKE-ARRAY 0))
              (LETT |do_words| (NULL (NULL |words|)))
              (COND
               (|do_words| (LETT |wordv| (SPADCALL |words| (QREFELT $ 37)))))
              (LETT |point|
                    (QAREF1O |element|
                             (SPADCALL (QCAR |orbit|) 1 (QREFELT $ 38)) 1))
              (LETT |cr|
                    (|PERMGRP;cosetRep1| |point| |do_words| |orbit| |grpv|
                     |wordv| $))
              (EXIT
               (CONS (|PERMGRP;times| (QCAR |cr|) |element| $)
                     (REVERSE (QCDR |cr|))))))) 

(SDEFUN |PERMGRP;strip|
        ((|z| . #1=(|Vector| (|NonNegativeInteger|))) (|i| |Integer|)
         (|do_words| |Boolean|)
         (|orbs| |Vector|
          (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                    (|:| |svc| #2=(|Vector| (|Integer|)))))
         (|grpv| |Vector| (|Vector| (|NonNegativeInteger|)))
         (|wordv| |Vector| (|List| (|NonNegativeInteger|)))
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|word| (|List| (|NonNegativeInteger|)))
          (|tmpv| #3=(|Vector| (|NonNegativeInteger|))) (|#G38| #1#)
          (|#G37| #3#) (|ee| (|Vector| (|NonNegativeInteger|)))
          (|noresult| (|Boolean|)) (#4=#:G231 NIL) (|entry| (|Integer|))
          (|p| (|NonNegativeInteger|)) (|s| #2#)
          (|orbj|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|j| NIL) (|degree| (|NonNegativeInteger|)))
         (SEQ (LETT |degree| (SPADCALL |z| (QREFELT $ 27))) (LETT |word| NIL)
              (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)))
              (LETT |noresult| 'T)
              (SEQ (LETT |j| |i|) G190
                   (COND ((OR (< |j| 1) (NULL |noresult|)) (GO G191)))
                   (SEQ (LETT |orbj| (QAREF1O |orbs| |j| 1))
                        (LETT |s| (QCDR |orbj|))
                        (LETT |p| (|SPADfirst| (QCAR |orbj|)))
                        (EXIT
                         (SEQ
                          (EXIT
                           (SEQ G190 (COND ((NULL |noresult|) (GO G191)))
                                (SEQ
                                 (LETT |entry|
                                       (QAREF1O |s| (QAREF1O |z| |p| 1) 1))
                                 (EXIT
                                  (COND
                                   ((< |entry| 0)
                                    (SEQ
                                     (COND
                                      ((EQL |entry| -1)
                                       (PROGN
                                        (LETT #4# |$NoValue|)
                                        (GO #5=#:G226))))
                                     (EXIT (LETT |noresult| NIL))))
                                   ('T
                                    (SEQ (LETT |ee| (QAREF1O |grpv| |entry| 1))
                                         (|PERMGRP;times!| |tmpv| |ee| |z| $)
                                         (PROGN
                                          (LETT |#G37| |tmpv|)
                                          (LETT |#G38| |z|)
                                          (LETT |z| |#G37|)
                                          (LETT |tmpv| |#G38|))
                                         (EXIT
                                          (COND
                                           (|do_words|
                                            (LETT |word|
                                                  (SPADCALL
                                                   (SPADCALL |wordv| |entry|
                                                             (QREFELT $ 32))
                                                   |word|
                                                   (QREFELT $ 33)))))))))))
                                NIL (GO G190) G191 (EXIT NIL)))
                          #5# (EXIT #4#))))
                   (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |z| |word|))))) 

(SDEFUN |PERMGRP;orbitInternal|
        ((|gp| $) (|startList| . #1=(|List| S)) ($ |List| (|List| S)))
        (SPROG
         ((|pos| (|Integer|)) (|orbitList| (|List| #1#)) (|newList| (|List| S))
          (|j| NIL) (|workList| (|List| S)) (#2=#:G241 NIL) (|gen| NIL)
          (|gpset| (|List| (|Permutation| S))))
         (SEQ (LETT |orbitList| (LIST |startList|)) (LETT |pos| 1)
              (SEQ G190 (COND ((NULL (NULL (ZEROP |pos|))) (GO G191)))
                   (SEQ (LETT |gpset| (QCAR |gp|))
                        (SEQ (LETT |gen| NIL) (LETT #2# |gpset|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |gen| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |newList| NIL)
                                  (LETT |workList|
                                        (SPADCALL |orbitList| |pos|
                                                  (QREFELT $ 41)))
                                  (SEQ (LETT |j| (LENGTH |workList|)) G190
                                       (COND ((< |j| 1) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT |newList|
                                               (CONS
                                                (SPADCALL |gen|
                                                          (SPADCALL |workList|
                                                                    |j|
                                                                    (QREFELT $
                                                                             42))
                                                          (QREFELT $ 43))
                                                |newList|))))
                                       (LETT |j| (+ |j| -1)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL |newList| |orbitList|
                                                (QREFELT $ 44)))
                                     (SEQ
                                      (LETT |orbitList|
                                            (CONS |newList| |orbitList|))
                                      (EXIT (LETT |pos| (+ |pos| 1))))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |pos| (- |pos| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |orbitList|))))) 

(SDEFUN |PERMGRP;ranelt|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|word| |List| (|List| (|NonNegativeInteger|))) (|maxLoops| |Integer|)
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|numberOfLoops| #1=(|Integer|))
          (|words| (|List| (|NonNegativeInteger|))) (#2=#:G246 NIL)
          (|randomElement| (|Vector| (|NonNegativeInteger|)))
          (|randomInteger| #1#) (#3=#:G244 NIL) (|do_words| (|Boolean|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ (LETT |numberOfGenerators| (LENGTH |group|))
              (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|)))
              (LETT |randomElement|
                    (SPADCALL |group| |randomInteger| (QREFELT $ 45)))
              (LETT |words| NIL) (LETT |do_words| (NULL (NULL |word|)))
              (COND
               (|do_words|
                (LETT |words|
                      (SPADCALL |word|
                                (PROG1 (LETT #3# |randomInteger|)
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#))
                                (QREFELT $ 46)))))
              (COND
               ((> |maxLoops| 0)
                (LETT |numberOfLoops| (+ 1 (RANDOM |maxLoops|))))
               ('T (LETT |numberOfLoops| |maxLoops|)))
              (SEQ G190 (COND ((NULL (> |numberOfLoops| 0)) (GO G191)))
                   (SEQ
                    (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|)))
                    (LETT |randomElement|
                          (|PERMGRP;times|
                           (SPADCALL |group| |randomInteger| (QREFELT $ 45))
                           |randomElement| $))
                    (COND
                     (|do_words|
                      (LETT |words|
                            (SPADCALL
                             (SPADCALL |word|
                                       (PROG1 (LETT #2# |randomInteger|)
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                       (QREFELT $ 46))
                             |words| (QREFELT $ 33)))))
                    (EXIT (LETT |numberOfLoops| (- |numberOfLoops| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |randomElement| |words|))))) 

(SDEFUN |PERMGRP;pointList;$L;11| ((|group| $) ($ |List| S))
        (SPROG
         ((|res| (|List| S)) (|p0| (S)) (#1=#:G261 NIL) (|p| NIL)
          (|support| (|List| S)) (#2=#:G260 NIL) (|perm| NIL))
         (SEQ
          (COND
           ((NULL (NULL (QVELT (QCDR |group|) 4))) (QVELT (QCDR |group|) 4))
           ('T
            (SEQ (LETT |support| NIL)
                 (SEQ (LETT |perm| NIL) (LETT #2# (QCAR |group|)) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |perm| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |support|
                              (SPADCALL
                               (SPADCALL
                                (QCAR (SPADCALL |perm| (QREFELT $ 48)))
                                (QREFELT $ 49))
                               |support| (QREFELT $ 50)))))
                      (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                 (LETT |res| NIL)
                 (EXIT
                  (COND ((NULL |support|) |res|)
                        ('T
                         (SEQ (LETT |p0| (|SPADfirst| |support|))
                              (LETT |res| (LIST |p0|))
                              (SEQ (LETT |p| NIL) (LETT #1# (CDR |support|))
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |p| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL |p| |p0| (QREFELT $ 51))
                                       "iterate")
                                      ('T
                                       (SEQ (LETT |p0| |p|)
                                            (EXIT
                                             (LETT |res|
                                                   (CONS |p| |res|))))))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (QSETVELT (QCDR |group|) 4
                                         (NREVERSE |res|))))))))))))) 

(SDEFUN |PERMGRP;pointList;$L;12| ((|group| $) ($ |List| S))
        (SPROG ((|support| (|Set| S)) (#1=#:G267 NIL) (|perm| NIL))
               (SEQ
                (COND
                 ((NULL (NULL (QVELT (QCDR |group|) 4)))
                  (QVELT (QCDR |group|) 4))
                 ('T
                  (SEQ (LETT |support| (SPADCALL (QREFELT $ 54)))
                       (SEQ (LETT |perm| NIL) (LETT #1# (QCAR |group|)) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |perm| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |support|
                                    (SPADCALL |support|
                                              (SPADCALL |perm| (QREFELT $ 55))
                                              (QREFELT $ 56)))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (QSETVELT (QCDR |group|) 4
                                  (SPADCALL |support| (QREFELT $ 57)))))))))) 

(SDEFUN |PERMGRP;ls_to_lnni|
        ((|ls| |List| S) (|supp| |List| S) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G286 NIL) (|pp| NIL) (#2=#:G285 NIL)
          (|rp2| (|List| (|List| (|NonNegativeInteger|))))
          (|ls2|
           (|List|
            (|Record| (|:| |preimage| (|NonNegativeInteger|))
                      (|:| |image| S))))
          (|p1| (S))
          (|pel|
           (|Record| (|:| |preimage| (|NonNegativeInteger|)) (|:| |image| S)))
          (|flag| (|Boolean|)) (#3=#:G284 NIL) (|p2| NIL) (|i| NIL)
          (#4=#:G283 NIL) (|p| NIL) (#5=#:G282 NIL))
         (SEQ
          (COND ((NULL |ls|) NIL)
                ('T
                 (SEQ
                  (LETT |ls2|
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |i| 1) (LETT |p| NIL) (LETT #4# |ls|) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |p| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ (EXIT (LETT #5# (CONS (CONS |i| |p|) #5#))))
                              (LETT #4#
                                    (PROG1 (CDR #4#)
                                      (LETT |i| (|inc_SI| |i|))))
                              (GO G190) G191 (EXIT (NREVERSE #5#)))))
                  (LETT |ls2|
                        (SPADCALL (CONS #'|PERMGRP;ls_to_lnni!0| $) |ls2|
                                  (QREFELT $ 62)))
                  (LETT |pel| (|SPADfirst| |ls2|)) (LETT |p1| (QCDR |pel|))
                  (LETT |ls2| (CDR |ls2|)) (LETT |rp2| NIL) (LETT |flag| 'T)
                  (SEQ (LETT |i| 1) (LETT |p2| NIL) (LETT #3# |supp|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |p2| (CAR #3#)) NIL)
                             (NULL |flag|))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |p1| |p2| (QREFELT $ 51))
                           (SEQ
                            (LETT |rp2| (CONS (LIST (QCAR |pel|) |i|) |rp2|))
                            (EXIT
                             (COND ((NULL |ls2|) (LETT |flag| NIL))
                                   ('T
                                    (SEQ (LETT |pel| (|SPADfirst| |ls2|))
                                         (LETT |p1| (QCDR |pel|))
                                         (EXIT
                                          (LETT |ls2| (CDR |ls2|))))))))))))
                       (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (LETT |rp2|
                        (SPADCALL (CONS #'|PERMGRP;ls_to_lnni!1| $) |rp2|
                                  (QREFELT $ 66)))
                  (EXIT
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |pp| NIL) (LETT #1# |rp2|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS (SPADCALL |pp| (QREFELT $ 67)) #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |PERMGRP;ls_to_lnni!1| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 63)) (SPADCALL |y| (QREFELT $ 63))
                  (QREFELT $ 64))) 

(SDEFUN |PERMGRP;ls_to_lnni!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 58))) 

(SDEFUN |PERMGRP;perm_to_vec;LPNniV;14|
        ((|supp| |List| S) (|p| |Permutation| S)
         (|degree| |NonNegativeInteger|) ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G294 NIL) (|pp| NIL) (#2=#:G295 NIL) (|ip| NIL)
          (|il| #3=(|List| (|NonNegativeInteger|))) (|pl| #3#) (#4=#:G293 NIL)
          (|i| NIL) (|q| (|Vector| (|NonNegativeInteger|)))
          (|pr|
           (|Record| (|:| |preimage| (|List| S)) (|:| |image| (|List| S)))))
         (SEQ (LETT |pr| (SPADCALL |p| (QREFELT $ 48)))
              (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28)))
              (SEQ (LETT |i| 1) (LETT #4# |degree|) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (EXIT (SPADCALL |q| |i| |i| (QREFELT $ 68))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |pl| (|PERMGRP;ls_to_lnni| (QCAR |pr|) |supp| $))
              (LETT |il| (|PERMGRP;ls_to_lnni| (QCDR |pr|) |supp| $))
              (SEQ (LETT |ip| NIL) (LETT #2# |il|) (LETT |pp| NIL)
                   (LETT #1# |pl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#)) NIL)
                         (ATOM #2#) (PROGN (LETT |ip| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |q| |pp| |ip| (QREFELT $ 68))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |q|)))) 

(SDEFUN |PERMGRP;perm_to_vec;LPNniV;15|
        ((|supp| |List| S) (|p| |Permutation| S)
         (|degree| |NonNegativeInteger|) ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((|pos2| (|Integer|)) (|newEl| (S)) (#1=#:G301 NIL) (|i| NIL)
          (|q| (|Vector| (|NonNegativeInteger|))))
         (SEQ (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28)))
              (SEQ (LETT |i| 1) (LETT #1# |degree|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |newEl|
                          (SPADCALL |p| (SPADCALL |supp| |i| (QREFELT $ 42))
                                    (QREFELT $ 43)))
                    (LETT |pos2| (SPADCALL |newEl| |supp| (QREFELT $ 70)))
                    (EXIT (SPADCALL |q| |i| |pos2| (QREFELT $ 68))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |q|)))) 

(SDEFUN |PERMGRP;orbitWithSvc1|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|grpinv| |List| (|Vector| (|NonNegativeInteger|)))
         (|point| . #1=(|NonNegativeInteger|))
         ($ |Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
          (|:| |svc| (|Vector| (|Integer|)))))
        (SPROG
         ((|position| (|Integer|)) (|orbit_size| (|NonNegativeInteger|))
          (|orbit| (|List| #1#)) (|newPoint| (|NonNegativeInteger|))
          (#2=#:G312 NIL) (|i| NIL) (#3=#:G313 NIL) (|grv| NIL)
          (|schreierVector| (|Vector| (|Integer|)))
          (|orbitv| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|)))
         (SEQ (LETT |degree| (SPADCALL (|SPADfirst| |group|) (QREFELT $ 27)))
              (LETT |orbit| (LIST |point|))
              (LETT |orbitv| (SPADCALL |degree| 0 (QREFELT $ 28)))
              (SPADCALL |orbitv| 1 |point| (QREFELT $ 68))
              (LETT |orbit_size| 1)
              (LETT |schreierVector| (MAKEARR1 |degree| -2))
              (SPADCALL |schreierVector| |point| -1 (QREFELT $ 72))
              (LETT |position| 1)
              (SEQ G190 (COND ((NULL (NULL (ZEROP |position|))) (GO G191)))
                   (SEQ
                    (SEQ (LETT |grv| NIL) (LETT #3# |grpinv|) (LETT |i| 1)
                         (LETT #2# (LENGTH |grpinv|)) G190
                         (COND
                          ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                               (PROGN (LETT |grv| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |newPoint|
                                (QAREF1O |orbitv|
                                         (+ (- |orbit_size| |position|) 1) 1))
                          (LETT |newPoint| (QAREF1O |grv| |newPoint| 1))
                          (EXIT
                           (COND
                            ((EQL (QAREF1O |schreierVector| |newPoint| 1) -2)
                             (SEQ (LETT |orbit| (CONS |newPoint| |orbit|))
                                  (LETT |orbit_size| (+ |orbit_size| 1))
                                  (SPADCALL |orbitv| |orbit_size| |newPoint|
                                            (QREFELT $ 68))
                                  (LETT |position| (+ |position| 1))
                                  (EXIT
                                   (SPADCALL |schreierVector| |newPoint| |i|
                                             (QREFELT $ 72))))))))
                         (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#))))
                         (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |position| (- |position| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |orbit|) |schreierVector|))))) 

(SDEFUN |PERMGRP;orbitWithSvc|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|point| |NonNegativeInteger|)
         ($ |Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
          (|:| |svc| (|Vector| (|Integer|)))))
        (SPROG
         ((|grpinv| (|List| (|Vector| (|NonNegativeInteger|)))) (#1=#:G317 NIL)
          (|el| NIL))
         (SEQ (LETT |grpinv| NIL)
              (SEQ (LETT |el| NIL) (LETT #1# |group|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |grpinv| (CONS (|PERMGRP;inv| |el| $) |grpinv|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |grpinv| (REVERSE |grpinv|))
              (EXIT (|PERMGRP;orbitWithSvc1| |group| |grpinv| |point| $))))) 

(SDEFUN |PERMGRP;bsgs1|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|number1| |NonNegativeInteger|)
         (|words| |List| (|List| (|NonNegativeInteger|)))
         (|maxLoops| |Integer|) (|gp| $) (|diff| |Integer|)
         (|out| |Reference|
          (|List| (|List| (|Vector| (|NonNegativeInteger|)))))
         (|outword| |Reference|
          (|List| (|List| (|List| (|NonNegativeInteger|)))))
         ($ . #1=(|NonNegativeInteger|)))
        (SPROG
         ((|sizeOfGroup| (|NonNegativeInteger|)) (|k2| #1#) (#2=#:G342 NIL)
          (|j| (|Integer|)) (|words3| (|List| (|List| (|NonNegativeInteger|))))
          (|help| (|List| (|NonNegativeInteger|)))
          (|group2| (|List| (|Vector| (|NonNegativeInteger|))))
          (|el2| (|Vector| (|NonNegativeInteger|)))
          (|str|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|ran|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|words2| (|List| (|List| (|NonNegativeInteger|))))
          (|gpsgs| (|List| (|Vector| (|NonNegativeInteger|)))) (#3=#:G345 NIL)
          (|k| (|List| (|NonNegativeInteger|))) (#4=#:G340 NIL) (#5=#:G344 NIL)
          (|jj| NIL) (|gplength| (|NonNegativeInteger|)) (#6=#:G341 NIL)
          (|k1| (|NonNegativeInteger|))
          (|ort|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (#7=#:G343 NIL) (|i| NIL) (|wordProblem| (|Boolean|))
          (|gp_info|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|))))))
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |degree| (SPADCALL (|SPADfirst| |group|) (QREFELT $ 27)))
                (LETT |gp_info| (QCDR |gp|))
                (LETT |wordProblem| (NULL (NULL |words|)))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| |number1|) (LETT #7# |degree|) G190
                       (COND ((> |i| #7#) (GO G191)))
                       (SEQ (LETT |ort| (|PERMGRP;orbitWithSvc| |group| |i| $))
                            (LETT |k| (QCAR |ort|))
                            (LETT |k1| (SPADCALL |k| (QREFELT $ 22)))
                            (EXIT
                             (COND
                              ((SPADCALL |k1| 1 (QREFELT $ 24))
                               (PROGN (LETT #6# |$NoValue|) (GO #8=#:G321))))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                 #8# (EXIT #6#))
                (LETT |gpsgs| NIL) (LETT |words2| NIL)
                (LETT |gplength| (LENGTH |group|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |jj| 1) (LETT #5# |gplength|) G190
                       (COND ((|greater_SI| |jj| #5#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |group| |jj| (QREFELT $ 45))
                                      |i| (QREFELT $ 73))
                            |i| (QREFELT $ 24))
                           (PROGN (LETT #4# |$NoValue|) (GO #9=#:G324))))))
                       (LETT |jj| (|inc_SI| |jj|)) (GO G190) G191 (EXIT NIL)))
                 #9# (EXIT #4#))
                (SEQ (LETT |k| 1) (LETT #3# |gplength|) G190
                     (COND ((|greater_SI| |k| #3#) (GO G191)))
                     (SEQ (LETT |el2| (SPADCALL |group| |k| (QREFELT $ 45)))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |el2| |i| (QREFELT $ 73)) |i|
                                       (QREFELT $ 24))
                             (SEQ (LETT |gpsgs| (CONS |el2| |gpsgs|))
                                  (EXIT
                                   (COND
                                    (|wordProblem|
                                     (LETT |words2|
                                           (CONS
                                            (SPADCALL |words| |k|
                                                      (QREFELT $ 46))
                                            |words2|)))))))
                            ('T
                             (SEQ
                              (LETT |gpsgs|
                                    (CONS
                                     (|PERMGRP;times|
                                      (SPADCALL |group| |jj| (QREFELT $ 45))
                                      |el2| $)
                                     |gpsgs|))
                              (EXIT
                               (COND
                                (|wordProblem|
                                 (LETT |words2|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |words| |jj| (QREFELT $ 46))
                                         (SPADCALL |words| |k| (QREFELT $ 46))
                                         (QREFELT $ 33))
                                        |words2|))))))))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (LETT |group2| NIL) (LETT |words3| NIL) (LETT |j| 15)
                (SEQ G190 (COND ((NULL (> |j| 0)) (GO G191)))
                     (SEQ
                      (LETT |ran|
                            (|PERMGRP;ranelt| |group| |words| |maxLoops| $))
                      (LETT |str|
                            (|PERMGRP;strip1| (QCAR |ran|) |ort| |group|
                             |words| $))
                      (LETT |el2| (QCAR |str|))
                      (COND
                       ((NULL (|PERMGRP;testIdentity| |el2| $))
                        (COND
                         ((NULL (SPADCALL |el2| |group2| (QREFELT $ 74)))
                          (SEQ (LETT |group2| (CONS |el2| |group2|))
                               (COND
                                (|wordProblem|
                                 (SEQ
                                  (LETT |help|
                                        (SPADCALL (REVERSE (QCDR |str|))
                                                  (QCDR |ran|) (QREFELT $ 33)))
                                  (LETT |help|
                                        (|PERMGRP;shortenWord| |help| |gp| $))
                                  (EXIT
                                   (LETT |words3| (CONS |help| |words3|))))))
                               (EXIT (LETT |j| (- |j| 2))))))))
                      (EXIT (LETT |j| (- |j| 1))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND (|wordProblem| (LETT |maxLoops| (- |maxLoops| |diff|))))
                (COND
                 ((OR (NULL |group2|) (< |maxLoops| 0))
                  (SEQ (QSETVELT |gp_info| 2 (LIST |i|))
                       (SPADCALL |out| (LIST |gpsgs|) (QREFELT $ 77))
                       (SPADCALL |outword| (LIST |words2|) (QREFELT $ 80))
                       (EXIT (PROGN (LETT #2# |k1|) (GO #10=#:G339))))))
                (LETT |k2|
                      (|PERMGRP;bsgs1| |group2| (+ |i| 1) |words3| |maxLoops|
                       |gp| |diff| |out| |outword| $))
                (LETT |sizeOfGroup| (* |k1| |k2|))
                (SPADCALL |out|
                          (SPADCALL (SPADCALL |out| (QREFELT $ 81))
                                    (LIST |gpsgs|) (QREFELT $ 82))
                          (QREFELT $ 77))
                (SPADCALL |outword|
                          (SPADCALL (SPADCALL |outword| (QREFELT $ 83))
                                    (LIST |words2|) (QREFELT $ 84))
                          (QREFELT $ 80))
                (QSETVELT |gp_info| 2 (CONS |i| (QVELT |gp_info| 2)))
                (EXIT |sizeOfGroup|)))
          #10# (EXIT #2#)))) 

(SDEFUN |PERMGRP;reduceGenerators|
        ((|kkk| |Integer|) (|do_words| |Boolean|)
         (|gp_info| |Record| (|:| |order| (|NonNegativeInteger|))
          (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
          (|:| |gpbase| #1=(|List| (|NonNegativeInteger|)))
          (|:| |orbs|
               #2=(|Vector|
                   (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                             (|:| |svc| (|Vector| (|Integer|))))))
          (|:| |mp| (|List| S))
          (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))
         (|outl| |List| (|List| (|Vector| (|NonNegativeInteger|))))
         (|outword| |List| (|List| (|List| (|NonNegativeInteger|))))
         ($ |List| (|Vector| (|NonNegativeInteger|))))
        (SPROG
         ((|i| (|NonNegativeInteger|))
          (|outlk| (|List| (|Vector| (|NonNegativeInteger|))))
          (|grpinv| (|List| (|Vector| (|NonNegativeInteger|))))
          (|sgs| (|List| (|Vector| (|NonNegativeInteger|))))
          (|res| (|List| (|Vector| (|NonNegativeInteger|))))
          (|obs2|
           #3=(|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                        (|:| |svc| (|Vector| (|Integer|)))))
          (|grpinv2| #4=(|List| (|Vector| (|NonNegativeInteger|))))
          (|sgs2| #4#) (|pos| (|Integer|)) (|removedGenerator| (|Boolean|))
          (|obs_len| #5=(|NonNegativeInteger|)) (|obs| #3#) (|pt| (|Integer|))
          (|baseLength| #5#) (#6=#:G366 NIL) (|orbv| #2#) (|base_lst| #1#))
         (SEQ (LETT |base_lst| (QVELT |gp_info| 2))
              (LETT |orbv| (QVELT |gp_info| 3)) (LETT |sgs| NIL)
              (LETT |res| NIL) (LETT |grpinv| NIL)
              (SEQ (LETT |i| 1) (LETT #6# |kkk|) G190
                   (COND ((|greater_SI| |i| #6#) (GO G191)))
                   (SEQ
                    (LETT |sgs|
                          (SPADCALL |sgs| (SPADCALL |outl| |i| (QREFELT $ 85))
                                    (QREFELT $ 86)))
                    (EXIT
                     (LETT |grpinv|
                           (SPADCALL |grpinv|
                                     (SPADCALL
                                      (CONS (|function| |PERMGRP;inv|) $)
                                      (SPADCALL |outl| |i| (QREFELT $ 85))
                                      (QREFELT $ 88))
                                     (QREFELT $ 86)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |removedGenerator| NIL)
              (LETT |baseLength| (SPADCALL |base_lst| (QREFELT $ 22)))
              (LETT |pt| (+ (- |baseLength| |kkk|) 1))
              (LETT |obs|
                    (|PERMGRP;orbitWithSvc1| |sgs| |grpinv|
                     (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $))
              (SPADCALL |orbv| |kkk| |obs| (QREFELT $ 91))
              (LETT |obs_len| (SPADCALL (QCAR |obs|) (QREFELT $ 22)))
              (COND
               ((EQL |obs_len| 1)
                (SEQ (LETT |removedGenerator| 'T)
                     (EXIT (SPADCALL |outl| |kkk| NIL (QREFELT $ 92))))))
              (LETT |i| 1)
              (LETT |outlk| (SPADCALL |outl| |kkk| (QREFELT $ 85)))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((> |i| (LENGTH |outlk|)) NIL)
                            ('T (> (LENGTH |outlk|) 1))))
                     (GO G191)))
                   (SEQ
                    (LETT |pos|
                          (SPADCALL (SPADCALL |outlk| |i| (QREFELT $ 45)) |sgs|
                                    (QREFELT $ 93)))
                    (LETT |sgs2| (SPADCALL |sgs| |pos| (QREFELT $ 94)))
                    (LETT |grpinv2| (SPADCALL |grpinv| |pos| (QREFELT $ 94)))
                    (LETT |obs2|
                          (|PERMGRP;orbitWithSvc1| |sgs2| |grpinv2|
                           (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL (QCAR |obs2|) (QREFELT $ 22)) |obs_len|)
                       (SEQ
                        (LETT |res|
                              (CONS (SPADCALL |outlk| |i| (QREFELT $ 45))
                                    |res|))
                        (LETT |sgs| |sgs2|) (LETT |grpinv| |grpinv2|)
                        (LETT |outlk| (SPADCALL |outlk| |i| (QREFELT $ 94)))
                        (SPADCALL |outl| |kkk| |outlk| (QREFELT $ 92))
                        (SPADCALL |orbv| |kkk| |obs2| (QREFELT $ 91))
                        (EXIT
                         (COND
                          (|do_words|
                           (SPADCALL |outword| |kkk|
                                     (SPADCALL
                                      (SPADCALL |outword| |kkk| (QREFELT $ 95))
                                      |i| (QREFELT $ 96))
                                     (QREFELT $ 97)))))))
                      ('T (LETT |i| (+ |i| 1))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |PERMGRP;bsgs|
        ((|group| $) (|wordProblem| |Boolean|) (|maxLoops| |Integer|)
         (|diff| |Integer|) ($ |NonNegativeInteger|))
        (SPROG
         ((|sizeOfGroup| (|NonNegativeInteger|)) (#1=#:G423 NIL) (|j| NIL)
          (|kkk| (|Integer|))
          (|outword| (|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|out| (|List| (|List| (|Vector| (|NonNegativeInteger|)))))
          (|orbv|
           (|Vector|
            (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                      (|:| |svc| (|Vector| (|Integer|))))))
          (#2=#:G410 NIL) (|baseOfGroup| (|List| (|NonNegativeInteger|)))
          (#3=#:G422 NIL) (|i| NIL) (|word| #4=(|List| (|NonNegativeInteger|)))
          (|ttt| (|Vector| (|NonNegativeInteger|)))
          (|word2| (|List| (|NonNegativeInteger|))) (#5=#:G421 NIL) (|wdi| NIL)
          (|add_cnt| (|Integer|)) (|noAnswer| #6=(|Boolean|)) (#7=#:G411 NIL)
          (|basePoint| (|NonNegativeInteger|)) (#8=#:G386 NIL)
          (|newBasePoint| #6#) (#9=#:G420 NIL) (|p| NIL) (|ii| NIL)
          (|z| #10=(|Vector| (|NonNegativeInteger|)))
          (|ppp|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|noresult| #6#) (#11=#:G419 NIL) (|jjj| NIL) (|word3| #4#)
          (|y1| (|Vector| (|NonNegativeInteger|))) (#12=#:G418 NIL) (|pt| NIL)
          (#13=#:G417 NIL) (|z0| NIL)
          (|gporbi|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|wordlist| (|List| (|List| (|NonNegativeInteger|))))
          (|sgsv| (|Vector| (|Vector| (|NonNegativeInteger|))))
          (|sgs| (|List| (|Vector| (|NonNegativeInteger|))))
          (|rejects| (|List| (|Vector| (|NonNegativeInteger|))))
          (#14=#:G416 NIL) (#15=#:G415 NIL)
          (|dummy_rec|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|newGroup| (|List| (|Vector| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|))
          (|words| (|List| (|List| (|NonNegativeInteger|))))
          (|q| (|Vector| (|NonNegativeInteger|))) (#16=#:G413 NIL) (|ggg| NIL)
          (#17=#:G414 NIL) (|ggp| NIL) (|gp| (|List| (|Permutation| S)))
          (|tmpv| #10#) (#18=#:G412 NIL)
          (|gp_info|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|))))))
          (|degree| (|NonNegativeInteger|)) (|supp| (|List| S))
          (|outwordr|
           (|Reference| (|List| (|List| (|List| (|NonNegativeInteger|))))))
          (|outr|
           (|Reference| (|List| (|List| (|Vector| (|NonNegativeInteger|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |basePoint| 0) (LETT |newBasePoint| NIL)
                (LETT |baseOfGroup| NIL) (LETT |out| NIL) (LETT |outword| NIL)
                (LETT |outr| (SPADCALL NIL (QREFELT $ 98)))
                (LETT |outwordr| (SPADCALL NIL (QREFELT $ 99)))
                (LETT |supp| (SPADCALL |group| (QREFELT $ 52)))
                (LETT |degree| (LENGTH |supp|))
                (LETT |gp_info| (VECTOR 1 NIL NIL #() NIL NIL))
                (COND
                 ((EQL |degree| 0)
                  (SEQ (PROGN (RPLACD |group| |gp_info|) (QCDR |group|))
                       (EXIT (PROGN (LETT #18# 1) (GO #19=#:G409))))))
                (LETT |newGroup| NIL)
                (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)))
                (LETT |gp| (QCAR |group|)) (LETT |words| NIL)
                (SEQ (LETT |ggp| NIL) (LETT #17# |gp|) (LETT |ggg| 1)
                     (LETT #16# (LENGTH |gp|)) G190
                     (COND
                      ((OR (|greater_SI| |ggg| #16#) (ATOM #17#)
                           (PROGN (LETT |ggp| (CAR #17#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |q|
                            (SPADCALL |supp| |ggp| |degree| (QREFELT $ 69)))
                      (LETT |newGroup| (CONS |q| |newGroup|))
                      (EXIT
                       (COND
                        (|wordProblem|
                         (LETT |words|
                               (CONS (SPADCALL |ggg| (QREFELT $ 100))
                                     |words|))))))
                     (LETT |ggg|
                           (PROG1 (|inc_SI| |ggg|) (LETT #17# (CDR #17#))))
                     (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |maxLoops| 1)
                  (SEQ
                   (COND
                    ((ZEROP (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22)))
                     (LETT |k|
                           (|PERMGRP;bsgs1| |newGroup| 1 NIL 20 |group| 0
                            |outr| |outwordr| $))))
                   (EXIT
                    (LETT |maxLoops|
                          (- (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22))
                             1))))))
                (LETT |k|
                      (|PERMGRP;bsgs1| |newGroup| 1 |words| |maxLoops| |group|
                       |diff| |outr| |outwordr| $))
                (LETT |out| (SPADCALL |outr| (QREFELT $ 81)))
                (LETT |outword| (SPADCALL |outwordr| (QREFELT $ 83)))
                (LETT |kkk| 1) (LETT |newGroup| (REVERSE |newGroup|))
                (LETT |noAnswer| 'T) (LETT |add_cnt| 0)
                (LETT |dummy_rec| (CONS NIL (MAKE-ARRAY 0)))
                (LETT |baseOfGroup| (QVELT (QCDR |group|) 2))
                (QSETVELT |gp_info| 2 |baseOfGroup|)
                (LETT |orbv|
                      (MAKEARR1 (SPADCALL |baseOfGroup| (QREFELT $ 22))
                                |dummy_rec|))
                (SEQ G190 (COND ((NULL |noAnswer|) (GO G191)))
                     (SEQ (QSETVELT |gp_info| 2 |baseOfGroup|)
                          (QSETVELT |gp_info| 3 |orbv|) (LETT |sgs| NIL)
                          (LETT |wordlist| NIL)
                          (SEQ (LETT |i| 1) (LETT #15# (- |kkk| 1)) G190
                               (COND ((|greater_SI| |i| #15#) (GO G191)))
                               (SEQ
                                (LETT |sgs|
                                      (SPADCALL |sgs|
                                                (SPADCALL |out| |i|
                                                          (QREFELT $ 85))
                                                (QREFELT $ 86)))
                                (EXIT
                                 (COND
                                  (|wordProblem|
                                   (LETT |wordlist|
                                         (SPADCALL |wordlist|
                                                   (SPADCALL |outword| |i|
                                                             (QREFELT $ 95))
                                                   (QREFELT $ 101)))))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (LETT |noresult| 'T)
                          (LETT |z| (SPADCALL |degree| 0 (QREFELT $ 28)))
                          (SEQ (LETT |i| |kkk|)
                               (LETT #14#
                                     (SPADCALL |baseOfGroup| (QREFELT $ 22)))
                               G190
                               (COND
                                ((OR (> |i| #14#) (NULL |noresult|))
                                 (GO G191)))
                               (SEQ
                                (LETT |rejects|
                                      (|PERMGRP;reduceGenerators| |i|
                                       |wordProblem| |gp_info| |out| |outword|
                                       $))
                                (LETT |sgs|
                                      (SPADCALL |sgs|
                                                (SPADCALL |out| |i|
                                                          (QREFELT $ 85))
                                                (QREFELT $ 86)))
                                (LETT |sgsv| (SPADCALL |sgs| (QREFELT $ 35)))
                                (LETT |wordv| (MAKE-ARRAY 0))
                                (COND
                                 (|wordProblem|
                                  (SEQ
                                   (LETT |wordlist|
                                         (SPADCALL |wordlist|
                                                   (SPADCALL |outword| |i|
                                                             (QREFELT $ 95))
                                                   (QREFELT $ 101)))
                                   (EXIT
                                    (LETT |wordv|
                                          (SPADCALL |wordlist|
                                                    (QREFELT $ 37)))))))
                                (LETT |gporbi|
                                      (SPADCALL |orbv| |i| (QREFELT $ 102)))
                                (SEQ (LETT |z0| NIL) (LETT #13# |rejects|) G190
                                     (COND
                                      ((OR (ATOM #13#)
                                           (PROGN (LETT |z0| (CAR #13#)) NIL)
                                           (NULL |noresult|))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |z|
                                            (SPADCALL |z0| (QREFELT $ 103)))
                                      (LETT |ppp|
                                            (|PERMGRP;strip| |z| |i| NIL |orbv|
                                             |sgsv| |wordv| $))
                                      (LETT |noresult|
                                            (|PERMGRP;testIdentity|
                                             (QCAR |ppp|) $))
                                      (EXIT
                                       (COND
                                        ((NULL |noresult|)
                                         (SEQ
                                          (COND
                                           (|wordProblem|
                                            (SEQ
                                             (LETT |z|
                                                   (SPADCALL |z0|
                                                             (QREFELT $ 103)))
                                             (EXIT
                                              (LETT |ppp|
                                                    (|PERMGRP;strip| |z| |i| 'T
                                                     |orbv| |sgsv| |wordv|
                                                     $))))))
                                          (LETT |z| (QCAR |ppp|))
                                          (EXIT
                                           (LETT |word| (QCDR |ppp|))))))))
                                     (LETT #13# (CDR #13#)) (GO G190) G191
                                     (EXIT NIL))
                                (SEQ (LETT |pt| NIL)
                                     (LETT #12# (QCAR |gporbi|)) G190
                                     (COND
                                      ((OR (ATOM #12#)
                                           (PROGN (LETT |pt| (CAR #12#)) NIL)
                                           (NULL |noresult|))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |ppp|
                                            (|PERMGRP;cosetRep1| |pt|
                                             |wordProblem| |gporbi| |sgsv|
                                             |wordv| $))
                                      (LETT |y1|
                                            (|PERMGRP;inv| (QCAR |ppp|) $))
                                      (LETT |word3| (QCDR |ppp|))
                                      (EXIT
                                       (SEQ (LETT |jjj| 1)
                                            (LETT #11# (LENGTH |sgs|)) G190
                                            (COND
                                             ((OR (|greater_SI| |jjj| #11#)
                                                  (NULL |noresult|))
                                              (GO G191)))
                                            (SEQ (LETT |word| NIL)
                                                 (|PERMGRP;times!| |z|
                                                  (QAREF1O |sgsv| |jjj| 1) |y1|
                                                  $)
                                                 (COND
                                                  (|wordProblem|
                                                   (LETT |word|
                                                         (QAREF1O |wordv| |jjj|
                                                                  1))))
                                                 (LETT |ppp|
                                                       (|PERMGRP;strip| |z| |i|
                                                        NIL |orbv| |sgsv|
                                                        |wordv| $))
                                                 (LETT |z| (QCAR |ppp|))
                                                 (LETT |noresult|
                                                       (|PERMGRP;testIdentity|
                                                        |z| $))
                                                 (EXIT
                                                  (COND
                                                   ((NULL |noresult|)
                                                    (COND
                                                     (|wordProblem|
                                                      (SEQ
                                                       (LETT |z|
                                                             (|PERMGRP;times|
                                                              (QAREF1O |sgsv|
                                                                       |jjj| 1)
                                                              |y1| $))
                                                       (LETT |ppp|
                                                             (|PERMGRP;strip|
                                                              |z| |i| 'T |orbv|
                                                              |sgsv| |wordv|
                                                              $))
                                                       (LETT |z| (QCAR |ppp|))
                                                       (EXIT
                                                        (LETT |word|
                                                              (SPADCALL
                                                               (QCDR |ppp|)
                                                               |word|
                                                               (QREFELT $
                                                                        33)))))))))))
                                            (LETT |jjj| (|inc_SI| |jjj|))
                                            (GO G190) G191 (EXIT NIL))))
                                     (LETT #12# (CDR #12#)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((NULL |noresult|)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |ii| 1) (LETT |p| NIL)
                                          (LETT #9# |baseOfGroup|) G190
                                          (COND
                                           ((OR (ATOM #9#)
                                                (PROGN
                                                 (LETT |p| (CAR #9#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ (LETT |basePoint| 1)
                                               (LETT |newBasePoint| 'T)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL (QAREF1O |z| |p| 1)
                                                            |p| (QREFELT $ 24))
                                                  (SEQ
                                                   (LETT |newBasePoint| NIL)
                                                   (LETT |basePoint|
                                                         (PROG1
                                                             (LETT #8#
                                                                   (+
                                                                    (-
                                                                     (SPADCALL
                                                                      |baseOfGroup|
                                                                      (QREFELT
                                                                       $ 22))
                                                                     |ii|)
                                                                    1))
                                                           (|check_subtype2|
                                                            (>= #8# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #8#)))
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #7# |$NoValue|)
                                                     (GO #20=#:G389))))))))
                                          (LETT #9#
                                                (PROG1 (CDR #9#)
                                                  (LETT |ii| (|inc_SI| |ii|))))
                                          (GO G190) G191 (EXIT NIL)))
                                    #20# (EXIT #7#))))))
                               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                          (LETT |noAnswer|
                                (NULL (|PERMGRP;testIdentity| |z| $)))
                          (EXIT
                           (COND
                            (|noAnswer|
                             (SEQ (LETT |add_cnt| (+ |add_cnt| 1))
                                  (LETT |word2| NIL)
                                  (COND
                                   (|wordProblem|
                                    (SEQ
                                     (SEQ (LETT |wdi| NIL) (LETT #5# |word3|)
                                          G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |wdi| (CAR #5#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |ttt|
                                                 (SPADCALL |newGroup| |wdi|
                                                           (QREFELT $ 45)))
                                           (EXIT
                                            (SEQ G190
                                                 (COND
                                                  ((NULL
                                                    (NULL
                                                     (|PERMGRP;testIdentity|
                                                      |ttt| $)))
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |word2|
                                                        (CONS |wdi| |word2|))
                                                  (EXIT
                                                   (LETT |ttt|
                                                         (|PERMGRP;times| |ttt|
                                                          (SPADCALL |newGroup|
                                                                    |wdi|
                                                                    (QREFELT $
                                                                             45))
                                                          $))))
                                                 NIL (GO G190) G191
                                                 (EXIT NIL))))
                                          (LETT #5# (CDR #5#)) (GO G190) G191
                                          (EXIT NIL))
                                     (LETT |word|
                                           (SPADCALL |word| |word2|
                                                     (QREFELT $ 33)))
                                     (EXIT
                                      (LETT |word|
                                            (|PERMGRP;shortenWord| |word|
                                             |group| $))))))
                                  (COND
                                   (|newBasePoint|
                                    (SEQ
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |i| 1) (LETT #3# |degree|)
                                            G190
                                            (COND
                                             ((|greater_SI| |i| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((SPADCALL
                                                 (SPADCALL |z| |i|
                                                           (QREFELT $ 73))
                                                 |i| (QREFELT $ 24))
                                                (SEQ
                                                 (LETT |baseOfGroup|
                                                       (SPADCALL |baseOfGroup|
                                                                 (LIST |i|)
                                                                 (QREFELT $
                                                                          33)))
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #2# |$NoValue|)
                                                   (GO #21=#:G401))))))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191 (EXIT NIL)))
                                      #21# (EXIT #2#))
                                     (LETT |orbv|
                                           (MAKEARR1
                                            (SPADCALL |baseOfGroup|
                                                      (QREFELT $ 22))
                                            |dummy_rec|))
                                     (LETT |out|
                                           (CONS (SPADCALL |z| (QREFELT $ 104))
                                                 |out|))
                                     (EXIT
                                      (COND
                                       (|wordProblem|
                                        (LETT |outword|
                                              (CONS
                                               (SPADCALL |word|
                                                         (QREFELT $ 105))
                                               |outword|)))))))
                                   ('T
                                    (SEQ
                                     (SPADCALL |out| |basePoint|
                                               (CONS |z|
                                                     (SPADCALL |out|
                                                               |basePoint|
                                                               (QREFELT $ 85)))
                                               (QREFELT $ 92))
                                     (EXIT
                                      (COND
                                       (|wordProblem|
                                        (SPADCALL |outword| |basePoint|
                                                  (CONS |word|
                                                        (SPADCALL |outword|
                                                                  |basePoint|
                                                                  (QREFELT $
                                                                           95)))
                                                  (QREFELT $ 97))))))))
                                  (EXIT (LETT |kkk| |basePoint|)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |sizeOfGroup| 1)
                (SEQ (LETT |j| 1)
                     (LETT #1# (SPADCALL |baseOfGroup| (QREFELT $ 22))) G190
                     (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |sizeOfGroup|
                             (* |sizeOfGroup|
                                (SPADCALL
                                 (QCAR (SPADCALL |orbv| |j| (QREFELT $ 102)))
                                 (QREFELT $ 22))))))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                (PROGN
                 (RPLACD |group|
                         (VECTOR |sizeOfGroup| |sgs| |baseOfGroup| |orbv|
                                 |supp| |wordlist|))
                 (QCDR |group|))
                (EXIT |sizeOfGroup|)))
          #19# (EXIT #18#)))) 

(SDEFUN |PERMGRP;initialize| ((|group| $) ($ |Set| (|Permutation| S)))
        (SPROG
         ((#1=#:G428 NIL) (|gen| NIL) (|gp| (|List| (|Permutation| S)))
          (|group2| (|Set| (|Permutation| S))))
         (SEQ (LETT |group2| (SPADCALL (QREFELT $ 107)))
              (LETT |gp| (QCAR |group|))
              (SEQ (LETT |gen| NIL) (LETT #1# |gp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |gen| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((> (SPADCALL |gen| (QREFELT $ 108)) 0)
                       (SPADCALL |gen| |group2| (QREFELT $ 109))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |group2|)))) 

(SDEFUN |PERMGRP;knownGroup?| ((|gp| $) ($ |Void|))
        (SEQ
         (COND
          ((EQL (QVELT (QCDR |gp|) 0) 0) (|PERMGRP;bsgs| |gp| NIL 20 0 $)))
         (EXIT (SPADCALL (QREFELT $ 111))))) 

(SDEFUN |PERMGRP;subgroup| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G439 NIL) (#2=#:G440 NIL) (#3=#:G441 NIL) (|el| NIL)
          (|gpset2| #4=(|Set| (|Permutation| S))) (|gpset1| #4#))
         (SEQ
          (EXIT
           (SEQ (LETT |gpset1| (|PERMGRP;initialize| |gp1| $))
                (LETT |gpset2| (|PERMGRP;initialize| |gp2| $))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |gpset1| |gpset2| (QREFELT $ 112))
                             (QREFELT $ 113))
                   'T)
                  ('T
                   (SEQ
                    (SEQ
                     (EXIT
                      (SEQ (LETT |el| NIL)
                           (LETT #3# (SPADCALL |gpset1| (QREFELT $ 114))) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |el| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |el| |gp2| (QREFELT $ 115)))
                               (PROGN
                                (LETT #1#
                                      (PROGN (LETT #2# NIL) (GO #5=#:G438)))
                                (GO #6=#:G435))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                     #6# (EXIT #1#))
                    (EXIT 'T)))))))
          #5# (EXIT #2#)))) 

(SDEFUN |PERMGRP;memberInternal|
        ((|p| |Permutation| S) (|gp| $) (|do_words| |Boolean|)
         ($ |Record| (|:| |bool| (|Boolean|))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|str|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|grpv| (|Vector| (|Vector| (|NonNegativeInteger|)))) (#1=#:G455 NIL)
          (|i| NIL) (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|pp| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|))
          (|base_lst| (|List| (|NonNegativeInteger|)))
          (|orbv|
           (|Vector|
            (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                      (|:| |svc| (|Vector| (|Integer|))))))
          (|sgsl| (|List| (|Vector| (|NonNegativeInteger|))))
          (|gp_info|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|))))))
          (#2=#:G453 NIL) (#3=#:G452 NIL) (#4=#:G454 NIL) (|x| NIL)
          (|mP| (|List| S)) (|gr_supp| (|List| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |gr_supp| (SPADCALL |gp| (QREFELT $ 52)))
                (LETT |mP|
                      (SPADCALL (SPADCALL |p| (QREFELT $ 55)) (QREFELT $ 57)))
                (SEQ
                 (EXIT
                  (SEQ (LETT |x| NIL) (LETT #4# |mP|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |x| |gr_supp| (QREFELT $ 116)))
                           (PROGN
                            (LETT #3#
                                  (PROGN
                                   (LETT #2# (CONS NIL NIL))
                                   (GO #5=#:G451)))
                            (GO #6=#:G445))))))
                       (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
                 #6# (EXIT #3#))
                (COND
                 ((NULL |do_words|)
                  (COND
                   ((SPADCALL |p| (QCAR |gp|) (QREFELT $ 117))
                    (EXIT (PROGN (LETT #2# (CONS 'T NIL)) (GO #5#)))))))
                (|PERMGRP;knownGroup?| |gp| $) (LETT |gp_info| (QCDR |gp|))
                (LETT |sgsl| (QVELT |gp_info| 1))
                (LETT |orbv| (QVELT |gp_info| 3))
                (LETT |base_lst| (QVELT |gp_info| 2))
                (LETT |degree| (LENGTH |gr_supp|))
                (LETT |pp| (SPADCALL |gr_supp| |p| |degree| (QREFELT $ 69)))
                (LETT |wordv| (MAKE-ARRAY 0))
                (COND
                 (|do_words|
                  (SEQ (LETT |wordv| (MAKEARR1 (LENGTH |sgsl|) NIL))
                       (EXIT
                        (SEQ (LETT |i| 1) (LETT #1# (LENGTH |sgsl|)) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |wordv| |i| (LIST |i|)
                                         (QREFELT $ 118))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))))))
                (LETT |grpv| (SPADCALL |sgsl| (QREFELT $ 35)))
                (LETT |str|
                      (|PERMGRP;strip| |pp|
                       (SPADCALL |base_lst| (QREFELT $ 22)) |do_words| |orbv|
                       |grpv| |wordv| $))
                (EXIT
                 (CONS (|PERMGRP;testIdentity| (QCAR |str|) $) (QCDR |str|)))))
          #5# (EXIT #2#)))) 

(SDEFUN |PERMGRP;orbit_words1|
        ((|p0| |NonNegativeInteger|) (|p| |NonNegativeInteger|)
         (|grp| |List| (|Vector| (|NonNegativeInteger|)))
         (|acc| |List| (|NonNegativeInteger|))
         (|res| |Vector| (|List| (|NonNegativeInteger|))) ($ |Void|))
        (SPROG
         ((|acc1| (|List| (|NonNegativeInteger|))) (|q| (|NonNegativeInteger|))
          (#1=#:G462 NIL) (|g| NIL) (|i| NIL))
         (SEQ (LETT |i| 1) (LETT |g| NIL) (LETT #1# |grp|) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL)) (GO G191)))
              (SEQ (LETT |q| (QAREF1O |g| |p| 1))
                   (EXIT
                    (COND
                     ((OR (EQL |p0| |q|) (NULL (NULL (QAREF1O |res| |q| 1))))
                      "skip")
                     ('T
                      (SEQ (LETT |acc1| (CONS |i| |acc|))
                           (SPADCALL |res| |q| |acc1| (QREFELT $ 118))
                           (EXIT
                            (|PERMGRP;orbit_words1| |p0| |q| |grp| |acc1| |res|
                             $)))))))
              (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|)))) (GO G190)
              G191 (EXIT NIL)))) 

(SDEFUN |PERMGRP;orbit_words|
        ((|p| |NonNegativeInteger|)
         (|grp| |List| (|Vector| (|NonNegativeInteger|)))
         ($ |Vector| (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|res| (|Vector| (|List| (|NonNegativeInteger|))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL (|SPADfirst| |grp|) (QREFELT $ 27)))
              (LETT |res| (MAKEARR1 |n| NIL))
              (|PERMGRP;orbit_words1| |p| |p| |grp| NIL |res| $) (EXIT |res|)))) 

(SDEFUN |PERMGRP;relations_for_orbit|
        ((|p| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         (|orbd| |Vector|
          (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                    (|:| |svc| (|Vector| (|Integer|)))))
         (|grpv| |Vector| (|Vector| (|NonNegativeInteger|)))
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (|rl| (|List| (|Integer|)))
          (|ll| (|List| (|Integer|))) (#1=#:G490 NIL) (|k| NIL) (#2=#:G489 NIL)
          (|rh| (|List| (|NonNegativeInteger|)))
          (|rhr|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|nw| (|Vector| (|NonNegativeInteger|)))
          (|iw| (|List| (|NonNegativeInteger|))) (|p1| (|NonNegativeInteger|))
          (#3=#:G488 NIL) (|j| NIL) (|wi| (|Vector| (|NonNegativeInteger|)))
          (|wi_l| (|List| (|NonNegativeInteger|))) (#4=#:G487 NIL) (|i| NIL)
          (#5=#:G486 NIL) (#6=#:G485 NIL) (#7=#:G484 NIL)
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|wvi| #8=(|Vector| (|Vector| (|NonNegativeInteger|)))) (|wv| #8#)
          (|n0| (|NonNegativeInteger|))
          (|ww| (|Vector| (|List| (|NonNegativeInteger|))))
          (|grpl| (|List| (|Vector| (|NonNegativeInteger|)))))
         (SEQ (LETT |res| NIL)
              (LETT |grpl|
                    (SPADCALL (SPADCALL |grpv| (QREFELT $ 119)) |m|
                              (QREFELT $ 120)))
              (LETT |ww| (|PERMGRP;orbit_words| |p| |grpl| $))
              (LETT |n0| (QVSIZE (QCDR (SPADCALL |orbd| 1 (QREFELT $ 102)))))
              (LETT |wv| (MAKEARR1 |n0| (MAKE-ARRAY 0)))
              (LETT |wvi| (MAKEARR1 |n0| (MAKE-ARRAY 0)))
              (LETT |wordv| (MAKEARR1 |n0| NIL))
              (SEQ (LETT |i| 1) (LETT #7# |n0|) G190
                   (COND ((|greater_SI| |i| #7#) (GO G191)))
                   (SEQ (SPADCALL |wordv| |i| (LIST |i|) (QREFELT $ 118))
                        (LETT |wi_l| (QAREF1O |ww| |i| 1))
                        (EXIT
                         (COND ((NULL |wi_l|) "skip")
                               ('T
                                (SEQ
                                 (LETT |wi| (SPADCALL |n0| 0 (QREFELT $ 28)))
                                 (SEQ (LETT |j| 1) (LETT #6# |n0|) G190
                                      (COND ((|greater_SI| |j| #6#) (GO G191)))
                                      (SEQ (EXIT (QSETAREF1O |wi| |j| |j| 1)))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (SEQ (LETT |j| NIL)
                                      (LETT #5# (REVERSE |wi_l|)) G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN (LETT |j| (CAR #5#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (|PERMGRP;times!| |wi|
                                         (QAREF1O |grpv| |j| 1) |wi| $)))
                                      (LETT #5# (CDR #5#)) (GO G190) G191
                                      (EXIT NIL))
                                 (QSETAREF1O |wv| |i| |wi| 1)
                                 (EXIT
                                  (QSETAREF1O |wvi| |i| (|PERMGRP;inv| |wi| $)
                                              1)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1) (LETT #4# |n0|) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |wi_l| (QAREF1O |ww| |i| 1))
                        (EXIT
                         (COND ((NULL |wi_l|) "skip")
                               ('T
                                (SEQ (LETT |wi| (QAREF1O |wv| |i| 1))
                                     (EXIT
                                      (SEQ (LETT |j| 1) (LETT #3# |m|) G190
                                           (COND
                                            ((|greater_SI| |j| #3#) (GO G191)))
                                           (SEQ
                                            (LETT |nw|
                                                  (|PERMGRP;times|
                                                   (SPADCALL |grpv| |j|
                                                             (QREFELT $ 30))
                                                   |wi| $))
                                            (LETT |p1| (QAREF1O |nw| |p| 1))
                                            (LETT |iw| NIL)
                                            (COND
                                             ((SPADCALL |p1| |p|
                                                        (QREFELT $ 24))
                                              (SEQ
                                               (LETT |nw|
                                                     (|PERMGRP;times|
                                                      (SPADCALL |wvi| |p1|
                                                                (QREFELT $ 30))
                                                      |nw| $))
                                               (EXIT
                                                (LETT |iw|
                                                      (SPADCALL |ww| |p1|
                                                                (QREFELT $
                                                                         32)))))))
                                            (EXIT
                                             (COND
                                              ((SPADCALL (CONS |j| |wi_l|) |iw|
                                                         (QREFELT $ 121))
                                               "skip")
                                              ('T
                                               (SEQ
                                                (LETT |nw|
                                                      (|PERMGRP;inv| |nw| $))
                                                (LETT |rhr|
                                                      (|PERMGRP;strip| |nw|
                                                       (QVSIZE |orbd|) 'T
                                                       |orbd| |grpv| |wordv|
                                                       $))
                                                (LETT |rh|
                                                      (SPADCALL |iw|
                                                                (QCDR |rhr|)
                                                                (QREFELT $
                                                                         122)))
                                                (LETT |rl| NIL)
                                                (SEQ (LETT |k| NIL)
                                                     (LETT #2# |rh|) G190
                                                     (COND
                                                      ((OR (ATOM #2#)
                                                           (PROGN
                                                            (LETT |k|
                                                                  (CAR #2#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT |rl|
                                                             (CONS (- |k|)
                                                                   |rl|))))
                                                     (LETT #2# (CDR #2#))
                                                     (GO G190) G191 (EXIT NIL))
                                                (LETT |ll| NIL)
                                                (SEQ (LETT |k| NIL)
                                                     (LETT #1#
                                                           (QAREF1O |ww| |i|
                                                                    1))
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #1#)
                                                           (PROGN
                                                            (LETT |k|
                                                                  (CAR #1#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT |ll|
                                                             (CONS |k| |ll|))))
                                                     (LETT #1# (CDR #1#))
                                                     (GO G190) G191 (EXIT NIL))
                                                (LETT |ll| (NREVERSE |ll|))
                                                (LETT |rl|
                                                      (SPADCALL |ll| |rl|
                                                                (QREFELT $
                                                                         124)))
                                                (LETT |rl| (CONS |j| |rl|))
                                                (EXIT
                                                 (LETT |res|
                                                       (CONS |rl| |res|))))))))
                                           (LETT |j| (|inc_SI| |j|)) (GO G190)
                                           G191 (EXIT NIL))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |PERMGRP;relations_in_strong_generators|
        ((|orbd| |Vector|
          (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                    (|:| |svc| (|Vector| (|Integer|)))))
         (|grpv| |Vector| (|Vector| (|NonNegativeInteger|)))
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (#1=#:G503 NIL) (|p0| NIL)
          (#2=#:G504 NIL) (|m1| NIL) (|blp| (|List| (|NonNegativeInteger|)))
          (|p1| (|NonNegativeInteger|)) (#3=#:G501 NIL)
          (|gri_l| (|List| #4=(|NonNegativeInteger|)))
          (|p2| (|NonNegativeInteger|))
          (|gv| (|Vector| (|NonNegativeInteger|))) (|j| NIL)
          (|bl| (|List| (|NonNegativeInteger|)))
          (|orbi|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (#5=#:G502 NIL) (|i| NIL) (|m| #4#) (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (QVSIZE |orbd|)) (LETT |m| (QVSIZE |grpv|))
              (LETT |res| NIL) (LETT |bl| NIL)
              (SEQ (LETT |i| 1) (LETT #5# |k|) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ (LETT |orbi| (QAREF1O |orbd| |i| 1))
                        (EXIT
                         (LETT |bl| (CONS (|SPADfirst| (QCAR |orbi|)) |bl|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |gri_l| (LIST |m|)) (LETT |blp| |bl|)
              (LETT |p1| (|SPADfirst| |blp|)) (LETT |blp| (CDR |blp|))
              (SEQ
               (EXIT
                (SEQ (LETT |j| |m|) G190 (COND ((< |j| 1) (GO G191)))
                     (SEQ (LETT |gv| (QAREF1O |grpv| |j| 1))
                          (LETT |p2| (QAREF1O |gv| |p1| 1))
                          (EXIT
                           (COND
                            ((EQL |p1| |p2|)
                             (SEQ (LETT |gri_l| (CONS |j| |gri_l|))
                                  (EXIT
                                   (COND
                                    ((NULL |blp|)
                                     (PROGN
                                      (LETT #3# |$NoValue|)
                                      (GO #6=#:G497)))
                                    ('T
                                     (SEQ (LETT |p1| (|SPADfirst| |blp|))
                                          (EXIT
                                           (LETT |blp| (CDR |blp|))))))))))))
                     (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL)))
               #6# (EXIT #3#))
              (SEQ (LETT |m1| NIL) (LETT #2# |gri_l|) (LETT |p0| NIL)
                   (LETT #1# (REVERSE |bl|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p0| (CAR #1#)) NIL)
                         (ATOM #2#) (PROGN (LETT |m1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (|PERMGRP;relations_for_orbit| |p0| |m1| |orbd|
                             |grpv| $)
                            |res| (QREFELT $ 126)))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |PERMGRP;relationsInStrongGenerators;$L;29|
        ((|gp| $) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|grpv| (|Vector| (|Vector| (|NonNegativeInteger|))))
          (|gi|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))))
         (SEQ (|PERMGRP;knownGroup?| |gp| $) (LETT |gi| (QCDR |gp|))
              (LETT |grpv| (SPADCALL (QVELT |gi| 1) (QREFELT $ 35)))
              (EXIT
               (|PERMGRP;relations_in_strong_generators| (QVELT |gi| 3) |grpv|
                $))))) 

(SDEFUN |PERMGRP;relationsInGenerators;$L;30|
        ((|gp| $) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (|nrel| (|List| (|Integer|)))
          (#1=#:G542 NIL) (|k| NIL) (|cw| (|List| (|Integer|))) (#2=#:G541 NIL)
          (|j| NIL)
          (|rhr|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|q| (|Vector| (|NonNegativeInteger|))) (#3=#:G539 NIL) (|i| NIL)
          (#4=#:G540 NIL) (|ggp| NIL) (#5=#:G538 NIL)
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|n0| (|NonNegativeInteger|)) (|nn| (|NonNegativeInteger|))
          (|supp| (|List| S)) (#6=#:G537 NIL) (#7=#:G536 NIL) (#8=#:G535 NIL)
          (|srel| NIL) (|iwd| (|List| (|Integer|))) (#9=#:G534 NIL)
          (#10=#:G533 NIL) (#11=#:G532 NIL) (#12=#:G530 NIL) (#13=#:G531 NIL)
          (|wli| NIL) (|iwords| #14=(|Vector| (|List| (|Integer|))))
          (|words| #14#) (|srels| (|List| (|List| (|Integer|))))
          (|orbd|
           #15=(|Vector|
                (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                          (|:| |svc| (|Vector| (|Integer|))))))
          (|grpv| (|Vector| (|Vector| (|NonNegativeInteger|))))
          (|gi|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs| #15#) (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |gi| (QCDR |gp|))
              (COND
               ((EQL (LENGTH (QVELT |gi| 5)) 0)
                (SEQ (SPADCALL |gp| (QREFELT $ 128))
                     (EXIT (LETT |gi| (QCDR |gp|))))))
              (LETT |grpv| (SPADCALL (QVELT |gi| 1) (QREFELT $ 35)))
              (LETT |orbd| (QVELT |gi| 3))
              (LETT |srels|
                    (|PERMGRP;relations_in_strong_generators| |orbd| |grpv| $))
              (LETT |words| (MAKEARR1 (LENGTH (QVELT |gi| 5)) NIL))
              (LETT |iwords| (MAKEARR1 (QVSIZE |words|) NIL))
              (SEQ (LETT |wli| NIL) (LETT #13# (QVELT |gi| 5)) (LETT |i| 1)
                   (LETT #12# (QVSIZE |words|)) G190
                   (COND
                    ((OR (|greater_SI| |i| #12#) (ATOM #13#)
                         (PROGN (LETT |wli| (CAR #13#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SPADCALL |words| |i|
                              (PROGN
                               (LETT #11# NIL)
                               (SEQ (LETT |j| NIL) (LETT #10# |wli|) G190
                                    (COND
                                     ((OR (ATOM #10#)
                                          (PROGN (LETT |j| (CAR #10#)) NIL))
                                      (GO G191)))
                                    (SEQ (EXIT (LETT #11# (CONS |j| #11#))))
                                    (LETT #10# (CDR #10#)) (GO G190) G191
                                    (EXIT (NREVERSE #11#))))
                              (QREFELT $ 130))
                    (LETT |iwd| NIL)
                    (SEQ (LETT |j| NIL) (LETT #9# |wli|) G190
                         (COND
                          ((OR (ATOM #9#) (PROGN (LETT |j| (CAR #9#)) NIL))
                           (GO G191)))
                         (SEQ (EXIT (LETT |iwd| (CONS (- |j|) |iwd|))))
                         (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |iwords| |i| |iwd| (QREFELT $ 130))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #13# (CDR #13#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL)
              (SEQ (LETT |srel| NIL) (LETT #8# |srels|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |srel| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |nrel| NIL)
                        (SEQ (LETT |i| NIL) (LETT #7# |srel|) G190
                             (COND
                              ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |cw|
                                    (COND ((> |i| 0) (QAREF1O |words| |i| 1))
                                          ('T (QAREF1O |iwords| (- |i|) 1))))
                              (EXIT
                               (SEQ (LETT |j| NIL) (LETT #6# |cw|) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN (LETT |j| (CAR #6#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT (LETT |nrel| (CONS |j| |nrel|))))
                                    (LETT #6# (CDR #6#)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |res| (CONS (NREVERSE |nrel|) |res|))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |supp| (SPADCALL |gp| (QREFELT $ 52)))
              (LETT |nn| (LENGTH |supp|)) (LETT |n0| (QVSIZE |grpv|))
              (LETT |wordv| (MAKEARR1 |n0| NIL))
              (SEQ (LETT |i| 1) (LETT #5# |n0|) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT (SPADCALL |wordv| |i| (LIST |i|) (QREFELT $ 118))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |ggp| NIL) (LETT #4# (QCAR |gp|)) (LETT |i| 1)
                   (LETT #3# (QVSIZE |words|)) G190
                   (COND
                    ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                         (PROGN (LETT |ggp| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |q| (SPADCALL |supp| |ggp| |nn| (QREFELT $ 69)))
                        (LETT |rhr|
                              (|PERMGRP;strip| |q| (QVSIZE |orbd|) 'T |orbd|
                               |grpv| |wordv| $))
                        (LETT |nrel| NIL)
                        (SEQ (LETT |j| NIL) (LETT #2# (QCDR |rhr|)) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |j| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |cw|
                                    (SPADCALL |words| |j| (QREFELT $ 131)))
                              (EXIT
                               (SEQ (LETT |k| NIL) (LETT #1# |cw|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |k| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT (LETT |nrel| (CONS |k| |nrel|))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (LETT |nrel| (NREVERSE |nrel|))
                        (LETT |nrel| (CONS |i| |nrel|))
                        (EXIT (LETT |res| (CONS |nrel| |res|))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(PUT '|PERMGRP;coerce;$L;31| '|SPADreplace| 'QCAR) 

(SDEFUN |PERMGRP;coerce;$L;31| ((|gp| $) ($ |List| (|Permutation| S)))
        (QCAR |gp|)) 

(PUT '|PERMGRP;generators;$L;32| '|SPADreplace| 'QCAR) 

(SDEFUN |PERMGRP;generators;$L;32| ((|gp| $) ($ |List| (|Permutation| S)))
        (QCAR |gp|)) 

(SDEFUN |PERMGRP;strongGenerators;$L;33|
        ((|group| $) ($ |List| (|Permutation| S)))
        (SPROG
         ((|strongGens| (|List| (|Permutation| S)))
          (|pairs| (|List| (|List| S))) (#1=#:G552 NIL) (|j| NIL)
          (#2=#:G551 NIL) (|i| NIL) (|degree| (|NonNegativeInteger|))
          (|gr_sgs| (|List| (|Vector| (|NonNegativeInteger|))))
          (|gr_supp| (|List| S)))
         (SEQ (|PERMGRP;knownGroup?| |group| $)
              (LETT |gr_supp| (QVELT (QCDR |group|) 4))
              (LETT |gr_sgs| (QVELT (QCDR |group|) 1))
              (LETT |degree| (LENGTH |gr_supp|)) (LETT |strongGens| NIL)
              (SEQ (LETT |i| NIL) (LETT #2# |gr_sgs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pairs| NIL)
                        (SEQ (LETT |j| 1) (LETT #1# |degree|) G190
                             (COND ((|greater_SI| |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |pairs|
                                     (CONS
                                      (LIST
                                       (SPADCALL |gr_supp| |j| (QREFELT $ 42))
                                       (SPADCALL |gr_supp|
                                                 (SPADCALL |i| |j|
                                                           (QREFELT $ 73))
                                                 (QREFELT $ 42)))
                                      |pairs|))))
                             (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |strongGens|
                               (CONS (SPADCALL |pairs| (QREFELT $ 134))
                                     |strongGens|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |strongGens|))))) 

(SDEFUN |PERMGRP;elt;$NniP;34|
        ((|gp| $) (|i| |NonNegativeInteger|) ($ |Permutation| S))
        (SPADCALL (QCAR |gp|) |i| (QREFELT $ 136))) 

(SDEFUN |PERMGRP;movedPoints;$S;35| ((|gp| $) ($ |Set| S))
        (SPADCALL (SPADCALL |gp| (QREFELT $ 52)) (QREFELT $ 138))) 

(SDEFUN |PERMGRP;random;$IP;36|
        ((|group| $) (|maximalNumberOfFactors| |Integer|) ($ |Permutation| S))
        (SPROG
         ((|numberOfLoops| #1=(|Integer|)) (|randomElement| (|Permutation| S))
          (|randomInteger| #1#) (|numberOfGenerators| (|NonNegativeInteger|))
          (|gp| (|List| (|Permutation| S))))
         (SEQ
          (COND ((< |maximalNumberOfFactors| 1) (|spadConstant| $ 23))
                ('T
                 (SEQ (LETT |gp| (QCAR |group|))
                      (LETT |numberOfGenerators| (LENGTH |gp|))
                      (LETT |randomInteger|
                            (+ 1 (RANDOM |numberOfGenerators|)))
                      (LETT |randomElement|
                            (SPADCALL |gp| |randomInteger| (QREFELT $ 136)))
                      (LETT |numberOfLoops|
                            (+ 1 (RANDOM |maximalNumberOfFactors|)))
                      (SEQ G190 (COND ((NULL (> |numberOfLoops| 0)) (GO G191)))
                           (SEQ
                            (LETT |randomInteger|
                                  (+ 1 (RANDOM |numberOfGenerators|)))
                            (LETT |randomElement|
                                  (SPADCALL
                                   (SPADCALL |gp| |randomInteger|
                                             (QREFELT $ 136))
                                   |randomElement| (QREFELT $ 140)))
                            (EXIT
                             (LETT |numberOfLoops| (- |numberOfLoops| 1))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |randomElement|))))))) 

(SDEFUN |PERMGRP;random;$P;37| ((|group| $) ($ |Permutation| S))
        (SPADCALL |group| 20 (QREFELT $ 141))) 

(SDEFUN |PERMGRP;order;$Nni;38| ((|group| $) ($ |NonNegativeInteger|))
        (SEQ (|PERMGRP;knownGroup?| |group| $) (EXIT (QVELT (QCDR |group|) 0)))) 

(SDEFUN |PERMGRP;degree;$Nni;39| ((|group| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |group| (QREFELT $ 52)))) 

(SDEFUN |PERMGRP;base;$L;40| ((|group| $) ($ |List| S))
        (SPROG
         ((|groupBase| (|List| S)) (#1=#:G569 NIL) (|i| NIL)
          (|gr_supp| (|List| S)) (|gr_base| (|List| (|NonNegativeInteger|))))
         (SEQ (|PERMGRP;knownGroup?| |group| $)
              (LETT |gr_base| (QVELT (QCDR |group|) 2))
              (LETT |gr_supp| (QVELT (QCDR |group|) 4)) (LETT |groupBase| NIL)
              (SEQ (LETT |i| NIL) (LETT #1# |gr_base|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |groupBase|
                           (CONS (SPADCALL |gr_supp| |i| (QREFELT $ 42))
                                 |groupBase|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |groupBase|))))) 

(SDEFUN |PERMGRP;wordsForStrongGenerators;$L;41|
        ((|group| $) ($ |List| (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|gi|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |gi| (QCDR |group|))
              (COND
               ((EQL (LENGTH (QVELT |gi| 5)) 0)
                (SEQ (SPADCALL |group| (QREFELT $ 128))
                     (EXIT (LETT |gi| (QCDR |group|))))))
              (EXIT (QVELT |gi| 5))))) 

(SDEFUN |PERMGRP;coerce;L$;42| ((|gp| |List| (|Permutation| S)) ($ $))
        (SPROG
         ((|group| ($))
          (|result|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |result| (VECTOR 0 NIL NIL #() NIL NIL))
              (EXIT (LETT |group| (CONS |gp| |result|)))))) 

(SDEFUN |PERMGRP;permutationGroup;L$;43|
        ((|gp| |List| (|Permutation| S)) ($ $))
        (SPROG
         ((|group| ($))
          (|result|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |result| (VECTOR 0 NIL NIL #() NIL NIL))
              (EXIT (LETT |group| (CONS |gp| |result|)))))) 

(SDEFUN |PERMGRP;coerce;$Of;44| ((|group| $) ($ |OutputForm|))
        (SPROG
         ((|outList| (|List| (|OutputForm|))) (|i| NIL)
          (|gp| (|List| (|Permutation| S))))
         (SEQ (LETT |outList| NIL) (LETT |gp| (QCAR |group|))
              (SEQ (LETT |i| (SPADCALL |gp| (QREFELT $ 149))) G190
                   (COND ((< |i| 1) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |outList|
                           (CONS
                            (SPADCALL (SPADCALL |gp| |i| (QREFELT $ 136))
                                      (QREFELT $ 151))
                            |outList|))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL '> (QREFELT $ 153))
                         (SPADCALL (SPADCALL |outList| (QREFELT $ 155))
                                   (SPADCALL '< (QREFELT $ 153))
                                   (QREFELT $ 156))
                         (QREFELT $ 156)))))) 

(SDEFUN |PERMGRP;orbit;$SS;45| ((|gp| $) (|el| S) ($ |Set| S))
        (SPROG
         ((#1=#:G590 NIL) (|i| NIL) (|outSet| (|Set| S))
          (|outList| (|List| (|List| S))) (|elList| (|List| S)))
         (SEQ (LETT |elList| (LIST |el|))
              (LETT |outList| (|PERMGRP;orbitInternal| |gp| |elList| $))
              (LETT |outSet| (SPADCALL (QREFELT $ 54)))
              (SEQ (LETT |i| 1) (LETT #1# (LENGTH |outList|)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |outList| |i| (QREFELT $ 41)) 1
                                (QREFELT $ 42))
                      |outSet| (QREFELT $ 158))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |outSet|)))) 

(SDEFUN |PERMGRP;orbits;$S;46| ((|gp| $) ($ |Set| (|Set| S)))
        (SPROG
         ((|spp| (|Set| S)) (|orbits| (|List| (|Set| S)))
          (|orbitSet| (|Set| S)) (|el| (S)))
         (SEQ (LETT |spp| (SPADCALL |gp| (QREFELT $ 139))) (LETT |orbits| NIL)
              (SEQ G190
                   (COND
                    ((NULL (> (SPADCALL |spp| (QREFELT $ 160)) 0)) (GO G191)))
                   (SEQ (LETT |el| (SPADCALL |spp| (QREFELT $ 161)))
                        (LETT |orbitSet| (SPADCALL |gp| |el| (QREFELT $ 159)))
                        (LETT |orbits| (CONS |orbitSet| |orbits|))
                        (EXIT
                         (LETT |spp|
                               (SPADCALL |spp| |orbitSet| (QREFELT $ 162)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |orbits| (QREFELT $ 165)))))) 

(SDEFUN |PERMGRP;member?;P$B;47| ((|p| |Permutation| S) (|gp| $) ($ |Boolean|))
        (SPROG
         ((|mi|
           (|Record| (|:| |bool| (|Boolean|))
                     (|:| |lst| (|List| (|NonNegativeInteger|))))))
         (SEQ (LETT |mi| (|PERMGRP;memberInternal| |p| |gp| NIL $))
              (EXIT (QCAR |mi|))))) 

(SDEFUN |PERMGRP;wordInStrongGenerators;P$L;48|
        ((|p| |Permutation| S) (|gp| $) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|mi|
           (|Record| (|:| |bool| (|Boolean|))
                     (|:| |lst| (|List| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |mi|
                (|PERMGRP;memberInternal| (SPADCALL |p| (QREFELT $ 167)) |gp|
                 'T $))
          (COND
           ((NULL (QCAR |mi|)) (EXIT (|error| "p is not an element of gp"))))
          (EXIT (QCDR |mi|))))) 

(SDEFUN |PERMGRP;wordInGenerators;P$L;49|
        ((|p| |Permutation| S) (|gp| $) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|outlist| (|List| (|NonNegativeInteger|))) (#1=#:G607 NIL) (|n| NIL)
          (|words| #2=(|List| (|List| (|NonNegativeInteger|))))
          (|lll| (|List| (|NonNegativeInteger|)))
          (|gp_info|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S)) (|:| |wd| #2#))))
         (SEQ (LETT |gp_info| (QCDR |gp|))
              (COND
               ((EQL (LENGTH (QVELT |gp_info| 5)) 0)
                (SEQ (SPADCALL |gp| (QREFELT $ 128))
                     (EXIT (LETT |gp_info| (QCDR |gp|))))))
              (LETT |lll| (SPADCALL |p| |gp| (QREFELT $ 168)))
              (LETT |outlist| NIL) (LETT |words| (QVELT (QCDR |gp|) 5))
              (SEQ (LETT |n| NIL) (LETT #1# |lll|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |outlist|
                           (SPADCALL |outlist|
                                     (SPADCALL |words| |n| (QREFELT $ 46))
                                     (QREFELT $ 33)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|PERMGRP;shortenWord| |outlist| |gp| $))))) 

(SDEFUN |PERMGRP;<;2$B;50| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (COND
         ((NULL
           (SPADCALL
            (SPADCALL (SPADCALL |gp1| (QREFELT $ 139))
                      (SPADCALL |gp2| (QREFELT $ 139)) (QREFELT $ 162))
            (QREFELT $ 170)))
          NIL)
         ((NULL (|PERMGRP;subgroup| |gp1| |gp2| $)) NIL)
         ('T
          (NULL
           (EQL (SPADCALL |gp1| (QREFELT $ 143))
                (SPADCALL |gp2| (QREFELT $ 143))))))) 

(SDEFUN |PERMGRP;<=;2$B;51| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (COND
         ((NULL
           (SPADCALL
            (SPADCALL (SPADCALL |gp1| (QREFELT $ 139))
                      (SPADCALL |gp2| (QREFELT $ 139)) (QREFELT $ 162))
            (QREFELT $ 170)))
          NIL)
         ('T (|PERMGRP;subgroup| |gp1| |gp2| $)))) 

(SDEFUN |PERMGRP;=;2$B;52| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (SPROG ((#1=#:G623 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |gp1| (QREFELT $ 139))
                             (SPADCALL |gp2| (QREFELT $ 139)) (QREFELT $ 173))
                   NIL)
                  (#2='T
                   (SEQ
                    (COND
                     ((<= (LENGTH (QCAR |gp1|)) (LENGTH (QCAR |gp2|)))
                      (COND
                       ((NULL (|PERMGRP;subgroup| |gp1| |gp2| $))
                        (EXIT (PROGN (LETT #1# NIL) (GO #3=#:G622))))))
                     ((NULL (|PERMGRP;subgroup| |gp2| |gp1| $))
                      (EXIT (PROGN (LETT #1# NIL) (GO #3#)))))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |gp1| (QREFELT $ 143))
                            (SPADCALL |gp2| (QREFELT $ 143)))
                       'T)
                      (#2# NIL)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |PERMGRP;orbit;$SS;53|
        ((|gp| $) (|startSet| |Set| S) ($ |Set| (|Set| S)))
        (SPROG
         ((|newSet| (|Set| S)) (#1=#:G628 NIL) (|i| NIL)
          (|outSet| (|Set| (|Set| S))) (|outList| (|List| (|List| S)))
          (|startList| (|List| S)))
         (SEQ (LETT |startList| (SPADCALL |startSet| (QREFELT $ 57)))
              (LETT |outList| (|PERMGRP;orbitInternal| |gp| |startList| $))
              (LETT |outSet| (SPADCALL (QREFELT $ 175)))
              (SEQ (LETT |i| 1) (LETT #1# (LENGTH |outList|)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |newSet|
                          (SPADCALL (SPADCALL |outList| |i| (QREFELT $ 41))
                                    (QREFELT $ 138)))
                    (EXIT (SPADCALL |newSet| |outSet| (QREFELT $ 176))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |outSet|)))) 

(SDEFUN |PERMGRP;orbit;$LS;54|
        ((|gp| $) (|startList| |List| S) ($ |Set| (|List| S)))
        (SPADCALL (|PERMGRP;orbitInternal| |gp| |startList| $) (QREFELT $ 179))) 

(SDEFUN |PERMGRP;initializeGroupForWordProblem;$2IV;55|
        ((|gp| $) (|maxLoops| |Integer|) (|diff| |Integer|) ($ |Void|))
        (SEQ (|PERMGRP;bsgs| |gp| 'T |maxLoops| |diff| $)
             (EXIT (SPADCALL (QREFELT $ 111))))) 

(SDEFUN |PERMGRP;initializeGroupForWordProblem;$V;56| ((|gp| $) ($ |Void|))
        (SPADCALL |gp| 0 1 (QREFELT $ 181))) 

(DECLAIM (NOTINLINE |PermutationGroup;|)) 

(DEFUN |PermutationGroup| (#1=#:G633)
  (SPROG NIL
         (PROG (#2=#:G634)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PermutationGroup|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PermutationGroup;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PermutationGroup|)))))))))) 

(DEFUN |PermutationGroup;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|PermutationGroup| DV$1))
          (LETT $ (GETREFV 185))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PermutationGroup| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |gens| (|List| (|Permutation| |#1|)))
                              (|:| |information|
                                   (|Record|
                                    (|:| |order| (|NonNegativeInteger|))
                                    (|:| |sgset|
                                         (|List|
                                          (|Vector| (|NonNegativeInteger|))))
                                    (|:| |gpbase|
                                         (|List| (|NonNegativeInteger|)))
                                    (|:| |orbs|
                                         (|Vector|
                                          (|Record|
                                           (|:| |orb|
                                                (|List|
                                                 (|NonNegativeInteger|)))
                                           (|:| |svc|
                                                (|Vector| (|Integer|))))))
                                    (|:| |mp| (|List| |#1|))
                                    (|:| |wd|
                                         (|List|
                                          (|List| (|NonNegativeInteger|))))))))
          (COND
           ((|HasCategory| |#1| '(|OrderedSet|))
            (QSETREFV $ 52
                      (CONS (|dispatchFunction| |PERMGRP;pointList;$L;11|) $)))
           ('T
            (QSETREFV $ 52
                      (CONS (|dispatchFunction| |PERMGRP;pointList;$L;12|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|OrderedSet|))
            (PROGN
             (QSETREFV $ 69
                       (CONS
                        (|dispatchFunction| |PERMGRP;perm_to_vec;LPNniV;14|)
                        $))))
           ('T
            (QSETREFV $ 69
                      (CONS
                       (|dispatchFunction| |PERMGRP;perm_to_vec;LPNniV;15|)
                       $))))
          $))) 

(MAKEPROP '|PermutationGroup| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 11)
              |PERMGRP;coerce;$L;31| (|NonNegativeInteger|) (|Permutation| 6)
              (0 . |order|) (|List| 10) (5 . |copy|) (|Integer|)
              (10 . |maxIndex|) (15 . |elt|) (|Boolean|) (21 . |member?|)
              (27 . |position|) (33 . |delete|) (39 . |#|) (44 . |One|)
              (48 . ~=) (54 . |rest|) (|Vector| 10) (60 . |#|) (65 . |new|)
              (|Vector| 26) (71 . |elt|) (|Vector| 13) (77 . |elt|)
              (83 . |append|) (|List| 26) (89 . |vector|) (|List| 13)
              (94 . |vector|) (99 . |qelt|) (|List| 6) (|List| 39)
              (105 . |elt|) (111 . |elt|) (117 . |eval|) (123 . |member?|)
              (129 . |elt|) (135 . |elt|)
              (|Record| (|:| |preimage| 39) (|:| |image| 39))
              (141 . |listRepresentation|) (146 . |sort|) (151 . |merge|)
              (157 . =) (163 . |pointList|) (|Set| 6) (168 . |empty|)
              (172 . |movedPoints|) (177 . |union|) (183 . |parts|) (188 . <=)
              (|Record| (|:| |preimage| 10) (|:| |image| 6))
              (|Mapping| 18 59 59) (|List| 59) (194 . |sort|) (200 . |first|)
              (205 . <=) (|Mapping| 18 13 13) (211 . |sort|) (217 . |second|)
              (222 . |setelt!|) (229 . |perm_to_vec|) (236 . |position|)
              (|Vector| 15) (242 . |setelt!|) (249 . |elt|) (255 . |member?|)
              (|List| 34) (|Reference| 75) (261 . |setref|) (|List| 36)
              (|Reference| 78) (267 . |setref|) (273 . |deref|)
              (278 . |append|) (284 . |deref|) (289 . |append|) (295 . |elt|)
              (301 . |append|) (|Mapping| 26 26) (307 . |map|)
              (|Record| (|:| |orb| 13) (|:| |svc| 71)) (|Vector| 89)
              (313 . |setelt!|) (320 . |setelt!|) (327 . |position|)
              (333 . |delete|) (339 . |elt|) (345 . |delete|) (351 . |setelt!|)
              (358 . |ref|) (363 . |ref|) (368 . |list|) (373 . |append|)
              (379 . |elt|) (385 . |copy|) (390 . |list|) (395 . |list|)
              (|Set| 11) (400 . |empty|) (404 . |degree|) (409 . |insert!|)
              (|Void|) (415 . |void|) (419 . |difference|) (425 . |empty?|)
              (430 . |parts|) |PERMGRP;member?;P$B;47| (435 . |member?|)
              (441 . |member?|) (447 . |setelt!|) (454 . |members|)
              (459 . |first|) (465 . =) (471 . |concat|) (|List| 15)
              (477 . |concat|) (|List| 123) (483 . |concat|)
              |PERMGRP;relationsInStrongGenerators;$L;29|
              |PERMGRP;initializeGroupForWordProblem;$V;56| (|Vector| 123)
              (489 . |setelt!|) (496 . |elt|)
              |PERMGRP;relationsInGenerators;$L;30| |PERMGRP;generators;$L;32|
              (502 . |coerceListOfPairs|) |PERMGRP;strongGenerators;$L;33|
              (507 . |elt|) |PERMGRP;elt;$NniP;34| (513 . |set|)
              |PERMGRP;movedPoints;$S;35| (518 . *) |PERMGRP;random;$IP;36|
              |PERMGRP;random;$P;37| |PERMGRP;order;$Nni;38|
              |PERMGRP;degree;$Nni;39| |PERMGRP;base;$L;40|
              |PERMGRP;wordsForStrongGenerators;$L;41| |PERMGRP;coerce;L$;42|
              |PERMGRP;permutationGroup;L$;43| (524 . |maxIndex|)
              (|OutputForm|) (529 . |coerce|) (|Symbol|) (534 . |outputForm|)
              (|List| $) (539 . |commaSeparate|) (544 . |postfix|)
              |PERMGRP;coerce;$Of;44| (550 . |insert!|) |PERMGRP;orbit;$SS;45|
              (556 . |cardinality|) (561 . |extract!|) (566 . |difference|)
              (|List| 53) (|Set| 53) (572 . |set|) |PERMGRP;orbits;$S;46|
              (577 . |inv|) |PERMGRP;wordInStrongGenerators;P$L;48|
              |PERMGRP;wordInGenerators;P$L;49| (582 . |empty?|)
              |PERMGRP;<;2$B;50| |PERMGRP;<=;2$B;51| (587 . ~=)
              |PERMGRP;=;2$B;52| (593 . |empty|) (597 . |insert!|)
              |PERMGRP;orbit;$SS;53| (|Set| 39) (603 . |set|)
              |PERMGRP;orbit;$LS;54|
              |PERMGRP;initializeGroupForWordProblem;$2IV;55| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 608 |wordsForStrongGenerators| 614 |wordInStrongGenerators|
              619 |wordInGenerators| 625 |strongGenerators| 631
              |relationsInStrongGenerators| 636 |relationsInGenerators| 641
              |random| 646 |pointList| 657 |permutationGroup| 662 |perm_to_vec|
              667 |order| 674 |orbits| 679 |orbit| 684 |movedPoints| 702
              |member?| 707 |latex| 713 |initializeGroupForWordProblem| 718
              |hashUpdate!| 730 |hash| 736 |generators| 741 |elt| 746 |degree|
              752 |coerce| 757 |base| 772 = 777 <= 783 < 789)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 150))
                        (|makeByteWordVec2| 184
                                            '(1 11 10 0 12 1 13 0 0 14 1 13 15
                                              0 16 2 13 10 0 15 17 2 13 18 10 0
                                              19 2 13 15 10 0 20 2 13 0 0 15 21
                                              1 13 10 0 22 0 11 0 23 2 10 18 0
                                              0 24 2 13 0 0 10 25 1 26 10 0 27
                                              2 26 0 10 10 28 2 29 26 0 15 30 2
                                              31 13 0 15 32 2 13 0 0 0 33 1 29
                                              0 34 35 1 31 0 36 37 2 13 10 0 15
                                              38 2 40 39 0 15 41 2 39 6 0 15 42
                                              2 11 6 0 6 43 2 40 18 39 0 44 2
                                              34 26 0 15 45 2 36 13 0 15 46 1
                                              11 47 0 48 1 39 0 0 49 2 39 0 0 0
                                              50 2 6 18 0 0 51 1 0 39 0 52 0 53
                                              0 54 1 11 53 0 55 2 53 0 0 0 56 1
                                              53 39 0 57 2 6 18 0 0 58 2 61 0
                                              60 0 62 1 13 10 0 63 2 10 18 0 0
                                              64 2 36 0 65 0 66 1 13 10 0 67 3
                                              26 10 0 15 10 68 3 0 26 39 11 10
                                              69 2 39 15 6 0 70 3 71 15 0 15 15
                                              72 2 26 10 0 15 73 2 34 18 26 0
                                              74 2 76 75 0 75 77 2 79 78 0 78
                                              80 1 76 75 0 81 2 75 0 0 0 82 1
                                              79 78 0 83 2 78 0 0 0 84 2 75 34
                                              0 15 85 2 34 0 0 0 86 2 34 0 87 0
                                              88 3 90 89 0 15 89 91 3 75 34 0
                                              15 34 92 2 34 15 26 0 93 2 34 0 0
                                              15 94 2 78 36 0 15 95 2 36 0 0 15
                                              96 3 78 36 0 15 36 97 1 76 0 75
                                              98 1 79 0 78 99 1 13 0 10 100 2
                                              36 0 0 0 101 2 90 89 0 15 102 1
                                              26 0 0 103 1 34 0 26 104 1 36 0
                                              13 105 0 106 0 107 1 11 10 0 108
                                              2 106 0 11 0 109 0 110 0 111 2
                                              106 0 0 0 112 1 106 18 0 113 1
                                              106 8 0 114 2 39 18 6 0 116 2 8
                                              18 11 0 117 3 31 13 0 15 13 118 1
                                              29 34 0 119 2 34 0 0 10 120 2 13
                                              18 0 0 121 2 13 0 0 0 122 2 123 0
                                              0 0 124 2 125 0 0 0 126 3 129 123
                                              0 15 123 130 2 129 123 0 15 131 1
                                              11 0 40 134 2 8 11 0 15 136 1 53
                                              0 39 138 2 11 0 0 0 140 1 8 15 0
                                              149 1 11 150 0 151 1 150 0 152
                                              153 1 150 0 154 155 2 150 0 0 0
                                              156 2 53 0 6 0 158 1 53 10 0 160
                                              1 53 6 0 161 2 53 0 0 0 162 1 164
                                              0 163 165 1 11 0 0 167 1 53 18 0
                                              170 2 53 18 0 0 173 0 164 0 175 2
                                              164 0 53 0 176 1 178 0 40 179 2 0
                                              18 0 0 1 1 0 36 0 146 2 0 13 11 0
                                              168 2 0 13 11 0 169 1 0 8 0 135 1
                                              0 125 0 127 1 0 125 0 132 2 0 11
                                              0 15 141 1 0 11 0 142 1 0 39 0 52
                                              1 0 0 8 148 3 0 26 39 11 10 69 1
                                              0 10 0 143 1 0 164 0 166 2 0 164
                                              0 53 177 2 0 178 0 39 180 2 0 53
                                              0 6 159 1 0 53 0 139 2 0 18 11 0
                                              115 1 0 182 0 1 1 0 110 0 128 3 0
                                              110 0 15 15 181 2 0 184 184 0 1 1
                                              0 183 0 1 1 0 8 0 133 2 0 11 0 10
                                              137 1 0 10 0 144 1 0 0 8 147 1 0
                                              8 0 9 1 0 150 0 157 1 0 39 0 145
                                              2 0 18 0 0 174 2 0 18 0 0 172 2 0
                                              18 0 0 171)))))
           '|lookupComplete|)) 
