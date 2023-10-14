
(/VERSIONCHECK 2) 

(DEFUN |ALGEBRA-;coerce;RS;1| (|x| $)
  (SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 9))) 

(DECLAIM (NOTINLINE |Algebra&;|)) 

(DEFUN |Algebra&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Algebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|Algebra&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 13) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Algebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . *) |ALGEBRA-;coerce;RS;1| (|OutputForm|) (|Integer|))
           '#(|coerce| 10) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(0 6 0 8 2 6 0 7 0 9 1 0 0 7
                                                   10)))))
           '|lookupComplete|)) 
