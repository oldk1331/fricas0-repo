
(SDEFUN |DPMM;*;R2$;1| ((|r| R) (|x| $) ($ $))
        (SPROG ((#1=#:G106 NIL) (#2=#:G108 NIL) (|i| NIL) (#3=#:G107 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT $ 6)) . #5=(|DPMM;*;R2$;1|))
                 (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                      (LETT #1# 0 . #5#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL |r| (SPADCALL |x| |i| (QREFELT $ 12))
                                          (QREFELT $ 13)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#)
                              (LETT |i| (|inc_SI| |i|) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |DPMM;*;M2$;2| ((|m| M) (|x| $) ($ $))
        (SPROG
         ((#1=#:G110 NIL) (#2=#:G109 (S)) (#3=#:G111 (S)) (#4=#:G117 NIL)
          (|j| NIL) (#5=#:G114 NIL) (#6=#:G116 NIL) (|i| NIL) (#7=#:G115 NIL))
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
                           (SEQ (LETT |j| 1 . #9#)
                                (LETT #4# (QREFELT $ 6) . #9#) G190
                                (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                     (LETT #2#
                                           (SPADCALL #2# #3# (QREFELT $ 16))
                                           . #9#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #3# . #9#)
                                      (LETT #1# 'T . #9#)))))))
                                (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#1# #2#) ('T (|spadConstant| $ 17)))))))
                (LETT #5#
                      (PROG1 (|inc_SI| #5#) (LETT |i| (|inc_SI| |i|) . #9#))
                      . #9#)
                (GO G190) G191 (EXIT NIL))
           #7#)))) 

(DECLAIM (NOTINLINE |DirectProductMatrixModule;|)) 

(DEFUN |DirectProductMatrixModule| (&REST #1=#:G142)
  (SPROG NIL
         (PROG (#2=#:G143)
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
                  (HREM |$ConstructorCache|
                        '|DirectProductMatrixModule|)))))))))) 

(DEFUN |DirectProductMatrixModule;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G134 NIL) (#2=#:G135 NIL) (#3=#:G136 NIL) (#4=#:G137 NIL)
    (#5=#:G138 NIL) (#6=#:G139 NIL) (#7=#:G140 NIL) (#8=#:G141 NIL) ($ NIL)
    (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #9=(|DirectProductMatrixModule|))
    (LETT DV$2 (|devaluate| |#2|) . #9#)
    (LETT DV$3 (|devaluate| |#3|) . #9#)
    (LETT DV$4 (|devaluate| |#4|) . #9#)
    (LETT |dv$| (LIST '|DirectProductMatrixModule| DV$1 DV$2 DV$3 DV$4) . #9#)
    (LETT $ (GETREFV 51) . #9#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#4| '(|Field|))
                                             (|HasCategory| |#4| '(|SemiRng|))
                                             (|HasCategory| |#4|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #8#
                                                   (|HasCategory| |#4|
                                                                  '(|OrderedSet|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#4|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #8#)
                                             (|HasCategory| |#4|
                                                            '(|unitsKnown|))
                                             (LETT #7#
                                                   (|HasCategory| |#4|
                                                                  '(|CommutativeRing|))
                                                   . #9#)
                                             (OR #7#
                                                 (|HasCategory| |#4|
                                                                '(|Field|))
                                                 (|HasCategory| |#4|
                                                                '(|SemiRng|)))
                                             (OR #7#
                                                 (|HasCategory| |#4|
                                                                '(|Field|)))
                                             (|HasCategory| |#4| '(|Ring|))
                                             (|HasCategory| |#4| '(|Monoid|))
                                             (LETT #6#
                                                   (|HasCategory| |#4|
                                                                  '(|Finite|))
                                                   . #9#)
                                             (OR #6#
                                                 (|HasCategory| |#4|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #8#)
                                             (|HasCategory| |#4|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#4|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #5#
                                                   (|HasCategory| |#4|
                                                                  '(|DifferentialRing|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #7# #5#
                                              (|HasCategory| |#4| '(|Ring|))
                                              (|HasCategory| |#4|
                                                             '(|SemiRng|)))
                                             (OR
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #7# #5#
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (|HasCategory| |#4|
                                                            '(|SetCategory|))
                                             (AND
                                              (|HasCategory| |#4|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#4|)))
                                              (|HasCategory| |#4|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#4|
                                                            '(|BasicType|))
                                             (|HasCategory| (|Integer|)
                                                            '(|OrderedSet|))
                                             (OR #6# #8#)
                                             (AND
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (AND #5#
                                                  (|HasCategory| |#4|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (LETT #4#
                                                   (|HasCategory| |#4|
                                                                  '(|SemiGroup|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#4| '(|Monoid|))
                                              #4#)
                                             (AND
                                              (|HasCategory| |#4|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|SetCategory|)))
                                             (OR
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|SetCategory|)))
                                              (|HasCategory| |#4| '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#4|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#4|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#2|
                                                            '(|AbelianMonoid|))
                                             (|HasCategory| |#3|
                                                            '(|AbelianMonoid|))
                                             (LETT #3#
                                                   (|HasCategory| |#4|
                                                                  '(|AbelianMonoid|))
                                                   . #9#)
                                             (AND #3#
                                                  (|HasCategory| |#4|
                                                                 '(|Monoid|)))
                                             (AND #3#
                                                  (|HasCategory| |#4|
                                                                 '(|SemiRng|)))
                                             (|HasCategory| |#2|
                                                            '(|AbelianGroup|))
                                             (|HasCategory| |#3|
                                                            '(|AbelianGroup|))
                                             (LETT #2#
                                                   (|HasCategory| |#4|
                                                                  '(|AbelianGroup|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #2#)
                                             (LETT #1#
                                                   (|HasCategory| |#4|
                                                                  '(|CancellationAbelianMonoid|))
                                                   . #9#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|))))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               #1#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#4|)))
                                               (|HasCategory| |#4|
                                                              '(|SetCategory|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|LinearlyExplicitOver|
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
                                               #1#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #7#)
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
                                               (|HasCategory| |#4| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #6#)
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
                                               #8#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#4| '(|Ring|)))
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
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#4|
                                                              '(|SetCategory|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|LinearlyExplicitOver|
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
                                               #1#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #6#)
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
                                               #8#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #2# #1#)
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
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #2# #3# #1#)))
                    . #9#))
    (|haddProp| |$ConstructorCache| '|DirectProductMatrixModule|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 70368744177664))
    (AND (|HasCategory| |#4| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 140737488355328))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (|HasCategory| |#3| '(|AbelianMonoid|)) #3#
         (AND (|HasCategory| |#4| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianMonoid|))))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (|HasCategory| |#3| '(|AbelianGroup|))
         (AND #2# (|HasCategory| |#4| '(|Field|)))
         (AND #2# (|HasCategory| |#4| '(|SemiRng|))) #1#
         (AND (|HasCategory| |#4| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (|HasCategory| |#3| '(|AbelianGroup|)) #2#
         (AND (|HasCategory| |#4| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 2251799813685248))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (|Vector| |#4|))
    $))) 

(MAKEPROP '|DirectProductMatrixModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 9) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) '|Rep| (|Integer|)
              (0 . |elt|) (6 . *) |DPMM;*;R2$;1| (12 . |elt|) (19 . +)
              (25 . |Zero|) |DPMM;*;M2$;2| (|Boolean|) (|NonNegativeInteger|)
              (|PositiveInteger|) (|List| 9) (|List| 24) (|Equation| 9)
              (|Matrix| 11) (|Matrix| $)
              (|Record| (|:| |mat| 25) (|:| |vec| (|Vector| 11))) (|Vector| $)
              (|List| 31) (|List| 20) (|Symbol|) (|Fraction| 11)
              (|Union| 32 '#1="failed") (|Union| 11 '#1#) (|Union| $ '"failed")
              (|Mapping| 19 9) (|Void|) (|Mapping| 9 9) (|CardinalNumber|)
              (|InputForm|) (|List| $) (|Matrix| 9)
              (|Record| (|:| |mat| 42) (|:| |vec| 49)) (|Union| 9 '#1#)
              (|SingleInteger|) (|OutputForm|) (|String|) (|HashState|)
              (|Vector| 9) (|List| 11))
           '#(|elt| 29 * 35) 'NIL
           (CONS
            (|makeByteWordVec2| 46
                                '(0 10 10 7 7 10 14 15 16 18 1 10 18 9 2 8 3 2
                                  10 0 0 0 8 2 3 2 2 18 3 40 3 10 11 45 0 5 11
                                  12 28 17 46 0 0 13 28 0 0 0 42 19 0 0 0 0 0 0
                                  42 4 6 7 12 19 43 44))
            (CONS
             '#(|DirectProductCategory&| |FullyLinearlyExplicitOver&|
                |DifferentialExtension&| NIL |Algebra&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL
                |VectorSpace&| NIL |Rng&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL NIL
                |IndexedAggregate&| |OrderedSet&| |MagmaWithUnit&| |Finite&|
                NIL |NonAssociativeSemiRng&| |AbelianMonoid&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| NIL |Magma&|
                |Aggregate&| |SetCategory&| |EltableAggregate&| |Evalable&|
                |FullyRetractableTo&| NIL NIL |BasicType&| NIL NIL NIL
                |InnerEvalable&| |PartialOrder&| NIL NIL NIL |RetractableTo&|
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 9) (|FullyLinearlyExplicitOver| 9)
                 (|DifferentialExtension| 9) (|CommutativeRing|) (|Algebra| 9)
                 (|LinearlyExplicitOver| 9) (|LinearlyExplicitOver| 11)
                 (|PartialDifferentialRing| 31) (|DifferentialRing|) (|Ring|)
                 (|VectorSpace| 9) (|SemiRing|) (|Rng|) (|Module| 9)
                 (|SemiRng|) (|BiModule| 9 9) (|OrderedAbelianMonoidSup|)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|LeftModule| 8)
                 (|LeftModule| 7) (|AbelianProductCategory| 9) (|LeftModule| 9)
                 (|RightModule| 9) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|RightModule| $$) (|NonAssociativeRng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|CancellationAbelianMonoid|)
                 (|IndexedAggregate| 11 9) (|OrderedSet|) (|MagmaWithUnit|)
                 (|Finite|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|HomogeneousAggregate| 9)
                 (|AbelianSemiGroup|) (|Comparable|) (|Magma|) (|Aggregate|)
                 (|SetCategory|) (|EltableAggregate| 11 9) (|Evalable| 9)
                 (|FullyRetractableTo| 9) (|Type|) (|CoercibleTo| 46)
                 (|BasicType|) (|finiteAggregate|) (|CoercibleTo| (|Vector| 9))
                 (|Eltable| 11 9) (|InnerEvalable| 9 9) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 40)
                 (|RetractableTo| 9) (|RetractableTo| 32) (|RetractableTo| 11))
              (|makeByteWordVec2| 18
                                  '(2 0 9 0 11 12 2 9 0 7 0 13 3 8 7 0 11 11 15
                                    2 9 0 0 0 16 0 9 0 17 2 0 9 0 11 12 2 0 0 8
                                    0 18 2 0 0 7 0 14)))))
           '|lookupIncomplete|)) 
