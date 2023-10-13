
(/VERSIONCHECK 2) 

(DEFUN |EXPR2;map;MEE;1| (|f| |r| $) (SPADCALL |f| |r| (QREFELT $ 12))) 

(DEFUN |EXPR2;map;MEE;2| (|f| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|EXPR2;map;MEE;2!0| (VECTOR $ |f|))
               (SPADCALL |r| (QREFELT $ 15)) (QREFELT $ 19))))) 

(DEFUN |EXPR2;map;MEE;2!0| (|x| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|EXPR2;map;MEE;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |f| |x| (QREFELT $ 13)))))) 

(DEFUN |EXPR2;map;MEE;3| (|f| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|EXPR2;map;MEE;3!0| (VECTOR $ |f|))
               (SPADCALL |r| (QREFELT $ 15)) (QREFELT $ 19))))) 

(DEFUN |EXPR2;map;MEE;3!0| (|x| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|EXPR2;map;MEE;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |f| |x| (QREFELT $ 13)))))) 

(DEFUN |ExpressionFunctions2| (&REST #1=#:G133)
  (PROG ()
    (RETURN
     (PROG (#2=#:G134)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ExpressionFunctions2|)
                                           '|domainEqualList|)
                . #3=(|ExpressionFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ExpressionFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ExpressionFunctions2|))))))))))) 

(DEFUN |ExpressionFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ExpressionFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 20) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ExpressionFunctions2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#2| '(|Ring|))
        (COND
         ((|HasCategory| |#1| '(|Ring|))
          (QSETREFV $ 13 (CONS (|dispatchFunction| |EXPR2;map;MEE;1|) $)))
         ('T (QSETREFV $ 13 (CONS (|dispatchFunction| |EXPR2;map;MEE;2|) $)))))
       ('T (QSETREFV $ 13 (CONS (|dispatchFunction| |EXPR2;map;MEE;3|) $))))
      $)))) 

(MAKEPROP '|ExpressionFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Expression| 7) (|Mapping| 7 6) (|Expression| 6)
              (|FunctionSpaceFunctions2| 6 10 7 8) (0 . |map|) (6 . |map|)
              (|Kernel| $) (12 . |retract|) (|Mapping| 8 10) (|Kernel| 10)
              (|ExpressionSpaceFunctions2| 10 8) (17 . |map|))
           '#(|map| 23) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(2 11 8 9 10 12 2 0 8 9 10 13
                                                   1 10 14 0 15 2 18 8 16 17 19
                                                   2 0 8 9 10 13)))))
           '|lookupComplete|)) 
