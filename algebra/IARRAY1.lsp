
(PUT '|IARRAY1;#;$Nni;1| '|SPADreplace| 'QVSIZE) 

(SDEFUN |IARRAY1;#;$Nni;1| ((|x| $) ($ |NonNegativeInteger|)) (QVSIZE |x|)) 

(SDEFUN |IARRAY1;fill!;$S$;2| ((|x| $) (|s| S) ($ $))
        (SPROG ((#1=#:G1156 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0 . #2=(|IARRAY1;fill!;$S$;2|))
                     (LETT #1# (QVMAXINDEX |x|) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (SETELT |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |IARRAY1;minIndex;$I;3| ((|x| $) ($ |Integer|)) (QREFELT $ 7)) 

(PUT '|IARRAY1;empty;$;4| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(SDEFUN |IARRAY1;empty;$;4| (($ $)) (MAKE-ARRAY 0)) 

(PUT '|IARRAY1;new;NniS$;5| '|SPADreplace| 'MAKEARR1) 

(SDEFUN |IARRAY1;new;NniS$;5| ((|n| |NonNegativeInteger|) (|s| S) ($ $))
        (MAKEARR1 |n| |s|)) 

(SDEFUN |IARRAY1;map!;M2$;6| ((|f| |Mapping| S S) (|s1| $) ($ $))
        (SPROG ((#1=#:G1165 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ (LETT |n| (QVMAXINDEX |s1|) . #2=(|IARRAY1;map!;M2$;6|))
                    (EXIT
                     (COND ((< |n| 0) |s1|)
                           ('T
                            (SEQ
                             (SEQ (LETT |i| 0 . #2#) (LETT #1# |n| . #2#) G190
                                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SETELT |s1| |i|
                                            (SPADCALL (ELT |s1| |i|) |f|))))
                                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190)
                                  G191 (EXIT NIL))
                             (EXIT |s1|)))))))) 

(SDEFUN |IARRAY1;map;M2$;7| ((|f| |Mapping| S S) (|s1| $) ($ $))
        (SPROG ((#1=#:G1170 NIL) (|i| NIL) (|ss2| ($)) (|n| (|Integer|)))
               (SEQ (LETT |n| (QVMAXINDEX |s1|) . #2=(|IARRAY1;map;M2$;7|))
                    (EXIT
                     (COND ((< |n| 0) |s1|)
                           ('T
                            (SEQ (LETT |ss2| (MAKE-ARRAY (+ |n| 1)) . #2#)
                                 (SEQ (LETT |i| 0 . #2#) (LETT #1# |n| . #2#)
                                      G190
                                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SETELT |ss2| |i|
                                                (SPADCALL (ELT |s1| |i|)
                                                          |f|))))
                                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT |ss2|)))))))) 

(SDEFUN |IARRAY1;map;M3$;8| ((|f| |Mapping| S S S) (|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G1176 NIL) (|i| NIL) (|c| ($)) (|maxind| (|Integer|)))
               (SEQ
                (LETT |maxind| (MIN (QVMAXINDEX |a|) (QVMAXINDEX |b|))
                      . #2=(|IARRAY1;map;M3$;8|))
                (EXIT
                 (COND ((< |maxind| 0) (SPADCALL (QREFELT $ 13)))
                       ('T
                        (SEQ (LETT |c| (MAKE-ARRAY (+ |maxind| 1)) . #2#)
                             (SEQ (LETT |i| 0 . #2#) (LETT #1# |maxind| . #2#)
                                  G190
                                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SETELT |c| |i|
                                            (SPADCALL (ELT |a| |i|)
                                                      (ELT |b| |i|) |f|))))
                                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190)
                                  G191 (EXIT NIL))
                             (EXIT |c|)))))))) 

(SDEFUN |IARRAY1;hashUpdate!;Hs$Hs;9|
        ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SPROG ((#1=#:G1180 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0 . #2=(|IARRAY1;hashUpdate!;Hs$Hs;9|))
                     (LETT #1# (QVMAXINDEX |x|) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |s| (SPADCALL |s| (ELT |x| |i|) (QREFELT $ 21))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(PUT '|IARRAY1;qelt;$IS;10| '|SPADreplace| 'ELT) 

(SDEFUN |IARRAY1;qelt;$IS;10| ((|x| $) (|i| |Integer|) ($ S)) (ELT |x| |i|)) 

(PUT '|IARRAY1;qsetelt!;$I2S;11| '|SPADreplace| 'SETELT) 

(SDEFUN |IARRAY1;qsetelt!;$I2S;11| ((|x| $) (|i| |Integer|) (|s| S) ($ S))
        (SETELT |x| |i| |s|)) 

(SDEFUN |IARRAY1;elt;$IS;12| ((|x| $) (|i| |Integer|) ($ S))
        (COND
         ((OR (MINUSP |i|)
              (SPADCALL |i| (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 28)))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| (QREFELT $ 24))))) 

(SDEFUN |IARRAY1;setelt!;$I2S;13| ((|x| $) (|i| |Integer|) (|s| S) ($ S))
        (COND
         ((OR (MINUSP |i|)
              (SPADCALL |i| (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 28)))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| |s| (QREFELT $ 25))))) 

(PUT '|IARRAY1;maxIndex;$I;14| '|SPADreplace| 'QVSIZE) 

(SDEFUN |IARRAY1;maxIndex;$I;14| ((|x| $) ($ |Integer|)) (QVSIZE |x|)) 

(SDEFUN |IARRAY1;qelt;$IS;15| ((|x| $) (|i| |Integer|) ($ S))
        (ELT |x| (- |i| 1))) 

(SDEFUN |IARRAY1;qsetelt!;$I2S;16| ((|x| $) (|i| |Integer|) (|s| S) ($ S))
        (SETELT |x| (- |i| 1) |s|)) 

(SDEFUN |IARRAY1;elt;$IS;17| ((|x| $) (|i| |Integer|) ($ S))
        (COND
         ((OR (|less_SI| |i| 1) (|less_SI| (QVSIZE |x|) |i|))
          (|error| "index out of range"))
         ('T (ELT |x| (- |i| 1))))) 

(SDEFUN |IARRAY1;setelt!;$I2S;18| ((|x| $) (|i| |Integer|) (|s| S) ($ S))
        (COND
         ((OR (|less_SI| |i| 1) (|less_SI| (QVSIZE |x|) |i|))
          (|error| "index out of range"))
         ('T (SETELT |x| (- |i| 1) |s|)))) 

(SDEFUN |IARRAY1;qelt;$IS;19| ((|x| $) (|i| |Integer|) ($ S))
        (ELT |x| (- |i| (QREFELT $ 7)))) 

(SDEFUN |IARRAY1;qsetelt!;$I2S;20| ((|x| $) (|i| |Integer|) (|s| S) ($ S))
        (SETELT |x| (- |i| (QREFELT $ 7)) |s|)) 

(SDEFUN |IARRAY1;elt;$IS;21| ((|x| $) (|i| |Integer|) ($ S))
        (COND
         ((OR (< |i| (QREFELT $ 7))
              (SPADCALL |i| (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 28)))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| (QREFELT $ 24))))) 

(SDEFUN |IARRAY1;setelt!;$I2S;22| ((|x| $) (|i| |Integer|) (|s| S) ($ S))
        (COND
         ((OR (< |i| (QREFELT $ 7))
              (SPADCALL |i| (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 28)))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| |s| (QREFELT $ 25))))) 

(DECLAIM (NOTINLINE |IndexedOneDimensionalArray;|)) 

(DEFUN |IndexedOneDimensionalArray| (&REST #1=#:G1219)
  (SPROG NIL
         (PROG (#2=#:G1220)
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
                  (HREM |$ConstructorCache|
                        '|IndexedOneDimensionalArray|)))))))))) 

(DEFUN |IndexedOneDimensionalArray;| (|#1| |#2|)
  (SPROG
   ((#1=#:G1218 NIL) (|pv$| NIL) (#2=#:G1215 NIL) (#3=#:G1216 NIL)
    (#4=#:G1217 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|IndexedOneDimensionalArray|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT |dv$| (LIST '|IndexedOneDimensionalArray| DV$1 DV$2) . #5#)
    (LETT $ (GETREFV 45) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|))
                                              . #5#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #2# #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|IndexedOneDimensionalArray|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 4096))
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
         (|augmentPredVector| $ 8192))
    (AND #4# #1# (|augmentPredVector| $ 16384))
    (AND (|HasCategory| |#1| '(|BasicType|)) #1# (|augmentPredVector| $ 32768))
    (AND #1# (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 65536))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
         (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 131072))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
         (|augmentPredVector| $ 262144))
    (AND (OR (AND #3# #1#) (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#))
         (|augmentPredVector| $ 524288))
    (AND (OR (AND #3# #1#) (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#) #4#)
         (|augmentPredVector| $ 1048576))
    (AND (OR #2# (AND #3# #1#) (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#))
         (|augmentPredVector| $ 2097152))
    (AND
     (OR (AND (|HasCategory| |#1| '(|BasicType|)) #1#) (AND #3# #1#)
         (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#) #4#)
     (|augmentPredVector| $ 4194304))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 22
                (CONS (|dispatchFunction| |IARRAY1;hashUpdate!;Hs$Hs;9|) $))))
    (QSETREFV $ 23 (ZEROP |#2|))
    (COND
     ((QREFELT $ 23)
      (PROGN
       (QSETREFV $ 24 (CONS (|dispatchFunction| |IARRAY1;qelt;$IS;10|) $))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |IARRAY1;qsetelt!;$I2S;11|) $))
       (QSETREFV $ 29 (CONS (|dispatchFunction| |IARRAY1;elt;$IS;12|) $))
       (QSETREFV $ 30
                 (CONS (|dispatchFunction| |IARRAY1;setelt!;$I2S;13|) $))))
     ((EQL |#2| 1)
      (PROGN
       (QSETREFV $ 26 (CONS (|dispatchFunction| |IARRAY1;maxIndex;$I;14|) $))
       (QSETREFV $ 24 (CONS (|dispatchFunction| |IARRAY1;qelt;$IS;15|) $))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |IARRAY1;qsetelt!;$I2S;16|) $))
       (QSETREFV $ 29 (CONS (|dispatchFunction| |IARRAY1;elt;$IS;17|) $))
       (QSETREFV $ 30
                 (CONS (|dispatchFunction| |IARRAY1;setelt!;$I2S;18|) $))))
     ('T
      (PROGN
       (QSETREFV $ 24 (CONS (|dispatchFunction| |IARRAY1;qelt;$IS;19|) $))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |IARRAY1;qsetelt!;$I2S;20|) $))
       (QSETREFV $ 29 (CONS (|dispatchFunction| |IARRAY1;elt;$IS;21|) $))
       (QSETREFV $ 30
                 (CONS (|dispatchFunction| |IARRAY1;setelt!;$I2S;22|) $)))))
    $))) 

(MAKEPROP '|IndexedOneDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) |IARRAY1;#;$Nni;1| |IARRAY1;fill!;$S$;2|
              (|Integer|) |IARRAY1;minIndex;$I;3| |IARRAY1;empty;$;4|
              |IARRAY1;new;NniS$;5| (|Mapping| 6 6) |IARRAY1;map!;M2$;6|
              |IARRAY1;map;M2$;7| (|Mapping| 6 6 6) |IARRAY1;map;M3$;8|
              (|HashState|) (0 . |hashUpdate!|) (6 . |hashUpdate!|) '#:G1151
              (12 . |qelt|) (18 . |qsetelt!|) (25 . |maxIndex|) (|Boolean|)
              (30 . >) (36 . |elt|) (42 . |setelt!|) (|Mapping| 27 6 6)
              (|List| 6) (|Equation| 6) (|List| 33) (|OutputForm|)
              (|SingleInteger|) (|String|) (|Mapping| 27 6)
              (|UniversalSegment| 11) (|Void|) (|InputForm|) (|List| $)
              (|Union| 6 '"failed") (|List| 11))
           '#(~= 49 |swap!| 55 |sorted?| 62 |sort!| 73 |sort| 84 |smaller?| 95
              |size?| 101 |setelt!| 107 |select| 121 |sample| 127 |reverse!|
              131 |reverse| 136 |removeDuplicates| 141 |remove| 146 |reduce|
              158 |qsetelt!| 179 |qelt| 186 |position| 192 |parts| 211 |new|
              216 |more?| 222 |minIndex| 228 |min| 233 |merge| 239 |members|
              252 |member?| 257 |maxIndex| 263 |max| 268 |map!| 274 |map| 280
              |less?| 293 |latex| 299 |insert| 304 |indices| 318 |index?| 323
              |hashUpdate!| 329 |hash| 335 |first| 340 |find| 345 |fill!| 351
              |every?| 357 |eval| 363 |eq?| 389 |entry?| 395 |entries| 401
              |empty?| 406 |empty| 411 |elt| 415 |delete| 434 |count| 446
              |copyInto!| 458 |copy| 465 |convert| 470 |construct| 475 |concat|
              480 |coerce| 503 |any?| 508 >= 514 > 520 = 526 <= 532 < 538 |#|
              544)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 1 0 10 0 0 4 9 0 0 0 0 4 8 12 1 2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |IndexedAggregate&| |Collection&| |OrderedSet&|
                |HomogeneousAggregate&| NIL |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| NIL NIL NIL NIL |InnerEvalable&|
                |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|IndexedAggregate| 11 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 11 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 11 6)
                 (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 35)
                 (|PartialOrder|) (|ConvertibleTo| 41))
              (|makeByteWordVec2| 44
                                  '(2 6 20 20 0 21 2 0 20 20 0 22 2 0 6 0 11 24
                                    3 0 6 0 11 6 25 1 0 11 0 26 2 11 27 0 0 28
                                    2 0 6 0 11 29 3 0 6 0 11 6 30 2 23 27 0 0 1
                                    3 13 40 0 11 11 1 1 19 27 0 1 2 14 27 31 0
                                    1 1 18 0 0 1 2 17 0 31 0 1 1 19 0 0 1 2 14
                                    0 31 0 1 2 20 27 0 0 1 2 0 27 0 8 1 3 13 6
                                    0 39 6 1 3 13 6 0 11 6 30 2 14 0 38 0 1 0 0
                                    0 1 1 17 0 0 1 1 14 0 0 1 1 16 0 0 1 2 16 0
                                    6 0 1 2 14 0 38 0 1 4 16 6 18 0 6 6 1 2 14
                                    6 18 0 1 3 14 6 18 0 6 1 3 13 6 0 11 6 25 2
                                    0 6 0 11 24 3 16 11 6 0 11 1 2 16 11 6 0 1
                                    2 14 11 38 0 1 1 14 32 0 1 2 0 0 8 6 14 2 0
                                    27 0 8 1 1 5 11 0 12 2 19 0 0 0 1 2 19 0 0
                                    0 1 3 14 0 31 0 0 1 1 14 32 0 1 2 16 27 6 0
                                    1 1 5 11 0 26 2 19 0 0 0 1 2 13 0 15 0 16 3
                                    0 0 18 0 0 19 2 0 0 15 0 17 2 0 27 0 8 1 1
                                    21 37 0 1 3 0 0 0 0 11 1 3 0 0 6 0 11 1 1 0
                                    44 0 1 2 0 27 11 0 1 2 21 20 20 0 22 1 21
                                    36 0 1 1 5 6 0 1 2 0 43 38 0 1 2 13 0 0 6
                                    10 2 14 27 38 0 1 3 4 0 0 6 6 1 3 4 0 0 32
                                    32 1 2 4 0 0 33 1 2 4 0 0 34 1 2 0 27 0 0 1
                                    2 15 27 6 0 1 1 0 32 0 1 1 0 27 0 1 0 0 0
                                    13 2 0 0 0 39 1 3 0 6 0 11 6 1 2 0 6 0 11
                                    29 2 0 0 0 39 1 2 0 0 0 11 1 2 16 8 6 0 1 2
                                    14 8 38 0 1 3 17 0 0 0 11 1 1 0 0 0 1 1 2
                                    41 0 1 1 0 0 32 1 2 0 0 0 0 1 1 0 0 42 1 2
                                    0 0 6 0 1 2 0 0 0 6 1 1 22 35 0 1 2 14 27
                                    38 0 1 2 19 27 0 0 1 2 19 27 0 0 1 2 23 27
                                    0 0 1 2 19 27 0 0 1 2 19 27 0 0 1 1 14 8 0
                                    9)))))
           '|lookupComplete|)) 
