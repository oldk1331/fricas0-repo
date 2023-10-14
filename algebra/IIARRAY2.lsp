
(PUT '|IIARRAY2;empty;$;1| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX 0 0))) 

(SDEFUN |IIARRAY2;empty;$;1| (($ $)) (MAKE_MATRIX 0 0)) 

(PUT '|IIARRAY2;qnew;2Nni$;2| '|SPADreplace| 'MAKE_MATRIX) 

(SDEFUN |IIARRAY2;qnew;2Nni$;2|
        ((|rows| . #1=(|NonNegativeInteger|)) (|cols| . #1#) ($ $))
        (MAKE_MATRIX |rows| |cols|)) 

(PUT '|IIARRAY2;new;2NniR$;3| '|SPADreplace| 'MAKE_MATRIX1) 

(SDEFUN |IIARRAY2;new;2NniR$;3|
        ((|rows| . #1=(|NonNegativeInteger|)) (|cols| . #1#) (|a| R) ($ $))
        (MAKE_MATRIX1 |rows| |cols| |a|)) 

(SDEFUN |IIARRAY2;minRowIndex;$I;4| ((|m| $) ($ |Integer|)) (QREFELT $ 7)) 

(SDEFUN |IIARRAY2;minColIndex;$I;5| ((|m| $) ($ |Integer|)) (QREFELT $ 8)) 

(SDEFUN |IIARRAY2;maxRowIndex;$I;6| ((|m| $) ($ |Integer|))
        (- (+ (SPADCALL |m| (QREFELT $ 18)) (QREFELT $ 7)) 1)) 

(SDEFUN |IIARRAY2;maxColIndex;$I;7| ((|m| $) ($ |Integer|))
        (- (+ (SPADCALL |m| (QREFELT $ 20)) (QREFELT $ 8)) 1)) 

(PUT '|IIARRAY2;nrows;$Nni;8| '|SPADreplace| 'ANROWS) 

(SDEFUN |IIARRAY2;nrows;$Nni;8| ((|m| $) ($ |NonNegativeInteger|)) (ANROWS |m|)) 

(PUT '|IIARRAY2;ncols;$Nni;9| '|SPADreplace| 'ANCOLS) 

(SDEFUN |IIARRAY2;ncols;$Nni;9| ((|m| $) ($ |NonNegativeInteger|)) (ANCOLS |m|)) 

(SDEFUN |IIARRAY2;qelt;$2IR;10|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ R))
        (QAREF2O |m| |i| |j| (QREFELT $ 7) (QREFELT $ 8))) 

(SDEFUN |IIARRAY2;elt;$2IR;11|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ R))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT $ 16)))
              (SPADCALL |i| (SPADCALL |m| (QREFELT $ 19)) (QREFELT $ 24)))
          (|error| "elt: index out of range"))
         ((OR (< |j| (SPADCALL |m| (QREFELT $ 17)))
              (SPADCALL |j| (SPADCALL |m| (QREFELT $ 21)) (QREFELT $ 24)))
          (|error| "elt: index out of range"))
         ('T (SPADCALL |m| |i| |j| (QREFELT $ 22))))) 

(SDEFUN |IIARRAY2;qsetelt!;$2I2R;12|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| R) ($ R))
        (QSETAREF2O |m| |i| |j| |r| (QREFELT $ 7) (QREFELT $ 8))) 

