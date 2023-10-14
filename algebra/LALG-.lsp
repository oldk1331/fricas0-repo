
(/VERSIONCHECK 2) 

(DEFUN |LALG-;coerce;RS;1| (|x| $)
  (SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 9))) 

(DECLAIM (NOTINLINE |LeftAlgebra&;|)) 

(DEFUN |LeftAlgebra&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LeftAlgebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|LeftAlgebra&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 13) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|LeftAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . *) |LALG-;coerce;RS;1| (|OutputForm|) (|Integer|))
           '#(|coerce| 10) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(0 6 0 8 2 6 0 7 0 9 1 0 0 7
                                                   10)))))
           '|lookupComplete|)) 
