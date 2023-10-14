
(SDEFUN |SRAGG-;trim;SCS;1| ((|s| S) (|c| |Character|) ($ S))
        (SPADCALL (SPADCALL |s| |c| (QREFELT $ 8)) |c| (QREFELT $ 9))) 

(SDEFUN |SRAGG-;trim;SCcS;2| ((|s| S) (|cc| |CharacterClass|) ($ S))
        (SPADCALL (SPADCALL |s| |cc| (QREFELT $ 12)) |cc| (QREFELT $ 13))) 

(SDEFUN |SRAGG-;lowerCase;2S;3| ((|s| S) ($ S))
        (SPADCALL (SPADCALL |s| (QREFELT $ 15)) (QREFELT $ 16))) 

(SDEFUN |SRAGG-;upperCase;2S;4| ((|s| S) ($ S))
        (SPADCALL (SPADCALL |s| (QREFELT $ 15)) (QREFELT $ 18))) 

(SDEFUN |SRAGG-;prefix?;2SB;5| ((|s| S) (|t| S) ($ |Boolean|))
        (SPADCALL |s| |t| (SPADCALL |t| (QREFELT $ 21)) (QREFELT $ 23))) 

(SDEFUN |SRAGG-;coerce;CS;6| ((|c| |Character|) ($ S))
        (SPADCALL 1 |c| (QREFELT $ 26))) 

(SDEFUN |SRAGG-;elt;3S;7| ((|s| S) (|t| S) ($ S))
        (SPADCALL |s| |t| (QREFELT $ 28))) 

(DECLAIM (NOTINLINE |StringAggregate&;|)) 

(DEFUN |StringAggregate&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|StringAggregate&|))
          (LETT |dv$| (LIST '|StringAggregate&| DV$1) . #1#)
          (LETT $ (GETREFV 32) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|StringAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Character|)
              (0 . |rightTrim|) (6 . |leftTrim|) |SRAGG-;trim;SCS;1|
              (|CharacterClass|) (12 . |rightTrim|) (18 . |leftTrim|)
              |SRAGG-;trim;SCcS;2| (24 . |copy|) (29 . |lowerCase!|)
              |SRAGG-;lowerCase;2S;3| (34 . |upperCase!|)
              |SRAGG-;upperCase;2S;4| (|Integer|) (39 . |minIndex|) (|Boolean|)
              (44 . |substring?|) |SRAGG-;prefix?;2SB;5| (|NonNegativeInteger|)
              (51 . |new|) |SRAGG-;coerce;CS;6| (57 . |concat|)
              |SRAGG-;elt;3S;7| (|OutputForm|) (|UniversalSegment| 20))
           '#(|upperCase| 63 |trim| 68 |prefix?| 80 |lowerCase| 86 |elt| 91
              |coerce| 97)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 29
                                                 '(2 6 0 0 7 8 2 6 0 0 7 9 2 6
                                                   0 0 11 12 2 6 0 0 11 13 1 6
                                                   0 0 15 1 6 0 0 16 1 6 0 0 18
                                                   1 6 20 0 21 3 6 22 0 0 20 23
                                                   2 6 0 25 7 26 2 6 0 0 0 28 1
                                                   0 0 0 19 2 0 0 0 11 14 2 0 0
                                                   0 7 10 2 0 22 0 0 24 1 0 0 0
                                                   17 2 0 0 0 0 29 1 0 0 7
                                                   27)))))
           '|lookupComplete|)) 
