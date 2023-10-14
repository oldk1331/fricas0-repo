
(/VERSIONCHECK 2) 

(DEFUN |ZLINDEP;linearlyDependentOverZ?;VB;1| (|v| $)
  (SPADCALL |v| (QREFELT $ 10))) 

(DEFUN |ZLINDEP;linearDependenceOverZ;VU;2| (|v| $)
  (SPADCALL |v| (QREFELT $ 13))) 

(DEFUN |ZLINDEP;particularSolutionOverQ;VRU;3| (|v| |c| $)
  (SPADCALL |v| |c| (QREFELT $ 16))) 

(DEFUN |ZLINDEP;particularSolutionOverQ;MVU;4| (|m| |v| $)
  (SPADCALL |m| |v| (QREFELT $ 19))) 

(DEFUN |ZLINDEP;solveLinearlyOverQ;VRR;5| (|v| |c| $)
  (SPADCALL |v| |c| (QREFELT $ 22))) 

(DEFUN |ZLINDEP;solveLinearlyOverQ;MVR;6| (|m| |v| $)
  (SPADCALL |m| |v| (QREFELT $ 24))) 

(DECLAIM (NOTINLINE |IntegerLinearDependence;|)) 

(DEFUN |IntegerLinearDependence| (#1=#:G120)
  (PROG ()
    (RETURN
     (PROG (#2=#:G121)
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
      (LETT $ (GETREFV 26) . #1#)
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
              (10 . |particularSolution|)
              |ZLINDEP;particularSolutionOverQ;VRU;3| (|Matrix| 6)
              (16 . |particularSolution|)
              |ZLINDEP;particularSolutionOverQ;MVU;4|
              (|Record| (|:| |particular| 15)
                        (|:| |basis|
                             (|List| (|Vector| (|Fraction| (|Integer|))))))
              (22 . |solveLinear|) |ZLINDEP;solveLinearlyOverQ;VRR;5|
              (28 . |solveLinear|) |ZLINDEP;solveLinearlyOverQ;MVR;6|)
           '#(|solveLinearlyOverQ| 34 |particularSolutionOverQ| 46
              |linearlyDependentOverZ?| 58 |linearDependenceOverZ| 63)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 25
                                                 '(1 9 7 8 10 1 9 12 8 13 2 9
                                                   15 8 6 16 2 9 15 18 8 19 2 9
                                                   21 8 6 22 2 9 21 18 8 24 2 0
                                                   21 18 8 25 2 0 21 8 6 23 2 0
                                                   15 8 6 17 2 0 15 18 8 20 1 0
                                                   7 8 11 1 0 12 8 14)))))
           '|lookupComplete|)) 
