
(/VERSIONCHECK 2) 

(DEFUN |DPMO;*;R2$;1| (|r| |x| $)
  (PROG (#1=#:G127 #2=#:G129 |i| #3=#:G128)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# (GETREFV #4=(QREFELT $ 6)) . #5=(|DPMO;*;R2$;1|))
       (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#) (LETT #1# 0 . #5#) G190
            (COND ((|greater_SI| |i| #2#) (GO G191)))
            (SEQ
             (EXIT
              (SETELT #3# #1#
                      (SPADCALL |r| (SPADCALL |x| |i| (QREFELT $ 11))
                                (QREFELT $ 12)))))
            (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #5#))
                  . #5#)
            (GO G190) G191 (EXIT NIL))
       #3#))))) 

(DEFUN |DirectProductModule| (&REST #1=#:G152)
  (PROG ()
    (RETURN
     (PROG (#2=#:G153)
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
              (HREM |$ConstructorCache| '|DirectProductModule|))))))))))) 

(DEFUN |DirectProductModule;| (|#1| |#2| |#3|)
  (PROG (|pv$| #1=#:G146 #2=#:G147 #3=#:G149 #4=#:G150 #5=#:G151 $ |dv$| DV$3
         DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #6=(|DirectProductModule|))
      (LETT DV$2 (|devaluate| |#2|) . #6#)
      (LETT DV$3 (|devaluate| |#3|) . #6#)
      (LETT |dv$| (LIST '|DirectProductModule| DV$1 DV$2 DV$3) . #6#)
      (LETT $ (GETREFV 45) . #6#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#3| '(|Field|))
                                               (|HasCategory| |#3| '(|Ring|))
                                               (|HasCategory| |#3|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (LETT #5#
                                                     (|HasCategory| |#3|
                                                                    '(|OrderedRing|))
                                                     . #6#)
                                               (OR
                                                (|HasCategory| |#3|
                                                               '(|OrderedAbelianMonoidSup|))
                                                #5#)
                                               (|HasCategory| |#3| '(|Monoid|))
                                               (|HasCategory| |#3|
                                                              '(|unitsKnown|))
                                               (LETT #4#
                                                     (|HasCategory| |#3|
                                                                    '(|CommutativeRing|))
                                                     . #6#)
                                               (OR #4#
                                                   (|HasCategory| |#3|
                                                                  '(|Field|))
                                                   (|HasCategory| |#3|
                                                                  '(|Ring|)))
                                               (OR #4#
                                                   (|HasCategory| |#3|
                                                                  '(|Field|)))
                                               (OR #4#
                                                   (|HasCategory| |#3|
                                                                  '(|Ring|)))
                                               (|HasCategory| |#3| '(|Finite|))
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitRingOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (LETT #3#
                                                     (|HasCategory| |#3|
                                                                    '(|DifferentialRing|))
                                                     . #6#)
                                               (OR
                                                (|HasCategory| |#3|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#3|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #4# #3#
                                                (|HasCategory| |#3| '(|Ring|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#3|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#3|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#3|
                                                               '(|CancellationAbelianMonoid|))
                                                #4# #3#
                                                (|HasCategory| |#3| '(|Ring|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#3|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#3|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #4# #3#
                                                (|HasCategory| |#3| '(|Ring|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#2|
                                                               '(|AbelianMonoid|))
                                                (|HasCategory| |#3|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#3|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#3|
                                                               '(|CancellationAbelianMonoid|))
                                                #4# #3#
                                                (|HasCategory| |#3| '(|Ring|)))
                                               (AND
                                                (|HasCategory| |#3|
                                                               (LIST
                                                                '|Evalable|
                                                                (|devaluate|
                                                                 |#3|)))
                                                (|HasCategory| |#3|
                                                               '(|SetCategory|)))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 (|HasCategory| |#3|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 (|HasCategory| |#3|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|))))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 (|HasCategory| |#3|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 (|HasCategory| |#3|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 (|HasCategory| |#3|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 (|HasCategory| |#3|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 (|HasCategory| |#3|
                                                                '(|Ring|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                                 (|HasCategory| |#3|
                                                                '(|SetCategory|))))
                                               (|HasCategory| (|Integer|)
                                                              '(|OrderedSet|))
                                               (AND
                                                (|HasCategory| |#3|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#3| '(|Ring|)))
                                               (AND #3#
                                                    (|HasCategory| |#3|
                                                                   '(|Ring|)))
                                               (AND
                                                (|HasCategory| |#3|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#3| '(|Ring|)))
                                               (LETT #2#
                                                     (AND
                                                      (|HasCategory| |#3|
                                                                     '(|RetractableTo|
                                                                       (|Integer|)))
                                                      (|HasCategory| |#3|
                                                                     '(|SetCategory|)))
                                                     . #6#)
                                               (OR
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|LinearlyExplicitRingOver|
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
                                                 (|HasCategory| |#3|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#3|
                                                                '(|Finite|)))
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
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#3|
                                                                '(|Ring|)))
                                                #2#)
                                               (OR #2#
                                                   (|HasCategory| |#3|
                                                                  '(|Ring|)))
                                               (LETT #1#
                                                     (AND
                                                      (|HasCategory| |#3|
                                                                     '(|RetractableTo|
                                                                       (|Fraction|
                                                                        (|Integer|))))
                                                      (|HasCategory| |#3|
                                                                     '(|SetCategory|)))
                                                     . #6#)
                                               (OR
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|LinearlyExplicitRingOver|
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
                                                 (|HasCategory| |#3|
                                                                '(|CancellationAbelianMonoid|)))
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
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#3|
                                                                '(|Finite|)))
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
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#3|
                                                                '(|Ring|)))
                                                #1#)
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianMonoid|))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#3|
                                                                '(|Ring|)))
                                                (|HasCategory| |#3|
                                                               '(|CancellationAbelianMonoid|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#3|
                                                                '(|Ring|)))
                                                (|HasCategory| |#3|
                                                               '(|CancellationAbelianMonoid|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (AND
                                                 (|HasCategory| |#3|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                                (|HasCategory| |#3|
                                                               '(|Ring|)))))
                      . #6#))
      (|haddProp| |$ConstructorCache| '|DirectProductModule|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 17179869184))
      (AND (|HasCategory| |#3| '(|SetCategory|))
           (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 34359738368))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 68719476736))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|Vector| |#3|))
      $)))) 

(MAKEPROP '|DirectProductModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (|Integer|) (0 . |elt|)
              (6 . *) |DPMO;*;R2$;1| (|Boolean|) (|NonNegativeInteger|)
              (|List| 8) (|Equation| 8) (|List| 17)
              (|Record| (|:| |mat| 22) (|:| |vec| (|Vector| 10))) (|Matrix| $)
              (|Vector| $) (|Matrix| 10) (|Symbol|) (|List| 23) (|List| 15)
              (|Fraction| 10) (|Union| 26 '#1="failed") (|Union| 10 '#1#)
              (|Union| $ '"failed") (|Mapping| 14 8) (|Void|) (|Mapping| 8 8)
              (|CardinalNumber|) (|InputForm|) (|PositiveInteger|) (|List| $)
              (|Matrix| 8) (|Record| (|:| |mat| 37) (|:| |vec| 43))
              (|Union| 8 '#1#) (|OutputForm|) (|String|) (|SingleInteger|)
              (|Vector| 8) (|List| 10))
           '#(|elt| 12 * 18) 'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(0 1 8 2 2 10 4 8 2 13 14 15 9 3 4 8 16 0 9 2
                                  5 11 8 16 5 19 5 2 18 0 5 2 6 20 0 0 5 6 12 0
                                  0 0 22 17 0 0 0 0 0 0 22 5 7 8 12 17 31 28))
            (CONS
             '#(|DirectProductCategory&| |VectorSpace&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Module&| |OrderedRing&| NIL NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL NIL |IndexedAggregate&|
                |OrderedSet&| NIL |Monoid&| |AbelianMonoid&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| NIL |SemiGroup&|
                |Finite&| |Aggregate&| |SetCategory&| |EltableAggregate&|
                |Evalable&| |FullyRetractableTo&| NIL NIL |BasicType&| NIL NIL
                NIL |InnerEvalable&| |PartialOrder&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 8) (|VectorSpace| 8) (|Algebra| 8)
                 (|FullyLinearlyExplicitRingOver| 8)
                 (|DifferentialExtension| 8) (|Module| 8) (|OrderedRing|)
                 (|CommutativeRing|) (|LinearlyExplicitRingOver| 8)
                 (|LinearlyExplicitRingOver| 10) (|PartialDifferentialRing| 23)
                 (|DifferentialRing|) (|BiModule| 8 8)
                 (|OrderedAbelianMonoidSup|) (|OrderedAbelianGroup|)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 7) (|LeftModule| 8)
                 (|RightModule| 8) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|RightModule| $$) (|Rng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|IndexedAggregate| 10 8)
                 (|OrderedSet|) (|SemiRng|) (|Monoid|) (|AbelianMonoid|)
                 (|HomogeneousAggregate| 8) (|AbelianSemiGroup|) (|Comparable|)
                 (|SemiGroup|) (|Finite|) (|Aggregate|) (|SetCategory|)
                 (|EltableAggregate| 10 8) (|Evalable| 8)
                 (|FullyRetractableTo| 8) (|Type|) (|CoercibleTo| 40)
                 (|BasicType|) (|finiteAggregate|) (|CoercibleTo| (|Vector| 8))
                 (|Eltable| 10 8) (|InnerEvalable| 8 8) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 34)
                 (|RetractableTo| 8) (|RetractableTo| 26) (|RetractableTo| 10))
              (|makeByteWordVec2| 13
                                  '(2 0 8 0 10 11 2 8 0 7 0 12 2 0 8 0 10 11 2
                                    0 0 7 0 13)))))
           '|lookupIncomplete|)) 
