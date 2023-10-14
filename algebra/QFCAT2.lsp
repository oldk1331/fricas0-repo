
(/VERSIONCHECK 2) 

(DEFUN |QFCAT2;map;MRS;1| (|f| |r| $)
  (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 10)) |f|)
            (SPADCALL (SPADCALL |r| (QREFELT $ 11)) |f|) (QREFELT $ 12))) 

(DEFUN |QuotientFieldCategoryFunctions2| (&REST #1=#:G129)
  (PROG ()
    (RETURN
     (PROG (#2=#:G130)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|QuotientFieldCategoryFunctions2|)
                                           '|domainEqualList|)
                . #3=(|QuotientFieldCategoryFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |QuotientFieldCategoryFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|QuotientFieldCategoryFunctions2|))))))))))) 

(DEFUN |QuotientFieldCategoryFunctions2;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|QuotientFieldCategoryFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|QuotientFieldCategoryFunctions2| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 15) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|QuotientFieldCategoryFunctions2|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|QuotientFieldCategoryFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |numer|) (5 . |denom|)
              (10 . /) (|Mapping| 7 6) |QFCAT2;map;MRS;1|)
           '#(|map| 16) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 14
                                                 '(1 8 6 0 10 1 8 6 0 11 2 9 0
                                                   7 7 12 2 0 9 13 8 14)))))
           '|lookupComplete|)) 
