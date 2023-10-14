
(SDEFUN |KERNEL2;constantKernel;RK;1| ((|r| R) ($ |Kernel| S))
        (SPADCALL (SPADCALL |r| (QREFELT $ 10)) NIL 1 (QREFELT $ 14))) 

(SDEFUN |KERNEL2;constantIfCan;KU;2| ((|k| |Kernel| S) ($ |Union| R "failed"))
        (SPADCALL (SPADCALL |k| (QREFELT $ 16)) (QREFELT $ 18))) 

(DECLAIM (NOTINLINE |KernelFunctions2;|)) 

(DEFUN |KernelFunctions2| (&REST #1=#:G109)
  (SPROG NIL
         (PROG (#2=#:G110)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|KernelFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|KernelFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |KernelFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|KernelFunctions2|)))))))))) 

(DEFUN |KernelFunctions2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|KernelFunctions2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|KernelFunctions2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 20) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|KernelFunctions2| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|KernelFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|BasicOperator|) (|BasicOperatorFunctions1| 6)
              (0 . |constantOperator|) (|List| 7) (|NonNegativeInteger|)
              (|Kernel| 7) (5 . |kernel|) |KERNEL2;constantKernel;RK;1|
              (12 . |operator|) (|Union| 6 '"failed") (17 . |constantOpIfCan|)
              |KERNEL2;constantIfCan;KU;2|)
           '#(|constantKernel| 22 |constantIfCan| 27) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(1 9 8 6 10 3 13 0 8 11 12 14
                                                   1 13 8 0 16 1 9 17 8 18 1 0
                                                   13 6 15 1 0 17 13 19)))))
           '|lookupComplete|)) 
