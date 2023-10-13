
(/VERSIONCHECK 2) 

(DEFUN |ALGMFACT;factor;PLF;1| (|p| |lalg| $)
  (PROG ()
    (RETURN
     (SPADCALL |p| (CONS #'|ALGMFACT;factor;PLF;1!0| (VECTOR $ |lalg|))
               (QREFELT $ 17))))) 

(DEFUN |ALGMFACT;factor;PLF;1!0| (|z1| $$)
  (PROG (|lalg| $)
    (LETT |lalg| (QREFELT $$ 1) . #1=(|ALGMFACT;factor;PLF;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |lalg| (QREFELT $ 13)))))) 

(DEFUN |ALGMFACT;factor;SupLF;2| (|up| |lalg| $)
  (PROG ()
    (RETURN
     (SPADCALL |up| (CONS #'|ALGMFACT;factor;SupLF;2!0| (VECTOR $ |lalg|))
               (QREFELT $ 21))))) 

(DEFUN |ALGMFACT;factor;SupLF;2!0| (|z1| $$)
  (PROG (|lalg| $)
    (LETT |lalg| (QREFELT $$ 1) . #1=(|ALGMFACT;factor;SupLF;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |lalg| (QREFELT $ 13)))))) 

(DEFUN |AlgebraicMultFact| (&REST #1=#:G129)
  (PROG ()
    (RETURN
     (PROG (#2=#:G130)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AlgebraicMultFact|)
                                           '|domainEqualList|)
                . #3=(|AlgebraicMultFact|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AlgebraicMultFact;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|AlgebraicMultFact|))))))))))) 

(DEFUN |AlgebraicMultFact;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicMultFact|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|AlgebraicMultFact| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 23) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|AlgebraicMultFact|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9
                (|AlgFactor|
                 (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
      $)))) 

(MAKEPROP '|AlgebraicMultFact| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) 'AF (|Factored| 11)
              (|SparseUnivariatePolynomial| (|AlgebraicNumber|))
              (|List| (|AlgebraicNumber|)) (0 . |factor|) (|Factored| 8)
              (|Mapping| 10 11) (|InnerMultFact| 6 7 (|AlgebraicNumber|) 8)
              (6 . |factor|) |ALGMFACT;factor;PLF;1| (|Factored| 20)
              (|SparseUnivariatePolynomial| 8) (12 . |factor|)
              |ALGMFACT;factor;SupLF;2|)
           '#(|factor| 18) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(2 9 10 11 12 13 2 16 14 8 15
                                                   17 2 16 19 20 15 21 2 0 19
                                                   20 12 22 2 0 14 8 12 18)))))
           '|lookupComplete|)) 
