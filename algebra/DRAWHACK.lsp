
(/VERSIONCHECK 2) 

(DEFUN |DRAWHACK;coerce;SbSb;1| (|s| $)
  (SPADCALL (ELT $ 10) |s| (QREFELT $ 15))) 

(DEFUN |DrawNumericHack| (#1=#:G127)
  (PROG ()
    (RETURN
     (PROG (#2=#:G128)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|DrawNumericHack|)
                                           '|domainEqualList|)
                . #3=(|DrawNumericHack|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|DrawNumericHack;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|DrawNumericHack|))))))))))) 

(DEFUN |DrawNumericHack;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DrawNumericHack|))
      (LETT |dv$| (LIST '|DrawNumericHack| DV$1) . #1#)
      (LETT $ (GETREFV 17) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DrawNumericHack| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DrawNumericHack| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Float|) (|Expression| 6)
              (|Numeric| 6) (0 . |numeric|) (|SegmentBinding| 7)
              (|Mapping| 7 8) (|SegmentBinding| 8)
              (|SegmentBindingFunctions2| 8 7) (5 . |map|)
              |DRAWHACK;coerce;SbSb;1|)
           '#(|coerce| 11) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(1 9 7 8 10 2 14 11 12 13 15
                                                   1 0 11 13 16)))))
           '|lookupComplete|)) 
