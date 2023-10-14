
(/VERSIONCHECK 2) 

(DEFUN |REPSQ;expt;SPiS;1| (|x| |n| $)
  (COND ((EQL |n| 1) |x|)
        ((ODDP |n|)
         (SPADCALL |x|
                   (SPADCALL (SPADCALL |x| |x| (QREFELT $ 7)) (ASH |n| -1)
                             (QREFELT $ 9))
                   (QREFELT $ 7)))
        ('T
         (SPADCALL (SPADCALL |x| |x| (QREFELT $ 7)) (ASH |n| -1)
                   (QREFELT $ 9))))) 

(DECLAIM (NOTINLINE |RepeatedSquaring;|)) 

(DEFUN |RepeatedSquaring| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RepeatedSquaring|))
      (LETT |dv$| (LIST '|RepeatedSquaring| DV$1) . #1#)
      (LETT $ (GETREFV 10) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RepeatedSquaring| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . *)
              (|PositiveInteger|) |REPSQ;expt;SPiS;1|)
           '#(|expt| 6) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9
                                                 '(2 6 0 0 0 7 2 0 6 6 8 9)))))
           '|lookupComplete|)) 
