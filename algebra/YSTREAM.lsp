
(SDEFUN |YSTREAM;Y;MS;1|
        ((|f| |Mapping| #1=(|Stream| A) (|Stream| A)) ($ |Stream| A))
        (SPROG ((|j| #1#) (|y| (|Stream| A)))
               (SEQ (LETT |y| (CONS (QREFELT $ 7) 0) . #2=(|YSTREAM;Y;MS;1|))
                    (LETT |j| (SPADCALL |y| |f|) . #2#)
                    (RPLACA |y| (SPADCALL |j| (QREFELT $ 9)))
                    (RPLACD |y| (SPADCALL |j| (QREFELT $ 10))) (EXIT |y|)))) 

(SDEFUN |YSTREAM;Y;MIL;2|
        ((|g| |Mapping| #1=(|List| (|Stream| A)) (|List| (|Stream| A)))
         (|n| |Integer|) ($ |List| (|Stream| A)))
        (SPROG
         ((#2=#:G114 NIL) (|xi| NIL) (#3=#:G115 NIL) (|ji| NIL) (|j| #1#)
          (|x| (|List| (|Stream| A))) (|i| NIL) (#4=#:G113 NIL))
         (SEQ
          (LETT |x|
                (PROGN
                 (LETT #4# NIL . #5=(|YSTREAM;Y;MIL;2|))
                 (SEQ (LETT |i| 1 . #5#) G190
                      (COND ((|greater_SI| |i| |n|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (CONS (QREFELT $ 7) 0) #4#) . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |j| (SPADCALL |x| |g|) . #5#)
          (SEQ (LETT |ji| NIL . #5#) (LETT #3# |j| . #5#) (LETT |xi| NIL . #5#)
               (LETT #2# |x| . #5#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |xi| (CAR #2#) . #5#) NIL)
                     (ATOM #3#) (PROGN (LETT |ji| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ (RPLACA |xi| (SPADCALL |ji| (QREFELT $ 9)))
                    (EXIT (RPLACD |xi| (SPADCALL |ji| (QREFELT $ 10)))))
               (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(DECLAIM (NOTINLINE |ParadoxicalCombinatorsForStreams;|)) 

(DEFUN |ParadoxicalCombinatorsForStreams| (#1=#:G116)
  (SPROG NIL
         (PROG (#2=#:G117)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ParadoxicalCombinatorsForStreams|)
                                               '|domainEqualList|)
                    . #3=(|ParadoxicalCombinatorsForStreams|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ParadoxicalCombinatorsForStreams;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ParadoxicalCombinatorsForStreams|)))))))))) 

(DEFUN |ParadoxicalCombinatorsForStreams;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ParadoxicalCombinatorsForStreams|))
          (LETT |dv$| (LIST '|ParadoxicalCombinatorsForStreams| DV$1) . #1#)
          (LETT $ (GETREFV 17) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ParadoxicalCombinatorsForStreams|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 |$UninitializedStream|)
          $))) 

(MAKEPROP '|ParadoxicalCombinatorsForStreams| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|UninitializedStream|
              (|Stream| 6) (0 . |frst|) (5 . |rst|) (|Mapping| 8 8)
              |YSTREAM;Y;MS;1| (|List| 8) (|Mapping| 13 13) (|Integer|)
              |YSTREAM;Y;MIL;2|)
           '#(Y 10) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(1 8 6 0 9 1 8 0 0 10 2 0 13
                                                   14 15 16 1 0 8 11 12)))))
           '|lookupComplete|)) 
