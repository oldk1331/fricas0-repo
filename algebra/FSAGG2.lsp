
(/VERSIONCHECK 2) 

(DEFUN |FSAGG2;map;MAB;1| (|fn| |a| $)
  (SPADCALL (SPADCALL |fn| (SPADCALL |a| (QREFELT $ 11)) (QREFELT $ 15))
            (QREFELT $ 16))) 

(DEFUN |FSAGG2;reduce;MA2R;2| (|fn| |a| |ident| $)
  (SPADCALL |fn| (SPADCALL |a| (QREFELT $ 11)) |ident| (QREFELT $ 19))) 

(DEFUN |FSAGG2;scan;MARB;3| (|fn| |a| |ident| $)
  (SPADCALL
   (SPADCALL |fn| (SPADCALL |a| (QREFELT $ 11)) |ident| (QREFELT $ 21))
   (QREFELT $ 16))) 

(DEFUN |FiniteSetAggregateFunctions2| (&REST #1=#:G133)
  (PROG ()
    (RETURN
     (PROG (#2=#:G134)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FiniteSetAggregateFunctions2|)
                                           '|domainEqualList|)
                . #3=(|FiniteSetAggregateFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |FiniteSetAggregateFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FiniteSetAggregateFunctions2|))))))))))) 

(DEFUN |FiniteSetAggregateFunctions2;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteSetAggregateFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|FiniteSetAggregateFunctions2| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 23) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FiniteSetAggregateFunctions2|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FiniteSetAggregateFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|List| 6) (0 . |parts|) (|List| 8)
              (|Mapping| 8 6) (|ListFunctions2| 6 8) (5 . |map|) (11 . |set|)
              |FSAGG2;map;MAB;1| (|Mapping| 8 6 8) (16 . |reduce|)
              |FSAGG2;reduce;MA2R;2| (23 . |scan|) |FSAGG2;scan;MARB;3|)
           '#(|scan| 30 |reduce| 37 |map| 44) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(1 7 10 0 11 2 14 12 13 10 15
                                                   1 9 0 12 16 3 14 8 18 10 8
                                                   19 3 14 12 18 10 8 21 3 0 9
                                                   18 7 8 22 3 0 8 18 7 8 20 2
                                                   0 9 13 7 17)))))
           '|lookupComplete|)) 
