
(DEFUN |PMQFCAT;patternMatch;QP2Pmr;1| (|x| |p| |l| $)
  (PROG (|ur| |u| #1=#:G107 |r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 11)) (SPADCALL |p| |x| |l| (QREFELT $ 13)))
       ((QEQCAR
         (LETT |r| (SPADCALL |x| (QREFELT $ 15))
               . #2=(|PMQFCAT;patternMatch;QP2Pmr;1|))
         0)
        (SPADCALL
         (PROG2 (LETT #1# |r| . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
         |p| |l| (QREFELT $ 17)))
       (#3='T
        (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 20)) . #2#)
             (EXIT
              (COND
               ((QEQCAR |u| 0)
                (SEQ (LETT |ur| (QCDR |u|) . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL
                         (LETT |l|
                               (SPADCALL (SPADCALL |x| (QREFELT $ 21))
                                         (QCAR |ur|) |l| (QREFELT $ 17))
                               . #2#)
                         (QREFELT $ 22))
                        |l|)
                       (#3#
                        (SPADCALL (SPADCALL |x| (QREFELT $ 23)) (QCDR |ur|) |l|
                                  (QREFELT $ 17)))))))
               (#3# (SPADCALL (QREFELT $ 24)))))))))))) 

(DECLAIM (NOTINLINE |PatternMatchQuotientFieldCategory;|)) 

(DEFUN |PatternMatchQuotientFieldCategory| (&REST #1=#:G118)
  (PROG ()
    (RETURN
     (PROG (#2=#:G119)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PatternMatchQuotientFieldCategory|)
                                           '|domainEqualList|)
                . #3=(|PatternMatchQuotientFieldCategory|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |PatternMatchQuotientFieldCategory;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|PatternMatchQuotientFieldCategory|))))))))))) 

(DEFUN |PatternMatchQuotientFieldCategory;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchQuotientFieldCategory|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|PatternMatchQuotientFieldCategory| DV$1 DV$2 DV$3)
            . #1#)
      (LETT $ (GETREFV 26) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PatternMatchQuotientFieldCategory|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PatternMatchQuotientFieldCategory| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Boolean|) (|Pattern| 6) (0 . |generic?|)
              (|PatternMatchResult| 6 8) (5 . |addMatch|) (|Union| 7 '"failed")
              (12 . |retractIfCan|) (|PatternMatchPushDown| 6 7 8)
              (17 . |patternMatch|) (|Record| (|:| |num| $) (|:| |den| $))
              (|Union| 18 '"failed") (24 . |isQuotient|) (29 . |numer|)
              (34 . |failed?|) (39 . |denom|) (44 . |failed|)
              |PMQFCAT;patternMatch;QP2Pmr;1|)
           '#(|patternMatch| 48) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 25
                                                 '(1 10 9 0 11 3 12 0 10 8 0 13
                                                   1 8 14 0 15 3 16 12 7 10 12
                                                   17 1 10 19 0 20 1 8 7 0 21 1
                                                   12 9 0 22 1 8 7 0 23 0 12 0
                                                   24 3 0 12 8 10 12 25)))))
           '|lookupComplete|)) 
