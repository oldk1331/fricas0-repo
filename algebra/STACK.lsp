
(SDEFUN |STACK;=;2$B;1| ((|s| $) (|t| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (SPADCALL |t| (QREFELT $ 9))
                  (QREFELT $ 11))) 

(SDEFUN |STACK;parts;$L;2| ((|s| $) ($ |List| S)) (SPADCALL |s| (QREFELT $ 9))) 

(SDEFUN |STACK;map;M2$;3| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SPADCALL (SPADCALL |f| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 15))
                  (QREFELT $ 16))) 

(SDEFUN |STACK;map!;M2$;4| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SEQ
         (SPADCALL |s|
                   (SPADCALL |f| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 18))
                   (QREFELT $ 19))
         (EXIT |s|))) 

(SDEFUN |STACK;coerce;$Of;5| ((|d| $) ($ |OutputForm|))
        (SPROG ((#1=#:G116 NIL) (|e| NIL) (#2=#:G115 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|STACK;coerce;$Of;5|))
                  (SEQ (LETT |e| NIL . #3#)
                       (LETT #1# (SPADCALL |d| (QREFELT $ 9)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |e| (QREFELT $ 22)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 24))))) 

(SDEFUN |STACK;copy;2$;6| ((|s| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 26))
                  (QREFELT $ 16))) 

(SDEFUN |STACK;depth;$Nni;7| ((|s| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |s| (QREFELT $ 9)))) 

(SDEFUN |STACK;#;$Nni;8| ((|s| $) ($ |NonNegativeInteger|))
        (SPADCALL |s| (QREFELT $ 29))) 

(SDEFUN |STACK;pop!;$S;9| ((|s| $) ($ S))
        (SPROG ((|e| (S)))
               (SEQ
                (COND ((SPADCALL |s| (QREFELT $ 31)) (|error| "empty stack"))
                      ('T
                       (SEQ
                        (LETT |e| (|SPADfirst| (SPADCALL |s| (QREFELT $ 9)))
                              |STACK;pop!;$S;9|)
                        (SPADCALL |s| (CDR (SPADCALL |s| (QREFELT $ 9)))
                                  (QREFELT $ 19))
                        (EXIT |e|))))))) 

(SDEFUN |STACK;extract!;$S;10| ((|s| $) ($ S)) (SPADCALL |s| (QREFELT $ 32))) 

(SDEFUN |STACK;top;$S;11| ((|s| $) ($ S))
        (COND ((SPADCALL |s| (QREFELT $ 31)) (|error| "empty stack"))
              ('T (|SPADfirst| (SPADCALL |s| (QREFELT $ 9)))))) 

(SDEFUN |STACK;inspect;$S;12| ((|s| $) ($ S)) (SPADCALL |s| (QREFELT $ 34))) 

(SDEFUN |STACK;push!;S$S;13| ((|e| S) (|s| $) ($ S))
        (SEQ
         (SPADCALL |s| (CONS |e| (SPADCALL |s| (QREFELT $ 9))) (QREFELT $ 19))
         (EXIT |e|))) 

(SDEFUN |STACK;insert!;S2$;14| ((|e| S) (|s| $) ($ $))
        (SEQ (SPADCALL |e| |s| (QREFELT $ 36)) (EXIT |s|))) 

(SDEFUN |STACK;empty;$;15| (($ $)) (SPADCALL NIL (QREFELT $ 16))) 

(SDEFUN |STACK;empty?;$B;16| ((|s| $) ($ |Boolean|))
        (NULL (SPADCALL |s| (QREFELT $ 9)))) 

(SDEFUN |STACK;construct;L$;17| ((|s| |List| S) ($ $))
        (SPADCALL (SPADCALL |s| (QREFELT $ 26)) (QREFELT $ 16))) 

(SDEFUN |STACK;stack;L$;18| ((|s| |List| S) ($ $))
        (SPADCALL |s| (QREFELT $ 39))) 

(SDEFUN |STACK;hashUpdate!;Hs$Hs;19|
        ((|st| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (SPADCALL |st| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 42))) 

(DECLAIM (NOTINLINE |Stack;|)) 

(DEFUN |Stack| (#1=#:G145)
  (SPROG NIL
         (PROG (#2=#:G146)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Stack|)
                                               '|domainEqualList|)
                    . #3=(|Stack|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Stack;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Stack|)))))))))) 

(DEFUN |Stack;| (|#1|)
  (SPROG
   ((#1=#:G144 NIL) (|pv$| NIL) (#2=#:G141 NIL) (#3=#:G142 NIL) (#4=#:G143 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Stack|))
    (LETT |dv$| (LIST '|Stack| DV$1) . #5#)
    (LETT $ (GETREFV 52) . #5#)
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
    (|haddProp| |$ConstructorCache| '|Stack| (LIST DV$1) (CONS 1 $))
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

(MAKEPROP '|Stack| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (0 . |deref|) (|Boolean|) (5 . =) |STACK;=;2$B;1|
              |STACK;parts;$L;2| (|Mapping| 6 6) (11 . |map|) (17 . |ref|)
              |STACK;map;M2$;3| (22 . |map!|) (28 . |setref|)
              |STACK;map!;M2$;4| (|OutputForm|) (34 . |coerce|) (|List| $)
              (39 . |bracket|) |STACK;coerce;$Of;5| (44 . |copy|)
              |STACK;copy;2$;6| (|NonNegativeInteger|) |STACK;depth;$Nni;7|
              |STACK;#;$Nni;8| |STACK;empty?;$B;16| |STACK;pop!;$S;9|
              |STACK;extract!;$S;10| |STACK;top;$S;11| |STACK;inspect;$S;12|
              |STACK;push!;S$S;13| |STACK;insert!;S2$;14| |STACK;empty;$;15|
              |STACK;construct;L$;17| |STACK;stack;L$;18| (|HashState|)
              (49 . |hashUpdate!|) |STACK;hashUpdate!;Hs$Hs;19|
              (|Mapping| 6 6 6) (|List| 46) (|Equation| 6) (|Mapping| 10 6)
              (|InputForm|) (|SingleInteger|) (|String|) (|Union| 6 '"failed"))
           '#(~= 55 |top| 61 |stack| 66 |size?| 71 |select| 77 |sample| 83
              |removeDuplicates| 87 |remove| 92 |reduce| 104 |push!| 125 |pop!|
              131 |parts| 136 |more?| 141 |members| 147 |member?| 152 |map!|
              158 |map| 164 |less?| 170 |latex| 176 |inspect| 181 |insert!| 186
              |hashUpdate!| 192 |hash| 198 |find| 203 |extract!| 209 |every?|
              214 |eval| 220 |eq?| 246 |empty?| 252 |empty| 257 |depth| 261
              |count| 266 |copy| 278 |convert| 283 |construct| 288 |coerce| 293
              |any?| 298 = 304 |#| 310)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 0 0 0 2 1 0 0 0 2 5 7 3))
                 (CONS
                  '#(NIL |BagAggregate&| |Collection&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL NIL)
                  (CONS
                   '#((|StackAggregate| 6) (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 21) (|ConvertibleTo| 48))
                   (|makeByteWordVec2| 51
                                       '(1 7 8 0 9 2 8 10 0 0 11 2 8 0 14 0 15
                                         1 7 0 8 16 2 8 0 14 0 18 2 7 8 0 8 19
                                         1 6 21 0 22 1 21 0 23 24 1 8 0 0 26 2
                                         8 41 41 0 42 2 11 10 0 0 1 1 0 6 0 34
                                         1 0 0 8 40 2 0 10 0 28 1 2 9 0 47 0 1
                                         0 0 0 1 1 10 0 0 1 2 10 0 6 0 1 2 9 0
                                         47 0 1 4 10 6 44 0 6 6 1 3 9 6 44 0 6
                                         1 2 9 6 44 0 1 2 0 6 6 0 36 1 0 6 0 32
                                         1 9 8 0 13 2 0 10 0 28 1 1 9 8 0 1 2
                                         10 10 6 0 1 2 8 0 14 0 20 2 0 0 14 0
                                         17 2 0 10 0 28 1 1 1 50 0 1 1 0 6 0 35
                                         2 0 0 6 0 37 2 1 41 41 0 43 1 1 49 0 1
                                         2 0 51 47 0 1 1 0 6 0 33 2 9 10 47 0 1
                                         3 2 0 0 8 8 1 3 2 0 0 6 6 1 2 2 0 0 45
                                         1 2 2 0 0 46 1 2 0 10 0 0 1 1 0 10 0
                                         31 0 0 0 38 1 0 28 0 29 2 10 28 6 0 1
                                         2 9 28 47 0 1 1 0 0 0 27 1 3 48 0 1 1
                                         0 0 8 39 1 6 21 0 25 2 9 10 47 0 1 2
                                         11 10 0 0 12 1 9 28 0 30)))))
           '|lookupComplete|)) 
