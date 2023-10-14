
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |SortedExponentVector;|)) 

(DEFUN |SortedExponentVector| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2624)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|SortedExponentVector|)
                . #2=(|SortedExponentVector|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|SortedExponentVector|
                         (LIST (CONS NIL (CONS 1 (|SortedExponentVector;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|SortedExponentVector|))))))))))) 

(DEFUN |SortedExponentVector;| ()
  (PROG (|dv$| $ #1=#:G2620 #2=#:G2621 #3=#:G2619 #4=#:G2618 |pv$| #5=#:G2622)
    (RETURN
     (PROGN
      (LETT |dv$| '(|SortedExponentVector|) . #6=(|SortedExponentVector|))
      (LETT $ (GETREFV 25) . #6#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #1#
                                                (|HasCategory| (|Integer|)
                                                               '(|SetCategory|))
                                                . #6#)
                                          (OR
                                           (|HasCategory| (|Integer|)
                                                          '(|OrderedSet|))
                                           #1#)
                                          (LETT #2#
                                                (AND
                                                 (|HasCategory| (|Integer|)
                                                                '(|Evalable|
                                                                  (|Integer|)))
                                                 (|HasCategory| (|Integer|)
                                                                '(|SetCategory|)))
                                                . #6#)
                                          (OR
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|Evalable|
                                                             (|Integer|)))
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|)))
                                           #2#)
                                          (LETT #3#
                                                (|HasCategory| (|Integer|)
                                                               '(|BasicType|))
                                                . #6#)
                                          (OR #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|))
                                              #1#)
                                          (LETT #4#
                                                (|HasCategory| (|Integer|)
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #6#)
                                          (OR #4# #2#)))
                      . #6#))
      (|haddProp| |$ConstructorCache| '|SortedExponentVector| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (LETT #5# (|HasCategory| $ '(|finiteAggregate|)) . #6#)
           (|augmentPredVector| $ 1024))
      (AND #5# #1# (|augmentPredVector| $ 2048))
      (AND #5# #3# (|augmentPredVector| $ 4096))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 8192))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|HasCategory| (|Integer|) '(|OrderedSet|))
           (|augmentPredVector| $ 16384))
      (AND (OR (AND #5# #3#) #1#) (|augmentPredVector| $ 32768))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SortedExponentVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|U32Vector|) (|Integer|) (|List| 6)
              (|Equation| 6) (|List| 8) (|Mapping| 6 6 6) (|Boolean|)
              (|NonNegativeInteger|) (|OutputForm|) (|InputForm|) (|HashState|)
              (|SingleInteger|) (|String|) (|Mapping| 11 6) (|Mapping| 11 6 6)
              (|UniversalSegment| 6) (|Void|) (|Mapping| 6 6) (|List| $)
              (|Union| 6 '"failed"))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 10
                                '(0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 8 10 2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| |FiniteLinearAggregate&|
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL |BasicType&| NIL |PartialOrder&|)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|IndexedAggregate| 6 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 6 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 6 6)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 14) (|BasicType|)
                 (|CoercibleTo| 13) (|PartialOrder|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 

(MAKEPROP '|SortedExponentVector| 'NILADIC T) 
