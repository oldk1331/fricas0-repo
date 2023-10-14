
(DEFUN |LIST3;map;MLLL;1| (|fn| |la| |lb| $)
  (COND ((OR (NULL |la|) (NULL |lb|)) NIL)
        ('T
         (CONS (SPADCALL (|SPADfirst| |la|) (|SPADfirst| |lb|) |fn|)
               (SPADCALL |fn| (CDR |la|) (CDR |lb|) (QREFELT $ 13)))))) 

(DECLAIM (NOTINLINE |ListFunctions3;|)) 

(DEFUN |ListFunctions3| (&REST #1=#:G111)
  (PROG ()
    (RETURN
     (PROG (#2=#:G112)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ListFunctions3|)
                                           '|domainEqualList|)
                . #3=(|ListFunctions3|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ListFunctions3;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|ListFunctions3|))))))))))) 

(DEFUN |ListFunctions3;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ListFunctions3|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|ListFunctions3| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 14) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ListFunctions3| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ListFunctions3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|List| 8) (|Mapping| 8 6 7) (|List| 6) (|List| 7)
              |LIST3;map;MLLL;1|)
           '#(|map| 0) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 13 '(3 0 9 10 11 12 13)))))
           '|lookupComplete|)) 
