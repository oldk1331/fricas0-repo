
(/VERSIONCHECK 2) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries| (&REST #1=#:G137)
  (PROG ()
    (RETURN
     (PROG (#2=#:G138)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FunctionSpaceToUnivariatePowerSeries|)
                                           '|domainEqualList|)
                . #3=(|FunctionSpaceToUnivariatePowerSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |FunctionSpaceToUnivariatePowerSeries;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FunctionSpaceToUnivariatePowerSeries|))))))))))) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries;|
       (|#1| |#2| |#3| |#4| |#5| |#6| |#7| |#8|)
  (PROG (|pv$| $ |dv$| DV$8 DV$7 DV$6 DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|FunctionSpaceToUnivariatePowerSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT DV$6 (|devaluate| |#6|) . #1#)
      (LETT DV$7 (|devaluate| |#7|) . #1#)
      (LETT DV$8 (|devaluate| |#8|) . #1#)
      (LETT |dv$|
            (LIST '|FunctionSpaceToUnivariatePowerSeries| DV$1 DV$2 DV$3 DV$4
                  DV$5 DV$6 DV$7 DV$8)
            . #1#)
      (LETT $ (GETREFV 20) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FunctionSpaceToUnivariatePowerSeries|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7 DV$8) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (QSETREFV $ 11 |#6|)
      (QSETREFV $ 12 |#7|)
      (QSETREFV $ 13 |#8|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FunctionSpaceToUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FunctionSpaceToUnivariatePowerSeries2| 6 7 8 9 10 11 12
                                                       (NRTEVAL (ELT $ 14)) 13)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|local| |#5|) (|local| |#6|) (|local| |#7|) (|local| |#8|)
              (0 . |coerce|)
              (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|)))
              (|Union| (|:| |%series| 9) (|:| |%problem| 15)) (|Boolean|)
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              (|Mapping| 17 7))
           '#(|exprToUPS| 5 |exprToPS| 12 |exprToGenUPS| 32) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(1 7 0 8 14 3 0 16 7 17 18 1
                                                   7 0 16 7 17 18 17 7 19 19 1
                                                   5 0 16 7 17 18 17 7 1 3 0 16
                                                   7 17 18 1)))))
           '|lookupComplete|)) 
