
(SDEFUN |DEQUEUE;bottom;$S;1| ((|d| $) ($ S))
        (COND ((SPADCALL |d| (QREFELT $ 9)) (|error| "empty dequeue"))
              ('T (SPADCALL (SPADCALL |d| (QREFELT $ 11)) (QREFELT $ 12))))) 

(SDEFUN |DEQUEUE;dequeue;L$;2| ((|d| |List| S) ($ $))
        (SPADCALL |d| (QREFELT $ 14))) 

(SDEFUN |DEQUEUE;extractBottom!;$S;3| ((|d| $) ($ S))
        (SPROG
         ((|r| (S)) (|q| (|List| S)) (#1=#:G113 NIL) (|n| (|Integer|))
          (|p| (|List| S)))
         (SEQ (COND ((SPADCALL |d| (QREFELT $ 9)) (|error| "empty dequeue")))
              (LETT |p| (SPADCALL |d| (QREFELT $ 11))
                    . #2=(|DEQUEUE;extractBottom!;$S;3|))
              (LETT |n| (SPADCALL |p| (QREFELT $ 17)) . #2#)
              (EXIT
               (COND
                ((EQL |n| 1)
                 (SEQ (LETT |r| (|SPADfirst| |p|) . #2#)
                      (SPADCALL |d| NIL (QREFELT $ 18)) (EXIT |r|)))
                ('T
                 (SEQ
                  (LETT |q|
                        (SPADCALL |p|
                                  (PROG1 (LETT #1# (- |n| 2) . #2#)
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 20))
                        . #2#)
                  (LETT |r| (|SPADfirst| (CDR |q|)) . #2#)
                  (SPADCALL |q| '|rest| NIL (QREFELT $ 22)) (EXIT |r|)))))))) 

(SDEFUN |DEQUEUE;extractTop!;$S;4| ((|d| $) ($ S))
        (SPROG ((|e| (S)))
               (SEQ
                (LETT |e| (SPADCALL |d| (QREFELT $ 24))
                      |DEQUEUE;extractTop!;$S;4|)
                (SPADCALL |d| (CDR (SPADCALL |d| (QREFELT $ 11)))
                          (QREFELT $ 18))
                (EXIT |e|)))) 

(SDEFUN |DEQUEUE;height;$Nni;5| ((|d| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |d| (QREFELT $ 11)))) 

(SDEFUN |DEQUEUE;depth;$Nni;6| ((|d| $) ($ |NonNegativeInteger|))
        (SPADCALL |d| (QREFELT $ 26))) 

(SDEFUN |DEQUEUE;insertTop!;S$S;7| ((|e| S) (|d| $) ($ S))
        (SEQ
         (SPADCALL |d| (CONS |e| (SPADCALL |d| (QREFELT $ 11))) (QREFELT $ 18))
         (EXIT |e|))) 

(SDEFUN |DEQUEUE;insertBottom!;S$S;8| ((|e| S) (|d| $) ($ S))
        (SEQ
         (COND
          ((SPADCALL |d| (QREFELT $ 9))
           (SPADCALL |d| (SPADCALL |e| (QREFELT $ 29)) (QREFELT $ 18)))
          ('T
           (SPADCALL (LAST (SPADCALL |d| (QREFELT $ 11))) '|rest|
                     (SPADCALL |e| (QREFELT $ 29)) (QREFELT $ 22))))
         (EXIT |e|))) 

(SDEFUN |DEQUEUE;top;$S;9| ((|d| $) ($ S))
        (COND ((SPADCALL |d| (QREFELT $ 9)) (|error| "empty dequeue"))
              ('T (|SPADfirst| (SPADCALL |d| (QREFELT $ 11)))))) 

(SDEFUN |DEQUEUE;reverse!;2$;10| ((|d| $) ($ $))
        (SEQ
         (SPADCALL |d| (REVERSE (SPADCALL |d| (QREFELT $ 11))) (QREFELT $ 18))
         (EXIT |d|))) 

(SDEFUN |DEQUEUE;pop!;$S;11| ((|d| $) ($ S)) (SPADCALL |d| (QREFELT $ 25))) 

(SDEFUN |DEQUEUE;push!;S$S;12| ((|e| S) (|d| $) ($ S))
        (SPADCALL |e| |d| (QREFELT $ 28))) 

(DECLAIM (NOTINLINE |Dequeue;|)) 

(DEFUN |Dequeue| (#1=#:G142)
  (SPROG NIL
         (PROG (#2=#:G143)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Dequeue|)
                                               '|domainEqualList|)
                    . #3=(|Dequeue|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Dequeue;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Dequeue|)))))))))) 

(DEFUN |Dequeue;| (|#1|)
  (SPROG
   ((#1=#:G141 NIL) (|pv$| NIL) (#2=#:G138 NIL) (#3=#:G139 NIL) (#4=#:G140 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Dequeue|))
    (LETT |dv$| (LIST '|Dequeue| DV$1) . #5#)
    (LETT $ (GETREFV 45) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
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
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #5#)
                                        (OR #3# #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #4#))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|Dequeue| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 128))
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 256))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #5#)
     (|augmentPredVector| $ 512))
    (AND (OR #1# #4#) (|augmentPredVector| $ 1024))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Reference| (|List| |#1|)))
    $))) 

(MAKEPROP '|Dequeue| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Queue| 6) (|local| |#1|) '|Rep| (|Boolean|)
              (0 . |empty?|) (|List| 6) (5 . |deref|) (10 . |last|)
              |DEQUEUE;bottom;$S;1| (15 . |construct|) |DEQUEUE;dequeue;L$;2|
              (|Integer|) (20 . |maxIndex|) (25 . |setref|)
              (|NonNegativeInteger|) (31 . |rest|) '"rest" (37 . |setelt!|)
              |DEQUEUE;extractBottom!;$S;3| |DEQUEUE;top;$S;9|
              |DEQUEUE;extractTop!;$S;4| |DEQUEUE;height;$Nni;5|
              |DEQUEUE;depth;$Nni;6| |DEQUEUE;insertTop!;S$S;7| (44 . |list|)
              |DEQUEUE;insertBottom!;S$S;8| |DEQUEUE;reverse!;2$;10|
              |DEQUEUE;pop!;$S;11| |DEQUEUE;push!;S$S;12| (|Mapping| 6 6 6)
              (|Equation| 6) (|List| 35) (|Mapping| 8 6) (|Mapping| 6 6)
              (|OutputForm|) (|InputForm|) (|HashState|) (|SingleInteger|)
              (|String|) (|Union| 6 '"failed"))
           '#(~= 49 |top| 55 |size?| 60 |select| 66 |sample| 72 |rotate!| 76
              |reverse!| 81 |removeDuplicates| 86 |remove| 91 |reduce| 103
              |push!| 124 |pop!| 130 |parts| 135 |more?| 140 |members| 146
              |member?| 151 |map!| 157 |map| 163 |less?| 169 |length| 175
              |latex| 180 |inspect| 185 |insertTop!| 190 |insertBottom!| 196
              |insert!| 202 |height| 208 |hashUpdate!| 213 |hash| 219 |front|
              224 |find| 229 |extractTop!| 235 |extractBottom!| 240 |extract!|
              245 |every?| 250 |eval| 256 |eq?| 282 |enqueue!| 288 |empty?| 294
              |empty| 299 |dequeue!| 303 |dequeue| 308 |depth| 313 |count| 318
              |copy| 330 |convert| 335 |construct| 340 |coerce| 345 |bottom|
              350 |back| 355 |any?| 360 = 366 |#| 372)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 0 0 0 0 0 2 1 0 0 0 2 5 7 3))
                 (CONS
                  '#(NIL NIL NIL |BagAggregate&| |Collection&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL NIL)
                  (CONS
                   '#((|DequeueAggregate| 6) (|StackAggregate| 6)
                      (|QueueAggregate| 6) (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 39) (|ConvertibleTo| 40))
                   (|makeByteWordVec2| 44
                                       '(1 0 8 0 9 1 7 10 0 11 1 10 6 0 12 1 0
                                         0 10 14 1 10 16 0 17 2 7 10 0 10 18 2
                                         10 0 0 19 20 3 10 0 0 21 0 22 1 10 0 6
                                         29 2 11 8 0 0 1 1 0 6 0 24 2 0 8 0 19
                                         1 2 9 0 37 0 1 0 0 0 1 1 0 0 0 1 1 0 0
                                         0 31 1 10 0 0 1 2 10 0 6 0 1 2 9 0 37
                                         0 1 4 10 6 34 0 6 6 1 2 9 6 34 0 1 3 9
                                         6 34 0 6 1 2 0 6 6 0 33 1 0 6 0 32 1 9
                                         10 0 1 2 0 8 0 19 1 1 9 10 0 1 2 10 8
                                         6 0 1 2 8 0 38 0 1 2 0 0 38 0 1 2 0 8
                                         0 19 1 1 0 19 0 1 1 1 43 0 1 1 0 6 0 1
                                         2 0 6 6 0 28 2 0 6 6 0 30 2 0 0 6 0 1
                                         1 0 19 0 26 2 1 41 41 0 1 1 1 42 0 1 1
                                         0 6 0 1 2 0 44 37 0 1 1 0 6 0 25 1 0 6
                                         0 23 1 0 6 0 1 2 9 8 37 0 1 3 2 0 0 10
                                         10 1 2 2 0 0 35 1 3 2 0 0 6 6 1 2 2 0
                                         0 36 1 2 0 8 0 0 1 2 0 6 6 0 1 1 0 8 0
                                         9 0 0 0 1 1 0 6 0 1 1 0 0 10 15 1 0 19
                                         0 27 2 10 19 6 0 1 2 9 19 37 0 1 1 0 0
                                         0 1 1 3 40 0 1 1 0 0 10 14 1 6 39 0 1
                                         1 0 6 0 13 1 0 6 0 1 2 9 8 37 0 1 2 11
                                         8 0 0 1 1 9 19 0 1)))))
           '|lookupComplete|)) 
