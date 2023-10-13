
(/VERSIONCHECK 2) 

(DEFUN |MTSCAT-;coefficient;SVarNniS;1| (|s| |v| |n| $)
  (SPADCALL |s| (LIST |v|) (LIST |n|) (QREFELT $ 11))) 

(DEFUN |MultivariateTaylorSeriesCategory&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MultivariateTaylorSeriesCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|MultivariateTaylorSeriesCategory&| DV$1 DV$2 DV$3)
            . #1#)
      (LETT $ (GETREFV 15) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MultivariateTaylorSeriesCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|List| 8) (|List| 12) (0 . |coefficient|)
              (|NonNegativeInteger|) |MTSCAT-;coefficient;SVarNniS;1|
              (|IndexedExponents| 8))
           '#(|coefficient| 7) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 13
                                                 '(3 6 0 0 9 10 11 3 0 0 0 8 12
                                                   13)))))
           '|lookupComplete|)) 
