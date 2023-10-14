
(/VERSIONCHECK 2) 

(DEFUN |PDOHLP;id_map;VarA;1| (|v| $) (|spadConstant| $ 9)) 

(DEFUN |PDOHLP;diff_map;VarM;2| (|v| $)
  (PROG () (RETURN (CONS #'|PDOHLP;diff_map;VarM;2!0| (VECTOR $ |v|))))) 

(DEFUN |PDOHLP;diff_map;VarM;2!0| (|x| $$)
  (PROG (|v| $)
    (LETT |v| (QREFELT $$ 1) . #1=(|PDOHLP;diff_map;VarM;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |v| (QREFELT $ 11)))))) 

(DECLAIM (NOTINLINE |PartialDifferentialOperatorHelper;|)) 

(DEFUN |PartialDifferentialOperatorHelper| (&REST #1=#:G131)
  (PROG ()
    (RETURN
     (PROG (#2=#:G132)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PartialDifferentialOperatorHelper|)
                                           '|domainEqualList|)
                . #3=(|PartialDifferentialOperatorHelper|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |PartialDifferentialOperatorHelper;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|PartialDifferentialOperatorHelper|))))))))))) 

(DEFUN |PartialDifferentialOperatorHelper;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PartialDifferentialOperatorHelper|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PartialDifferentialOperatorHelper| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 14) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PartialDifferentialOperatorHelper|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PartialDifferentialOperatorHelper| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Automorphism| 6) (0 . |One|) |PDOHLP;id_map;VarA;1|
              (4 . |differentiate|) (|Mapping| 6 6) |PDOHLP;diff_map;VarM;2|)
           '#(|id_map| 10 |diff_map| 15) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 13
                                                 '(0 8 0 9 2 6 0 0 7 11 1 0 8 7
                                                   10 1 0 12 7 13)))))
           '|lookupComplete|)) 
