
(/VERSIONCHECK 2) 

(DEFUN |RADCAT-;sqrt;2S;1| (|x| $)
  (SPADCALL |x| (SPADCALL (SPADCALL 2 (QREFELT $ 9)) (QREFELT $ 10))
            (QREFELT $ 11))) 

(DEFUN |RADCAT-;nthRoot;SIS;2| (|x| |n| $)
  (SPADCALL |x| (SPADCALL (SPADCALL |n| (QREFELT $ 9)) (QREFELT $ 10))
            (QREFELT $ 11))) 

(DEFUN |RadicalCategory&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RadicalCategory&|))
      (LETT |dv$| (LIST '|RadicalCategory&| DV$1) . #1#)
      (LETT $ (GETREFV 14) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RadicalCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|Fraction| 7)
              (0 . |coerce|) (5 . |inv|) (10 . ^) |RADCAT-;sqrt;2S;1|
              |RADCAT-;nthRoot;SIS;2|)
           '#(|sqrt| 16 |nthRoot| 21) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 13
                                                 '(1 8 0 7 9 1 8 0 0 10 2 6 0 0
                                                   8 11 1 0 0 0 12 2 0 0 0 7
                                                   13)))))
           '|lookupComplete|)) 
