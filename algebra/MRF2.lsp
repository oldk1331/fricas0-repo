
(/VERSIONCHECK 2) 

(DEFUN |MRF2;map;MMrMr;1| (|fn| |u| $)
  (PROG (|res| #1=#:G130 |te|)
    (RETURN
     (SEQ (LETT |res| (|spadConstant| $ 10) . #2=(|MRF2;map;MMrMr;1|))
          (SEQ (LETT |te| NIL . #2#)
               (LETT #1# (SPADCALL |u| (QREFELT $ 14)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |te| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL (SPADCALL (QCAR |te|) |fn|)
                                           (QCDR |te|) (QREFELT $ 15))
                                 (QREFELT $ 16))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |MonoidRingFunctions2| (&REST #1=#:G131)
  (PROG ()
    (RETURN
     (PROG (#2=#:G132)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MonoidRingFunctions2|)
                                           '|domainEqualList|)
                . #3=(|MonoidRingFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MonoidRingFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MonoidRingFunctions2|))))))))))) 

(DEFUN |MonoidRingFunctions2;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MonoidRingFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|MonoidRingFunctions2| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MonoidRingFunctions2|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MonoidRingFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|MonoidRing| 7 8) (0 . |Zero|)
              (|Record| (|:| |coef| 6) (|:| |monom| 8)) (|List| 11)
              (|MonoidRing| 6 8) (4 . |terms|) (9 . |monomial|) (15 . +)
              (|Mapping| 7 6) |MRF2;map;MMrMr;1|)
           '#(|map| 21) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(0 9 0 10 1 13 12 0 14 2 9 0
                                                   7 8 15 2 9 0 0 0 16 2 0 9 17
                                                   13 18)))))
           '|lookupComplete|)) 
