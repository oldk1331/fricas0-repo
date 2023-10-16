
(SDEFUN |FR2;map;MFF;1|
        ((|fn| |Mapping| S R) (|u| |Factored| R) ($ |Factored| S))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| S)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G117 NIL) (|f| NIL) (#2=#:G116 NIL))
         (SEQ
          (LETT |l|
                (CONS
                 (VECTOR (CONS 0 "nil")
                         (SPADCALL (SPADCALL |u| (QREFELT $ 9)) |fn|) 1)
                 (PROGN
                  (LETT #2# NIL . #3=(|FR2;map;MFF;1|))
                  (SEQ (LETT |f| NIL . #3#)
                       (LETT #1# (SPADCALL |u| (QREFELT $ 12)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (VECTOR (CONS 0 "nil")
                                        (SPADCALL (QCAR |f|) |fn|) (QCDR |f|))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
                . #3#)
          (EXIT (SPADCALL (|spadConstant| $ 14) |l| (QREFELT $ 19)))))) 

(DECLAIM (NOTINLINE |FactoredFunctions2;|)) 

(DEFUN |FactoredFunctions2| (&REST #1=#:G118)
  (SPROG NIL
         (PROG (#2=#:G119)
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
                  (HREM |$ConstructorCache| '|FactoredFunctions2|)))))))))) 

(DEFUN |FactoredFunctions2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FactoredFunctions2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FactoredFunctions2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 22) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FactoredFunctions2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FactoredFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Factored| 6) (0 . |unit|)
              (|Record| (|:| |factor| 6)
                        (|:| |exponent| (|NonNegativeInteger|)))
              (|List| 10) (5 . |factors|) (10 . |One|) (14 . |One|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 15) (|:| |factor| 7)
                        (|:| |exponent| (|NonNegativeInteger|)))
              (|List| 16) (|Factored| 7) (18 . |makeFR|) (|Mapping| 7 6)
              |FR2;map;MFF;1|)
           '#(|map| 24) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(1 8 6 0 9 1 8 11 0 12 0 6 0
                                                   13 0 7 0 14 2 18 0 7 17 19 2
                                                   0 18 20 8 21)))))
           '|lookupComplete|)) 
