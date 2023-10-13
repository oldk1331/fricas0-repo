
(/VERSIONCHECK 2) 

(DEFUN |ODEPAL;algDsolve;LodoRR;1| (|l| |g| $)
  (PROG (|u| |bas| #1=#:G145 |v| #2=#:G144 |sol| |rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |l| |g| (QREFELT $ 13))
            . #3=(|ODEPAL;algDsolve;LodoRR;1|))
      (LETT |sol|
            (SPADCALL (QCAR |rec|) (QCDR |rec|) (ELT $ 19) (QREFELT $ 26))
            . #3#)
      (LETT |bas|
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |v| NIL . #3#) (LETT #1# (QCDR |sol|) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 29)) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (LETT |u| (QCAR |sol|) . #3#)
      (EXIT
       (COND
        ((QEQCAR |u| 0)
         (CONS (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 29))) |bas|))
        ('T (CONS (CONS 1 "failed") |bas|)))))))) 

(DEFUN |PureAlgebraicLODE| (&REST #1=#:G146)
  (PROG ()
    (RETURN
     (PROG (#2=#:G147)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PureAlgebraicLODE|)
                                           '|domainEqualList|)
                . #3=(|PureAlgebraicLODE|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PureAlgebraicLODE;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PureAlgebraicLODE|))))))))))) 

(DEFUN |PureAlgebraicLODE;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PureAlgebraicLODE|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|PureAlgebraicLODE| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 33) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PureAlgebraicLODE|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PureAlgebraicLODE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|)
              (|Record| (|:| |mat| 22) (|:| |vec| 23))
              (|LinearOrdinaryDifferentialOperator1| 9)
              (|ReduceLODE| 17 16 8 9 11) (0 . |reduceLODE|)
              (|Union| 17 '"failed")
              (|Record| (|:| |particular| 14) (|:| |basis| (|List| 17)))
              (|LinearOrdinaryDifferentialOperator1| 17) (|Fraction| 7)
              (|RationalLODE| 6 7) (6 . |ratDsolve|) (|Union| 23 '"failed")
              (|Record| (|:| |particular| 20) (|:| |basis| (|List| 23)))
              (|Matrix| 16) (|Vector| 17) (|Mapping| 15 16 17)
              (|SystemODESolver| 17 16) (12 . |solveInField|) (|Vector| $)
              (19 . |basis|) (23 . |represents|) (|Union| 9 '"failed")
              (|Record| (|:| |particular| 30) (|:| |basis| (|List| 9)))
              |ODEPAL;algDsolve;LodoRR;1|)
           '#(|algDsolve| 28) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 32
                                                 '(2 12 10 11 9 13 2 18 15 16
                                                   17 19 3 25 21 22 23 24 26 0
                                                   9 27 28 1 9 0 23 29 2 0 31
                                                   11 9 32)))))
           '|lookupComplete|)) 
