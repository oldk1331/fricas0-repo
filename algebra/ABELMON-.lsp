
(/VERSIONCHECK 2) 

(DEFUN |ABELMON-;zero?;SB;1| (|x| $)
  (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 9))) 

(DEFUN |ABELMON-;*;Pi2S;2| (|n| |x| $) (SPADCALL |n| |x| (QREFELT $ 12))) 

(DEFUN |ABELMON-;sample;S;3| ($) (|spadConstant| $ 7)) 

(DEFUN |ABELMON-;*;Nni2S;4| (|n| |x| $)
  (COND ((ZEROP |n|) (|spadConstant| $ 7))
        ('T (SPADCALL |n| |x| (QREFELT $ 17))))) 

(DEFUN |ABELMON-;opposite?;2SB;5| (|x| |y| $)
  (SPADCALL (SPADCALL |x| |y| (QREFELT $ 19)) (QREFELT $ 20))) 

(DECLAIM (NOTINLINE |AbelianMonoid&;|)) 

(DEFUN |AbelianMonoid&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AbelianMonoid&|))
      (LETT |dv$| (LIST '|AbelianMonoid&| DV$1) . #1#)
      (LETT $ (GETREFV 22) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND ((|HasCategory| |#1| '(|Ring|)))
            ('T
             (QSETREFV $ 18
                       (CONS (|dispatchFunction| |ABELMON-;*;Nni2S;4|) $))))
      $)))) 

(MAKEPROP '|AbelianMonoid&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (|Boolean|)
              (4 . =) |ABELMON-;zero?;SB;1| (|NonNegativeInteger|) (10 . *)
              (|PositiveInteger|) |ABELMON-;*;Pi2S;2| |ABELMON-;sample;S;3|
              (|RepeatedDoubling| 6) (16 . |double|) (22 . *) (28 . +)
              (34 . |zero?|) |ABELMON-;opposite?;2SB;5|)
           '#(|zero?| 39 |sample| 44 |opposite?| 48 * 54) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(0 6 0 7 2 6 8 0 0 9 2 6 0 11
                                                   0 12 2 16 6 13 6 17 2 0 0 11
                                                   0 18 2 6 0 0 0 19 1 6 8 0 20
                                                   1 0 8 0 10 0 0 0 15 2 0 8 0
                                                   0 21 2 0 0 11 0 18 2 0 0 13
                                                   0 14)))))
           '|lookupComplete|)) 
