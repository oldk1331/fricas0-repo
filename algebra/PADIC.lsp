
(DECLAIM (NOTINLINE |PAdicInteger;|)) 

(DEFUN |PAdicInteger| (#1=#:G119)
  (SPROG NIL
         (PROG (#2=#:G120)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PAdicInteger|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PAdicInteger;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|PAdicInteger|)))))))))) 

(DEFUN |PAdicInteger;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|PAdicInteger| DV$1))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PAdicInteger| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|PAdicInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerPAdicInteger| (NRTEVAL (QREFELT % 6)) (NRTEVAL 'T))
              (|local| |#1|) (|Integer|) (|SparseUnivariatePolynomial| 7)
              (|Stream| 7) (|NonNegativeInteger|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 11 '#1="failed") (|Union| 14 '#1#) (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %)) (|Boolean|)
              (|Record| (|:| |coef| 14) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| % '"failed") (|PositiveInteger|) (|String|)
              (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(NIL |EuclideanDomain&| NIL |GcdDomain&| NIL NIL NIL NIL
                |EntireRing&| |Algebra&| NIL |NonAssociativeAlgebra&| |Rng&|
                NIL |Module&| NIL NIL |NonAssociativeRing&| NIL
                |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| NIL |SetCategory&| NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|PAdicIntegerCategory| 6) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|CommutativeRing|) (|LeftOreRing|) (|CharacteristicZero|)
                 (|EntireRing|) (|Algebra| $$) (|Ring|)
                 (|NonAssociativeAlgebra| $$) (|Rng|) (|SemiRing|)
                 (|Module| $$) (|SemiRng|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Magma|) (|AbelianSemiGroup|)
                 (|CommutativeStar|) (|SetCategory|) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 25))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
