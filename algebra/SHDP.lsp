
(SDEFUN |SHDP;lessThanRlex|
        ((|v1| $) (|v2| $) (|low| |NonNegativeInteger|)
         (|high| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG
         ((#1=#:G116 NIL) (#2=#:G118 NIL) (|i| NIL) (|n2| (S)) (|n1| (S))
          (#3=#:G117 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n1| (|spadConstant| $ 10) . #4=(|SHDP;lessThanRlex|))
                (LETT |n2| (|spadConstant| $ 10) . #4#)
                (SEQ (LETT |i| |low| . #4#) (LETT #3# |high| . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (LETT |n1|
                            (SPADCALL |n1| (SPADCALL |v1| |i| (QREFELT $ 12))
                                      (QREFELT $ 13))
                            . #4#)
                      (EXIT
                       (LETT |n2|
                             (SPADCALL |n2| (SPADCALL |v2| |i| (QREFELT $ 12))
                                       (QREFELT $ 13))
                             . #4#)))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((SPADCALL |n1| |n2| (QREFELT $ 15)) 'T)
                       ((SPADCALL |n2| |n1| (QREFELT $ 15)) 'NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |i| |high| . #4#) (LETT #2# |low| . #4#)
                              G190 (COND ((< |i| #2#) (GO G191)))
                              (SEQ
                               (COND
                                ((SPADCALL (SPADCALL |v2| |i| (QREFELT $ 12))
                                           (SPADCALL |v1| |i| (QREFELT $ 12))
                                           (QREFELT $ 15))
                                 (PROGN (LETT #1# 'T . #4#) (GO #5=#:G115))))
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |v1| |i| (QREFELT $ 12))
                                            (SPADCALL |v2| |i| (QREFELT $ 12))
                                            (QREFELT $ 15))
                                  (PROGN (LETT #1# 'NIL . #4#) (GO #5#))))))
                              (LETT |i| (+ |i| -1) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT 'NIL)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |SHDP;<;2$B;2| ((|v1| $) (|v2| $) ($ |Boolean|))
        (SPROG ((#1=#:G124 NIL) (#2=#:G125 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND ((|SHDP;lessThanRlex| |v1| |v2| 1 (QREFELT $ 7) $) 'T)
                       ('T
                        (SEQ
                         (SEQ (LETT |i| 1 . #3=(|SHDP;<;2$B;2|))
                              (LETT #2# (QREFELT $ 7) . #3#) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |v1| |i| (QREFELT $ 12))
                                            (SPADCALL |v2| |i| (QREFELT $ 12))
                                            (QREFELT $ 16))
                                  (PROGN
                                   (LETT #1# 'NIL . #3#)
                                   (GO #4=#:G123))))))
                              (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (|SHDP;lessThanRlex| |v1| |v2| (+ (QREFELT $ 7) 1)
                           (QREFELT $ 6) $))))))
                #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |SplitHomogeneousDirectProduct;|)) 

(DEFUN |SplitHomogeneousDirectProduct| (&REST #1=#:G148)
  (SPROG NIL
         (PROG (#2=#:G149)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SplitHomogeneousDirectProduct|)
                                               '|domainEqualList|)
                    . #3=(|SplitHomogeneousDirectProduct|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SplitHomogeneousDirectProduct;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SplitHomogeneousDirectProduct|)))))))))) 

(DEFUN |SplitHomogeneousDirectProduct;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G142 NIL) (#2=#:G143 NIL) (#3=#:G144 NIL) (#4=#:G145 NIL)
    (#5=#:G146 NIL) (#6=#:G147 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #7=(|SplitHomogeneousDirectProduct|))
    (LETT DV$2 (|devaluate| |#2|) . #7#)
    (LETT DV$3 (|devaluate| |#3|) . #7#)
    (LETT |dv$| (LIST '|SplitHomogeneousDirectProduct| DV$1 DV$2 DV$3) . #7#)
    (LETT $ (GETREFV 49) . #7#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#3| '(|Field|))
                                             (|HasCategory| |#3| '(|Ring|))
                                             (|HasCategory| |#3|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #6#
                                                   (|HasCategory| |#3|
                                                                  '(|OrderedRing|))
                                                   . #7#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #6#)
                                             (|HasCategory| |#3| '(|Monoid|))
                                             (|HasCategory| |#3|
                                                            '(|unitsKnown|))
                                             (LETT #5#
                                                   (|HasCategory| |#3|
                                                                  '(|CommutativeRing|))
                                                   . #7#)
                                             (OR #5#
                                                 (|HasCategory| |#3|
                                                                '(|Field|))
                                                 (|HasCategory| |#3|
                                                                '(|Ring|)))
                                             (OR #5#
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                             (OR #5#
                                                 (|HasCategory| |#3|
                                                                '(|Ring|)))
                                             (|HasCategory| |#3| '(|Finite|))
                                             (|HasCategory| |#3|
                                                            '(|LinearlyExplicitRingOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#3|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #4#
                                                   (|HasCategory| |#3|
                                                                  '(|DifferentialRing|))
                                                   . #7#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitRingOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              #5# #4# #6#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitRingOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #5# #4# #6#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (|HasCategory| |#3|
                                                            '(|SetCategory|))
                                             (|HasCategory| |#3|
                                                            '(|BasicType|))
                                             (AND
                                              (|HasCategory| |#3|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#3|)))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (|HasCategory| (|Integer|)
                                                            '(|OrderedSet|))
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitRingOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (AND #4#
                                                  (|HasCategory| |#3|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3| '(|Ring|)))
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#3| '(|Ring|)))
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
                                             (LETT #3#
                                                   (|HasCategory| |#3|
                                                                  '(|AbelianSemiGroup|))
                                                   . #7#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitRingOver|
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
                                               #3#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|CancellationAbelianMonoid|)))
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
                                               #4#)
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
                                               (|HasCategory| |#3|
                                                              '(|Finite|)))
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
                                               #6#)
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
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitRingOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #3#
                                              (|HasCategory| |#3|
                                                             '(|BasicType|))
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              #5# #4#
                                              (|HasCategory| |#3| '(|Field|))
                                              (|HasCategory| |#3| '(|Finite|))
                                              (|HasCategory| |#3| '(|Monoid|))
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #6#
                                              (|HasCategory| |#3| '(|Ring|))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitRingOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #3#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              #5# #4#
                                              (|HasCategory| |#3| '(|Field|))
                                              (|HasCategory| |#3| '(|Finite|))
                                              (|HasCategory| |#3| '(|Monoid|))
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #6#
                                              (|HasCategory| |#3| '(|Ring|))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitRingOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #3#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              #5# #4#
                                              (|HasCategory| |#3| '(|Field|))
                                              #6#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (|HasCategory| |#3|
                                                            '(|CoercibleTo|
                                                              (|OutputForm|)))
                                             (LETT #2#
                                                   (AND
                                                    (|HasCategory| |#3|
                                                                   '(|RetractableTo|
                                                                     (|Integer|)))
                                                    (|HasCategory| |#3|
                                                                   '(|SetCategory|)))
                                                   . #7#)
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
                                               #3#)
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
                                               #5#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Field|)))
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
                                               #6#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|)))
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
                                                   . #7#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|)))
                                              #1# #2#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3| '(|Field|))
                                               (|HasCategory| |#3| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#3|
                                                              '(|CancellationAbelianMonoid|))
                                               (|HasCategory| |#3|
                                                              '(|Field|))))
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
                                               #3#)
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
                                               #5#)
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
                                               (|HasCategory| |#3| '(|Field|)))
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
                                               #6#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3| '(|Ring|)))
                                              #1#)))
                    . #7#))
    (|haddProp| |$ConstructorCache| '|SplitHomogeneousDirectProduct|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 549755813888))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 1099511627776))
    (AND (|HasCategory| |#3| '(|SetCategory|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 2199023255552))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 4398046511104))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      (|HasCategory| |#3| '(|SetCategory|)))
     (|augmentPredVector| $ 8796093022208))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Vector| |#3|))
    $))) 

(MAKEPROP '|SplitHomogeneousDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (0 . |Zero|) (|Integer|)
              (4 . |qelt|) (10 . +) (|Boolean|) (16 . <) (22 . ~=)
              |SHDP;<;2$B;2| (|NonNegativeInteger|) (|List| 8) (|Equation| 8)
              (|List| 20) (|Matrix| 11) (|Matrix| $)
              (|Record| (|:| |mat| 22) (|:| |vec| (|Vector| 11))) (|Vector| $)
              (|List| 28) (|List| 18) (|Symbol|) (|Union| 30 '#1="failed")
              (|Fraction| 11) (|Union| 11 '#1#) (|Union| $ '"failed")
              (|Mapping| 14 8) (|Void|) (|Mapping| 8 8) (|PositiveInteger|)
              (|OutputForm|) (|CardinalNumber|) (|InputForm|) (|List| $)
              (|Record| (|:| |mat| 42) (|:| |vec| 47)) (|Matrix| 8)
              (|Union| 8 '#1#) (|HashState|) (|SingleInteger|) (|String|)
              (|Vector| 8) (|List| 11))
           '#(|qelt| 28 < 34) 'NIL
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
              '#((|DirectProductCategory| 6 8) (|VectorSpace| 8)
                 (|OrderedRing|) (|Algebra| 8)
                 (|FullyLinearlyExplicitRingOver| 8)
                 (|DifferentialExtension| 8) (|Module| 8)
                 (|CharacteristicZero|) (|CommutativeRing|)
                 (|LinearlyExplicitRingOver| 8) (|LinearlyExplicitRingOver| 11)
                 (|PartialDifferentialRing| 28) (|DifferentialRing|)
                 (|BiModule| 8 8) (|OrderedAbelianMonoidSup|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| 8) (|RightModule| 8)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|IndexedAggregate| 11 8)
                 (|OrderedSet|) (|SemiRng|) (|Monoid|) (|AbelianMonoid|)
                 (|HomogeneousAggregate| 8) (|Comparable|) (|SemiGroup|)
                 (|Finite|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 11 8) (|Evalable| 8) (|SetCategory|)
                 (|FullyRetractableTo| 8) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 8)) (|Eltable| 11 8)
                 (|InnerEvalable| 8 8) (|CoercibleTo| 37) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 39)
                 (|BasicType|) (|RetractableTo| 8) (|RetractableTo| 30)
                 (|RetractableTo| 11))
              (|makeByteWordVec2| 17
                                  '(0 8 0 10 2 0 8 0 11 12 2 8 0 0 0 13 2 8 14
                                    0 0 15 2 8 14 0 0 16 2 0 8 0 11 12 2 5 14 0
                                    0 17)))))
           '|lookupIncomplete|)) 
