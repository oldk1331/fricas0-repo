
(DECLAIM (NOTINLINE |IndexedVector;|)) 

(DEFUN |IndexedVector| (&REST #1=#:G1265)
  (SPROG NIL
         (PROG (#2=#:G1266)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedVector|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedVector;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedVector|)))))))))) 

(DEFUN |IndexedVector;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G1262 NIL) (#2=#:G1263 NIL) (#3=#:G1264 NIL) (% NIL)
    (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|IndexedVector| DV$1 DV$2))
    (LETT % (GETREFV 29))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #3#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1# #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (|HasCategory| |#1|
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiGroup|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1| '(|SemiRng|)))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RadicalCategory|))
                                         (|HasCategory| |#1| '(|Ring|)))))))
    (|haddProp| |$ConstructorCache| '|IndexedVector| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1048576))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2097152))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4194304))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 8388608))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 16777216))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 33554432))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 67108864))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|)))
         #2#)
     (|augmentPredVector| % 134217728))
    (AND
     (OR #1# (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 268435456))
    (AND (|HasCategory| |#1| '(|Hashable|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 536870912))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND #3# (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|Hashable|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| % '(|finiteAggregate|)))
      #2#)
     (|augmentPredVector| % 1073741824))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|IndexedVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|IndexedOneDimensionalArray| 6 (NRTEVAL (QREFELT % 7)))
              (|local| |#1|) (|local| |#2|) (|Mapping| 11 6 6) (|Integer|)
              (|Mapping| 6 6 6) (|Boolean|) (|NonNegativeInteger|)
              (|HashState|) (|SingleInteger|) (|List| 6) (|Equation| 6)
              (|List| 16) (|OutputForm|) (|String|) (|Mapping| 11 6)
              (|UniversalSegment| 9) (|Void|) (|Mapping| 6 6) (|InputForm|)
              (|Matrix| 6) (|List| %) (|Union| 6 '"failed") (|List| 9))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 1 0 7 0 0 9 10 2 0 0 0 0 0 9 13 1
                                  11 3))
            (CONS
             '#(|VectorCategory&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| |Hashable&| NIL
                NIL NIL NIL NIL |InnerEvalable&| NIL |PartialOrder&|
                |BasicType&| NIL)
             (CONS
              '#((|VectorCategory| 6) (|OneDimensionalArrayAggregate| 6)
                 (|FiniteLinearAggregate| 6) (|LinearAggregate| 6)
                 (|IndexedAggregate| 9 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 9 6) (|Evalable| 6) (|SetCategory|)
                 (|Hashable|) (|shallowlyMutable|) (|finiteAggregate|)
                 (|Eltable| 21 $$) (|Type|) (|Eltable| 9 6)
                 (|InnerEvalable| 6 6) (|CoercibleTo| 18) (|PartialOrder|)
                 (|BasicType|) (|ConvertibleTo| 24))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
