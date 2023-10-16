
(SDEFUN |RCAGG-;elt;AvalueS;1| ((|x| A) (T3 "value") ($ S))
        (SPADCALL |x| (QREFELT $ 8))) 

(SDEFUN |RCAGG-;leaf?;AB;2| ((|x| A) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 12)) NIL)
              ('T (NULL (SPADCALL |x| (QREFELT $ 14)))))) 

(SDEFUN |RCAGG-;leaves;AL;3| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G122 NIL) (|y| NIL) (#2=#:G121 NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 12)) NIL)
                      ((SPADCALL |x| (QREFELT $ 16))
                       (LIST (SPADCALL |x| (QREFELT $ 8))))
                      ('T
                       (SPADCALL
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |y| NIL)
                              (LETT #1# (SPADCALL |x| (QREFELT $ 14))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |y| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |y| (QREFELT $ 18))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 19))))))) 

(SDEFUN |RCAGG-;setelt!;Avalue2S;4| ((|x| A) (T5 "value") (|y| S) ($ S))
        (SPADCALL |x| |y| (QREFELT $ 21))) 

(SDEFUN |RCAGG-;child?;2AB;5| ((|x| A) (|l| A) ($ |Boolean|))
        (SPADCALL |x| (SPADCALL |l| (QREFELT $ 14)) (QREFELT $ 24))) 

(SDEFUN |RCAGG-;parts;AL;6| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G128 NIL) (|i| NIL) (#2=#:G127 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| NIL) (LETT #1# (SPADCALL |x| (QREFELT $ 26)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 8)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(DECLAIM (NOTINLINE |RecursiveAggregate&;|)) 

(DEFUN |RecursiveAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|RecursiveAggregate&| DV$1 DV$2))
          (LETT $ (GETREFV 28))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|shallowlyMutable|))
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))))))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 22
                      (CONS (|dispatchFunction| |RCAGG-;setelt!;Avalue2S;4|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|BasicType|))
            (COND
             ((|testBitVector| |pv$| 2)
              (QSETREFV $ 25
                        (CONS (|dispatchFunction| |RCAGG-;child?;2AB;5|)
                              $))))))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (QSETREFV $ 27 (CONS (|dispatchFunction| |RCAGG-;parts;AL;6|) $))))
          $))) 

(MAKEPROP '|RecursiveAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |value|) '"value" |RCAGG-;elt;AvalueS;1| (|Boolean|)
              (5 . |empty?|) (|List| $) (10 . |children|) |RCAGG-;leaf?;AB;2|
              (15 . |leaf?|) (|List| 7) (20 . |leaves|) (25 . |concat|)
              |RCAGG-;leaves;AL;3| (30 . |setvalue!|) (36 . |setelt!|)
              (|List| 6) (43 . |member?|) (49 . |child?|) (55 . |nodes|)
              (60 . |parts|))
           '#(|setelt!| 65 |parts| 72 |leaves| 77 |leaf?| 82 |elt| 87 |child?|
              93)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 27
                                                 '(1 6 7 0 8 1 6 11 0 12 1 6 13
                                                   0 14 1 6 11 0 16 1 6 17 0 18
                                                   1 17 0 13 19 2 6 7 0 7 21 3
                                                   0 7 0 9 7 22 2 23 11 6 0 24
                                                   2 0 11 0 0 25 1 6 13 0 26 1
                                                   0 17 0 27 3 0 7 0 9 7 22 1 0
                                                   17 0 27 1 0 17 0 20 1 0 11 0
                                                   15 2 0 7 0 9 10 2 0 11 0 0
                                                   25)))))
           '|lookupComplete|)) 
