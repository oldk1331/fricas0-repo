
(/VERSIONCHECK 2) 

(DEFUN |UNISEG2;map;MUsUs;1| (|f| |u| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (LETT |s| (SPADCALL (SPADCALL |u| (QREFELT $ 9)) |f|)
            |UNISEG2;map;MUsUs;1|)
      (EXIT
       (COND
        ((SPADCALL |u| (QREFELT $ 11))
         (SPADCALL |s| (SPADCALL (SPADCALL |u| (QREFELT $ 12)) |f|)
                   (QREFELT $ 14)))
        ('T (SPADCALL |s| (QREFELT $ 15))))))))) 

(DEFUN |UNISEG2;map;MUsS;2| (|f| |u| $)
  (SPADCALL |f| (SPADCALL |u| (QREFELT $ 19)) (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |UniversalSegmentFunctions2;|)) 

(DEFUN |UniversalSegmentFunctions2| (&REST #1=#:G133)
  (PROG ()
    (RETURN
     (PROG (#2=#:G134)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|UniversalSegmentFunctions2|)
                                           '|domainEqualList|)
                . #3=(|UniversalSegmentFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |UniversalSegmentFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|UniversalSegmentFunctions2|))))))))))) 

(DEFUN |UniversalSegmentFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UniversalSegmentFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|UniversalSegmentFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|OrderedRing|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|UniversalSegmentFunctions2|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 23 (CONS (|dispatchFunction| |UNISEG2;map;MUsS;2|) $))))
      $)))) 

(MAKEPROP '|UniversalSegmentFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|UniversalSegment| 6) (0 . |lo|) (|Boolean|) (5 . |hasHi|)
              (10 . |hi|) (|UniversalSegment| 7) (15 . |segment|)
              (21 . |segment|) (|Mapping| 7 6) |UNISEG2;map;MUsUs;1|
              (|Stream| 6) (26 . |expand|) (|Stream| 7)
              (|StreamFunctions2| 6 7) (31 . |map|) (37 . |map|))
           '#(|map| 43) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 8 6 0 9 1 8 10 0 11 1 8 6
                                                   0 12 2 13 0 7 7 14 1 13 0 7
                                                   15 1 8 18 0 19 2 21 20 16 18
                                                   22 2 0 20 16 8 23 2 1 20 16
                                                   8 23 2 0 13 16 8 17)))))
           '|lookupComplete|)) 
