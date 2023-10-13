
(/VERSIONCHECK 2) 

(DEFUN |RESLATC;coerce;SV;1| (|s| $) (SPADCALL (QREFELT $ 8))) 

(PUT '|RESLATC;coerce;ES;2| '|SPADreplace|
     '(XLAM (|e|)
       (|error| "Bug: Should not be able to obtain value of type Exit"))) 

(DEFUN |RESLATC;coerce;ES;2| (|e| $)
  (|error| "Bug: Should not be able to obtain value of type Exit")) 

(DEFUN |ResolveLatticeCompletion| (#1=#:G127)
  (PROG ()
    (RETURN
     (PROG (#2=#:G128)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|ResolveLatticeCompletion|)
                                           '|domainEqualList|)
                . #3=(|ResolveLatticeCompletion|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|ResolveLatticeCompletion;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ResolveLatticeCompletion|))))))))))) 

(DEFUN |ResolveLatticeCompletion;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ResolveLatticeCompletion|))
      (LETT |dv$| (LIST '|ResolveLatticeCompletion| DV$1) . #1#)
      (LETT $ (GETREFV 12) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ResolveLatticeCompletion| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ResolveLatticeCompletion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Void|) (0 . |void|)
              |RESLATC;coerce;SV;1| (|Exit|) |RESLATC;coerce;ES;2|)
           '#(|coerce| 4) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 11
                                                 '(0 7 0 8 1 0 6 10 11 1 0 7 6
                                                   9)))))
           '|lookupComplete|)) 
