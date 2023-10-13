
(/VERSIONCHECK 2) 

(DEFUN |DPMM;*;R2$;1| (|r| |x| $)
  (PROG (#1=#:G127 #2=#:G129 |i| #3=#:G128)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# (GETREFV #4=(QREFELT $ 6)) . #5=(|DPMM;*;R2$;1|))
       (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#) (LETT #1# 0 . #5#) G190
            (COND ((|greater_SI| |i| #2#) (GO G191)))
            (SEQ
             (EXIT
              (SETELT #3# #1#
                      (SPADCALL |r| (SPADCALL |x| |i| (QREFELT $ 12))
                                (QREFELT $ 13)))))
            (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #5#))
                  . #5#)
            (GO G190) G191 (EXIT NIL))
       #3#))))) 

(DEFUN |DPMM;*;M2$;2| (|m| |x| $)
  (PROG (#1=#:G131 #2=#:G130 #3=#:G132 #4=#:G138 |j| #5=#:G135 #6=#:G137 |i|
         #7=#:G136)
    (RETURN
     (SEQ
      (PROGN
       (LETT #7# (GETREFV #8=(QREFELT $ 6)) . #9=(|DPMM;*;M2$;2|))
       (SEQ (LETT |i| 1 . #9#) (LETT #6# #8# . #9#) (LETT #5# 0 . #9#) G190
            (COND ((|greater_SI| |i| #6#) (GO G191)))
            (SEQ
             (EXIT
              (SETELT #7# #5#
                      (PROGN
                       (LETT #1# NIL . #9#)
                       (SEQ (LETT |j| 1 . #9#) (LETT #4# (QREFELT $ 6) . #9#)
                            G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #3#
                                     (SPADCALL
                                      (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                      (SPADCALL |x| |j| (QREFELT $ 12))
                                      (QREFELT $ 13))
                                     . #9#)
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #3# (QREFELT $ 16))
                                       . #9#))
                                ('T
                                 (PROGN
                                  (LETT #2# #3# . #9#)
                                  (LETT #1# 'T . #9#)))))))
                            (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#1# #2#) ('T (|spadConstant| $ 17)))))))
            (LETT #5# (PROG1 (|inc_SI| #5#) (LETT |i| (|inc_SI| |i|) . #9#))
                  . #9#)
            (GO G190) G191 (EXIT NIL))
       #7#))))) 

(DEFUN |DirectProductMatrixModule| (&REST #1=#:G161)
  (PROG ()
    (RETURN
     (PROG (#2=#:G162)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|DirectProductMatrixModule|)
                                           '|domainEqualList|)
                . #3=(|DirectProductMatrixModule|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |DirectProductMatrixModule;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|DirectProductMatrixModule|))))))))))) 

(DEFUN |DirectProductMatrixModule;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| #1=#:G155 #2=#:G156 #3=#:G158 #4=#:G159 #5=#:G160 $ |dv$| DV$4
         DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #6=(|DirectProductMatrixModule|))
      (LETT DV$2 (|devaluate| |#2|) . #6#)
      (LETT DV$3 (|devaluate| |#3|) . #6#)
      (LETT DV$4 (|devaluate| |#4|) . #6#)
      (LETT |dv$| (LIST '|DirectProductMatrixModule| DV$1 DV$2 DV$3 DV$4)
            . #6#)
      (LETT $ (GETREFV 50) . #6#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#4| '(|Field|))
                                               (|HasCategory| |#4| '(|Ring|))
                                               (|HasCategory| |#4|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (LETT #5#
                                                     (|HasCategory| |#4|
                                                                    '(|OrderedRing|))
                                                     . #6#)
                                               (OR
                                                (|HasCategory| |#4|
                                                               '(|OrderedAbelianMonoidSup|))
                                                #5#)
                                               (|HasCategory| |#4| '(|Monoid|))
                                               (|HasCategory| |#4|
                                                              '(|unitsKnown|))
                                               (LETT #4#
                                                     (|HasCategory| |#4|
                                                                    '(|CommutativeRing|))
                                                     . #6#)
                                               (OR #4#
                                                   (|HasCategory| |#4|
                                                                  '(|Field|))
                                                   (|HasCategory| |#4|
                                                                  '(|Ring|)))
                                               (OR #4#
                                                   (|HasCategory| |#4|
                                                                  '(|Field|)))
                                               (OR #4#
                                                   (|HasCategory| |#4|
                                                                  '(|Ring|)))
                                               (|HasCategory| |#4| '(|Finite|))
                                               (|HasCategory| |#4|
                                                              '(|LinearlyExplicitRingOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (LETT #3#
                                                     (|HasCategory| |#4|
                                                                    '(|DifferentialRing|))
                                                     . #6#)
                                               (OR
                                                (|HasCategory| |#4|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#4|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #4# #3#
                                                (|HasCategory| |#4| '(|Ring|)))
                                               (|HasCategory| |#4|
                                                              '(|SetCategory|))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#3|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#4|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#4|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#4|
                                                               '(|CancellationAbelianMonoid|))
                                                #4# #3#
                                                (|HasCategory| |#4| '(|Ring|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#3|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#4|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#4|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #4# #3#
                                                (|HasCategory| |#4| '(|Ring|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#2|
                                                               '(|AbelianMonoid|))
                                                (|HasCategory| |#3|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#3|
                                                               '(|AbelianMonoid|))
                                                (|HasCategory| |#4|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#4|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#4|
                                                               '(|CancellationAbelianMonoid|))
                                                #4# #3#
                                                (|HasCategory| |#4| '(|Ring|)))
                                               (AND
                                                (|HasCategory| |#4|
                                                               (LIST
                                                                '|Evalable|
                                                                (|devaluate|
                                                                 |#4|)))
                                                (|HasCategory| |#4|
                                                               '(|SetCategory|)))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 (|HasCategory| |#4|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 (|HasCategory| |#4|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|))))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 (|HasCategory| |#4|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 (|HasCategory| |#4|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 (|HasCategory| |#4|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 (|HasCategory| |#4|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 (|HasCategory| |#4|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 (|HasCategory| |#4|
                                                                '(|Ring|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#4|)))
                                                 (|HasCategory| |#4|
                                                                '(|SetCategory|))))
                                               (|HasCategory| (|Integer|)
                                                              '(|OrderedSet|))
                                               (AND
                                                (|HasCategory| |#4|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#4| '(|Ring|)))
                                               (AND #3#
                                                    (|HasCategory| |#4|
                                                                   '(|Ring|)))
                                               (AND
                                                (|HasCategory| |#4|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#4| '(|Ring|)))
                                               (LETT #2#
                                                     (AND
                                                      (|HasCategory| |#4|
                                                                     '(|RetractableTo|
                                                                       (|Integer|)))
                                                      (|HasCategory| |#4|
                                                                     '(|SetCategory|)))
                                                     . #6#)
                                               (OR
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|)))
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#4|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#4|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#4|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#4|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#4|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#4|
                                                                '(|Ring|)))
                                                #2#)
                                               (OR #2#
                                                   (|HasCategory| |#4|
                                                                  '(|Ring|)))
                                               (LETT #1#
                                                     (AND
                                                      (|HasCategory| |#4|
                                                                     '(|RetractableTo|
                                                                       (|Fraction|
                                                                        (|Integer|))))
                                                      (|HasCategory| |#4|
                                                                     '(|SetCategory|)))
                                                     . #6#)
                                               (OR
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|)))))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|)))
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|)))))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#4|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#4|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#4|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#4|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#4|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#4|
                                                                '(|Ring|)))
                                                #1#)
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianMonoid|))
                                                (|HasCategory| |#3|
                                                               '(|AbelianMonoid|))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#4|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#4|
                                                                '(|Ring|)))
                                                (|HasCategory| |#4|
                                                               '(|CancellationAbelianMonoid|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#3|
                                                               '(|AbelianGroup|))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#4|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#4|
                                                                '(|Ring|)))
                                                (|HasCategory| |#4|
                                                               '(|CancellationAbelianMonoid|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                (|HasCategory| |#3|
                                                               '(|AbelianGroup|))
                                                (AND
                                                 (|HasCategory| |#4|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#4|
                                                                '(|Field|)))
                                                (|HasCategory| |#4|
                                                               '(|Ring|)))))
                      . #6#))
      (|haddProp| |$ConstructorCache| '|DirectProductMatrixModule|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 17179869184))
      (AND (|HasCategory| |#4| '(|SetCategory|))
           (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 34359738368))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 68719476736))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (|Vector| |#4|))
      $)))) 

(MAKEPROP '|DirectProductMatrixModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 9) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) '|Rep| (|Integer|)
              (0 . |elt|) (6 . *) |DPMM;*;R2$;1| (12 . |elt|) (19 . +)
              (25 . |Zero|) |DPMM;*;M2$;2| (|Boolean|) (|NonNegativeInteger|)
              (|List| 9) (|Equation| 9) (|List| 22)
              (|Record| (|:| |mat| 27) (|:| |vec| (|Vector| 11))) (|Matrix| $)
              (|Vector| $) (|Matrix| 11) (|List| 30) (|List| 20) (|Symbol|)
              (|Union| 32 '#1="failed") (|Fraction| 11) (|Union| 11 '#1#)
              (|Union| $ '"failed") (|Mapping| 19 9) (|Void|) (|Mapping| 9 9)
              (|CardinalNumber|) (|InputForm|) (|PositiveInteger|) (|List| $)
              (|Matrix| 9) (|Record| (|:| |mat| 42) (|:| |vec| 48))
              (|Union| 9 '#1#) (|SingleInteger|) (|OutputForm|) (|String|)
              (|Vector| 9) (|List| 11))
           '#(|elt| 29 * 35) 'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(0 1 8 2 2 10 4 8 2 13 14 15 9 3 4 8 16 0 0 9
                                  2 5 11 8 16 5 19 5 2 18 0 5 2 6 20 0 0 5 6 12
                                  0 0 0 22 17 0 0 0 0 0 0 22 5 7 8 12 17 31
                                  28))
            (CONS
             '#(|DirectProductCategory&| |VectorSpace&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Module&| |OrderedRing&| NIL NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL |IndexedAggregate&|
                |OrderedSet&| NIL |Monoid&| |AbelianMonoid&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| NIL |SemiGroup&|
                |Finite&| |Aggregate&| |SetCategory&| |EltableAggregate&|
                |Evalable&| |FullyRetractableTo&| NIL NIL |BasicType&| NIL NIL
                NIL |InnerEvalable&| |PartialOrder&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 9) (|VectorSpace| 9) (|Algebra| 9)
                 (|FullyLinearlyExplicitRingOver| 9)
                 (|DifferentialExtension| 9) (|Module| 9) (|OrderedRing|)
                 (|CommutativeRing|) (|LinearlyExplicitRingOver| 9)
                 (|LinearlyExplicitRingOver| 11) (|PartialDifferentialRing| 30)
                 (|DifferentialRing|) (|BiModule| 9 9)
                 (|OrderedAbelianMonoidSup|) (|OrderedAbelianGroup|)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 8) (|LeftModule| 7)
                 (|LeftModule| 9) (|RightModule| 9)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|IndexedAggregate| 11 9)
                 (|OrderedSet|) (|SemiRng|) (|Monoid|) (|AbelianMonoid|)
                 (|HomogeneousAggregate| 9) (|AbelianSemiGroup|) (|Comparable|)
                 (|SemiGroup|) (|Finite|) (|Aggregate|) (|SetCategory|)
                 (|EltableAggregate| 11 9) (|Evalable| 9)
                 (|FullyRetractableTo| 9) (|Type|) (|CoercibleTo| 46)
                 (|BasicType|) (|finiteAggregate|) (|CoercibleTo| (|Vector| 9))
                 (|Eltable| 11 9) (|InnerEvalable| 9 9) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 39)
                 (|RetractableTo| 9) (|RetractableTo| 32) (|RetractableTo| 11))
              (|makeByteWordVec2| 18
                                  '(2 0 9 0 11 12 2 9 0 7 0 13 3 8 7 0 11 11 15
                                    2 9 0 0 0 16 0 9 0 17 2 0 9 0 11 12 2 0 0 8
                                    0 18 2 0 0 7 0 14)))))
           '|lookupIncomplete|)) 
