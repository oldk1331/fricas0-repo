
(DEFUN |ORDSET-;smaller?;2SB;1| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 8))) 

(DEFUN |ORDSET-;max;3S;2| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 10)) |x|) ('T |y|))) 

(DEFUN |ORDSET-;min;3S;3| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 10)) |y|) ('T |x|))) 

(DEFUN |ORDSET-;>;2SB;4| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 8))) 

(DEFUN |ORDSET-;>=;2SB;5| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 8)) 'NIL) ('T 'T))) 

(DEFUN |ORDSET-;<=;2SB;6| (|x| |y| $)
  (COND ((SPADCALL |y| |x| (QREFELT $ 8)) 'NIL) ('T 'T))) 

(DECLAIM (NOTINLINE |OrderedSet&;|)) 

(DEFUN |OrderedSet&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|OrderedSet&|))
      (LETT |dv$| (LIST '|OrderedSet&| DV$1) . #1#)
      (LETT $ (GETREFV 16) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|OrderedSet&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . <)
              |ORDSET-;smaller?;2SB;1| (6 . >) |ORDSET-;max;3S;2|
              |ORDSET-;min;3S;3| |ORDSET-;>;2SB;4| |ORDSET-;>=;2SB;5|
              |ORDSET-;<=;2SB;6|)
           '#(|smaller?| 12 |min| 18 |max| 24 >= 30 > 36 <= 42) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 15
                                                 '(2 6 7 0 0 8 2 6 7 0 0 10 2 0
                                                   7 0 0 9 2 0 0 0 0 12 2 0 0 0
                                                   0 11 2 0 7 0 0 14 2 0 7 0 0
                                                   13 2 0 7 0 0 15)))))
           '|lookupComplete|)) 
