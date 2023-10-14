
(/VERSIONCHECK 2) 

(DEFUN |RULESET;ruleset;L$;1| (|l| $) (SPADCALL |l| (QREFELT $ 11))) 

(DEFUN |RULESET;coerce;$Of;2| (|x| $) (SPADCALL |x| (QREFELT $ 14))) 

(DEFUN |RULESET;=;2$B;3| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 17))) 

(DEFUN |RULESET;elt;$2F;4| (|x| |f| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 19)) |f| (QREFELT $ 21))) 

(DEFUN |RULESET;elt;$FPiF;5| (|r| |s| |n| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 19)) |s| |n| (QREFELT $ 24))) 

(DEFUN |RULESET;rules;$L;6| (|x| $) (SPADCALL |x| (QREFELT $ 26))) 

(DECLAIM (NOTINLINE |Ruleset;|)) 

(DEFUN |Ruleset| (&REST #1=#:G133)
  (PROG ()
    (RETURN
     (PROG (#2=#:G134)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|Ruleset|)
                                           '|domainEqualList|)
                . #3=(|Ruleset|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |Ruleset;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Ruleset|))))))))))) 

(DEFUN |Ruleset;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Ruleset|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|Ruleset| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 30) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Ruleset| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|Set| (|RewriteRule| |#1| |#2| |#3|)))
      $)))) 

(MAKEPROP '|Ruleset| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (|List| (|RewriteRule| 6 7 8)) (0 . |set|)
              |RULESET;ruleset;L$;1| (|OutputForm|) (5 . |coerce|)
              |RULESET;coerce;$Of;2| (|Boolean|) (10 . =) |RULESET;=;2$B;3|
              |RULESET;rules;$L;6| (|ApplyRules| 6 7 8) (16 . |applyRules|)
              |RULESET;elt;$2F;4| (|PositiveInteger|) (22 . |applyRules|)
              |RULESET;elt;$FPiF;5| (29 . |parts|) (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 34 |ruleset| 40 |rules| 45 |latex| 50 |hashUpdate!| 55 |hash|
              61 |elt| 66 |coerce| 79 = 84)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|Eltable| 8 8)
                           (|CoercibleTo| 13))
                        (|makeByteWordVec2| 29
                                            '(1 9 0 10 11 1 9 13 0 14 2 9 16 0
                                              0 17 2 20 8 10 8 21 3 20 8 10 8
                                              23 24 1 9 10 0 26 2 0 16 0 0 1 1
                                              0 0 10 12 1 0 10 0 19 1 0 27 0 1
                                              2 0 29 29 0 1 1 0 28 0 1 3 0 8 0
                                              8 23 25 2 0 8 0 8 22 1 0 13 0 15
                                              2 0 16 0 0 18)))))
           '|lookupComplete|)) 
