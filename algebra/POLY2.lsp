
(DEFUN |POLY2;map;MPP;1| (|f| |p| $)
  (PROG ()
    (RETURN
     (SPADCALL (ELT $ 10) (CONS #'|POLY2;map;MPP;1!0| (VECTOR $ |f|)) |p|
               (QREFELT $ 16))))) 

(DEFUN |POLY2;map;MPP;1!0| (|x2| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|POLY2;map;MPP;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |x2| |f|) (QREFELT $ 11)))))) 

(DECLAIM (NOTINLINE |PolynomialFunctions2;|)) 

(DEFUN |PolynomialFunctions2| (&REST #1=#:G106)
  (PROG ()
    (RETURN
     (PROG (#2=#:G107)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PolynomialFunctions2|)
                                           '|domainEqualList|)
                . #3=(|PolynomialFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PolynomialFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PolynomialFunctions2|))))))))))) 

(DEFUN |PolynomialFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PolynomialFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PolynomialFunctions2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PolynomialFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (|Polynomial| 7) (0 . |coerce|) (5 . |coerce|) (|Mapping| 9 8)
              (|Mapping| 9 6) (|Polynomial| 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 8) 8 6 14 9)
              (10 . |map|) (|Mapping| 7 6) |POLY2;map;MPP;1|)
           '#(|map| 17) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(1 9 0 8 10 1 9 0 7 11 3 15 9
                                                   12 13 14 16 2 0 9 17 14
                                                   18)))))
           '|lookupComplete|)) 
