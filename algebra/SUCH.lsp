
(PUT '|SUCH;construct;S1S2$;1| '|SPADreplace| 'CONS) 

(SDEFUN |SUCH;construct;S1S2$;1| ((|o| S1) (|c| S2) ($ $)) (CONS |o| |c|)) 

(PUT '|SUCH;lhs;$S1;2| '|SPADreplace| 'QCAR) 

(SDEFUN |SUCH;lhs;$S1;2| ((|st| $) ($ S1)) (QCAR |st|)) 

(PUT '|SUCH;rhs;$S2;3| '|SPADreplace| 'QCDR) 

(SDEFUN |SUCH;rhs;$S2;3| ((|st| $) ($ S2)) (QCDR |st|)) 

(SDEFUN |SUCH;coerce;$Of;4| ((|w| $) ($ |OutputForm|))
        (SPADCALL "|" (SPADCALL (QCAR |w|) (QREFELT $ 13))
                  (SPADCALL (QCDR |w|) (QREFELT $ 14)) (QREFELT $ 15))) 

(DECLAIM (NOTINLINE |SuchThat;|)) 

(DEFUN |SuchThat| (&REST #1=#:G110)
  (SPROG NIL
         (PROG (#2=#:G111)
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
                  (PROG1 (APPLY (|function| |SuchThat;|) #1#)
                    (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|SuchThat|)))))))))) 

(DEFUN |SuchThat;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SuchThat|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SuchThat| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 21) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SuchThat| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|Record| (|:| |obj| |#1|) (|:| |cond| |#2|)))
          $))) 

(MAKEPROP '|SuchThat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              |SUCH;construct;S1S2$;1| |SUCH;lhs;$S1;2| |SUCH;rhs;$S2;3|
              (|OutputForm|) (0 . |coerce|) (5 . |coerce|) (10 . |infix|)
              |SUCH;coerce;$Of;4| (|String|) (|SingleInteger|) (|HashState|)
              (|Boolean|))
           '#(~= 17 |rhs| 23 |lhs| 28 |latex| 33 |hashUpdate!| 38 |hash| 44
              |construct| 49 |coerce| 55 = 60)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 12))
                        (|makeByteWordVec2| 20
                                            '(1 6 12 0 13 1 7 12 0 14 3 12 0 0
                                              0 0 15 2 0 20 0 0 1 1 0 7 0 11 1
                                              0 6 0 10 1 0 17 0 1 2 0 19 19 0 1
                                              1 0 18 0 1 2 0 0 6 7 9 1 0 12 0
                                              16 2 0 20 0 0 1)))))
           '|lookupComplete|)) 
