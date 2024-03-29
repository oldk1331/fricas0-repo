
(DECLAIM (NOTINLINE |Operator;|)) 

(DEFUN |Operator| (#1=#:G10)
  (SPROG NIL
         (PROG (#2=#:G11)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Operator|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Operator;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Operator|)))))))))) 

(DEFUN |Operator;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Operator| DV$1))
          (LETT % (GETREFV 19))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))))))
          (|haddProp| |$ConstructorCache| '|Operator| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|Operator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|ModuleOperator| 6 6) (|local| |#1|)
              (|Union| % '"failed") (|PositiveInteger|) (|FreeGroup| 11)
              (|Integer|) (|BasicOperator|) (|Mapping| 6 6)
              (|Union| 11 '#1="failed") (|Union| 6 '#1#) (|NonNegativeInteger|)
              (|Boolean|) (|OutputForm|) (|String|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(1 2 3 0 0 0 1 0 1 0 0 1 0 0 0 1 1 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|Algebra&| NIL NIL NIL |Rng&| NIL |NonAssociativeAlgebra&| NIL
                |Module&| |NonAssociativeRing&| NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| |RetractableTo&| |RetractableTo&|
                |SetCategory&| NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|Algebra| 6) (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|Ring|) (|Rng|) (|SemiRing|) (|NonAssociativeAlgebra| 6)
                 (|SemiRng|) (|Module| 6) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 6 6) (|NonAssociativeRng|)
                 (|RightModule| $$) (|LeftModule| $$) (|LeftModule| 6)
                 (|RightModule| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Magma|) (|AbelianSemiGroup|)
                 (|RetractableTo| 11) (|RetractableTo| 6) (|SetCategory|)
                 (|Eltable| 6 6) (|CoercibleFrom| 11) (|CoercibleFrom| 6)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 17))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
