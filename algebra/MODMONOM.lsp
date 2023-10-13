
(/VERSIONCHECK 2) 

(DEFUN |MODMONOM;<;2$B;1| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 8))) 

(PUT '|MODMONOM;exponent;$E;2| '|SPADreplace| 'QCDR) 

(DEFUN |MODMONOM;exponent;$E;2| (|x| $) (QCDR |x|)) 

(PUT '|MODMONOM;index;$IS;3| '|SPADreplace| 'QCAR) 

(DEFUN |MODMONOM;index;$IS;3| (|x| $) (QCAR |x|)) 

(PUT '|MODMONOM;coerce;$R;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |MODMONOM;coerce;$R;4| (|x| $) |x|) 

(PUT '|MODMONOM;coerce;R$;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |MODMONOM;coerce;R$;5| (|x| $) |x|) 

(PUT '|MODMONOM;construct;ISE$;6| '|SPADreplace| 'CONS) 

(DEFUN |MODMONOM;construct;ISE$;6| (|i| |e| $) (CONS |i| |e|)) 

(DEFUN |ModuleMonomial| (&REST #1=#:G138)
  (PROG ()
    (RETURN
     (PROG (#2=#:G139)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ModuleMonomial|)
                                           '|domainEqualList|)
                . #3=(|ModuleMonomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ModuleMonomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|ModuleMonomial|))))))))))) 

(DEFUN |ModuleMonomial;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ModuleMonomial|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|ModuleMonomial| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 20) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ModuleMonomial| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|Record| (|:| |index| |#1|) (|:| |exponent| |#2|)))
      $)))) 

(MAKEPROP '|ModuleMonomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Record| (|:| |index| 6) (|:| |exponent| 7))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Boolean|)
              |MODMONOM;<;2$B;1| |MODMONOM;exponent;$E;2|
              |MODMONOM;index;$IS;3| |MODMONOM;coerce;$R;4|
              |MODMONOM;coerce;R$;5| |MODMONOM;construct;ISE$;6|
              (|SingleInteger|) (|String|) (|OutputForm|))
           '#(~= 0 |smaller?| 6 |min| 12 |max| 18 |latex| 24 |index| 29 |hash|
              34 |exponent| 39 |construct| 44 |coerce| 50 >= 65 > 71 = 77 <= 83
              < 89)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|BasicType|) (|PartialOrder|) (|CoercibleTo| 19))
                   (|makeByteWordVec2| 19
                                       '(2 0 10 0 0 1 2 0 10 0 0 1 2 0 0 0 0 1
                                         2 0 0 0 0 1 1 0 18 0 1 1 0 6 0 13 1 0
                                         17 0 1 1 0 7 0 12 2 0 0 6 7 16 1 0 5 0
                                         14 1 0 0 5 15 1 0 19 0 1 2 0 10 0 0 1
                                         2 0 10 0 0 1 2 0 10 0 0 1 2 0 10 0 0 1
                                         2 0 10 0 0 11)))))
           '|lookupComplete|)) 
