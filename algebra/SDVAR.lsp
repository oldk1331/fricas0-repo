
(/VERSIONCHECK 2) 

(PUT '|SDVAR;makeVariable;SNni$;1| '|SPADreplace| 'CONS) 

(DEFUN |SDVAR;makeVariable;SNni$;1| (|s| |n| $) (CONS |s| |n|)) 

(PUT '|SDVAR;variable;$S;2| '|SPADreplace| 'QCAR) 

(DEFUN |SDVAR;variable;$S;2| (|v| $) (QCAR |v|)) 

(PUT '|SDVAR;order;$Nni;3| '|SPADreplace| 'QCDR) 

(DEFUN |SDVAR;order;$Nni;3| (|v| $) (QCDR |v|)) 

(DEFUN |SDVAR;<;2$B;4| (|v| |u| $)
  (COND
   ((SPADCALL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10))
              (QREFELT $ 13))
    (< (SPADCALL |v| (QREFELT $ 11)) (SPADCALL |u| (QREFELT $ 11))))
   ('T
    (SPADCALL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10))
              (QREFELT $ 14))))) 

(DEFUN |SequentialDifferentialVariable| (#1=#:G139)
  (PROG ()
    (RETURN
     (PROG (#2=#:G140)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SequentialDifferentialVariable|)
                                           '|domainEqualList|)
                . #3=(|SequentialDifferentialVariable|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|SequentialDifferentialVariable;| #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SequentialDifferentialVariable|))))))))))) 

(DEFUN |SequentialDifferentialVariable;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SequentialDifferentialVariable|))
      (LETT |dv$| (LIST '|SequentialDifferentialVariable| DV$1) . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SequentialDifferentialVariable|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record| (|:| |var| |#1|) (|:| |ord| (|NonNegativeInteger|))))
      $)))) 

(MAKEPROP '|SequentialDifferentialVariable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) |SDVAR;makeVariable;SNni$;1|
              |SDVAR;variable;$S;2| |SDVAR;order;$Nni;3| (|Boolean|) (0 . =)
              (6 . <) |SDVAR;<;2$B;4| (|Union| 6 '"failed") (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 12 |weight| 18 |variable| 23 |smaller?| 28 |retractIfCan| 34
              |retract| 39 |order| 44 |min| 49 |max| 55 |makeVariable| 61
              |latex| 67 |hashUpdate!| 72 |hash| 78 |differentiate| 83 |coerce|
              94 >= 104 > 110 = 116 <= 122 < 128)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|DifferentialVariableCategory&| |OrderedSet&| NIL
                     |SetCategory&| |BasicType&| |RetractableTo&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|DifferentialVariableCategory| 6) (|OrderedSet|)
                      (|Comparable|) (|SetCategory|) (|BasicType|)
                      (|RetractableTo| 6) (|PartialOrder|) (|CoercibleTo| 20))
                   (|makeByteWordVec2| 20
                                       '(2 6 12 0 0 13 2 6 12 0 0 14 2 0 12 0 0
                                         1 1 0 8 0 1 1 0 6 0 10 2 0 12 0 0 1 1
                                         0 16 0 1 1 0 6 0 1 1 0 8 0 11 2 0 0 0
                                         0 1 2 0 0 0 0 1 2 0 0 6 8 9 1 0 17 0 1
                                         2 0 19 19 0 1 1 0 18 0 1 1 0 0 0 1 2 0
                                         0 0 8 1 1 0 0 6 1 1 0 20 0 1 2 0 12 0
                                         0 1 2 0 12 0 0 1 2 0 12 0 0 1 2 0 12 0
                                         0 1 2 0 12 0 0 15)))))
           '|lookupComplete|)) 
