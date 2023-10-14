
(/VERSIONCHECK 2) 

(DEFUN |GRMOD-;-;3S;1| (|x| |y| $)
  (SPADCALL |x| (SPADCALL |y| (QREFELT $ 9)) (QREFELT $ 10))) 

(DECLAIM (NOTINLINE |GradedModule&;|)) 

(DEFUN |GradedModule&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GradedModule&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|GradedModule&| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 12) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|GradedModule&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . -) (5 . +) |GRMOD-;-;3S;1|)
           '#(- 11) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 11
                                                 '(1 6 0 0 9 2 6 0 0 0 10 2 0 0
                                                   0 0 11)))))
           '|lookupComplete|)) 
