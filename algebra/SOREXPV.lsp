
(/VERSIONCHECK 2) 

(DEFUN |SortedExponentVector| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2560)
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
  (PROG (|dv$| $ #1=#:G2556 #2=#:G2557 #3=#:G2555 |pv$| #4=#:G2558)
    (RETURN
     (PROGN
      (LETT |dv$| '(|SortedExponentVector|) . #5=(|SortedExponentVector|))
      (LETT $ (GETREFV 24) . #5#)
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
                                                . #5#)
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
                                                . #5#)
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
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #5#)
                                          (OR #3# #2#)))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|SortedExponentVector| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
           (|augmentPredVector| $ 256))
      (AND #4# #1# (|augmentPredVector| $ 512))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 1024))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|HasCategory| (|Integer|) '(|OrderedSet|))
           (|augmentPredVector| $ 2048))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SortedExponentVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|U32Vector|) (|List| 8) (|Equation| 8)
              (|Integer|) (|List| 7) (|Mapping| 8 8 8) (|Boolean|)
              (|NonNegativeInteger|) (|OutputForm|) (|InputForm|) (|String|)
              (|SingleInteger|) (|Mapping| 11 8) (|Mapping| 11 8 8)
              (|UniversalSegment| 8) (|Void|) (|Mapping| 8 8) (|List| $)
              (|Union| 8 '"failed"))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 8 '(0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 4 8 2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| |FiniteLinearAggregate&|
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL |BasicType&| NIL |PartialOrder&|)
             (CONS
              '#((|OneDimensionalArrayAggregate| 8) (|FiniteLinearAggregate| 8)
                 (|LinearAggregate| 8) (|IndexedAggregate| 8 8)
                 (|Collection| 8) (|OrderedSet|) (|HomogeneousAggregate| 8)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 8 8)
                 (|Evalable| 8) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 8 8)
                 (|InnerEvalable| 8 8) (|ConvertibleTo| 14) (|BasicType|)
                 (|CoercibleTo| 13) (|PartialOrder|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 

(MAKEPROP '|SortedExponentVector| 'NILADIC T) 
