
(DEFUN |ONECOMP2;map;MOpcOpc;1| (|f| |r| $)
  (SPADCALL |f| |r| (SPADCALL (QREFELT $ 9)) (QREFELT $ 12))) 

(DEFUN |ONECOMP2;map;MOpc2Opc;2| (|f| |r| |i| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |r| (QREFELT $ 15)) |ONECOMP2;map;MOpc2Opc;2|)
          (EXIT
           (COND
            ((QEQCAR |u| 0)
             (SPADCALL (SPADCALL (QCDR |u|) |f|) (QREFELT $ 16)))
            ('T |i|))))))) 

(DECLAIM (NOTINLINE |OnePointCompletionFunctions2;|)) 

(DEFUN |OnePointCompletionFunctions2| (&REST #1=#:G110)
  (PROG ()
    (RETURN
     (PROG (#2=#:G111)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|OnePointCompletionFunctions2|)
                                           '|domainEqualList|)
                . #3=(|OnePointCompletionFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |OnePointCompletionFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|OnePointCompletionFunctions2|))))))))))) 

(DEFUN |OnePointCompletionFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|OnePointCompletionFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|OnePointCompletionFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 17) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OnePointCompletionFunctions2|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|OnePointCompletionFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|OnePointCompletion| 7) (0 . |infinity|) (|Mapping| 7 6)
              (|OnePointCompletion| 6) |ONECOMP2;map;MOpc2Opc;2|
              |ONECOMP2;map;MOpcOpc;1| (|Union| 6 '"failed")
              (4 . |retractIfCan|) (9 . |coerce|))
           '#(|map| 14) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(0 8 0 9 1 11 14 0 15 1 8 0 7
                                                   16 3 0 8 10 11 8 12 2 0 8 10
                                                   11 13)))))
           '|lookupComplete|)) 
