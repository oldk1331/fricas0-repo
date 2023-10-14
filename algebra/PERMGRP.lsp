
(SDEFUN |PERMGRP;shortenWord|
        ((|lw| |List| (|NonNegativeInteger|)) (|gp| $)
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|do_res| (|Boolean|)) (|flag1| #1=(|Boolean|))
          (|newlw| (|List| (|NonNegativeInteger|))) (#2=#:G161 NIL)
          (|anzahl| (|NonNegativeInteger|)) (|flag2| #1#)
          (|res| (|List| #3=(|NonNegativeInteger|))) (|test| #3#)
          (#4=#:G173 NIL) (|el| NIL) (|pos| (|Integer|)) (#5=#:G172 NIL)
          (|i| NIL) (|orderList| (|List| (|NonNegativeInteger|)))
          (#6=#:G171 NIL) (|gen| NIL) (#7=#:G170 NIL)
          (|gpgens| (|List| (|Permutation| S))))
         (SEQ
          (LETT |gpgens| (SPADCALL |gp| (QREFELT $ 9))
                . #8=(|PERMGRP;shortenWord|))
          (LETT |orderList|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |gen| NIL . #8#) (LETT #6# |gpgens| . #8#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |gen| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7# (CONS (SPADCALL |gen| (QREFELT $ 12)) #7#)
                              . #8#)))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |newlw| (SPADCALL |lw| (QREFELT $ 14)) . #8#)
          (SEQ (LETT |i| 1 . #8#)
               (LETT #5# (SPADCALL |orderList| (QREFELT $ 16)) . #8#) G190
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
                         (LETT |pos| (SPADCALL |i| |newlw| (QREFELT $ 20))
                               . #8#)
                         (EXIT
                          (LETT |newlw| (SPADCALL |newlw| |pos| (QREFELT $ 21))
                                . #8#)))
                        NIL (GO G190) G191 (EXIT NIL))))))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((< (SPADCALL |newlw| (QREFELT $ 22)) 2) |newlw|)
                 ('T
                  (SEQ (LETT |test| (|SPADfirst| |newlw|) . #8#)
                       (LETT |anzahl| 0 . #8#) (LETT |flag1| 'T . #8#)
                       (LETT |do_res| 'NIL . #8#)
                       (SEQ G190 (COND ((NULL |flag1|) (GO G191)))
                            (SEQ (LETT |test| (|SPADfirst| |newlw|) . #8#)
                                 (LETT |anzahl| 1 . #8#)
                                 (COND
                                  (|do_res| (LETT |res| (LIST |test|) . #8#)))
                                 (LETT |flag2| 'T . #8#)
                                 (SEQ (LETT |el| NIL . #8#)
                                      (LETT #4# |newlw| . #8#) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN
                                             (LETT |el| (CAR #4#) . #8#)
                                             NIL)
                                            (NULL |flag2|))
                                        (GO G191)))
                                      (SEQ
                                       (COND
                                        (|do_res|
                                         (LETT |res| (CONS |el| |res|) . #8#)))
                                       (LETT |anzahl| (+ |anzahl| 1) . #8#)
                                       (EXIT
                                        (COND
                                         ((EQL |anzahl| 1)
                                          (LETT |test| |el| . #8#))
                                         ((SPADCALL |test| |el| (QREFELT $ 24))
                                          (SEQ (LETT |test| |el| . #8#)
                                               (EXIT (LETT |anzahl| 1 . #8#))))
                                         ('T
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((EQL |anzahl|
                                                   (SPADCALL |orderList| |test|
                                                             (QREFELT $ 17)))
                                              (PROGN
                                               (LETT #2#
                                                     (SEQ
                                                      (COND
                                                       (|do_res|
                                                        (LETT |res|
                                                              (SPADCALL |res|
                                                                        |anzahl|
                                                                        (QREFELT
                                                                         $ 25))
                                                              . #8#))
                                                       ('T
                                                        (LETT |flag2| 'NIL
                                                              . #8#)))
                                                      (EXIT
                                                       (LETT |anzahl| 0
                                                             . #8#)))
                                                     . #8#)
                                               (GO #2#)))))
                                           #2# (EXIT #2#))))))
                                      (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                      (EXIT NIL))
                                 (COND
                                  (|do_res|
                                   (LETT |newlw| (NREVERSE |res|) . #8#)))
                                 (LETT |flag1| |do_res| . #8#)
                                 (EXIT
                                  (LETT |do_res| (COND (|flag2| 'NIL) ('T 'T))
                                        . #8#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |newlw|)))))))) 

(SDEFUN |PERMGRP;times!|
        ((|res| |Vector| (|NonNegativeInteger|))
         (|p| |Vector| (|NonNegativeInteger|))
         (|q| |Vector| (|NonNegativeInteger|)) ($ |Void|))
        (SPROG ((|i| NIL) (|degree| (|NonNegativeInteger|)))
               (SEQ
                (LETT |degree| (SPADCALL |p| (QREFELT $ 27))
                      . #1=(|PERMGRP;times!|))
                (EXIT
                 (SEQ (LETT |i| 1 . #1#) G190
                      (COND ((|greater_SI| |i| |degree|) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1O |res| |i|
                                    (QAREF1O |p| (QAREF1O |q| |i| 1) 1) 1)))
                      (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                      (EXIT NIL)))))) 

(SDEFUN |PERMGRP;times|
        ((|p| |Vector| (|NonNegativeInteger|))
         (|q| |Vector| (|NonNegativeInteger|))
         ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degree| (SPADCALL |p| (QREFELT $ 27)) . #1=(|PERMGRP;times|))
          (LETT |res| (SPADCALL |degree| 0 (QREFELT $ 28)) . #1#)
          (|PERMGRP;times!| |res| |p| |q| $) (EXIT |res|)))) 

(SDEFUN |PERMGRP;inv|
        ((|p| |Vector| (|NonNegativeInteger|))
         ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((|i| NIL) (|q| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degree| (SPADCALL |p| (QREFELT $ 27)) . #1=(|PERMGRP;inv|))
          (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |degree|) (GO G191)))
               (SEQ (EXIT (QSETAREF1O |q| (QAREF1O |p| |i| 1) |i| 1)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |q|)))) 

(SDEFUN |PERMGRP;testIdentity|
        ((|p| |Vector| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G184 NIL) (#2=#:G186 NIL) (|i| NIL)
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |degree| (SPADCALL |p| (QREFELT $ 27))
                  . #3=(|PERMGRP;testIdentity|))
            (SEQ
             (EXIT
              (SEQ (LETT |i| 1 . #3#) G190
                   (COND ((|greater_SI| |i| |degree|) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF1O |p| |i| 1) |i| (QREFELT $ 24))
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# 'NIL . #3#) (GO #2#)) . #3#)
                        (GO #1#))))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL)))
             #1# (EXIT #1#))
            (EXIT 'T)))
          #2# (EXIT #2#)))) 

(SDEFUN |PERMGRP;cosetRep1|
        ((|ppt| |NonNegativeInteger|) (|do_words| |Boolean|)
         (|o| |Record| (|:| |orb| #1=(|List| (|NonNegativeInteger|)))
          (|:| |svc| #2=(|Vector| (|Integer|))))
         (|grpv| |Vector| (|Vector| (|NonNegativeInteger|)))
         (|wordv| |Vector| (|List| (|NonNegativeInteger|)))
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((#3=#:G196 NIL) (|p| (|Integer|))
          (|word| (|List| (|NonNegativeInteger|)))
          (|xelt| #4=(|Vector| (|NonNegativeInteger|)))
          (|tmpv| #5=(|Vector| (|NonNegativeInteger|))) (|#G25| #5#)
          (|#G24| #4#) (|x| (|Vector| (|NonNegativeInteger|))) (|osvc| #2#)
          (|oorb| #1#) (#6=#:G197 NIL) (|n| NIL) (#7=#:G198 NIL)
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((EQL (QVSIZE |grpv|) 0) (|error| "cosetRep needs nonempty group"))
            (#8='T
             (SEQ
              (LETT |degree|
                    (SPADCALL (SPADCALL |grpv| 1 (QREFELT $ 30))
                              (QREFELT $ 27))
                    . #9=(|PERMGRP;cosetRep1|))
              (LETT |xelt|
                    (PROGN
                     (LETT #7# (GETREFV |degree|) . #9#)
                     (SEQ (LETT |n| 1 . #9#) (LETT #6# 0 . #9#) G190
                          (COND ((|greater_SI| |n| |degree|) (GO G191)))
                          (SEQ (EXIT (SETELT #7# #6# |n|)))
                          (LETT #6#
                                (PROG1 (|inc_SI| #6#)
                                  (LETT |n| (|inc_SI| |n|) . #9#))
                                . #9#)
                          (GO G190) G191 (EXIT NIL))
                     #7#)
                    . #9#)
              (LETT |word| NIL . #9#) (LETT |oorb| (QCAR |o|) . #9#)
              (LETT |osvc| (QCDR |o|) . #9#)
              (LETT |p| (QAREF1O |osvc| |ppt| 1) . #9#)
              (EXIT
               (COND
                ((< |p| 0)
                 (PROGN (LETT #3# (CONS |xelt| |word|) . #9#) (GO #3#)))
                (#8#
                 (SEQ (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #9#)
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ (LETT |x| (QAREF1O |grpv| |p| 1) . #9#)
                                 (|PERMGRP;times!| |tmpv| |x| |xelt| $)
                                 (PROGN
                                  (LETT |#G24| |xelt| . #9#)
                                  (LETT |#G25| |tmpv| . #9#)
                                  (LETT |tmpv| |#G24| . #9#)
                                  (LETT |xelt| |#G25| . #9#))
                                 (COND
                                  (|do_words|
                                   (LETT |word|
                                         (APPEND
                                          (SPADCALL |wordv| |p| (QREFELT $ 32))
                                          |word|)
                                         . #9#)))
                                 (LETT |ppt| (QAREF1O |x| |ppt| 1) . #9#)
                                 (LETT |p| (QAREF1O |osvc| |ppt| 1) . #9#)
                                 (EXIT
                                  (COND
                                   ((< |p| 0)
                                    (PROGN
                                     (LETT #3# (CONS |xelt| |word|) . #9#)
                                     (GO #3#))))))
                            NIL (GO G190) G191 (EXIT NIL)))))))))))
          #3# (EXIT #3#)))) 

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
         (SEQ
          (LETT |grpv| (SPADCALL |group| (QREFELT $ 34))
                . #1=(|PERMGRP;strip1|))
          (LETT |wordv| (MAKE-ARRAY 0) . #1#)
          (LETT |do_words| (COND ((NULL |words|) 'NIL) ('T 'T)) . #1#)
          (COND
           (|do_words| (LETT |wordv| (SPADCALL |words| (QREFELT $ 36)) . #1#)))
          (LETT |point|
                (QAREF1O |element| (SPADCALL (QCAR |orbit|) 1 (QREFELT $ 37))
                         1)
                . #1#)
          (LETT |cr|
                (|PERMGRP;cosetRep1| |point| |do_words| |orbit| |grpv| |wordv|
                 $)
                . #1#)
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
          (|noresult| (|Boolean|)) (#4=#:G208 NIL) (|entry| (|Integer|))
          (|p| (|NonNegativeInteger|)) (|s| #2#)
          (|orbj|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|j| NIL) (|degree| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degree| (SPADCALL |z| (QREFELT $ 27)) . #5=(|PERMGRP;strip|))
          (LETT |word| NIL . #5#)
          (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #5#)
          (LETT |noresult| 'T . #5#)
          (SEQ (LETT |j| |i| . #5#) G190
               (COND ((OR (< |j| 1) (NULL |noresult|)) (GO G191)))
               (SEQ (LETT |orbj| (QAREF1O |orbs| |j| 1) . #5#)
                    (LETT |s| (QCDR |orbj|) . #5#)
                    (LETT |p| (|SPADfirst| (QCAR |orbj|)) . #5#)
                    (EXIT
                     (SEQ
                      (EXIT
                       (SEQ G190 (COND ((NULL |noresult|) (GO G191)))
                            (SEQ
                             (LETT |entry| (QAREF1O |s| (QAREF1O |z| |p| 1) 1)
                                   . #5#)
                             (EXIT
                              (COND
                               ((< |entry| 0)
                                (SEQ
                                 (COND
                                  ((EQL |entry| -1)
                                   (PROGN
                                    (LETT #4# |$NoValue| . #5#)
                                    (GO #4#))))
                                 (EXIT (LETT |noresult| 'NIL . #5#))))
                               ('T
                                (SEQ
                                 (LETT |ee| (QAREF1O |grpv| |entry| 1) . #5#)
                                 (|PERMGRP;times!| |tmpv| |ee| |z| $)
                                 (PROGN
                                  (LETT |#G37| |tmpv| . #5#)
                                  (LETT |#G38| |z| . #5#)
                                  (LETT |z| |#G37| . #5#)
                                  (LETT |tmpv| |#G38| . #5#))
                                 (EXIT
                                  (COND
                                   (|do_words|
                                    (LETT |word|
                                          (APPEND
                                           (SPADCALL |wordv| |entry|
                                                     (QREFELT $ 32))
                                           |word|)
                                          . #5#)))))))))
                            NIL (GO G190) G191 (EXIT NIL)))
                      #4# (EXIT #4#))))
               (LETT |j| (+ |j| -1) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |z| |word|))))) 

(SDEFUN |PERMGRP;orbitInternal|
        ((|gp| $) (|startList| . #1=(|List| S)) ($ |List| (|List| S)))
        (SPROG
         ((|pos| (|Integer|)) (|orbitList| (|List| #1#)) (|newList| (|List| S))
          (|j| NIL) (|workList| (|List| S)) (#2=#:G222 NIL) (|gen| NIL)
          (|gpset| (|List| (|Permutation| S))))
         (SEQ
          (LETT |orbitList| (LIST |startList|) . #3=(|PERMGRP;orbitInternal|))
          (LETT |pos| 1 . #3#)
          (SEQ G190
               (COND ((NULL (COND ((ZEROP |pos|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |gpset| (QCAR |gp|) . #3#)
                    (SEQ (LETT |gen| NIL . #3#) (LETT #2# |gpset| . #3#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |gen| (CAR #2#) . #3#) NIL))
                           (GO G191)))
                         (SEQ (LETT |newList| NIL . #3#)
                              (LETT |workList|
                                    (SPADCALL |orbitList| |pos| (QREFELT $ 40))
                                    . #3#)
                              (SEQ (LETT |j| (LENGTH |workList|) . #3#) G190
                                   (COND ((< |j| 1) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |newList|
                                           (CONS
                                            (SPADCALL |gen|
                                                      (SPADCALL |workList| |j|
                                                                (QREFELT $ 41))
                                                      (QREFELT $ 42))
                                            |newList|)
                                           . #3#)))
                                   (LETT |j| (+ |j| -1) . #3#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL |newList| |orbitList|
                                            (QREFELT $ 43)))
                                 (SEQ
                                  (LETT |orbitList|
                                        (CONS |newList| |orbitList|) . #3#)
                                  (EXIT (LETT |pos| (+ |pos| 1) . #3#)))))))
                         (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |pos| (- |pos| 1) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (REVERSE |orbitList|))))) 

(SDEFUN |PERMGRP;ranelt|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|word| |List| (|List| (|NonNegativeInteger|))) (|maxLoops| |Integer|)
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|numberOfLoops| #1=(|Integer|))
          (|words| (|List| (|NonNegativeInteger|))) (#2=#:G227 NIL)
          (|randomElement| (|Vector| (|NonNegativeInteger|)))
          (|randomInteger| #1#) (#3=#:G225 NIL) (|do_words| (|Boolean|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ
          (LETT |numberOfGenerators| (LENGTH |group|) . #4=(|PERMGRP;ranelt|))
          (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|)) . #4#)
          (LETT |randomElement|
                (SPADCALL |group| |randomInteger| (QREFELT $ 44)) . #4#)
          (LETT |words| NIL . #4#)
          (LETT |do_words| (COND ((NULL |word|) 'NIL) (#5='T 'T)) . #4#)
          (COND
           (|do_words|
            (LETT |words|
                  (SPADCALL |word|
                            (PROG1 (LETT #3# |randomInteger| . #4#)
                              (|check_subtype| (>= #3# 0)
                                               '(|NonNegativeInteger|) #3#))
                            (QREFELT $ 45))
                  . #4#)))
          (COND
           ((SPADCALL |maxLoops| 0 (QREFELT $ 46))
            (LETT |numberOfLoops| (+ 1 (RANDOM |maxLoops|)) . #4#))
           (#5# (LETT |numberOfLoops| |maxLoops| . #4#)))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |numberOfLoops| 0 (QREFELT $ 46))) (GO G191)))
               (SEQ
                (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|))
                      . #4#)
                (LETT |randomElement|
                      (|PERMGRP;times|
                       (SPADCALL |group| |randomInteger| (QREFELT $ 44))
                       |randomElement| $)
                      . #4#)
                (COND
                 (|do_words|
                  (LETT |words|
                        (APPEND
                         (SPADCALL |word|
                                   (PROG1 (LETT #2# |randomInteger| . #4#)
                                     (|check_subtype| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                   (QREFELT $ 45))
                         |words|)
                        . #4#)))
                (EXIT (LETT |numberOfLoops| (- |numberOfLoops| 1) . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |randomElement| |words|))))) 

(SDEFUN |PERMGRP;pointList;$L;11| ((|group| $) ($ |List| S))
        (SPROG
         ((|res| (|List| S)) (|p0| (S)) (#1=#:G242 NIL) (|p| NIL)
          (|support| (|List| S)) (#2=#:G241 NIL) (|perm| NIL))
         (SEQ
          (COND
           ((NULL (NULL (QVELT (QCDR |group|) 4))) (QVELT (QCDR |group|) 4))
           ('T
            (SEQ (LETT |support| NIL . #3=(|PERMGRP;pointList;$L;11|))
                 (SEQ (LETT |perm| NIL . #3#) (LETT #2# (QCAR |group|) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |perm| (CAR #2#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |support|
                              (SPADCALL
                               (SPADCALL
                                (QCAR (SPADCALL |perm| (QREFELT $ 48)))
                                (QREFELT $ 49))
                               |support| (QREFELT $ 50))
                              . #3#)))
                      (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                 (LETT |res| NIL . #3#)
                 (EXIT
                  (COND ((NULL |support|) |res|)
                        ('T
                         (SEQ (LETT |p0| (|SPADfirst| |support|) . #3#)
                              (LETT |res| (LIST |p0|) . #3#)
                              (SEQ (LETT |p| NIL . #3#)
                                   (LETT #1# (CDR |support|) . #3#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |p| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL |p| |p0| (QREFELT $ 51))
                                       "iterate")
                                      ('T
                                       (SEQ (LETT |p0| |p| . #3#)
                                            (EXIT
                                             (LETT |res| (CONS |p| |res|)
                                                   . #3#)))))))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (QSETVELT (QCDR |group|) 4
                                         (NREVERSE |res|))))))))))))) 

(SDEFUN |PERMGRP;pointList;$L;12| ((|group| $) ($ |List| S))
        (SPROG ((|support| (|Set| S)) (#1=#:G248 NIL) (|perm| NIL))
               (SEQ
                (COND
                 ((NULL (NULL (QVELT (QCDR |group|) 4)))
                  (QVELT (QCDR |group|) 4))
                 ('T
                  (SEQ
                   (LETT |support| (SPADCALL (QREFELT $ 54))
                         . #2=(|PERMGRP;pointList;$L;12|))
                   (SEQ (LETT |perm| NIL . #2#) (LETT #1# (QCAR |group|) . #2#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |perm| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |support|
                                (SPADCALL |support|
                                          (SPADCALL |perm| (QREFELT $ 55))
                                          (QREFELT $ 56))
                                . #2#)))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (QSETVELT (QCDR |group|) 4
                              (SPADCALL |support| (QREFELT $ 57)))))))))) 

(SDEFUN |PERMGRP;ls_to_lnni|
        ((|ls| |List| S) (|supp| |List| S) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G266 NIL) (|pp| NIL) (#2=#:G265 NIL)
          (|rp2| (|List| (|List| (|NonNegativeInteger|))))
          (|ls2|
           (|List|
            (|Record| (|:| |preimage| (|NonNegativeInteger|))
                      (|:| |image| S))))
          (|p1| (S))
          (|pel|
           (|Record| (|:| |preimage| (|NonNegativeInteger|)) (|:| |image| S)))
          (|flag| (|Boolean|)) (#3=#:G264 NIL) (|p2| NIL) (|i| NIL)
          (#4=#:G263 NIL) (|p| NIL) (#5=#:G262 NIL))
         (SEQ
          (COND ((NULL |ls|) NIL)
                ('T
                 (SEQ
                  (LETT |ls2|
                        (PROGN
                         (LETT #5# NIL . #6=(|PERMGRP;ls_to_lnni|))
                         (SEQ (LETT |i| 1 . #6#) (LETT |p| NIL . #6#)
                              (LETT #4# |ls| . #6#) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5# (CONS (CONS |i| |p|) #5#) . #6#)))
                              (LETT #4#
                                    (PROG1 (CDR #4#)
                                      (LETT |i| (|inc_SI| |i|) . #6#))
                                    . #6#)
                              (GO G190) G191 (EXIT (NREVERSE #5#))))
                        . #6#)
                  (LETT |ls2|
                        (SPADCALL (CONS #'|PERMGRP;ls_to_lnni!0| $) |ls2|
                                  (QREFELT $ 62))
                        . #6#)
                  (LETT |pel| (|SPADfirst| |ls2|) . #6#)
                  (LETT |p1| (QCDR |pel|) . #6#) (LETT |ls2| (CDR |ls2|) . #6#)
                  (LETT |rp2| NIL . #6#) (LETT |flag| 'T . #6#)
                  (SEQ (LETT |i| 1 . #6#) (LETT |p2| NIL . #6#)
                       (LETT #3# |supp| . #6#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |p2| (CAR #3#) . #6#) NIL)
                             (NULL |flag|))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |p1| |p2| (QREFELT $ 51))
                           (SEQ
                            (LETT |rp2| (CONS (LIST (QCAR |pel|) |i|) |rp2|)
                                  . #6#)
                            (EXIT
                             (COND ((NULL |ls2|) (LETT |flag| 'NIL . #6#))
                                   ('T
                                    (SEQ (LETT |pel| (|SPADfirst| |ls2|) . #6#)
                                         (LETT |p1| (QCDR |pel|) . #6#)
                                         (EXIT
                                          (LETT |ls2| (CDR |ls2|)
                                                . #6#)))))))))))
                       (LETT #3#
                             (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |rp2|
                        (SPADCALL (CONS #'|PERMGRP;ls_to_lnni!1| $) |rp2|
                                  (QREFELT $ 66))
                        . #6#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #6#)
                    (SEQ (LETT |pp| NIL . #6#) (LETT #1# |rp2| . #6#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |pp| (CAR #1#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (SPADCALL |pp| (QREFELT $ 67)) #2#)
                                 . #6#)))
                         (LETT #1# (CDR #1#) . #6#) (GO G190) G191
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
         ((#1=#:G273 NIL) (|pp| NIL) (#2=#:G274 NIL) (|ip| NIL)
          (|il| #3=(|List| (|NonNegativeInteger|))) (|pl| #3#) (|i| NIL)
          (|q| (|Vector| (|NonNegativeInteger|)))
          (|pr|
           (|Record| (|:| |preimage| (|List| S)) (|:| |image| (|List| S)))))
         (SEQ
          (LETT |pr| (SPADCALL |p| (QREFELT $ 48))
                . #4=(|PERMGRP;perm_to_vec;LPNniV;14|))
          (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28)) . #4#)
          (SEQ (LETT |i| 1 . #4#) G190
               (COND ((|greater_SI| |i| |degree|) (GO G191)))
               (SEQ (EXIT (SPADCALL |q| |i| |i| (QREFELT $ 68))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |pl| (|PERMGRP;ls_to_lnni| (QCAR |pr|) |supp| $) . #4#)
          (LETT |il| (|PERMGRP;ls_to_lnni| (QCDR |pr|) |supp| $) . #4#)
          (SEQ (LETT |ip| NIL . #4#) (LETT #2# |il| . #4#)
               (LETT |pp| NIL . #4#) (LETT #1# |pl| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#) . #4#) NIL)
                     (ATOM #2#) (PROGN (LETT |ip| (CAR #2#) . #4#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |q| |pp| |ip| (QREFELT $ 68))))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |q|)))) 

(SDEFUN |PERMGRP;perm_to_vec;LPNniV;15|
        ((|supp| |List| S) (|p| |Permutation| S)
         (|degree| |NonNegativeInteger|) ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((|pos2| (|Integer|)) (|newEl| (S)) (|i| NIL)
          (|q| (|Vector| (|NonNegativeInteger|))))
         (SEQ
          (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28))
                . #1=(|PERMGRP;perm_to_vec;LPNniV;15|))
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |degree|) (GO G191)))
               (SEQ
                (LETT |newEl|
                      (SPADCALL |p| (SPADCALL |supp| |i| (QREFELT $ 41))
                                (QREFELT $ 42))
                      . #1#)
                (LETT |pos2| (SPADCALL |newEl| |supp| (QREFELT $ 70)) . #1#)
                (EXIT (SPADCALL |q| |i| |pos2| (QREFELT $ 68))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
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
          (#2=#:G290 NIL) (|i| NIL) (#3=#:G291 NIL) (|grv| NIL)
          (|schreierVector| (|Vector| (|Integer|)))
          (|orbitv| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degree| (SPADCALL (|SPADfirst| |group|) (QREFELT $ 27))
                . #4=(|PERMGRP;orbitWithSvc1|))
          (LETT |orbit| (LIST |point|) . #4#)
          (LETT |orbitv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #4#)
          (SPADCALL |orbitv| 1 |point| (QREFELT $ 68))
          (LETT |orbit_size| 1 . #4#)
          (LETT |schreierVector| (MAKEARR1 |degree| -2) . #4#)
          (SPADCALL |schreierVector| |point| -1 (QREFELT $ 72))
          (LETT |position| 1 . #4#)
          (SEQ G190
               (COND
                ((NULL (COND ((ZEROP |position|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (SEQ (LETT |grv| NIL . #4#) (LETT #3# |grpinv| . #4#)
                     (LETT |i| 1 . #4#) (LETT #2# (LENGTH |grpinv|) . #4#) G190
                     (COND
                      ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                           (PROGN (LETT |grv| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |newPoint|
                            (QAREF1O |orbitv| (+ (- |orbit_size| |position|) 1)
                                     1)
                            . #4#)
                      (LETT |newPoint| (QAREF1O |grv| |newPoint| 1) . #4#)
                      (EXIT
                       (COND
                        ((EQL (QAREF1O |schreierVector| |newPoint| 1) -2)
                         (SEQ (LETT |orbit| (CONS |newPoint| |orbit|) . #4#)
                              (LETT |orbit_size| (+ |orbit_size| 1) . #4#)
                              (SPADCALL |orbitv| |orbit_size| |newPoint|
                                        (QREFELT $ 68))
                              (LETT |position| (+ |position| 1) . #4#)
                              (EXIT
                               (SPADCALL |schreierVector| |newPoint| |i|
                                         (QREFELT $ 72))))))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#))
                           . #4#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |position| (- |position| 1) . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (NREVERSE |orbit|) |schreierVector|))))) 

(SDEFUN |PERMGRP;orbitWithSvc|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|point| |NonNegativeInteger|)
         ($ |Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
          (|:| |svc| (|Vector| (|Integer|)))))
        (SPROG
         ((|grpinv| (|List| (|Vector| (|NonNegativeInteger|)))) (#1=#:G295 NIL)
          (|el| NIL))
         (SEQ (LETT |grpinv| NIL . #2=(|PERMGRP;orbitWithSvc|))
              (SEQ (LETT |el| NIL . #2#) (LETT #1# |group| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |grpinv| (CONS (|PERMGRP;inv| |el| $) |grpinv|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |grpinv| (REVERSE |grpinv|) . #2#)
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
         ((|sizeOfGroup| (|NonNegativeInteger|)) (|k2| #1#) (#2=#:G316 NIL)
          (|j| (|Integer|))
          (|words3| #3=(|List| (|List| (|NonNegativeInteger|))))
          (|help| (|List| (|NonNegativeInteger|)))
          (|group2| #4=(|List| (|Vector| (|NonNegativeInteger|))))
          (|el2| (|Vector| (|NonNegativeInteger|)))
          (|str|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|ran|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|words2| #3#) (|gpsgs| #4#) (|k| (|List| (|NonNegativeInteger|)))
          (#5=#:G302 NIL) (|jj| NIL) (|gplength| (|NonNegativeInteger|))
          (#6=#:G299 NIL) (|k1| (|NonNegativeInteger|))
          (|ort|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|i| NIL) (|wordProblem| (|Boolean|))
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
           (SEQ
            (LETT |degree| (SPADCALL (|SPADfirst| |group|) (QREFELT $ 27))
                  . #7=(|PERMGRP;bsgs1|))
            (LETT |gp_info| (QCDR |gp|) . #7#)
            (LETT |wordProblem| (COND ((NULL |words|) 'NIL) ('T 'T)) . #7#)
            (SEQ
             (EXIT
              (SEQ (LETT |i| |number1| . #7#) G190
                   (COND ((> |i| |degree|) (GO G191)))
                   (SEQ
                    (LETT |ort| (|PERMGRP;orbitWithSvc| |group| |i| $) . #7#)
                    (LETT |k| (QCAR |ort|) . #7#)
                    (LETT |k1| (SPADCALL |k| (QREFELT $ 22)) . #7#)
                    (EXIT
                     (COND
                      ((SPADCALL |k1| 1 (QREFELT $ 24))
                       (PROGN (LETT #6# |$NoValue| . #7#) (GO #6#))))))
                   (LETT |i| (+ |i| 1) . #7#) (GO G190) G191 (EXIT NIL)))
             #6# (EXIT #6#))
            (LETT |gpsgs| NIL . #7#) (LETT |words2| NIL . #7#)
            (LETT |gplength| (LENGTH |group|) . #7#)
            (SEQ
             (EXIT
              (SEQ (LETT |jj| 1 . #7#) G190
                   (COND ((|greater_SI| |jj| |gplength|) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL |group| |jj| (QREFELT $ 44)) |i|
                                  (QREFELT $ 73))
                        |i| (QREFELT $ 24))
                       (PROGN (LETT #5# |$NoValue| . #7#) (GO #5#))))))
                   (LETT |jj| (|inc_SI| |jj|) . #7#) (GO G190) G191
                   (EXIT NIL)))
             #5# (EXIT #5#))
            (SEQ (LETT |k| 1 . #7#) G190
                 (COND ((|greater_SI| |k| |gplength|) (GO G191)))
                 (SEQ (LETT |el2| (SPADCALL |group| |k| (QREFELT $ 44)) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |el2| |i| (QREFELT $ 73)) |i|
                                   (QREFELT $ 24))
                         (SEQ (LETT |gpsgs| (CONS |el2| |gpsgs|) . #7#)
                              (EXIT
                               (COND
                                (|wordProblem|
                                 (LETT |words2|
                                       (CONS
                                        (SPADCALL |words| |k| (QREFELT $ 45))
                                        |words2|)
                                       . #7#))))))
                        ('T
                         (SEQ
                          (LETT |gpsgs|
                                (CONS
                                 (|PERMGRP;times|
                                  (SPADCALL |group| |jj| (QREFELT $ 44)) |el2|
                                  $)
                                 |gpsgs|)
                                . #7#)
                          (EXIT
                           (COND
                            (|wordProblem|
                             (LETT |words2|
                                   (CONS
                                    (APPEND
                                     (SPADCALL |words| |jj| (QREFELT $ 45))
                                     (SPADCALL |words| |k| (QREFELT $ 45)))
                                    |words2|)
                                   . #7#)))))))))
                 (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |group2| NIL . #7#) (LETT |words3| NIL . #7#)
            (LETT |j| 15 . #7#)
            (SEQ G190 (COND ((NULL (SPADCALL |j| 0 (QREFELT $ 46))) (GO G191)))
                 (SEQ
                  (LETT |ran| (|PERMGRP;ranelt| |group| |words| |maxLoops| $)
                        . #7#)
                  (LETT |str|
                        (|PERMGRP;strip1| (QCAR |ran|) |ort| |group| |words| $)
                        . #7#)
                  (LETT |el2| (QCAR |str|) . #7#)
                  (COND
                   ((NULL (|PERMGRP;testIdentity| |el2| $))
                    (COND
                     ((NULL (SPADCALL |el2| |group2| (QREFELT $ 74)))
                      (SEQ (LETT |group2| (CONS |el2| |group2|) . #7#)
                           (COND
                            (|wordProblem|
                             (SEQ
                              (LETT |help|
                                    (APPEND (REVERSE (QCDR |str|))
                                            (QCDR |ran|))
                                    . #7#)
                              (LETT |help|
                                    (|PERMGRP;shortenWord| |help| |gp| $)
                                    . #7#)
                              (EXIT
                               (LETT |words3| (CONS |help| |words3|) . #7#)))))
                           (EXIT (LETT |j| (- |j| 2) . #7#)))))))
                  (EXIT (LETT |j| (- |j| 1) . #7#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             (|wordProblem| (LETT |maxLoops| (- |maxLoops| |diff|) . #7#)))
            (COND
             ((OR (NULL |group2|) (< |maxLoops| 0))
              (SEQ (QSETVELT |gp_info| 2 (LIST |i|))
                   (SPADCALL |out| (LIST |gpsgs|) (QREFELT $ 77))
                   (SPADCALL |outword| (LIST |words2|) (QREFELT $ 80))
                   (EXIT (PROGN (LETT #2# |k1| . #7#) (GO #2#))))))
            (LETT |k2|
                  (|PERMGRP;bsgs1| |group2| (+ |i| 1) |words3| |maxLoops| |gp|
                   |diff| |out| |outword| $)
                  . #7#)
            (LETT |sizeOfGroup| (* |k1| |k2|) . #7#)
            (SPADCALL |out|
                      (APPEND (SPADCALL |out| (QREFELT $ 81)) (LIST |gpsgs|))
                      (QREFELT $ 77))
            (SPADCALL |outword|
                      (APPEND (SPADCALL |outword| (QREFELT $ 82))
                              (LIST |words2|))
                      (QREFELT $ 80))
            (QSETVELT |gp_info| 2 (CONS |i| (QVELT |gp_info| 2)))
            (EXIT |sizeOfGroup|)))
          #2# (EXIT #2#)))) 

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
          (|grpinv| #3=(|List| (|Vector| (|NonNegativeInteger|)))) (|sgs| #3#)
          (|res| #3#)
          (|obs2|
           #4=(|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                        (|:| |svc| (|Vector| (|Integer|)))))
          (|grpinv2| #5=(|List| (|Vector| (|NonNegativeInteger|))))
          (|sgs2| #5#) (|pos| (|Integer|)) (|removedGenerator| (|Boolean|))
          (|obs_len| #6=(|NonNegativeInteger|)) (|obs| #4#) (|pt| (|Integer|))
          (|baseLength| #6#) (|orbv| #2#) (|base_lst| #1#))
         (SEQ
          (LETT |base_lst| (QVELT |gp_info| 2)
                . #7=(|PERMGRP;reduceGenerators|))
          (LETT |orbv| (QVELT |gp_info| 3) . #7#) (LETT |sgs| NIL . #7#)
          (LETT |res| NIL . #7#) (LETT |grpinv| NIL . #7#)
          (SEQ (LETT |i| 1 . #7#) G190
               (COND ((|greater_SI| |i| |kkk|) (GO G191)))
               (SEQ
                (LETT |sgs| (APPEND |sgs| (SPADCALL |outl| |i| (QREFELT $ 83)))
                      . #7#)
                (EXIT
                 (LETT |grpinv|
                       (APPEND |grpinv|
                               (SPADCALL (CONS (|function| |PERMGRP;inv|) $)
                                         (SPADCALL |outl| |i| (QREFELT $ 83))
                                         (QREFELT $ 85)))
                       . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |removedGenerator| 'NIL . #7#)
          (LETT |baseLength| (SPADCALL |base_lst| (QREFELT $ 22)) . #7#)
          (LETT |pt| (+ (- |baseLength| |kkk|) 1) . #7#)
          (LETT |obs|
                (|PERMGRP;orbitWithSvc1| |sgs| |grpinv|
                 (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $)
                . #7#)
          (SPADCALL |orbv| |kkk| |obs| (QREFELT $ 88))
          (LETT |obs_len| (SPADCALL (QCAR |obs|) (QREFELT $ 22)) . #7#)
          (COND
           ((EQL |obs_len| 1)
            (SEQ (LETT |removedGenerator| 'T . #7#)
                 (EXIT (SPADCALL |outl| |kkk| NIL (QREFELT $ 89))))))
          (LETT |i| 1 . #7#)
          (LETT |outlk| (SPADCALL |outl| |kkk| (QREFELT $ 83)) . #7#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((SPADCALL |i| (LENGTH |outlk|) (QREFELT $ 90)) 'NIL)
                        ('T (SPADCALL (LENGTH |outlk|) 1 (QREFELT $ 90)))))
                 (GO G191)))
               (SEQ
                (LETT |pos|
                      (SPADCALL (SPADCALL |outlk| |i| (QREFELT $ 44)) |sgs|
                                (QREFELT $ 91))
                      . #7#)
                (LETT |sgs2| (SPADCALL |sgs| |pos| (QREFELT $ 92)) . #7#)
                (LETT |grpinv2| (SPADCALL |grpinv| |pos| (QREFELT $ 92)) . #7#)
                (LETT |obs2|
                      (|PERMGRP;orbitWithSvc1| |sgs2| |grpinv2|
                       (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $)
                      . #7#)
                (EXIT
                 (COND
                  ((EQL (SPADCALL (QCAR |obs2|) (QREFELT $ 22)) |obs_len|)
                   (SEQ
                    (LETT |res|
                          (CONS (SPADCALL |outlk| |i| (QREFELT $ 44)) |res|)
                          . #7#)
                    (LETT |sgs| |sgs2| . #7#) (LETT |grpinv| |grpinv2| . #7#)
                    (LETT |outlk| (SPADCALL |outlk| |i| (QREFELT $ 92)) . #7#)
                    (SPADCALL |outl| |kkk| |outlk| (QREFELT $ 89))
                    (SPADCALL |orbv| |kkk| |obs2| (QREFELT $ 88))
                    (EXIT
                     (COND
                      (|do_words|
                       (SPADCALL |outword| |kkk|
                                 (SPADCALL
                                  (SPADCALL |outword| |kkk| (QREFELT $ 93)) |i|
                                  (QREFELT $ 94))
                                 (QREFELT $ 95)))))))
                  ('T (LETT |i| (+ |i| 1) . #7#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |PERMGRP;bsgs|
        ((|group| $) (|wordProblem| |Boolean|) (|maxLoops| |Integer|)
         (|diff| |Integer|) ($ |NonNegativeInteger|))
        (SPROG
         ((|sizeOfGroup| (|NonNegativeInteger|)) (#1=#:G389 NIL) (|j| NIL)
          (|kkk| (|Integer|))
          (|outword| (|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|out| (|List| (|List| (|Vector| (|NonNegativeInteger|)))))
          (|orbv|
           (|Vector|
            (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                      (|:| |svc| (|Vector| (|Integer|))))))
          (#2=#:G371 NIL) (|baseOfGroup| (|List| (|NonNegativeInteger|)))
          (|i| NIL) (|word| #3=(|List| (|NonNegativeInteger|)))
          (|ttt| (|Vector| (|NonNegativeInteger|)))
          (|word2| (|List| (|NonNegativeInteger|))) (#4=#:G388 NIL) (|wdi| NIL)
          (|add_cnt| (|Integer|)) (|noAnswer| #5=(|Boolean|)) (#6=#:G359 NIL)
          (|basePoint| (|NonNegativeInteger|)) (#7=#:G356 NIL)
          (|newBasePoint| (|Boolean|)) (#8=#:G387 NIL) (|p| NIL) (|ii| NIL)
          (|z| #9=(|Vector| (|NonNegativeInteger|)))
          (|ppp|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|noresult| #5#) (#10=#:G386 NIL) (|jjj| NIL) (|word3| #3#)
          (|y1| (|Vector| (|NonNegativeInteger|))) (#11=#:G385 NIL) (|pt| NIL)
          (#12=#:G384 NIL) (|z0| NIL)
          (|gporbi|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|wordlist| #13=(|List| (|List| (|NonNegativeInteger|))))
          (|sgsv| (|Vector| (|Vector| (|NonNegativeInteger|))))
          (|sgs| #14=(|List| (|Vector| (|NonNegativeInteger|))))
          (|rejects| (|List| (|Vector| (|NonNegativeInteger|))))
          (#15=#:G383 NIL) (#16=#:G382 NIL)
          (|dummy_rec|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|newGroup| #14#) (|k| (|NonNegativeInteger|)) (|words| #13#)
          (|q| (|Vector| (|NonNegativeInteger|))) (#17=#:G380 NIL) (|ggg| NIL)
          (#18=#:G381 NIL) (|ggp| NIL) (|gp| (|List| (|Permutation| S)))
          (|tmpv| #9#) (#19=#:G379 NIL)
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
           (SEQ (LETT |basePoint| 0 . #20=(|PERMGRP;bsgs|))
                (LETT |newBasePoint| 'NIL . #20#)
                (LETT |baseOfGroup| NIL . #20#) (LETT |out| NIL . #20#)
                (LETT |outword| NIL . #20#)
                (LETT |outr| (SPADCALL NIL (QREFELT $ 96)) . #20#)
                (LETT |outwordr| (SPADCALL NIL (QREFELT $ 97)) . #20#)
                (LETT |supp| (SPADCALL |group| (QREFELT $ 52)) . #20#)
                (LETT |degree| (LENGTH |supp|) . #20#)
                (LETT |gp_info| (VECTOR 1 NIL NIL #() NIL NIL) . #20#)
                (COND
                 ((EQL |degree| 0)
                  (SEQ (PROGN (RPLACD |group| |gp_info|) (QCDR |group|))
                       (EXIT (PROGN (LETT #19# 1 . #20#) (GO #19#))))))
                (LETT |newGroup| NIL . #20#)
                (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #20#)
                (LETT |gp| (QCAR |group|) . #20#) (LETT |words| NIL . #20#)
                (SEQ (LETT |ggp| NIL . #20#) (LETT #18# |gp| . #20#)
                     (LETT |ggg| 1 . #20#) (LETT #17# (LENGTH |gp|) . #20#)
                     G190
                     (COND
                      ((OR (|greater_SI| |ggg| #17#) (ATOM #18#)
                           (PROGN (LETT |ggp| (CAR #18#) . #20#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |q| (SPADCALL |supp| |ggp| |degree| (QREFELT $ 69))
                            . #20#)
                      (LETT |newGroup| (CONS |q| |newGroup|) . #20#)
                      (EXIT
                       (COND
                        (|wordProblem|
                         (LETT |words|
                               (CONS (SPADCALL |ggg| (QREFELT $ 98)) |words|)
                               . #20#)))))
                     (LETT |ggg|
                           (PROG1 (|inc_SI| |ggg|)
                             (LETT #18# (CDR #18#) . #20#))
                           . #20#)
                     (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |maxLoops| 1)
                  (SEQ
                   (COND
                    ((ZEROP (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22)))
                     (LETT |k|
                           (|PERMGRP;bsgs1| |newGroup| 1 NIL 20 |group| 0
                            |outr| |outwordr| $)
                           . #20#)))
                   (EXIT
                    (LETT |maxLoops|
                          (- (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22))
                             1)
                          . #20#)))))
                (LETT |k|
                      (|PERMGRP;bsgs1| |newGroup| 1 |words| |maxLoops| |group|
                       |diff| |outr| |outwordr| $)
                      . #20#)
                (LETT |out| (SPADCALL |outr| (QREFELT $ 81)) . #20#)
                (LETT |outword| (SPADCALL |outwordr| (QREFELT $ 82)) . #20#)
                (LETT |kkk| 1 . #20#)
                (LETT |newGroup| (REVERSE |newGroup|) . #20#)
                (LETT |noAnswer| 'T . #20#) (LETT |add_cnt| 0 . #20#)
                (LETT |dummy_rec| (CONS NIL (MAKE-ARRAY 0)) . #20#)
                (LETT |baseOfGroup| (QVELT (QCDR |group|) 2) . #20#)
                (QSETVELT |gp_info| 2 |baseOfGroup|)
                (LETT |orbv|
                      (MAKEARR1 (SPADCALL |baseOfGroup| (QREFELT $ 22))
                                |dummy_rec|)
                      . #20#)
                (SEQ G190 (COND ((NULL |noAnswer|) (GO G191)))
                     (SEQ (QSETVELT |gp_info| 2 |baseOfGroup|)
                          (QSETVELT |gp_info| 3 |orbv|) (LETT |sgs| NIL . #20#)
                          (LETT |wordlist| NIL . #20#)
                          (SEQ (LETT |i| 1 . #20#)
                               (LETT #16# (- |kkk| 1) . #20#) G190
                               (COND ((|greater_SI| |i| #16#) (GO G191)))
                               (SEQ
                                (LETT |sgs|
                                      (APPEND |sgs|
                                              (SPADCALL |out| |i|
                                                        (QREFELT $ 83)))
                                      . #20#)
                                (EXIT
                                 (COND
                                  (|wordProblem|
                                   (LETT |wordlist|
                                         (APPEND |wordlist|
                                                 (SPADCALL |outword| |i|
                                                           (QREFELT $ 93)))
                                         . #20#)))))
                               (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |noresult| 'T . #20#)
                          (LETT |z| (SPADCALL |degree| 0 (QREFELT $ 28))
                                . #20#)
                          (SEQ (LETT |i| |kkk| . #20#)
                               (LETT #15#
                                     (SPADCALL |baseOfGroup| (QREFELT $ 22))
                                     . #20#)
                               G190
                               (COND
                                ((OR (> |i| #15#) (NULL |noresult|))
                                 (GO G191)))
                               (SEQ
                                (LETT |rejects|
                                      (|PERMGRP;reduceGenerators| |i|
                                       |wordProblem| |gp_info| |out| |outword|
                                       $)
                                      . #20#)
                                (LETT |sgs|
                                      (APPEND |sgs|
                                              (SPADCALL |out| |i|
                                                        (QREFELT $ 83)))
                                      . #20#)
                                (LETT |sgsv| (SPADCALL |sgs| (QREFELT $ 34))
                                      . #20#)
                                (LETT |wordv| (MAKE-ARRAY 0) . #20#)
                                (COND
                                 (|wordProblem|
                                  (SEQ
                                   (LETT |wordlist|
                                         (APPEND |wordlist|
                                                 (SPADCALL |outword| |i|
                                                           (QREFELT $ 93)))
                                         . #20#)
                                   (EXIT
                                    (LETT |wordv|
                                          (SPADCALL |wordlist| (QREFELT $ 36))
                                          . #20#)))))
                                (LETT |gporbi|
                                      (SPADCALL |orbv| |i| (QREFELT $ 99))
                                      . #20#)
                                (SEQ (LETT |z0| NIL . #20#)
                                     (LETT #12# |rejects| . #20#) G190
                                     (COND
                                      ((OR (ATOM #12#)
                                           (PROGN
                                            (LETT |z0| (CAR #12#) . #20#)
                                            NIL)
                                           (NULL |noresult|))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |z| (SPADCALL |z0| (QREFELT $ 100))
                                            . #20#)
                                      (LETT |ppp|
                                            (|PERMGRP;strip| |z| |i| 'NIL
                                             |orbv| |sgsv| |wordv| $)
                                            . #20#)
                                      (LETT |noresult|
                                            (|PERMGRP;testIdentity|
                                             (QCAR |ppp|) $)
                                            . #20#)
                                      (EXIT
                                       (COND
                                        ((NULL |noresult|)
                                         (SEQ
                                          (COND
                                           (|wordProblem|
                                            (SEQ
                                             (LETT |z|
                                                   (SPADCALL |z0|
                                                             (QREFELT $ 100))
                                                   . #20#)
                                             (EXIT
                                              (LETT |ppp|
                                                    (|PERMGRP;strip| |z| |i| 'T
                                                     |orbv| |sgsv| |wordv| $)
                                                    . #20#)))))
                                          (LETT |z| (QCAR |ppp|) . #20#)
                                          (EXIT
                                           (LETT |word| (QCDR |ppp|)
                                                 . #20#)))))))
                                     (LETT #12# (CDR #12#) . #20#) (GO G190)
                                     G191 (EXIT NIL))
                                (SEQ (LETT |pt| NIL . #20#)
                                     (LETT #11# (QCAR |gporbi|) . #20#) G190
                                     (COND
                                      ((OR (ATOM #11#)
                                           (PROGN
                                            (LETT |pt| (CAR #11#) . #20#)
                                            NIL)
                                           (NULL |noresult|))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |ppp|
                                            (|PERMGRP;cosetRep1| |pt|
                                             |wordProblem| |gporbi| |sgsv|
                                             |wordv| $)
                                            . #20#)
                                      (LETT |y1| (|PERMGRP;inv| (QCAR |ppp|) $)
                                            . #20#)
                                      (LETT |word3| (QCDR |ppp|) . #20#)
                                      (EXIT
                                       (SEQ (LETT |jjj| 1 . #20#)
                                            (LETT #10# (LENGTH |sgs|) . #20#)
                                            G190
                                            (COND
                                             ((OR (|greater_SI| |jjj| #10#)
                                                  (NULL |noresult|))
                                              (GO G191)))
                                            (SEQ (LETT |word| NIL . #20#)
                                                 (|PERMGRP;times!| |z|
                                                  (QAREF1O |sgsv| |jjj| 1) |y1|
                                                  $)
                                                 (COND
                                                  (|wordProblem|
                                                   (LETT |word|
                                                         (QAREF1O |wordv| |jjj|
                                                                  1)
                                                         . #20#)))
                                                 (LETT |ppp|
                                                       (|PERMGRP;strip| |z| |i|
                                                        'NIL |orbv| |sgsv|
                                                        |wordv| $)
                                                       . #20#)
                                                 (LETT |z| (QCAR |ppp|) . #20#)
                                                 (LETT |noresult|
                                                       (|PERMGRP;testIdentity|
                                                        |z| $)
                                                       . #20#)
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
                                                              |y1| $)
                                                             . #20#)
                                                       (LETT |ppp|
                                                             (|PERMGRP;strip|
                                                              |z| |i| 'T |orbv|
                                                              |sgsv| |wordv| $)
                                                             . #20#)
                                                       (LETT |z| (QCAR |ppp|)
                                                             . #20#)
                                                       (EXIT
                                                        (LETT |word|
                                                              (APPEND
                                                               (QCDR |ppp|)
                                                               |word|)
                                                              . #20#)))))))))
                                            (LETT |jjj| (|inc_SI| |jjj|)
                                                  . #20#)
                                            (GO G190) G191 (EXIT NIL))))
                                     (LETT #11# (CDR #11#) . #20#) (GO G190)
                                     G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((NULL |noresult|)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |ii| 1 . #20#)
                                          (LETT |p| NIL . #20#)
                                          (LETT #8# |baseOfGroup| . #20#) G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |p| (CAR #8#) . #20#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ (LETT |basePoint| 1 . #20#)
                                               (LETT |newBasePoint| 'T . #20#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL (QAREF1O |z| |p| 1)
                                                            |p| (QREFELT $ 24))
                                                  (SEQ
                                                   (LETT |newBasePoint| 'NIL
                                                         . #20#)
                                                   (LETT |basePoint|
                                                         (PROG1
                                                             (LETT #7#
                                                                   (+
                                                                    (-
                                                                     (SPADCALL
                                                                      |baseOfGroup|
                                                                      (QREFELT
                                                                       $ 22))
                                                                     |ii|)
                                                                    1)
                                                                   . #20#)
                                                           (|check_subtype|
                                                            (>= #7# 0)
                                                            '(|NonNegativeInteger|)
                                                            #7#))
                                                         . #20#)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #6# |$NoValue|
                                                           . #20#)
                                                     (GO #6#))))))))
                                          (LETT #8#
                                                (PROG1 (CDR #8#)
                                                  (LETT |ii| (|inc_SI| |ii|)
                                                        . #20#))
                                                . #20#)
                                          (GO G190) G191 (EXIT NIL)))
                                    #6# (EXIT #6#))))))
                               (LETT |i| (+ |i| 1) . #20#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |noAnswer|
                                (COND ((|PERMGRP;testIdentity| |z| $) 'NIL)
                                      ('T 'T))
                                . #20#)
                          (EXIT
                           (COND
                            (|noAnswer|
                             (SEQ (LETT |add_cnt| (+ |add_cnt| 1) . #20#)
                                  (LETT |word2| NIL . #20#)
                                  (COND
                                   (|wordProblem|
                                    (SEQ
                                     (SEQ (LETT |wdi| NIL . #20#)
                                          (LETT #4# |word3| . #20#) G190
                                          (COND
                                           ((OR (ATOM #4#)
                                                (PROGN
                                                 (LETT |wdi| (CAR #4#) . #20#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |ttt|
                                                 (SPADCALL |newGroup| |wdi|
                                                           (QREFELT $ 44))
                                                 . #20#)
                                           (EXIT
                                            (SEQ G190
                                                 (COND
                                                  ((NULL
                                                    (COND
                                                     ((|PERMGRP;testIdentity|
                                                       |ttt| $)
                                                      'NIL)
                                                     ('T 'T)))
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |word2|
                                                        (CONS |wdi| |word2|)
                                                        . #20#)
                                                  (EXIT
                                                   (LETT |ttt|
                                                         (|PERMGRP;times| |ttt|
                                                          (SPADCALL |newGroup|
                                                                    |wdi|
                                                                    (QREFELT $
                                                                             44))
                                                          $)
                                                         . #20#)))
                                                 NIL (GO G190) G191
                                                 (EXIT NIL))))
                                          (LETT #4# (CDR #4#) . #20#) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |word| (APPEND |word| |word2|)
                                           . #20#)
                                     (EXIT
                                      (LETT |word|
                                            (|PERMGRP;shortenWord| |word|
                                             |group| $)
                                            . #20#)))))
                                  (COND
                                   (|newBasePoint|
                                    (SEQ
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |i| 1 . #20#) G190
                                            (COND
                                             ((|greater_SI| |i| |degree|)
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
                                                       (APPEND |baseOfGroup|
                                                               (LIST |i|))
                                                       . #20#)
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #2# |$NoValue| . #20#)
                                                   (GO #2#))))))))
                                            (LETT |i| (|inc_SI| |i|) . #20#)
                                            (GO G190) G191 (EXIT NIL)))
                                      #2# (EXIT #2#))
                                     (LETT |orbv|
                                           (MAKEARR1
                                            (SPADCALL |baseOfGroup|
                                                      (QREFELT $ 22))
                                            |dummy_rec|)
                                           . #20#)
                                     (LETT |out|
                                           (CONS (SPADCALL |z| (QREFELT $ 101))
                                                 |out|)
                                           . #20#)
                                     (EXIT
                                      (COND
                                       (|wordProblem|
                                        (LETT |outword|
                                              (CONS
                                               (SPADCALL |word|
                                                         (QREFELT $ 102))
                                               |outword|)
                                              . #20#))))))
                                   ('T
                                    (SEQ
                                     (SPADCALL |out| |basePoint|
                                               (CONS |z|
                                                     (SPADCALL |out|
                                                               |basePoint|
                                                               (QREFELT $ 83)))
                                               (QREFELT $ 89))
                                     (EXIT
                                      (COND
                                       (|wordProblem|
                                        (SPADCALL |outword| |basePoint|
                                                  (CONS |word|
                                                        (SPADCALL |outword|
                                                                  |basePoint|
                                                                  (QREFELT $
                                                                           93)))
                                                  (QREFELT $ 95))))))))
                                  (EXIT (LETT |kkk| |basePoint| . #20#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |sizeOfGroup| 1 . #20#)
                (SEQ (LETT |j| 1 . #20#)
                     (LETT #1# (SPADCALL |baseOfGroup| (QREFELT $ 22)) . #20#)
                     G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |sizeOfGroup|
                             (* |sizeOfGroup|
                                (SPADCALL
                                 (QCAR (SPADCALL |orbv| |j| (QREFELT $ 99)))
                                 (QREFELT $ 22)))
                             . #20#)))
                     (LETT |j| (|inc_SI| |j|) . #20#) (GO G190) G191
                     (EXIT NIL))
                (PROGN
                 (RPLACD |group|
                         (VECTOR |sizeOfGroup| |sgs| |baseOfGroup| |orbv|
                                 |supp| |wordlist|))
                 (QCDR |group|))
                (EXIT |sizeOfGroup|)))
          #19# (EXIT #19#)))) 

(SDEFUN |PERMGRP;initialize| ((|group| $) ($ |Set| (|Permutation| S)))
        (SPROG
         ((#1=#:G394 NIL) (|gen| NIL) (|gp| (|List| (|Permutation| S)))
          (|group2| (|Set| (|Permutation| S))))
         (SEQ
          (LETT |group2| (SPADCALL (QREFELT $ 104))
                . #2=(|PERMGRP;initialize|))
          (LETT |gp| (QCAR |group|) . #2#)
          (SEQ (LETT |gen| NIL . #2#) (LETT #1# |gp| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |gen| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |gen| (QREFELT $ 105)) 0 (QREFELT $ 90))
                   (SPADCALL |gen| |group2| (QREFELT $ 106))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |group2|)))) 

(SDEFUN |PERMGRP;knownGroup?| ((|gp| $) ($ |Void|))
        (SEQ
         (COND
          ((EQL (QVELT (QCDR |gp|) 0) 0) (|PERMGRP;bsgs| |gp| 'NIL 20 0 $)))
         (EXIT (SPADCALL (QREFELT $ 108))))) 

(SDEFUN |PERMGRP;subgroup| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G401 NIL) (#2=#:G404 NIL) (#3=#:G405 NIL) (|el| NIL)
          (|gpset2| #4=(|Set| (|Permutation| S))) (|gpset1| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |gpset1| (|PERMGRP;initialize| |gp1| $)
                  . #5=(|PERMGRP;subgroup|))
            (LETT |gpset2| (|PERMGRP;initialize| |gp2| $) . #5#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |gpset1| |gpset2| (QREFELT $ 109))
                         (QREFELT $ 110))
               'T)
              ('T
               (SEQ
                (SEQ
                 (EXIT
                  (SEQ (LETT |el| NIL . #5#)
                       (LETT #3# (SPADCALL |gpset1| (QREFELT $ 111)) . #5#)
                       G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |el| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |el| |gp2| (QREFELT $ 112)))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                  . #5#)
                            (GO #1#))))))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL)))
                 #1# (EXIT #1#))
                (EXIT 'T)))))))
          #2# (EXIT #2#)))) 

(SDEFUN |PERMGRP;memberInternal|
        ((|p| |Permutation| S) (|gp| $) (|do_words| |Boolean|)
         ($ |Record| (|:| |bool| (|Boolean|))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|str|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|grpv| (|Vector| (|Vector| (|NonNegativeInteger|)))) (#1=#:G417 NIL)
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
          (#2=#:G415 NIL) (#3=#:G409 NIL) (#4=#:G416 NIL) (|x| NIL)
          (|mP| (|List| S)) (|gr_supp| (|List| S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |gr_supp| (SPADCALL |gp| (QREFELT $ 52))
                  . #5=(|PERMGRP;memberInternal|))
            (LETT |mP| (SPADCALL (SPADCALL |p| (QREFELT $ 55)) (QREFELT $ 57))
                  . #5#)
            (SEQ
             (EXIT
              (SEQ (LETT |x| NIL . #5#) (LETT #4# |mP| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |x| |gr_supp| (QREFELT $ 113)))
                       (PROGN
                        (LETT #3#
                              (PROGN (LETT #2# (CONS 'NIL NIL) . #5#) (GO #2#))
                              . #5#)
                        (GO #3#))))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
             #3# (EXIT #3#))
            (COND
             ((NULL |do_words|)
              (COND
               ((SPADCALL |p| (QCAR |gp|) (QREFELT $ 114))
                (EXIT (PROGN (LETT #2# (CONS 'T NIL) . #5#) (GO #2#)))))))
            (|PERMGRP;knownGroup?| |gp| $) (LETT |gp_info| (QCDR |gp|) . #5#)
            (LETT |sgsl| (QVELT |gp_info| 1) . #5#)
            (LETT |orbv| (QVELT |gp_info| 3) . #5#)
            (LETT |base_lst| (QVELT |gp_info| 2) . #5#)
            (LETT |degree| (LENGTH |gr_supp|) . #5#)
            (LETT |pp| (SPADCALL |gr_supp| |p| |degree| (QREFELT $ 69)) . #5#)
            (LETT |wordv| (MAKE-ARRAY 0) . #5#)
            (COND
             (|do_words|
              (SEQ (LETT |wordv| (MAKEARR1 (LENGTH |sgsl|) NIL) . #5#)
                   (EXIT
                    (SEQ (LETT |i| 1 . #5#) (LETT #1# (LENGTH |sgsl|) . #5#)
                         G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |wordv| |i| (LIST |i|) (QREFELT $ 115))))
                         (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                         (EXIT NIL))))))
            (LETT |grpv| (SPADCALL |sgsl| (QREFELT $ 34)) . #5#)
            (LETT |str|
                  (|PERMGRP;strip| |pp| (SPADCALL |base_lst| (QREFELT $ 22))
                   |do_words| |orbv| |grpv| |wordv| $)
                  . #5#)
            (EXIT
             (CONS (|PERMGRP;testIdentity| (QCAR |str|) $) (QCDR |str|)))))
          #2# (EXIT #2#)))) 

(PUT '|PERMGRP;coerce;$L;25| '|SPADreplace| 'QCAR) 

(SDEFUN |PERMGRP;coerce;$L;25| ((|gp| $) ($ |List| (|Permutation| S)))
        (QCAR |gp|)) 

(PUT '|PERMGRP;generators;$L;26| '|SPADreplace| 'QCAR) 

(SDEFUN |PERMGRP;generators;$L;26| ((|gp| $) ($ |List| (|Permutation| S)))
        (QCAR |gp|)) 

(SDEFUN |PERMGRP;strongGenerators;$L;27|
        ((|group| $) ($ |List| (|Permutation| S)))
        (SPROG
         ((|strongGens| (|List| (|Permutation| S)))
          (|pairs| (|List| (|List| S))) (|j| NIL) (#1=#:G426 NIL) (|i| NIL)
          (|degree| (|NonNegativeInteger|))
          (|gr_sgs| (|List| (|Vector| (|NonNegativeInteger|))))
          (|gr_supp| (|List| S)))
         (SEQ (|PERMGRP;knownGroup?| |group| $)
              (LETT |gr_supp| (QVELT (QCDR |group|) 4)
                    . #2=(|PERMGRP;strongGenerators;$L;27|))
              (LETT |gr_sgs| (QVELT (QCDR |group|) 1) . #2#)
              (LETT |degree| (LENGTH |gr_supp|) . #2#)
              (LETT |strongGens| NIL . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |gr_sgs| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |pairs| NIL . #2#)
                        (SEQ (LETT |j| 1 . #2#) G190
                             (COND ((|greater_SI| |j| |degree|) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |pairs|
                                     (CONS
                                      (LIST
                                       (SPADCALL |gr_supp| |j| (QREFELT $ 41))
                                       (SPADCALL |gr_supp|
                                                 (SPADCALL |i| |j|
                                                           (QREFELT $ 73))
                                                 (QREFELT $ 41)))
                                      |pairs|)
                                     . #2#)))
                             (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |strongGens|
                               (CONS (SPADCALL |pairs| (QREFELT $ 117))
                                     |strongGens|)
                               . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |strongGens|))))) 

(SDEFUN |PERMGRP;elt;$NniP;28|
        ((|gp| $) (|i| |NonNegativeInteger|) ($ |Permutation| S))
        (SPADCALL (QCAR |gp|) |i| (QREFELT $ 119))) 

(SDEFUN |PERMGRP;movedPoints;$S;29| ((|gp| $) ($ |Set| S))
        (SPADCALL (SPADCALL |gp| (QREFELT $ 52)) (QREFELT $ 121))) 

(SDEFUN |PERMGRP;random;$IP;30|
        ((|group| $) (|maximalNumberOfFactors| |Integer|) ($ |Permutation| S))
        (SPROG
         ((|numberOfLoops| #1=(|Integer|)) (|randomElement| (|Permutation| S))
          (|randomInteger| #1#) (|numberOfGenerators| (|NonNegativeInteger|))
          (|gp| (|List| (|Permutation| S))))
         (SEQ
          (COND ((< |maximalNumberOfFactors| 1) (|spadConstant| $ 23))
                ('T
                 (SEQ (LETT |gp| (QCAR |group|) . #2=(|PERMGRP;random;$IP;30|))
                      (LETT |numberOfGenerators| (LENGTH |gp|) . #2#)
                      (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|))
                            . #2#)
                      (LETT |randomElement|
                            (SPADCALL |gp| |randomInteger| (QREFELT $ 119))
                            . #2#)
                      (LETT |numberOfLoops|
                            (+ 1 (RANDOM |maximalNumberOfFactors|)) . #2#)
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |numberOfLoops| 0 (QREFELT $ 46)))
                             (GO G191)))
                           (SEQ
                            (LETT |randomInteger|
                                  (+ 1 (RANDOM |numberOfGenerators|)) . #2#)
                            (LETT |randomElement|
                                  (SPADCALL
                                   (SPADCALL |gp| |randomInteger|
                                             (QREFELT $ 119))
                                   |randomElement| (QREFELT $ 123))
                                  . #2#)
                            (EXIT
                             (LETT |numberOfLoops| (- |numberOfLoops| 1)
                                   . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |randomElement|))))))) 

(SDEFUN |PERMGRP;random;$P;31| ((|group| $) ($ |Permutation| S))
        (SPADCALL |group| 20 (QREFELT $ 124))) 

(SDEFUN |PERMGRP;order;$Nni;32| ((|group| $) ($ |NonNegativeInteger|))
        (SEQ (|PERMGRP;knownGroup?| |group| $) (EXIT (QVELT (QCDR |group|) 0)))) 

(SDEFUN |PERMGRP;degree;$Nni;33| ((|group| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |group| (QREFELT $ 52)))) 

(SDEFUN |PERMGRP;base;$L;34| ((|group| $) ($ |List| S))
        (SPROG
         ((|groupBase| (|List| S)) (#1=#:G443 NIL) (|i| NIL)
          (|gr_supp| (|List| S)) (|gr_base| (|List| (|NonNegativeInteger|))))
         (SEQ (|PERMGRP;knownGroup?| |group| $)
              (LETT |gr_base| (QVELT (QCDR |group|) 2)
                    . #2=(|PERMGRP;base;$L;34|))
              (LETT |gr_supp| (QVELT (QCDR |group|) 4) . #2#)
              (LETT |groupBase| NIL . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |gr_base| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |groupBase|
                           (CONS (SPADCALL |gr_supp| |i| (QREFELT $ 41))
                                 |groupBase|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |groupBase|))))) 

(SDEFUN |PERMGRP;wordsForStrongGenerators;$L;35|
        ((|group| $) ($ |List| (|List| (|NonNegativeInteger|))))
        (SEQ (|PERMGRP;knownGroup?| |group| $) (EXIT (QVELT (QCDR |group|) 5)))) 

(SDEFUN |PERMGRP;coerce;L$;36| ((|gp| |List| (|Permutation| S)) ($ $))
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
         (SEQ
          (LETT |result| (VECTOR 0 NIL NIL #() NIL NIL)
                . #1=(|PERMGRP;coerce;L$;36|))
          (EXIT (LETT |group| (CONS |gp| |result|) . #1#))))) 

(SDEFUN |PERMGRP;permutationGroup;L$;37|
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
         (SEQ
          (LETT |result| (VECTOR 0 NIL NIL #() NIL NIL)
                . #1=(|PERMGRP;permutationGroup;L$;37|))
          (EXIT (LETT |group| (CONS |gp| |result|) . #1#))))) 

(SDEFUN |PERMGRP;coerce;$Of;38| ((|group| $) ($ |OutputForm|))
        (SPROG
         ((|outList| (|List| (|OutputForm|))) (|i| NIL)
          (|gp| (|List| (|Permutation| S))))
         (SEQ (LETT |outList| NIL . #1=(|PERMGRP;coerce;$Of;38|))
              (LETT |gp| (QCAR |group|) . #1#)
              (SEQ (LETT |i| (SPADCALL |gp| (QREFELT $ 132)) . #1#) G190
                   (COND ((< |i| 1) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |outList|
                           (CONS
                            (SPADCALL (SPADCALL |gp| |i| (QREFELT $ 119))
                                      (QREFELT $ 134))
                            |outList|)
                           . #1#)))
                   (LETT |i| (+ |i| -1) . #1#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL '> (QREFELT $ 136))
                         (SPADCALL (SPADCALL |outList| (QREFELT $ 138))
                                   (SPADCALL '< (QREFELT $ 136))
                                   (QREFELT $ 139))
                         (QREFELT $ 139)))))) 

(SDEFUN |PERMGRP;orbit;$SS;39| ((|gp| $) (|el| S) ($ |Set| S))
        (SPROG
         ((#1=#:G461 NIL) (|i| NIL) (|outSet| (|Set| S))
          (|outList| (|List| (|List| S))) (|elList| (|List| S)))
         (SEQ (LETT |elList| (LIST |el|) . #2=(|PERMGRP;orbit;$SS;39|))
              (LETT |outList| (|PERMGRP;orbitInternal| |gp| |elList| $) . #2#)
              (LETT |outSet| (SPADCALL (QREFELT $ 54)) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (LENGTH |outList|) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |outList| |i| (QREFELT $ 40)) 1
                                (QREFELT $ 41))
                      |outSet| (QREFELT $ 141))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |outSet|)))) 

(SDEFUN |PERMGRP;orbits;$S;40| ((|gp| $) ($ |Set| (|Set| S)))
        (SPROG
         ((|spp| (|Set| S)) (|orbits| (|List| (|Set| S)))
          (|orbitSet| (|Set| S)) (|el| (S)))
         (SEQ
          (LETT |spp| (SPADCALL |gp| (QREFELT $ 122))
                . #1=(|PERMGRP;orbits;$S;40|))
          (LETT |orbits| NIL . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |spp| (QREFELT $ 143)) 0 (QREFELT $ 90)))
                 (GO G191)))
               (SEQ (LETT |el| (SPADCALL |spp| (QREFELT $ 144)) . #1#)
                    (LETT |orbitSet| (SPADCALL |gp| |el| (QREFELT $ 142))
                          . #1#)
                    (LETT |orbits| (CONS |orbitSet| |orbits|) . #1#)
                    (EXIT
                     (LETT |spp| (SPADCALL |spp| |orbitSet| (QREFELT $ 145))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |orbits| (QREFELT $ 148)))))) 

(SDEFUN |PERMGRP;member?;P$B;41| ((|p| |Permutation| S) (|gp| $) ($ |Boolean|))
        (SPROG
         ((|mi|
           (|Record| (|:| |bool| (|Boolean|))
                     (|:| |lst| (|List| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |mi| (|PERMGRP;memberInternal| |p| |gp| 'NIL $)
                |PERMGRP;member?;P$B;41|)
          (EXIT (QCAR |mi|))))) 

(SDEFUN |PERMGRP;wordInStrongGenerators;P$L;42|
        ((|p| |Permutation| S) (|gp| $) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|mi|
           (|Record| (|:| |bool| (|Boolean|))
                     (|:| |lst| (|List| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |mi|
                (|PERMGRP;memberInternal| (SPADCALL |p| (QREFELT $ 150)) |gp|
                 'T $)
                |PERMGRP;wordInStrongGenerators;P$L;42|)
          (COND
           ((NULL (QCAR |mi|)) (EXIT (|error| "p is not an element of gp"))))
          (EXIT (QCDR |mi|))))) 

(SDEFUN |PERMGRP;wordInGenerators;P$L;43|
        ((|p| |Permutation| S) (|gp| $) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|outlist| (|List| (|NonNegativeInteger|))) (#1=#:G477 NIL) (|n| NIL)
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
         (SEQ
          (LETT |gp_info| (QCDR |gp|) . #3=(|PERMGRP;wordInGenerators;P$L;43|))
          (COND
           ((EQL (LENGTH (QVELT |gp_info| 5)) 0)
            (SPADCALL |gp| (QREFELT $ 152))))
          (LETT |lll| (SPADCALL |p| |gp| (QREFELT $ 151)) . #3#)
          (LETT |outlist| NIL . #3#) (LETT |words| (QVELT (QCDR |gp|) 5) . #3#)
          (SEQ (LETT |n| NIL . #3#) (LETT #1# |lll| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |outlist|
                       (APPEND |outlist| (SPADCALL |words| |n| (QREFELT $ 45)))
                       . #3#)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (|PERMGRP;shortenWord| |outlist| |gp| $))))) 

(SDEFUN |PERMGRP;<;2$B;44| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (COND
         ((NULL
           (SPADCALL
            (SPADCALL (SPADCALL |gp1| (QREFELT $ 122))
                      (SPADCALL |gp2| (QREFELT $ 122)) (QREFELT $ 145))
            (QREFELT $ 154)))
          'NIL)
         ((NULL (|PERMGRP;subgroup| |gp1| |gp2| $)) 'NIL)
         ('T
          (COND
           ((EQL (SPADCALL |gp1| (QREFELT $ 126))
                 (SPADCALL |gp2| (QREFELT $ 126)))
            'NIL)
           ('T 'T))))) 

(SDEFUN |PERMGRP;<=;2$B;45| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (COND
         ((NULL
           (SPADCALL
            (SPADCALL (SPADCALL |gp1| (QREFELT $ 122))
                      (SPADCALL |gp2| (QREFELT $ 122)) (QREFELT $ 145))
            (QREFELT $ 154)))
          'NIL)
         ('T (|PERMGRP;subgroup| |gp1| |gp2| $)))) 

(SDEFUN |PERMGRP;=;2$B;46| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (SPROG ((#1=#:G492 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |gp1| (QREFELT $ 122))
                             (SPADCALL |gp2| (QREFELT $ 122)) (QREFELT $ 157))
                   'NIL)
                  (#2='T
                   (SEQ
                    (COND
                     ((SPADCALL (LENGTH (QCAR |gp1|)) (LENGTH (QCAR |gp2|))
                                (QREFELT $ 64))
                      (COND
                       ((NULL (|PERMGRP;subgroup| |gp1| |gp2| $))
                        (EXIT
                         (PROGN
                          (LETT #1# 'NIL . #3=(|PERMGRP;=;2$B;46|))
                          (GO #1#))))))
                     ((NULL (|PERMGRP;subgroup| |gp2| |gp1| $))
                      (EXIT (PROGN (LETT #1# 'NIL . #3#) (GO #1#)))))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |gp1| (QREFELT $ 126))
                            (SPADCALL |gp2| (QREFELT $ 126)))
                       'T)
                      (#2# 'NIL)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |PERMGRP;orbit;$SS;47|
        ((|gp| $) (|startSet| |Set| S) ($ |Set| (|Set| S)))
        (SPROG
         ((|newSet| (|Set| S)) (#1=#:G497 NIL) (|i| NIL)
          (|outSet| (|Set| (|Set| S))) (|outList| (|List| (|List| S)))
          (|startList| (|List| S)))
         (SEQ
          (LETT |startList| (SPADCALL |startSet| (QREFELT $ 57))
                . #2=(|PERMGRP;orbit;$SS;47|))
          (LETT |outList| (|PERMGRP;orbitInternal| |gp| |startList| $) . #2#)
          (LETT |outSet| (SPADCALL (QREFELT $ 159)) . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (LENGTH |outList|) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |newSet|
                      (SPADCALL (SPADCALL |outList| |i| (QREFELT $ 40))
                                (QREFELT $ 121))
                      . #2#)
                (EXIT (SPADCALL |newSet| |outSet| (QREFELT $ 160))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |outSet|)))) 

(SDEFUN |PERMGRP;orbit;$LS;48|
        ((|gp| $) (|startList| |List| S) ($ |Set| (|List| S)))
        (SPADCALL (|PERMGRP;orbitInternal| |gp| |startList| $) (QREFELT $ 163))) 

(SDEFUN |PERMGRP;initializeGroupForWordProblem;$2IV;49|
        ((|gp| $) (|maxLoops| |Integer|) (|diff| |Integer|) ($ |Void|))
        (SEQ (|PERMGRP;bsgs| |gp| 'T |maxLoops| |diff| $)
             (EXIT (SPADCALL (QREFELT $ 108))))) 

(SDEFUN |PERMGRP;initializeGroupForWordProblem;$V;50| ((|gp| $) ($ |Void|))
        (SPADCALL |gp| 0 1 (QREFELT $ 165))) 

(DECLAIM (NOTINLINE |PermutationGroup;|)) 

(DEFUN |PermutationGroup| (#1=#:G502)
  (SPROG NIL
         (PROG (#2=#:G503)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PermutationGroup|)
                                               '|domainEqualList|)
                    . #3=(|PermutationGroup|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|PermutationGroup;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PermutationGroup|)))))))))) 

(DEFUN |PermutationGroup;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PermutationGroup|))
          (LETT |dv$| (LIST '|PermutationGroup| DV$1) . #1#)
          (LETT $ (GETREFV 169) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              |PERMGRP;coerce;$L;25| (|NonNegativeInteger|) (|Permutation| 6)
              (0 . |order|) (|List| 10) (5 . |copy|) (|Integer|)
              (10 . |maxIndex|) (15 . |elt|) (|Boolean|) (21 . |member?|)
              (27 . |position|) (33 . |delete|) (39 . |#|) (44 . |One|)
              (48 . ~=) (54 . |rest|) (|Vector| 10) (60 . |#|) (65 . |new|)
              (|Vector| 26) (71 . |elt|) (|Vector| 13) (77 . |elt|) (|List| 26)
              (83 . |vector|) (|List| 13) (88 . |vector|) (93 . |qelt|)
              (|List| 6) (|List| 38) (99 . |elt|) (105 . |elt|) (111 . |eval|)
              (117 . |member?|) (123 . |elt|) (129 . |elt|) (135 . >)
              (|Record| (|:| |preimage| 38) (|:| |image| 38))
              (141 . |listRepresentation|) (146 . |sort|) (151 . |merge|)
              (157 . =) (163 . |pointList|) (|Set| 6) (168 . |brace|)
              (172 . |movedPoints|) (177 . |union|) (183 . |parts|) (188 . <=)
              (|Record| (|:| |preimage| 10) (|:| |image| 6))
              (|Mapping| 18 59 59) (|List| 59) (194 . |sort|) (200 . |first|)
              (205 . <=) (|Mapping| 18 13 13) (211 . |sort|) (217 . |second|)
              (222 . |setelt|) (229 . |perm_to_vec|) (236 . |position|)
              (|Vector| 15) (242 . |setelt|) (249 . |elt|) (255 . |member?|)
              (|List| 33) (|Reference| 75) (261 . |setref|) (|List| 35)
              (|Reference| 78) (267 . |setref|) (273 . |deref|) (278 . |deref|)
              (283 . |elt|) (|Mapping| 26 26) (289 . |map|)
              (|Record| (|:| |orb| 13) (|:| |svc| 71)) (|Vector| 86)
              (295 . |setelt|) (302 . |setelt|) (309 . >) (315 . |position|)
              (321 . |delete|) (327 . |elt|) (333 . |delete|) (339 . |setelt|)
              (346 . |ref|) (351 . |ref|) (356 . |list|) (361 . |elt|)
              (367 . |copy|) (372 . |list|) (377 . |list|) (|Set| 11)
              (382 . |brace|) (386 . |degree|) (391 . |insert!|) (|Void|)
              (397 . |void|) (401 . |difference|) (407 . |empty?|)
              (412 . |parts|) |PERMGRP;member?;P$B;41| (417 . |member?|)
              (423 . |member?|) (429 . |setelt|) |PERMGRP;generators;$L;26|
              (436 . |coerceListOfPairs|) |PERMGRP;strongGenerators;$L;27|
              (441 . |elt|) |PERMGRP;elt;$NniP;28| (447 . |brace|)
              |PERMGRP;movedPoints;$S;29| (452 . *) |PERMGRP;random;$IP;30|
              |PERMGRP;random;$P;31| |PERMGRP;order;$Nni;32|
              |PERMGRP;degree;$Nni;33| |PERMGRP;base;$L;34|
              |PERMGRP;wordsForStrongGenerators;$L;35| |PERMGRP;coerce;L$;36|
              |PERMGRP;permutationGroup;L$;37| (458 . |maxIndex|)
              (|OutputForm|) (463 . |coerce|) (|Symbol|) (468 . |outputForm|)
              (|List| $) (473 . |commaSeparate|) (478 . |postfix|)
              |PERMGRP;coerce;$Of;38| (484 . |insert!|) |PERMGRP;orbit;$SS;39|
              (490 . |cardinality|) (495 . |extract!|) (500 . |difference|)
              (|List| 53) (|Set| 53) (506 . |brace|) |PERMGRP;orbits;$S;40|
              (511 . |inv|) |PERMGRP;wordInStrongGenerators;P$L;42|
              |PERMGRP;initializeGroupForWordProblem;$V;50|
              |PERMGRP;wordInGenerators;P$L;43| (516 . |empty?|)
              |PERMGRP;<;2$B;44| |PERMGRP;<=;2$B;45| (521 . ~=)
              |PERMGRP;=;2$B;46| (527 . |brace|) (531 . |insert!|)
              |PERMGRP;orbit;$SS;47| (|Set| 38) (537 . |brace|)
              |PERMGRP;orbit;$LS;48|
              |PERMGRP;initializeGroupForWordProblem;$2IV;49| (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 542 |wordsForStrongGenerators| 548 |wordInStrongGenerators|
              553 |wordInGenerators| 559 |strongGenerators| 565 |random| 570
              |pointList| 581 |permutationGroup| 586 |perm_to_vec| 591 |order|
              598 |orbits| 603 |orbit| 608 |movedPoints| 626 |member?| 631
              |latex| 637 |initializeGroupForWordProblem| 642 |hashUpdate!| 654
              |hash| 660 |generators| 665 |elt| 670 |degree| 676 |coerce| 681
              |base| 696 = 701 <= 707 < 713)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 133))
                        (|makeByteWordVec2| 168
                                            '(1 11 10 0 12 1 13 0 0 14 1 13 15
                                              0 16 2 13 10 0 15 17 2 13 18 10 0
                                              19 2 13 15 10 0 20 2 13 0 0 15 21
                                              1 13 10 0 22 0 11 0 23 2 10 18 0
                                              0 24 2 13 0 0 10 25 1 26 10 0 27
                                              2 26 0 10 10 28 2 29 26 0 15 30 2
                                              31 13 0 15 32 1 29 0 33 34 1 31 0
                                              35 36 2 13 10 0 15 37 2 39 38 0
                                              15 40 2 38 6 0 15 41 2 11 6 0 6
                                              42 2 39 18 38 0 43 2 33 26 0 15
                                              44 2 35 13 0 15 45 2 15 18 0 0 46
                                              1 11 47 0 48 1 38 0 0 49 2 38 0 0
                                              0 50 2 6 18 0 0 51 1 0 38 0 52 0
                                              53 0 54 1 11 53 0 55 2 53 0 0 0
                                              56 1 53 38 0 57 2 6 18 0 0 58 2
                                              61 0 60 0 62 1 13 10 0 63 2 10 18
                                              0 0 64 2 35 0 65 0 66 1 13 10 0
                                              67 3 26 10 0 15 10 68 3 0 26 38
                                              11 10 69 2 38 15 6 0 70 3 71 15 0
                                              15 15 72 2 26 10 0 15 73 2 33 18
                                              26 0 74 2 76 75 0 75 77 2 79 78 0
                                              78 80 1 76 75 0 81 1 79 78 0 82 2
                                              75 33 0 15 83 2 33 0 84 0 85 3 87
                                              86 0 15 86 88 3 75 33 0 15 33 89
                                              2 10 18 0 0 90 2 33 15 26 0 91 2
                                              33 0 0 15 92 2 78 35 0 15 93 2 35
                                              0 0 15 94 3 78 35 0 15 35 95 1 76
                                              0 75 96 1 79 0 78 97 1 13 0 10 98
                                              2 87 86 0 15 99 1 26 0 0 100 1 33
                                              0 26 101 1 35 0 13 102 0 103 0
                                              104 1 11 10 0 105 2 103 0 11 0
                                              106 0 107 0 108 2 103 0 0 0 109 1
                                              103 18 0 110 1 103 8 0 111 2 38
                                              18 6 0 113 2 8 18 11 0 114 3 31
                                              13 0 15 13 115 1 11 0 39 117 2 8
                                              11 0 15 119 1 53 0 38 121 2 11 0
                                              0 0 123 1 8 15 0 132 1 11 133 0
                                              134 1 133 0 135 136 1 133 0 137
                                              138 2 133 0 0 0 139 2 53 0 6 0
                                              141 1 53 10 0 143 1 53 6 0 144 2
                                              53 0 0 0 145 1 147 0 146 148 1 11
                                              0 0 150 1 53 18 0 154 2 53 18 0 0
                                              157 0 147 0 159 2 147 0 53 0 160
                                              1 162 0 39 163 2 0 18 0 0 1 1 0
                                              35 0 129 2 0 13 11 0 151 2 0 13
                                              11 0 153 1 0 8 0 118 1 0 11 0 125
                                              2 0 11 0 15 124 1 0 38 0 52 1 0 0
                                              8 131 3 0 26 38 11 10 69 1 0 10 0
                                              126 1 0 147 0 149 2 0 147 0 53
                                              161 2 0 162 0 38 164 2 0 53 0 6
                                              142 1 0 53 0 122 2 0 18 11 0 112
                                              1 0 167 0 1 1 0 107 0 152 3 0 107
                                              0 15 15 165 2 0 166 166 0 1 1 0
                                              168 0 1 1 0 8 0 116 2 0 11 0 10
                                              120 1 0 10 0 127 1 0 0 8 130 1 0
                                              8 0 9 1 0 133 0 140 1 0 38 0 128
                                              2 0 18 0 0 158 2 0 18 0 0 156 2 0
                                              18 0 0 155)))))
           '|lookupComplete|)) 
