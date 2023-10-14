
(DEFUN |LODO2;elt;$2M;1| (|p| |m| $)
  (SPADCALL |p| (ELT $ 9) |m| (QREFELT $ 12))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator2;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator2| (&REST #1=#:G121)
  (PROG ()
    (RETURN
     (PROG (#2=#:G122)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LinearOrdinaryDifferentialOperator2|)
                                           '|domainEqualList|)
                . #3=(|LinearOrdinaryDifferentialOperator2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |LinearOrdinaryDifferentialOperator2;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|LinearOrdinaryDifferentialOperator2|))))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperator2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|LinearOrdinaryDifferentialOperator2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator2| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 30) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1| '(|GcdDomain|))
                                          (|HasCategory| |#1| '(|Field|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator2|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|LinearOrdinaryDifferentialOperator| 6 (NRTEVAL (ELT $ 8)))
              (|local| |#1|) (|local| |#2|) (0 . |differentiate|)
              (5 . |differentiate|) (|Mapping| 7 7)
              (|ApplyUnivariateSkewPolynomial| 6 7 $$) (10 . |apply|)
              |LODO2;elt;$2M;1| (|NonNegativeInteger|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Union| $ '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Fraction| 21)
              (|Union| 18 '#1="failed") (|Union| 21 '#1#) (|Integer|)
              (|List| 6) (|Union| 6 '#1#) (|Boolean|) (|PositiveInteger|)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(|elt| 17) 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 2 3))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&| |Algebra&| |Module&|
                |Ring&| NIL |Rng&| NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |FullyRetractableTo&| |SetCategory&| NIL NIL |RetractableTo&|
                NIL |BasicType&| NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 6)
                 (|UnivariateSkewPolynomialCategory| 6) (|Algebra| 6)
                 (|Module| 6) (|Ring|) (|BiModule| 6 6) (|Rng|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|Eltable| 7 7) (|Eltable| 6 6) (|RetractableTo| 6)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 29)
                 (|RetractableTo| 18) (|RetractableTo| 21))
              (|makeByteWordVec2| 13
                                  '(1 6 0 0 8 1 7 0 0 9 3 11 7 2 10 7 12 2 0 7
                                    0 7 13)))))
           '|lookupIncomplete|)) 
