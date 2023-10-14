
(DEFUN |PMSYM;patternMatch;SP2Pmr;1| (|s| |p| |l| $)
  (PROG (#1=#:G109 |u|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 9)) (SPADCALL |p| |s| |l| (QREFELT $ 12)))
       ((SPADCALL |p| (QREFELT $ 13))
        (SEQ
         (EXIT
          (SEQ
           (SEQ
            (LETT |u| (SPADCALL |p| (QREFELT $ 15))
                  . #2=(|PMSYM;patternMatch;SP2Pmr;1|))
            (EXIT
             (COND
              ((QEQCAR |u| 0)
               (COND
                ((EQUAL (QCDR |u|) |s|)
                 (PROGN (LETT #1# |l| . #2#) (GO #1#))))))))
           (EXIT (SPADCALL (QREFELT $ 16)))))
         #1# (EXIT #1#)))
       ('T (SPADCALL (QREFELT $ 16)))))))) 

(DECLAIM (NOTINLINE |PatternMatchSymbol;|)) 

(DEFUN |PatternMatchSymbol| (#1=#:G113)
  (PROG ()
    (RETURN
     (PROG (#2=#:G114)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|PatternMatchSymbol|)
                                           '|domainEqualList|)
                . #3=(|PatternMatchSymbol|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|PatternMatchSymbol;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PatternMatchSymbol|))))))))))) 

(DEFUN |PatternMatchSymbol;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchSymbol|))
      (LETT |dv$| (LIST '|PatternMatchSymbol| DV$1) . #1#)
      (LETT $ (GETREFV 18) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PatternMatchSymbol| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PatternMatchSymbol| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (|Pattern| 6)
              (0 . |generic?|) (|Symbol|) (|PatternMatchResult| 6 10)
              (5 . |addMatch|) (12 . |constant?|) (|Union| 10 '"failed")
              (17 . |retractIfCan|) (22 . |failed|)
              |PMSYM;patternMatch;SP2Pmr;1|)
           '#(|patternMatch| 26) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 8 7 0 9 3 11 0 8 10 0 12 1
                                                   8 7 0 13 1 8 14 0 15 0 11 0
                                                   16 3 0 11 10 8 11 17)))))
           '|lookupComplete|)) 
