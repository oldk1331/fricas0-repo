
(PUT '|ARRAY2;qelt;$2IR;1| '|SPADreplace|
     '(XLAM (|m| |i| |j|) (QAREF2O |m| |i| |j| 1 1))) 

(SDEFUN |ARRAY2;qelt;$2IR;1| ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ R))
        (QAREF2O |m| |i| |j| 1 1)) 

(PUT '|ARRAY2;qsetelt!;$2I2R;2| '|SPADreplace|
     '(XLAM (|m| |i| |j| |r|) (QSETAREF2O |m| |i| |j| |r| 1 1))) 

(SDEFUN |ARRAY2;qsetelt!;$2I2R;2|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| R) ($ R))
        (QSETAREF2O |m| |i| |j| |r| 1 1)) 

(DECLAIM (NOTINLINE |TwoDimensionalArray;|)) 

(DEFUN |TwoDimensionalArray| (#1=#:G2230)
  (SPROG NIL
         (PROG (#2=#:G2231)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TwoDimensionalArray|)
                                               '|domainEqualList|)
                    . #3=(|TwoDimensionalArray|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TwoDimensionalArray;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TwoDimensionalArray|)))))))))) 

(DEFUN |TwoDimensionalArray;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2227 NIL) (#2=#:G2228 NIL) (#3=#:G2229 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|TwoDimensionalArray|))
    (LETT |dv$| (LIST '|TwoDimensionalArray| DV$1) . #4#)
    (LETT $ (GETREFV 31) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #4#)
                                        (OR #2# #3#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #3#))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|TwoDimensionalArray| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 64))
    (AND #2# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 128))
    (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
         (|augmentPredVector| $ 256))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|TwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 (NRTEVAL 1) (NRTEVAL 1) 29
                                                 29)
              (|local| |#1|) (|Integer|) |ARRAY2;qelt;$2IR;1|
              |ARRAY2;qsetelt!;$2I2R;2| (|NonNegativeInteger|) (|Boolean|)
              (|List| 6) (|List| 14) (|Equation| 6) (|Mapping| 11 6)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|)
              (|Mapping| 6 6 6) (|List| 24) (|List| 25) (|Mapping| 6 6)
              (|List| $) (|PositiveInteger|) (|List| 28) (|List| 7)
              (|Segment| 7) (|OneDimensionalArray| 6) (|List| 12))
           '#(|qsetelt!| 0 |qelt| 8) 'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(|TwoDimensionalArrayCategory&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL)
                  (CONS
                   '#((|TwoDimensionalArrayCategory| 6
                                                     (|OneDimensionalArray| 6)
                                                     (|OneDimensionalArray| 6))
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 16))
                   (|makeByteWordVec2| 9 '(4 0 6 0 7 7 6 9 3 0 6 0 7 7 8)))))
           '|lookupIncomplete|)) 
