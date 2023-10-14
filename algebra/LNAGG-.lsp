
(/VERSIONCHECK 2) 

(DEFUN |LNAGG-;indices;AL;1| (|a| $)
  (PROG (#1=#:G115 |i| #2=#:G114)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|LNAGG-;indices;AL;1|))
       (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)) . #3#)
            (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #3#) G190
            (COND ((> |i| #1#) (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #3#)))
            (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |LNAGG-;index?;IAB;2| (|i| |a| $)
  (COND
   ((>= |i| (SPADCALL |a| (QREFELT $ 9)))
    (SPADCALL |i| (SPADCALL |a| (QREFELT $ 10)) (QREFELT $ 14)))
   ('T 'NIL))) 

(DEFUN |LNAGG-;concat;ASA;3| (|a| |x| $)
  (SPADCALL |a| (SPADCALL 1 |x| (QREFELT $ 17)) (QREFELT $ 18))) 

(DEFUN |LNAGG-;concat;S2A;4| (|x| |y| $)
  (SPADCALL (SPADCALL 1 |x| (QREFELT $ 17)) |y| (QREFELT $ 18))) 

(DEFUN |LNAGG-;insert;SAIA;5| (|x| |a| |i| $)
  (SPADCALL (SPADCALL 1 |x| (QREFELT $ 17)) |a| |i| (QREFELT $ 21))) 

(DEFUN |LNAGG-;maxIndex;AI;6| (|l| $)
  (+ (- (SPADCALL |l| (QREFELT $ 23)) 1) (SPADCALL |l| (QREFELT $ 9)))) 

(DECLAIM (NOTINLINE |LinearAggregate&;|)) 

(DEFUN |LinearAggregate&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LinearAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|LinearAggregate&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 26) . #1#)
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
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|finiteAggregate|))
        (QSETREFV $ 24 (CONS (|dispatchFunction| |LNAGG-;maxIndex;AI;6|) $))))
      $)))) 

(MAKEPROP '|LinearAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |maxIndex|) (|List| 8)
              |LNAGG-;indices;AL;1| (|Boolean|) (10 . <=) |LNAGG-;index?;IAB;2|
              (|NonNegativeInteger|) (16 . |new|) (22 . |concat|)
              |LNAGG-;concat;ASA;3| |LNAGG-;concat;S2A;4| (28 . |insert|)
              |LNAGG-;insert;SAIA;5| (35 . |#|) (40 . |maxIndex|) (|List| $))
           '#(|maxIndex| 45 |insert| 50 |indices| 57 |index?| 62 |concat| 68)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 24
                                                 '(1 6 8 0 9 1 6 8 0 10 2 8 13
                                                   0 0 14 2 6 0 16 7 17 2 6 0 0
                                                   0 18 3 6 0 0 0 8 21 1 6 16 0
                                                   23 1 0 8 0 24 1 0 8 0 24 3 0
                                                   0 7 0 8 22 1 0 11 0 12 2 0
                                                   13 8 0 15 2 0 0 0 7 19 2 0 0
                                                   7 0 20)))))
           '|lookupComplete|)) 
