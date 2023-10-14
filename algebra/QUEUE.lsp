
(SDEFUN |QUEUE;enqueue!;S$S;1| ((|e| S) (|q| $) ($ S))
        (SEQ
         (COND
          ((NULL (SPADCALL |q| (QREFELT $ 9)))
           (SPADCALL |q| (SPADCALL |e| (QREFELT $ 10)) (QREFELT $ 11)))
          ('T
           (SPADCALL (LAST (SPADCALL |q| (QREFELT $ 9))) '|rest|
                     (SPADCALL |e| (QREFELT $ 10)) (QREFELT $ 13))))
         (EXIT |e|))) 

(SDEFUN |QUEUE;insert!;S2$;2| ((|e| S) (|q| $) ($ $))
        (SEQ (SPADCALL |e| |q| (QREFELT $ 14)) (EXIT |q|))) 

(SDEFUN |QUEUE;dequeue!;$S;3| ((|q| $) ($ S))
        (SPROG ((|e| (S)))
               (SEQ
                (COND ((SPADCALL |q| (QREFELT $ 17)) (|error| "empty queue"))
                      ('T
                       (SEQ
                        (LETT |e| (|SPADfirst| (SPADCALL |q| (QREFELT $ 9)))
                              |QUEUE;dequeue!;$S;3|)
                        (SPADCALL |q| (CDR (SPADCALL |q| (QREFELT $ 9)))
                                  (QREFELT $ 11))
                        (EXIT |e|))))))) 

(SDEFUN |QUEUE;extract!;$S;4| ((|q| $) ($ S)) (SPADCALL |q| (QREFELT $ 18))) 

(SDEFUN |QUEUE;rotate!;2$;5| ((|q| $) ($ $))
        (SEQ
         (COND ((SPADCALL |q| (QREFELT $ 17)) |q|)
               ('T
                (SEQ
                 (SPADCALL (SPADCALL |q| (QREFELT $ 18)) |q| (QREFELT $ 14))
                 (EXIT |q|)))))) 

(SDEFUN |QUEUE;length;$Nni;6| ((|q| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |q| (QREFELT $ 9)))) 

(SDEFUN |QUEUE;front;$S;7| ((|q| $) ($ S))
        (COND ((SPADCALL |q| (QREFELT $ 17)) (|error| "empty queue"))
              ('T (|SPADfirst| (SPADCALL |q| (QREFELT $ 9)))))) 

(SDEFUN |QUEUE;inspect;$S;8| ((|q| $) ($ S)) (SPADCALL |q| (QREFELT $ 23))) 

(SDEFUN |QUEUE;back;$S;9| ((|q| $) ($ S))
        (COND ((SPADCALL |q| (QREFELT $ 17)) (|error| "empty queue"))
              ('T (SPADCALL (SPADCALL |q| (QREFELT $ 9)) (QREFELT $ 25))))) 

(SDEFUN |QUEUE;queue;L$;10| ((|q| |List| S) ($ $))
        (SPADCALL |q| (QREFELT $ 27))) 

(DECLAIM (NOTINLINE |Queue;|)) 

(DEFUN |Queue| (#1=#:G138)
  (SPROG NIL
         (PROG (#2=#:G139)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Queue|)
                                               '|domainEqualList|)
                    . #3=(|Queue|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Queue;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Queue|)))))))))) 

(DEFUN |Queue;| (|#1|)
  (SPROG
   ((#1=#:G137 NIL) (|pv$| NIL) (#2=#:G134 NIL) (#3=#:G135 NIL) (#4=#:G136 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Queue|))
    (LETT |dv$| (LIST '|Queue| DV$1) . #5#)
    (LETT $ (GETREFV 40) . #5#)
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
    (|haddProp| |$ConstructorCache| '|Queue| (LIST DV$1) (CONS 1 $))
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

(MAKEPROP '|Queue| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Stack| 6) (|local| |#1|) '|Rep| (|List| 6)
              (0 . |deref|) (5 . |list|) (10 . |setref|) '"rest"
              (16 . |setelt!|) |QUEUE;enqueue!;S$S;1| |QUEUE;insert!;S2$;2|
              (|Boolean|) (23 . |empty?|) |QUEUE;dequeue!;$S;3|
              |QUEUE;extract!;$S;4| |QUEUE;rotate!;2$;5| (|NonNegativeInteger|)
              |QUEUE;length;$Nni;6| |QUEUE;front;$S;7| |QUEUE;inspect;$S;8|
              (28 . |last|) |QUEUE;back;$S;9| (33 . |construct|)
              |QUEUE;queue;L$;10| (|Mapping| 6 6 6) (|List| 31) (|Equation| 6)
              (|Mapping| 16 6) (|Mapping| 6 6) (|OutputForm|) (|InputForm|)
              (|SingleInteger|) (|HashState|) (|String|) (|Union| 6 '"failed"))
           '#(~= 38 |size?| 44 |select| 50 |sample| 56 |rotate!| 60
              |removeDuplicates| 65 |remove| 70 |reduce| 82 |queue| 103 |parts|
              108 |more?| 113 |members| 119 |member?| 124 |map!| 130 |map| 136
              |less?| 142 |length| 148 |latex| 153 |inspect| 158 |insert!| 163
              |hashUpdate!| 169 |hash| 175 |front| 180 |find| 185 |extract!|
              191 |every?| 196 |eval| 202 |eq?| 228 |enqueue!| 234 |empty?| 240
              |empty| 245 |dequeue!| 249 |count| 254 |copy| 266 |convert| 271
              |construct| 276 |coerce| 281 |back| 286 |any?| 291 = 297 |#| 303)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 0 0 0 2 1 0 0 0 2 5 7 3))
                 (CONS
                  '#(NIL |BagAggregate&| |Collection&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL NIL)
                  (CONS
                   '#((|QueueAggregate| 6) (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 34) (|ConvertibleTo| 35))
                   (|makeByteWordVec2| 39
                                       '(1 7 8 0 9 1 8 0 6 10 2 7 8 0 8 11 3 8
                                         0 0 12 0 13 1 0 16 0 17 1 8 6 0 25 1 0
                                         0 8 27 2 11 16 0 0 1 2 0 16 0 21 1 2 9
                                         0 32 0 1 0 0 0 1 1 0 0 0 20 1 10 0 0 1
                                         2 10 0 6 0 1 2 9 0 32 0 1 4 10 6 29 0
                                         6 6 1 2 9 6 29 0 1 3 9 6 29 0 6 1 1 0
                                         0 8 28 1 9 8 0 1 2 0 16 0 21 1 1 9 8 0
                                         1 2 10 16 6 0 1 2 8 0 33 0 1 2 0 0 33
                                         0 1 2 0 16 0 21 1 1 0 21 0 22 1 1 38 0
                                         1 1 0 6 0 24 2 0 0 6 0 15 2 1 37 37 0
                                         1 1 1 36 0 1 1 0 6 0 23 2 0 39 32 0 1
                                         1 0 6 0 19 2 9 16 32 0 1 3 2 0 0 8 8 1
                                         3 2 0 0 6 6 1 2 2 0 0 30 1 2 2 0 0 31
                                         1 2 0 16 0 0 1 2 0 6 6 0 14 1 0 16 0
                                         17 0 0 0 1 1 0 6 0 18 2 10 21 6 0 1 2
                                         9 21 32 0 1 1 0 0 0 1 1 3 35 0 1 1 0 0
                                         8 27 1 6 34 0 1 1 0 6 0 26 2 9 16 32 0
                                         1 2 11 16 0 0 1 1 9 21 0 1)))))
           '|lookupComplete|)) 
