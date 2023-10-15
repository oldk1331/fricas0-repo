
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
                       ((SPADCALL |n2| |n1| (QREFELT $ 15)) NIL)
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
                                  (PROGN (LETT #1# NIL . #4#) (GO #5#))))))
                              (LETT |i| (+ |i| -1) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT NIL)))))))
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
                                   (LETT #1# NIL . #3#)
                                   (GO #4=#:G123))))))
                              (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (|SHDP;lessThanRlex| |v1| |v2| (+ (QREFELT $ 7) 1)
                           (QREFELT $ 6) $))))))
                #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |SplitHomogeneousDirectProduct;|)) 

(DEFUN |SplitHomogeneousDirectProduct| (&REST #1=#:G152)
  (SPROG NIL
         (PROG (#2=#:G153)
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
    (#5=#:G146 NIL) (#6=#:G147 NIL) (#7=#:G148 NIL) (#8=#:G149 NIL)
    (#9=#:G150 NIL) (#10=#:G151 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #11=(|SplitHomogeneousDirectProduct|))
    (LETT DV$2 (|devaluate| |#2|) . #11#)
    (LETT DV$3 (|devaluate| |#3|) . #11#)
    (LETT |dv$| (LIST '|SplitHomogeneousDirectProduct| DV$1 DV$2 DV$3) . #11#)
    (LETT $ (GETREFV 49) . #11#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#3| '(|Field|))
                                             (|HasCategory| |#3| '(|SemiRng|))
                                             (|HasCategory| |#3|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (|HasCategory| |#3|
                                                            '(|OrderedSet|))
                                             (LETT #10#
                                                   (|HasCategory| |#3|
                                                                  '(|OrderedRing|))
                                                   . #11#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#
                                              (|HasCategory| |#3|
                                                             '(|OrderedSet|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#)
                                             (|HasCategory| |#3| '(|Ring|))
                                             (|HasCategory| |#3| '(|Monoid|))
                                             (|HasCategory| |#3|
                                                            '(|unitsKnown|))
                                             (LETT #9#
                                                   (|HasCategory| |#3|
                                                                  '(|CommutativeRing|))
                                                   . #11#)
                                             (OR #9#
                                                 (|HasCategory| |#3|
                                                                '(|Field|))
                                                 (|HasCategory| |#3|
                                                                '(|SemiRng|)))
                                             (OR #9#
                                                 (|HasCategory| |#3|
                                                                '(|Field|)))
                                             (LETT #8#
                                                   (|HasCategory| |#3|
                                                                  '(|Finite|))
                                                   . #11#)
                                             (OR #8#
                                                 (|HasCategory| |#3|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #10#
                                                 (|HasCategory| |#3|
                                                                '(|OrderedSet|)))
                                             (|HasCategory| |#3|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#3|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #7#
                                                   (|HasCategory| |#3|
                                                                  '(|DifferentialRing|))
                                                   . #11#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #9# #7# #10#
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
                                              #9# #7# #10#
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
                                             (OR #8#
                                                 (|HasCategory| |#3|
                                                                '(|OrderedSet|)))
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (AND #7#
                                                  (|HasCategory| |#3|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (LETT #6#
                                                   (|HasCategory| |#3|
                                                                  '(|AbelianMonoid|))
                                                   . #11#)
                                             (AND #6#
                                                  (|HasCategory| |#3|
                                                                 '(|Monoid|)))
                                             (AND #6#
                                                  (|HasCategory| |#3|
                                                                 '(|SemiRng|)))
                                             (LETT #5#
                                                   (|HasCategory| |#3|
                                                                  '(|AbelianGroup|))
                                                   . #11#)
                                             (OR
                                              (AND #5#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiRng|)))
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (LETT #4#
                                                   (|HasCategory| |#3|
                                                                  '(|CancellationAbelianMonoid|))
                                                   . #11#)
                                             (OR
                                              (AND #5#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiRng|)))
                                              #6# #4#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (OR
                                              (AND #5#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiRng|)))
                                              #4#
                                              (|HasCategory| |#3| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6# #4# #9# #7#
                                              (|HasCategory| |#3| '(|Field|))
                                              #10#
                                              (|HasCategory| |#3| '(|Ring|))
                                              (|HasCategory| |#3|
                                                             '(|SemiRng|)))
                                             (LETT #3#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiGroup|))
                                                   . #11#)
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
                                               #4#)
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
                                               #7#)
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
                                               #8#)
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
                                               #10#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|OrderedSet|)))
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
                                               #3#)
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
                                              (|HasCategory| |#3| '(|Monoid|))
                                              #3#)
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6#
                                              (|HasCategory| |#3|
                                                             '(|BasicType|))
                                              #4# #9# #7#
                                              (|HasCategory| |#3| '(|Field|))
                                              #8#
                                              (|HasCategory| |#3| '(|Monoid|))
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#
                                              (|HasCategory| |#3|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#3| '(|Ring|))
                                              #3#
                                              (|HasCategory| |#3| '(|SemiRng|))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6# #4# #9# #7#
                                              (|HasCategory| |#3| '(|Field|))
                                              #8#
                                              (|HasCategory| |#3| '(|Monoid|))
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#
                                              (|HasCategory| |#3|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#3| '(|Ring|))
                                              #3#
                                              (|HasCategory| |#3| '(|SemiRng|))
                                              (|HasCategory| |#3|
                                                             '(|SetCategory|)))
                                             (OR #6#
                                                 (|HasCategory| |#3|
                                                                '(|SemiRng|)))
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
                                                   . #11#)
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
                                               #4#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #8#)
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
                                               #10#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|OrderedSet|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|)))
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
                                                              '(|SemiRng|)))
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
                                                   . #11#)
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
                                              (AND #5#
                                                   (|HasCategory| |#3|
                                                                  '(|Field|))
                                                   (|HasCategory| |#3|
                                                                  '(|Ring|)))
                                              (AND #5#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiRng|)))
                                              (AND #6#
                                                   (|HasCategory| |#3|
                                                                  '(|Field|)))
                                              (AND #6#
                                                   (|HasCategory| |#3|
                                                                  '(|SemiRng|))))
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
                                               #4#)
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
                                               #7#)
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
                                               #8#)
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
                                               #10#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3|
                                                              '(|OrderedSet|)))
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
                                               #3#)
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3|
                                                              '(|SemiRng|)))
                                              #1#)))
                    . #11#))
    (|haddProp| |$ConstructorCache| '|SplitHomogeneousDirectProduct|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 1125899906842624))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 2251799813685248))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR #6#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianMonoid|))))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR (AND #5# (|HasCategory| |#3| '(|Field|)))
         (AND #5# (|HasCategory| |#3| '(|SemiRng|))) #4#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR (AND #5# (|HasCategory| |#3| '(|Field|)))
         (AND #5# (|HasCategory| |#3| '(|SemiRng|)))
         (|HasCategory| |#3| '(|Ring|))
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 36028797018963968))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      (|HasCategory| |#3| '(|SetCategory|)))
     (|augmentPredVector| $ 72057594037927936))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Vector| |#3|))
    $))) 

(MAKEPROP '|SplitHomogeneousDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (0 . |Zero|) (|Integer|)
              (4 . |qelt|) (10 . +) (|Boolean|) (16 . <) (22 . ~=)
              |SHDP;<;2$B;2| (|NonNegativeInteger|) (|PositiveInteger|)
              (|List| 8) (|List| 22) (|Equation| 8) (|Matrix| 11) (|Matrix| $)
              (|Record| (|:| |mat| 23) (|:| |vec| (|Vector| 11))) (|Vector| $)
              (|Symbol|) (|List| 27) (|List| 18) (|Union| 31 '#1="failed")
              (|Fraction| 11) (|Union| 11 '#1#) (|Union| $ '"failed")
              (|Mapping| 14 8) (|Void|) (|Mapping| 8 8) (|OutputForm|)
              (|CardinalNumber|) (|InputForm|) (|List| $)
              (|Record| (|:| |mat| 42) (|:| |vec| 47)) (|Matrix| 8)
              (|Union| 8 '#1#) (|SingleInteger|) (|String|) (|HashState|)
              (|Vector| 8) (|List| 11))
           '#(|qelt| 28 < 34) 'NIL
           (CONS
            (|makeByteWordVec2| 50
                                '(0 5 8 8 5 11 11 8 16 17 18 20 1 8 20 13 2 12
                                  3 5 2 8 12 2 7 2 2 20 33 7 36 7 8 9 0 35 6 9
                                  14 40 19 0 15 40 37 0 0 39 42 21 0 0 0 0 39
                                  49 4 10 11 14 41 21 50 46))
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
              '#((|DirectProductCategory| 6 8) (|OrderedRing|)
                 (|FullyLinearlyExplicitOver| 8) (|DifferentialExtension| 8)
                 (|CharacteristicZero|) (|CommutativeRing|) (|Algebra| 8)
                 (|LinearlyExplicitOver| 8) (|LinearlyExplicitOver| 11)
                 (|PartialDifferentialRing| 27) (|DifferentialRing|) (|Ring|)
                 (|VectorSpace| 8) (|SemiRing|) (|Rng|) (|Module| 8)
                 (|SemiRng|) (|BiModule| 8 8) (|OrderedAbelianMonoidSup|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|LeftModule| 8) (|RightModule| 8)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|IndexedAggregate| 11 8) (|AbelianMonoid|)
                 (|OrderedSet|) (|MagmaWithUnit|) (|Finite|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|HomogeneousAggregate| 8)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 11 8) (|Evalable| 8) (|SetCategory|)
                 (|FullyRetractableTo| 8) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 8)) (|Eltable| 11 8)
                 (|InnerEvalable| 8 8) (|CoercibleTo| 37) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 39)
                 (|BasicType|) (|RetractableTo| 8) (|RetractableTo| 31)
                 (|RetractableTo| 11))
              (|makeByteWordVec2| 17
                                  '(0 8 0 10 2 0 8 0 11 12 2 8 0 0 0 13 2 8 14
                                    0 0 15 2 8 14 0 0 16 2 0 8 0 11 12 2 4 14 0
                                    0 17)))))
           '|lookupIncomplete|)) 
