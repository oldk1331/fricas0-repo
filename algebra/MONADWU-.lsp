
(SDEFUN |MONADWU-;one?;SB;1| ((|x| S) ($ |Boolean|))
        (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 9))) 

(SDEFUN |MONADWU-;^;SNniS;2| ((|x| S) (|n| |NonNegativeInteger|) ($ S))
        (COND ((ZEROP |n|) (|spadConstant| $ 7))
              ('T (SPADCALL |x| |n| (QREFELT $ 13))))) 

(SDEFUN |MONADWU-;rightPower;SNniS;3|
        ((|a| S) (|n| |NonNegativeInteger|) ($ S))
        (SPROG ((|res| (S)) (|i| NIL))
               (SEQ
                (COND ((ZEROP |n|) (|spadConstant| $ 7))
                      ('T
                       (SEQ
                        (LETT |res| (|spadConstant| $ 7)
                              . #1=(|MONADWU-;rightPower;SNniS;3|))
                        (SEQ (LETT |i| 1 . #1#) G190
                             (COND ((|greater_SI| |i| |n|) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res| (SPADCALL |res| |a| (QREFELT $ 16))
                                     . #1#)))
                             (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(SDEFUN |MONADWU-;leftPower;SNniS;4| ((|a| S) (|n| |NonNegativeInteger|) ($ S))
        (SPROG ((|res| (S)) (|i| NIL))
               (SEQ
                (COND ((ZEROP |n|) (|spadConstant| $ 7))
                      ('T
                       (SEQ
                        (LETT |res| (|spadConstant| $ 7)
                              . #1=(|MONADWU-;leftPower;SNniS;4|))
                        (SEQ (LETT |i| 1 . #1#) G190
                             (COND ((|greater_SI| |i| |n|) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res| (SPADCALL |a| |res| (QREFELT $ 16))
                                     . #1#)))
                             (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |MonadWithUnit&;|)) 

(DEFUN |MonadWithUnit&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|MonadWithUnit&|))
          (LETT |dv$| (LIST '|MonadWithUnit&| DV$1) . #1#)
          (LETT $ (GETREFV 19) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|MonadWithUnit&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Boolean|)
              (4 . =) |MONADWU-;one?;SB;1| (|PositiveInteger|)
              (|RepeatedSquaring| 6) (10 . |expt|) (|NonNegativeInteger|)
              |MONADWU-;^;SNniS;2| (16 . *) |MONADWU-;rightPower;SNniS;3|
              |MONADWU-;leftPower;SNniS;4|)
           '#(|rightPower| 22 |one?| 28 |leftPower| 33 ^ 39) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(0 6 0 7 2 6 8 0 0 9 2 12 6 6
                                                   11 13 2 6 0 0 0 16 2 0 0 0
                                                   14 17 1 0 8 0 10 2 0 0 0 14
                                                   18 2 0 0 0 14 15)))))
           '|lookupComplete|)) 
