
(DEFUN |PERMGRP;shortenWord| (|lw| |gp| $)
  (PROG (|do_res| |flag1| |newlw| #1=#:G161 |anzahl| |flag2| |res| |test|
         #2=#:G173 |el| |pos| #3=#:G172 |i| |orderList| #4=#:G171 |gen|
         #5=#:G170 |gpgens|)
    (RETURN
     (SEQ
      (LETT |gpgens| (SPADCALL |gp| (QREFELT $ 9))
            . #6=(|PERMGRP;shortenWord|))
      (LETT |orderList|
            (PROGN
             (LETT #5# NIL . #6#)
             (SEQ (LETT |gen| NIL . #6#) (LETT #4# |gpgens| . #6#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |gen| (CAR #4#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #5# (CONS (SPADCALL |gen| (QREFELT $ 12)) #5#)
                          . #6#)))
                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (LETT |newlw| (SPADCALL |lw| (QREFELT $ 14)) . #6#)
      (SEQ (LETT |i| 1 . #6#)
           (LETT #3# (SPADCALL |orderList| (QREFELT $ 16)) . #6#) G190
           (COND ((|greater_SI| |i| #3#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((EQL (SPADCALL |orderList| |i| (QREFELT $ 17)) 1)
               (SEQ G190
                    (COND
                     ((NULL (SPADCALL |i| |newlw| (QREFELT $ 19))) (GO G191)))
                    (SEQ
                     (LETT |pos| (SPADCALL |i| |newlw| (QREFELT $ 20)) . #6#)
                     (EXIT
                      (LETT |newlw| (SPADCALL |newlw| |pos| (QREFELT $ 21))
                            . #6#)))
                    NIL (GO G190) G191 (EXIT NIL))))))
           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND ((< (SPADCALL |newlw| (QREFELT $ 22)) 2) |newlw|)
             ('T
              (SEQ (LETT |test| (|SPADfirst| |newlw|) . #6#)
                   (LETT |anzahl| 0 . #6#) (LETT |flag1| 'T . #6#)
                   (LETT |do_res| 'NIL . #6#)
                   (SEQ G190 (COND ((NULL |flag1|) (GO G191)))
                        (SEQ (LETT |test| (|SPADfirst| |newlw|) . #6#)
                             (LETT |anzahl| 1 . #6#)
                             (COND (|do_res| (LETT |res| (LIST |test|) . #6#)))
                             (LETT |flag2| 'T . #6#)
                             (SEQ (LETT |el| NIL . #6#)
                                  (LETT #2# |newlw| . #6#) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |el| (CAR #2#) . #6#) NIL)
                                        (NULL |flag2|))
                                    (GO G191)))
                                  (SEQ
                                   (COND
                                    (|do_res|
                                     (LETT |res| (CONS |el| |res|) . #6#)))
                                   (LETT |anzahl| (+ |anzahl| 1) . #6#)
                                   (EXIT
                                    (COND
                                     ((EQL |anzahl| 1)
                                      (LETT |test| |el| . #6#))
                                     ((SPADCALL |test| |el| (QREFELT $ 24))
                                      (SEQ (LETT |test| |el| . #6#)
                                           (EXIT (LETT |anzahl| 1 . #6#))))
                                     ('T
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((EQL |anzahl|
                                               (SPADCALL |orderList| |test|
                                                         (QREFELT $ 17)))
                                          (PROGN
                                           (LETT #1#
                                                 (SEQ
                                                  (COND
                                                   (|do_res|
                                                    (LETT |res|
                                                          (SPADCALL |res|
                                                                    |anzahl|
                                                                    (QREFELT $
                                                                             25))
                                                          . #6#))
                                                   ('T
                                                    (LETT |flag2| 'NIL . #6#)))
                                                  (EXIT
                                                   (LETT |anzahl| 0 . #6#)))
                                                 . #6#)
                                           (GO #1#)))))
                                       #1# (EXIT #1#))))))
                                  (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                  (EXIT NIL))
                             (COND
                              (|do_res| (LETT |newlw| (NREVERSE |res|) . #6#)))
                             (LETT |flag1| |do_res| . #6#)
                             (EXIT
                              (LETT |do_res| (COND (|flag2| 'NIL) ('T 'T))
                                    . #6#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |newlw|))))))))) 

(DEFUN |PERMGRP;times!| (|res| |p| |q| $)
  (PROG (|i| |degree|)
    (RETURN
     (SEQ (LETT |degree| (SPADCALL |p| (QREFELT $ 27)) . #1=(|PERMGRP;times!|))
          (EXIT
           (SEQ (LETT |i| 1 . #1#) G190
                (COND ((|greater_SI| |i| |degree|) (GO G191)))
                (SEQ
                 (EXIT
                  (QSETAREF1O |res| |i| (QAREF1O |p| (QAREF1O |q| |i| 1) 1)
                              1)))
                (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |PERMGRP;times| (|p| |q| $)
  (PROG (|res| |degree|)
    (RETURN
     (SEQ (LETT |degree| (SPADCALL |p| (QREFELT $ 27)) . #1=(|PERMGRP;times|))
          (LETT |res| (SPADCALL |degree| 0 (QREFELT $ 28)) . #1#)
          (|PERMGRP;times!| |res| |p| |q| $) (EXIT |res|))))) 

(DEFUN |PERMGRP;inv| (|p| $)
  (PROG (|i| |q| |degree|)
    (RETURN
     (SEQ (LETT |degree| (SPADCALL |p| (QREFELT $ 27)) . #1=(|PERMGRP;inv|))
          (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |degree|) (GO G191)))
               (SEQ (EXIT (QSETAREF1O |q| (QAREF1O |p| |i| 1) |i| 1)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |q|))))) 

(DEFUN |PERMGRP;testIdentity| (|p| $)
  (PROG (#1=#:G184 #2=#:G186 |i| |degree|)
    (RETURN
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
      #2# (EXIT #2#))))) 

(DEFUN |PERMGRP;cosetRep1| (|ppt| |do_words| |o| |grpv| |wordv| $)
  (PROG (#1=#:G196 |p| |word| |xelt| |tmpv| |#G25| |#G24| |x| |osvc| |oorb|
         #2=#:G197 |n| #3=#:G198 |degree|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((EQL (QVSIZE |grpv|) 0) (|error| "cosetRep needs nonempty group"))
        (#4='T
         (SEQ
          (LETT |degree|
                (SPADCALL (SPADCALL |grpv| 1 (QREFELT $ 30)) (QREFELT $ 27))
                . #5=(|PERMGRP;cosetRep1|))
          (LETT |xelt|
                (PROGN
                 (LETT #3# (GETREFV |degree|) . #5#)
                 (SEQ (LETT |n| 1 . #5#) (LETT #2# 0 . #5#) G190
                      (COND ((|greater_SI| |n| |degree|) (GO G191)))
                      (SEQ (EXIT (SETELT #3# #2# |n|)))
                      (LETT #2#
                            (PROG1 (|inc_SI| #2#)
                              (LETT |n| (|inc_SI| |n|) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)
                . #5#)
          (LETT |word| NIL . #5#) (LETT |oorb| (QCAR |o|) . #5#)
          (LETT |osvc| (QCDR |o|) . #5#)
          (LETT |p| (QAREF1O |osvc| |ppt| 1) . #5#)
          (EXIT
           (COND
            ((< |p| 0) (PROGN (LETT #1# (CONS |xelt| |word|) . #5#) (GO #1#)))
            (#4#
             (SEQ (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #5#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ (LETT |x| (QAREF1O |grpv| |p| 1) . #5#)
                             (|PERMGRP;times!| |tmpv| |x| |xelt| $)
                             (PROGN
                              (LETT |#G24| |xelt| . #5#)
                              (LETT |#G25| |tmpv| . #5#)
                              (LETT |tmpv| |#G24| . #5#)
                              (LETT |xelt| |#G25| . #5#))
                             (COND
                              (|do_words|
                               (LETT |word|
                                     (APPEND
                                      (SPADCALL |wordv| |p| (QREFELT $ 32))
                                      |word|)
                                     . #5#)))
                             (LETT |ppt| (QAREF1O |x| |ppt| 1) . #5#)
                             (LETT |p| (QAREF1O |osvc| |ppt| 1) . #5#)
                             (EXIT
                              (COND
                               ((< |p| 0)
                                (PROGN
                                 (LETT #1# (CONS |xelt| |word|) . #5#)
                                 (GO #1#))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PERMGRP;strip1| (|element| |orbit| |group| |words| $)
  (PROG (|cr| |point| |wordv| |do_words| |grpv|)
    (RETURN
     (SEQ
      (LETT |grpv| (SPADCALL |group| (QREFELT $ 34)) . #1=(|PERMGRP;strip1|))
      (LETT |wordv| (MAKE-ARRAY 0) . #1#)
      (LETT |do_words| (COND ((NULL |words|) 'NIL) ('T 'T)) . #1#)
      (COND
       (|do_words| (LETT |wordv| (SPADCALL |words| (QREFELT $ 36)) . #1#)))
      (LETT |point|
            (QAREF1O |element| (SPADCALL (QCAR |orbit|) 1 (QREFELT $ 37)) 1)
            . #1#)
      (LETT |cr|
            (|PERMGRP;cosetRep1| |point| |do_words| |orbit| |grpv| |wordv| $)
            . #1#)
      (EXIT
       (CONS (|PERMGRP;times| (QCAR |cr|) |element| $)
             (REVERSE (QCDR |cr|)))))))) 

(DEFUN |PERMGRP;strip| (|z| |i| |do_words| |orbs| |grpv| |wordv| $)
  (PROG (|word| |tmpv| |#G38| |#G37| |ee| |noresult| #1=#:G208 |entry| |p| |s|
         |orbj| |j| |degree|)
    (RETURN
     (SEQ (LETT |degree| (SPADCALL |z| (QREFELT $ 27)) . #2=(|PERMGRP;strip|))
          (LETT |word| NIL . #2#)
          (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #2#)
          (LETT |noresult| 'T . #2#)
          (SEQ (LETT |j| |i| . #2#) G190
               (COND ((OR (< |j| 1) (NULL |noresult|)) (GO G191)))
               (SEQ (LETT |orbj| (QAREF1O |orbs| |j| 1) . #2#)
                    (LETT |s| (QCDR |orbj|) . #2#)
                    (LETT |p| (|SPADfirst| (QCAR |orbj|)) . #2#)
                    (EXIT
                     (SEQ
                      (EXIT
                       (SEQ G190 (COND ((NULL |noresult|) (GO G191)))
                            (SEQ
                             (LETT |entry| (QAREF1O |s| (QAREF1O |z| |p| 1) 1)
                                   . #2#)
                             (EXIT
                              (COND
                               ((< |entry| 0)
                                (SEQ
                                 (COND
                                  ((EQL |entry| -1)
                                   (PROGN
                                    (LETT #1# |$NoValue| . #2#)
                                    (GO #1#))))
                                 (EXIT (LETT |noresult| 'NIL . #2#))))
                               ('T
                                (SEQ
                                 (LETT |ee| (QAREF1O |grpv| |entry| 1) . #2#)
                                 (|PERMGRP;times!| |tmpv| |ee| |z| $)
                                 (PROGN
                                  (LETT |#G37| |tmpv| . #2#)
                                  (LETT |#G38| |z| . #2#)
                                  (LETT |z| |#G37| . #2#)
                                  (LETT |tmpv| |#G38| . #2#))
                                 (EXIT
                                  (COND
                                   (|do_words|
                                    (LETT |word|
                                          (APPEND
                                           (SPADCALL |wordv| |entry|
                                                     (QREFELT $ 32))
                                           |word|)
                                          . #2#)))))))))
                            NIL (GO G190) G191 (EXIT NIL)))
                      #1# (EXIT #1#))))
               (LETT |j| (+ |j| -1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |z| |word|)))))) 

(DEFUN |PERMGRP;orbitInternal| (|gp| |startList| $)
  (PROG (|pos| |orbitList| |newList| |j| |workList| #1=#:G222 |gen| |gpset|)
    (RETURN
     (SEQ (LETT |orbitList| (LIST |startList|) . #2=(|PERMGRP;orbitInternal|))
          (LETT |pos| 1 . #2#)
          (SEQ G190
               (COND ((NULL (COND ((ZEROP |pos|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |gpset| (QCAR |gp|) . #2#)
                    (SEQ (LETT |gen| NIL . #2#) (LETT #1# |gpset| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |gen| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ (LETT |newList| NIL . #2#)
                              (LETT |workList|
                                    (SPADCALL |orbitList| |pos| (QREFELT $ 40))
                                    . #2#)
                              (SEQ (LETT |j| (LENGTH |workList|) . #2#) G190
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
                                           . #2#)))
                                   (LETT |j| (+ |j| -1) . #2#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL |newList| |orbitList|
                                            (QREFELT $ 43)))
                                 (SEQ
                                  (LETT |orbitList|
                                        (CONS |newList| |orbitList|) . #2#)
                                  (EXIT (LETT |pos| (+ |pos| 1) . #2#)))))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |pos| (- |pos| 1) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (REVERSE |orbitList|)))))) 

(DEFUN |PERMGRP;ranelt| (|group| |word| |maxLoops| $)
  (PROG (|numberOfLoops| |words| #1=#:G227 |randomElement| |randomInteger|
         #2=#:G225 |do_words| |numberOfGenerators|)
    (RETURN
     (SEQ (LETT |numberOfGenerators| (LENGTH |group|) . #3=(|PERMGRP;ranelt|))
          (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|)) . #3#)
          (LETT |randomElement|
                (SPADCALL |group| |randomInteger| (QREFELT $ 44)) . #3#)
          (LETT |words| NIL . #3#)
          (LETT |do_words| (COND ((NULL |word|) 'NIL) (#4='T 'T)) . #3#)
          (COND
           (|do_words|
            (LETT |words|
                  (SPADCALL |word|
                            (PROG1 (LETT #2# |randomInteger| . #3#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#))
                            (QREFELT $ 45))
                  . #3#)))
          (COND
           ((SPADCALL |maxLoops| 0 (QREFELT $ 46))
            (LETT |numberOfLoops| (+ 1 (RANDOM |maxLoops|)) . #3#))
           (#4# (LETT |numberOfLoops| |maxLoops| . #3#)))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |numberOfLoops| 0 (QREFELT $ 46))) (GO G191)))
               (SEQ
                (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|))
                      . #3#)
                (LETT |randomElement|
                      (|PERMGRP;times|
                       (SPADCALL |group| |randomInteger| (QREFELT $ 44))
                       |randomElement| $)
                      . #3#)
                (COND
                 (|do_words|
                  (LETT |words|
                        (APPEND
                         (SPADCALL |word|
                                   (PROG1 (LETT #1# |randomInteger| . #3#)
                                     (|check_subtype| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      #1#))
                                   (QREFELT $ 45))
                         |words|)
                        . #3#)))
                (EXIT (LETT |numberOfLoops| (- |numberOfLoops| 1) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |randomElement| |words|)))))) 

(DEFUN |PERMGRP;pointList;$L;11| (|group| $)
  (PROG (|res| |p0| #1=#:G242 |p| |support| #2=#:G241 |perm|)
    (RETURN
     (SEQ
      (COND ((NULL (NULL (QVELT (QCDR |group|) 4))) (QVELT (QCDR |group|) 4))
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
                                          (NREVERSE |res|)))))))))))))) 

(DEFUN |PERMGRP;pointList;$L;12| (|group| $)
  (PROG (|support| #1=#:G248 |perm|)
    (RETURN
     (SEQ
      (COND ((NULL (NULL (QVELT (QCDR |group|) 4))) (QVELT (QCDR |group|) 4))
            ('T
             (SEQ
              (LETT |support| (SPADCALL (QREFELT $ 54))
                    . #2=(|PERMGRP;pointList;$L;12|))
              (SEQ (LETT |perm| NIL . #2#) (LETT #1# (QCAR |group|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |perm| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |support|
                           (SPADCALL |support| (SPADCALL |perm| (QREFELT $ 55))
                                     (QREFELT $ 56))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (QSETVELT (QCDR |group|) 4
                         (SPADCALL |support| (QREFELT $ 57))))))))))) 

(DEFUN |PERMGRP;ls_to_lnni| (|ls| |supp| $)
  (PROG (#1=#:G266 |pp| #2=#:G265 |rp2| |ls2| |p1| |pel| |flag| #3=#:G264 |p2|
         |i| #4=#:G263 |p| #5=#:G262)
    (RETURN
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
                           (EXIT (LETT #5# (CONS (CONS |i| |p|) #5#) . #6#)))
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
                        (LETT |rp2| (CONS (LIST (QCAR |pel|) |i|) |rp2|) . #6#)
                        (EXIT
                         (COND ((NULL |ls2|) (LETT |flag| 'NIL . #6#))
                               ('T
                                (SEQ (LETT |pel| (|SPADfirst| |ls2|) . #6#)
                                     (LETT |p1| (QCDR |pel|) . #6#)
                                     (EXIT
                                      (LETT |ls2| (CDR |ls2|) . #6#)))))))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|) . #6#))
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
                      ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |pp| (QREFELT $ 67)) #2#)
                             . #6#)))
                     (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |PERMGRP;ls_to_lnni!1| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 63)) (SPADCALL |y| (QREFELT $ 63))
            (QREFELT $ 64))) 

(DEFUN |PERMGRP;ls_to_lnni!0| (|x| |y| $)
  (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 58))) 

(DEFUN |PERMGRP;perm_to_vec;LPNniV;14| (|supp| |p| |degree| $)
  (PROG (#1=#:G273 |pp| #2=#:G274 |ip| |il| |pl| |i| |q| |pr|)
    (RETURN
     (SEQ
      (LETT |pr| (SPADCALL |p| (QREFELT $ 48))
            . #3=(|PERMGRP;perm_to_vec;LPNniV;14|))
      (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28)) . #3#)
      (SEQ (LETT |i| 1 . #3#) G190
           (COND ((|greater_SI| |i| |degree|) (GO G191)))
           (SEQ (EXIT (SPADCALL |q| |i| |i| (QREFELT $ 68))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |pl| (|PERMGRP;ls_to_lnni| (QCAR |pr|) |supp| $) . #3#)
      (LETT |il| (|PERMGRP;ls_to_lnni| (QCDR |pr|) |supp| $) . #3#)
      (SEQ (LETT |ip| NIL . #3#) (LETT #2# |il| . #3#) (LETT |pp| NIL . #3#)
           (LETT #1# |pl| . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#) . #3#) NIL) (ATOM #2#)
                 (PROGN (LETT |ip| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (EXIT (SPADCALL |q| |pp| |ip| (QREFELT $ 68))))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |q|))))) 

(DEFUN |PERMGRP;perm_to_vec;LPNniV;15| (|supp| |p| |degree| $)
  (PROG (|pos2| |newEl| |i| |q|)
    (RETURN
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
      (EXIT |q|))))) 

(DEFUN |PERMGRP;orbitWithSvc1| (|group| |grpinv| |point| $)
  (PROG (|position| |orbit_size| |orbit| |newPoint| #1=#:G290 |i| #2=#:G291
         |grv| |schreierVector| |orbitv| |degree|)
    (RETURN
     (SEQ
      (LETT |degree| (SPADCALL (|SPADfirst| |group|) (QREFELT $ 27))
            . #3=(|PERMGRP;orbitWithSvc1|))
      (LETT |orbit| (LIST |point|) . #3#)
      (LETT |orbitv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #3#)
      (SPADCALL |orbitv| 1 |point| (QREFELT $ 68)) (LETT |orbit_size| 1 . #3#)
      (LETT |schreierVector| (MAKEARR1 |degree| -2) . #3#)
      (SPADCALL |schreierVector| |point| -1 (QREFELT $ 72))
      (LETT |position| 1 . #3#)
      (SEQ G190
           (COND ((NULL (COND ((ZEROP |position|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (SEQ (LETT |grv| NIL . #3#) (LETT #2# |grpinv| . #3#)
                 (LETT |i| 1 . #3#) (LETT #1# (LENGTH |grpinv|) . #3#) G190
                 (COND
                  ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                       (PROGN (LETT |grv| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |newPoint|
                        (QAREF1O |orbitv| (+ (- |orbit_size| |position|) 1) 1)
                        . #3#)
                  (LETT |newPoint| (QAREF1O |grv| |newPoint| 1) . #3#)
                  (EXIT
                   (COND
                    ((EQL (QAREF1O |schreierVector| |newPoint| 1) -2)
                     (SEQ (LETT |orbit| (CONS |newPoint| |orbit|) . #3#)
                          (LETT |orbit_size| (+ |orbit_size| 1) . #3#)
                          (SPADCALL |orbitv| |orbit_size| |newPoint|
                                    (QREFELT $ 68))
                          (LETT |position| (+ |position| 1) . #3#)
                          (EXIT
                           (SPADCALL |schreierVector| |newPoint| |i|
                                     (QREFELT $ 72))))))))
                 (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                       . #3#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (LETT |position| (- |position| 1) . #3#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT (CONS (NREVERSE |orbit|) |schreierVector|)))))) 

(DEFUN |PERMGRP;orbitWithSvc| (|group| |point| $)
  (PROG (|grpinv| #1=#:G295 |el|)
    (RETURN
     (SEQ (LETT |grpinv| NIL . #2=(|PERMGRP;orbitWithSvc|))
          (SEQ (LETT |el| NIL . #2#) (LETT #1# |group| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |grpinv| (CONS (|PERMGRP;inv| |el| $) |grpinv|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |grpinv| (REVERSE |grpinv|) . #2#)
          (EXIT (|PERMGRP;orbitWithSvc1| |group| |grpinv| |point| $)))))) 

(DEFUN |PERMGRP;bsgs1|
       (|group| |number1| |words| |maxLoops| |gp| |diff| |out| |outword| $)
  (PROG (|sizeOfGroup| |k2| #1=#:G316 |j| |words3| |help| |group2| |el2| |str|
         |ran| |words2| |gpsgs| |k| #2=#:G302 |jj| |gplength| #3=#:G299 |k1|
         |ort| |i| |wordProblem| |gp_info| |degree|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |degree| (SPADCALL (|SPADfirst| |group|) (QREFELT $ 27))
              . #4=(|PERMGRP;bsgs1|))
        (LETT |gp_info| (QCDR |gp|) . #4#)
        (LETT |wordProblem| (COND ((NULL |words|) 'NIL) ('T 'T)) . #4#)
        (SEQ
         (EXIT
          (SEQ (LETT |i| |number1| . #4#) G190
               (COND ((> |i| |degree|) (GO G191)))
               (SEQ (LETT |ort| (|PERMGRP;orbitWithSvc| |group| |i| $) . #4#)
                    (LETT |k| (QCAR |ort|) . #4#)
                    (LETT |k1| (SPADCALL |k| (QREFELT $ 22)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |k1| 1 (QREFELT $ 24))
                       (PROGN (LETT #3# |$NoValue| . #4#) (GO #3#))))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #3# (EXIT #3#))
        (LETT |gpsgs| NIL . #4#) (LETT |words2| NIL . #4#)
        (LETT |gplength| (LENGTH |group|) . #4#)
        (SEQ
         (EXIT
          (SEQ (LETT |jj| 1 . #4#) G190
               (COND ((|greater_SI| |jj| |gplength|) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL (SPADCALL |group| |jj| (QREFELT $ 44)) |i|
                              (QREFELT $ 73))
                    |i| (QREFELT $ 24))
                   (PROGN (LETT #2# |$NoValue| . #4#) (GO #2#))))))
               (LETT |jj| (|inc_SI| |jj|) . #4#) (GO G190) G191 (EXIT NIL)))
         #2# (EXIT #2#))
        (SEQ (LETT |k| 1 . #4#) G190
             (COND ((|greater_SI| |k| |gplength|) (GO G191)))
             (SEQ (LETT |el2| (SPADCALL |group| |k| (QREFELT $ 44)) . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |el2| |i| (QREFELT $ 73)) |i|
                               (QREFELT $ 24))
                     (SEQ (LETT |gpsgs| (CONS |el2| |gpsgs|) . #4#)
                          (EXIT
                           (COND
                            (|wordProblem|
                             (LETT |words2|
                                   (CONS (SPADCALL |words| |k| (QREFELT $ 45))
                                         |words2|)
                                   . #4#))))))
                    ('T
                     (SEQ
                      (LETT |gpsgs|
                            (CONS
                             (|PERMGRP;times|
                              (SPADCALL |group| |jj| (QREFELT $ 44)) |el2| $)
                             |gpsgs|)
                            . #4#)
                      (EXIT
                       (COND
                        (|wordProblem|
                         (LETT |words2|
                               (CONS
                                (APPEND (SPADCALL |words| |jj| (QREFELT $ 45))
                                        (SPADCALL |words| |k| (QREFELT $ 45)))
                                |words2|)
                               . #4#)))))))))
             (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
        (LETT |group2| NIL . #4#) (LETT |words3| NIL . #4#) (LETT |j| 15 . #4#)
        (SEQ G190 (COND ((NULL (SPADCALL |j| 0 (QREFELT $ 46))) (GO G191)))
             (SEQ
              (LETT |ran| (|PERMGRP;ranelt| |group| |words| |maxLoops| $)
                    . #4#)
              (LETT |str|
                    (|PERMGRP;strip1| (QCAR |ran|) |ort| |group| |words| $)
                    . #4#)
              (LETT |el2| (QCAR |str|) . #4#)
              (COND
               ((NULL (|PERMGRP;testIdentity| |el2| $))
                (COND
                 ((NULL (SPADCALL |el2| |group2| (QREFELT $ 74)))
                  (SEQ (LETT |group2| (CONS |el2| |group2|) . #4#)
                       (COND
                        (|wordProblem|
                         (SEQ
                          (LETT |help|
                                (APPEND (REVERSE (QCDR |str|)) (QCDR |ran|))
                                . #4#)
                          (LETT |help| (|PERMGRP;shortenWord| |help| |gp| $)
                                . #4#)
                          (EXIT
                           (LETT |words3| (CONS |help| |words3|) . #4#)))))
                       (EXIT (LETT |j| (- |j| 2) . #4#)))))))
              (EXIT (LETT |j| (- |j| 1) . #4#)))
             NIL (GO G190) G191 (EXIT NIL))
        (COND (|wordProblem| (LETT |maxLoops| (- |maxLoops| |diff|) . #4#)))
        (COND
         ((OR (NULL |group2|) (< |maxLoops| 0))
          (SEQ (QSETVELT |gp_info| 2 (LIST |i|))
               (SPADCALL |out| (LIST |gpsgs|) (QREFELT $ 77))
               (SPADCALL |outword| (LIST |words2|) (QREFELT $ 80))
               (EXIT (PROGN (LETT #1# |k1| . #4#) (GO #1#))))))
        (LETT |k2|
              (|PERMGRP;bsgs1| |group2| (+ |i| 1) |words3| |maxLoops| |gp|
               |diff| |out| |outword| $)
              . #4#)
        (LETT |sizeOfGroup| (* |k1| |k2|) . #4#)
        (SPADCALL |out| (APPEND (SPADCALL |out| (QREFELT $ 81)) (LIST |gpsgs|))
                  (QREFELT $ 77))
        (SPADCALL |outword|
                  (APPEND (SPADCALL |outword| (QREFELT $ 82)) (LIST |words2|))
                  (QREFELT $ 80))
        (QSETVELT |gp_info| 2 (CONS |i| (QVELT |gp_info| 2)))
        (EXIT |sizeOfGroup|)))
      #1# (EXIT #1#))))) 

(DEFUN |PERMGRP;reduceGenerators|
       (|kkk| |do_words| |gp_info| |outl| |outword| $)
  (PROG (|i| |outlk| |grpinv| |sgs| |res| |obs2| |grpinv2| |sgs2| |pos|
         |removedGenerator| |obs_len| |obs| |pt| |baseLength| |orbv|
         |base_lst|)
    (RETURN
     (SEQ
      (LETT |base_lst| (QVELT |gp_info| 2) . #1=(|PERMGRP;reduceGenerators|))
      (LETT |orbv| (QVELT |gp_info| 3) . #1#) (LETT |sgs| NIL . #1#)
      (LETT |res| NIL . #1#) (LETT |grpinv| NIL . #1#)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |kkk|) (GO G191)))
           (SEQ
            (LETT |sgs| (APPEND |sgs| (SPADCALL |outl| |i| (QREFELT $ 83)))
                  . #1#)
            (EXIT
             (LETT |grpinv|
                   (APPEND |grpinv|
                           (SPADCALL (CONS (|function| |PERMGRP;inv|) $)
                                     (SPADCALL |outl| |i| (QREFELT $ 83))
                                     (QREFELT $ 85)))
                   . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (LETT |removedGenerator| 'NIL . #1#)
      (LETT |baseLength| (SPADCALL |base_lst| (QREFELT $ 22)) . #1#)
      (LETT |pt| (+ (- |baseLength| |kkk|) 1) . #1#)
      (LETT |obs|
            (|PERMGRP;orbitWithSvc1| |sgs| |grpinv|
             (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $)
            . #1#)
      (SPADCALL |orbv| |kkk| |obs| (QREFELT $ 88))
      (LETT |obs_len| (SPADCALL (QCAR |obs|) (QREFELT $ 22)) . #1#)
      (COND
       ((EQL |obs_len| 1)
        (SEQ (LETT |removedGenerator| 'T . #1#)
             (EXIT (SPADCALL |outl| |kkk| NIL (QREFELT $ 89))))))
      (LETT |i| 1 . #1#)
      (LETT |outlk| (SPADCALL |outl| |kkk| (QREFELT $ 83)) . #1#)
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
                  . #1#)
            (LETT |sgs2| (SPADCALL |sgs| |pos| (QREFELT $ 92)) . #1#)
            (LETT |grpinv2| (SPADCALL |grpinv| |pos| (QREFELT $ 92)) . #1#)
            (LETT |obs2|
                  (|PERMGRP;orbitWithSvc1| |sgs2| |grpinv2|
                   (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $)
                  . #1#)
            (EXIT
             (COND
              ((EQL (SPADCALL (QCAR |obs2|) (QREFELT $ 22)) |obs_len|)
               (SEQ
                (LETT |res| (CONS (SPADCALL |outlk| |i| (QREFELT $ 44)) |res|)
                      . #1#)
                (LETT |sgs| |sgs2| . #1#) (LETT |grpinv| |grpinv2| . #1#)
                (LETT |outlk| (SPADCALL |outlk| |i| (QREFELT $ 92)) . #1#)
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
              ('T (LETT |i| (+ |i| 1) . #1#)))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |PERMGRP;bsgs| (|group| |wordProblem| |maxLoops| |diff| $)
  (PROG (|sizeOfGroup| #1=#:G389 |j| |kkk| |outword| |out| |orbv| #2=#:G371
         |baseOfGroup| |i| |word| |ttt| |word2| #3=#:G388 |wdi| |add_cnt|
         |noAnswer| #4=#:G359 |basePoint| #5=#:G356 |newBasePoint| #6=#:G387
         |p| |ii| |z| |ppp| |noresult| #7=#:G386 |jjj| |word3| |y1| #8=#:G385
         |pt| #9=#:G384 |z0| |gporbi| |wordv| |wordlist| |sgsv| |sgs| |rejects|
         #10=#:G383 #11=#:G382 |dummy_rec| |newGroup| |k| |words| |q|
         #12=#:G380 |ggg| #13=#:G381 |ggp| |gp| |tmpv| #14=#:G379 |gp_info|
         |degree| |supp| |outwordr| |outr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |basePoint| 0 . #15=(|PERMGRP;bsgs|))
            (LETT |newBasePoint| 'NIL . #15#) (LETT |baseOfGroup| NIL . #15#)
            (LETT |out| NIL . #15#) (LETT |outword| NIL . #15#)
            (LETT |outr| (SPADCALL NIL (QREFELT $ 96)) . #15#)
            (LETT |outwordr| (SPADCALL NIL (QREFELT $ 97)) . #15#)
            (LETT |supp| (SPADCALL |group| (QREFELT $ 52)) . #15#)
            (LETT |degree| (LENGTH |supp|) . #15#)
            (LETT |gp_info| (VECTOR 1 NIL NIL #() NIL NIL) . #15#)
            (COND
             ((EQL |degree| 0)
              (SEQ (PROGN (RPLACD |group| |gp_info|) (QCDR |group|))
                   (EXIT (PROGN (LETT #14# 1 . #15#) (GO #14#))))))
            (LETT |newGroup| NIL . #15#)
            (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #15#)
            (LETT |gp| (QCAR |group|) . #15#) (LETT |words| NIL . #15#)
            (SEQ (LETT |ggp| NIL . #15#) (LETT #13# |gp| . #15#)
                 (LETT |ggg| 1 . #15#) (LETT #12# (LENGTH |gp|) . #15#) G190
                 (COND
                  ((OR (|greater_SI| |ggg| #12#) (ATOM #13#)
                       (PROGN (LETT |ggp| (CAR #13#) . #15#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |q| (SPADCALL |supp| |ggp| |degree| (QREFELT $ 69))
                        . #15#)
                  (LETT |newGroup| (CONS |q| |newGroup|) . #15#)
                  (EXIT
                   (COND
                    (|wordProblem|
                     (LETT |words|
                           (CONS (SPADCALL |ggg| (QREFELT $ 98)) |words|)
                           . #15#)))))
                 (LETT |ggg|
                       (PROG1 (|inc_SI| |ggg|) (LETT #13# (CDR #13#) . #15#))
                       . #15#)
                 (GO G190) G191 (EXIT NIL))
            (COND
             ((< |maxLoops| 1)
              (SEQ
               (COND
                ((ZEROP (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22)))
                 (LETT |k|
                       (|PERMGRP;bsgs1| |newGroup| 1 NIL 20 |group| 0 |outr|
                        |outwordr| $)
                       . #15#)))
               (EXIT
                (LETT |maxLoops|
                      (- (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22)) 1)
                      . #15#)))))
            (LETT |k|
                  (|PERMGRP;bsgs1| |newGroup| 1 |words| |maxLoops| |group|
                   |diff| |outr| |outwordr| $)
                  . #15#)
            (LETT |out| (SPADCALL |outr| (QREFELT $ 81)) . #15#)
            (LETT |outword| (SPADCALL |outwordr| (QREFELT $ 82)) . #15#)
            (LETT |kkk| 1 . #15#) (LETT |newGroup| (REVERSE |newGroup|) . #15#)
            (LETT |noAnswer| 'T . #15#) (LETT |add_cnt| 0 . #15#)
            (LETT |dummy_rec| (CONS NIL (MAKE-ARRAY 0)) . #15#)
            (LETT |baseOfGroup| (QVELT (QCDR |group|) 2) . #15#)
            (QSETVELT |gp_info| 2 |baseOfGroup|)
            (LETT |orbv|
                  (MAKEARR1 (SPADCALL |baseOfGroup| (QREFELT $ 22))
                            |dummy_rec|)
                  . #15#)
            (SEQ G190 (COND ((NULL |noAnswer|) (GO G191)))
                 (SEQ (QSETVELT |gp_info| 2 |baseOfGroup|)
                      (QSETVELT |gp_info| 3 |orbv|) (LETT |sgs| NIL . #15#)
                      (LETT |wordlist| NIL . #15#)
                      (SEQ (LETT |i| 1 . #15#) (LETT #11# (- |kkk| 1) . #15#)
                           G190 (COND ((|greater_SI| |i| #11#) (GO G191)))
                           (SEQ
                            (LETT |sgs|
                                  (APPEND |sgs|
                                          (SPADCALL |out| |i| (QREFELT $ 83)))
                                  . #15#)
                            (EXIT
                             (COND
                              (|wordProblem|
                               (LETT |wordlist|
                                     (APPEND |wordlist|
                                             (SPADCALL |outword| |i|
                                                       (QREFELT $ 93)))
                                     . #15#)))))
                           (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |noresult| 'T . #15#)
                      (LETT |z| (SPADCALL |degree| 0 (QREFELT $ 28)) . #15#)
                      (SEQ (LETT |i| |kkk| . #15#)
                           (LETT #10# (SPADCALL |baseOfGroup| (QREFELT $ 22))
                                 . #15#)
                           G190
                           (COND
                            ((OR (> |i| #10#) (NULL |noresult|)) (GO G191)))
                           (SEQ
                            (LETT |rejects|
                                  (|PERMGRP;reduceGenerators| |i| |wordProblem|
                                   |gp_info| |out| |outword| $)
                                  . #15#)
                            (LETT |sgs|
                                  (APPEND |sgs|
                                          (SPADCALL |out| |i| (QREFELT $ 83)))
                                  . #15#)
                            (LETT |sgsv| (SPADCALL |sgs| (QREFELT $ 34))
                                  . #15#)
                            (LETT |wordv| (MAKE-ARRAY 0) . #15#)
                            (COND
                             (|wordProblem|
                              (SEQ
                               (LETT |wordlist|
                                     (APPEND |wordlist|
                                             (SPADCALL |outword| |i|
                                                       (QREFELT $ 93)))
                                     . #15#)
                               (EXIT
                                (LETT |wordv|
                                      (SPADCALL |wordlist| (QREFELT $ 36))
                                      . #15#)))))
                            (LETT |gporbi| (SPADCALL |orbv| |i| (QREFELT $ 99))
                                  . #15#)
                            (SEQ (LETT |z0| NIL . #15#)
                                 (LETT #9# |rejects| . #15#) G190
                                 (COND
                                  ((OR (ATOM #9#)
                                       (PROGN (LETT |z0| (CAR #9#) . #15#) NIL)
                                       (NULL |noresult|))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |z| (SPADCALL |z0| (QREFELT $ 100))
                                        . #15#)
                                  (LETT |ppp|
                                        (|PERMGRP;strip| |z| |i| 'NIL |orbv|
                                         |sgsv| |wordv| $)
                                        . #15#)
                                  (LETT |noresult|
                                        (|PERMGRP;testIdentity| (QCAR |ppp|) $)
                                        . #15#)
                                  (EXIT
                                   (COND
                                    ((NULL |noresult|)
                                     (SEQ
                                      (COND
                                       (|wordProblem|
                                        (SEQ
                                         (LETT |z|
                                               (SPADCALL |z0| (QREFELT $ 100))
                                               . #15#)
                                         (EXIT
                                          (LETT |ppp|
                                                (|PERMGRP;strip| |z| |i| 'T
                                                 |orbv| |sgsv| |wordv| $)
                                                . #15#)))))
                                      (LETT |z| (QCAR |ppp|) . #15#)
                                      (EXIT
                                       (LETT |word| (QCDR |ppp|) . #15#)))))))
                                 (LETT #9# (CDR #9#) . #15#) (GO G190) G191
                                 (EXIT NIL))
                            (SEQ (LETT |pt| NIL . #15#)
                                 (LETT #8# (QCAR |gporbi|) . #15#) G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN (LETT |pt| (CAR #8#) . #15#) NIL)
                                       (NULL |noresult|))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |ppp|
                                        (|PERMGRP;cosetRep1| |pt| |wordProblem|
                                         |gporbi| |sgsv| |wordv| $)
                                        . #15#)
                                  (LETT |y1| (|PERMGRP;inv| (QCAR |ppp|) $)
                                        . #15#)
                                  (LETT |word3| (QCDR |ppp|) . #15#)
                                  (EXIT
                                   (SEQ (LETT |jjj| 1 . #15#)
                                        (LETT #7# (LENGTH |sgs|) . #15#) G190
                                        (COND
                                         ((OR (|greater_SI| |jjj| #7#)
                                              (NULL |noresult|))
                                          (GO G191)))
                                        (SEQ (LETT |word| NIL . #15#)
                                             (|PERMGRP;times!| |z|
                                              (QAREF1O |sgsv| |jjj| 1) |y1| $)
                                             (COND
                                              (|wordProblem|
                                               (LETT |word|
                                                     (QAREF1O |wordv| |jjj| 1)
                                                     . #15#)))
                                             (LETT |ppp|
                                                   (|PERMGRP;strip| |z| |i|
                                                    'NIL |orbv| |sgsv| |wordv|
                                                    $)
                                                   . #15#)
                                             (LETT |z| (QCAR |ppp|) . #15#)
                                             (LETT |noresult|
                                                   (|PERMGRP;testIdentity| |z|
                                                    $)
                                                   . #15#)
                                             (EXIT
                                              (COND
                                               ((NULL |noresult|)
                                                (COND
                                                 (|wordProblem|
                                                  (SEQ
                                                   (LETT |z|
                                                         (|PERMGRP;times|
                                                          (QAREF1O |sgsv| |jjj|
                                                                   1)
                                                          |y1| $)
                                                         . #15#)
                                                   (LETT |ppp|
                                                         (|PERMGRP;strip| |z|
                                                          |i| 'T |orbv| |sgsv|
                                                          |wordv| $)
                                                         . #15#)
                                                   (LETT |z| (QCAR |ppp|)
                                                         . #15#)
                                                   (EXIT
                                                    (LETT |word|
                                                          (APPEND (QCDR |ppp|)
                                                                  |word|)
                                                          . #15#)))))))))
                                        (LETT |jjj| (|inc_SI| |jjj|) . #15#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT #8# (CDR #8#) . #15#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (COND
                              ((NULL |noresult|)
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |ii| 1 . #15#)
                                      (LETT |p| NIL . #15#)
                                      (LETT #6# |baseOfGroup| . #15#) G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN
                                             (LETT |p| (CAR #6#) . #15#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ (LETT |basePoint| 1 . #15#)
                                           (LETT |newBasePoint| 'T . #15#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL (QAREF1O |z| |p| 1) |p|
                                                        (QREFELT $ 24))
                                              (SEQ
                                               (LETT |newBasePoint| 'NIL
                                                     . #15#)
                                               (LETT |basePoint|
                                                     (PROG1
                                                         (LETT #5#
                                                               (+
                                                                (-
                                                                 (SPADCALL
                                                                  |baseOfGroup|
                                                                  (QREFELT $
                                                                           22))
                                                                 |ii|)
                                                                1)
                                                               . #15#)
                                                       (|check_subtype|
                                                        (>= #5# 0)
                                                        '(|NonNegativeInteger|)
                                                        #5#))
                                                     . #15#)
                                               (EXIT
                                                (PROGN
                                                 (LETT #4# |$NoValue| . #15#)
                                                 (GO #4#))))))))
                                      (LETT #6#
                                            (PROG1 (CDR #6#)
                                              (LETT |ii| (|inc_SI| |ii|)
                                                    . #15#))
                                            . #15#)
                                      (GO G190) G191 (EXIT NIL)))
                                #4# (EXIT #4#))))))
                           (LETT |i| (+ |i| 1) . #15#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |noAnswer|
                            (COND ((|PERMGRP;testIdentity| |z| $) 'NIL)
                                  ('T 'T))
                            . #15#)
                      (EXIT
                       (COND
                        (|noAnswer|
                         (SEQ (LETT |add_cnt| (+ |add_cnt| 1) . #15#)
                              (LETT |word2| NIL . #15#)
                              (COND
                               (|wordProblem|
                                (SEQ
                                 (SEQ (LETT |wdi| NIL . #15#)
                                      (LETT #3# |word3| . #15#) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN
                                             (LETT |wdi| (CAR #3#) . #15#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |ttt|
                                             (SPADCALL |newGroup| |wdi|
                                                       (QREFELT $ 44))
                                             . #15#)
                                       (EXIT
                                        (SEQ G190
                                             (COND
                                              ((NULL
                                                (COND
                                                 ((|PERMGRP;testIdentity| |ttt|
                                                   $)
                                                  'NIL)
                                                 ('T 'T)))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |word2|
                                                    (CONS |wdi| |word2|)
                                                    . #15#)
                                              (EXIT
                                               (LETT |ttt|
                                                     (|PERMGRP;times| |ttt|
                                                      (SPADCALL |newGroup|
                                                                |wdi|
                                                                (QREFELT $ 44))
                                                      $)
                                                     . #15#)))
                                             NIL (GO G190) G191 (EXIT NIL))))
                                      (LETT #3# (CDR #3#) . #15#) (GO G190)
                                      G191 (EXIT NIL))
                                 (LETT |word| (APPEND |word| |word2|) . #15#)
                                 (EXIT
                                  (LETT |word|
                                        (|PERMGRP;shortenWord| |word| |group|
                                         $)
                                        . #15#)))))
                              (COND
                               (|newBasePoint|
                                (SEQ
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |i| 1 . #15#) G190
                                        (COND
                                         ((|greater_SI| |i| |degree|)
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |z| |i| (QREFELT $ 73))
                                             |i| (QREFELT $ 24))
                                            (SEQ
                                             (LETT |baseOfGroup|
                                                   (APPEND |baseOfGroup|
                                                           (LIST |i|))
                                                   . #15#)
                                             (EXIT
                                              (PROGN
                                               (LETT #2# |$NoValue| . #15#)
                                               (GO #2#))))))))
                                        (LETT |i| (|inc_SI| |i|) . #15#)
                                        (GO G190) G191 (EXIT NIL)))
                                  #2# (EXIT #2#))
                                 (LETT |orbv|
                                       (MAKEARR1
                                        (SPADCALL |baseOfGroup| (QREFELT $ 22))
                                        |dummy_rec|)
                                       . #15#)
                                 (LETT |out|
                                       (CONS (SPADCALL |z| (QREFELT $ 101))
                                             |out|)
                                       . #15#)
                                 (EXIT
                                  (COND
                                   (|wordProblem|
                                    (LETT |outword|
                                          (CONS
                                           (SPADCALL |word| (QREFELT $ 102))
                                           |outword|)
                                          . #15#))))))
                               ('T
                                (SEQ
                                 (SPADCALL |out| |basePoint|
                                           (CONS |z|
                                                 (SPADCALL |out| |basePoint|
                                                           (QREFELT $ 83)))
                                           (QREFELT $ 89))
                                 (EXIT
                                  (COND
                                   (|wordProblem|
                                    (SPADCALL |outword| |basePoint|
                                              (CONS |word|
                                                    (SPADCALL |outword|
                                                              |basePoint|
                                                              (QREFELT $ 93)))
                                              (QREFELT $ 95))))))))
                              (EXIT (LETT |kkk| |basePoint| . #15#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |sizeOfGroup| 1 . #15#)
            (SEQ (LETT |j| 1 . #15#)
                 (LETT #1# (SPADCALL |baseOfGroup| (QREFELT $ 22)) . #15#) G190
                 (COND ((|greater_SI| |j| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |sizeOfGroup|
                         (* |sizeOfGroup|
                            (SPADCALL
                             (QCAR (SPADCALL |orbv| |j| (QREFELT $ 99)))
                             (QREFELT $ 22)))
                         . #15#)))
                 (LETT |j| (|inc_SI| |j|) . #15#) (GO G190) G191 (EXIT NIL))
            (PROGN
             (RPLACD |group|
                     (VECTOR |sizeOfGroup| |sgs| |baseOfGroup| |orbv| |supp|
                             |wordlist|))
             (QCDR |group|))
            (EXIT |sizeOfGroup|)))
      #14# (EXIT #14#))))) 

(DEFUN |PERMGRP;initialize| (|group| $)
  (PROG (#1=#:G394 |gen| |gp| |group2|)
    (RETURN
     (SEQ
      (LETT |group2| (SPADCALL (QREFELT $ 104)) . #2=(|PERMGRP;initialize|))
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
      (EXIT |group2|))))) 

(DEFUN |PERMGRP;knownGroup?| (|gp| $)
  (SEQ (COND ((EQL (QVELT (QCDR |gp|) 0) 0) (|PERMGRP;bsgs| |gp| 'NIL 20 0 $)))
       (EXIT (SPADCALL (QREFELT $ 108))))) 

(DEFUN |PERMGRP;subgroup| (|gp1| |gp2| $)
  (PROG (#1=#:G401 #2=#:G404 #3=#:G405 |el| |gpset2| |gpset1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |gpset1| (|PERMGRP;initialize| |gp1| $)
              . #4=(|PERMGRP;subgroup|))
        (LETT |gpset2| (|PERMGRP;initialize| |gp2| $) . #4#)
        (EXIT
         (COND
          ((SPADCALL (SPADCALL |gpset1| |gpset2| (QREFELT $ 109))
                     (QREFELT $ 110))
           'T)
          ('T
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |el| NIL . #4#)
                   (LETT #3# (SPADCALL |gpset1| (QREFELT $ 111)) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |el| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |el| |gp2| (QREFELT $ 112)))
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                        (GO #1#))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
             #1# (EXIT #1#))
            (EXIT 'T)))))))
      #2# (EXIT #2#))))) 

(DEFUN |PERMGRP;memberInternal| (|p| |gp| |do_words| $)
  (PROG (|str| |grpv| #1=#:G417 |i| |wordv| |pp| |degree| |base_lst| |orbv|
         |sgsl| |gp_info| #2=#:G415 #3=#:G409 #4=#:G416 |x| |mP| |gr_supp|)
    (RETURN
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
                    (LETT #3# (PROGN (LETT #2# (CONS 'NIL NIL) . #5#) (GO #2#))
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
                (SEQ (LETT |i| 1 . #5#) (LETT #1# (LENGTH |sgsl|) . #5#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT (SPADCALL |wordv| |i| (LIST |i|) (QREFELT $ 115))))
                     (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                     (EXIT NIL))))))
        (LETT |grpv| (SPADCALL |sgsl| (QREFELT $ 34)) . #5#)
        (LETT |str|
              (|PERMGRP;strip| |pp| (SPADCALL |base_lst| (QREFELT $ 22))
               |do_words| |orbv| |grpv| |wordv| $)
              . #5#)
        (EXIT (CONS (|PERMGRP;testIdentity| (QCAR |str|) $) (QCDR |str|)))))
      #2# (EXIT #2#))))) 

(PUT '|PERMGRP;coerce;$L;25| '|SPADreplace| 'QCAR) 

(DEFUN |PERMGRP;coerce;$L;25| (|gp| $) (QCAR |gp|)) 

(PUT '|PERMGRP;generators;$L;26| '|SPADreplace| 'QCAR) 

(DEFUN |PERMGRP;generators;$L;26| (|gp| $) (QCAR |gp|)) 

(DEFUN |PERMGRP;strongGenerators;$L;27| (|group| $)
  (PROG (|strongGens| |pairs| |j| #1=#:G426 |i| |degree| |gr_sgs| |gr_supp|)
    (RETURN
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
                                  (LIST (SPADCALL |gr_supp| |j| (QREFELT $ 41))
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
          (EXIT (REVERSE |strongGens|)))))) 

(DEFUN |PERMGRP;elt;$NniP;28| (|gp| |i| $)
  (SPADCALL (QCAR |gp|) |i| (QREFELT $ 119))) 

(DEFUN |PERMGRP;movedPoints;$S;29| (|gp| $)
  (SPADCALL (SPADCALL |gp| (QREFELT $ 52)) (QREFELT $ 121))) 

(DEFUN |PERMGRP;random;$IP;30| (|group| |maximalNumberOfFactors| $)
  (PROG (|numberOfLoops| |randomElement| |randomInteger| |numberOfGenerators|
         |gp|)
    (RETURN
     (SEQ
      (COND ((< |maximalNumberOfFactors| 1) (|spadConstant| $ 23))
            ('T
             (SEQ (LETT |gp| (QCAR |group|) . #1=(|PERMGRP;random;$IP;30|))
                  (LETT |numberOfGenerators| (LENGTH |gp|) . #1#)
                  (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|))
                        . #1#)
                  (LETT |randomElement|
                        (SPADCALL |gp| |randomInteger| (QREFELT $ 119)) . #1#)
                  (LETT |numberOfLoops| (+ 1 (RANDOM |maximalNumberOfFactors|))
                        . #1#)
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |numberOfLoops| 0 (QREFELT $ 46)))
                         (GO G191)))
                       (SEQ
                        (LETT |randomInteger|
                              (+ 1 (RANDOM |numberOfGenerators|)) . #1#)
                        (LETT |randomElement|
                              (SPADCALL
                               (SPADCALL |gp| |randomInteger| (QREFELT $ 119))
                               |randomElement| (QREFELT $ 123))
                              . #1#)
                        (EXIT
                         (LETT |numberOfLoops| (- |numberOfLoops| 1) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |randomElement|)))))))) 

(DEFUN |PERMGRP;random;$P;31| (|group| $) (SPADCALL |group| 20 (QREFELT $ 124))) 

(DEFUN |PERMGRP;order;$Nni;32| (|group| $)
  (SEQ (|PERMGRP;knownGroup?| |group| $) (EXIT (QVELT (QCDR |group|) 0)))) 

(DEFUN |PERMGRP;degree;$Nni;33| (|group| $)
  (LENGTH (SPADCALL |group| (QREFELT $ 52)))) 

(DEFUN |PERMGRP;base;$L;34| (|group| $)
  (PROG (|groupBase| #1=#:G443 |i| |gr_supp| |gr_base|)
    (RETURN
     (SEQ (|PERMGRP;knownGroup?| |group| $)
          (LETT |gr_base| (QVELT (QCDR |group|) 2) . #2=(|PERMGRP;base;$L;34|))
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
          (EXIT (REVERSE |groupBase|)))))) 

(DEFUN |PERMGRP;wordsForStrongGenerators;$L;35| (|group| $)
  (SEQ (|PERMGRP;knownGroup?| |group| $) (EXIT (QVELT (QCDR |group|) 5)))) 

(DEFUN |PERMGRP;coerce;L$;36| (|gp| $)
  (PROG (|group| |result|)
    (RETURN
     (SEQ
      (LETT |result| (VECTOR 0 NIL NIL #() NIL NIL)
            . #1=(|PERMGRP;coerce;L$;36|))
      (EXIT (LETT |group| (CONS |gp| |result|) . #1#)))))) 

(DEFUN |PERMGRP;permutationGroup;L$;37| (|gp| $)
  (PROG (|group| |result|)
    (RETURN
     (SEQ
      (LETT |result| (VECTOR 0 NIL NIL #() NIL NIL)
            . #1=(|PERMGRP;permutationGroup;L$;37|))
      (EXIT (LETT |group| (CONS |gp| |result|) . #1#)))))) 

(DEFUN |PERMGRP;coerce;$Of;38| (|group| $)
  (PROG (|outList| |i| |gp|)
    (RETURN
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
                               (SPADCALL '< (QREFELT $ 136)) (QREFELT $ 139))
                     (QREFELT $ 139))))))) 

(DEFUN |PERMGRP;orbit;$SS;39| (|gp| |el| $)
  (PROG (#1=#:G461 |i| |outSet| |outList| |elList|)
    (RETURN
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
          (EXIT |outSet|))))) 

(DEFUN |PERMGRP;orbits;$S;40| (|gp| $)
  (PROG (|spp| |orbits| |orbitSet| |el|)
    (RETURN
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
                (LETT |orbitSet| (SPADCALL |gp| |el| (QREFELT $ 142)) . #1#)
                (LETT |orbits| (CONS |orbitSet| |orbits|) . #1#)
                (EXIT
                 (LETT |spp| (SPADCALL |spp| |orbitSet| (QREFELT $ 145))
                       . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |orbits| (QREFELT $ 148))))))) 

(DEFUN |PERMGRP;member?;P$B;41| (|p| |gp| $)
  (PROG (|mi|)
    (RETURN
     (SEQ
      (LETT |mi| (|PERMGRP;memberInternal| |p| |gp| 'NIL $)
            |PERMGRP;member?;P$B;41|)
      (EXIT (QCAR |mi|)))))) 

(DEFUN |PERMGRP;wordInStrongGenerators;P$L;42| (|p| |gp| $)
  (PROG (|mi|)
    (RETURN
     (SEQ
      (LETT |mi|
            (|PERMGRP;memberInternal| (SPADCALL |p| (QREFELT $ 150)) |gp| 'T $)
            |PERMGRP;wordInStrongGenerators;P$L;42|)
      (COND ((NULL (QCAR |mi|)) (EXIT (|error| "p is not an element of gp"))))
      (EXIT (QCDR |mi|)))))) 

(DEFUN |PERMGRP;wordInGenerators;P$L;43| (|p| |gp| $)
  (PROG (|outlist| #1=#:G477 |n| |words| |lll| |gp_info|)
    (RETURN
     (SEQ (LETT |gp_info| (QCDR |gp|) . #2=(|PERMGRP;wordInGenerators;P$L;43|))
          (COND
           ((EQL (LENGTH (QVELT |gp_info| 5)) 0)
            (SPADCALL |gp| (QREFELT $ 152))))
          (LETT |lll| (SPADCALL |p| |gp| (QREFELT $ 151)) . #2#)
          (LETT |outlist| NIL . #2#) (LETT |words| (QVELT (QCDR |gp|) 5) . #2#)
          (SEQ (LETT |n| NIL . #2#) (LETT #1# |lll| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |outlist|
                       (APPEND |outlist| (SPADCALL |words| |n| (QREFELT $ 45)))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (|PERMGRP;shortenWord| |outlist| |gp| $)))))) 

(DEFUN |PERMGRP;<;2$B;44| (|gp1| |gp2| $)
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
     ((EQL (SPADCALL |gp1| (QREFELT $ 126)) (SPADCALL |gp2| (QREFELT $ 126)))
      'NIL)
     ('T 'T))))) 

(DEFUN |PERMGRP;<=;2$B;45| (|gp1| |gp2| $)
  (COND
   ((NULL
     (SPADCALL
      (SPADCALL (SPADCALL |gp1| (QREFELT $ 122))
                (SPADCALL |gp2| (QREFELT $ 122)) (QREFELT $ 145))
      (QREFELT $ 154)))
    'NIL)
   ('T (|PERMGRP;subgroup| |gp1| |gp2| $)))) 

(DEFUN |PERMGRP;=;2$B;46| (|gp1| |gp2| $)
  (PROG (#1=#:G492)
    (RETURN
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
               (PROGN (LETT #1# 'NIL . #3=(|PERMGRP;=;2$B;46|)) (GO #1#))))))
           ((NULL (|PERMGRP;subgroup| |gp2| |gp1| $))
            (EXIT (PROGN (LETT #1# 'NIL . #3#) (GO #1#)))))
          (EXIT
           (COND
            ((EQL (SPADCALL |gp1| (QREFELT $ 126))
                  (SPADCALL |gp2| (QREFELT $ 126)))
             'T)
            (#2# 'NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |PERMGRP;orbit;$SS;47| (|gp| |startSet| $)
  (PROG (|newSet| #1=#:G497 |i| |outSet| |outList| |startList|)
    (RETURN
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
      (EXIT |outSet|))))) 

(DEFUN |PERMGRP;orbit;$LS;48| (|gp| |startList| $)
  (SPADCALL (|PERMGRP;orbitInternal| |gp| |startList| $) (QREFELT $ 163))) 

(DEFUN |PERMGRP;initializeGroupForWordProblem;$2IV;49|
       (|gp| |maxLoops| |diff| $)
  (SEQ (|PERMGRP;bsgs| |gp| 'T |maxLoops| |diff| $)
       (EXIT (SPADCALL (QREFELT $ 108))))) 

(DEFUN |PERMGRP;initializeGroupForWordProblem;$V;50| (|gp| $)
  (SPADCALL |gp| 0 1 (QREFELT $ 165))) 

(DECLAIM (NOTINLINE |PermutationGroup;|)) 

(DEFUN |PermutationGroup| (#1=#:G502)
  (PROG ()
    (RETURN
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
          (UNWIND-PROTECT (PROG1 (|PermutationGroup;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PermutationGroup|))))))))))) 

(DEFUN |PermutationGroup;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
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
                               (|Record| (|:| |order| (|NonNegativeInteger|))
                                         (|:| |sgset|
                                              (|List|
                                               (|Vector|
                                                (|NonNegativeInteger|))))
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
                                               (|List|
                                                (|NonNegativeInteger|))))))))
      (COND
       ((|HasCategory| |#1| '(|OrderedSet|))
        (QSETREFV $ 52
                  (CONS (|dispatchFunction| |PERMGRP;pointList;$L;11|) $)))
       ('T
        (QSETREFV $ 52
                  (CONS (|dispatchFunction| |PERMGRP;pointList;$L;12|) $))))
      (COND
       ((|HasCategory| |#1| '(|OrderedSet|))
        (PROGN
         (QSETREFV $ 69
                   (CONS (|dispatchFunction| |PERMGRP;perm_to_vec;LPNniV;14|)
                         $))))
       ('T
        (QSETREFV $ 69
                  (CONS (|dispatchFunction| |PERMGRP;perm_to_vec;LPNniV;15|)
                        $))))
      $)))) 

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
