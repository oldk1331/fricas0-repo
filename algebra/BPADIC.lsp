
(/VERSIONCHECK 2) 

(DEFUN |BalancedPAdicInteger| (#1=#:G139)
  (PROG ()
    (RETURN
     (PROG (#2=#:G140)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|BalancedPAdicInteger|)
                                           '|domainEqualList|)
                . #3=(|BalancedPAdicInteger|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|BalancedPAdicInteger;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|BalancedPAdicInteger|))))))))))) 

(DEFUN |BalancedPAdicInteger;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|BalancedPAdicInteger|))
      (LETT |dv$| (LIST '|BalancedPAdicInteger| DV$1) . #1#)
      (LETT $ (GETREFV 26) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|BalancedPAdicInteger| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|BalancedPAdicInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerPAdicInteger| 6 (NRTEVAL 'NIL))
              (|local| |#1|) (|SparseUnivariatePolynomial| 8) (|Integer|)
              (|NonNegativeInteger|) (|Union| 11 '#1="failed") (|List| $)
              (|Stream| 8)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 14 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Boolean|)
              (|Record| (|:| |coef| 11) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Union| $ '"failed") (|PositiveInteger|) (|String|)
              (|OutputForm|) (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0))
            (CONS
             '#(NIL |EuclideanDomain&| NIL |GcdDomain&| NIL |Algebra&| NIL NIL
                |EntireRing&| |Module&| NIL |Ring&| NIL NIL NIL |AbelianGroup&|
                NIL NIL |AbelianMonoid&| |Monoid&| NIL |SemiGroup&|
                |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|PAdicIntegerCategory| 6) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|Algebra| $$) (|CommutativeRing|) (|CharacteristicZero|)
                 (|EntireRing|) (|Module| $$) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 24))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
