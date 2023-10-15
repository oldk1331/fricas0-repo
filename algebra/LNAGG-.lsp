
(SDEFUN |LNAGG-;indices;AL;1| ((|a| A) ($ |List| (|Integer|)))
        (SPROG ((#1=#:G116 NIL) (|i| NIL) (#2=#:G115 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|LNAGG-;indices;AL;1|))
                 (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)) . #3#)
                      (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #3#) G190
                      (COND ((> |i| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #3#)))
                      (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LNAGG-;index?;IAB;2| ((|i| |Integer|) (|a| A) ($ |Boolean|))
        (COND
         ((>= |i| (SPADCALL |a| (QREFELT $ 9)))
          (SPADCALL |i| (SPADCALL |a| (QREFELT $ 10)) (QREFELT $ 14)))
         ('T NIL))) 

(SDEFUN |LNAGG-;concat;ASA;3| ((|a| A) (|x| S) ($ A))
        (SPADCALL |a| (SPADCALL 1 |x| (QREFELT $ 17)) (QREFELT $ 18))) 

(SDEFUN |LNAGG-;concat;S2A;4| ((|x| S) (|y| A) ($ A))
        (SPADCALL (SPADCALL 1 |x| (QREFELT $ 17)) |y| (QREFELT $ 18))) 

(SDEFUN |LNAGG-;insert;SAIA;5| ((|x| S) (|a| A) (|i| |Integer|) ($ A))
        (SPADCALL (SPADCALL 1 |x| (QREFELT $ 17)) |a| |i| (QREFELT $ 21))) 

(SDEFUN |LNAGG-;maxIndex;AI;6| ((|l| A) ($ |Integer|))
        (+ (- (SPADCALL |l| (QREFELT $ 23)) 1) (SPADCALL |l| (QREFELT $ 9)))) 

(SDEFUN |LNAGG-;position;SAI;7| ((|x| S) (|t| A) ($ |Integer|))
        (SPADCALL |x| |t| (SPADCALL |t| (QREFELT $ 9)) (QREFELT $ 25))) 

(SDEFUN |LNAGG-;hashUpdate!;HsAHs;8|
        ((|s| |HashState|) (|x| A) ($ |HashState|))
        (SPROG ((#1=#:G127 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |x| (QREFELT $ 9))
                       . #2=(|LNAGG-;hashUpdate!;HsAHs;8|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 10)) . #2#) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |s|
                         (SPADCALL |s| (SPADCALL |x| |i| (QREFELT $ 27))
                                   (QREFELT $ 29))
                         . #2#)))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |LNAGG-;sorted?;AB;9| ((|l| A) ($ |Boolean|))
        (SPADCALL (CONS #'|LNAGG-;sorted?;AB;9!0| $) |l| (QREFELT $ 34))) 

(SDEFUN |LNAGG-;sorted?;AB;9!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (COND ((SPADCALL |x| |y| (QREFELT $ 31)) 'T)
              ('T (SPADCALL |x| |y| (QREFELT $ 32))))) 

(SDEFUN |LNAGG-;merge;3A;10| ((|x| A) (|y| A) ($ A))
        (SPADCALL (ELT $ 31) |x| |y| (QREFELT $ 36))) 

(SDEFUN |LNAGG-;sort;2A;11| ((|l| A) ($ A))
        (SPADCALL (ELT $ 31) |l| (QREFELT $ 38))) 

(SDEFUN |LNAGG-;reverse;2A;12| ((|x| A) ($ A))
        (SPADCALL (SPADCALL |x| (QREFELT $ 40)) (QREFELT $ 41))) 

(SDEFUN |LNAGG-;sort;M2A;13| ((|f| |Mapping| (|Boolean|) S S) (|l| A) ($ A))
        (SPADCALL |f| (SPADCALL |l| (QREFELT $ 40)) (QREFELT $ 43))) 

(SDEFUN |LNAGG-;reverse;2A;14| ((|x| A) ($ A))
        (SPADCALL (SPADCALL |x| (QREFELT $ 40)) (QREFELT $ 41))) 

(SDEFUN |LNAGG-;sort!;2A;15| ((|l| A) ($ A))
        (SPADCALL (ELT $ 31) |l| (QREFELT $ 43))) 

(DECLAIM (NOTINLINE |LinearAggregate&;|)) 

(DEFUN |LinearAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LinearAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LinearAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 48) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#2|
                                                             '(|Comparable|))
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))
                                              (|HasCategory| |#1|
                                                             '(|finiteAggregate|))
                                              (|HasCategory| |#1|
                                                             '(|shallowlyMutable|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 24
                       (CONS (|dispatchFunction| |LNAGG-;maxIndex;AI;6|) $))
             (COND
              ((|testBitVector| |pv$| 3)
               (QSETREFV $ 26
                         (CONS (|dispatchFunction| |LNAGG-;position;SAI;7|)
                               $))))
             (COND
              ((|HasCategory| |#2| '(|SetCategory|))
               (QSETREFV $ 30
                         (CONS
                          (|dispatchFunction| |LNAGG-;hashUpdate!;HsAHs;8|)
                          $))))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 35
                          (CONS (|dispatchFunction| |LNAGG-;sorted?;AB;9|) $))
                (QSETREFV $ 37
                          (CONS (|dispatchFunction| |LNAGG-;merge;3A;10|) $))
                (QSETREFV $ 39
                          (CONS (|dispatchFunction| |LNAGG-;sort;2A;11|) $)))))
             (COND
              ((|testBitVector| |pv$| 5)
               (PROGN
                (QSETREFV $ 42
                          (CONS (|dispatchFunction| |LNAGG-;reverse;2A;12|) $))
                (QSETREFV $ 44
                          (CONS (|dispatchFunction| |LNAGG-;sort;M2A;13|) $))
                (QSETREFV $ 42
                          (CONS (|dispatchFunction| |LNAGG-;reverse;2A;14|) $))
                (COND
                 ((|testBitVector| |pv$| 1)
                  (QSETREFV $ 45
                            (CONS (|dispatchFunction| |LNAGG-;sort!;2A;15|)
                                  $))))))))))
          $))) 

(MAKEPROP '|LinearAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |maxIndex|) (|List| 8)
              |LNAGG-;indices;AL;1| (|Boolean|) (10 . <=) |LNAGG-;index?;IAB;2|
              (|NonNegativeInteger|) (16 . |new|) (22 . |concat|)
              |LNAGG-;concat;ASA;3| |LNAGG-;concat;S2A;4| (28 . |insert|)
              |LNAGG-;insert;SAIA;5| (35 . |#|) (40 . |maxIndex|)
              (45 . |position|) (52 . |position|) (58 . |qelt|) (|HashState|)
              (64 . |hashUpdate!|) (70 . |hashUpdate!|) (76 . <) (82 . =)
              (|Mapping| 13 7 7) (88 . |sorted?|) (94 . |sorted?|)
              (99 . |merge|) (106 . |merge|) (112 . |sort|) (118 . |sort|)
              (123 . |copy|) (128 . |reverse!|) (133 . |reverse|)
              (138 . |sort!|) (144 . |sort|) (150 . |sort!|) (|Mapping| 13 7)
              (|List| $))
           '#(|sorted?| 155 |sort!| 160 |sort| 165 |reverse| 176 |position| 181
              |merge| 187 |maxIndex| 193 |insert| 198 |indices| 205 |index?|
              210 |hashUpdate!| 216 |concat| 222)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(1 6 8 0 9 1 6 8 0 10 2 8 13
                                                   0 0 14 2 6 0 16 7 17 2 6 0 0
                                                   0 18 3 6 0 0 0 8 21 1 6 16 0
                                                   23 1 0 8 0 24 3 6 8 7 0 8 25
                                                   2 0 8 7 0 26 2 6 7 0 8 27 2
                                                   7 28 28 0 29 2 0 28 28 0 30
                                                   2 7 13 0 0 31 2 7 13 0 0 32
                                                   2 6 13 33 0 34 1 0 13 0 35 3
                                                   6 0 33 0 0 36 2 0 0 0 0 37 2
                                                   6 0 33 0 38 1 0 0 0 39 1 6 0
                                                   0 40 1 6 0 0 41 1 0 0 0 42 2
                                                   6 0 33 0 43 2 0 0 33 0 44 1
                                                   0 0 0 45 1 0 13 0 35 1 0 0 0
                                                   45 1 0 0 0 39 2 0 0 33 0 44
                                                   1 0 0 0 42 2 0 8 7 0 26 2 0
                                                   0 0 0 37 1 0 8 0 24 3 0 0 7
                                                   0 8 22 1 0 11 0 12 2 0 13 8
                                                   0 15 2 0 28 28 0 30 2 0 0 0
                                                   7 19 2 0 0 7 0 20)))))
           '|lookupComplete|)) 
