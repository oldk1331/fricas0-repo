
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
        (SPADCALL (SPADCALL |q| (QREFELT $ 27)) (QREFELT $ 28))) 

(DECLAIM (NOTINLINE |Queue;|)) 

(DEFUN |Queue| (#1=#:G132)
  (SPROG NIL
         (PROG (#2=#:G133)
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
   ((|pv$| NIL) (#1=#:G129 NIL) (#2=#:G130 NIL) (#3=#:G131 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|Queue|))
    (LETT |dv$| (LIST '|Queue| DV$1) . #4#)
    (LETT $ (GETREFV 38) . #4#)
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
    (|haddProp| |$ConstructorCache| '|Queue| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 128))
    (AND #2# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 256))
    (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
         (|augmentPredVector| $ 512))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Reference| (|List| |#1|)))
    $))) 

(MAKEPROP '|Queue| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Stack| 6) (|local| |#1|) '|Rep| (|List| 6)
              (0 . |deref|) (5 . |list|) (10 . |setref|) '"rest"
              (16 . |setelt|) |QUEUE;enqueue!;S$S;1| |QUEUE;insert!;S2$;2|
              (|Boolean|) (23 . |empty?|) |QUEUE;dequeue!;$S;3|
              |QUEUE;extract!;$S;4| |QUEUE;rotate!;2$;5| (|NonNegativeInteger|)
              |QUEUE;length;$Nni;6| |QUEUE;front;$S;7| |QUEUE;inspect;$S;8|
              (28 . |last|) |QUEUE;back;$S;9| (33 . |copy|) (38 . |ref|)
              |QUEUE;queue;L$;10| (|List| 31) (|Equation| 6) (|Mapping| 16 6)
              (|Mapping| 6 6) (|OutputForm|) (|HashState|) (|SingleInteger|)
              (|String|))
           '#(~= 43 |size?| 49 |sample| 55 |rotate!| 59 |queue| 64 |parts| 69
              |more?| 74 |members| 80 |member?| 85 |map!| 91 |map| 97 |less?|
              103 |length| 109 |latex| 114 |inspect| 119 |insert!| 124
              |hashUpdate!| 130 |hash| 136 |front| 141 |extract!| 146 |every?|
              151 |eval| 157 |eq?| 183 |enqueue!| 189 |empty?| 195 |empty| 200
              |dequeue!| 204 |count| 209 |copy| 221 |coerce| 226 |bag| 231
              |back| 236 |any?| 241 = 247 |#| 253)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(NIL |BagAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|QueueAggregate| 6) (|BagAggregate| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 34))
                   (|makeByteWordVec2| 37
                                       '(1 7 8 0 9 1 8 0 6 10 2 7 8 0 8 11 3 8
                                         0 0 12 0 13 1 0 16 0 17 1 8 6 0 25 1 8
                                         0 0 27 1 7 0 8 28 2 10 16 0 0 1 2 0 16
                                         0 21 1 0 0 0 1 1 0 0 0 20 1 0 0 8 29 1
                                         8 8 0 1 2 0 16 0 21 1 1 8 8 0 1 2 9 16
                                         6 0 1 2 7 0 33 0 1 2 0 0 33 0 1 2 0 16
                                         0 21 1 1 0 21 0 22 1 1 37 0 1 1 0 6 0
                                         24 2 0 0 6 0 15 2 1 35 35 0 1 1 1 36 0
                                         1 1 0 6 0 23 1 0 6 0 19 2 8 16 32 0 1
                                         3 2 0 0 6 6 1 3 2 0 0 8 8 1 2 2 0 0 30
                                         1 2 2 0 0 31 1 2 0 16 0 0 1 2 0 6 6 0
                                         14 1 0 16 0 17 0 0 0 1 1 0 6 0 18 2 9
                                         21 6 0 1 2 8 21 32 0 1 1 0 0 0 1 1 5
                                         34 0 1 1 0 0 8 1 1 0 6 0 26 2 8 16 32
                                         0 1 2 10 16 0 0 1 1 8 21 0 1)))))
           '|lookupComplete|)) 
