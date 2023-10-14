
(DEFUN |FEVALAB-;elt;SRS;1| (|x| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|FEVALAB-;elt;SRS;1!0| (VECTOR $ |r|)) |x|
               (QREFELT $ 10))))) 

(DEFUN |FEVALAB-;elt;SRS;1!0| (|y| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|FEVALAB-;elt;SRS;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| |r| (QREFELT $ 8)))))) 

(DEFUN |FEVALAB-;eval;SLS;2| (|x| |l| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|FEVALAB-;eval;SLS;2!0| (VECTOR $ |l|)) |x|
               (QREFELT $ 10))))) 

(DEFUN |FEVALAB-;eval;SLS;2!0| (|y| $$)
  (PROG (|l| $)
    (LETT |l| (QREFELT $$ 1) . #1=(|FEVALAB-;eval;SLS;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| |l| (QREFELT $ 13)))))) 

(DEFUN |FEVALAB-;eval;SLLS;3| (|x| |ls| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|FEVALAB-;eval;SLLS;3!0| (VECTOR $ |lv| |ls|)) |x|
               (QREFELT $ 10))))) 

(DEFUN |FEVALAB-;eval;SLLS;3!0| (|y| $$)
  (PROG (|ls| |lv| $)
    (LETT |ls| (QREFELT $$ 2) . #1=(|FEVALAB-;eval;SLLS;3|))
    (LETT |lv| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| |ls| |lv| (QREFELT $ 17)))))) 

(DECLAIM (NOTINLINE |FullyEvalableOver&;|)) 

(DEFUN |FullyEvalableOver&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FullyEvalableOver&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FullyEvalableOver&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         (LIST '|InnerEvalable|
                                                               '(|Symbol|)
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         (LIST '|Eltable|
                                                               (|devaluate|
                                                                |#2|)
                                                               (|devaluate|
                                                                |#2|)))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 11 (CONS (|dispatchFunction| |FEVALAB-;elt;SRS;1|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 14 (CONS (|dispatchFunction| |FEVALAB-;eval;SLS;2|) $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 18 (CONS (|dispatchFunction| |FEVALAB-;eval;SLLS;3|) $))))
      $)))) 

(MAKEPROP '|FullyEvalableOver&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |elt|)
              (|Mapping| 7 7) (6 . |map|) (12 . |elt|) (|List| 19)
              (18 . |eval|) (24 . |eval|) (|List| 20) (|List| 7) (30 . |eval|)
              (37 . |eval|) (|Equation| 7) (|Symbol|))
           '#(|eval| 44 |elt| 57) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(2 7 7 0 7 8 2 6 0 9 0 10 2 0
                                                   0 0 7 11 2 7 0 0 12 13 2 0 0
                                                   0 12 14 3 7 0 0 15 16 17 3 0
                                                   0 0 15 16 18 2 0 0 0 12 14 3
                                                   0 0 0 15 16 18 2 0 0 0 7
                                                   11)))))
           '|lookupComplete|)) 
