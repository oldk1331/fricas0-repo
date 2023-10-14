
(DEFUN |NARNG-;associator;4S;1| (|x| |y| |z| $)
  (SPADCALL (SPADCALL (SPADCALL |x| |y| (QREFELT $ 7)) |z| (QREFELT $ 7))
            (SPADCALL |x| (SPADCALL |y| |z| (QREFELT $ 7)) (QREFELT $ 7))
            (QREFELT $ 8))) 

(DEFUN |NARNG-;commutator;3S;2| (|x| |y| $)
  (SPADCALL (SPADCALL |x| |y| (QREFELT $ 7)) (SPADCALL |y| |x| (QREFELT $ 7))
            (QREFELT $ 8))) 

(DEFUN |NARNG-;antiCommutator;3S;3| (|x| |y| $)
  (SPADCALL (SPADCALL |x| |y| (QREFELT $ 7)) (SPADCALL |y| |x| (QREFELT $ 7))
            (QREFELT $ 11))) 

(DECLAIM (NOTINLINE |NonAssociativeRng&;|)) 

(DEFUN |NonAssociativeRng&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|NonAssociativeRng&|))
      (LETT |dv$| (LIST '|NonAssociativeRng&| DV$1) . #1#)
      (LETT $ (GETREFV 13) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NonAssociativeRng&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . *) (6 . -)
              |NARNG-;associator;4S;1| |NARNG-;commutator;3S;2| (12 . +)
              |NARNG-;antiCommutator;3S;3|)
           '#(|commutator| 18 |associator| 24 |antiCommutator| 31) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 12
                                                 '(2 6 0 0 0 7 2 6 0 0 0 8 2 6
                                                   0 0 0 11 2 0 0 0 0 10 3 0 0
                                                   0 0 0 9 2 0 0 0 0 12)))))
           '|lookupComplete|)) 
