
(SDEFUN |FLAGG-;position;SAI;1| ((|x| S) (|t| A) ($ |Integer|))
        (SPADCALL |x| |t| (SPADCALL |t| (QREFELT $ 9)) (QREFELT $ 10))) 

(SDEFUN |FLAGG-;hashUpdate!;HsAHs;2|
        ((|s| |HashState|) (|x| A) ($ |HashState|))
        (SPROG ((#1=#:G114 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |x| (QREFELT $ 9))
                       . #2=(|FLAGG-;hashUpdate!;HsAHs;2|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 12)) . #2#) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |s|
                         (SPADCALL |s| (SPADCALL |x| |i| (QREFELT $ 13))
                                   (QREFELT $ 15))
                         . #2#)))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |FLAGG-;sorted?;AB;3| ((|l| A) ($ |Boolean|))
        (SPADCALL (CONS #'|FLAGG-;sorted?;AB;3!0| $) |l| (QREFELT $ 22))) 

(SDEFUN |FLAGG-;sorted?;AB;3!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (COND ((SPADCALL |x| |y| (QREFELT $ 18)) (|spadConstant| $ 19))
              ('T (SPADCALL |x| |y| (QREFELT $ 20))))) 

(SDEFUN |FLAGG-;merge;3A;4| ((|x| A) (|y| A) ($ A))
        (SPADCALL (ELT $ 18) |x| |y| (QREFELT $ 24))) 

(SDEFUN |FLAGG-;sort;2A;5| ((|l| A) ($ A))
        (SPADCALL (ELT $ 18) |l| (QREFELT $ 26))) 

(SDEFUN |FLAGG-;reverse;2A;6| ((|x| A) ($ A))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (QREFELT $ 29))) 

(SDEFUN |FLAGG-;sort;M2A;7| ((|f| |Mapping| (|Boolean|) S S) (|l| A) ($ A))
        (SPADCALL |f| (SPADCALL |l| (QREFELT $ 28)) (QREFELT $ 31))) 

(SDEFUN |FLAGG-;reverse;2A;8| ((|x| A) ($ A))
        (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (QREFELT $ 29))) 

(SDEFUN |FLAGG-;sort!;2A;9| ((|l| A) ($ A))
        (SPADCALL (ELT $ 18) |l| (QREFELT $ 31))) 

(DECLAIM (NOTINLINE |FiniteLinearAggregate&;|)) 

(DEFUN |FiniteLinearAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteLinearAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FiniteLinearAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 35) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|shallowlyMutable|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 11
                      (CONS (|dispatchFunction| |FLAGG-;position;SAI;1|) $))))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (QSETREFV $ 16
                      (CONS (|dispatchFunction| |FLAGG-;hashUpdate!;HsAHs;2|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 23
                       (CONS (|dispatchFunction| |FLAGG-;sorted?;AB;3|) $))
             (QSETREFV $ 25 (CONS (|dispatchFunction| |FLAGG-;merge;3A;4|) $))
             (QSETREFV $ 27
                       (CONS (|dispatchFunction| |FLAGG-;sort;2A;5|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 30
                       (CONS (|dispatchFunction| |FLAGG-;reverse;2A;6|) $))
             (QSETREFV $ 32 (CONS (|dispatchFunction| |FLAGG-;sort;M2A;7|) $))
             (QSETREFV $ 30
                       (CONS (|dispatchFunction| |FLAGG-;reverse;2A;8|) $))
             (COND
              ((|testBitVector| |pv$| 2)
               (QSETREFV $ 33
                         (CONS (|dispatchFunction| |FLAGG-;sort!;2A;9|)
                               $)))))))
          $))) 

(MAKEPROP '|FiniteLinearAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |position|) (12 . |position|)
              (18 . |maxIndex|) (23 . |qelt|) (|HashState|)
              (29 . |hashUpdate!|) (35 . |hashUpdate!|) (|Boolean|) (41 . <)
              (47 . |true|) (51 . =) (|Mapping| 17 7 7) (57 . |sorted?|)
              (63 . |sorted?|) (68 . |merge|) (75 . |merge|) (81 . |sort|)
              (87 . |sort|) (92 . |copy|) (97 . |reverse!|) (102 . |reverse|)
              (107 . |sort!|) (113 . |sort|) (119 . |sort!|) (|Mapping| 17 7))
           '#(|sorted?| 124 |sort!| 129 |sort| 134 |reverse| 145 |position| 150
              |merge| 156 |hashUpdate!| 162)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(1 6 8 0 9 3 6 8 7 0 8 10 2 0
                                                   8 7 0 11 1 6 8 0 12 2 6 7 0
                                                   8 13 2 7 14 14 0 15 2 0 14
                                                   14 0 16 2 7 17 0 0 18 0 17 0
                                                   19 2 7 17 0 0 20 2 6 17 21 0
                                                   22 1 0 17 0 23 3 6 0 21 0 0
                                                   24 2 0 0 0 0 25 2 6 0 21 0
                                                   26 1 0 0 0 27 1 6 0 0 28 1 6
                                                   0 0 29 1 0 0 0 30 2 6 0 21 0
                                                   31 2 0 0 21 0 32 1 0 0 0 33
                                                   1 0 17 0 23 1 0 0 0 33 1 0 0
                                                   0 27 2 0 0 21 0 32 1 0 0 0
                                                   30 2 0 8 7 0 11 2 0 0 0 0 25
                                                   2 0 14 14 0 16)))))
           '|lookupComplete|)) 
