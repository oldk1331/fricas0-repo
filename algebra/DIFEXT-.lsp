
(SDEFUN |DIFEXT-;differentiate;SMNniS;1|
        ((|x| S) (|derivation| |Mapping| R R) (|n| |NonNegativeInteger|) ($ S))
        (SPROG ((|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1 . #1=(|DIFEXT-;differentiate;SMNniS;1|)) G190
                     (COND ((|greater_SI| |i| |n|) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |x| (SPADCALL |x| |derivation| (QREFELT $ 9))
                             . #1#)))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |DIFEXT-;D;SMS;2| ((|x| S) (|derivation| |Mapping| R R) ($ S))
        (SPADCALL |x| |derivation| (QREFELT $ 9))) 

(SDEFUN |DIFEXT-;D;SMNniS;3|
        ((|x| S) (|derivation| |Mapping| R R) (|n| |NonNegativeInteger|) ($ S))
        (SPADCALL |x| |derivation| |n| (QREFELT $ 13))) 

(SDEFUN |DIFEXT-;differentiate;2S;4| ((|x| S) ($ S))
        (SPADCALL |x| (ELT $ 15) (QREFELT $ 9))) 

(SDEFUN |DIFEXT-;differentiate;SSS;5| ((|x| S) (|v| |Symbol|) ($ S))
        (SPROG NIL
               (SPADCALL |x|
                         (CONS #'|DIFEXT-;differentiate;SSS;5!0|
                               (VECTOR $ |v|))
                         (QREFELT $ 9)))) 

(SDEFUN |DIFEXT-;differentiate;SSS;5!0| ((|s| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|DIFEXT-;differentiate;SSS;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s| |v| (QREFELT $ 18)))))) 

(DECLAIM (NOTINLINE |DifferentialExtension&;|)) 

(DEFUN |DifferentialExtension&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DifferentialExtension&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|DifferentialExtension&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 22) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (QSETREFV $ 16
                      (CONS (|dispatchFunction| |DIFEXT-;differentiate;2S;4|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 19
                      (CONS (|dispatchFunction| |DIFEXT-;differentiate;SSS;5|)
                            $))))
          $))) 

(MAKEPROP '|DifferentialExtension&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Mapping| 7 7) (0 . |differentiate|) (|NonNegativeInteger|)
              |DIFEXT-;differentiate;SMNniS;1| |DIFEXT-;D;SMS;2|
              (6 . |differentiate|) |DIFEXT-;D;SMNniS;3| (13 . |differentiate|)
              (18 . |differentiate|) (|Symbol|) (23 . |differentiate|)
              (29 . |differentiate|) (|List| 17) (|List| 10))
           '#(|differentiate| 35 D 53) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(2 6 0 0 8 9 3 6 0 0 8 10 13
                                                   1 7 0 0 15 1 0 0 0 16 2 7 0
                                                   0 17 18 2 0 0 0 17 19 1 0 0
                                                   0 16 2 0 0 0 17 19 3 0 0 0 8
                                                   10 11 2 0 0 0 8 12 3 0 0 0 8
                                                   10 14)))))
           '|lookupComplete|)) 
