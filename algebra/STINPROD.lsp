
(DEFUN |STINPROD;infiniteProduct;2S;1| (|st| $)
  (SPADCALL (SPADCALL (SPADCALL |st| (QREFELT $ 9)) (QREFELT $ 11))
            (QREFELT $ 12))) 

(DEFUN |STINPROD;evenInfiniteProduct;2S;2| (|st| $)
  (SPADCALL (SPADCALL (SPADCALL |st| (QREFELT $ 9)) (QREFELT $ 14))
            (QREFELT $ 12))) 

(DEFUN |STINPROD;oddInfiniteProduct;2S;3| (|st| $)
  (SPADCALL (SPADCALL (SPADCALL |st| (QREFELT $ 9)) (QREFELT $ 16))
            (QREFELT $ 12))) 

(DEFUN |STINPROD;generalInfiniteProduct;S2IS;4| (|st| |a| |d| $)
  (SPADCALL (SPADCALL (SPADCALL |st| (QREFELT $ 9)) |a| |d| (QREFELT $ 19))
            (QREFELT $ 12))) 

(DEFUN |STINPROD;applyOverQF| (|f| |st| $)
  (PROG (|stQF|)
    (RETURN
     (SEQ
      (LETT |stQF| (SPADCALL (ELT $ 22) |st| (QREFELT $ 26))
            |STINPROD;applyOverQF|)
      (EXIT (SPADCALL (ELT $ 27) (SPADCALL |stQF| |f|) (QREFELT $ 30))))))) 

(DEFUN |STINPROD;infiniteProduct;2S;6| (|st| $)
  (|STINPROD;applyOverQF| (CONS #'|STINPROD;infiniteProduct;2S;6!0| $) |st| $)) 

(DEFUN |STINPROD;infiniteProduct;2S;6!0| (|z1| $)
  (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 32)) (QREFELT $ 34))
            (QREFELT $ 35))) 

(DEFUN |STINPROD;evenInfiniteProduct;2S;7| (|st| $)
  (|STINPROD;applyOverQF| (CONS #'|STINPROD;evenInfiniteProduct;2S;7!0| $) |st|
   $)) 

(DEFUN |STINPROD;evenInfiniteProduct;2S;7!0| (|z1| $)
  (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 32)) (QREFELT $ 36))
            (QREFELT $ 35))) 

(DEFUN |STINPROD;oddInfiniteProduct;2S;8| (|st| $)
  (|STINPROD;applyOverQF| (CONS #'|STINPROD;oddInfiniteProduct;2S;8!0| $) |st|
   $)) 

(DEFUN |STINPROD;oddInfiniteProduct;2S;8!0| (|z1| $)
  (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 32)) (QREFELT $ 37))
            (QREFELT $ 35))) 

(DEFUN |STINPROD;generalInfiniteProduct;S2IS;9| (|st| |a| |d| $)
  (PROG ()
    (RETURN
     (|STINPROD;applyOverQF|
      (CONS #'|STINPROD;generalInfiniteProduct;S2IS;9!0| (VECTOR |d| |a| $))
      |st| $)))) 

(DEFUN |STINPROD;generalInfiniteProduct;S2IS;9!0| (|z1| $$)
  (PROG ($ |a| |d|)
    (LETT $ (QREFELT $$ 2) . #1=(|STINPROD;generalInfiniteProduct;S2IS;9|))
    (LETT |a| (QREFELT $$ 1) . #1#)
    (LETT |d| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL (SPADCALL |z1| (QREFELT $ 32)) |a| |d| (QREFELT $ 38))
       (QREFELT $ 35)))))) 

(DECLAIM (NOTINLINE |StreamInfiniteProduct;|)) 

(DEFUN |StreamInfiniteProduct| (#1=#:G117)
  (PROG ()
    (RETURN
     (PROG (#2=#:G118)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|StreamInfiniteProduct|)
                                           '|domainEqualList|)
                . #3=(|StreamInfiniteProduct|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|StreamInfiniteProduct;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|StreamInfiniteProduct|))))))))))) 

(DEFUN |StreamInfiniteProduct;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|StreamInfiniteProduct|))
      (LETT |dv$| (LIST '|StreamInfiniteProduct| DV$1) . #1#)
      (LETT $ (GETREFV 39) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|StreamInfiniteProduct| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|Field|))
        (PROGN
         (QSETREFV $ 13
                   (CONS (|dispatchFunction| |STINPROD;infiniteProduct;2S;1|)
                         $))
         (QSETREFV $ 15
                   (CONS
                    (|dispatchFunction| |STINPROD;evenInfiniteProduct;2S;2|)
                    $))
         (QSETREFV $ 17
                   (CONS
                    (|dispatchFunction| |STINPROD;oddInfiniteProduct;2S;3|) $))
         (QSETREFV $ 20
                   (CONS
                    (|dispatchFunction|
                     |STINPROD;generalInfiniteProduct;S2IS;4|)
                    $))))
       ('T
        (PROGN
         (QSETREFV $ 13
                   (CONS (|dispatchFunction| |STINPROD;infiniteProduct;2S;6|)
                         $))
         (QSETREFV $ 15
                   (CONS
                    (|dispatchFunction| |STINPROD;evenInfiniteProduct;2S;7|)
                    $))
         (QSETREFV $ 17
                   (CONS
                    (|dispatchFunction| |STINPROD;oddInfiniteProduct;2S;8|) $))
         (QSETREFV $ 20
                   (CONS
                    (|dispatchFunction|
                     |STINPROD;generalInfiniteProduct;S2IS;9|)
                    $)))))
      $)))) 

(MAKEPROP '|StreamInfiniteProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Stream| 6)
              (|StreamTranscendentalFunctions| 6) (0 . |log|)
              (|StreamTaylorSeriesOperations| 6) (5 . |lambert|) (10 . |exp|)
              (15 . |infiniteProduct|) (20 . |evenlambert|)
              (25 . |evenInfiniteProduct|) (30 . |oddlambert|)
              (35 . |oddInfiniteProduct|) (|Integer|) (40 . |generalLambert|)
              (47 . |generalInfiniteProduct|) (|Fraction| 6) (54 . |coerce|)
              (|Stream| 21) (|Mapping| 21 6) (|StreamFunctions2| 6 21)
              (59 . |map|) (65 . |retract|) (|Mapping| 6 21)
              (|StreamFunctions2| 21 6) (70 . |map|)
              (|StreamTranscendentalFunctions| 21) (76 . |log|)
              (|StreamTaylorSeriesOperations| 21) (81 . |lambert|) (86 . |exp|)
              (91 . |evenlambert|) (96 . |oddlambert|)
              (101 . |generalLambert|))
           '#(|oddInfiniteProduct| 108 |infiniteProduct| 113
              |generalInfiniteProduct| 118 |evenInfiniteProduct| 125)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 38
                                                 '(1 8 7 7 9 1 10 7 7 11 1 8 7
                                                   7 12 1 0 7 7 13 1 10 7 7 14
                                                   1 0 7 7 15 1 10 7 7 16 1 0 7
                                                   7 17 3 10 7 7 18 18 19 3 0 7
                                                   7 18 18 20 1 21 0 6 22 2 25
                                                   23 24 7 26 1 21 6 0 27 2 29
                                                   7 28 23 30 1 31 23 23 32 1
                                                   33 23 23 34 1 31 23 23 35 1
                                                   33 23 23 36 1 33 23 23 37 3
                                                   33 23 23 18 18 38 1 0 7 7 17
                                                   1 0 7 7 13 3 0 7 7 18 18 20
                                                   1 0 7 7 15)))))
           '|lookupComplete|)) 
