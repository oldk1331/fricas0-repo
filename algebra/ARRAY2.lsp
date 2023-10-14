
(/VERSIONCHECK 2) 

(PUT '|ARRAY2;qelt;$2IR;1| '|SPADreplace|
     '(XLAM (|m| |i| |j|) (QAREF2O |m| |i| |j| 1 1))) 

(DEFUN |ARRAY2;qelt;$2IR;1| (|m| |i| |j| $) (QAREF2O |m| |i| |j| 1 1)) 

(PUT '|ARRAY2;qsetelt!;$2I2R;2| '|SPADreplace|
     '(XLAM (|m| |i| |j| |r|) (QSETAREF2O |m| |i| |j| |r| 1 1))) 

(DEFUN |ARRAY2;qsetelt!;$2I2R;2| (|m| |i| |j| |r| $)
  (QSETAREF2O |m| |i| |j| |r| 1 1)) 

(DEFUN |TwoDimensionalArray| (#1=#:G2197)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2198)
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
              (HREM |$ConstructorCache| '|TwoDimensionalArray|))))))))))) 

(DEFUN |TwoDimensionalArray;| (|#1|)
  (PROG (|pv$| #1=#:G2195 #2=#:G2196 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|TwoDimensionalArray|))
      (LETT |dv$| (LIST '|TwoDimensionalArray| DV$1) . #3#)
      (LETT $ (GETREFV 22) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #2#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #3#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #2#))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|TwoDimensionalArray| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 16))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 32))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 (NRTEVAL 1) (NRTEVAL 1) 21
                                                 21)
              (|local| |#1|) (|Integer|) |ARRAY2;qelt;$2IR;1|
              |ARRAY2;qsetelt!;$2I2R;2| (|Boolean|) (|NonNegativeInteger|)
              (|List| 6) (|Equation| 6) (|List| 13) (|Mapping| 10 6)
              (|OutputForm|) (|SingleInteger|) (|String|) (|Mapping| 6 6 6)
              (|Mapping| 6 6) (|OneDimensionalArray| 6))
           '#(|qsetelt!| 0 |qelt| 8) 'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 2 1 0 0 0 2 1 4))
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
