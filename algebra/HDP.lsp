
(/VERSIONCHECK 2) 

(DEFUN |HDP;<;2$B;1| (|v1| |v2| $)
  (PROG (#1=#:G136 |i| |n2| |n1| #2=#:G137)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |n1| (|spadConstant| $ 9) . #3=(|HDP;<;2$B;1|))
            (LETT |n2| (|spadConstant| $ 9) . #3#)
            (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |n1|
                        (SPADCALL |n1| (SPADCALL |v1| |i| (QREFELT $ 11))
                                  (QREFELT $ 12))
                        . #3#)
                  (EXIT
                   (LETT |n2|
                         (SPADCALL |n2| (SPADCALL |v2| |i| (QREFELT $ 11))
                                   (QREFELT $ 12))
                         . #3#)))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND ((SPADCALL |n1| |n2| (QREFELT $ 14)) 'T)
                   ((SPADCALL |n2| |n1| (QREFELT $ 14)) 'NIL)
                   ('T
                    (SEQ
                     (SEQ (LETT |i| (QREFELT $ 6) . #3#) G190
                          (COND ((< |i| 1) (GO G191)))
                          (SEQ
                           (COND
                            ((SPADCALL (SPADCALL |v2| |i| (QREFELT $ 11))
                                       (SPADCALL |v1| |i| (QREFELT $ 11))
                                       (QREFELT $ 14))
                             (PROGN (LETT #1# 'T . #3#) (GO #1#))))
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |v1| |i| (QREFELT $ 11))
                                        (SPADCALL |v2| |i| (QREFELT $ 11))
                                        (QREFELT $ 14))
                              (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
                          (LETT |i| (+ |i| -1) . #3#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT 'NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |HomogeneousDirectProduct| (&REST #1=#:G160)
  (PROG ()
    (RETURN
     (PROG (#2=#:G161)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|HomogeneousDirectProduct|)
                                           '|domainEqualList|)
                . #3=(|HomogeneousDirectProduct|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |HomogeneousDirectProduct;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|HomogeneousDirectProduct|))))))))))) 

(DEFUN |HomogeneousDirectProduct;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G154 #2=#:G155 #3=#:G156 #4=#:G157 #5=#:G158 #6=#:G159 $
         |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #7=(|HomogeneousDirectProduct|))
      (LETT DV$2 (|devaluate| |#2|) . #7#)
      (LETT |dv$| (LIST '|HomogeneousDirectProduct| DV$1 DV$2) . #7#)
      (LETT $ (GETREFV 47) . #7#)
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
                                                #5# #4#
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #5# #4#
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
      (|haddProp| |$ConstructorCache| '|HomogeneousDirectProduct|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
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
      (QSETREFV $ 8 (|Vector| |#2|))
      $)))) 

(MAKEPROP '|HomogeneousDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 6 7) (|local| |#1|)
              (|local| |#2|) '|Rep| (0 . |Zero|) (|Integer|) (4 . |qelt|)
              (10 . +) (|Boolean|) (16 . <) |HDP;<;2$B;1|
              (|NonNegativeInteger|) (|List| 7) (|Equation| 7) (|List| 18)
              (|Record| (|:| |mat| 23) (|:| |vec| (|Vector| 10))) (|Matrix| $)
              (|Vector| $) (|Matrix| 10) (|Symbol|) (|List| 24) (|List| 16)
              (|Union| 28 '#1="failed") (|Fraction| 10) (|Union| 10 '#1#)
              (|Union| $ '"failed") (|Mapping| 13 7) (|Void|) (|Mapping| 7 7)
              (|PositiveInteger|) (|OutputForm|) (|CardinalNumber|)
              (|InputForm|) (|List| $) (|Matrix| 7)
              (|Record| (|:| |mat| 39) (|:| |vec| 45)) (|Union| 7 '#1#)
              (|HashState|) (|SingleInteger|) (|String|) (|Vector| 7)
              (|List| 10))
           '#(|qelt| 22 < 28) 'NIL
           (CONS
            (|makeByteWordVec2| 39
                                '(0 1 8 2 2 10 4 8 2 13 14 15 9 3 4 8 17 9 2 5
                                  11 8 17 5 17 5 2 16 0 5 2 6 16 0 5 6 12 32 0
                                  0 29 31 18 0 0 0 0 29 38 5 7 8 12 30 18 39
                                  35))
            (CONS
             '#(|DirectProductCategory&| |VectorSpace&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Module&| |OrderedRing&| NIL NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL |IndexedAggregate&|
                |OrderedSet&| NIL |Monoid&| |AbelianMonoid&|
                |HomogeneousAggregate&| NIL |SemiGroup&| |Finite&|
                |AbelianSemiGroup&| |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| |FullyRetractableTo&| NIL NIL NIL
                NIL |InnerEvalable&| NIL |PartialOrder&| NIL NIL NIL
                |BasicType&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 7) (|VectorSpace| 7) (|Algebra| 7)
                 (|FullyLinearlyExplicitRingOver| 7)
                 (|DifferentialExtension| 7) (|Module| 7) (|OrderedRing|)
                 (|CommutativeRing|) (|LinearlyExplicitRingOver| 7)
                 (|LinearlyExplicitRingOver| 10) (|PartialDifferentialRing| 24)
                 (|DifferentialRing|) (|BiModule| 7 7)
                 (|OrderedAbelianMonoidSup|) (|OrderedAbelianGroup|)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 7) (|RightModule| 7)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|IndexedAggregate| 10 7)
                 (|OrderedSet|) (|SemiRng|) (|Monoid|) (|AbelianMonoid|)
                 (|HomogeneousAggregate| 7) (|Comparable|) (|SemiGroup|)
                 (|Finite|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 10 7) (|Evalable| 7) (|SetCategory|)
                 (|FullyRetractableTo| 7) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 7)) (|Eltable| 10 7)
                 (|InnerEvalable| 7 7) (|CoercibleTo| 35) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 37)
                 (|BasicType|) (|RetractableTo| 7) (|RetractableTo| 28)
                 (|RetractableTo| 10))
              (|makeByteWordVec2| 15
                                  '(0 7 0 9 2 0 7 0 10 11 2 7 0 0 0 12 2 7 13 0
                                    0 14 2 0 7 0 10 11 2 5 13 0 0 15)))))
           '|lookupIncomplete|)) 
