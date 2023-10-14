
(/VERSIONCHECK 2) 

(DEFUN |FUNCTION;name;$S;1| (|r| $) (QREFELT $ 6)) 

(DEFUN |FUNCTION;coerce;$Of;2| (|r| $) (SPADCALL (QREFELT $ 6) (QREFELT $ 10))) 

(PUT '|FUNCTION;=;2$B;3| '|SPADreplace| '(XLAM (|x| |y|) 'T)) 

(DEFUN |FUNCTION;=;2$B;3| (|x| |y| $) 'T) 

(DEFUN |FUNCTION;latex;$S;4| (|x| $) (SPADCALL (QREFELT $ 6) (QREFELT $ 15))) 

(DECLAIM (NOTINLINE |FunctionCalled;|)) 

(DEFUN |FunctionCalled| (#1=#:G107)
  (PROG ()
    (RETURN
     (PROG (#2=#:G108)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|FunctionCalled|)
                                           '|domainEqualList|)
                . #3=(|FunctionCalled|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|FunctionCalled;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|FunctionCalled|))))))))))) 

(DEFUN |FunctionCalled;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionCalled|))
      (LETT |dv$| (LIST '|FunctionCalled| DV$1) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FunctionCalled| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FunctionCalled| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              |FUNCTION;name;$S;1| (|OutputForm|) (0 . |coerce|)
              |FUNCTION;coerce;$Of;2| (|Boolean|) |FUNCTION;=;2$B;3| (|String|)
              (5 . |latex|) |FUNCTION;latex;$S;4| (|HashState|)
              (|SingleInteger|))
           '#(~= 10 |name| 16 |latex| 21 |hashUpdate!| 26 |hash| 32 |coerce| 37
              = 42)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 9))
                        (|makeByteWordVec2| 18
                                            '(1 7 9 0 10 1 7 14 0 15 2 0 12 0 0
                                              1 1 0 7 0 8 1 0 14 0 16 2 0 17 17
                                              0 1 1 0 18 0 1 1 0 9 0 11 2 0 12
                                              0 0 13)))))
           '|lookupComplete|)) 
