
(/VERSIONCHECK 2) 

(DEFUN |PMPRED;suchThat;SME;1| (|p| |f| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 9)) |f| (QREFELT $ 12))) 

(DEFUN |PMPRED;suchThat;SLE;2| (|p| |l| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 9)) |l| (QREFELT $ 15))) 

(DEFUN |AttachPredicates| (#1=#:G130)
  (PROG ()
    (RETURN
     (PROG (#2=#:G131)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|AttachPredicates|)
                                           '|domainEqualList|)
                . #3=(|AttachPredicates|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|AttachPredicates;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|AttachPredicates|))))))))))) 

(DEFUN |AttachPredicates;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AttachPredicates|))
      (LETT |dv$| (LIST '|AttachPredicates| DV$1) . #1#)
      (LETT $ (GETREFV 17) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|AttachPredicates| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|AttachPredicates| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              (|Expression| (|Integer|)) (0 . |coerce|)
              (|Mapping| (|Boolean|) 6)
              (|FunctionSpaceAttachPredicates| (|Integer|) 8 6)
              (5 . |suchThat|) |PMPRED;suchThat;SME;1| (|List| 10)
              (11 . |suchThat|) |PMPRED;suchThat;SLE;2|)
           '#(|suchThat| 17) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(1 8 0 7 9 2 11 8 8 10 12 2
                                                   11 8 8 14 15 2 0 8 7 14 16 2
                                                   0 8 7 10 13)))))
           '|lookupComplete|)) 
