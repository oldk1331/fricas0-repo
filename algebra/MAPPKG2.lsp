
(/VERSIONCHECK 2) 

(DEFUN |MAPPKG2;const;CM;1| (|c| $)
  (PROG () (RETURN (CONS #'|MAPPKG2;const;CM;1!0| (VECTOR $ |c|))))) 

(DEFUN |MAPPKG2;const;CM;1!0| (|a1| $$)
  (PROG (|c| $)
    (LETT |c| (QREFELT $$ 1) . #1=(|MAPPKG2;const;CM;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a1| |c| (QREFELT $ 9)))))) 

(DEFUN |MAPPKG2;curry;MAM;2| (|fac| |a| $)
  (PROG () (RETURN (CONS #'|MAPPKG2;curry;MAM;2!0| (VECTOR |fac| |a|))))) 

(DEFUN |MAPPKG2;curry;MAM;2!0| ($$)
  (PROG (|a| |fac|)
    (LETT |a| (QREFELT $$ 1) . #1=(|MAPPKG2;curry;MAM;2|))
    (LETT |fac| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a| |fac|))))) 

(DEFUN |MAPPKG2;constant;MM;3| (|f0c| $)
  (PROG () (RETURN (CONS #'|MAPPKG2;constant;MM;3!0| (VECTOR $ |f0c|))))) 

(DEFUN |MAPPKG2;constant;MM;3!0| (|a1| $$)
  (PROG (|f0c| $)
    (LETT |f0c| (QREFELT $$ 1) . #1=(|MAPPKG2;constant;MM;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a1| (SPADCALL |f0c|) (QREFELT $ 9)))))) 

(DEFUN |MAPPKG2;diag;MM;4| (|faac| $) (CONS #'|MAPPKG2;diag;MM;4!0| |faac|)) 

(DEFUN |MAPPKG2;diag;MM;4!0| (|a1| |faac|) (SPADCALL |a1| |a1| |faac|)) 

(DECLAIM (NOTINLINE |MappingPackage2;|)) 

(DEFUN |MappingPackage2| (&REST #1=#:G138)
  (PROG ()
    (RETURN
     (PROG (#2=#:G139)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MappingPackage2|)
                                           '|domainEqualList|)
                . #3=(|MappingPackage2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MappingPackage2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|MappingPackage2|))))))))))) 

(DEFUN |MappingPackage2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MappingPackage2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|MappingPackage2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 17) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MappingPackage2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MappingPackage2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|MappingPackageInternalHacks2| 6 7) (0 . |arg2|) (|Mapping| 7 6)
              |MAPPKG2;const;CM;1| (|Mapping| 7) |MAPPKG2;curry;MAM;2|
              |MAPPKG2;constant;MM;3| (|Mapping| 7 6 6) |MAPPKG2;diag;MM;4|)
           '#(|diag| 6 |curry| 11 |constant| 17 |const| 22) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(2 8 7 6 7 9 1 0 10 15 16 2 0
                                                   12 10 6 13 1 0 10 12 14 1 0
                                                   10 7 11)))))
           '|lookupComplete|)) 
