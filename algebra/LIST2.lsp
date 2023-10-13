
(/VERSIONCHECK 2) 

(DEFUN |LIST2;map;MLL;1| (|f| |l| $) (SPADCALL |f| |l| (QREFELT $ 12))) 

(DEFUN |LIST2;scan;MLBL;2| (|f| |l| |b| $)
  (SPADCALL |f| |l| |b| (QREFELT $ 15))) 

(DEFUN |LIST2;reduce;ML2B;3| (|f| |l| |b| $)
  (SPADCALL |f| |l| |b| (QREFELT $ 17))) 

(DEFUN |ListFunctions2| (&REST #1=#:G133)
  (PROG ()
    (RETURN
     (PROG (#2=#:G134)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ListFunctions2|)
                                           '|domainEqualList|)
                . #3=(|ListFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ListFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|ListFunctions2|))))))))))) 

(DEFUN |ListFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ListFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ListFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ListFunctions2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ListFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 7)
              (|Mapping| 7 6) (|List| 6)
              (|FiniteLinearAggregateFunctions2| 6 10 7 8) (0 . |map|)
              |LIST2;map;MLL;1| (|Mapping| 7 6 7) (6 . |scan|)
              |LIST2;scan;MLBL;2| (13 . |reduce|) |LIST2;reduce;ML2B;3|)
           '#(|scan| 20 |reduce| 27 |map| 34) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(2 11 8 9 10 12 3 11 8 14 10
                                                   7 15 3 11 7 14 10 7 17 3 0 8
                                                   14 10 7 16 3 0 7 14 10 7 18
                                                   2 0 8 9 10 13)))))
           '|lookupComplete|)) 
