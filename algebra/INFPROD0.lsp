
(SDEFUN |INFPROD0;infiniteProduct;2UTS;1| ((|x| UTS) ($ UTS))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 11))
                  (QREFELT $ 12))) 

(SDEFUN |INFPROD0;evenInfiniteProduct;2UTS;2| ((|x| UTS) ($ UTS))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 14))
                  (QREFELT $ 12))) 

(SDEFUN |INFPROD0;oddInfiniteProduct;2UTS;3| ((|x| UTS) ($ UTS))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 16))
                  (QREFELT $ 12))) 

(SDEFUN |INFPROD0;generalInfiniteProduct;UTS2IUTS;4|
        ((|x| UTS) (|a| |Integer|) (|d| |Integer|) ($ UTS))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT $ 9)) |a| |d| (QREFELT $ 19))
         (QREFELT $ 12))) 

(DECLAIM (NOTINLINE |InfiniteProductCharacteristicZero;|)) 

(DEFUN |InfiniteProductCharacteristicZero| (&REST #1=#:G108)
  (SPROG NIL
         (PROG (#2=#:G109)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InfiniteProductCharacteristicZero|)
                                               '|domainEqualList|)
                    . #3=(|InfiniteProductCharacteristicZero|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InfiniteProductCharacteristicZero;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InfiniteProductCharacteristicZero|)))))))))) 

(DEFUN |InfiniteProductCharacteristicZero;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|InfiniteProductCharacteristicZero|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|InfiniteProductCharacteristicZero| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 21) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InfiniteProductCharacteristicZero|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InfiniteProductCharacteristicZero| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Stream| 6) (0 . |coefficients|) (|StreamInfiniteProduct| 6)
              (5 . |infiniteProduct|) (10 . |series|)
              |INFPROD0;infiniteProduct;2UTS;1| (15 . |evenInfiniteProduct|)
              |INFPROD0;evenInfiniteProduct;2UTS;2| (20 . |oddInfiniteProduct|)
              |INFPROD0;oddInfiniteProduct;2UTS;3| (|Integer|)
              (25 . |generalInfiniteProduct|)
              |INFPROD0;generalInfiniteProduct;UTS2IUTS;4|)
           '#(|oddInfiniteProduct| 32 |infiniteProduct| 37
              |generalInfiniteProduct| 42 |evenInfiniteProduct| 49)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(1 7 8 0 9 1 10 8 8 11 1 7 0
                                                   8 12 1 10 8 8 14 1 10 8 8 16
                                                   3 10 8 8 18 18 19 1 0 7 7 17
                                                   1 0 7 7 13 3 0 7 7 18 18 20
                                                   1 0 7 7 15)))))
           '|lookupComplete|)) 
