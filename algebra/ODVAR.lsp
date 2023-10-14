
(/VERSIONCHECK 2) 

(PUT '|ODVAR;makeVariable;SNni$;1| '|SPADreplace| 'CONS) 

(DEFUN |ODVAR;makeVariable;SNni$;1| (|s| |n| $) (CONS |s| |n|)) 

(PUT '|ODVAR;variable;$S;2| '|SPADreplace| 'QCAR) 

(DEFUN |ODVAR;variable;$S;2| (|v| $) (QCAR |v|)) 

(PUT '|ODVAR;order;$Nni;3| '|SPADreplace| 'QCDR) 

(DEFUN |ODVAR;order;$Nni;3| (|v| $) (QCDR |v|)) 

(DEFUN |OrderlyDifferentialVariable| (#1=#:G133)
  (PROG ()
    (RETURN
     (PROG (#2=#:G134)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|OrderlyDifferentialVariable|)
                                           '|domainEqualList|)
                . #3=(|OrderlyDifferentialVariable|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|OrderlyDifferentialVariable;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|OrderlyDifferentialVariable|))))))))))) 

(DEFUN |OrderlyDifferentialVariable;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|OrderlyDifferentialVariable|))
      (LETT |dv$| (LIST '|OrderlyDifferentialVariable| DV$1) . #1#)
      (LETT $ (GETREFV 18) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OrderlyDifferentialVariable|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record| (|:| |var| |#1|) (|:| |ord| (|NonNegativeInteger|))))
      $)))) 

(MAKEPROP '|OrderlyDifferentialVariable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) |ODVAR;makeVariable;SNni$;1|
              |ODVAR;variable;$S;2| |ODVAR;order;$Nni;3| (|Union| 6 '"failed")
              (|Boolean|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 0 |weight| 6 |variable| 11 |smaller?| 16 |retractIfCan| 22
              |retract| 27 |order| 32 |min| 37 |max| 43 |makeVariable| 49
              |latex| 55 |hashUpdate!| 60 |hash| 66 |differentiate| 71 |coerce|
              82 >= 92 > 98 = 104 <= 110 < 116)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|DifferentialVariableCategory&| |OrderedSet&| NIL
                     |SetCategory&| |BasicType&| |RetractableTo&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|DifferentialVariableCategory| 6) (|OrderedSet|)
                      (|Comparable|) (|SetCategory|) (|BasicType|)
                      (|RetractableTo| 6) (|PartialOrder|) (|CoercibleTo| 17))
                   (|makeByteWordVec2| 17
                                       '(2 0 13 0 0 1 1 0 8 0 1 1 0 6 0 10 2 0
                                         13 0 0 1 1 0 12 0 1 1 0 6 0 1 1 0 8 0
                                         11 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 6 8 9
                                         1 0 14 0 1 2 0 16 16 0 1 1 0 15 0 1 1
                                         0 0 0 1 2 0 0 0 8 1 1 0 0 6 1 1 0 17 0
                                         1 2 0 13 0 0 1 2 0 13 0 0 1 2 0 13 0 0
                                         1 2 0 13 0 0 1 2 0 13 0 0 1)))))
           '|lookupComplete|)) 
