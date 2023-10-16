
(SDEFUN |ODEPAL;rat_solve|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|lf| |List| (|Fraction| UP))
         ($ |Record|
          (|:| |particular|
               (|List|
                (|Record| (|:| |ratpart| (|Fraction| UP))
                          (|:| |coeffs| (|Vector| (|Fraction| UP))))))
          (|:| |basis| (|List| (|Fraction| UP)))))
        (SPROG
         ((|bl| (|List| (|Fraction| UP))) (|s| (|Fraction| UP)) (#1=#:G133 NIL)
          (|k| NIL) (#2=#:G134 NIL) (|bf| NIL) (#3=#:G132 NIL) (|i| NIL)
          (|sl|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeffs| (|Vector| (|Fraction| UP))))))
          (#4=#:G130 NIL) (#5=#:G131 NIL) (#6=#:G129 NIL)
          (|cv| (|Vector| (|Fraction| UP))) (#7=#:G125 NIL) (|i0| (|Integer|))
          (|j| (|Integer|)) (#8=#:G128 NIL) (|nr| (|NonNegativeInteger|))
          (|m3| (|Matrix| F)) (|nn1| (|NonNegativeInteger|)) (#9=#:G112 NIL)
          (|nc| (|NonNegativeInteger|)) (|nn| #10=(|NonNegativeInteger|))
          (|m1| (|Matrix| F)) (#11=#:G127 NIL) (|kv| NIL) (#12=#:G126 NIL)
          (|nb| #10#) (|ker| (|List| (|Vector| F)))
          (|bas| #13=(|List| (|Fraction| UP)))
          (|sol| (|Record| (|:| |basis| #13#) (|:| |mat| (|Matrix| F)))))
         (SEQ (LETT |sol| (SPADCALL |l| |lf| (QREFELT $ 14)))
              (LETT |bas| (QCAR |sol|))
              (LETT |ker| (SPADCALL (QCDR |sol|) (QREFELT $ 19)))
              (EXIT
               (COND ((NULL |ker|) (CONS NIL NIL))
                     ('T
                      (SEQ (LETT |nn| (LENGTH |lf|)) (LETT |nb| (LENGTH |bas|))
                           (COND
                            ((SPADCALL |nb| (ANCOLS (QCDR |sol|))
                                       (QREFELT $ 22))
                             (|error| "rat_solve: nb ~= ncols(sol.mat)")))
                           (LETT |m1|
                                 (SPADCALL
                                  (PROGN
                                   (LETT #12# NIL)
                                   (SEQ (LETT |kv| NIL) (LETT #11# |ker|) G190
                                        (COND
                                         ((OR (ATOM #11#)
                                              (PROGN
                                               (LETT |kv| (CAR #11#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #12#
                                                (CONS
                                                 (SPADCALL |kv| (QREFELT $ 25))
                                                 #12#))))
                                        (LETT #11# (CDR #11#)) (GO G190) G191
                                        (EXIT (NREVERSE #12#))))
                                  (QREFELT $ 27)))
                           (LETT |nn| (LENGTH |lf|)) (LETT |nc| (ANCOLS |m1|))
                           (LETT |nn1|
                                 (PROG1 (LETT #9# (- |nc| |nn|))
                                   (|check_subtype2| (>= #9# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #9#)))
                           (LETT |m3| (SPADCALL |m1| (QREFELT $ 28)))
                           (LETT |nr| (ANROWS |m3|)) (LETT |j| 1)
                           (LETT |i0| (+ |nr| 1)) (LETT |sl| NIL)
                           (SEQ
                            (EXIT
                             (SEQ (LETT |i| 1) (LETT #8# |nr|) G190
                                  (COND ((|greater_SI| |i| #8#) (GO G191)))
                                  (SEQ
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (COND
                                            ((SPADCALL |j| |nn| (QREFELT $ 32))
                                             (SPADCALL
                                              (SPADCALL |m3| |i| |j|
                                                        (QREFELT $ 33))
                                              (|spadConstant| $ 34)
                                              (QREFELT $ 35)))
                                            ('T NIL)))
                                          (GO G191)))
                                        (SEQ (EXIT (LETT |j| (+ |j| 1)))) NIL
                                        (GO G190) G191 (EXIT NIL))
                                   (COND
                                    ((SPADCALL |j| |nn| (QREFELT $ 36))
                                     (SEQ (LETT |i0| |i|)
                                          (EXIT
                                           (PROGN
                                            (LETT #7# |$NoValue|)
                                            (GO #14=#:G118))))))
                                   (LETT |cv|
                                         (MAKEARR1 |nn| (|spadConstant| $ 39)))
                                   (SEQ (LETT |k| 1) (LETT #6# |nn|) G190
                                        (COND
                                         ((|greater_SI| |k| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SPADCALL |cv| |k|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |m3| |i| |k|
                                                                (QREFELT $ 33))
                                                      (QREFELT $ 40))
                                                     (QREFELT $ 41))
                                                    (QREFELT $ 43))))
                                        (LETT |k| (|inc_SI| |k|)) (GO G190)
                                        G191 (EXIT NIL))
                                   (LETT |s| (|spadConstant| $ 39))
                                   (SEQ (LETT |bf| NIL) (LETT #5# |bas|)
                                        (LETT |k| 1) (LETT #4# |nc|) G190
                                        (COND
                                         ((OR (|greater_SI| |k| #4#) (ATOM #5#)
                                              (PROGN
                                               (LETT |bf| (CAR #5#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |s|
                                                (SPADCALL |s|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |m3| |i|
                                                                      |k|
                                                                      (QREFELT
                                                                       $ 33))
                                                            (QREFELT $ 40))
                                                           |bf| (QREFELT $ 44))
                                                          (QREFELT $ 45)))))
                                        (LETT |k|
                                              (PROG1 (|inc_SI| |k|)
                                                (LETT #5# (CDR #5#))))
                                        (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (LETT |sl| (CONS (CONS |s| |cv|) |sl|))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL)))
                            #14# (EXIT #7#))
                           (LETT |bl| NIL)
                           (SEQ (LETT |i| |i0|) (LETT #3# |nr|) G190
                                (COND ((> |i| #3#) (GO G191)))
                                (SEQ (LETT |s| (|spadConstant| $ 39))
                                     (SEQ (LETT |bf| NIL) (LETT #2# |bas|)
                                          (LETT |k| 1) (LETT #1# |nc|) G190
                                          (COND
                                           ((OR (|greater_SI| |k| #1#)
                                                (ATOM #2#)
                                                (PROGN
                                                 (LETT |bf| (CAR #2#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |s|
                                                  (SPADCALL |s|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |m3|
                                                                        |i| |k|
                                                                        (QREFELT
                                                                         $ 33))
                                                              (QREFELT $ 40))
                                                             |bf|
                                                             (QREFELT $ 44))
                                                            (QREFELT $ 45)))))
                                          (LETT |k|
                                                (PROG1 (|inc_SI| |k|)
                                                  (LETT #2# (CDR #2#))))
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT (LETT |bl| (CONS |s| |bl|))))
                                (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |sl| |bl|))))))))) 

(SDEFUN |ODEPAL;RF_to_F| ((|rf| |Fraction| UP) ($ F))
        (SPADCALL (SPADCALL |rf| (QREFELT $ 46)) (QREFELT $ 47))) 

(SDEFUN |ODEPAL;V_to_VF| ((|v| |Vector| (|Fraction| UP)) ($ |Vector| F))
        (SPADCALL (CONS (|function| |ODEPAL;RF_to_F|) $) |v| (QREFELT $ 50))) 

(SDEFUN |ODEPAL;algDsolve;LodoLR;4|
        ((|l| |LinearOrdinaryDifferentialOperator1| R) (|lg| |List| R)
         ($ |Record|
          (|:| |particular|
               (|List|
                (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
          (|:| |basis| (|List| R))))
        (SPROG
         ((|part|
           (|List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
          (#1=#:G154 NIL) (|be| NIL) (#2=#:G153 NIL) (|bas| (|List| R))
          (#3=#:G152 NIL) (|v| NIL) (#4=#:G151 NIL)
          (|sol|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| (|Vector| (|Fraction| UP)))
                            (|:| |coeffs| (|Vector| (|Fraction| UP))))))
            (|:| |basis| (|List| (|Vector| (|Fraction| UP))))))
          (|rec|
           (|Record|
            (|:| |mat|
                 (|Matrix|
                  (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
            (|:| |vecs| (|List| (|Vector| (|Fraction| UP)))))))
         (SEQ (LETT |rec| (SPADCALL |l| |lg| (QREFELT $ 55)))
              (LETT |sol|
                    (SPADCALL (QCAR |rec|) (QCDR |rec|)
                              (CONS (|function| |ODEPAL;rat_solve|) $)
                              (QREFELT $ 64)))
              (LETT |bas|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |v| NIL) (LETT #3# (QCDR |sol|)) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |v| (QREFELT $ 65)) #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |part|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |be| NIL) (LETT #1# (QCAR |sol|)) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |be| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (CONS (SPADCALL (QCAR |be|) (QREFELT $ 65))
                                         (|ODEPAL;V_to_VF| (QCDR |be|) $))
                                   #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (CONS |part| |bas|))))) 

(SDEFUN |ODEPAL;algDsolve;LodoRR;5|
        ((|l| |LinearOrdinaryDifferentialOperator1| R) (|g| R)
         ($ |Record| (|:| |particular| (|Union| R "failed"))
          (|:| |basis| (|List| R))))
        (SPROG
         ((|s1| (R)) (|s0| (R)) (|c1inv| (F))
          (|part1| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F))))
          (|bas| #1=(|List| R))
          (|rec1|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| #1#))))
         (SEQ (LETT |rec1| (SPADCALL |l| (LIST |g|) (QREFELT $ 68)))
              (LETT |bas| (QCDR |rec1|))
              (EXIT
               (COND ((NULL (QCAR |rec1|)) (CONS (CONS 1 "failed") |bas|))
                     ('T
                      (SEQ (LETT |part1| (|SPADfirst| (QCAR |rec1|)))
                           (LETT |c1inv|
                                 (SPADCALL
                                  (SPADCALL (QCDR |part1|) 1 (QREFELT $ 69))
                                  (QREFELT $ 70)))
                           (LETT |s0| (QCAR |part1|))
                           (LETT |s1|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |c1inv| (QREFELT $ 40))
                                            (QREFELT $ 41))
                                  |s0| (QREFELT $ 71)))
                           (EXIT (CONS (CONS 0 |s1|) |bas|))))))))) 

(DECLAIM (NOTINLINE |PureAlgebraicLODE;|)) 

(DEFUN |PureAlgebraicLODE| (&REST #1=#:G168)
  (SPROG NIL
         (PROG (#2=#:G169)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PureAlgebraicLODE|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PureAlgebraicLODE;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PureAlgebraicLODE|)))))))))) 

(DEFUN |PureAlgebraicLODE;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PureAlgebraicLODE| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 75))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|PureAlgebraicLODE|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|PureAlgebraicLODE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|)
              (|Record| (|:| |basis| 12) (|:| |mat| 18))
              (|LinearOrdinaryDifferentialOperator1| 38) (|List| 38)
              (|RationalLODE| 6 7) (0 . |ratDsolve|) (|Vector| $) (6 . |basis|)
              (|List| 24) (|Matrix| 6) (10 . |nullSpace|) (|Boolean|)
              (|NonNegativeInteger|) (15 . ~=) (|List| 6) (|Vector| 6)
              (21 . |entries|) (|List| 23) (26 . |matrix|) (31 . |rowEchelon|)
              (36 . |One|) (40 . |One|) (|Integer|) (44 . <=) (50 . |elt|)
              (57 . |Zero|) (61 . =) (67 . >) (73 . |Zero|) (|Fraction| 7)
              (77 . |Zero|) (81 . |coerce|) (86 . |coerce|) (|Vector| 38)
              (91 . |setelt!|) (98 . *) (104 . +) (110 . |retract|)
              (115 . |ground|) (|Mapping| 6 38) (|VectorFunctions2| 38 6)
              (120 . |map|) (|Record| (|:| |mat| 58) (|:| |vecs| 59))
              (|LinearOrdinaryDifferentialOperator1| 9) (|List| 9)
              (|ReduceLODE| 38 11 8 9 52) (126 . |reduceLODE|)
              (|Record| (|:| |ratpart| 42) (|:| |coeffs| 42))
              (|Record| (|:| |particular| (|List| 56)) (|:| |basis| 59))
              (|Matrix| 11) (|List| 42)
              (|Record| (|:| |ratpart| 38) (|:| |coeffs| 42))
              (|Record| (|:| |particular| (|List| 60)) (|:| |basis| 12))
              (|Mapping| 61 11 12) (|SystemODESolver| 38 11)
              (132 . |solveInField|) (139 . |represents|)
              (|Record| (|:| |ratpart| 9) (|:| |coeffs| 24))
              (|Record| (|:| |particular| (|List| 66)) (|:| |basis| 53))
              |ODEPAL;algDsolve;LodoLR;4| (144 . |elt|) (150 . |inv|) (155 . *)
              (|Union| 9 '"failed")
              (|Record| (|:| |particular| 72) (|:| |basis| 53))
              |ODEPAL;algDsolve;LodoRR;5|)
           '#(|algDsolve| 161) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 74
                                                 '(2 13 10 11 12 14 0 9 15 16 1
                                                   18 17 0 19 2 21 20 0 0 22 1
                                                   24 23 0 25 1 18 0 26 27 1 18
                                                   0 0 28 0 6 0 29 0 7 0 30 2
                                                   31 20 0 0 32 3 18 6 0 31 31
                                                   33 0 6 0 34 2 6 20 0 0 35 2
                                                   31 20 0 0 36 0 7 0 37 0 38 0
                                                   39 1 7 0 6 40 1 38 0 7 41 3
                                                   42 38 0 31 38 43 2 38 0 7 0
                                                   44 2 38 0 0 0 45 1 38 7 0 46
                                                   1 7 6 0 47 2 49 24 48 42 50
                                                   2 54 51 52 53 55 3 63 57 58
                                                   59 62 64 1 9 0 42 65 2 24 6
                                                   0 31 69 1 6 0 0 70 2 9 0 38
                                                   0 71 2 0 67 52 53 68 2 0 73
                                                   52 9 74)))))
           '|lookupComplete|)) 
