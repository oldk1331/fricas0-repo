
(DECLAIM (NOTINLINE |HyperdocAssociationList;|)) 

(DEFUN |HyperdocAssociationList;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G86 NIL) (#2=#:G85 NIL) (#3=#:G84 NIL)
    (|pv$| NIL) (#4=#:G88 NIL) (#5=#:G89 NIL) (#6=#:G87 NIL))
   (PROGN
    (LETT |dv$| '(|HyperdocAssociationList|))
    (LETT % (GETREFV 31))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|Symbol|))
                                                   (|:| |entry|
                                                        (|SExpression|)))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|Symbol|))
                                                   (|:| |entry|
                                                        (|SExpression|)))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|Symbol|))
                                                   (|:| |entry|
                                                        (|SExpression|)))
                                         '(|Hashable|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|Symbol|))
                                                   (|:| |entry|
                                                        (|SExpression|)))
                                         '(|OpenMath|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|Symbol|))
                                                         (|:| |entry|
                                                              (|SExpression|)))
                                               '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory|
                                             (|Record| (|:| |key| (|Symbol|))
                                                       (|:| |entry|
                                                            (|SExpression|)))
                                             '(|OrderedSet|)))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|Symbol|))
                                                   (|:| |entry|
                                                        (|SExpression|)))
                                         '(|CoercibleTo| (|OutputForm|)))
                                        (LETT #2#
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|Symbol|))
                                                         (|:| |entry|
                                                              (|SExpression|)))
                                               '(|SetCategory|)))
                                        (AND
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|Symbol|))
                                                    (|:| |entry|
                                                         (|SExpression|)))
                                          '(|Evalable|
                                            (|Record| (|:| |key| (|Symbol|))
                                                      (|:| |entry|
                                                           (|SExpression|)))))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory|
                                             (|Record| (|:| |key| (|Symbol|))
                                                       (|:| |entry|
                                                            (|SExpression|)))
                                             '(|OrderedSet|))
                                            #2#)
                                        (OR
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|Symbol|))
                                                    (|:| |entry|
                                                         (|SExpression|)))
                                          '(|CoercibleTo| (|OutputForm|)))
                                         #1#
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|Symbol|))
                                                    (|:| |entry|
                                                         (|SExpression|)))
                                          '(|OrderedSet|))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|Symbol|))
                                                         (|:| |entry|
                                                              (|SExpression|)))
                                               '(|BasicType|)))
                                        (OR #3# #1#
                                            (|HasCategory|
                                             (|Record| (|:| |key| (|Symbol|))
                                                       (|:| |entry|
                                                            (|SExpression|)))
                                             '(|Hashable|))
                                            (|HasCategory|
                                             (|Record| (|:| |key| (|Symbol|))
                                                       (|:| |entry|
                                                            (|SExpression|)))
                                             '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|HyperdocAssociationList| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (LETT #4# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 16384))
    (AND
     (LETT #5#
           (AND (|HasCategory| % '(|finiteAggregate|))
                (|HasCategory|
                 (|Record| (|:| |key| (|Symbol|))
                           (|:| |entry| (|SExpression|)))
                 '(|OrderedSet|))))
     (|augmentPredVector| % 32768))
    (AND
     (OR (AND #4# #1#) #5#
         (|HasCategory|
          (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
          '(|CoercibleTo| (|OutputForm|))))
     (|augmentPredVector| % 65536))
    (AND (OR (AND #4# #1#) #5# #2#) (|augmentPredVector| % 131072))
    (AND (OR (AND #4# #1#) #5#) (|augmentPredVector| % 262144))
    (AND #4# #3# (|augmentPredVector| % 524288))
    (AND (LETT #6# (|HasCategory| % '(|shallowlyMutable|)))
         (|augmentPredVector| % 1048576))
    (AND #4# #6#
         (|HasCategory|
          (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
          '(|OrderedSet|))
         (|augmentPredVector| % 2097152))
    (AND #4# #6# (|augmentPredVector| % 4194304))
    (AND
     (OR (AND #4# #3#) (AND #4# #1#) #5#
         (|HasCategory|
          (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
          '(|Hashable|))
         #2#)
     (|augmentPredVector| % 8388608))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |HyperdocAssociationList| ()
  (SPROG NIL
         (PROG (#1=#:G91)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HyperdocAssociationList|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HyperdocAssociationList|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|HyperdocAssociationList;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|HyperdocAssociationList|)))))))))) 

(MAKEPROP '|HyperdocAssociationList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 8) (|Boolean|) (|NonNegativeInteger|)
              (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
              (|Mapping| 8 8) (|List| %) '"value" (|Integer|) '"first" '"rest"
              '"last" (|UniversalSegment| 12) (|Mapping| 8 8 8)
              (|Union| 8 '"failed") (|Mapping| 6 8) (|List| 12)
              (|Mapping| 6 8 8) (|List| 23) (|Equation| 8) (|OutputForm|)
              (|String|) (|Void|) (|InputForm|) (|SingleInteger|) (|HashState|)
              (|OpenMathDevice|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 0 0 0 0 1 0 0 0 6 0 3 10 9 0 0 4 14 2 1
                                  11 9 0 0 0 0 0))
            (CONS
             '#(|ListAggregate&| NIL |ExtensibleLinearAggregate&|
                |StreamAggregate&| |LinearAggregate&|
                |UnaryRecursiveAggregate&| |OrderedSet&| |Collection&|
                |IndexedAggregate&| |RecursiveAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| |OpenMath&| |BasicType&| NIL
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|ListAggregate| 8) (|FiniteLinearAggregate| 8)
                 (|ExtensibleLinearAggregate| 8) (|StreamAggregate| 8)
                 (|LinearAggregate| 8) (|UnaryRecursiveAggregate| 8)
                 (|OrderedSet|) (|Collection| 8) (|IndexedAggregate| 12 8)
                 (|RecursiveAggregate| 8) (|Comparable|)
                 (|HomogeneousAggregate| 8) (|Hashable|) (|SetCategory|)
                 (|Evalable| 8) (|EltableAggregate| 12 8) (|Aggregate|)
                 (|OpenMath|) (|BasicType|) (|ConvertibleTo| 27)
                 (|PartialOrder|) (|CoercibleTo| 24) (|InnerEvalable| 8 8)
                 (|Eltable| 12 8) (|Type|) (|Eltable| 16 $$)
                 (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
