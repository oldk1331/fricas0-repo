
(/VERSIONCHECK 2) 

(DEFUN |Quaternion| (#1=#:G141)
  (PROG ()
    (RETURN
     (PROG (#2=#:G142)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Quaternion|)
                                           '|domainEqualList|)
                . #3=(|Quaternion|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Quaternion;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Quaternion|))))))))))) 

(DEFUN |Quaternion;| (|#1|)
  (PROG (|pv$| #1=#:G140 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|Quaternion|))
      (LETT |dv$| (LIST '|Quaternion| DV$1) . #2#)
      (LETT $ (GETREFV 36) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|EntireRing|))
                                                . #2#)
                                          (OR #1#
                                              (|HasCategory| |#1| '(|Field|)))
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory| |#1|
                                                         (LIST '|InnerEvalable|
                                                               '(|Symbol|)
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1|
                                                         (LIST '|Eltable|
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|RealNumberSystem|))
                                          (|HasCategory| |#1|
                                                         '(|IntegerNumberSystem|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1| '(|Field|)))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|Quaternion| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Quaternion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|GeneralQuaternion| 6
                                   (NRTEVAL
                                    (SPADCALL (|spadConstant| $ 8)
                                              (QREFELT $ 9)))
                                   (NRTEVAL
                                    (SPADCALL (|spadConstant| $ 8)
                                              (QREFELT $ 9))))
              (|local| |#1|) (0 . |One|) (4 . |One|) (8 . -) (|Fraction| 17)
              (|Union| $ '"failed") (|InputForm|) (|NonNegativeInteger|)
              (|List| 15) (|Equation| 6) (|List| 6) (|Integer|) (|Symbol|)
              (|List| 18) (|Union| 10 '"failed") (|Boolean|)
              (|Record| (|:| |mat| 25) (|:| |vec| (|Vector| 17))) (|Matrix| $)
              (|Vector| $) (|Matrix| 17) (|List| 13) (|Union| 17 '#1="failed")
              (|Matrix| 6) (|Record| (|:| |mat| 28) (|:| |vec| (|Vector| 6)))
              (|Mapping| 6 6) (|Union| 6 '#1#) (|PositiveInteger|)
              (|SingleInteger|) (|String|) (|OutputForm|))
           '#(|One| 13) 'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 4 0 0 0 4 0 0 1 2 6 4 10 11 15 0 0 5 4 0 0
                                  0 0 5 4 4 0 0 0 0 0 0 7 0 0 0 7 0 0 13 0 0 0
                                  0 3 5 7 8 9 12 13 14))
            (CONS
             '#(|QuaternionCategory&| |DivisionRing&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Algebra&| NIL |Module&| NIL NIL NIL |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL |Ring&| NIL
                NIL NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |OrderedSet&|
                |FullyEvalableOver&| |SemiGroup&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL |PartialOrder&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL)
             (CONS
              '#((|QuaternionCategory| 6) (|DivisionRing|) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6)
                 (|DifferentialExtension| 6) (|Algebra| 10)
                 (|LinearlyExplicitRingOver| 6) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|Module| 10) (|PartialDifferentialRing| 18)
                 (|DifferentialRing|) (|LinearlyExplicitRingOver| 17) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 10 10) (|Rng|)
                 (|RightModule| 6) (|LeftModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 10) (|RightModule| 10)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|OrderedSet|)
                 (|FullyEvalableOver| 6) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|Evalable| 6) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 35) (|ConvertibleTo| 12)
                 (|noZeroDivisors|) (|PartialOrder|) (|RetractableTo| 10)
                 (|RetractableTo| 17) (|InnerEvalable| 18 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$))
              (|makeByteWordVec2| 9 '(0 0 0 7 0 6 0 8 1 6 0 0 9 0 0 0 7)))))
           '|lookupIncomplete|)) 
