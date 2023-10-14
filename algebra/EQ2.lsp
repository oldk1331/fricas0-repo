
(/VERSIONCHECK 2) 

(DEFUN |EQ2;map;MEE;1| (|fn| |eqn| $)
  (SPADCALL (SPADCALL (SPADCALL |eqn| (QREFELT $ 9)) |fn|)
            (SPADCALL (SPADCALL |eqn| (QREFELT $ 10)) |fn|) (QREFELT $ 12))) 

(DEFUN |EquationFunctions2| (&REST #1=#:G129)
  (PROG ()
    (RETURN
     (PROG (#2=#:G130)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|EquationFunctions2|)
                                           '|domainEqualList|)
                . #3=(|EquationFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |EquationFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|EquationFunctions2|))))))))))) 

(DEFUN |EquationFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|EquationFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|EquationFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 15) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|EquationFunctions2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|EquationFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Equation| 6) (0 . |lhs|) (5 . |rhs|) (|Equation| 7)
              (10 . |equation|) (|Mapping| 7 6) |EQ2;map;MEE;1|)
           '#(|map| 16) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 14
                                                 '(1 8 6 0 9 1 8 6 0 10 2 11 0
                                                   7 7 12 2 0 11 13 8 14)))))
           '|lookupComplete|)) 
