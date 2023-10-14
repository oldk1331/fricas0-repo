
(/VERSIONCHECK 2) 

(DEFUN |FR2;map;MFF;1| (|func| |f| $)
  (PROG (#1=#:G105 #2=#:G104 #3=#:G106 #4=#:G109 |g|)
    (RETURN
     (SEQ
      (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 9)) |func|)
                (PROGN
                 (LETT #1# NIL . #5=(|FR2;map;MFF;1|))
                 (SEQ (LETT |g| NIL . #5#)
                      (LETT #4# (SPADCALL |f| (QREFELT $ 12)) . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |g| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL (SPADCALL (QCAR |g|) |func|)
                                         (QCDR |g|) (QREFELT $ 15))
                               . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 16)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 17))))
                (QREFELT $ 18)))))) 

(DECLAIM (NOTINLINE |FactoredFunctions2;|)) 

(DEFUN |FactoredFunctions2| (&REST #1=#:G110)
  (PROG ()
    (RETURN
     (PROG (#2=#:G111)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FactoredFunctions2|)
                                           '|domainEqualList|)
                . #3=(|FactoredFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |FactoredFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|FactoredFunctions2|))))))))))) 

(DEFUN |FactoredFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FactoredFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FactoredFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FactoredFunctions2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FactoredFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Factored| 6) (0 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 13)) (|List| 10)
              (5 . |factors|) (|Integer|) (|Factored| 7) (10 . |nilFactor|)
              (16 . *) (22 . |One|) (26 . *) (|Mapping| 7 6) |FR2;map;MFF;1|)
           '#(|map| 32) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(1 8 6 0 9 1 8 11 0 12 2 14 0
                                                   7 13 15 2 14 0 0 0 16 0 14 0
                                                   17 2 14 0 7 0 18 2 0 14 19 8
                                                   20)))))
           '|lookupComplete|)) 
