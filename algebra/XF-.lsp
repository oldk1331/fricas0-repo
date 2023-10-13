
(/VERSIONCHECK 2) 

(DEFUN |XF-;algebraic?;SB;1| (|a| $)
  (COND ((SPADCALL (SPADCALL |a| (QREFELT $ 9)) (QREFELT $ 11)) 'NIL) ('T 'T))) 

(DEFUN |XF-;transcendent?;SB;2| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 9)) (QREFELT $ 11))) 

(DEFUN |XF-;Frobenius;2S;3| (|a| $)
  (SPADCALL |a| (SPADCALL (QREFELT $ 15)) (QREFELT $ 16))) 

(DEFUN |XF-;Frobenius;SNniS;4| (|a| |s| $)
  (SPADCALL |a| (EXPT (SPADCALL (QREFELT $ 15)) |s|) (QREFELT $ 16))) 

(DEFUN |ExtensionField&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ExtensionField&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ExtensionField&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#2| '(|Finite|))
                                               (|HasCategory| |#2|
                                                              '(|CharacteristicNonZero|))
                                               (|HasCategory| |#2|
                                                              '(|CharacteristicZero|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 17 (CONS (|dispatchFunction| |XF-;Frobenius;2S;3|) $))
         (QSETREFV $ 18
                   (CONS (|dispatchFunction| |XF-;Frobenius;SNniS;4|) $)))))
      $)))) 

(MAKEPROP '|ExtensionField&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|OnePointCompletion| (|PositiveInteger|)) (0 . |degree|)
              (|Boolean|) (5 . |infinite?|) |XF-;algebraic?;SB;1|
              |XF-;transcendent?;SB;2| (|NonNegativeInteger|) (10 . |size|)
              (14 . ^) (20 . |Frobenius|) (25 . |Frobenius|))
           '#(|transcendent?| 31 |algebraic?| 36 |Frobenius| 41) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(1 6 8 0 9 1 8 10 0 11 0 7 14
                                                   15 2 6 0 0 14 16 1 0 0 0 17
                                                   2 0 0 0 14 18 1 0 10 0 13 1
                                                   0 10 0 12 1 0 0 0 17 2 0 0 0
                                                   14 18)))))
           '|lookupComplete|)) 
