
(DEFUN |GRALG-;Zero;S;1| ($) (SPADCALL (|spadConstant| $ 9) (QREFELT $ 10))) 

(DEFUN |GRALG-;One;S;2| ($) (SPADCALL (|spadConstant| $ 12) (QREFELT $ 10))) 

(DEFUN |GRALG-;*;R2S;3| (|r| |x| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 10)) |x| (QREFELT $ 14))) 

(DEFUN |GRALG-;*;SRS;4| (|x| |r| $)
  (SPADCALL |x| (SPADCALL |r| (QREFELT $ 10)) (QREFELT $ 14))) 

(DECLAIM (NOTINLINE |GradedAlgebra&;|)) 

(DEFUN |GradedAlgebra&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GradedAlgebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|GradedAlgebra&| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 17) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND ((|domainEqual| |#2| |#1|))
            ('T
             (PROGN
              (QSETREFV $ 11 (CONS (|dispatchFunction| |GRALG-;Zero;S;1|) $))
              (QSETREFV $ 13 (CONS (|dispatchFunction| |GRALG-;One;S;2|) $))
              (QSETREFV $ 15 (CONS (|dispatchFunction| |GRALG-;*;R2S;3|) $))
              (QSETREFV $ 16 (CONS (|dispatchFunction| |GRALG-;*;SRS;4|) $)))))
      $)))) 

(MAKEPROP '|GradedAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |Zero|) (4 . |coerce|) (9 . |Zero|)
              (13 . |One|) (17 . |One|) (21 . |product|) (27 . *) (33 . *))
           '#(|Zero| 39 |One| 43 * 47) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(0 7 0 9 1 6 0 7 10 0 0 0 11
                                                   0 7 0 12 0 0 0 13 2 6 0 0 0
                                                   14 2 0 0 7 0 15 2 0 0 0 7 16
                                                   0 0 0 11 0 0 0 13 2 0 0 0 7
                                                   16 2 0 0 7 0 15)))))
           '|lookupComplete|)) 
