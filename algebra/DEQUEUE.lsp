
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
              (LETT |p| (SPADCALL |d| (QREFELT $ 11)))
              (LETT |n| (SPADCALL |p| (QREFELT $ 17)))
              (EXIT
               (COND
                ((EQL |n| 1)
                 (SEQ (LETT |r| (|SPADfirst| |p|))
                      (SPADCALL |d| NIL (QREFELT $ 18)) (EXIT |r|)))
                ('T
                 (SEQ
                  (LETT |q|
                        (SPADCALL |p|
                                  (PROG1 (LETT #1# (- |n| 2))
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 20)))
                  (LETT |r| (|SPADfirst| (CDR |q|)))
                  (SPADCALL |q| '|rest| NIL (QREFELT $ 22)) (EXIT |r|)))))))) 

(SDEFUN |DEQUEUE;extractTop!;$S;4| ((|d| $) ($ S))
        (SPROG ((|e| (S)))
               (SEQ (LETT |e| (SPADCALL |d| (QREFELT $ 24)))
                    (SPADCALL |d| (CDR (SPADCALL |d| (QREFELT $ 11)))
                              (QREFELT $ 18))
                    (EXIT |e|)))) 

(SDEFUN |DEQUEUE;insertTop!;S$S;5| ((|e| S) (|d| $) ($ S))
        (SEQ
         (SPADCALL |d| (CONS |e| (SPADCALL |d| (QREFELT $ 11))) (QREFELT $ 18))
         (EXIT |e|))) 

(SDEFUN |DEQUEUE;insertBottom!;S$S;6| ((|e| S) (|d| $) ($ S))
        (SEQ
         (COND
          ((SPADCALL |d| (QREFELT $ 9))
           (SPADCALL |d| (SPADCALL |e| (QREFELT $ 27)) (QREFELT $ 18)))
          ('T
           (SPADCALL (LAST (SPADCALL |d| (QREFELT $ 11))) '|rest|
                     (SPADCALL |e| (QREFELT $ 27)) (QREFELT $ 22))))
         (EXIT |e|))) 

(SDEFUN |DEQUEUE;top;$S;7| ((|d| $) ($ S))
        (COND ((SPADCALL |d| (QREFELT $ 9)) (|error| "empty dequeue"))
              ('T (|SPADfirst| (SPADCALL |d| (QREFELT $ 11)))))) 

(SDEFUN |DEQUEUE;reverse!;2$;8| ((|d| $) ($ $))
        (SEQ
         (SPADCALL |d| (REVERSE (SPADCALL |d| (QREFELT $ 11))) (QREFELT $ 18))
         (EXIT |d|))) 

(SDEFUN |DEQUEUE;pop!;$S;9| ((|d| $) ($ S)) (SPADCALL |d| (QREFELT $ 25))) 

(SDEFUN |DEQUEUE;push!;S$S;10| ((|e| S) (|d| $) ($ S))
        (SPADCALL |e| |d| (QREFELT $ 26))) 

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
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Dequeue;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Dequeue|)))))))))) 

