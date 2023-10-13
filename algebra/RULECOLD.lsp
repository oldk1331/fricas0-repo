
(/VERSIONCHECK 2) 

(DEFUN |RULECOLD;name;$S;1| (|r| $) (QREFELT $ 6)) 

(DEFUN |RULECOLD;coerce;$Of;2| (|r| $) (SPADCALL (QREFELT $ 6) (QREFELT $ 10))) 

(PUT '|RULECOLD;=;2$B;3| '|SPADreplace| '(XLAM (|x| |y|) 'T)) 

(DEFUN |RULECOLD;=;2$B;3| (|x| |y| $) 'T) 

(DEFUN |RULECOLD;latex;$S;4| (|x| $) (SPADCALL (QREFELT $ 6) (QREFELT $ 15))) 

(DEFUN |RuleCalled| (#1=#:G129)
  (PROG ()
    (RETURN
     (PROG (#2=#:G130)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|RuleCalled|)
                                           '|domainEqualList|)
                . #3=(|RuleCalled|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|RuleCalled;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|RuleCalled|))))))))))) 

(DEFUN |RuleCalled;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RuleCalled|))
      (LETT |dv$| (LIST '|RuleCalled| DV$1) . #1#)
      (LETT $ (GETREFV 18) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RuleCalled| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RuleCalled| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              |RULECOLD;name;$S;1| (|OutputForm|) (0 . |coerce|)
              |RULECOLD;coerce;$Of;2| (|Boolean|) |RULECOLD;=;2$B;3| (|String|)
              (5 . |latex|) |RULECOLD;latex;$S;4| (|SingleInteger|))
           '#(~= 10 |name| 16 |latex| 21 |hash| 26 |coerce| 31 = 36) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 9))
                        (|makeByteWordVec2| 17
                                            '(1 7 9 0 10 1 7 14 0 15 2 0 12 0 0
                                              1 1 0 7 0 8 1 0 14 0 16 1 0 17 0
                                              1 1 0 9 0 11 2 0 12 0 0 13)))))
           '|lookupComplete|)) 
