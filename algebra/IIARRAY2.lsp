
(/VERSIONCHECK 2) 

(PUT '|IIARRAY2;empty;$;1| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX 0 0))) 

(DEFUN |IIARRAY2;empty;$;1| ($) (MAKE_MATRIX 0 0)) 

(PUT '|IIARRAY2;new;2NniR$;2| '|SPADreplace| 'MAKE_MATRIX1) 

(DEFUN |IIARRAY2;new;2NniR$;2| (|rows| |cols| |a| $)
  (MAKE_MATRIX1 |rows| |cols| |a|)) 

(DEFUN |IIARRAY2;minRowIndex;$I;3| (|m| $) (QREFELT $ 7)) 

(DEFUN |IIARRAY2;minColIndex;$I;4| (|m| $) (QREFELT $ 8)) 

(DEFUN |IIARRAY2;maxRowIndex;$I;5| (|m| $)
  (- (+ (SPADCALL |m| (QREFELT $ 17)) (QREFELT $ 7)) 1)) 

(DEFUN |IIARRAY2;maxColIndex;$I;6| (|m| $)
  (- (+ (SPADCALL |m| (QREFELT $ 19)) (QREFELT $ 8)) 1)) 

(PUT '|IIARRAY2;nrows;$Nni;7| '|SPADreplace| 'ANROWS) 

(DEFUN |IIARRAY2;nrows;$Nni;7| (|m| $) (ANROWS |m|)) 

(PUT '|IIARRAY2;ncols;$Nni;8| '|SPADreplace| 'ANCOLS) 

(DEFUN |IIARRAY2;ncols;$Nni;8| (|m| $) (ANCOLS |m|)) 

(DEFUN |IIARRAY2;qelt;$2IR;9| (|m| |i| |j| $)
  (QAREF2O |m| |i| |j| (QREFELT $ 7) (QREFELT $ 8))) 

(DEFUN |IIARRAY2;elt;$2IR;10| (|m| |i| |j| $)
  (COND
   ((OR (< |i| (SPADCALL |m| (QREFELT $ 15)))
        (SPADCALL |i| (SPADCALL |m| (QREFELT $ 18)) (QREFELT $ 23)))
    (|error| "elt: index out of range"))
   ((OR (< |j| (SPADCALL |m| (QREFELT $ 16)))
        (SPADCALL |j| (SPADCALL |m| (QREFELT $ 20)) (QREFELT $ 23)))
    (|error| "elt: index out of range"))
   ('T (SPADCALL |m| |i| |j| (QREFELT $ 21))))) 

(DEFUN |IIARRAY2;qsetelt!;$2I2R;11| (|m| |i| |j| |r| $)
  (QSETAREF2O |m| |i| |j| |r| (QREFELT $ 7) (QREFELT $ 8))) 

(DEFUN |IIARRAY2;setelt;$2I2R;12| (|m| |i| |j| |r| $)
  (COND
   ((OR (< |i| (SPADCALL |m| (QREFELT $ 15)))
        (SPADCALL |i| (SPADCALL |m| (QREFELT $ 18)) (QREFELT $ 23)))
    (|error| "setelt: index out of range"))
   ((OR (< |j| (SPADCALL |m| (QREFELT $ 16)))
        (SPADCALL |j| (SPADCALL |m| (QREFELT $ 20)) (QREFELT $ 23)))
    (|error| "setelt: index out of range"))
   ('T (SPADCALL |m| |i| |j| |r| (QREFELT $ 25))))) 

(DEFUN |IIARRAY2;latex;$S;13| (|m| $)
  (PROG (|s| #1=#:G2212 |j| #2=#:G2211 |i| #3=#:G2210)
    (RETURN
     (SEQ (LETT |s| "\\left[ \\begin{array}{" . #4=(|IIARRAY2;latex;$S;13|))
          (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 16)) . #4#)
               (LETT #3# (SPADCALL |m| (QREFELT $ 20)) . #4#) G190
               (COND ((> |j| #3#) (GO G191)))
               (SEQ (EXIT (LETT |s| (STRCONC |s| "c") . #4#)))
               (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |s| (STRCONC |s| "} ") . #4#)
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 15)) . #4#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 18)) . #4#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 16)) . #4#)
                     (LETT #1# (SPADCALL |m| (QREFELT $ 20)) . #4#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (LETT |s|
                            (STRCONC |s|
                                     (SPADCALL
                                      (SPADCALL |m| |i| |j| (QREFELT $ 21))
                                      (QREFELT $ 28)))
                            . #4#)
                      (EXIT
                       (COND
                        ((< |j| (SPADCALL |m| (QREFELT $ 20)))
                         (LETT |s| (STRCONC |s| " & ") . #4#)))))
                     (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((< |i| (SPADCALL |m| (QREFELT $ 18)))
                   (LETT |s| (STRCONC |s| " \\\\ ") . #4#)))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (STRCONC |s| "\\end{array} \\right]")))))) 

(DECLAIM (NOTINLINE |InnerIndexedTwoDimensionalArray;|)) 

(DEFUN |InnerIndexedTwoDimensionalArray| (&REST #1=#:G2219)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2220)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InnerIndexedTwoDimensionalArray|)
                                           '|domainEqualList|)
                . #3=(|InnerIndexedTwoDimensionalArray|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |InnerIndexedTwoDimensionalArray;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|InnerIndexedTwoDimensionalArray|))))))))))) 

(DEFUN |InnerIndexedTwoDimensionalArray;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| #1=#:G2216 #2=#:G2217 #3=#:G2218 $ |dv$| DV$5 DV$4 DV$3 DV$2
         DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|InnerIndexedTwoDimensionalArray|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT DV$3 (|devaluate| |#3|) . #4#)
      (LETT DV$4 (|devaluate| |#4|) . #4#)
      (LETT DV$5 (|devaluate| |#5|) . #4#)
      (LETT |dv$|
            (LIST '|InnerIndexedTwoDimensionalArray| DV$1 DV$2 DV$3 DV$4 DV$5)
            . #4#)
      (LETT $ (GETREFV 39) . #4#)
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
      (|haddProp| |$ConstructorCache| '|InnerIndexedTwoDimensionalArray|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 64))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 128))
      (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
           (|augmentPredVector| $ 256))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 29 (CONS (|dispatchFunction| |IIARRAY2;latex;$S;13|) $))))
      $)))) 

(MAKEPROP '|InnerIndexedTwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) |IIARRAY2;empty;$;1|
              (|NonNegativeInteger|) |IIARRAY2;new;2NniR$;2| (|Integer|)
              |IIARRAY2;minRowIndex;$I;3| |IIARRAY2;minColIndex;$I;4|
              |IIARRAY2;nrows;$Nni;7| |IIARRAY2;maxRowIndex;$I;5|
              |IIARRAY2;ncols;$Nni;8| |IIARRAY2;maxColIndex;$I;6|
              |IIARRAY2;qelt;$2IR;9| (|Boolean|) (0 . >) |IIARRAY2;elt;$2IR;10|
              |IIARRAY2;qsetelt!;$2I2R;11| |IIARRAY2;setelt;$2I2R;12|
              (|String|) (6 . |latex|) (11 . |latex|) (|List| 6) (|Equation| 6)
              (|List| 31) (|Mapping| 22 6) (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|Mapping| 6 6 6) (|Mapping| 6 6))
           '#(~= 16 |size?| 22 |setelt| 28 |setRow!| 36 |setColumn!| 43
              |sample| 50 |row| 54 |qsetelt!| 60 |qelt| 68 |parts| 75 |nrows|
              80 |new| 85 |ncols| 92 |more?| 97 |minRowIndex| 103 |minColIndex|
              108 |members| 113 |member?| 118 |maxRowIndex| 124 |maxColIndex|
              129 |map!| 134 |map| 140 |less?| 161 |latex| 167 |hashUpdate!|
              172 |hash| 178 |fill!| 183 |every?| 189 |eval| 195 |eq?| 221
              |empty?| 227 |empty| 232 |elt| 236 |count| 251 |copy| 263
              |column| 268 |coerce| 274 |any?| 279 = 285 |#| 291)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(|TwoDimensionalArrayCategory&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL)
                  (CONS
                   '#((|TwoDimensionalArrayCategory| 6 9 10)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 34))
                   (|makeByteWordVec2| 38
                                       '(2 14 22 0 0 23 1 6 27 0 28 1 0 27 0 29
                                         2 9 22 0 0 1 2 0 22 0 12 1 4 0 6 0 14
                                         14 6 26 3 0 0 0 14 9 1 3 0 0 0 14 10 1
                                         0 0 0 1 2 0 9 0 14 1 4 0 6 0 14 14 6
                                         25 3 0 6 0 14 14 21 1 0 30 0 1 1 0 12
                                         0 17 3 0 0 12 12 6 13 1 0 12 0 19 2 0
                                         22 0 12 1 1 0 14 0 15 1 0 14 0 16 1 7
                                         30 0 1 2 8 22 6 0 1 1 0 14 0 18 1 0 14
                                         0 20 2 0 0 38 0 1 3 0 0 37 0 0 1 4 0 0
                                         37 0 0 6 1 2 0 0 38 0 1 2 0 22 0 12 1
                                         1 1 27 0 29 2 1 35 35 0 1 1 1 36 0 1 2
                                         0 0 0 6 1 2 7 22 33 0 1 3 2 0 0 6 6 1
                                         3 2 0 0 30 30 1 2 2 0 0 31 1 2 2 0 0
                                         32 1 2 0 22 0 0 1 1 0 22 0 1 0 0 0 11
                                         4 0 6 0 14 14 6 1 3 0 6 0 14 14 24 2 8
                                         12 6 0 1 2 7 12 33 0 1 1 0 0 0 1 2 0
                                         10 0 14 1 1 5 34 0 1 2 7 22 33 0 1 2 9
                                         22 0 0 1 1 7 12 0 1)))))
           '|lookupComplete|)) 
