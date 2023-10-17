
(SDEFUN |DPMO;*;R2$;1| ((|r| (R)) (|x| ($)) ($ ($)))
        (SPROG ((#1=#:G106 NIL) (#2=#:G108 NIL) (|i| NIL) (#3=#:G107 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT $ 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL |r| (SPADCALL |x| |i| (QREFELT $ 11))
                                          (QREFELT $ 12)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(DECLAIM (NOTINLINE |DirectProductModule;|)) 

(DEFUN |DirectProductModule| (&REST #1=#:G136)
  (SPROG NIL
         (PROG (#2=#:G137)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T T))
                                               (HGET |$ConstructorCache|
                                                     '|DirectProductModule|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProductModule;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DirectProductModule|)))))))))) 

(DEFUN |DirectProductModule;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G126 NIL) (#2=#:G127 NIL) (#3=#:G128 NIL) (#4=#:G130 NIL)
    (#5=#:G129 NIL) (#6=#:G131 NIL) (#7=#:G132 NIL) (#8=#:G133 NIL)
    (#9=#:G134 NIL) (#10=#:G135 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|DirectProductModule| DV$1 DV$2 DV$3))
    (LETT $ (GETREFV 46))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|)))
                                        (LETT #10#
                                              (|HasCategory| |#3|
                                                             '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10#)
                                        (|HasCategory| |#3| '(|unitsKnown|))
                                        (|HasCategory| |#3|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#3| '(|SemiRng|))
                                        (|HasCategory| |#3| '(|Ring|))
                                        (|HasCategory| |#3| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
                                        (LETT #9#
                                              (|HasCategory| |#3| '(|Finite|)))
                                        (OR #9#
                                            (|HasCategory| |#3|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| |#3|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #10#)
                                        (OR (|HasCategory| |#3| '(|Ring|))
                                            (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#3|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #8#
                                              (|HasCategory| |#3|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#3| '(|Ring|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3| '(|SetCategory|))
                                        (AND
                                         (|HasCategory| |#3|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#3|)))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (|HasCategory| |#3| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (OR #9# #10#)
                                        (AND #8#
                                             (|HasCategory| |#3| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (LETT #7#
                                              (|HasCategory| |#3|
                                                             '(|SemiGroup|)))
                                        (OR (|HasCategory| |#3| '(|Monoid|))
                                            #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                        (OR #6# (|HasCategory| |#3| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (LETT #5#
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|))))
                                        (OR
                                         (AND #5#
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #5#
                                              (|HasCategory| |#3|
                                                             '(|CommutativeRing|)))
                                         (AND #5# #8#) #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #3#
                                              (|HasCategory| |#3|
                                                             '(|AbelianMonoid|)))
                                        (AND #3#
                                             (|HasCategory| |#3| '(|Monoid|)))
                                        (AND #3#
                                             (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2#)
                                        (LETT #1#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
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
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
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
                                          #9#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoid|)))
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
                                          #10#)
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
                                          #7#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|SemiRng|)))
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
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
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
                                          #9#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoid|)))
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
                                          #10#)
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
                                          #7#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|SemiRng|)))
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
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoid|)))
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
                                          #10#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         #6#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2# #1#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2# #3# #1#)))))
    (|haddProp| |$ConstructorCache| '|DirectProductModule|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 140737488355328))
    (AND #10# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 281474976710656))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 562949953421312))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
         #3#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianMonoid|))))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         (AND #2# (|HasCategory| |#3| '(|Ring|)))
         (AND #2# (|HasCategory| |#3| '(|SemiRng|))) #1#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         #2#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 9007199254740992))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Vector| |#3|))
    $))) 

(MAKEPROP '|DirectProductModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT $ 6)) 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Integer|)
              (0 . |elt|) (6 . *) |DPMO;*;R2$;1| (|Boolean|)
              (|NonNegativeInteger|) (|PositiveInteger|) (|List| 8)
              (|Equation| 8) (|List| 18)
              (|Record| (|:| |mat| 23) (|:| |vec| (|Vector| 10))) (|Matrix| $)
              (|Vector| $) (|Matrix| 10) (|List| 26) (|List| 15) (|Symbol|)
              (|Fraction| 10) (|Union| 27 '#1="failed") (|Union| 10 '#1#)
              (|Union| $ '"failed") (|Mapping| 14 8 8) (|Mapping| 14 8)
              (|Void|) (|Mapping| 8 8) (|InputForm|) (|List| $)
              (|Record| (|:| |mat| 38) (|:| |vec| 44)) (|Matrix| 8)
              (|Union| 8 '#1#) (|OutputForm|) (|HashState|) (|SingleInteger|)
              (|String|) (|Vector| 8) (|List| 10))
           '#(|elt| 12 * 18) 'NIL
           (CONS
            (|makeByteWordVec2| 47
                                '(0 6 8 6 6 14 15 17 8 17 7 6 6 8 1 8 10 10 8
                                  33 0 0 1 7 10 10 13 33 17 2 41 2 8 9 46 0 4 9
                                  11 26 16 47 0 0 12 26 18 0 0 0 43 6 18 44 45
                                  0 0 0 0 0 0 43 3 5 6 11 18 44 45))
            (CONS
             '#(|DirectProductCategory&| NIL |DifferentialExtension&|
                |Algebra&| |Algebra&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL |Rng&| NIL |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL |AbelianGroup&| NIL NIL NIL NIL |IndexedAggregate&|
                |OrderedSet&| |MagmaWithUnit&| |Finite&| NIL
                |NonAssociativeSemiRng&| |AbelianMonoid&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| NIL |Magma&|
                |FullyRetractableTo&| |Aggregate&| |SetCategory&|
                |EltableAggregate&| |Evalable&| NIL |RetractableTo&|
                |RetractableTo&| |RetractableTo&| NIL NIL |BasicType&| NIL NIL
                NIL |InnerEvalable&| |PartialOrder&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 8) (|CommutativeRing|)
                 (|DifferentialExtension| 8) (|Algebra| $$) (|Algebra| 8)
                 (|PartialDifferentialRing| 26) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| $$) (|Module| 8)
                 (|FullyLinearlyExplicitOver| 8) (|OrderedAbelianMonoidSup|)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 8 8)
                 (|LinearlyExplicitOver| 8) (|LinearlyExplicitOver| 10)
                 (|LeftModule| 7) (|AbelianProductCategory| 8)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 8) (|RightModule| 8)
                 (|RightModule| 10) (|NonAssociativeRng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|CancellationAbelianMonoid|)
                 (|IndexedAggregate| 10 8) (|OrderedSet|) (|MagmaWithUnit|)
                 (|Finite|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|HomogeneousAggregate| 8)
                 (|AbelianSemiGroup|) (|Comparable|) (|Magma|)
                 (|FullyRetractableTo| 8) (|Aggregate|) (|SetCategory|)
                 (|EltableAggregate| 10 8) (|Evalable| 8) (|CommutativeStar|)
                 (|RetractableTo| 8) (|RetractableTo| 27) (|RetractableTo| 10)
                 (|Type|) (|CoercibleTo| 40) (|BasicType|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 8)) (|Eltable| 10 8)
                 (|InnerEvalable| 8 8) (|PartialOrder|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|ConvertibleTo| 35) (|CoercibleFrom| 8)
                 (|CoercibleFrom| 27) (|CoercibleFrom| 10))
              (|makeByteWordVec2| 13
                                  '(2 0 8 0 10 11 2 8 0 7 0 12 2 0 8 0 10 11 2
                                    0 0 7 0 13)))))
           '|lookupIncomplete|)) 
