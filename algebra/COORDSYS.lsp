
(/VERSIONCHECK 2) 

(PUT '|COORDSYS;cartesian;2P;1| '|SPADreplace| '(XLAM (|pt|) |pt|)) 

(DEFUN |COORDSYS;cartesian;2P;1| (|pt| $) |pt|) 

(DEFUN |COORDSYS;polar;2P;2| (|pt0| $)
  (PROG (|theta| |r| |pt|)
    (RETURN
     (SEQ
      (LETT |pt| (SPADCALL |pt0| (QREFELT $ 9)) . #1=(|COORDSYS;polar;2P;2|))
      (LETT |r| (SPADCALL |pt0| 1 (QREFELT $ 12)) . #1#)
      (LETT |theta| (SPADCALL |pt0| 2 (QREFELT $ 12)) . #1#)
      (SPADCALL |pt| 1
                (SPADCALL |r| (SPADCALL |theta| (QREFELT $ 13)) (QREFELT $ 14))
                (QREFELT $ 15))
      (SPADCALL |pt| 2
                (SPADCALL |r| (SPADCALL |theta| (QREFELT $ 16)) (QREFELT $ 14))
                (QREFELT $ 15))
      (EXIT |pt|))))) 

(DEFUN |COORDSYS;cylindrical;2P;3| (|pt0| $) (SPADCALL |pt0| (QREFELT $ 17))) 

(DEFUN |COORDSYS;spherical;2P;4| (|pt0| $)
  (PROG (|phi| |theta| |r| |pt|)
    (RETURN
     (SEQ
      (LETT |pt| (SPADCALL |pt0| (QREFELT $ 9))
            . #1=(|COORDSYS;spherical;2P;4|))
      (LETT |r| (SPADCALL |pt0| 1 (QREFELT $ 12)) . #1#)
      (LETT |theta| (SPADCALL |pt0| 2 (QREFELT $ 12)) . #1#)
      (LETT |phi| (SPADCALL |pt0| 3 (QREFELT $ 12)) . #1#)
      (SPADCALL |pt| 1
                (SPADCALL
                 (SPADCALL |r| (SPADCALL |phi| (QREFELT $ 16)) (QREFELT $ 14))
                 (SPADCALL |theta| (QREFELT $ 13)) (QREFELT $ 14))
                (QREFELT $ 15))
      (SPADCALL |pt| 2
                (SPADCALL
                 (SPADCALL |r| (SPADCALL |phi| (QREFELT $ 16)) (QREFELT $ 14))
                 (SPADCALL |theta| (QREFELT $ 16)) (QREFELT $ 14))
                (QREFELT $ 15))
      (SPADCALL |pt| 3
                (SPADCALL |r| (SPADCALL |phi| (QREFELT $ 13)) (QREFELT $ 14))
                (QREFELT $ 15))
      (EXIT |pt|))))) 

(DEFUN |COORDSYS;parabolic;2P;5| (|pt0| $)
  (PROG (|v| |u| |pt|)
    (RETURN
     (SEQ
      (LETT |pt| (SPADCALL |pt0| (QREFELT $ 9))
            . #1=(|COORDSYS;parabolic;2P;5|))
      (LETT |u| (SPADCALL |pt0| 1 (QREFELT $ 12)) . #1#)
      (LETT |v| (SPADCALL |pt0| 2 (QREFELT $ 12)) . #1#)
      (SPADCALL |pt| 1
                (SPADCALL
                 (SPADCALL (SPADCALL |u| |u| (QREFELT $ 14))
                           (SPADCALL |v| |v| (QREFELT $ 14)) (QREFELT $ 20))
                 (SPADCALL 2 (QREFELT $ 21)) (QREFELT $ 22))
                (QREFELT $ 15))
      (SPADCALL |pt| 2 (SPADCALL |u| |v| (QREFELT $ 14)) (QREFELT $ 15))
      (EXIT |pt|))))) 

(DEFUN |COORDSYS;parabolicCylindrical;2P;6| (|pt0| $)
  (SPADCALL |pt0| (QREFELT $ 23))) 

(DEFUN |COORDSYS;paraboloidal;2P;7| (|pt0| $)
  (PROG (|phi| |v| |u| |pt|)
    (RETURN
     (SEQ
      (LETT |pt| (SPADCALL |pt0| (QREFELT $ 9))
            . #1=(|COORDSYS;paraboloidal;2P;7|))
      (LETT |u| (SPADCALL |pt0| 1 (QREFELT $ 12)) . #1#)
      (LETT |v| (SPADCALL |pt0| 2 (QREFELT $ 12)) . #1#)
      (LETT |phi| (SPADCALL |pt0| 3 (QREFELT $ 12)) . #1#)
      (SPADCALL |pt| 1
                (SPADCALL (SPADCALL |u| |v| (QREFELT $ 14))
                          (SPADCALL |phi| (QREFELT $ 13)) (QREFELT $ 14))
                (QREFELT $ 15))
      (SPADCALL |pt| 2
                (SPADCALL (SPADCALL |u| |v| (QREFELT $ 14))
                          (SPADCALL |phi| (QREFELT $ 16)) (QREFELT $ 14))
                (QREFELT $ 15))
      (SPADCALL |pt| 3
                (SPADCALL
                 (SPADCALL (SPADCALL |u| |u| (QREFELT $ 14))
                           (SPADCALL |v| |v| (QREFELT $ 14)) (QREFELT $ 20))
                 (SPADCALL 2 (QREFELT $ 21)) (QREFELT $ 22))
                (QREFELT $ 15))
      (EXIT |pt|))))) 

(DEFUN |COORDSYS;elliptic;RM;8| (|a| $)
  (PROG () (RETURN (SEQ (CONS #'|COORDSYS;elliptic;RM;8!0| (VECTOR |a| $)))))) 

(DEFUN |COORDSYS;elliptic;RM;8!0| (|x| $$)
  (PROG ($ |a|)
    (LETT $ (QREFELT $$ 1) . #1=(|COORDSYS;elliptic;RM;8|))
    (LETT |a| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|v| |u| |pt|)
        (RETURN
         (SEQ (LETT |pt| (SPADCALL |x| (QREFELT $ 9)) NIL)
              (LETT |u| (SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 12))
                    NIL)
              (LETT |v| (SPADCALL |x| 2 (QREFELT $ 12)) NIL)
              (SPADCALL |pt| (|spadConstant| $ 28)
                        (SPADCALL
                         (SPADCALL |a| (SPADCALL |u| (QREFELT $ 31))
                                   (QREFELT $ 14))
                         (SPADCALL |v| (QREFELT $ 13)) (QREFELT $ 14))
                        (QREFELT $ 15))
              (SPADCALL |pt| 2
                        (SPADCALL
                         (SPADCALL |a| (SPADCALL |u| (QREFELT $ 32))
                                   (QREFELT $ 14))
                         (SPADCALL |v| (QREFELT $ 16)) (QREFELT $ 14))
                        (QREFELT $ 15))
              (EXIT |pt|)))))))) 

(DEFUN |COORDSYS;ellipticCylindrical;RM;9| (|a| $)
  (SPADCALL |a| (QREFELT $ 34))) 

(DEFUN |COORDSYS;prolateSpheroidal;RM;10| (|a| $)
  (PROG ()
    (RETURN
     (SEQ (CONS #'|COORDSYS;prolateSpheroidal;RM;10!0| (VECTOR |a| $)))))) 

(DEFUN |COORDSYS;prolateSpheroidal;RM;10!0| (|x| $$)
  (PROG ($ |a|)
    (LETT $ (QREFELT $$ 1) . #1=(|COORDSYS;prolateSpheroidal;RM;10|))
    (LETT |a| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|phi| |eta| |xi| |pt|)
        (RETURN
         (SEQ (LETT |pt| (SPADCALL |x| (QREFELT $ 9)) NIL)
              (LETT |xi| (SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 12))
                    NIL)
              (LETT |eta| (SPADCALL |x| 2 (QREFELT $ 12)) NIL)
              (LETT |phi| (SPADCALL |x| 3 (QREFELT $ 12)) NIL)
              (SPADCALL |pt| (|spadConstant| $ 28)
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |a| (SPADCALL |xi| (QREFELT $ 32))
                                    (QREFELT $ 14))
                          (SPADCALL |eta| (QREFELT $ 16)) (QREFELT $ 14))
                         (SPADCALL |phi| (QREFELT $ 13)) (QREFELT $ 14))
                        (QREFELT $ 15))
              (SPADCALL |pt| 2
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |a| (SPADCALL |xi| (QREFELT $ 32))
                                    (QREFELT $ 14))
                          (SPADCALL |eta| (QREFELT $ 16)) (QREFELT $ 14))
                         (SPADCALL |phi| (QREFELT $ 16)) (QREFELT $ 14))
                        (QREFELT $ 15))
              (SPADCALL |pt| 3
                        (SPADCALL
                         (SPADCALL |a| (SPADCALL |xi| (QREFELT $ 31))
                                   (QREFELT $ 14))
                         (SPADCALL |eta| (QREFELT $ 13)) (QREFELT $ 14))
                        (QREFELT $ 15))
              (EXIT |pt|)))))))) 

(DEFUN |COORDSYS;oblateSpheroidal;RM;11| (|a| $)
  (PROG ()
    (RETURN (SEQ (CONS #'|COORDSYS;oblateSpheroidal;RM;11!0| (VECTOR |a| $)))))) 

(DEFUN |COORDSYS;oblateSpheroidal;RM;11!0| (|x| $$)
  (PROG ($ |a|)
    (LETT $ (QREFELT $$ 1) . #1=(|COORDSYS;oblateSpheroidal;RM;11|))
    (LETT |a| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|phi| |eta| |xi| |pt|)
        (RETURN
         (SEQ (LETT |pt| (SPADCALL |x| (QREFELT $ 9)) NIL)
              (LETT |xi| (SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 12))
                    NIL)
              (LETT |eta| (SPADCALL |x| 2 (QREFELT $ 12)) NIL)
              (LETT |phi| (SPADCALL |x| 3 (QREFELT $ 12)) NIL)
              (SPADCALL |pt| (|spadConstant| $ 28)
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |a| (SPADCALL |xi| (QREFELT $ 32))
                                    (QREFELT $ 14))
                          (SPADCALL |eta| (QREFELT $ 16)) (QREFELT $ 14))
                         (SPADCALL |phi| (QREFELT $ 13)) (QREFELT $ 14))
                        (QREFELT $ 15))
              (SPADCALL |pt| 2
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |a| (SPADCALL |xi| (QREFELT $ 31))
                                    (QREFELT $ 14))
                          (SPADCALL |eta| (QREFELT $ 13)) (QREFELT $ 14))
                         (SPADCALL |phi| (QREFELT $ 16)) (QREFELT $ 14))
                        (QREFELT $ 15))
              (SPADCALL |pt| 3
                        (SPADCALL
                         (SPADCALL |a| (SPADCALL |xi| (QREFELT $ 32))
                                   (QREFELT $ 14))
                         (SPADCALL |eta| (QREFELT $ 16)) (QREFELT $ 14))
                        (QREFELT $ 15))
              (EXIT |pt|)))))))) 

(DEFUN |COORDSYS;bipolar;RM;12| (|a| $)
  (PROG () (RETURN (SEQ (CONS #'|COORDSYS;bipolar;RM;12!0| (VECTOR |a| $)))))) 

(DEFUN |COORDSYS;bipolar;RM;12!0| (|x| $$)
  (PROG ($ |a|)
    (LETT $ (QREFELT $$ 1) . #1=(|COORDSYS;bipolar;RM;12|))
    (LETT |a| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|v| |u| |pt|)
        (RETURN
         (SEQ (LETT |pt| (SPADCALL |x| (QREFELT $ 9)) NIL)
              (LETT |u| (SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 12))
                    NIL)
              (LETT |v| (SPADCALL |x| 2 (QREFELT $ 12)) NIL)
              (SPADCALL |pt| (|spadConstant| $ 28)
                        (SPADCALL
                         (SPADCALL |a| (SPADCALL |v| (QREFELT $ 32))
                                   (QREFELT $ 14))
                         (SPADCALL (SPADCALL |v| (QREFELT $ 31))
                                   (SPADCALL |u| (QREFELT $ 13))
                                   (QREFELT $ 20))
                         (QREFELT $ 22))
                        (QREFELT $ 15))
              (SPADCALL |pt| 2
                        (SPADCALL
                         (SPADCALL |a| (SPADCALL |u| (QREFELT $ 16))
                                   (QREFELT $ 14))
                         (SPADCALL (SPADCALL |v| (QREFELT $ 31))
                                   (SPADCALL |u| (QREFELT $ 13))
                                   (QREFELT $ 20))
                         (QREFELT $ 22))
                        (QREFELT $ 15))
              (EXIT |pt|)))))))) 

(DEFUN |COORDSYS;bipolarCylindrical;RM;13| (|a| $)
  (SPADCALL |a| (QREFELT $ 38))) 

(DEFUN |COORDSYS;toroidal;RM;14| (|a| $)
  (PROG () (RETURN (SEQ (CONS #'|COORDSYS;toroidal;RM;14!0| (VECTOR |a| $)))))) 

(DEFUN |COORDSYS;toroidal;RM;14!0| (|x| $$)
  (PROG ($ |a|)
    (LETT $ (QREFELT $$ 1) . #1=(|COORDSYS;toroidal;RM;14|))
    (LETT |a| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|phi| |v| |u| |pt|)
        (RETURN
         (SEQ (LETT |pt| (SPADCALL |x| (QREFELT $ 9)) NIL)
              (LETT |u| (SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 12))
                    NIL)
              (LETT |v| (SPADCALL |x| 2 (QREFELT $ 12)) NIL)
              (LETT |phi| (SPADCALL |x| 3 (QREFELT $ 12)) NIL)
              (SPADCALL |pt| (|spadConstant| $ 28)
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |a| (SPADCALL |v| (QREFELT $ 32))
                                    (QREFELT $ 14))
                          (SPADCALL |phi| (QREFELT $ 13)) (QREFELT $ 14))
                         (SPADCALL (SPADCALL |v| (QREFELT $ 31))
                                   (SPADCALL |u| (QREFELT $ 13))
                                   (QREFELT $ 20))
                         (QREFELT $ 22))
                        (QREFELT $ 15))
              (SPADCALL |pt| 2
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |a| (SPADCALL |v| (QREFELT $ 32))
                                    (QREFELT $ 14))
                          (SPADCALL |phi| (QREFELT $ 16)) (QREFELT $ 14))
                         (SPADCALL (SPADCALL |v| (QREFELT $ 31))
                                   (SPADCALL |u| (QREFELT $ 13))
                                   (QREFELT $ 20))
                         (QREFELT $ 22))
                        (QREFELT $ 15))
              (SPADCALL |pt| 3
                        (SPADCALL
                         (SPADCALL |a| (SPADCALL |u| (QREFELT $ 16))
                                   (QREFELT $ 14))
                         (SPADCALL (SPADCALL |v| (QREFELT $ 31))
                                   (SPADCALL |u| (QREFELT $ 13))
                                   (QREFELT $ 20))
                         (QREFELT $ 22))
                        (QREFELT $ 15))
              (EXIT |pt|)))))))) 

(DEFUN |COORDSYS;conical;2RM;15| (|a| |b| $)
  (PROG ()
    (RETURN (SEQ (CONS #'|COORDSYS;conical;2RM;15!0| (VECTOR |b| |a| $)))))) 

(DEFUN |COORDSYS;conical;2RM;15!0| (|x| $$)
  (PROG ($ |a| |b|)
    (LETT $ (QREFELT $$ 2) . #1=(|COORDSYS;conical;2RM;15|))
    (LETT |a| (QREFELT $$ 1) . #1#)
    (LETT |b| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|nu| |mu| |lambda| |pt|)
        (RETURN
         (SEQ (LETT |pt| (SPADCALL |x| (QREFELT $ 9)) NIL)
              (LETT |lambda|
                    (SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 12)) NIL)
              (LETT |mu| (SPADCALL |x| 2 (QREFELT $ 12)) NIL)
              (LETT |nu| (SPADCALL |x| 3 (QREFELT $ 12)) NIL)
              (SPADCALL |pt| (|spadConstant| $ 28)
                        (SPADCALL
                         (SPADCALL (SPADCALL |lambda| |mu| (QREFELT $ 14)) |nu|
                                   (QREFELT $ 14))
                         (SPADCALL |a| |b| (QREFELT $ 14)) (QREFELT $ 22))
                        (QREFELT $ 15))
              (SPADCALL |pt| 2
                        (SPADCALL (SPADCALL |lambda| |a| (QREFELT $ 22))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |mu| 2 (QREFELT $ 41))
                                               (SPADCALL |a| 2 (QREFELT $ 41))
                                               (QREFELT $ 20))
                                     (SPADCALL (SPADCALL |nu| 2 (QREFELT $ 41))
                                               (SPADCALL |a| 2 (QREFELT $ 41))
                                               (QREFELT $ 20))
                                     (QREFELT $ 14))
                                    (SPADCALL (SPADCALL |a| 2 (QREFELT $ 41))
                                              (SPADCALL |b| 2 (QREFELT $ 41))
                                              (QREFELT $ 20))
                                    (QREFELT $ 22))
                                   (QREFELT $ 42))
                                  (QREFELT $ 14))
                        (QREFELT $ 15))
              (SPADCALL |pt| 3
                        (SPADCALL (SPADCALL |lambda| |b| (QREFELT $ 22))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |mu| 2 (QREFELT $ 41))
                                               (SPADCALL |b| 2 (QREFELT $ 41))
                                               (QREFELT $ 20))
                                     (SPADCALL (SPADCALL |nu| 2 (QREFELT $ 41))
                                               (SPADCALL |b| 2 (QREFELT $ 41))
                                               (QREFELT $ 20))
                                     (QREFELT $ 14))
                                    (SPADCALL (SPADCALL |b| 2 (QREFELT $ 41))
                                              (SPADCALL |a| 2 (QREFELT $ 41))
                                              (QREFELT $ 20))
                                    (QREFELT $ 22))
                                   (QREFELT $ 42))
                                  (QREFELT $ 14))
                        (QREFELT $ 15))
              (EXIT |pt|)))))))) 

