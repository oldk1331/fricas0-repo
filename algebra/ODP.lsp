
(SDEFUN |ODP;<;2$B;1| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 8))) 

(DECLAIM (NOTINLINE |OrderedDirectProduct;|)) 

(DEFUN |OrderedDirectProduct| (&REST #1=#:G131)
  (SPROG NIL
         (PROG (#2=#:G132)
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
                  (HREM |$ConstructorCache| '|OrderedDirectProduct|)))))))))) 

(DEFUN |OrderedDirectProduct;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G121 NIL) (#2=#:G122 NIL) (#3=#:G123 NIL) (#4=#:G124 NIL)
    (#5=#:G125 NIL) (#6=#:G126 NIL) (#7=#:G127 NIL) (#8=#:G128 NIL)
    (#9=#:G129 NIL) (#10=#:G130 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #11=(|OrderedDirectProduct|))
    (LETT DV$2 (|devaluate| |#2|) . #11#)
    (LETT DV$3 (|devaluate| |#3|) . #11#)
    (LETT |dv$| (LIST '|OrderedDirectProduct| DV$1 DV$2 DV$3) . #11#)
    (LETT $ (GETREFV 44) . #11#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#2| '(|Field|))
                                             (|HasCategory| |#2| '(|SemiRng|))
                                             (|HasCategory| |#2|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #10#
                                                   (|HasCategory| |#2|
                                                                  '(|OrderedRing|))
                                                   . #11#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#)
                                             (|HasCategory| |#2| '(|Ring|))
                                             (|HasCategory| |#2| '(|Monoid|))
                                             (|HasCategory| |#2|
                                                            '(|unitsKnown|))
                                             (LETT #9#
                                                   (|HasCategory| |#2|
                                                                  '(|CommutativeRing|))
                                                   . #11#)
                                             (OR #9#
                                                 (|HasCategory| |#2|
                                                                '(|Field|))
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (OR #9#
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                             (LETT #8#
                                                   (|HasCategory| |#2|
                                                                  '(|Finite|))
                                                   . #11#)
                                             (OR #8#
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #10#)
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#2|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #7#
                                                   (|HasCategory| |#2|
                                                                  '(|DifferentialRing|))
                                                   . #11#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #9# #7# #10#
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #9# #7# #10#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (|HasCategory| |#2|
                                                            '(|SetCategory|))
                                             (AND
                                              (|HasCategory| |#2|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#2|)))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#2|
                                                            '(|BasicType|))
                                             (|HasCategory| (|Integer|)
                                                            '(|OrderedSet|))
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (AND #7#
                                                  (|HasCategory| |#2|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (LETT #6#
                                                   (|HasCategory| |#2|
                                                                  '(|AbelianMonoid|))
                                                   . #11#)
                                             (AND #6#
                                                  (|HasCategory| |#2|
                                                                 '(|Monoid|)))
                                             (AND #6#
                                                  (|HasCategory| |#2|
                                                                 '(|SemiRng|)))
                                             (LETT #5#
                                                   (|HasCategory| |#2|
                                                                  '(|AbelianGroup|))
                                                   . #11#)
                                             (OR
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (LETT #4#
                                                   (|HasCategory| |#2|
                                                                  '(|CancellationAbelianMonoid|))
                                                   . #11#)
                                             (OR
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|)))
                                              #6# #4#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (OR
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|)))
                                              #4#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6# #4# #9# #7#
                                              (|HasCategory| |#2| '(|Field|))
                                              #10#
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|)))
                                             (LETT #3#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiGroup|))
                                                   . #11#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #10#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #3#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#2| '(|Monoid|))
                                              #3#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6#
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))
                                              #4# #9# #7#
                                              (|HasCategory| |#2| '(|Field|))
                                              #8#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #3#
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6# #4# #9# #7#
                                              (|HasCategory| |#2| '(|Field|))
                                              #8#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #3#
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (OR #6#
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
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
                                                   . #11#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
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
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #8#)
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
                                               #10#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|)))
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
                                                              '(|SemiRng|)))
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
                                                   . #11#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|)))
                                              #1# #2#
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|))
                                                   (|HasCategory| |#2|
                                                                  '(|Ring|)))
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|)))
                                              (AND #6#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|)))
                                              (AND #6#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
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
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #8#)
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
                                               #10#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|)))
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
                                                              '(|SemiRng|)))
                                              #1#)))
                    . #11#))
    (|haddProp| |$ConstructorCache| '|OrderedDirectProduct|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 140737488355328))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 281474976710656))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 562949953421312))
    (AND
     (OR #6#
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianMonoid|))))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (AND #5# (|HasCategory| |#2| '(|Field|)))
         (AND #5# (|HasCategory| |#2| '(|SemiRng|))) #4#
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR (AND #5# (|HasCategory| |#2| '(|Field|)))
         (AND #5# (|HasCategory| |#2| '(|SemiRng|)))
         (|HasCategory| |#2| '(|Ring|))
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| $ 9007199254740992))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Vector| |#2|))
    $))) 

(MAKEPROP '|OrderedDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 7) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (|Boolean|) |ODP;<;2$B;1|
              (|NonNegativeInteger|) (|PositiveInteger|) (|List| 7) (|List| 16)
              (|Equation| 7) (|Matrix| 26) (|Matrix| $)
              (|Record| (|:| |mat| 17) (|:| |vec| (|Vector| 26))) (|Vector| $)
              (|Symbol|) (|List| 21) (|List| 12) (|Union| 25 '#1="failed")
              (|Fraction| 26) (|Integer|) (|Union| 26 '#1#)
              (|Union| $ '"failed") (|Mapping| 10 7) (|Void|) (|Mapping| 7 7)
              (|OutputForm|) (|CardinalNumber|) (|InputForm|) (|List| $)
              (|Record| (|:| |mat| 37) (|:| |vec| 42)) (|Matrix| 7)
              (|Union| 7 '#1#) (|SingleInteger|) (|String|) (|HashState|)
              (|Vector| 7) (|List| 26))
           '#(< 0) 'NIL
           (CONS
            (|makeByteWordVec2| 47
                                '(0 4 6 6 4 9 9 6 14 15 16 18 1 6 18 11 2 10 3
                                  4 2 6 10 2 5 2 2 18 30 5 33 5 6 7 0 32 5 7 12
                                  37 17 0 13 37 34 0 0 36 39 19 0 0 0 0 36 46 5
                                  8 9 12 38 19 47 43))
            (CONS
             '#(|DirectProductCategory&| |OrderedRing&|
                |FullyLinearlyExplicitOver&| |DifferentialExtension&| NIL NIL
                |Algebra&| NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL |VectorSpace&| NIL |Rng&| |Module&| NIL
                NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL NIL NIL
                |IndexedAggregate&| |AbelianMonoid&| |OrderedSet&|
                |MagmaWithUnit&| |Finite&| NIL |NonAssociativeSemiRng&|
                |HomogeneousAggregate&| NIL |Magma&| |AbelianSemiGroup&|
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&|
                |FullyRetractableTo&| NIL NIL NIL NIL |InnerEvalable&| NIL
                |PartialOrder&| NIL NIL NIL |BasicType&| |RetractableTo&|
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 7) (|OrderedRing|)
                 (|FullyLinearlyExplicitOver| 7) (|DifferentialExtension| 7)
                 (|CharacteristicZero|) (|CommutativeRing|) (|Algebra| 7)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 26)
                 (|PartialDifferentialRing| 21) (|DifferentialRing|) (|Ring|)
                 (|VectorSpace| 7) (|SemiRing|) (|Rng|) (|Module| 7)
                 (|SemiRng|) (|BiModule| 7 7) (|OrderedAbelianMonoidSup|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|LeftModule| 7) (|RightModule| 7)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|IndexedAggregate| 26 7) (|AbelianMonoid|)
                 (|OrderedSet|) (|MagmaWithUnit|) (|Finite|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|HomogeneousAggregate| 7)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 26 7) (|Evalable| 7) (|SetCategory|)
                 (|FullyRetractableTo| 7) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 7)) (|Eltable| 26 7)
                 (|InnerEvalable| 7 7) (|CoercibleTo| 32) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 34)
                 (|BasicType|) (|RetractableTo| 7) (|RetractableTo| 25)
                 (|RetractableTo| 26))
              (|makeByteWordVec2| 11 '(2 5 10 0 0 11)))))
           '|lookupIncomplete|)) 
