
(/VERSIONCHECK 2) 

(DEFUN |MODULE-;*;SRS;1| (|x| |r| $) (SPADCALL |r| |x| (QREFELT $ 8))) 

(DEFUN |Module&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Module&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|Module&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 13) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND ((|domainEqual| |#2| |#1|))
            ('T
             (QSETREFV $ 9 (CONS (|dispatchFunction| |MODULE-;*;SRS;1|) $))))
      $)))) 

(MAKEPROP '|Module&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . *)
              (6 . *) (|Integer|) (|NonNegativeInteger|) (|PositiveInteger|))
           '#(* 12) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9
                                                 '(2 6 0 7 0 8 2 0 0 0 7 9 2 0
                                                   0 0 7 9)))))
           '|lookupComplete|)) 
