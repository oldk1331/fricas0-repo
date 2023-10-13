
(/VERSIONCHECK 2) 

(DEFUN |FLAGG-;position;SAI;1| (|x| |t| $)
  (SPADCALL |x| |t| (SPADCALL |t| (QREFELT $ 9)) (QREFELT $ 10))) 

(DEFUN |FLAGG-;sorted?;AB;2| (|l| $)
  (SPADCALL (CONS #'|FLAGG-;sorted?;AB;2!0| $) |l| (QREFELT $ 17))) 

(DEFUN |FLAGG-;sorted?;AB;2!0| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 13)) (|spadConstant| $ 14))
        ('T (SPADCALL |x| |y| (QREFELT $ 15))))) 

(DEFUN |FLAGG-;merge;3A;3| (|x| |y| $)
  (SPADCALL (ELT $ 13) |x| |y| (QREFELT $ 19))) 

(DEFUN |FLAGG-;sort;2A;4| (|l| $) (SPADCALL (ELT $ 13) |l| (QREFELT $ 21))) 

(DEFUN |FLAGG-;reverse;2A;5| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 24))) 

(DEFUN |FLAGG-;sort;M2A;6| (|f| |l| $)
  (SPADCALL |f| (SPADCALL |l| (QREFELT $ 23)) (QREFELT $ 26))) 

(DEFUN |FLAGG-;reverse;2A;7| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 24))) 

(DEFUN |FLAGG-;sort!;2A;8| (|l| $) (SPADCALL (ELT $ 13) |l| (QREFELT $ 26))) 

(DEFUN |FiniteLinearAggregate&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteLinearAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FiniteLinearAggregate&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 30) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|shallowlyMutable|))
                                          (|HasCategory| |#2| '(|OrderedSet|))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 11 (CONS (|dispatchFunction| |FLAGG-;position;SAI;1|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 18 (CONS (|dispatchFunction| |FLAGG-;sorted?;AB;2|) $))
         (QSETREFV $ 20 (CONS (|dispatchFunction| |FLAGG-;merge;3A;3|) $))
         (QSETREFV $ 22 (CONS (|dispatchFunction| |FLAGG-;sort;2A;4|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 25 (CONS (|dispatchFunction| |FLAGG-;reverse;2A;5|) $))
         (QSETREFV $ 27 (CONS (|dispatchFunction| |FLAGG-;sort;M2A;6|) $))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |FLAGG-;reverse;2A;7|) $))
         (COND
          ((|testBitVector| |pv$| 2)
           (QSETREFV $ 28
                     (CONS (|dispatchFunction| |FLAGG-;sort!;2A;8|) $)))))))
      $)))) 

(MAKEPROP '|FiniteLinearAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |position|) (12 . |position|) (|Boolean|)
              (18 . <) (24 . |true|) (28 . =) (|Mapping| 12 7 7)
              (34 . |sorted?|) (40 . |sorted?|) (45 . |merge|) (52 . |merge|)
              (58 . |sort|) (64 . |sort|) (69 . |copy|) (74 . |reverse!|)
              (79 . |reverse|) (84 . |sort!|) (90 . |sort|) (96 . |sort!|)
              (|Mapping| 12 7))
           '#(|sorted?| 101 |sort!| 106 |sort| 111 |reverse| 122 |position| 127
              |merge| 133)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(1 6 8 0 9 3 6 8 7 0 8 10 2 0
                                                   8 7 0 11 2 7 12 0 0 13 0 12
                                                   0 14 2 7 12 0 0 15 2 6 12 16
                                                   0 17 1 0 12 0 18 3 6 0 16 0
                                                   0 19 2 0 0 0 0 20 2 6 0 16 0
                                                   21 1 0 0 0 22 1 6 0 0 23 1 6
                                                   0 0 24 1 0 0 0 25 2 6 0 16 0
                                                   26 2 0 0 16 0 27 1 0 0 0 28
                                                   1 0 12 0 18 1 0 0 0 28 1 0 0
                                                   0 22 2 0 0 16 0 27 1 0 0 0
                                                   25 2 0 8 7 0 11 2 0 0 0 0
                                                   20)))))
           '|lookupComplete|)) 
