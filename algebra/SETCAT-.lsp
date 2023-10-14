
(/VERSIONCHECK 2) 

(DEFUN |SETCAT-;hash;SSi;1| (|s| $)
  (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 8)) |s| (QREFELT $ 9))
            (QREFELT $ 11))) 

(PUT '|SETCAT-;latex;SS;2| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(DEFUN |SETCAT-;latex;SS;2| (|s| $) "\\mbox{\\bf Unimplemented}") 

(DEFUN |SetCategory&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SetCategory&|))
      (LETT |dv$| (LIST '|SetCategory&| DV$1) . #1#)
      (LETT $ (GETREFV 15) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SetCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|HashState|) (0 . |new|)
              (4 . |hashUpdate!|) (|SingleInteger|) (10 . |value|)
              |SETCAT-;hash;SSi;1| (|String|) |SETCAT-;latex;SS;2|)
           '#(|latex| 15 |hash| 20) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 14
                                                 '(0 7 0 8 2 6 7 7 0 9 1 7 10 0
                                                   11 1 0 13 0 14 1 0 10 0
                                                   12)))))
           '|lookupComplete|)) 
