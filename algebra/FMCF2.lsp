
(SDEFUN |FMCF2;map;MM1M2;1| ((|f| |Mapping| R2 R1) (|x| M1) ($ M2))
        (SPROG
         ((|ry| (|List| (|Record| (|:| |k| S) (|:| |c| R2))))
          (|rx| (|List| (|Record| (|:| |k| S) (|:| |c| R1)))))
         (SEQ
          (LETT |rx| (SPADCALL |x| (QREFELT $ 13)) . #1=(|FMCF2;map;MM1M2;1|))
          (LETT |ry|
                (SPADCALL (CONS #'|FMCF2;map;MM1M2;1!0| |f|) |rx|
                          (QREFELT $ 18))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|FMCF2;map;MM1M2;1!1| $) |ry| (QREFELT $ 24))
            (QREFELT $ 25)))))) 

(SDEFUN |FMCF2;map;MM1M2;1!1| ((|t| NIL) ($ NIL))
        (COND ((SPADCALL (QCDR |t|) (QREFELT $ 20)) (|spadConstant| $ 21))
              ('T (|spadConstant| $ 22)))) 

(SDEFUN |FMCF2;map;MM1M2;1!0| ((|t| NIL) (|f| NIL))
        (CONS (QCAR |t|) (SPADCALL (QCDR |t|) |f|))) 

(DECLAIM (NOTINLINE |FreeModuleCoefficientFunctions2;|)) 

(DEFUN |FreeModuleCoefficientFunctions2| (&REST #1=#:G116)
  (SPROG NIL
         (PROG (#2=#:G117)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FreeModuleCoefficientFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|FreeModuleCoefficientFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FreeModuleCoefficientFunctions2;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FreeModuleCoefficientFunctions2|)))))))))) 

(DEFUN |FreeModuleCoefficientFunctions2;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|FreeModuleCoefficientFunctions2|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$|
          (LIST '|FreeModuleCoefficientFunctions2| DV$1 DV$2 DV$3 DV$4 DV$5)
          . #1#)
    (LETT $ (GETREFV 28) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|FreeModuleCoefficientFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FreeModuleCoefficientFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|Record| (|:| |k| 8) (|:| |c| 6)) (|List| 11)
              (0 . |listOfTerms|) (|Record| (|:| |k| 8) (|:| |c| 7))
              (|List| 14) (|Mapping| 14 11) (|ListFunctions2| 11 14)
              (5 . |map|) (|Boolean|) (11 . |zero?|) (16 . |false|)
              (20 . |true|) (|Mapping| 19 14) (24 . |select|)
              (30 . |constructOrdered|) (|Mapping| 7 6) |FMCF2;map;MM1M2;1|)
           '#(|map| 35) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 27
                                                 '(1 9 12 0 13 2 17 15 16 12 18
                                                   1 7 19 0 20 0 19 0 21 0 19 0
                                                   22 2 15 0 23 0 24 1 10 0 15
                                                   25 2 0 10 26 9 27)))))
           '|lookupComplete|)) 
