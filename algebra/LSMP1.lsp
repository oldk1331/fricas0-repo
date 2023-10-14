
(/VERSIONCHECK 2) 

(DEFUN |LSMP1;solve;MVR;1| (|m| |c| $) (SPADCALL |m| |c| (QREFELT $ 12))) 

(DEFUN |LSMP1;solve;LVR;2| (|ll| |c| $)
  (SPADCALL (SPADCALL |ll| (QREFELT $ 15)) |c| (QREFELT $ 12))) 

(DEFUN |LSMP1;solve;MLL;3| (|m| |l| $) (SPADCALL |m| |l| (QREFELT $ 19))) 

(DEFUN |LSMP1;solve;LLL;4| (|ll| |l| $)
  (SPADCALL (SPADCALL |ll| (QREFELT $ 15)) |l| (QREFELT $ 19))) 

(DEFUN |LSMP1;particularSolution;MVU;5| (|m| |c| $)
  (SPADCALL |m| |c| (QREFELT $ 22))) 

(DEFUN |LSMP1;hasSolution?;MVB;6| (|m| |c| $) (SPADCALL |m| |c| (QREFELT $ 25))) 

(DEFUN |LSMP1;rank;MVNni;7| (|m| |c| $) (SPADCALL |m| |c| (QREFELT $ 28))) 

(DECLAIM (NOTINLINE |LinearSystemMatrixPackage1;|)) 

(DEFUN |LinearSystemMatrixPackage1| (#1=#:G117)
  (PROG ()
    (RETURN
     (PROG (#2=#:G118)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|LinearSystemMatrixPackage1|)
                                           '|domainEqualList|)
                . #3=(|LinearSystemMatrixPackage1|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|LinearSystemMatrixPackage1;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|LinearSystemMatrixPackage1|))))))))))) 

(DEFUN |LinearSystemMatrixPackage1;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LinearSystemMatrixPackage1|))
      (LETT |dv$| (LIST '|LinearSystemMatrixPackage1| DV$1) . #1#)
      (LETT $ (GETREFV 30) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|LinearSystemMatrixPackage1| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|LinearSystemMatrixPackage1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Union| 10 '"failed")
              (|Record| (|:| |particular| 7) (|:| |basis| 18)) (|Matrix| 6)
              (|Vector| 6) (|LinearSystemMatrixPackage| 6 10 10 9)
              (0 . |solve|) |LSMP1;solve;MVR;1| (|List| (|List| 6))
              (6 . |matrix|) |LSMP1;solve;LVR;2| (|List| 8) (|List| 10)
              (11 . |solve|) |LSMP1;solve;MLL;3| |LSMP1;solve;LLL;4|
              (17 . |particularSolution|) |LSMP1;particularSolution;MVU;5|
              (|Boolean|) (23 . |hasSolution?|) |LSMP1;hasSolution?;MVB;6|
              (|NonNegativeInteger|) (29 . |rank|) |LSMP1;rank;MVNni;7|)
           '#(|solve| 35 |rank| 59 |particularSolution| 65 |hasSolution?| 71)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 29
                                                 '(2 11 8 9 10 12 1 9 0 14 15 2
                                                   11 17 9 18 19 2 11 7 9 10 22
                                                   2 11 24 9 10 25 2 11 27 9 10
                                                   28 2 0 8 9 10 13 2 0 17 9 18
                                                   20 2 0 8 14 10 16 2 0 17 14
                                                   18 21 2 0 27 9 10 29 2 0 7 9
                                                   10 23 2 0 24 9 10 26)))))
           '|lookupComplete|)) 
