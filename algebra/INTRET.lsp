
(/VERSIONCHECK 2) 

(DEFUN |INTRET;integer;SI;1| (|s| $) (SPADCALL |s| (QREFELT $ 8))) 

(DEFUN |INTRET;integer?;SB;2| (|s| $) (QEQCAR (SPADCALL |s| (QREFELT $ 11)) 0)) 

(DEFUN |INTRET;integerIfCan;SU;3| (|s| $) (SPADCALL |s| (QREFELT $ 11))) 

(DEFUN |IntegerRetractions| (#1=#:G136)
  (PROG ()
    (RETURN
     (PROG (#2=#:G137)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|IntegerRetractions|)
                                           '|domainEqualList|)
                . #3=(|IntegerRetractions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|IntegerRetractions;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|IntegerRetractions|))))))))))) 

(DEFUN |IntegerRetractions;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegerRetractions|))
      (LETT |dv$| (LIST '|IntegerRetractions| DV$1) . #1#)
      (LETT $ (GETREFV 15) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|IntegerRetractions| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|IntegerRetractions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              (0 . |retract|) |INTRET;integer;SI;1| (|Union| 7 '"failed")
              (5 . |retractIfCan|) (|Boolean|) |INTRET;integer?;SB;2|
              |INTRET;integerIfCan;SU;3|)
           '#(|integerIfCan| 10 |integer?| 15 |integer| 20) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 14
                                                 '(1 6 7 0 8 1 6 10 0 11 1 0 10
                                                   6 14 1 0 12 6 13 1 0 7 6
                                                   9)))))
           '|lookupComplete|)) 
