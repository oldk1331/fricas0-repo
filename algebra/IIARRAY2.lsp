
(/VERSIONCHECK 2) 

(DEFUN |IIARRAY2;empty?;$B;1| (|m| $) (SPADCALL |m| (QREFELT $ 13))) 

(PUT '|IIARRAY2;empty;$;2| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(DEFUN |IIARRAY2;empty;$;2| ($) (MAKE-ARRAY 0)) 

(DEFUN |IIARRAY2;new;2NniR$;3| (|rows| |cols| |a| $)
  (PROG (#1=#:G2151 |i| |arr|)
    (RETURN
     (SEQ
      (COND
       ((EQL |rows| 0)
        (|error| "new: arrays with zero rows are not supported"))
       ('T
        (SEQ
         (LETT |arr| (MAKEARR1 |rows| (MAKE-ARRAY 0))
               . #2=(|IIARRAY2;new;2NniR$;3|))
         (SEQ (LETT |i| 0 . #2#)
              (LETT #1# (SPADCALL |arr| (QREFELT $ 17)) . #2#) G190
              (COND ((|greater_SI| |i| #1#) (GO G191)))
              (SEQ (EXIT (QSETAREF1 |arr| |i| (MAKEARR1 |cols| |a|))))
              (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT |arr|)))))))) 

(DEFUN |IIARRAY2;minRowIndex;$I;4| (|m| $) (QREFELT $ 7)) 

(DEFUN |IIARRAY2;minColIndex;$I;5| (|m| $) (QREFELT $ 8)) 

(DEFUN |IIARRAY2;maxRowIndex;$I;6| (|m| $)
  (- (+ (SPADCALL |m| (QREFELT $ 22)) (QREFELT $ 7)) 1)) 

(DEFUN |IIARRAY2;maxColIndex;$I;7| (|m| $)
  (- (+ (SPADCALL |m| (QREFELT $ 24)) (QREFELT $ 8)) 1)) 

(PUT '|IIARRAY2;nrows;$Nni;8| '|SPADreplace| 'QVSIZE) 

(DEFUN |IIARRAY2;nrows;$Nni;8| (|m| $) (QVSIZE |m|)) 

(DEFUN |IIARRAY2;ncols;$Nni;9| (|m| $)
  (COND ((SPADCALL |m| (QREFELT $ 14)) 0) ('T (QVSIZE (QAREF1 |m| 0))))) 

(DEFUN |IIARRAY2;qelt;$2IR;10| (|m| |i| |j| $)
  (QAREF1 (QAREF1 |m| (- |i| (SPADCALL |m| (QREFELT $ 20))))
          (- |j| (SPADCALL |m| (QREFELT $ 21))))) 

(DEFUN |IIARRAY2;elt;$2IR;11| (|m| |i| |j| $)
  (COND
   ((OR (< |i| (SPADCALL |m| (QREFELT $ 20)))
        (SPADCALL |i| (SPADCALL |m| (QREFELT $ 23)) (QREFELT $ 27)))
    (|error| "elt: index out of range"))
   ((OR (< |j| (SPADCALL |m| (QREFELT $ 21)))
        (SPADCALL |j| (SPADCALL |m| (QREFELT $ 25)) (QREFELT $ 27)))
    (|error| "elt: index out of range"))
   ('T (SPADCALL |m| |i| |j| (QREFELT $ 26))))) 

(DEFUN |IIARRAY2;qsetelt!;$2I2R;12| (|m| |i| |j| |r| $)
  (QSETAREF1 (QAREF1 |m| (- |i| (SPADCALL |m| (QREFELT $ 20))))
             (- |j| (SPADCALL |m| (QREFELT $ 21))) |r|)) 

(DEFUN |IIARRAY2;setelt;$2I2R;13| (|m| |i| |j| |r| $)
  (COND
   ((OR (< |i| (SPADCALL |m| (QREFELT $ 20)))
        (SPADCALL |i| (SPADCALL |m| (QREFELT $ 23)) (QREFELT $ 27)))
    (|error| "setelt: index out of range"))
   ((OR (< |j| (SPADCALL |m| (QREFELT $ 21)))
        (SPADCALL |j| (SPADCALL |m| (QREFELT $ 25)) (QREFELT $ 27)))
    (|error| "setelt: index out of range"))
   ('T (SPADCALL |m| |i| |j| |r| (QREFELT $ 29))))) 

(DEFUN |IIARRAY2;latex;$S;14| (|m| $)
  (PROG (|s| #1=#:G2182 |j| #2=#:G2181 |i| #3=#:G2180)
    (RETURN
     (SEQ (LETT |s| "\\left[ \\begin{array}{" . #4=(|IIARRAY2;latex;$S;14|))
          (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 21)) . #4#)
               (LETT #3# (SPADCALL |m| (QREFELT $ 25)) . #4#) G190
               (COND ((> |j| #3#) (GO G191)))
               (SEQ (EXIT (LETT |s| (STRCONC |s| "c") . #4#)))
               (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |s| (STRCONC |s| "} ") . #4#)
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 20)) . #4#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 23)) . #4#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 21)) . #4#)
                     (LETT #1# (SPADCALL |m| (QREFELT $ 25)) . #4#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (LETT |s|
                            (STRCONC |s|
                                     (SPADCALL
                                      (SPADCALL |m| |i| |j| (QREFELT $ 26))
                                      (QREFELT $ 32)))
                            . #4#)
                      (EXIT
                       (COND
                        ((< |j| (SPADCALL |m| (QREFELT $ 25)))
                         (LETT |s| (STRCONC |s| " & ") . #4#)))))
                     (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((< |i| (SPADCALL |m| (QREFELT $ 23)))
                   (LETT |s| (STRCONC |s| " \\\\ ") . #4#)))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (STRCONC |s| "\\end{array} \\right]")))))) 

(DEFUN |InnerIndexedTwoDimensionalArray| (&REST #1=#:G2188)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2189)
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
  (PROG (|pv$| #1=#:G2186 #2=#:G2187 $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|InnerIndexedTwoDimensionalArray|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT DV$3 (|devaluate| |#3|) . #3#)
      (LETT DV$4 (|devaluate| |#4|) . #3#)
      (LETT DV$5 (|devaluate| |#5|) . #3#)
      (LETT |dv$|
            (LIST '|InnerIndexedTwoDimensionalArray| DV$1 DV$2 DV$3 DV$4 DV$5)
            . #3#)
      (LETT $ (GETREFV 42) . #3#)
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
      (|haddProp| |$ConstructorCache| '|InnerIndexedTwoDimensionalArray|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 16))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 32))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (|PrimitiveArray| (|PrimitiveArray| |#1|)))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 33 (CONS (|dispatchFunction| |IIARRAY2;latex;$S;14|) $))))
      $)))) 

(MAKEPROP '|InnerIndexedTwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) '|Rep| (|Boolean|)
              (0 . |empty?|) |IIARRAY2;empty?;$B;1| |IIARRAY2;empty;$;2|
              (|Integer|) (5 . |maxIndex|) (|NonNegativeInteger|)
              |IIARRAY2;new;2NniR$;3| |IIARRAY2;minRowIndex;$I;4|
              |IIARRAY2;minColIndex;$I;5| |IIARRAY2;nrows;$Nni;8|
              |IIARRAY2;maxRowIndex;$I;6| |IIARRAY2;ncols;$Nni;9|
              |IIARRAY2;maxColIndex;$I;7| |IIARRAY2;qelt;$2IR;10| (10 . >)
              |IIARRAY2;elt;$2IR;11| |IIARRAY2;qsetelt!;$2I2R;12|
              |IIARRAY2;setelt;$2I2R;13| (|String|) (16 . |latex|)
              (21 . |latex|) (|List| 6) (|Equation| 6) (|List| 35)
              (|Mapping| 12 6) (|OutputForm|) (|SingleInteger|)
              (|Mapping| 6 6 6) (|Mapping| 6 6))
           '#(~= 26 |size?| 32 |setelt| 38 |setRow!| 46 |setColumn!| 53
              |sample| 60 |row| 64 |qsetelt!| 70 |qelt| 78 |parts| 85 |nrows|
              90 |new| 95 |ncols| 102 |more?| 107 |minRowIndex| 113
              |minColIndex| 118 |members| 123 |member?| 128 |maxRowIndex| 134
              |maxColIndex| 139 |map!| 144 |map| 150 |less?| 171 |latex| 177
              |hash| 182 |fill!| 187 |every?| 193 |eval| 199 |eq?| 225 |empty?|
              231 |empty| 236 |elt| 240 |count| 255 |copy| 267 |column| 272
              |coerce| 278 |any?| 283 = 289 |#| 295)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 2 1 0 0 0 2 1 4))
                 (CONS
                  '#(|TwoDimensionalArrayCategory&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL)
                  (CONS
                   '#((|TwoDimensionalArrayCategory| 6 9 10)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 38))
                   (|makeByteWordVec2| 41
                                       '(1 11 12 0 13 1 11 16 0 17 2 16 12 0 0
                                         27 1 6 31 0 32 1 0 31 0 33 2 1 12 0 0
                                         1 2 0 12 0 18 1 4 0 6 0 16 16 6 30 3 0
                                         0 0 16 9 1 3 0 0 0 16 10 1 0 0 0 1 2 0
                                         9 0 16 1 4 0 6 0 16 16 6 29 3 0 6 0 16
                                         16 26 1 0 34 0 1 1 0 18 0 22 3 0 0 18
                                         18 6 19 1 0 18 0 24 2 0 12 0 18 1 1 0
                                         16 0 20 1 0 16 0 21 1 5 34 0 1 2 6 12
                                         6 0 1 1 0 16 0 23 1 0 16 0 25 2 0 0 41
                                         0 1 3 0 0 40 0 0 1 4 0 0 40 0 0 6 1 2
                                         0 0 41 0 1 2 0 12 0 18 1 1 1 31 0 33 1
                                         1 39 0 1 2 0 0 0 6 1 2 5 12 37 0 1 3 2
                                         0 0 6 6 1 3 2 0 0 34 34 1 2 2 0 0 35 1
                                         2 2 0 0 36 1 2 0 12 0 0 1 1 0 12 0 14
                                         0 0 0 15 4 0 6 0 16 16 6 1 3 0 6 0 16
                                         16 28 2 6 18 6 0 1 2 5 18 37 0 1 1 0 0
                                         0 1 2 0 10 0 16 1 1 3 38 0 1 2 5 12 37
                                         0 1 2 1 12 0 0 1 1 5 18 0 1)))))
           '|lookupComplete|)) 
