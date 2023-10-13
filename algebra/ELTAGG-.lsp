
(/VERSIONCHECK 2) 

(DEFUN |ELTAGG-;qelt;SDomIm;1| (|a| |x| $) (SPADCALL |a| |x| (QREFELT $ 9))) 

(DEFUN |ELTAGG-;qsetelt!;SDom2Im;2| (|a| |x| |y| $)
  (SPADCALL |a| |x| |y| (QREFELT $ 11))) 

(DEFUN |EltableAggregate&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|EltableAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|EltableAggregate&| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 13) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|shallowlyMutable|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 12
                  (CONS (|dispatchFunction| |ELTAGG-;qsetelt!;SDom2Im;2|) $))))
      $)))) 

(MAKEPROP '|EltableAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |elt|) |ELTAGG-;qelt;SDomIm;1| (6 . |setelt|)
              (13 . |qsetelt!|))
           '#(|qsetelt!| 20 |qelt| 27) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 12
                                                 '(2 6 8 0 7 9 3 6 8 0 7 8 11 3
                                                   0 8 0 7 8 12 3 0 8 0 7 8 12
                                                   2 0 8 0 7 10)))))
           '|lookupComplete|)) 
