
(/VERSIONCHECK 2) 

(DEFUN |YSTREAM;Y;MS;1| (|f| $)
  (PROG (|j| |y|)
    (RETURN
     (SEQ (LETT |y| (CONS (QREFELT $ 7) 0) . #1=(|YSTREAM;Y;MS;1|))
          (LETT |j| (SPADCALL |y| |f|) . #1#)
          (RPLACA |y| (SPADCALL |j| (QREFELT $ 9)))
          (RPLACD |y| (SPADCALL |j| (QREFELT $ 10))) (EXIT |y|))))) 

(DEFUN |YSTREAM;Y;MIL;2| (|g| |n| $)
  (PROG (#1=#:G113 |xi| #2=#:G114 |ji| |j| |x| |i| #3=#:G112)
    (RETURN
     (SEQ
      (LETT |x|
            (PROGN
             (LETT #3# NIL . #4=(|YSTREAM;Y;MIL;2|))
             (SEQ (LETT |i| 1 . #4#) G190
                  (COND ((|greater_SI| |i| |n|) (GO G191)))
                  (SEQ
                   (EXIT (LETT #3# (CONS (CONS (QREFELT $ 7) 0) #3#) . #4#)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            . #4#)
      (LETT |j| (SPADCALL |x| |g|) . #4#)
      (SEQ (LETT |ji| NIL . #4#) (LETT #2# |j| . #4#) (LETT |xi| NIL . #4#)
           (LETT #1# |x| . #4#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |xi| (CAR #1#) . #4#) NIL) (ATOM #2#)
                 (PROGN (LETT |ji| (CAR #2#) . #4#) NIL))
             (GO G191)))
           (SEQ (RPLACA |xi| (SPADCALL |ji| (QREFELT $ 9)))
                (EXIT (RPLACD |xi| (SPADCALL |ji| (QREFELT $ 10)))))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DECLAIM (NOTINLINE |ParadoxicalCombinatorsForStreams;|)) 

(DEFUN |ParadoxicalCombinatorsForStreams| (#1=#:G115)
  (PROG ()
    (RETURN
     (PROG (#2=#:G116)
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
                    '|ParadoxicalCombinatorsForStreams|))))))))))) 

(DEFUN |ParadoxicalCombinatorsForStreams;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ParadoxicalCombinatorsForStreams|))
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
      $)))) 

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
