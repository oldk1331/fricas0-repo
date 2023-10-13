
(/VERSIONCHECK 2) 

(DEFUN |FAMR2;map;MA1A2;1| (|f| |a| $)
  (COND ((SPADCALL |a| (QREFELT $ 12)) (|spadConstant| $ 13))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 14)) |f|)
                    (SPADCALL |a| (QREFELT $ 15)) (QREFELT $ 16))
          (SPADCALL |f| (SPADCALL |a| (QREFELT $ 17)) (QREFELT $ 19))
          (QREFELT $ 20))))) 

(DEFUN |FiniteAbelianMonoidRingFunctions2| (&REST #1=#:G129)
  (PROG ()
    (RETURN
     (PROG (#2=#:G130)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FiniteAbelianMonoidRingFunctions2|)
                                           '|domainEqualList|)
                . #3=(|FiniteAbelianMonoidRingFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |FiniteAbelianMonoidRingFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FiniteAbelianMonoidRingFunctions2|))))))))))) 

(DEFUN |FiniteAbelianMonoidRingFunctions2;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteAbelianMonoidRingFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$|
            (LIST '|FiniteAbelianMonoidRingFunctions2| DV$1 DV$2 DV$3 DV$4
                  DV$5)
            . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FiniteAbelianMonoidRingFunctions2|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FiniteAbelianMonoidRingFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Boolean|)
              (0 . |zero?|) (5 . |Zero|) (9 . |leadingCoefficient|)
              (14 . |degree|) (19 . |monomial|) (25 . |reductum|)
              (|Mapping| 9 7) |FAMR2;map;MA1A2;1| (30 . +))
           '#(|map| 36) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(1 8 11 0 12 0 10 0 13 1 8 7
                                                   0 14 1 8 6 0 15 2 10 0 9 6
                                                   16 1 8 0 0 17 2 10 0 0 0 20
                                                   2 0 10 18 8 19)))))
           '|lookupComplete|)) 
