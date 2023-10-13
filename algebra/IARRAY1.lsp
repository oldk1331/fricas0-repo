
(/VERSIONCHECK 2) 

(PUT '|IARRAY1;#;$Nni;1| '|SPADreplace| 'QVSIZE) 

(DEFUN |IARRAY1;#;$Nni;1| (|x| $) (QVSIZE |x|)) 

(DEFUN |IARRAY1;fill!;$S$;2| (|x| |s| $)
  (PROG (#1=#:G1136 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 0 . #2=(|IARRAY1;fill!;$S$;2|))
           (LETT #1# (QVMAXINDEX |x|) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (SETELT |x| |i| |s|))) (LETT |i| (|inc_SI| |i|) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |IARRAY1;minIndex;$I;3| (|x| $) (QREFELT $ 7)) 

(PUT '|IARRAY1;empty;$;4| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(DEFUN |IARRAY1;empty;$;4| ($) (MAKE-ARRAY 0)) 

(PUT '|IARRAY1;new;NniS$;5| '|SPADreplace| 'MAKEARR1) 

(DEFUN |IARRAY1;new;NniS$;5| (|n| |s| $) (MAKEARR1 |n| |s|)) 

(DEFUN |IARRAY1;map!;M2$;6| (|f| |s1| $)
  (PROG (|i| |n|)
    (RETURN
     (SEQ (LETT |n| (QVMAXINDEX |s1|) . #1=(|IARRAY1;map!;M2$;6|))
          (EXIT
           (COND ((< |n| 0) |s1|)
                 ('T
                  (SEQ
                   (SEQ (LETT |i| 0 . #1#) G190
                        (COND ((|greater_SI| |i| |n|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT |s1| |i| (SPADCALL (ELT |s1| |i|) |f|))))
                        (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT |s1|))))))))) 

(DEFUN |IARRAY1;map;M2$;7| (|f| |s1| $)
  (PROG (|i| |ss2| |n|)
    (RETURN
     (SEQ (LETT |n| (QVMAXINDEX |s1|) . #1=(|IARRAY1;map;M2$;7|))
          (EXIT
           (COND ((< |n| 0) |s1|)
                 ('T
                  (SEQ (LETT |ss2| (MAKE-ARRAY (+ |n| 1)) . #1#)
                       (SEQ (LETT |i| 0 . #1#) G190
                            (COND ((|greater_SI| |i| |n|) (GO G191)))
                            (SEQ
                             (EXIT
                              (SETELT |ss2| |i|
                                      (SPADCALL (ELT |s1| |i|) |f|))))
                            (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |ss2|))))))))) 

(DEFUN |IARRAY1;map;M3$;8| (|f| |a| |b| $)
  (PROG (|i| |c| |maxind|)
    (RETURN
     (SEQ
      (LETT |maxind| (MIN (QVMAXINDEX |a|) (QVMAXINDEX |b|))
            . #1=(|IARRAY1;map;M3$;8|))
      (EXIT
       (COND ((< |maxind| 0) (SPADCALL (QREFELT $ 13)))
             ('T
              (SEQ (LETT |c| (MAKE-ARRAY (+ |maxind| 1)) . #1#)
                   (SEQ (LETT |i| 0 . #1#) G190
                        (COND ((|greater_SI| |i| |maxind|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT |c| |i|
                                  (SPADCALL (ELT |a| |i|) (ELT |b| |i|) |f|))))
                        (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT |c|))))))))) 

(PUT '|IARRAY1;qelt;$IS;9| '|SPADreplace| 'ELT) 

(DEFUN |IARRAY1;qelt;$IS;9| (|x| |i| $) (ELT |x| |i|)) 

(PUT '|IARRAY1;qsetelt!;$I2S;10| '|SPADreplace| 'SETELT) 

(DEFUN |IARRAY1;qsetelt!;$I2S;10| (|x| |i| |s| $) (SETELT |x| |i| |s|)) 

(DEFUN |IARRAY1;elt;$IS;11| (|x| |i| $)
  (COND
   ((OR (MINUSP |i|)
        (SPADCALL |i| (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 25)))
    (|error| "index out of range"))
   ('T (SPADCALL |x| |i| (QREFELT $ 21))))) 

(DEFUN |IARRAY1;setelt;$I2S;12| (|x| |i| |s| $)
  (COND
   ((OR (MINUSP |i|)
        (SPADCALL |i| (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 25)))
    (|error| "index out of range"))
   ('T (SPADCALL |x| |i| |s| (QREFELT $ 22))))) 

(PUT '|IARRAY1;maxIndex;$I;13| '|SPADreplace| 'QVSIZE) 

(DEFUN |IARRAY1;maxIndex;$I;13| (|x| $) (QVSIZE |x|)) 

(DEFUN |IARRAY1;qelt;$IS;14| (|x| |i| $) (ELT |x| (- |i| 1))) 

(DEFUN |IARRAY1;qsetelt!;$I2S;15| (|x| |i| |s| $) (SETELT |x| (- |i| 1) |s|)) 

(DEFUN |IARRAY1;elt;$IS;16| (|x| |i| $)
  (COND
   ((OR (|less_SI| |i| 1) (|less_SI| (QVSIZE |x|) |i|))
    (|error| "index out of range"))
   ('T (ELT |x| (- |i| 1))))) 

(DEFUN |IARRAY1;setelt;$I2S;17| (|x| |i| |s| $)
  (COND
   ((OR (|less_SI| |i| 1) (|less_SI| (QVSIZE |x|) |i|))
    (|error| "index out of range"))
   ('T (SETELT |x| (- |i| 1) |s|)))) 

(DEFUN |IARRAY1;qelt;$IS;18| (|x| |i| $) (ELT |x| (- |i| (QREFELT $ 7)))) 

(DEFUN |IARRAY1;qsetelt!;$I2S;19| (|x| |i| |s| $)
  (SETELT |x| (- |i| (QREFELT $ 7)) |s|)) 

(DEFUN |IARRAY1;elt;$IS;20| (|x| |i| $)
  (COND
   ((OR (< |i| (QREFELT $ 7))
        (SPADCALL |i| (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 25)))
    (|error| "index out of range"))
   ('T (SPADCALL |x| |i| (QREFELT $ 21))))) 

(DEFUN |IARRAY1;setelt;$I2S;21| (|x| |i| |s| $)
  (COND
   ((OR (< |i| (QREFELT $ 7))
        (SPADCALL |i| (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 25)))
    (|error| "index out of range"))
   ('T (SPADCALL |x| |i| |s| (QREFELT $ 22))))) 

(DEFUN |IndexedOneDimensionalArray| (&REST #1=#:G1192)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1193)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|IndexedOneDimensionalArray|)
                                           '|domainEqualList|)
                . #3=(|IndexedOneDimensionalArray|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |IndexedOneDimensionalArray;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|IndexedOneDimensionalArray|))))))))))) 

(DEFUN |IndexedOneDimensionalArray;| (|#1| |#2|)
  (PROG (#1=#:G1191 |pv$| #2=#:G1188 #3=#:G1189 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|IndexedOneDimensionalArray|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|IndexedOneDimensionalArray| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 42) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #4#)
                                          (OR
                                           (|HasCategory| |#1| '(|OrderedSet|))
                                           #3#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #3#)
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            #3#))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #4#)
                                          (OR #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #3#))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|IndexedOneDimensionalArray|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 512))
      (AND #3# #1# (|augmentPredVector| $ 1024))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 2048))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 20 (ZEROP |#2|))
      (COND
       ((QREFELT $ 20)
        (PROGN
         (QSETREFV $ 21 (CONS (|dispatchFunction| |IARRAY1;qelt;$IS;9|) $))
         (QSETREFV $ 22
                   (CONS (|dispatchFunction| |IARRAY1;qsetelt!;$I2S;10|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |IARRAY1;elt;$IS;11|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |IARRAY1;setelt;$I2S;12|) $))))
       ((EQL |#2| 1)
        (PROGN
         (QSETREFV $ 23 (CONS (|dispatchFunction| |IARRAY1;maxIndex;$I;13|) $))
         (QSETREFV $ 21 (CONS (|dispatchFunction| |IARRAY1;qelt;$IS;14|) $))
         (QSETREFV $ 22
                   (CONS (|dispatchFunction| |IARRAY1;qsetelt!;$I2S;15|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |IARRAY1;elt;$IS;16|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |IARRAY1;setelt;$I2S;17|) $))))
       ('T
        (PROGN
         (QSETREFV $ 21 (CONS (|dispatchFunction| |IARRAY1;qelt;$IS;18|) $))
         (QSETREFV $ 22
                   (CONS (|dispatchFunction| |IARRAY1;qsetelt!;$I2S;19|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |IARRAY1;elt;$IS;20|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |IARRAY1;setelt;$I2S;21|) $)))))
      $)))) 

(MAKEPROP '|IndexedOneDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) |IARRAY1;#;$Nni;1| |IARRAY1;fill!;$S$;2|
              (|Integer|) |IARRAY1;minIndex;$I;3| |IARRAY1;empty;$;4|
              |IARRAY1;new;NniS$;5| (|Mapping| 6 6) |IARRAY1;map!;M2$;6|
              |IARRAY1;map;M2$;7| (|Mapping| 6 6 6) |IARRAY1;map;M3$;8|
              '#:G1131 (0 . |qelt|) (6 . |qsetelt!|) (13 . |maxIndex|)
              (|Boolean|) (18 . >) (24 . |elt|) (30 . |setelt|) (|List| 6)
              (|Equation| 6) (|List| 29) (|Mapping| 24 6) (|Mapping| 24 6 6)
              (|UniversalSegment| 11) (|Void|) (|OutputForm|) (|InputForm|)
              (|String|) (|SingleInteger|) (|List| $) (|Union| 6 '"failed")
              (|List| 11))
           '#(~= 37 |swap!| 43 |sorted?| 50 |sort!| 61 |sort| 72 |smaller?| 83
              |size?| 89 |setelt| 95 |select| 109 |sample| 115 |reverse!| 119
              |reverse| 124 |removeDuplicates| 129 |remove| 134 |reduce| 146
              |qsetelt!| 167 |qelt| 174 |position| 180 |parts| 199 |new| 204
              |more?| 210 |minIndex| 216 |min| 221 |merge| 227 |members| 240
              |member?| 245 |maxIndex| 251 |max| 256 |map!| 262 |map| 268
              |less?| 281 |latex| 287 |insert| 292 |indices| 306 |index?| 311
              |hash| 317 |first| 322 |find| 327 |fill!| 333 |every?| 339 |eval|
              345 |eq?| 371 |entry?| 377 |entries| 383 |empty?| 388 |empty| 393
              |elt| 397 |delete| 416 |count| 428 |copyInto!| 440 |copy| 447
              |convert| 452 |construct| 457 |concat| 462 |coerce| 485 |any?|
              490 >= 496 > 502 = 508 <= 514 < 520 |#| 526)
           'NIL
           (CONS
            (|makeByteWordVec2| 9 '(0 0 0 0 0 2 0 2 0 0 7 5 0 0 0 0 7 1 5 9 2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| |FiniteLinearAggregate&|
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL |BasicType&| NIL |PartialOrder&|)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|IndexedAggregate| 11 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 11 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 11 6)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 36) (|BasicType|)
                 (|CoercibleTo| 35) (|PartialOrder|))
              (|makeByteWordVec2| 41
                                  '(2 0 6 0 11 21 3 0 6 0 11 6 22 1 0 11 0 23 2
                                    11 24 0 0 25 2 0 6 0 11 26 3 0 6 0 11 6 27
                                    2 4 24 0 0 1 3 12 34 0 11 11 1 1 2 24 0 1 2
                                    0 24 32 0 1 1 13 0 0 1 2 12 0 32 0 1 1 2 0
                                    0 1 2 0 0 32 0 1 2 2 24 0 0 1 2 0 24 0 8 1
                                    3 12 6 0 33 6 1 3 12 6 0 11 6 27 2 10 0 31
                                    0 1 0 0 0 1 1 12 0 0 1 1 0 0 0 1 1 11 0 0 1
                                    2 11 0 6 0 1 2 10 0 31 0 1 4 11 6 18 0 6 6
                                    1 3 10 6 18 0 6 1 2 10 6 18 0 1 3 12 6 0 11
                                    6 22 2 0 6 0 11 21 2 4 11 6 0 1 3 4 11 6 0
                                    11 1 2 0 11 31 0 1 1 10 28 0 1 2 0 0 8 6 14
                                    2 0 24 0 8 1 1 3 11 0 12 2 2 0 0 0 1 2 2 0
                                    0 0 1 3 0 0 32 0 0 1 1 10 28 0 1 2 11 24 6
                                    0 1 1 3 11 0 23 2 2 0 0 0 1 2 12 0 15 0 16
                                    3 0 0 18 0 0 19 2 0 0 15 0 17 2 0 24 0 8 1
                                    1 4 37 0 1 3 0 0 0 0 11 1 3 0 0 6 0 11 1 1
                                    0 41 0 1 2 0 24 11 0 1 1 4 38 0 1 1 3 6 0 1
                                    2 0 40 31 0 1 2 12 0 0 6 10 2 10 24 31 0 1
                                    3 6 0 0 28 28 1 2 6 0 0 29 1 3 6 0 0 6 6 1
                                    2 6 0 0 30 1 2 0 24 0 0 1 2 11 24 6 0 1 1 0
                                    28 0 1 1 0 24 0 1 0 0 0 13 2 0 0 0 33 1 2 0
                                    6 0 11 26 3 0 6 0 11 6 1 2 0 0 0 11 1 2 0 0
                                    0 33 1 2 11 8 6 0 1 2 10 8 31 0 1 3 12 0 0
                                    0 11 1 1 0 0 0 1 1 1 36 0 1 1 0 0 28 1 1 0
                                    0 39 1 2 0 0 6 0 1 2 0 0 0 0 1 2 0 0 0 6 1
                                    1 8 35 0 1 2 10 24 31 0 1 2 2 24 0 0 1 2 2
                                    24 0 0 1 2 4 24 0 0 1 2 2 24 0 0 1 2 2 24 0
                                    0 1 1 10 8 0 9)))))
           '|lookupComplete|)) 
