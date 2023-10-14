
(/VERSIONCHECK 2) 

(DEFUN |PORDER-;>=;2SB;1| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 8))) 

(DEFUN |PORDER-;>;2SB;2| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 10))) 

(DEFUN |PORDER-;<;2SB;3| (|x| |y| $)
  (COND
   ((SPADCALL |x| |y| (QREFELT $ 8))
    (COND ((SPADCALL |y| |x| (QREFELT $ 8)) 'NIL) (#1='T 'T)))
   (#1# 'NIL))) 

(DECLAIM (NOTINLINE |PartialOrder&;|)) 

(DEFUN |PartialOrder&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PartialOrder&|))
      (LETT |dv$| (LIST '|PartialOrder&| DV$1) . #1#)
      (LETT $ (GETREFV 13) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PartialOrder&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . <=)
              |PORDER-;>=;2SB;1| (6 . <) |PORDER-;>;2SB;2| |PORDER-;<;2SB;3|)
           '#(>= 12 > 18 < 24) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 12
                                                 '(2 6 7 0 0 8 2 6 7 0 0 10 2 0
                                                   7 0 0 9 2 0 7 0 0 11 2 0 7 0
                                                   0 12)))))
           '|lookupComplete|)) 