(DEFUN |Dequeue;| (|#1|)
  (SPROG
   ((#1=#:G140 NIL) (#2=#:G141 NIL) (|pv$| NIL) (#3=#:G137 NIL) (#4=#:G138 NIL)
    (#5=#:G139 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Dequeue| DV$1))
    (LETT $ (GETREFV 44))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #5#)
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #4# #5#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #5#))))))
    (|haddProp| |$ConstructorCache| '|Dequeue| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 256))
    (AND (LETT #2# (|HasCategory| $ '(|finiteAggregate|)))
         (|augmentPredVector| $ 512))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #2# (|augmentPredVector| $ 1024))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 2048))
    (AND (OR #1# #5#) (|augmentPredVector| $ 4096))
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
              |DEQUEUE;extractBottom!;$S;3| |DEQUEUE;top;$S;7|
              |DEQUEUE;extractTop!;$S;4| |DEQUEUE;insertTop!;S$S;5|
              (44 . |list|) |DEQUEUE;insertBottom!;S$S;6|
              |DEQUEUE;reverse!;2$;8| |DEQUEUE;pop!;$S;9|
              |DEQUEUE;push!;S$S;10| (|Mapping| 6 6 6) (|List| 34)
              (|Equation| 6) (|Mapping| 8 6) (|Mapping| 8 6 6) (|Mapping| 6 6)
              (|OutputForm|) (|InputForm|) (|SingleInteger|) (|String|)
              (|HashState|) (|Union| 6 '"failed"))
           '#(~= 49 |top| 55 |size?| 60 |select| 66 |sample| 72 |rotate!| 76
              |reverse!| 81 |removeDuplicates| 86 |remove| 91 |reduce| 103
              |push!| 124 |pop!| 130 |parts| 135 |more?| 140 |min| 146
              |members| 151 |member?| 156 |max| 162 |map!| 173 |map| 179
              |less?| 185 |latex| 191 |inspect| 196 |insertTop!| 201
              |insertBottom!| 207 |insert!| 213 |hashUpdate!| 219 |hash| 225
              |front| 230 |find| 235 |extractTop!| 241 |extractBottom!| 246
              |extract!| 251 |every?| 256 |eval| 262 |eq?| 288 |enqueue!| 294
              |empty?| 300 |empty| 305 |dequeue!| 309 |dequeue| 314 |count| 319
              |copy| 331 |convert| 336 |construct| 341 |coerce| 346 |bottom|
              351 |back| 356 |any?| 361 = 367 |#| 373)
           'NIL
           (CONS (|makeByteWordVec2| 8 '(0 0 0 0 0 0 0 2 1 0 0 0 2 6 8 3))
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
                      (|CoercibleTo| 38) (|ConvertibleTo| 39))
                   (|makeByteWordVec2| 43
                                       '(1 0 8 0 9 1 7 10 0 11 1 10 6 0 12 1 0
                                         0 10 14 1 10 16 0 17 2 7 10 0 10 18 2
                                         10 0 0 19 20 3 10 0 0 21 0 22 1 10 0 6
                                         27 2 13 8 0 0 1 1 0 6 0 24 2 0 8 0 19
                                         1 2 10 0 35 0 1 0 0 0 1 1 0 0 0 1 1 0
                                         0 0 29 1 12 0 0 1 2 12 0 6 0 1 2 10 0
                                         35 0 1 4 12 6 32 0 6 6 1 3 10 6 32 0 6
                                         1 2 10 6 32 0 1 2 0 6 6 0 31 1 0 6 0
                                         30 1 10 10 0 1 2 0 8 0 19 1 1 11 6 0 1
                                         1 10 10 0 1 2 12 8 6 0 1 1 11 6 0 1 2
                                         10 6 36 0 1 2 9 0 37 0 1 2 0 0 37 0 1
                                         2 0 8 0 19 1 1 1 41 0 1 1 0 6 0 1 2 0
                                         6 6 0 26 2 0 6 6 0 28 2 0 0 6 0 1 2 1
                                         42 42 0 1 1 1 40 0 1 1 0 6 0 1 2 0 43
                                         35 0 1 1 0 6 0 25 1 0 6 0 23 1 0 6 0 1
                                         2 10 8 35 0 1 3 2 0 0 6 6 1 3 2 0 0 10
                                         10 1 2 2 0 0 33 1 2 2 0 0 34 1 2 0 8 0
                                         0 1 2 0 6 6 0 1 1 0 8 0 9 0 0 0 1 1 0
                                         6 0 1 1 0 0 10 15 2 12 19 6 0 1 2 10
                                         19 35 0 1 1 0 0 0 1 1 3 39 0 1 1 0 0
                                         10 14 1 7 38 0 1 1 0 6 0 13 1 0 6 0 1
                                         2 10 8 35 0 1 2 13 8 0 0 1 1 10 19 0
                                         1)))))
           '|lookupComplete|)) 