(DEFUN |CoordinateSystems| (#1=#:G159)
  (PROG ()
    (RETURN
     (PROG (#2=#:G160)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|CoordinateSystems|)
                                           '|domainEqualList|)
                . #3=(|CoordinateSystems|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|CoordinateSystems;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|CoordinateSystems|))))))))))) 

(DEFUN |CoordinateSystems;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|CoordinateSystems|))
      (LETT |dv$| (LIST '|CoordinateSystems| DV$1) . #1#)
      (LETT $ (GETREFV 44) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|CoordinateSystems| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|CoordinateSystems| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Point| 6)
              |COORDSYS;cartesian;2P;1| (0 . |copy|) (5 . |One|) (|Integer|)
              (9 . |elt|) (15 . |cos|) (20 . *) (26 . |setelt|) (33 . |sin|)
              |COORDSYS;polar;2P;2| |COORDSYS;cylindrical;2P;3|
              |COORDSYS;spherical;2P;4| (38 . -) (44 . |coerce|) (49 . /)
              |COORDSYS;parabolic;2P;5| |COORDSYS;parabolicCylindrical;2P;6|
              |COORDSYS;paraboloidal;2P;7| (55 . |One|) (|PositiveInteger|)
              (59 . |One|) (|NonNegativeInteger|) (63 . |One|) (67 . |cosh|)
              (72 . |sinh|) (|Mapping| 7 7) |COORDSYS;elliptic;RM;8|
              |COORDSYS;ellipticCylindrical;RM;9|
              |COORDSYS;prolateSpheroidal;RM;10|
              |COORDSYS;oblateSpheroidal;RM;11| |COORDSYS;bipolar;RM;12|
              |COORDSYS;bipolarCylindrical;RM;13| |COORDSYS;toroidal;RM;14|
              (77 . ^) (83 . |sqrt|) |COORDSYS;conical;2RM;15|)
           '#(|toroidal| 88 |spherical| 93 |prolateSpheroidal| 98 |polar| 103
              |paraboloidal| 108 |parabolicCylindrical| 113 |parabolic| 118
              |oblateSpheroidal| 123 |ellipticCylindrical| 128 |elliptic| 133
              |cylindrical| 138 |conical| 143 |cartesian| 149
              |bipolarCylindrical| 154 |bipolar| 159)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(1 7 0 0 9 0 6 0 10 2 7 6 0
                                                   11 12 1 6 0 0 13 2 6 0 0 0
                                                   14 3 7 6 0 11 6 15 1 6 0 0
                                                   16 2 6 0 0 0 20 1 6 0 11 21
                                                   2 6 0 0 0 22 0 11 0 26 0 27
                                                   0 28 0 29 0 30 1 6 0 0 31 1
                                                   6 0 0 32 2 6 0 0 27 41 1 6 0
                                                   0 42 1 0 33 6 40 1 0 7 7 19
                                                   1 0 33 6 36 1 0 7 7 17 1 0 7
                                                   7 25 1 0 7 7 24 1 0 7 7 23 1
                                                   0 33 6 37 1 0 33 6 35 1 0 33
                                                   6 34 1 0 7 7 18 2 0 33 6 6
                                                   43 1 0 7 7 8 1 0 33 6 39 1 0
                                                   33 6 38)))))
           '|lookupComplete|)) 
