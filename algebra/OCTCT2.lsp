
(/VERSIONCHECK 2) 

(DEFUN |OCTCT2;map;MOROS;1| (|fn| |u| $)
  (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 10)) |fn|)
            (SPADCALL (SPADCALL |u| (QREFELT $ 11)) |fn|)
            (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |fn|)
            (SPADCALL (SPADCALL |u| (QREFELT $ 13)) |fn|)
            (SPADCALL (SPADCALL |u| (QREFELT $ 14)) |fn|)
            (SPADCALL (SPADCALL |u| (QREFELT $ 15)) |fn|)
            (SPADCALL (SPADCALL |u| (QREFELT $ 16)) |fn|)
            (SPADCALL (SPADCALL |u| (QREFELT $ 17)) |fn|) (QREFELT $ 18))) 

(DEFUN |OctonionCategoryFunctions2| (&REST #1=#:G129)
  (PROG ()
    (RETURN
     (PROG (#2=#:G130)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|OctonionCategoryFunctions2|)
                                           '|domainEqualList|)
                . #3=(|OctonionCategoryFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |OctonionCategoryFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|OctonionCategoryFunctions2|))))))))))) 

(DEFUN |OctonionCategoryFunctions2;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|OctonionCategoryFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|OctonionCategoryFunctions2| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OctonionCategoryFunctions2|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|OctonionCategoryFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |real|) (5 . |imagi|)
              (10 . |imagj|) (15 . |imagk|) (20 . |imagE|) (25 . |imagI|)
              (30 . |imagJ|) (35 . |imagK|) (40 . |octon|) (|Mapping| 9 7)
              |OCTCT2;map;MOROS;1|)
           '#(|map| 52) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(1 6 7 0 10 1 6 7 0 11 1 6 7
                                                   0 12 1 6 7 0 13 1 6 7 0 14 1
                                                   6 7 0 15 1 6 7 0 16 1 6 7 0
                                                   17 8 8 0 9 9 9 9 9 9 9 9 18
                                                   2 0 8 19 6 20)))))
           '|lookupComplete|)) 
