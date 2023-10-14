
(/VERSIONCHECK 2) 

(DEFUN |LOGIC-;\\/;3S;1| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 7)) (SPADCALL |y| (QREFELT $ 7))
             (QREFELT $ 8))
   (QREFELT $ 7))) 

(DECLAIM (NOTINLINE |Logic&;|)) 

(DEFUN |Logic&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Logic&|))
      (LETT |dv$| (LIST '|Logic&| DV$1) . #1#)
      (LETT $ (GETREFV 10) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Logic&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . ~) (5 . |/\\|)
              |LOGIC-;\\/;3S;1|)
           '#(|\\/| 11) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9
                                                 '(1 6 0 0 7 2 6 0 0 0 8 2 0 0
                                                   0 0 9)))))
           '|lookupComplete|)) 
