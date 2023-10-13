
(/VERSIONCHECK 2) 

(PUT '|SUCH;construct;S1S2$;1| '|SPADreplace| 'CONS) 

(DEFUN |SUCH;construct;S1S2$;1| (|o| |c| $) (CONS |o| |c|)) 

(PUT '|SUCH;lhs;$S1;2| '|SPADreplace| 'QCAR) 

(DEFUN |SUCH;lhs;$S1;2| (|st| $) (QCAR |st|)) 

(PUT '|SUCH;rhs;$S2;3| '|SPADreplace| 'QCDR) 

(DEFUN |SUCH;rhs;$S2;3| (|st| $) (QCDR |st|)) 

(DEFUN |SUCH;coerce;$Of;4| (|w| $)
  (SPADCALL "|" (SPADCALL (QCAR |w|) (QREFELT $ 13))
            (SPADCALL (QCDR |w|) (QREFELT $ 14)) (QREFELT $ 15))) 

(DEFUN |SuchThat| (&REST #1=#:G132)
  (PROG ()
    (RETURN
     (PROG (#2=#:G133)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SuchThat|)
                                           '|domainEqualList|)
                . #3=(|SuchThat|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SuchThat;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|SuchThat|))))))))))) 

(DEFUN |SuchThat;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SuchThat|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|SuchThat| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 20) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SuchThat| (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|Record| (|:| |obj| |#1|) (|:| |cond| |#2|)))
      $)))) 

(MAKEPROP '|SuchThat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              |SUCH;construct;S1S2$;1| |SUCH;lhs;$S1;2| |SUCH;rhs;$S2;3|
              (|OutputForm|) (0 . |coerce|) (5 . |coerce|) (10 . |infix|)
              |SUCH;coerce;$Of;4| (|String|) (|SingleInteger|) (|Boolean|))
           '#(~= 17 |rhs| 23 |lhs| 28 |latex| 33 |hash| 38 |construct| 43
              |coerce| 49 = 54)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 12))
                        (|makeByteWordVec2| 19
                                            '(1 6 12 0 13 1 7 12 0 14 3 12 0 0
                                              0 0 15 2 0 19 0 0 1 1 0 7 0 11 1
                                              0 6 0 10 1 0 17 0 1 1 0 18 0 1 2
                                              0 0 6 7 9 1 0 12 0 16 2 0 19 0 0
                                              1)))))
           '|lookupComplete|)) 
