
(DEFUN |REPDB;double;Pi2S;1| (|n| |x| $)
  (COND ((EQL |n| 1) |x|)
        ((ODDP |n|)
         (SPADCALL |x|
                   (SPADCALL (ASH |n| -1) (SPADCALL |x| |x| (QREFELT $ 7))
                             (QREFELT $ 9))
                   (QREFELT $ 7)))
        ('T
         (SPADCALL (ASH |n| -1) (SPADCALL |x| |x| (QREFELT $ 7))
                   (QREFELT $ 9))))) 

(DECLAIM (NOTINLINE |RepeatedDoubling;|)) 

(DEFUN |RepeatedDoubling| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RepeatedDoubling|))
      (LETT |dv$| (LIST '|RepeatedDoubling| DV$1) . #1#)
      (LETT $ (GETREFV 10) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RepeatedDoubling| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . +)
              (|PositiveInteger|) |REPDB;double;Pi2S;1|)
           '#(|double| 6) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9
                                                 '(2 6 0 0 0 7 2 0 6 8 6 9)))))
           '|lookupComplete|)) 
