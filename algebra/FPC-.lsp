
(SDEFUN |FPC-;primeFrobenius;2S;1| ((|a| S) ($ S))
        (SPADCALL |a| (SPADCALL (QREFELT $ 8)) (QREFELT $ 11))) 

(SDEFUN |FPC-;primeFrobenius;SNniS;2|
        ((|a| S) (|s| |NonNegativeInteger|) ($ S))
        (SPADCALL |a| (EXPT (SPADCALL (QREFELT $ 8)) |s|) (QREFELT $ 11))) 

(DECLAIM (NOTINLINE |FieldOfPrimeCharacteristic&;|)) 

(DEFUN |FieldOfPrimeCharacteristic&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FieldOfPrimeCharacteristic&|))
          (LETT |dv$| (LIST '|FieldOfPrimeCharacteristic&| DV$1) . #1#)
          (LETT $ (GETREFV 14) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FieldOfPrimeCharacteristic&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . |characteristic|) (|Integer|) (4 . |characteristic|) (8 . ^)
              |FPC-;primeFrobenius;2S;1| |FPC-;primeFrobenius;SNniS;2|)
           '#(|primeFrobenius| 14) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 13
                                                 '(0 6 7 8 0 9 7 10 2 6 0 0 7
                                                   11 1 0 0 0 12 2 0 0 0 7
                                                   13)))))
           '|lookupComplete|)) 
