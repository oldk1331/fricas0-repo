
(/VERSIONCHECK 2) 

(DEFUN |MONOID-;one?;SB;1| (|x| $)
  (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 9))) 

(DEFUN |MONOID-;sample;S;2| ($) (|spadConstant| $ 7)) 

(DEFUN |MONOID-;recip;SU;3| (|x| $)
  (COND ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 9)) (CONS 0 |x|))
        ('T (CONS 1 "failed")))) 

(DEFUN |MONOID-;^;SNniS;4| (|x| |n| $)
  (COND ((ZEROP |n|) (|spadConstant| $ 7))
        ('T (SPADCALL |x| |n| (QREFELT $ 16))))) 

(DEFUN |Monoid&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Monoid&|))
      (LETT |dv$| (LIST '|Monoid&| DV$1) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Monoid&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Boolean|)
              (4 . =) |MONOID-;one?;SB;1| |MONOID-;sample;S;2|
              (|Union| $ '"failed") |MONOID-;recip;SU;3| (|PositiveInteger|)
              (|RepeatedSquaring| 6) (10 . |expt|) (|NonNegativeInteger|)
              |MONOID-;^;SNniS;4|)
           '#(|sample| 16 |recip| 20 |one?| 25 ^ 30) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(0 6 0 7 2 6 8 0 0 9 2 15 6 6
                                                   14 16 0 0 0 11 1 0 12 0 13 1
                                                   0 8 0 10 2 0 0 0 17 18)))))
           '|lookupComplete|)) 