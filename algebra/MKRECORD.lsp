
(/VERSIONCHECK 2) 

(PUT '|MKRECORD;makeRecord;ST$R;1| '|SPADreplace| 'CONS) 

(DEFUN |MKRECORD;makeRecord;ST$R;1| (|s| |t| $) (CONS |s| |t|)) 

(DEFUN |MakeRecord| (&REST #1=#:G128)
  (PROG ()
    (RETURN
     (PROG (#2=#:G129)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MakeRecord|)
                                           '|domainEqualList|)
                . #3=(|MakeRecord|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MakeRecord;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|MakeRecord|))))))))))) 

(DEFUN |MakeRecord;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MakeRecord|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|MakeRecord| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 10) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MakeRecord| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MakeRecord| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |part1| 6) (|:| |part2| 7))
              |MKRECORD;makeRecord;ST$R;1|)
           '#(|makeRecord| 0) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#() (CONS '#() (|makeByteWordVec2| 9 '(2 0 8 6 7 9)))))
           '|lookupComplete|)) 
