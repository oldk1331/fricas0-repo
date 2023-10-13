
(/VERSIONCHECK 2) 

(DEFUN |TEX1;coerce;STf;1| (|s| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 8)) (QREFELT $ 10))) 

(DEFUN |TexFormat1| (#1=#:G126)
  (PROG ()
    (RETURN
     (PROG (#2=#:G127)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|TexFormat1|)
                                           '|domainEqualList|)
                . #3=(|TexFormat1|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|TexFormat1;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|TexFormat1|))))))))))) 

(DEFUN |TexFormat1;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TexFormat1|))
      (LETT |dv$| (LIST '|TexFormat1| DV$1) . #1#)
      (LETT $ (GETREFV 12) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TexFormat1| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TexFormat1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|OutputForm|)
              (0 . |coerce|) (|TexFormat|) (5 . |coerce|) |TEX1;coerce;STf;1|)
           '#(|coerce| 10) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 11
                                                 '(1 6 7 0 8 1 9 0 7 10 1 0 9 6
                                                   11)))))
           '|lookupComplete|)) 
