
(/VERSIONCHECK 2) 

(DEFUN |ELAGG-;delete;AIA;1| (|x| |i| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 8)) |i| (QREFELT $ 10))) 

(DEFUN |ELAGG-;delete;AUsA;2| (|x| |i| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 8)) |i| (QREFELT $ 13))) 

(DEFUN |ELAGG-;remove;M2A;3| (|f| |x| $)
  (SPADCALL |f| (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 16))) 

(DEFUN |ELAGG-;insert;SAIA;4| (|s| |x| |i| $)
  (SPADCALL |s| (SPADCALL |x| (QREFELT $ 8)) |i| (QREFELT $ 18))) 

(DEFUN |ELAGG-;insert;2AIA;5| (|w| |x| |i| $)
  (SPADCALL (SPADCALL |w| (QREFELT $ 8)) (SPADCALL |x| (QREFELT $ 8)) |i|
            (QREFELT $ 20))) 

(DEFUN |ELAGG-;select;M2A;6| (|f| |x| $)
  (SPADCALL |f| (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 22))) 

(DEFUN |ELAGG-;concat;3A;7| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 8)) |y| (QREFELT $ 24))) 

(DEFUN |ELAGG-;concat;ASA;8| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (SPADCALL 1 |y| (QREFELT $ 27))
            (QREFELT $ 24))) 

(DEFUN |ELAGG-;concat!;ASA;9| (|x| |y| $)
  (SPADCALL |x| (SPADCALL 1 |y| (QREFELT $ 27)) (QREFELT $ 24))) 

(DEFUN |ELAGG-;remove;S2A;10| (|s| |x| $)
  (SPADCALL |s| (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 30))) 

(DEFUN |ELAGG-;remove!;S2A;11| (|s| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|ELAGG-;remove!;S2A;11!0| (VECTOR $ |s|)) |x|
               (QREFELT $ 16))))) 

(DEFUN |ELAGG-;remove!;S2A;11!0| (|y| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|ELAGG-;remove!;S2A;11|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| |s| (QREFELT $ 33)))))) 

(DEFUN |ELAGG-;removeDuplicates;2A;12| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 35))) 

(DEFUN |ELAGG-;merge!;3A;13| (|x| |y| $)
  (SPADCALL (ELT $ 37) |x| |y| (QREFELT $ 39))) 

(DECLAIM (NOTINLINE |ExtensibleLinearAggregate&;|)) 

(DEFUN |ExtensibleLinearAggregate&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ExtensibleLinearAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ExtensibleLinearAggregate&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 42) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2| '(|OrderedSet|))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 31 (CONS (|dispatchFunction| |ELAGG-;remove;S2A;10|) $))
         (QSETREFV $ 34 (CONS (|dispatchFunction| |ELAGG-;remove!;S2A;11|) $))
         (QSETREFV $ 36
                   (CONS (|dispatchFunction| |ELAGG-;removeDuplicates;2A;12|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 40 (CONS (|dispatchFunction| |ELAGG-;merge!;3A;13|) $))))
      $)))) 

(MAKEPROP '|ExtensibleLinearAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |copy|) (|Integer|) (5 . |delete!|) |ELAGG-;delete;AIA;1|
              (|UniversalSegment| 9) (11 . |delete!|) |ELAGG-;delete;AUsA;2|
              (|Mapping| 32 7) (17 . |remove!|) |ELAGG-;remove;M2A;3|
              (23 . |insert!|) |ELAGG-;insert;SAIA;4| (30 . |insert!|)
              |ELAGG-;insert;2AIA;5| (37 . |select!|) |ELAGG-;select;M2A;6|
              (43 . |concat!|) |ELAGG-;concat;3A;7| (|NonNegativeInteger|)
              (49 . |new|) |ELAGG-;concat;ASA;8| |ELAGG-;concat!;ASA;9|
              (55 . |remove!|) (61 . |remove|) (|Boolean|) (67 . =)
              (73 . |remove!|) (79 . |removeDuplicates!|)
              (84 . |removeDuplicates|) (89 . <) (|Mapping| 32 7 7)
              (95 . |merge!|) (102 . |merge!|) (|List| $))
           '#(|select| 108 |removeDuplicates| 114 |remove!| 119 |remove| 125
              |merge!| 137 |insert| 143 |delete| 157 |concat!| 169 |concat|
              175)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 40
                                                 '(1 6 0 0 8 2 6 0 0 9 10 2 6 0
                                                   0 12 13 2 6 0 15 0 16 3 6 0
                                                   7 0 9 18 3 6 0 0 0 9 20 2 6
                                                   0 15 0 22 2 6 0 0 0 24 2 6 0
                                                   26 7 27 2 6 0 7 0 30 2 0 0 7
                                                   0 31 2 7 32 0 0 33 2 0 0 7 0
                                                   34 1 6 0 0 35 1 0 0 0 36 2 7
                                                   32 0 0 37 3 6 0 38 0 0 39 2
                                                   0 0 0 0 40 2 0 0 15 0 23 1 0
                                                   0 0 36 2 0 0 7 0 34 2 0 0 15
                                                   0 17 2 0 0 7 0 31 2 0 0 0 0
                                                   40 3 0 0 0 0 9 21 3 0 0 7 0
                                                   9 19 2 0 0 0 12 14 2 0 0 0 9
                                                   11 2 0 0 0 7 29 2 0 0 0 0 25
                                                   2 0 0 0 7 28)))))
           '|lookupComplete|)) 