(SDEFUN |IIARRAY2;setelt!;$2I2R;13|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| R) ($ R))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT $ 16)))
              (SPADCALL |i| (SPADCALL |m| (QREFELT $ 19)) (QREFELT $ 24)))
          (|error| "setelt!: index out of range"))
         ((OR (< |j| (SPADCALL |m| (QREFELT $ 17)))
              (SPADCALL |j| (SPADCALL |m| (QREFELT $ 21)) (QREFELT $ 24)))
          (|error| "setelt!: index out of range"))
         ('T (SPADCALL |m| |i| |j| |r| (QREFELT $ 26))))) 

(SDEFUN |IIARRAY2;latex;$S;14| ((|m| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (#1=#:G2179 NIL) (|j| NIL) (#2=#:G2178 NIL)
          (|i| NIL) (#3=#:G2177 NIL))
         (SEQ
          (LETT |s| "\\left[ \\begin{array}{" . #4=(|IIARRAY2;latex;$S;14|))
          (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 17)) . #4#)
               (LETT #3# (SPADCALL |m| (QREFELT $ 21)) . #4#) G190
               (COND ((> |j| #3#) (GO G191)))
               (SEQ (EXIT (LETT |s| (STRCONC |s| "c") . #4#)))
               (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |s| (STRCONC |s| "} ") . #4#)
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 16)) . #4#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 19)) . #4#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 17)) . #4#)
                     (LETT #1# (SPADCALL |m| (QREFELT $ 21)) . #4#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (LETT |s|
                            (STRCONC |s|
                                     (SPADCALL
                                      (SPADCALL |m| |i| |j| (QREFELT $ 22))
                                      (QREFELT $ 29)))
                            . #4#)
                      (EXIT
                       (COND
                        ((< |j| (SPADCALL |m| (QREFELT $ 21)))
                         (LETT |s| (STRCONC |s| " & ") . #4#)))))
                     (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((< |i| (SPADCALL |m| (QREFELT $ 19)))
                   (LETT |s| (STRCONC |s| " \\\\ ") . #4#)))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (STRCONC |s| "\\end{array} \\right]"))))) 

(DECLAIM (NOTINLINE |InnerIndexedTwoDimensionalArray;|)) 

(DEFUN |InnerIndexedTwoDimensionalArray| (&REST #1=#:G2186)
  (SPROG NIL
         (PROG (#2=#:G2187)
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
                      (APPLY (|function| |InnerIndexedTwoDimensionalArray;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerIndexedTwoDimensionalArray|)))))))))) 

(DEFUN |InnerIndexedTwoDimensionalArray;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2183 NIL) (#2=#:G2184 NIL) (#3=#:G2185 NIL) ($ NIL)
    (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|InnerIndexedTwoDimensionalArray|))
    (LETT DV$2 (|devaluate| |#2|) . #4#)
    (LETT DV$3 (|devaluate| |#3|) . #4#)
    (LETT DV$4 (|devaluate| |#4|) . #4#)
    (LETT DV$5 (|devaluate| |#5|) . #4#)
    (LETT |dv$|
          (LIST '|InnerIndexedTwoDimensionalArray| DV$1 DV$2 DV$3 DV$4 DV$5)
          . #4#)
    (LETT $ (GETREFV 48) . #4#)
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
      (QSETREFV $ 30 (CONS (|dispatchFunction| |IIARRAY2;latex;$S;14|) $))))
    $))) 

(MAKEPROP '|InnerIndexedTwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) |IIARRAY2;empty;$;1|
              (|NonNegativeInteger|) |IIARRAY2;qnew;2Nni$;2|
              |IIARRAY2;new;2NniR$;3| (|Integer|) |IIARRAY2;minRowIndex;$I;4|
              |IIARRAY2;minColIndex;$I;5| |IIARRAY2;nrows;$Nni;8|
              |IIARRAY2;maxRowIndex;$I;6| |IIARRAY2;ncols;$Nni;9|
              |IIARRAY2;maxColIndex;$I;7| |IIARRAY2;qelt;$2IR;10| (|Boolean|)
              (0 . >) |IIARRAY2;elt;$2IR;11| |IIARRAY2;qsetelt!;$2I2R;12|
              |IIARRAY2;setelt!;$2I2R;13| (|String|) (6 . |latex|)
              (11 . |latex|) (|List| 6) (|Equation| 6) (|List| 32)
              (|Mapping| 23 6) (|OutputForm|) (|HashState|) (|SingleInteger|)
              (|Mapping| 6 6 6) (|Mapping| 6 6) (|List| 43) (|PositiveInteger|)
              (|List| 41) (|List| $) (|List| 45) (|Segment| 15) (|List| 15)
              (|List| 31))
           '#(~= 16 |vertSplit| 22 |vertConcat| 34 |transpose| 45 |swapRows!|
              50 |swapColumns!| 57 |subMatrix| 64 |squareTop| 73 |size?| 78
              |setsubMatrix!| 84 |setelt!| 92 |setRow!| 188 |setColumn!| 195
              |sample| 202 |rowSlice| 206 |row| 211 |qsetelt!| 217 |qnew| 225
              |qelt| 231 |parts| 238 |nrows| 243 |new| 248 |ncols| 255 |more?|
              260 |minRowIndex| 266 |minColIndex| 271 |members| 276 |member?|
              281 |maxRowIndex| 287 |maxColIndex| 292 |map!| 297 |map| 303
              |listOfLists| 324 |less?| 329 |latex| 335 |horizSplit| 340
              |horizConcat| 352 |hashUpdate!| 363 |hash| 369 |fill!| 374
              |every?| 380 |eval| 386 |eq?| 412 |empty?| 418 |empty| 423 |elt|
              427 |count| 519 |copy| 531 |column| 536 |colSlice| 542 |coerce|
              547 |blockSplit| 552 |blockConcat| 566 |any?| 571 = 577 |#| 583)
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
                      (|CoercibleTo| 35))
                   (|makeByteWordVec2| 47
                                       '(2 15 23 0 0 24 1 6 28 0 29 1 0 28 0 30
                                         2 9 23 0 0 1 2 0 43 0 42 1 2 0 43 0 41
                                         1 1 0 0 43 1 2 0 0 0 0 1 1 0 0 0 1 3 0
                                         0 0 15 15 1 3 0 0 0 15 15 1 5 0 0 0 15
                                         15 15 15 1 1 0 0 0 1 2 0 23 0 12 1 4 0
                                         0 0 15 15 0 1 4 0 0 0 44 44 0 1 4 0 0
                                         0 45 44 0 1 4 0 0 0 44 45 0 1 4 0 0 0
                                         46 45 0 1 4 0 0 0 45 46 0 1 4 0 0 0 45
                                         45 0 1 4 0 0 0 46 15 0 1 4 0 0 0 46 46
                                         0 1 4 0 0 0 15 46 0 1 4 0 6 0 15 15 6
                                         27 4 0 0 0 15 44 0 1 4 0 0 0 44 15 0 1
                                         3 0 0 0 15 9 1 3 0 0 0 15 10 1 0 0 0 1
                                         1 0 45 0 1 2 0 9 0 15 1 4 0 6 0 15 15
                                         6 26 2 0 0 12 12 13 3 0 6 0 15 15 22 1
                                         0 31 0 1 1 0 12 0 18 3 0 0 12 12 6 14
                                         1 0 12 0 20 2 0 23 0 12 1 1 0 15 0 16
                                         1 0 15 0 17 1 7 31 0 1 2 8 23 6 0 1 1
                                         0 15 0 19 1 0 15 0 21 2 0 0 39 0 1 3 0
                                         0 38 0 0 1 4 0 0 38 0 0 6 1 2 0 0 39 0
                                         1 1 0 47 0 1 2 0 23 0 12 1 1 1 28 0 30
                                         2 0 43 0 42 1 2 0 43 0 41 1 1 0 0 43 1
                                         2 0 0 0 0 1 2 1 36 36 0 1 1 1 37 0 1 2
                                         0 0 0 6 1 2 7 23 34 0 1 3 2 0 0 6 6 1
                                         3 2 0 0 31 31 1 2 2 0 0 32 1 2 2 0 0
                                         33 1 2 0 23 0 0 1 1 0 23 0 1 0 0 0 11
                                         3 0 0 0 44 45 1 3 0 0 0 44 44 1 3 0 0
                                         0 45 44 1 3 0 0 0 44 15 1 3 0 0 0 45
                                         46 1 3 0 0 0 15 44 1 3 0 0 0 46 45 1 3
                                         0 0 0 46 46 1 3 0 0 0 45 45 1 3 0 0 0
                                         15 46 1 3 0 0 0 46 15 1 4 0 6 0 15 15
                                         6 1 3 0 6 0 15 15 25 2 8 12 6 0 1 2 7
                                         12 34 0 1 1 0 0 0 1 2 0 10 0 15 1 1 0
                                         45 0 1 1 5 35 0 1 3 0 40 0 41 41 1 3 0
                                         40 0 42 42 1 1 0 0 40 1 2 7 23 34 0 1
                                         2 9 23 0 0 1 1 7 12 0 1)))))
           '|lookupComplete|)) 
