
(/VERSIONCHECK 2) 

(DEFUN |NSUP2;map;MNsupNsup;1| (|f| |p| $) (SPADCALL |f| |p| (QREFELT $ 12))) 

(DECLAIM (NOTINLINE |NewSparseUnivariatePolynomialFunctions2;|)) 

(DEFUN |NewSparseUnivariatePolynomialFunctions2| (&REST #1=#:G105)
  (PROG ()
    (RETURN
     (PROG (#2=#:G106)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|NewSparseUnivariatePolynomialFunctions2|)
                                           '|domainEqualList|)
                . #3=(|NewSparseUnivariatePolynomialFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |NewSparseUnivariatePolynomialFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|NewSparseUnivariatePolynomialFunctions2|))))))))))) 

(DEFUN |NewSparseUnivariatePolynomialFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|NewSparseUnivariatePolynomialFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|NewSparseUnivariatePolynomialFunctions2| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 14) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache|
                  '|NewSparseUnivariatePolynomialFunctions2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NewSparseUnivariatePolynomialFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NewSparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|NewSparseUnivariatePolynomial| 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 10 7 8) (0 . |map|)
              |NSUP2;map;MNsupNsup;1|)
           '#(|map| 6) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 13
                                                 '(2 11 8 9 10 12 2 0 8 9 10
                                                   13)))))
           '|lookupComplete|)) 
