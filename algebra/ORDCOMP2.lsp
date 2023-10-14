
(/VERSIONCHECK 2) 

(DEFUN |ORDCOMP2;map;MOcOc;1| (|f| |r| $)
  (SPADCALL |f| |r| (SPADCALL (QREFELT $ 9)) (SPADCALL (QREFELT $ 10))
            (QREFELT $ 13))) 

(DEFUN |ORDCOMP2;map;MOc3Oc;2| (|f| |r| |p| |m| $)
  (PROG (|n|)
    (RETURN
     (COND
      ((|zero?_SI|
        (LETT |n| (SPADCALL |r| (QREFELT $ 16)) |ORDCOMP2;map;MOc3Oc;2|))
       (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 17)) |f|) (QREFELT $ 18)))
      ((|eql_SI| |n| 1) |p|) ('T |m|))))) 

(DECLAIM (NOTINLINE |OrderedCompletionFunctions2;|)) 

(DEFUN |OrderedCompletionFunctions2| (&REST #1=#:G108)
  (PROG ()
    (RETURN
     (PROG (#2=#:G109)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|OrderedCompletionFunctions2|)
                                           '|domainEqualList|)
                . #3=(|OrderedCompletionFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |OrderedCompletionFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|OrderedCompletionFunctions2|))))))))))) 

(DEFUN |OrderedCompletionFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|OrderedCompletionFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|OrderedCompletionFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OrderedCompletionFunctions2|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|OrderedCompletionFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|OrderedCompletion| 7) (0 . |plusInfinity|)
              (4 . |minusInfinity|) (|Mapping| 7 6) (|OrderedCompletion| 6)
              |ORDCOMP2;map;MOc3Oc;2| |ORDCOMP2;map;MOcOc;1| (|SingleInteger|)
              (8 . |whatInfinity|) (13 . |retract|) (18 . |coerce|))
           '#(|map| 23) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(0 8 0 9 0 8 0 10 1 12 15 0
                                                   16 1 12 6 0 17 1 8 0 7 18 4
                                                   0 8 11 12 8 8 13 2 0 8 11 12
                                                   14)))))
           '|lookupComplete|)) 
