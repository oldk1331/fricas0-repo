
(/VERSIONCHECK 2) 

(PUT '|AGG-;eq?;2SB;1| '|SPADreplace| 'EQ) 

(DEFUN |AGG-;eq?;2SB;1| (|a| |b| $) (EQ |a| |b|)) 

(DEFUN |AGG-;sample;S;2| ($) (SPADCALL (QREFELT $ 9))) 

(DEFUN |AGG-;empty?;SB;3| (|a| $) (EQL (SPADCALL |a| (QREFELT $ 12)) 0)) 

(DEFUN |AGG-;less?;SNniB;4| (|a| |n| $) (< (SPADCALL |a| (QREFELT $ 12)) |n|)) 

(DEFUN |AGG-;more?;SNniB;5| (|a| |n| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 12)) |n| (QREFELT $ 15))) 

(DEFUN |AGG-;size?;SNniB;6| (|a| |n| $) (EQL (SPADCALL |a| (QREFELT $ 12)) |n|)) 

(DEFUN |Aggregate&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Aggregate&|))
      (LETT |dv$| (LIST '|Aggregate&| DV$1) . #1#)
      (LETT $ (GETREFV 18) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|finiteAggregate|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 13 (CONS (|dispatchFunction| |AGG-;empty?;SB;3|) $))
         (QSETREFV $ 14 (CONS (|dispatchFunction| |AGG-;less?;SNniB;4|) $))
         (QSETREFV $ 16 (CONS (|dispatchFunction| |AGG-;more?;SNniB;5|) $))
         (QSETREFV $ 17 (CONS (|dispatchFunction| |AGG-;size?;SNniB;6|) $)))))
      $)))) 

(MAKEPROP '|Aggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              |AGG-;eq?;2SB;1| (0 . |empty|) |AGG-;sample;S;2|
              (|NonNegativeInteger|) (4 . |#|) (9 . |empty?|) (14 . |less?|)
              (20 . >) (26 . |more?|) (32 . |size?|))
           '#(|size?| 38 |sample| 44 |more?| 48 |less?| 54 |eq?| 60 |empty?|
              66)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(0 6 0 9 1 6 11 0 12 1 0 7 0
                                                   13 2 0 7 0 11 14 2 11 7 0 0
                                                   15 2 0 7 0 11 16 2 0 7 0 11
                                                   17 2 0 7 0 11 17 0 0 0 10 2
                                                   0 7 0 11 16 2 0 7 0 11 14 2
                                                   0 7 0 0 8 1 0 7 0 13)))))
           '|lookupComplete|)) 
