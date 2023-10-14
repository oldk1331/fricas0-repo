
(DEFUN |BTAGG-;not;2S;1| (|v| $) (SPADCALL (ELT $ 8) |v| (QREFELT $ 10))) 

(DEFUN |BTAGG-;~;2S;2| (|v| $) (SPADCALL (ELT $ 12) |v| (QREFELT $ 10))) 

(DEFUN |BTAGG-;/\\;3S;3| (|v| |u| $)
  (SPADCALL (ELT $ 14) |v| |u| (QREFELT $ 16))) 

(DEFUN |BTAGG-;\\/;3S;4| (|v| |u| $)
  (SPADCALL (ELT $ 18) |v| |u| (QREFELT $ 16))) 

(DEFUN |BTAGG-;nand;3S;5| (|v| |u| $)
  (SPADCALL (ELT $ 20) |v| |u| (QREFELT $ 16))) 

(DEFUN |BTAGG-;nor;3S;6| (|v| |u| $)
  (SPADCALL (ELT $ 22) |v| |u| (QREFELT $ 16))) 

(DECLAIM (NOTINLINE |BitAggregate&;|)) 

(DEFUN |BitAggregate&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|BitAggregate&|))
      (LETT |dv$| (LIST '|BitAggregate&| DV$1) . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|BitAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . |not|)
              (|Mapping| 7 7) (5 . |map|) |BTAGG-;not;2S;1| (11 . ~)
              |BTAGG-;~;2S;2| (16 . |/\\|) (|Mapping| 7 7 7) (22 . |map|)
              |BTAGG-;/\\;3S;3| (29 . |\\/|) |BTAGG-;\\/;3S;4| (35 . |nand|)
              |BTAGG-;nand;3S;5| (41 . |nor|) |BTAGG-;nor;3S;6|)
           '#(~ 47 |not| 52 |nor| 57 |nand| 63 |\\/| 69 |/\\| 75) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 7 0 0 8 2 6 0 9 0 10 1 7 0
                                                   0 12 2 7 0 0 0 14 3 6 0 15 0
                                                   0 16 2 7 0 0 0 18 2 7 0 0 0
                                                   20 2 7 0 0 0 22 1 0 0 0 13 1
                                                   0 0 0 11 2 0 0 0 0 23 2 0 0
                                                   0 0 21 2 0 0 0 0 19 2 0 0 0
                                                   0 17)))))
           '|lookupComplete|)) 
