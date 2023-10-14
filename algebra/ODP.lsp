
(/VERSIONCHECK 2) 

(DEFUN |ODP;<;2$B;1| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 8))) 

(DECLAIM (NOTINLINE |OrderedDirectProduct;|)) 

(DEFUN |OrderedDirectProduct| (&REST #1=#:G126)
  (PROG ()
    (RETURN
     (PROG (#2=#:G127)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|OrderedDirectProduct|)
                                           '|domainEqualList|)
                . #3=(|OrderedDirectProduct|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |OrderedDirectProduct;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|OrderedDirectProduct|))))))))))) 

(DEFUN |OrderedDirectProduct;| (|#1| |#2| |#3|)
  (PROG (|pv$| #1=#:G120 #2=#:G121 #3=#:G122 #4=#:G123 #5=#:G124 #6=#:G125 $
         |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #7=(|OrderedDirectProduct|))
      (LETT DV$2 (|devaluate| |#2|) . #7#)
      (LETT DV$3 (|devaluate| |#3|) . #7#)
      (LETT |dv$| (LIST '|OrderedDirectProduct| DV$1 DV$2 DV$3) . #7#)
      (LETT $ (GETREFV 44) . #7#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#2| '(|Field|))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (LETT #6#
                                                     (|HasCategory| |#2|
                                                                    '(|OrderedRing|))
                                                     . #7#)
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                #6#)
                                               (|HasCategory| |#2| '(|Monoid|))
                                               (|HasCategory| |#2|
                                                              '(|unitsKnown|))
                                               (LETT #5#
                                                     (|HasCategory| |#2|
                                                                    '(|CommutativeRing|))
                                                     . #7#)
                                               (OR #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|))
                                                   (|HasCategory| |#2|
                                                                  '(|Ring|)))
                                               (OR #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|)))
                                               (OR #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Ring|)))
                                               (|HasCategory| |#2| '(|Finite|))
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitRingOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (LETT #4#
                                                     (|HasCategory| |#2|
                                                                    '(|DifferentialRing|))
                                                     . #7#)
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|))
                                                #5# #4# #6#
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #5# #4# #6#
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))
                                               (|HasCategory| |#2|
                                                              '(|BasicType|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|Evalable|
                                                                (|devaluate|
                                                                 |#2|)))
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|OrderedSet|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (AND #4#
                                                    (|HasCategory| |#2|
                                                                   '(|Ring|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|)))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|)))
                                               (LETT #3#
                                                     (|HasCategory| |#2|
                                                                    '(|AbelianSemiGroup|))
                                                     . #7#)
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 #6#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|SetCategory|))))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #3#
                                                (|HasCategory| |#2|
                                                               '(|BasicType|))
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|))
                                                #5# #4#
                                                (|HasCategory| |#2| '(|Field|))
                                                (|HasCategory| |#2|
                                                               '(|Finite|))
                                                (|HasCategory| |#2|
                                                               '(|Monoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                #6#
                                                (|HasCategory| |#2| '(|Ring|))
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #3#
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|))
                                                #5# #4#
                                                (|HasCategory| |#2| '(|Field|))
                                                (|HasCategory| |#2|
                                                               '(|Finite|))
                                                (|HasCategory| |#2|
                                                               '(|Monoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                #6#
                                                (|HasCategory| |#2| '(|Ring|))
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #3#
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|))
                                                #5# #4#
                                                (|HasCategory| |#2| '(|Field|))
                                                #6#
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (|HasCategory| |#2|
                                                              '(|CoercibleTo|
                                                                (|OutputForm|)))
                                               (LETT #2#
                                                     (AND
                                                      (|HasCategory| |#2|
                                                                     '(|RetractableTo|
                                                                       (|Integer|)))
                                                      (|HasCategory| |#2|
                                                                     '(|SetCategory|)))
                                                     . #7#)
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|)))
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #6#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                #2#)
                                               (OR #2#
                                                   (|HasCategory| |#2|
                                                                  '(|Ring|)))
                                               (LETT #1#
                                                     (AND
                                                      (|HasCategory| |#2|
                                                                     '(|RetractableTo|
                                                                       (|Fraction|
                                                                        (|Integer|))))
                                                      (|HasCategory| |#2|
                                                                     '(|SetCategory|)))
                                                     . #7#)
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|SetCategory|)))
                                                #1# #2#
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#2|
                                                                '(|CancellationAbelianMonoid|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|))))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|)))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|)))
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|)))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #6#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                #1#)))
                      . #7#))
      (|haddProp| |$ConstructorCache| '|OrderedDirectProduct|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 549755813888))
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 1099511627776))
      (AND (|HasCategory| |#2| '(|SetCategory|))
           (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 2199023255552))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4398046511104))
      (AND
       (OR
        (AND (|HasCategory| |#2| '(|BasicType|))
             (|HasCategory| $ '(|finiteAggregate|)))
        (|HasCategory| |#2| '(|SetCategory|)))
       (|augmentPredVector| $ 8796093022208))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|Vector| |#2|))
      $)))) 

(MAKEPROP '|OrderedDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 7) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (|Boolean|) |ODP;<;2$B;1|
              (|NonNegativeInteger|) (|List| 7) (|Equation| 7) (|List| 14)
              (|Matrix| 26) (|Matrix| $)
              (|Record| (|:| |mat| 16) (|:| |vec| (|Vector| 26))) (|Vector| $)
              (|List| 22) (|List| 12) (|Symbol|) (|Union| 24 '#1="failed")
              (|Fraction| 26) (|Union| 26 '#1#) (|Integer|)
              (|Union| $ '"failed") (|Mapping| 10 7) (|Void|) (|Mapping| 7 7)
              (|PositiveInteger|) (|OutputForm|) (|CardinalNumber|)
              (|InputForm|) (|List| $) (|Record| (|:| |mat| 37) (|:| |vec| 42))
              (|Matrix| 7) (|Union| 7 '#1#) (|HashState|) (|SingleInteger|)
              (|String|) (|Vector| 7) (|List| 26))
           '#(< 0) 'NIL
           (CONS
            (|makeByteWordVec2| 39
                                '(0 1 4 8 2 2 10 4 8 2 13 14 15 9 3 4 8 17 9 2
                                  5 11 8 17 5 17 5 2 16 0 5 2 6 16 0 5 6 12 32
                                  0 0 29 31 18 0 0 0 0 29 38 5 7 8 12 30 18 39
                                  35))
            (CONS
             '#(|DirectProductCategory&| |VectorSpace&| |OrderedRing&|
                |Algebra&| |FullyLinearlyExplicitRingOver&|
                |DifferentialExtension&| |Module&| NIL NIL NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL |AbelianGroup&| NIL NIL
                NIL |IndexedAggregate&| |OrderedSet&| NIL |Monoid&|
                |AbelianMonoid&| |HomogeneousAggregate&| NIL |SemiGroup&|
                |Finite&| |AbelianSemiGroup&| |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| |FullyRetractableTo&| NIL NIL NIL
                NIL |InnerEvalable&| NIL |PartialOrder&| NIL NIL NIL
                |BasicType&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 7) (|VectorSpace| 7)
                 (|OrderedRing|) (|Algebra| 7)
                 (|FullyLinearlyExplicitRingOver| 7)
                 (|DifferentialExtension| 7) (|Module| 7)
                 (|CharacteristicZero|) (|CommutativeRing|)
                 (|LinearlyExplicitRingOver| 7) (|LinearlyExplicitRingOver| 26)
                 (|PartialDifferentialRing| 22) (|DifferentialRing|)
                 (|BiModule| 7 7) (|OrderedAbelianMonoidSup|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| 7) (|RightModule| 7)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|IndexedAggregate| 26 7)
                 (|OrderedSet|) (|SemiRng|) (|Monoid|) (|AbelianMonoid|)
                 (|HomogeneousAggregate| 7) (|Comparable|) (|SemiGroup|)
                 (|Finite|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 26 7) (|Evalable| 7) (|SetCategory|)
                 (|FullyRetractableTo| 7) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 7)) (|Eltable| 26 7)
                 (|InnerEvalable| 7 7) (|CoercibleTo| 32) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 34)
                 (|BasicType|) (|RetractableTo| 7) (|RetractableTo| 24)
                 (|RetractableTo| 26))
              (|makeByteWordVec2| 11 '(2 5 10 0 0 11)))))
           '|lookupIncomplete|)) 
