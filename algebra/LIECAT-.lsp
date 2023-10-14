
(/VERSIONCHECK 2) 

(DEFUN |LIECAT-;/;SRS;1| (|x| |r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 8)) |x| (QREFELT $ 9))) 

(DECLAIM (NOTINLINE |LieAlgebra&;|)) 

(DEFUN |LieAlgebra&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LieAlgebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|LieAlgebra&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 11) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2| '(|Field|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 10 (CONS (|dispatchFunction| |LIECAT-;/;SRS;1|) $))))
      $)))) 

(MAKEPROP '|LieAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |inv|)
              (5 . *) (11 . /))
           '#(/ 17) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(1 7 0 0 8 2 6 0 7 0 9 2 0 0
                                                   0 7 10 2 0 0 0 7 10)))))
           '|lookupComplete|)) 
