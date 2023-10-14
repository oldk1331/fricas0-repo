
(/VERSIONCHECK 2) 

(DEFUN |IEVALAB-;eval;SABS;1| (|f| |x| |v| $)
  (SPADCALL |f| (LIST |x|) (LIST |v|) (QREFELT $ 11))) 

(DECLAIM (NOTINLINE |InnerEvalable&;|)) 

(DEFUN |InnerEvalable&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerEvalable&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|InnerEvalable&| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 13) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|InnerEvalable&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|List| 7) (|List| 8) (0 . |eval|)
              |IEVALAB-;eval;SABS;1|)
           '#(|eval| 7) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 12
                                                 '(3 6 0 0 9 10 11 3 0 0 0 7 8
                                                   12)))))
           '|lookupComplete|)) 
