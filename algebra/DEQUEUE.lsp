
(SDEFUN |DEQUEUE;bottom;%S;1| ((|d| (%)) (% (S)))
        (COND ((SPADCALL |d| (QREFELT % 9)) (|error| "empty dequeue"))
              ('T (SPADCALL (SPADCALL |d| (QREFELT % 11)) (QREFELT % 12))))) 

(SDEFUN |DEQUEUE;dequeue;L%;2| ((|d| (|List| S)) (% (%)))
        (SPADCALL |d| (QREFELT % 14))) 

(SDEFUN |DEQUEUE;extractBottom!;%S;3| ((|d| (%)) (% (S)))
        (SPROG
         ((|r| (S)) (|q| (|List| S)) (#1=#:G9 NIL) (|n| (|Integer|))
          (|p| (|List| S)))
         (SEQ (COND ((SPADCALL |d| (QREFELT % 9)) (|error| "empty dequeue")))
              (LETT |p| (SPADCALL |d| (QREFELT % 11))) (LETT |n| (LENGTH |p|))
              (EXIT
               (COND
                ((EQL |n| 1)
                 (SEQ (LETT |r| (|SPADfirst| |p|))
                      (SPADCALL |d| NIL (QREFELT % 16)) (EXIT |r|)))
                ('T
                 (SEQ
                  (LETT |q|
                        (SPADCALL |p|
                                  (PROG1 (LETT #1# (- |n| 2))
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT % 18)))
                  (LETT |r| (|SPADfirst| (CDR |q|)))
                  (SPADCALL |q| '|rest| NIL (QREFELT % 20)) (EXIT |r|)))))))) 

(SDEFUN |DEQUEUE;extractTop!;%S;4| ((|d| (%)) (% (S)))
        (SPROG ((|e| (S)))
               (SEQ (LETT |e| (SPADCALL |d| (QREFELT % 22)))
                    (SPADCALL |d| (CDR (SPADCALL |d| (QREFELT % 11)))
                              (QREFELT % 16))
                    (EXIT |e|)))) 

(SDEFUN |DEQUEUE;insertTop!;S%S;5| ((|e| (S)) (|d| (%)) (% (S)))
        (SEQ
         (SPADCALL |d| (CONS |e| (SPADCALL |d| (QREFELT % 11))) (QREFELT % 16))
         (EXIT |e|))) 

(SDEFUN |DEQUEUE;insertBottom!;S%S;6| ((|e| (S)) (|d| (%)) (% (S)))
        (SEQ
         (COND
          ((SPADCALL |d| (QREFELT % 9))
           (SPADCALL |d| (SPADCALL |e| (QREFELT % 25)) (QREFELT % 16)))
          ('T
           (SPADCALL (LAST (SPADCALL |d| (QREFELT % 11))) '|rest|
                     (SPADCALL |e| (QREFELT % 25)) (QREFELT % 20))))
         (EXIT |e|))) 

(SDEFUN |DEQUEUE;top;%S;7| ((|d| (%)) (% (S)))
        (COND ((SPADCALL |d| (QREFELT % 9)) (|error| "empty dequeue"))
              ('T (|SPADfirst| (SPADCALL |d| (QREFELT % 11)))))) 

(SDEFUN |DEQUEUE;reverse!;2%;8| ((|d| (%)) (% (%)))
        (SEQ
         (SPADCALL |d| (REVERSE (SPADCALL |d| (QREFELT % 11))) (QREFELT % 16))
         (EXIT |d|))) 

(SDEFUN |DEQUEUE;pop!;%S;9| ((|d| (%)) (% (S))) (SPADCALL |d| (QREFELT % 23))) 

(SDEFUN |DEQUEUE;push!;S%S;10| ((|e| (S)) (|d| (%)) (% (S)))
        (SPADCALL |e| |d| (QREFELT % 24))) 

(DECLAIM (NOTINLINE |Dequeue;|)) 

(DEFUN |Dequeue| (#1=#:G37)
  (SPROG NIL
         (PROG (#2=#:G38)
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
   ((#1=#:G36 NIL) (|pv$| NIL) (#2=#:G33 NIL) (#3=#:G34 NIL) (#4=#:G35 NIL)
    (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Dequeue| DV$1))
    (LETT % (GETREFV 42))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
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
                                             #4#))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #2#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            #4#)))))
    (|haddProp| |$ConstructorCache| '|Dequeue| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 512))
    (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 1024))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1# (|augmentPredVector| % 2048))
    (AND #2# #1# (|augmentPredVector| % 4096))
    (AND (OR (AND #2# #1#) (|HasCategory| |#1| '(|Hashable|)) #4#)
         (|augmentPredVector| % 8192))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Reference| (|List| |#1|)))
    %))) 

(MAKEPROP '|Dequeue| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Queue| 6) (|local| |#1|) '|Rep| (|Boolean|)
              (0 . |empty?|) (|List| 6) (5 . |deref|) (10 . |last|)
              |DEQUEUE;bottom;%S;1| (15 . |construct|) |DEQUEUE;dequeue;L%;2|
              (20 . |setref|) (|NonNegativeInteger|) (26 . |rest|) '"rest"
              (32 . |setelt!|) |DEQUEUE;extractBottom!;%S;3| |DEQUEUE;top;%S;7|
              |DEQUEUE;extractTop!;%S;4| |DEQUEUE;insertTop!;S%S;5|
              (39 . |list|) |DEQUEUE;insertBottom!;S%S;6|
              |DEQUEUE;reverse!;2%;8| |DEQUEUE;pop!;%S;9|
              |DEQUEUE;push!;S%S;10| (|Mapping| 6 6) (|Union| 6 '"failed")
              (|Mapping| 8 6) (|Mapping| 6 6 6) (|Equation| 6) (|List| 34)
              (|Mapping| 8 6 6) (|OutputForm|) (|InputForm|) (|HashState|)
              (|SingleInteger|) (|String|))
           '#(~= 44 |top| 50 |size?| 55 |select| 61 |sample| 67 |rotate!| 71
              |reverse!| 76 |removeDuplicates| 81 |remove| 86 |reduce| 98
              |push!| 119 |pop!| 125 |parts| 130 |more?| 135 |min| 141
              |members| 146 |member?| 151 |max| 157 |map!| 168 |map| 174
              |less?| 180 |latex| 186 |inspect| 191 |insertTop!| 196
              |insertBottom!| 202 |insert!| 208 |hashUpdate!| 214 |hash| 220
              |front| 225 |find| 230 |extractTop!| 236 |extractBottom!| 241
              |extract!| 246 |every?| 251 |eval| 257 |eq?| 283 |enqueue!| 289
              |empty?| 295 |empty| 300 |dequeue!| 304 |dequeue| 309 |count| 314
              |copy| 326 |convert| 331 |construct| 336 |coerce| 341 |bottom|
              346 |back| 351 |any?| 356 = 362 |#| 368)
           'NIL
           (CONS (|makeByteWordVec2| 9 '(0 0 0 0 0 0 4 1 2 0 9 3 7 2 0 0 0))
                 (CONS
                  '#(NIL NIL NIL |BagAggregate&| |Collection&|
                     |HomogeneousAggregate&| |Hashable&| |SetCategory&|
                     |Evalable&| |Aggregate&| |BasicType&| NIL NIL
                     |InnerEvalable&| NIL NIL NIL)
                  (CONS
                   '#((|DequeueAggregate| 6) (|QueueAggregate| 6)
                      (|StackAggregate| 6) (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                      (|Evalable| 6) (|Aggregate|) (|BasicType|)
                      (|ConvertibleTo| 38) (|CoercibleTo| 37)
                      (|InnerEvalable| 6 6) (|shallowlyMutable|)
                      (|finiteAggregate|) (|Type|))
                   (|makeByteWordVec2| 41
                                       '(1 0 8 0 9 1 7 10 0 11 1 10 6 0 12 1 0
                                         0 10 14 2 7 10 0 10 16 2 10 0 0 17 18
                                         3 10 0 0 19 0 20 1 10 0 6 25 2 14 8 0
                                         0 1 1 0 6 0 22 2 0 8 0 17 1 2 11 0 32
                                         0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 27 1 13
                                         0 0 1 2 13 0 6 0 1 2 11 0 32 0 1 4 13
                                         6 33 0 6 6 1 2 11 6 33 0 1 3 11 6 33 0
                                         6 1 2 0 6 6 0 29 1 0 6 0 28 1 11 10 0
                                         1 2 0 8 0 17 1 1 12 6 0 1 1 11 10 0 1
                                         2 13 8 6 0 1 1 12 6 0 1 2 11 6 36 0 1
                                         2 10 0 30 0 1 2 0 0 30 0 1 2 0 8 0 17
                                         1 1 1 41 0 1 1 0 6 0 1 2 0 6 6 0 24 2
                                         0 6 6 0 26 2 0 0 6 0 1 2 4 39 39 0 1 1
                                         4 40 0 1 1 0 6 0 1 2 0 31 32 0 1 1 0 6
                                         0 23 1 0 6 0 21 1 0 6 0 1 2 11 8 32 0
                                         1 2 2 0 0 34 1 2 2 0 0 35 1 3 2 0 0 10
                                         10 1 3 2 0 0 6 6 1 2 0 8 0 0 1 2 0 6 6
                                         0 1 1 0 8 0 9 0 0 0 1 1 0 6 0 1 1 0 0
                                         10 15 2 13 17 6 0 1 2 11 17 32 0 1 1 0
                                         0 0 1 1 3 38 0 1 1 0 0 10 14 1 6 37 0
                                         1 1 0 6 0 13 1 0 6 0 1 2 11 8 32 0 1 2
                                         14 8 0 0 1 1 11 17 0 1)))))
           '|lookupComplete|)) 
