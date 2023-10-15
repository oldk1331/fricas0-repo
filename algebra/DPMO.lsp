
(SDEFUN |DPMO;*;R2$;1| ((|r| R) (|x| $) ($ $))
        (SPROG ((#1=#:G106 NIL) (#2=#:G108 NIL) (|i| NIL) (#3=#:G107 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT $ 6)) . #5=(|DPMO;*;R2$;1|))
                 (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                      (LETT #1# 0 . #5#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL |r| (SPADCALL |x| |i| (QREFELT $ 11))
                                          (QREFELT $ 12)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#)
                              (LETT |i| (|inc_SI| |i|) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(DECLAIM (NOTINLINE |DirectProductModule;|)) 

(DEFUN |DirectProductModule| (&REST #1=#:G133)
  (SPROG NIL
         (PROG (#2=#:G134)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DirectProductModule|)
                                               '|domainEqualList|)
                    . #3=(|DirectProductModule|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProductModule;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DirectProductModule|)))))))))) 

(DEFUN |DirectProductModule;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G125 NIL) (#2=#:G126 NIL) (#3=#:G127 NIL) (#4=#:G128 NIL)
    (#5=#:G129 NIL) (#6=#:G130 NIL) (#7=#:G131 NIL) (#8=#:G132 NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #9=(|DirectProductModule|))
    (LETT DV$2 (|devaluate| |#2|) . #9#)
    (LETT DV$3 (|devaluate| |#3|) . #9#)
    (LETT |dv$| (LIST '|DirectProductModule| DV$1 DV$2 DV$3) . #9#)
    (LETT $ (GETREFV 46) . #9#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#3| '(|Field|))
                                             (|HasCategory| |#3| '(|SemiRng|))
                                             (|HasCategory| |#3|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #8#
                                                   (|HasCategory| |#3|
                                                                  '(|OrderedRing|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #8#)
                                             (|HasCategory| |#3| '(|Ring|))
                                             (|HasCategory| |#3| '(|Monoid|))
                                             (|HasCategory| |#3|
                                                            '(|unitsKnown|))
                                             (LETT #7#
                                                   (|HasCategory| |#3|
                                                                  '(|CommutativeRing|))
                                                   . #9#)
                                             (OR #7#
                                                 (|HasCategory| |#3|
                                                                '(|Field|))
                                                 (|HasCategory| |#3|
                                                                '(|SemiRng|)))
                                             (OR #7#
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                             (LETT #6#
                                                   (|HasCategory| |#3|
                                                                  '(|Finite|))
                                                   . #9#)
                                             (OR #6#
                                                 (|HasCategory| |#3|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #8#)
                                             (|HasCategory| |#3|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#3|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #5#
                                                   (|HasCategory| |#3|
                                                                  '(|DifferentialRing|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #7# #5# #8#
                                              (|HasCategory| |#3| '(|Ring|))
                                              (|HasCategory| |#3|
                                                             '(|SemiRng|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #7# #5# #8#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (|HasCategory| |#3|
                                                            '(|SetCategory|))
                                             (AND
                                              (|HasCategory| |#3|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#3|)))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#3|
                                                            '(|BasicType|))
                                             (|HasCategory| (|Integer|)
                                                            '(|OrderedSet|))
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (AND #5#
                                                  (|HasCategory| |#3|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (LETT #4#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiGroup|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#3| '(|Monoid|))
                                              #4#)
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#2|
                                                            '(|AbelianMonoid|))
                                             (LETT #3#
                                                   (|HasCategory| |#3|
                                                                  '(|AbelianMonoid|))
                                                   . #9#)
                                             (AND #3#
                                                  (|HasCategory| |#3|
                                                                 '(|Monoid|)))
                                             (AND #3#
                                                  (|HasCategory| |#3|
                                                                 '(|SemiRng|)))
                                             (|HasCategory| |#2|
                                                            '(|AbelianGroup|))
                                             (LETT #2#
                                                   (|HasCategory| |#3|
                                                                  '(|AbelianGroup|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND #2#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiRng|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (LETT #1#
                                                   (|HasCategory| |#3|
                                                                  '(|CancellationAbelianMonoid|))
                                                   . #9#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|))))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               #1#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|)))))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|)))))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #1#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #1#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND #2#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiRng|)))
                                              #1#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND #2#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiRng|)))
                                              #3# #1#
                                              (|HasCategory| |#3| '(|Ring|)))))
                    . #9#))
    (|haddProp| |$ConstructorCache| '|DirectProductModule|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 8796093022208))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 17592186044416))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|)) #3#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianMonoid|))))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #2# (|HasCategory| |#3| '(|Field|)))
         (AND #2# (|HasCategory| |#3| '(|SemiRng|))) #1#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #2# (|HasCategory| |#3| '(|Field|)))
         (AND #2# (|HasCategory| |#3| '(|SemiRng|)))
         (|HasCategory| |#3| '(|Ring|))
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 281474976710656))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Vector| |#3|))
    $))) 

(MAKEPROP '|DirectProductModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (|Integer|) (0 . |elt|)
              (6 . *) |DPMO;*;R2$;1| (|Boolean|) (|NonNegativeInteger|)
              (|PositiveInteger|) (|List| 8) (|List| 19) (|Equation| 8)
              (|Record| (|:| |mat| 23) (|:| |vec| (|Vector| 10))) (|Matrix| $)
              (|Vector| $) (|Matrix| 10) (|List| 26) (|List| 15) (|Symbol|)
              (|Fraction| 10) (|Union| 27 '#1="failed") (|Union| 10 '#1#)
              (|Union| $ '"failed") (|Mapping| 14 8) (|Void|) (|Mapping| 8 8)
              (|CardinalNumber|) (|InputForm|) (|List| $) (|Matrix| 8)
              (|Record| (|:| |mat| 37) (|:| |vec| 44)) (|Union| 8 '#1#)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|)
              (|Vector| 8) (|List| 10))
           '#(|elt| 12 * 18) 'NIL
           (CONS
            (|makeByteWordVec2| 43
                                '(0 4 6 6 4 9 9 6 14 15 16 18 1 6 18 11 2 10 3
                                  4 2 6 0 10 2 5 2 2 18 5 37 5 6 7 42 0 5 7 12
                                  27 17 43 0 0 13 27 0 0 0 39 19 0 0 0 0 0 0 39
                                  5 8 9 12 19 40 41))
            (CONS
             '#(|DirectProductCategory&| |OrderedRing&|
                |FullyLinearlyExplicitOver&| |DifferentialExtension&| NIL NIL
                |Algebra&| NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL |VectorSpace&| NIL |Rng&| |Module&| NIL
                NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL NIL
                |IndexedAggregate&| |OrderedSet&| |MagmaWithUnit&| |Finite&|
                NIL |NonAssociativeSemiRng&| |AbelianMonoid&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| NIL |Magma&|
                |Aggregate&| |SetCategory&| |EltableAggregate&| |Evalable&|
                |FullyRetractableTo&| NIL NIL |BasicType&| NIL NIL NIL
                |InnerEvalable&| |PartialOrder&| NIL NIL NIL |RetractableTo&|
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 8) (|OrderedRing|)
                 (|FullyLinearlyExplicitOver| 8) (|DifferentialExtension| 8)
                 (|CharacteristicZero|) (|CommutativeRing|) (|Algebra| 8)
                 (|LinearlyExplicitOver| 8) (|LinearlyExplicitOver| 10)
                 (|PartialDifferentialRing| 26) (|DifferentialRing|) (|Ring|)
                 (|VectorSpace| 8) (|SemiRing|) (|Rng|) (|Module| 8)
                 (|SemiRng|) (|BiModule| 8 8) (|OrderedAbelianMonoidSup|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|LeftModule| 7) (|LeftModule| 8)
                 (|RightModule| 8) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|RightModule| $$) (|NonAssociativeRng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|CancellationAbelianMonoid|)
                 (|IndexedAggregate| 10 8) (|OrderedSet|) (|MagmaWithUnit|)
                 (|Finite|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|HomogeneousAggregate| 8)
                 (|AbelianSemiGroup|) (|Comparable|) (|Magma|) (|Aggregate|)
                 (|SetCategory|) (|EltableAggregate| 10 8) (|Evalable| 8)
                 (|FullyRetractableTo| 8) (|Type|) (|CoercibleTo| 40)
                 (|BasicType|) (|finiteAggregate|) (|CoercibleTo| (|Vector| 8))
                 (|Eltable| 10 8) (|InnerEvalable| 8 8) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 35)
                 (|RetractableTo| 8) (|RetractableTo| 27) (|RetractableTo| 10))
              (|makeByteWordVec2| 13
                                  '(2 0 8 0 10 11 2 8 0 7 0 12 2 0 8 0 10 11 2
                                    0 0 7 0 13)))))
           '|lookupIncomplete|)) 
