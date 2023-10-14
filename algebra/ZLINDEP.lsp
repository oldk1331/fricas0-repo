
(/VERSIONCHECK 2) 

(DEFUN |ZLINDEP;linearlyDependentOverZ?;VB;1| (|v| $)
  (SPADCALL |v| (QREFELT $ 10))) 

(DEFUN |ZLINDEP;linearDependenceOverZ;VU;2| (|v| $)
  (SPADCALL |v| (QREFELT $ 13))) 

(DEFUN |ZLINDEP;solveLinearlyOverQ;VRU;3| (|v| |c| $)
  (SPADCALL |v| |c| (QREFELT $ 16))) 

(DEFUN |ZLINDEP;solveLinearlyOverQ;MVU;4| (|m| |v| $)
  (SPADCALL |m| |v| (QREFELT $ 19))) 

(DEFUN |IntegerLinearDependence| (#1=#:G140)
  (PROG ()
    (RETURN
     (PROG (#2=#:G141)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|IntegerLinearDependence|)
                                           '|domainEqualList|)
                . #3=(|IntegerLinearDependence|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|IntegerLinearDependence;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|IntegerLinearDependence|))))))))))) 

(DEFUN |IntegerLinearDependence;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegerLinearDependence|))
      (LETT |dv$| (LIST '|IntegerLinearDependence| DV$1) . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|IntegerLinearDependence| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|IntegerLinearDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (|Vector| 6)
              (|LinearDependence| (|Integer|) 6) (0 . |linearlyDependent?|)
              |ZLINDEP;linearlyDependentOverZ?;VB;1|
              (|Union| (|Vector| (|Integer|)) '"failed")
              (5 . |linearDependence|) |ZLINDEP;linearDependenceOverZ;VU;2|
              (|Union| (|Vector| (|Fraction| (|Integer|))) '"failed")
              (10 . |solveLinear|) |ZLINDEP;solveLinearlyOverQ;VRU;3|
              (|Matrix| 6) (16 . |solveLinear|)
              |ZLINDEP;solveLinearlyOverQ;MVU;4|)
           '#(|solveLinearlyOverQ| 22 |linearlyDependentOverZ?| 34
              |linearDependenceOverZ| 39)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(1 9 7 8 10 1 9 12 8 13 2 9
                                                   15 8 6 16 2 9 15 18 8 19 2 0
                                                   15 18 8 20 2 0 15 8 6 17 1 0
                                                   7 8 11 1 0 12 8 14)))))
           '|lookupComplete|)) 
