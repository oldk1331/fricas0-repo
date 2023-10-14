
(SDEFUN |ODERED;matF2L| ((|m| |Matrix| F) ($ |Matrix| L))
        (SPADCALL (ELT $ 13) |m| (QREFELT $ 18))) 

(SDEFUN |ODERED;reduceLODE;LOAR;2|
        ((|l| LO) (|g| A)
         ($ |Record| (|:| |mat| (|Matrix| L)) (|:| |vec| (|Vector| F))))
        (SPROG
         ((|mdi| (|Matrix| L)) (|sys| #1=(|Matrix| L)) (#2=#:G115 NIL)
          (|i| NIL) (#3=#:G113 NIL) (#4=#:G114 NIL) (|j| NIL) (|md| #1#)
          (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |n| (SPADCALL (QREFELT $ 20))
                . #5=(|ODERED;reduceLODE;LOAR;2|))
          (LETT |md|
                (|ODERED;matF2L|
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 22))
                            (CONS #'|ODERED;reduceLODE;LOAR;2!0|
                                  (VECTOR $ (QREFELT $ 12)))
                            (QREFELT $ 25))
                  (QREFELT $ 26))
                 $)
                . #5#)
          (SEQ (LETT |j| 1 . #5#)
               (LETT #4# (SPADCALL |md| (QREFELT $ 29)) . #5#)
               (LETT |i| 1 . #5#)
               (LETT #3# (SPADCALL |md| (QREFELT $ 28)) . #5#) G190
               (COND
                ((OR (|greater_SI| |i| #3#) (|greater_SI| |j| #4#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |md| |i| |j|
                           (SPADCALL (QREFELT $ 12)
                                     (SPADCALL |md| |i| |j| (QREFELT $ 30))
                                     (QREFELT $ 31))
                           (QREFELT $ 32))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT |j| (|inc_SI| |j|) . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (LETT |mdi| (SPADCALL |md| (QREFELT $ 33)) . #5#)
          (LETT |sys|
                (|ODERED;matF2L|
                 (SPADCALL (SPADCALL |l| 0 (QREFELT $ 37)) (QREFELT $ 38)) $)
                . #5#)
          (SEQ (LETT |i| 1 . #5#)
               (LETT #2# (SPADCALL |l| (QREFELT $ 39)) . #5#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |sys|
                      (SPADCALL |sys|
                                (SPADCALL
                                 (|ODERED;matF2L|
                                  (SPADCALL (SPADCALL |l| |i| (QREFELT $ 37))
                                            (QREFELT $ 38))
                                  $)
                                 |mdi| (QREFELT $ 40))
                                (QREFELT $ 41))
                      . #5#)
                (EXIT (LETT |mdi| (SPADCALL |md| |mdi| (QREFELT $ 40)) . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |sys| (SPADCALL |g| (QREFELT $ 43))))))) 

(SDEFUN |ODERED;reduceLODE;LOAR;2!0| ((|f1| NIL) ($$ NIL))
        (PROG (|diff| $)
          (LETT |diff| (QREFELT $$ 1) . #1=(|ODERED;reduceLODE;LOAR;2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |diff| |f1| (QREFELT $ 23)))))) 

(DECLAIM (NOTINLINE |ReduceLODE;|)) 

(DEFUN |ReduceLODE| (&REST #1=#:G116)
  (SPROG NIL
         (PROG (#2=#:G117)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ReduceLODE|)
                                               '|domainEqualList|)
                    . #3=(|ReduceLODE|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ReduceLODE;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ReduceLODE|)))))))))) 

(DEFUN |ReduceLODE;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|ReduceLODE|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|ReduceLODE| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 46) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|ReduceLODE|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
    $))) 

(MAKEPROP '|ReduceLODE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . D) '|diff|
              (4 . |coerce|) (|Matrix| 7) (|Mapping| 7 6) (|Matrix| 6)
              (|MatrixCategoryFunctions2| 6 42 42 16 7 (|Vector| 7)
                                          (|Vector| 7) 14)
              (9 . |map|) (|PositiveInteger|) (15 . |rank|) (|Vector| $)
              (19 . |basis|) (23 . |elt|) (|Mapping| 6 6)
              (29 . |derivationCoordinates|) (35 . |transpose|) (|Integer|)
              (40 . |maxRowIndex|) (45 . |maxColIndex|) (50 . |elt|) (57 . +)
              (63 . |setelt|) (71 . |copy|) (76 . |Zero|) (80 . |Zero|)
              (|NonNegativeInteger|) (84 . |coefficient|)
              (90 . |regularRepresentation|) (95 . |degree|) (100 . *)
              (106 . +) (|Vector| 6) (112 . |coordinates|)
              (|Record| (|:| |mat| 14) (|:| |vec| 42))
              |ODERED;reduceLODE;LOAR;2|)
           '#(|reduceLODE| 117) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(0 7 0 11 1 7 0 6 13 2 17 14
                                                   15 16 18 0 9 19 20 0 9 21 22
                                                   2 7 6 0 6 23 2 9 16 21 24 25
                                                   1 16 0 0 26 1 14 27 0 28 1
                                                   14 27 0 29 3 14 7 0 27 27 30
                                                   2 7 0 0 0 31 4 14 7 0 27 27
                                                   7 32 1 14 0 0 33 0 6 0 34 0
                                                   7 0 35 2 10 9 0 36 37 1 9 16
                                                   0 38 1 10 36 0 39 2 14 0 0 0
                                                   40 2 14 0 0 0 41 1 9 42 0 43
                                                   2 0 44 10 9 45)))))
           '|lookupComplete|)) 
