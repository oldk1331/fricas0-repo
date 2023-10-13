
(/VERSIONCHECK 2) 

(DEFUN |ABELGRP-;-;3S;1| (|x| |y| $)
  (SPADCALL |x| (SPADCALL |y| (QREFELT $ 7)) (QREFELT $ 8))) 

(DEFUN |ABELGRP-;subtractIfCan;2SU;2| (|x| |y| $)
  (CONS 0 (SPADCALL |x| |y| (QREFELT $ 10)))) 

(DEFUN |ABELGRP-;*;Nni2S;3| (|n| |x| $) (SPADCALL |n| |x| (QREFELT $ 14))) 

(DEFUN |ABELGRP-;*;I2S;4| (|n| |x| $)
  (COND ((ZEROP |n|) (|spadConstant| $ 17))
        ((SPADCALL |n| 0 (QREFELT $ 19)) (SPADCALL |n| |x| (QREFELT $ 22)))
        ('T (SPADCALL (- |n|) (SPADCALL |x| (QREFELT $ 7)) (QREFELT $ 22))))) 

(DEFUN |AbelianGroup&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AbelianGroup&|))
      (LETT |dv$| (LIST '|AbelianGroup&| DV$1) . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND ((|HasCategory| |#1| '(|Ring|)))
            ('T
             (QSETREFV $ 23 (CONS (|dispatchFunction| |ABELGRP-;*;I2S;4|) $))))
      $)))) 

(MAKEPROP '|AbelianGroup&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . -) (5 . +)
              |ABELGRP-;-;3S;1| (11 . -) (|Union| $ '"failed")
              |ABELGRP-;subtractIfCan;2SU;2| (|Integer|) (17 . *)
              (|NonNegativeInteger|) |ABELGRP-;*;Nni2S;3| (23 . |Zero|)
              (|Boolean|) (27 . >) (|PositiveInteger|) (|RepeatedDoubling| 6)
              (33 . |double|) (39 . *))
           '#(|subtractIfCan| 45 - 51 * 57) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 6 0 0 7 2 6 0 0 0 8 2 6 0
                                                   0 0 10 2 6 0 13 0 14 0 6 0
                                                   17 2 13 18 0 0 19 2 21 6 20
                                                   6 22 2 0 0 13 0 23 2 0 11 0
                                                   0 12 2 0 0 0 0 9 2 0 0 13 0
                                                   23 2 0 0 15 0 16)))))
           '|lookupComplete|)) 
