
(/VERSIONCHECK 2) 

(DEFUN |RATRET;rational;SF;1| (|s| $) (SPADCALL |s| (QREFELT $ 8))) 

(DEFUN |RATRET;rational?;SB;2| (|s| $) (QEQCAR (SPADCALL |s| (QREFELT $ 11)) 0)) 

(DEFUN |RATRET;rationalIfCan;SU;3| (|s| $) (SPADCALL |s| (QREFELT $ 11))) 

(DECLAIM (NOTINLINE |RationalRetractions;|)) 

(DEFUN |RationalRetractions| (#1=#:G112)
  (PROG ()
    (RETURN
     (PROG (#2=#:G113)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|RationalRetractions|)
                                           '|domainEqualList|)
                . #3=(|RationalRetractions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|RationalRetractions;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|RationalRetractions|))))))))))) 

(DEFUN |RationalRetractions;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalRetractions|))
      (LETT |dv$| (LIST '|RationalRetractions| DV$1) . #1#)
      (LETT $ (GETREFV 15) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RationalRetractions| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RationalRetractions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Fraction| (|Integer|))
              (0 . |retract|) |RATRET;rational;SF;1| (|Union| 7 '"failed")
              (5 . |retractIfCan|) (|Boolean|) |RATRET;rational?;SB;2|
              |RATRET;rationalIfCan;SU;3|)
           '#(|rationalIfCan| 10 |rational?| 15 |rational| 20) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 14
                                                 '(1 6 7 0 8 1 6 10 0 11 1 0 10
                                                   6 14 1 0 12 6 13 1 0 7 6
                                                   9)))))
           '|lookupComplete|)) 
