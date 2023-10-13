
(/VERSIONCHECK 2) 

(DEFUN |NASRING-;coerce;IS;1| (|n| $)
  (SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 9))) 

(DEFUN |NonAssociativeRing&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|NonAssociativeRing&|))
      (LETT |dv$| (LIST '|NonAssociativeRing&| DV$1) . #1#)
      (LETT $ (GETREFV 12) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NonAssociativeRing&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Integer|)
              (4 . *) |NASRING-;coerce;IS;1| (|OutputForm|))
           '#(|coerce| 10) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(0 6 0 7 2 6 0 8 0 9 1 0 0 8
                                                   10)))))
           '|lookupComplete|)) 
