
(SDEFUN |INPRODPF;applyOverZ|
        ((|f| |Mapping| (|Stream| (|Integer|)) (|Stream| (|Integer|)))
         (|st| |Stream| |Coef|) ($ |Stream| |Coef|))
        (SPROG ((|stZ| (|Stream| (|Integer|))))
               (SEQ
                (LETT |stZ| (SPADCALL (ELT $ 9) |st| (QREFELT $ 14))
                      |INPRODPF;applyOverZ|)
                (EXIT
                 (SPADCALL (ELT $ 15) (SPADCALL |stZ| |f|) (QREFELT $ 18)))))) 

(SDEFUN |INPRODPF;infiniteProduct;2UTS;2| ((|x| UTS) ($ UTS))
        (SPADCALL
         (|INPRODPF;applyOverZ| (ELT $ 20) (SPADCALL |x| (QREFELT $ 21)) $)
         (QREFELT $ 22))) 

(SDEFUN |INPRODPF;evenInfiniteProduct;2UTS;3| ((|x| UTS) ($ UTS))
        (SPADCALL
         (|INPRODPF;applyOverZ| (ELT $ 24) (SPADCALL |x| (QREFELT $ 21)) $)
         (QREFELT $ 22))) 

(SDEFUN |INPRODPF;oddInfiniteProduct;2UTS;4| ((|x| UTS) ($ UTS))
        (SPADCALL
         (|INPRODPF;applyOverZ| (ELT $ 26) (SPADCALL |x| (QREFELT $ 21)) $)
         (QREFELT $ 22))) 

(SDEFUN |INPRODPF;generalInfiniteProduct;UTS2IUTS;5|
        ((|x| UTS) (|a| |Integer|) (|d| |Integer|) ($ UTS))
        (SPROG NIL
               (SPADCALL
                (|INPRODPF;applyOverZ|
                 (CONS #'|INPRODPF;generalInfiniteProduct;UTS2IUTS;5!0|
                       (VECTOR $ |d| |a|))
                 (SPADCALL |x| (QREFELT $ 21)) $)
                (QREFELT $ 22)))) 

(SDEFUN |INPRODPF;generalInfiniteProduct;UTS2IUTS;5!0| ((|z1| NIL) ($$ NIL))
        (PROG (|a| |d| $)
          (LETT |a| (QREFELT $$ 2)
                . #1=(|INPRODPF;generalInfiniteProduct;UTS2IUTS;5|))
          (LETT |d| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |a| |d| (QREFELT $ 28)))))) 

(DECLAIM (NOTINLINE |InfiniteProductPrimeField;|)) 

(DEFUN |InfiniteProductPrimeField| (&REST #1=#:G124)
  (SPROG NIL
         (PROG (#2=#:G125)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InfiniteProductPrimeField|)
                                               '|domainEqualList|)
                    . #3=(|InfiniteProductPrimeField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InfiniteProductPrimeField;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InfiniteProductPrimeField|)))))))))) 

(DEFUN |InfiniteProductPrimeField;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|InfiniteProductPrimeField|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|InfiniteProductPrimeField| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 30) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InfiniteProductPrimeField|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InfiniteProductPrimeField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |convert|) (|Stream| 8) (|Mapping| 8 6) (|Stream| 6)
              (|StreamFunctions2| 6 8) (5 . |map|) (11 . |coerce|)
              (|Mapping| 6 8) (|StreamFunctions2| 8 6) (16 . |map|)
              (|StreamInfiniteProduct| 8) (22 . |infiniteProduct|)
              (27 . |coefficients|) (32 . |series|)
              |INPRODPF;infiniteProduct;2UTS;2| (37 . |evenInfiniteProduct|)
              |INPRODPF;evenInfiniteProduct;2UTS;3| (42 . |oddInfiniteProduct|)
              |INPRODPF;oddInfiniteProduct;2UTS;4|
              (47 . |generalInfiniteProduct|)
              |INPRODPF;generalInfiniteProduct;UTS2IUTS;5|)
           '#(|oddInfiniteProduct| 54 |infiniteProduct| 59
              |generalInfiniteProduct| 64 |evenInfiniteProduct| 71)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 29
                                                 '(1 6 8 0 9 2 13 10 11 12 14 1
                                                   6 0 8 15 2 17 12 16 10 18 1
                                                   19 10 10 20 1 7 12 0 21 1 7
                                                   0 12 22 1 19 10 10 24 1 19
                                                   10 10 26 3 19 10 10 8 8 28 1
                                                   0 7 7 27 1 0 7 7 23 3 0 7 7
                                                   8 8 29 1 0 7 7 25)))))
           '|lookupComplete|)) 
