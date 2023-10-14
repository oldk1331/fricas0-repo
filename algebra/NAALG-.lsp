
(DEFUN |NAALG-;plenaryPower;SPiS;1| (|a| |n| $)
  (PROG (|n1| #1=#:G112 #2=#:G111)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) |a|)
            ('T
             (SEQ
              (LETT |n1|
                    (PROG1
                        (LETT #1#
                              (PROG1
                                  (LETT #2# (- |n| 1)
                                        . #3=(|NAALG-;plenaryPower;SPiS;1|))
                                (|check_subtype| (>= #2# 0)
                                                 '(|NonNegativeInteger|) #2#))
                              . #3#)
                      (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                    . #3#)
              (EXIT
               (SPADCALL (SPADCALL |a| |n1| (QREFELT $ 10))
                         (SPADCALL |a| |n1| (QREFELT $ 10))
                         (QREFELT $ 11)))))))))) 

(DECLAIM (NOTINLINE |NonAssociativeAlgebra&;|)) 

(DEFUN |NonAssociativeAlgebra&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|NonAssociativeAlgebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|NonAssociativeAlgebra&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 13) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NonAssociativeAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (|PositiveInteger|) (4 . |plenaryPower|) (10 . *)
              |NAALG-;plenaryPower;SPiS;1|)
           '#(|plenaryPower| 16) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 12
                                                 '(0 7 0 8 2 6 0 0 9 10 2 6 0 0
                                                   0 11 2 0 0 0 9 12)))))
           '|lookupComplete|)) 
