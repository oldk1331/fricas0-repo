
(/VERSIONCHECK 2) 

(DEFUN |GROUP-;/;3S;1| (|x| |y| $)
  (SPADCALL |x| (SPADCALL |y| (QREFELT $ 7)) (QREFELT $ 8))) 

(DEFUN |GROUP-;recip;SU;2| (|x| $) (CONS 0 (SPADCALL |x| (QREFELT $ 7)))) 

(DEFUN |GROUP-;^;SIS;3| (|x| |n| $)
  (COND ((ZEROP |n|) (|spadConstant| $ 12))
        ((< |n| 0)
         (SPADCALL (SPADCALL |x| (QREFELT $ 7)) (- |n|) (QREFELT $ 15)))
        ('T (SPADCALL |x| |n| (QREFELT $ 15))))) 

(DEFUN |GROUP-;conjugate;3S;4| (|p| |q| $)
  (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 7)) |p| (QREFELT $ 8)) |q|
            (QREFELT $ 8))) 

(DEFUN |GROUP-;commutator;3S;5| (|p| |q| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |p| (QREFELT $ 7)) (SPADCALL |q| (QREFELT $ 7))
              (QREFELT $ 8))
    |p| (QREFELT $ 8))
   |q| (QREFELT $ 8))) 

(DEFUN |Group&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Group&|))
      (LETT |dv$| (LIST '|Group&| DV$1) . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Group&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |inv|) (5 . *)
              |GROUP-;/;3S;1| (|Union| $ '"failed") |GROUP-;recip;SU;2|
              (11 . |One|) (|PositiveInteger|) (|RepeatedSquaring| 6)
              (15 . |expt|) (|Integer|) |GROUP-;^;SIS;3|
              |GROUP-;conjugate;3S;4| |GROUP-;commutator;3S;5|
              (|NonNegativeInteger|))
           '#(|recip| 21 |conjugate| 26 |commutator| 32 ^ 38 / 44) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(1 6 0 0 7 2 6 0 0 0 8 0 6 0
                                                   12 2 14 6 6 13 15 1 0 10 0
                                                   11 2 0 0 0 0 18 2 0 0 0 0 19
                                                   2 0 0 0 16 17 2 0 0 0 0
                                                   9)))))
           '|lookupComplete|)) 
