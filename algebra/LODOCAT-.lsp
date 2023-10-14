
(/VERSIONCHECK 2) 

(DEFUN |LODOCAT-;D;S;1| ($) (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 11))) 

(DEFUN |LODOCAT-;m1monom| (|n| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (LETT |a|
            (COND ((ODDP |n|) (SPADCALL (|spadConstant| $ 9) (QREFELT $ 13)))
                  ('T (|spadConstant| $ 9)))
            |LODOCAT-;m1monom|)
      (EXIT (SPADCALL |a| |n| (QREFELT $ 11))))))) 

(DEFUN |LODOCAT-;adjoint;2S;3| (|a| $)
  (PROG (|ans|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 14) . #1=(|LODOCAT-;adjoint;2S;3|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |a| (|spadConstant| $ 14) (QREFELT $ 17)))
                 (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL
                                 (|LODOCAT-;m1monom|
                                  (SPADCALL |a| (QREFELT $ 18)) $)
                                 (SPADCALL (SPADCALL |a| (QREFELT $ 19))
                                           (QREFELT $ 20))
                                 (QREFELT $ 21))
                                (QREFELT $ 22))
                      . #1#)
                (EXIT (LETT |a| (SPADCALL |a| (QREFELT $ 23)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |LODOCAT-;symmetricSquare;2S;4| (|l| $) (SPADCALL |l| 2 (QREFELT $ 25))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperatorCategory&;|)) 

(DEFUN |LinearOrdinaryDifferentialOperatorCategory&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|LinearOrdinaryDifferentialOperatorCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$|
            (LIST '|LinearOrdinaryDifferentialOperatorCategory&| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 27) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2| '(|Field|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 26
                  (CONS (|dispatchFunction| |LODOCAT-;symmetricSquare;2S;4|)
                        $))))
      $)))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperatorCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|NonNegativeInteger|) (8 . |monomial|)
              |LODOCAT-;D;S;1| (14 . -) (19 . |Zero|) (23 . |Zero|) (|Boolean|)
              (27 . ~=) (33 . |degree|) (38 . |leadingCoefficient|)
              (43 . |coerce|) (48 . *) (54 . +) (60 . |reductum|)
              |LODOCAT-;adjoint;2S;3| (65 . |symmetricPower|)
              (71 . |symmetricSquare|))
           '#(|symmetricSquare| 76 |adjoint| 81 D 86) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 26
                                                 '(0 6 0 8 0 7 0 9 2 6 0 7 10
                                                   11 1 7 0 0 13 0 6 0 14 0 7 0
                                                   15 2 6 16 0 0 17 1 6 10 0 18
                                                   1 6 7 0 19 1 6 0 7 20 2 6 0
                                                   0 0 21 2 6 0 0 0 22 1 6 0 0
                                                   23 2 6 0 0 10 25 1 0 0 0 26
                                                   1 0 0 0 26 1 0 0 0 24 0 0 0
                                                   12)))))
           '|lookupComplete|)) 
