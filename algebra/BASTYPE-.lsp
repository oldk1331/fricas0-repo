
(DEFUN |BASTYPE-;~=;2SB;1| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 8)) 'NIL) ('T 'T))) 

(DECLAIM (NOTINLINE |BasicType&;|)) 

(DEFUN |BasicType&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|BasicType&|))
      (LETT |dv$| (LIST '|BasicType&| DV$1) . #1#)
      (LETT $ (GETREFV 10) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|BasicType&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . =)
              |BASTYPE-;~=;2SB;1|)
           '#(~= 6) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9
                                                 '(2 6 7 0 0 8 2 0 7 0 0 9)))))
           '|lookupComplete|)) 
