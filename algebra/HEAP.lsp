
(SDEFUN |HEAP;empty;$;1| (($ $)) (SPADCALL (QREFELT $ 8))) 

(SDEFUN |HEAP;heap;L$;2| ((|l| |List| S) ($ $)) (SPADCALL |l| (QREFELT $ 11))) 

(SDEFUN |HEAP;siftUp| ((|r| $) (|i| |Integer|) (|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G117 NIL) (|j| #2=(|Integer|)) (|k| #2#) (|t| (S)))
               (SEQ (LETT |t| (SPADCALL |r| |i| (QREFELT $ 14)))
                    (EXIT
                     (SEQ
                      (EXIT
                       (SEQ G190
                            (COND
                             ((NULL
                               (<
                                (LETT |j|
                                      (+ (SPADCALL 2 |i| (QREFELT $ 16)) 1))
                                |n|))
                              (GO G191)))
                            (SEQ
                             (SEQ (LETT |k| (+ |j| 1))
                                  (EXIT
                                   (COND
                                    ((< |k| |n|)
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |r| |j| (QREFELT $ 14))
                                        (SPADCALL |r| |k| (QREFELT $ 14))
                                        (QREFELT $ 18))
                                       (LETT |j| |k|)))))))
                             (EXIT
                              (COND
                               ((SPADCALL |t| (SPADCALL |r| |j| (QREFELT $ 14))
                                          (QREFELT $ 18))
                                (SEQ
                                 (SPADCALL |r| |i|
                                           (SPADCALL |r| |j| (QREFELT $ 14))
                                           (QREFELT $ 19))
                                 (SPADCALL |r| |j| |t| (QREFELT $ 19))
                                 (EXIT (LETT |i| |j|))))
                               ('T
                                (PROGN
                                 (LETT #1# |$NoValue|)
                                 (GO #3=#:G114))))))
                            NIL (GO G190) G191 (EXIT NIL)))
                      #3# (EXIT #1#)))))) 

(SDEFUN |HEAP;extract!;$S;4| ((|r| $) ($ S))
        (SPROG ((|t| (S)) (|n| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 21)))
                    (EXIT
                     (COND ((EQL |n| 0) (|error| "empty heap"))
                           (#1='T
                            (SEQ (LETT |t| (SPADCALL |r| 0 (QREFELT $ 14)))
                                 (SPADCALL |r| 0
                                           (SPADCALL |r| (- |n| 1)
                                                     (QREFELT $ 14))
                                           (QREFELT $ 19))
                                 (SPADCALL |r| (- |n| 1) (QREFELT $ 22))
                                 (EXIT
                                  (COND ((EQL |n| 1) |t|)
                                        (#1#
                                         (SEQ (|HEAP;siftUp| |r| 0 (- |n| 1) $)
                                              (EXIT |t|)))))))))))) 

(SDEFUN |HEAP;insert!;S2$;5| ((|x| S) (|r| $) ($ $))
        (SPROG ((|j| (|Integer|)) (#1=#:G127 NIL) (|i| (|Integer|)))
               (SEQ (LETT |j| (SPADCALL |r| (QREFELT $ 21)))
                    (LETT |r| (SPADCALL |r| |x| (QREFELT $ 24)))
                    (SEQ
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |j| 0 (QREFELT $ 25))) (GO G191)))
                           (SEQ (LETT |i| (QUOTIENT2 (- |j| 1) 2))
                                (COND
                                 ((SPADCALL (SPADCALL |r| |i| (QREFELT $ 14))
                                            |x| (QREFELT $ 26))
                                  (PROGN
                                   (LETT #1# |$NoValue|)
                                   (GO #2=#:G124))))
                                (SPADCALL |r| |j|
                                          (SPADCALL |r| |i| (QREFELT $ 14))
                                          (QREFELT $ 19))
                                (EXIT (LETT |j| |i|)))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #2# (EXIT #1#))
                    (SPADCALL |r| |j| |x| (QREFELT $ 19)) (EXIT |r|)))) 

(SDEFUN |HEAP;max;$S;6| ((|r| $) ($ S))
        (COND ((EQL (SPADCALL |r| (QREFELT $ 21)) 0) (|error| "empty heap"))
              ('T (SPADCALL |r| 0 (QREFELT $ 14))))) 

(SDEFUN |HEAP;inspect;$S;7| ((|r| $) ($ S)) (SPADCALL |r| (QREFELT $ 28))) 

(SDEFUN |HEAP;makeHeap| ((|r| $) ($ $))
        (SPROG ((|k| NIL) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 21)))
                    (SEQ (LETT |k| (- (QUOTIENT2 |n| 2) 1)) G190
                         (COND ((< |k| 0) (GO G191)))
                         (SEQ (EXIT (|HEAP;siftUp| |r| |k| |n| $)))
                         (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |r|)))) 

(SDEFUN |HEAP;construct;L$;9| ((|l| |List| S) ($ $))
        (|HEAP;makeHeap| (SPADCALL |l| (QREFELT $ 30)) $)) 

(SDEFUN |HEAP;merge;3$;10| ((|a| $) (|b| $) ($ $))
        (|HEAP;makeHeap| (SPADCALL |a| |b| (QREFELT $ 31)) $)) 

(SDEFUN |HEAP;merge!;3$;11| ((|a| $) (|b| $) ($ $))
        (|HEAP;makeHeap| (SPADCALL |a| |b| (QREFELT $ 33)) $)) 

(DECLAIM (NOTINLINE |Heap;|)) 

(DEFUN |Heap| (#1=#:G149)
  (SPROG NIL
         (PROG (#2=#:G150)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Heap|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Heap;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Heap|)))))))))) 

(DEFUN |Heap;| (|#1|)
  (SPROG
   ((#1=#:G147 NIL) (#2=#:G148 NIL) (|pv$| NIL) (#3=#:G144 NIL) (#4=#:G145 NIL)
    (#5=#:G146 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Heap| DV$1))
    (LETT $ (GETREFV 47))
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
    (|haddProp| |$ConstructorCache| '|Heap| (LIST DV$1) (CONS 1 $))
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
    (QSETREFV $ 7 (|IndexedFlexibleArray| |#1| 0))
    $))) 

(MAKEPROP '|Heap| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedFlexibleArray| 6 (NRTEVAL 0))
              (|local| |#1|) '|Rep| (0 . |empty|) |HEAP;empty;$;1| (|List| 6)
              |HEAP;construct;L$;9| |HEAP;heap;L$;2| (|Integer|) (4 . |elt|)
              (|PositiveInteger|) (10 . *) (|Boolean|) (16 . <)
              (22 . |setelt!|) (|NonNegativeInteger|) (29 . |#|)
              (34 . |delete!|) |HEAP;extract!;$S;4| (40 . |concat!|) (46 . >)
              (52 . >=) |HEAP;insert!;S2$;5| |HEAP;max;$S;6|
              |HEAP;inspect;$S;7| (58 . |construct|) (63 . |concat|)
              |HEAP;merge;3$;10| (69 . |concat!|) |HEAP;merge!;3$;11|
              (|Mapping| 6 6 6) (|Equation| 6) (|List| 36) (|Mapping| 17 6)
              (|Mapping| 17 6 6) (|Mapping| 6 6) (|OutputForm|) (|InputForm|)
              (|SingleInteger|) (|String|) (|HashState|) (|Union| 6 '"failed"))
           '#(~= 75 |size?| 81 |select| 87 |sample| 93 |removeDuplicates| 97
              |remove| 102 |reduce| 114 |parts| 135 |more?| 140 |min| 146
              |merge!| 151 |merge| 157 |members| 163 |member?| 168 |max| 174
              |map!| 185 |map| 191 |less?| 197 |latex| 203 |inspect| 208
              |insert!| 213 |heap| 219 |hashUpdate!| 224 |hash| 230 |find| 235
              |extract!| 241 |every?| 246 |eval| 252 |eq?| 278 |empty?| 284
              |empty| 289 |count| 293 |copy| 305 |convert| 310 |construct| 315
              |coerce| 320 |any?| 325 = 331 |#| 337)
           'NIL
           (CONS (|makeByteWordVec2| 8 '(0 0 0 0 0 2 1 0 0 0 2 6 8 3))
                 (CONS
                  '#(NIL |BagAggregate&| |Collection&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL NIL)
                  (CONS
                   '#((|PriorityQueueAggregate| 6) (|BagAggregate| 6)
                      (|Collection| 6) (|HomogeneousAggregate| 6) (|Aggregate|)
                      (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 41)
                      (|ConvertibleTo| 42))
                   (|makeByteWordVec2| 46
                                       '(0 7 0 8 2 7 6 0 13 14 2 13 0 15 0 16 2
                                         6 17 0 0 18 3 7 6 0 13 6 19 1 0 20 0
                                         21 2 7 0 0 13 22 2 7 0 0 6 24 2 13 17
                                         0 0 25 2 6 17 0 0 26 1 7 0 10 30 2 7 0
                                         0 0 31 2 7 0 0 0 33 2 13 17 0 0 1 2 0
                                         17 0 20 1 2 10 0 38 0 1 0 0 0 1 1 12 0
                                         0 1 2 12 0 6 0 1 2 10 0 38 0 1 4 12 6
                                         35 0 6 6 1 3 10 6 35 0 6 1 2 10 6 35 0
                                         1 1 10 10 0 1 2 0 17 0 20 1 1 11 6 0 1
                                         2 0 0 0 0 34 2 0 0 0 0 32 1 10 10 0 1
                                         2 12 17 6 0 1 2 10 6 39 0 1 1 0 6 0 28
                                         2 9 0 40 0 1 2 0 0 40 0 1 2 0 17 0 20
                                         1 1 1 44 0 1 1 0 6 0 29 2 0 0 6 0 27 1
                                         0 0 10 12 2 1 45 45 0 1 1 1 43 0 1 2 0
                                         46 38 0 1 1 0 6 0 23 2 10 17 38 0 1 3
                                         2 0 0 10 10 1 2 2 0 0 36 1 3 2 0 0 6 6
                                         1 2 2 0 0 37 1 2 0 17 0 0 1 1 0 17 0 1
                                         0 0 0 9 2 12 20 6 0 1 2 10 20 38 0 1 1
                                         0 0 0 1 1 3 42 0 1 1 0 0 10 11 1 7 41
                                         0 1 2 10 17 38 0 1 2 13 17 0 0 1 1 10
                                         20 0 21)))))
           '|lookupComplete|)) 
