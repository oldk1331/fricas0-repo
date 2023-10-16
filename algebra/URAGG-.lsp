
(SDEFUN |URAGG-;elt;AfirstS;1| ((|x| A) (T3 "first") ($ S))
        (SPADCALL |x| (QREFELT $ 8))) 

(SDEFUN |URAGG-;elt;AlastS;2| ((|x| A) (T4 "last") ($ S))
        (SPADCALL |x| (QREFELT $ 11))) 

(SDEFUN |URAGG-;elt;ArestA;3| ((|x| A) (T5 "rest") ($ A))
        (SPADCALL |x| (QREFELT $ 14))) 

(SDEFUN |URAGG-;second;AS;4| ((|x| A) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 8))) 

(SDEFUN |URAGG-;third;AS;5| ((|x| A) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 14))
                  (QREFELT $ 8))) 

(SDEFUN |URAGG-;cyclic?;AB;6| ((|x| A) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 20)) NIL)
              ('T (NULL (SPADCALL (|URAGG-;findCycle| |x| $) (QREFELT $ 20)))))) 

(SDEFUN |URAGG-;last;AS;7| ((|x| A) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 22)) (QREFELT $ 8))) 

(SDEFUN |URAGG-;nodes;AL;8| ((|x| A) ($ |List| A))
        (SPROG ((|l| (|List| A)))
               (SEQ (LETT |l| NIL)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |x| (QREFELT $ 20))))
                           (GO G191)))
                         (SEQ (LETT |l| (CONS |x| |l|))
                              (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 14)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |l|))))) 

(SDEFUN |URAGG-;children;AL;9| ((|x| A) ($ |List| A))
        (COND ((SPADCALL |x| (QREFELT $ 20)) NIL)
              ('T (LIST (SPADCALL |x| (QREFELT $ 14)))))) 

(SDEFUN |URAGG-;leaf?;AB;10| ((|x| A) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 20)) NIL)
              ('T (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 20))))) 

(SDEFUN |URAGG-;value;AS;11| ((|x| A) ($ S))
        (COND ((SPADCALL |x| (QREFELT $ 20)) (|error| "value of empty object"))
              ('T (SPADCALL |x| (QREFELT $ 8))))) 

(SDEFUN |URAGG-;less?;ANniB;12|
        ((|l| A) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((|i| (|Integer|)))
               (SEQ (LETT |i| |n|)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((SPADCALL |i| 0 (QREFELT $ 30))
                              (NULL (SPADCALL |l| (QREFELT $ 20))))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 14)))
                              (EXIT (LETT |i| (- |i| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |i| 0 (QREFELT $ 30)))))) 

(SDEFUN |URAGG-;more?;ANniB;13|
        ((|l| A) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((|i| (|Integer|)))
               (SEQ (LETT |i| |n|)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((SPADCALL |i| 0 (QREFELT $ 30))
                              (NULL (SPADCALL |l| (QREFELT $ 20))))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 14)))
                              (EXIT (LETT |i| (- |i| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((ZEROP |i|) (NULL (SPADCALL |l| (QREFELT $ 20))))
                           ('T NIL)))))) 

(SDEFUN |URAGG-;size?;ANniB;14|
        ((|l| A) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((|i| (|Integer|)))
               (SEQ (LETT |i| |n|)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL |l| (QREFELT $ 20)) NIL)
                                  ('T (SPADCALL |i| 0 (QREFELT $ 30)))))
                           (GO G191)))
                         (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 14)))
                              (EXIT (LETT |i| (- |i| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((SPADCALL |l| (QREFELT $ 20)) (ZEROP |i|))
                           ('T NIL)))))) 

(SDEFUN |URAGG-;#;ANni;15| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG ((|k| NIL))
               (SEQ
                (SEQ (LETT |k| 0) G190
                     (COND
                      ((NULL (NULL (SPADCALL |x| (QREFELT $ 20)))) (GO G191)))
                     (SEQ
                      (COND
                       ((EQL |k| 1000)
                        (COND
                         ((SPADCALL |x| (QREFELT $ 35))
                          (EXIT (|error| "cyclic list"))))))
                      (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 14)))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |k|)))) 

(SDEFUN |URAGG-;tail;2A;16| ((|x| A) ($ A))
        (SPROG ((|y| (A)) (|k| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 20)) (|error| "empty list"))
                      ('T
                       (SEQ (LETT |y| (SPADCALL |x| (QREFELT $ 14)))
                            (SEQ (LETT |k| 0) G190
                                 (COND
                                  ((NULL (NULL (SPADCALL |y| (QREFELT $ 20))))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   ((EQL |k| 1000)
                                    (COND
                                     ((SPADCALL |x| (QREFELT $ 35))
                                      (EXIT (|error| "cyclic list"))))))
                                  (EXIT
                                   (LETT |y|
                                         (SPADCALL (LETT |x| |y|)
                                                   (QREFELT $ 14)))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |x|))))))) 

(SDEFUN |URAGG-;findCycle| ((|x| A) ($ A))
        (SPROG ((|y| (A)) (#1=#:G214 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| (SPADCALL |x| (QREFELT $ 14)))
                      (SEQ G190
                           (COND
                            ((NULL (NULL (SPADCALL |y| (QREFELT $ 20))))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL |x| |y| (QREFELT $ 38))
                              (PROGN (LETT #1# |x|) (GO #2=#:G213))))
                            (LETT |x| (SPADCALL |x| (QREFELT $ 14)))
                            (LETT |y| (SPADCALL |y| (QREFELT $ 14)))
                            (COND
                             ((SPADCALL |y| (QREFELT $ 20))
                              (PROGN (LETT #1# |y|) (GO #2#))))
                            (COND
                             ((SPADCALL |x| |y| (QREFELT $ 38))
                              (PROGN (LETT #1# |y|) (GO #2#))))
                            (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 14)))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |y|)))
                #2# (EXIT #1#)))) 

(SDEFUN |URAGG-;cycleTail;2A;18| ((|x| A) ($ A))
        (SPROG ((|z| (A)) (|y| (A)))
               (SEQ
                (COND
                 ((SPADCALL (LETT |y| (LETT |x| (SPADCALL |x| (QREFELT $ 39))))
                            (QREFELT $ 20))
                  |x|)
                 ('T
                  (SEQ (LETT |z| (SPADCALL |x| (QREFELT $ 14)))
                       (SEQ G190
                            (COND
                             ((NULL (NULL (SPADCALL |x| |z| (QREFELT $ 38))))
                              (GO G191)))
                            (SEQ (LETT |y| |z|)
                                 (EXIT
                                  (LETT |z| (SPADCALL |z| (QREFELT $ 14)))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |y|))))))) 

(SDEFUN |URAGG-;cycleEntry;2A;19| ((|x| A) ($ A))
        (SPROG ((|y| (A)) (#1=#:G231 NIL) (|k| NIL) (|z| (A)) (|l| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 20)) |x|)
                      ((SPADCALL (LETT |y| (|URAGG-;findCycle| |x| $))
                                 (QREFELT $ 20))
                       |y|)
                      ('T
                       (SEQ (LETT |z| (SPADCALL |y| (QREFELT $ 14)))
                            (SEQ (LETT |l| 1) G190
                                 (COND
                                  ((NULL
                                    (NULL (SPADCALL |y| |z| (QREFELT $ 38))))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |z| (SPADCALL |z| (QREFELT $ 14)))))
                                 (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |y| |x|)
                            (SEQ (LETT |k| 1) (LETT #1# |l|) G190
                                 (COND ((|greater_SI| |k| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 14)))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL (SPADCALL |x| |y| (QREFELT $ 38))))
                                   (GO G191)))
                                 (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 14)))
                                      (EXIT
                                       (LETT |y|
                                             (SPADCALL |y| (QREFELT $ 14)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |x|))))))) 

(SDEFUN |URAGG-;cycleLength;ANni;20| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG ((|y| (A)) (|k| NIL))
               (SEQ
                (COND
                 ((OR (SPADCALL |x| (QREFELT $ 20))
                      (SPADCALL (LETT |x| (|URAGG-;findCycle| |x| $))
                                (QREFELT $ 20)))
                  0)
                 ('T
                  (SEQ (LETT |y| (SPADCALL |x| (QREFELT $ 14)))
                       (SEQ (LETT |k| 1) G190
                            (COND
                             ((NULL (NULL (SPADCALL |x| |y| (QREFELT $ 38))))
                              (GO G191)))
                            (SEQ
                             (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 14)))))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |k|))))))) 

(SDEFUN |URAGG-;rest;ANniA;21| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G242 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 20))
                         (|error| "Index out of range"))
                        ('T (LETT |x| (SPADCALL |x| (QREFELT $ 14)))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |URAGG-;last;ANniA;22| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G243 NIL) (|m| (|NonNegativeInteger|)))
               (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 44)))
                    (EXIT
                     (COND
                      ((SPADCALL |n| |m| (QREFELT $ 45))
                       (|error| "index out of range"))
                      ('T
                       (SPADCALL
                        (SPADCALL |x|
                                  (PROG1 (LETT #1# (- |m| |n|))
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 46))
                        (QREFELT $ 47)))))))) 

(SDEFUN |URAGG-;=;2AB;23| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG ((#1=#:G255 NIL) (|k| NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |x| |y| (QREFELT $ 38)) 'T)
                       (#2='T
                        (SEQ
                         (SEQ (LETT |k| 0) G190
                              (COND
                               ((NULL
                                 (COND ((SPADCALL |x| (QREFELT $ 20)) NIL)
                                       ('T
                                        (NULL (SPADCALL |y| (QREFELT $ 20))))))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((EQL |k| 1000)
                                 (COND
                                  ((SPADCALL |x| (QREFELT $ 35))
                                   (EXIT (|error| "cyclic list"))))))
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |x| (QREFELT $ 8))
                                            (SPADCALL |y| (QREFELT $ 8))
                                            (QREFELT $ 49))
                                  (PROGN (LETT #1# NIL) (GO #3=#:G254)))
                                 ('T
                                  (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 14)))
                                       (EXIT
                                        (LETT |y|
                                              (SPADCALL |y|
                                                        (QREFELT $ 14)))))))))
                              (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (COND
                           ((SPADCALL |x| (QREFELT $ 20))
                            (SPADCALL |y| (QREFELT $ 20)))
                           (#2# NIL)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |URAGG-;node?;2AB;24| ((|u| A) (|v| A) ($ |Boolean|))
        (SPROG ((#1=#:G263 NIL) (|k| NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |v| (QREFELT $ 20)) NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |k| 0) G190
                              (COND
                               ((NULL (NULL (SPADCALL |v| (QREFELT $ 20))))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |u| |v| (QREFELT $ 51))
                                  (PROGN (LETT #1# 'T) (GO #2=#:G262)))
                                 ('T
                                  (SEQ
                                   (COND
                                    ((EQL |k| 1000)
                                     (COND
                                      ((SPADCALL |v| (QREFELT $ 35))
                                       (EXIT (|error| "cyclic list"))))))
                                   (EXIT
                                    (LETT |v|
                                          (SPADCALL |v| (QREFELT $ 14)))))))))
                              (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (SPADCALL |u| |v| (QREFELT $ 51)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |URAGG-;setelt!;Afirst2S;25| ((|x| A) (T6 "first") (|a| S) ($ S))
        (SPADCALL |x| |a| (QREFELT $ 53))) 

(SDEFUN |URAGG-;setelt!;Alast2S;26| ((|x| A) (T7 "last") (|a| S) ($ S))
        (SPADCALL |x| |a| (QREFELT $ 55))) 

(SDEFUN |URAGG-;setelt!;Arest2A;27| ((|x| A) (T8 "rest") (|a| A) ($ A))
        (SPADCALL |x| |a| (QREFELT $ 57))) 

(SDEFUN |URAGG-;concat;3A;28| ((|x| A) (|y| A) ($ A))
        (SPADCALL (SPADCALL |x| (QREFELT $ 47)) |y| (QREFELT $ 59))) 

(SDEFUN |URAGG-;qsetfirst!;A2S;29| ((|x| A) (|a| S) ($ S))
        (SPADCALL |x| |a| (QREFELT $ 53))) 

(SDEFUN |URAGG-;qsetrest!;3A;30| ((|x| A) (|a| A) ($ A))
        (SPADCALL |x| |a| (QREFELT $ 57))) 

(SDEFUN |URAGG-;setlast!;A2S;31| ((|x| A) (|s| S) ($ S))
        (SEQ
         (COND ((SPADCALL |x| (QREFELT $ 20)) (|error| "setlast: empty list"))
               ('T
                (SEQ
                 (SPADCALL (SPADCALL |x| (QREFELT $ 22)) |s| (QREFELT $ 53))
                 (EXIT |s|)))))) 

(SDEFUN |URAGG-;setchildren!;ALA;32| ((|u| A) (|lv| |List| A) ($ A))
        (COND
         ((EQL (LENGTH |lv|) 1)
          (SPADCALL |u| (|SPADfirst| |lv|) (QREFELT $ 57)))
         ('T (|error| "wrong number of children specified")))) 

(SDEFUN |URAGG-;setvalue!;A2S;33| ((|u| A) (|s| S) ($ S))
        (SPADCALL |u| |s| (QREFELT $ 53))) 

(SDEFUN |URAGG-;split!;ANniA;34| ((|p| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((|q| (A)) (#1=#:G276 NIL))
               (SEQ
                (COND ((< |n| 1) (|error| "index out of range"))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL |p|
                                        (PROG1 (LETT #1# (- |n| 1))
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 46)))
                        (LETT |q| (SPADCALL |p| (QREFELT $ 14)))
                        (SPADCALL |p| (SPADCALL (QREFELT $ 66)) (QREFELT $ 57))
                        (EXIT |q|))))))) 

(SDEFUN |URAGG-;cycleSplit!;2A;35| ((|x| A) ($ A))
        (SPROG ((|z| (A)) (|y| (A)))
               (SEQ
                (COND
                 ((OR
                   (SPADCALL (LETT |y| (SPADCALL |x| (QREFELT $ 39)))
                             (QREFELT $ 20))
                   (SPADCALL |x| |y| (QREFELT $ 38)))
                  |y|)
                 ('T
                  (SEQ (LETT |z| (SPADCALL |x| (QREFELT $ 14)))
                       (SEQ G190
                            (COND
                             ((NULL (NULL (SPADCALL |z| |y| (QREFELT $ 38))))
                              (GO G191)))
                            (SEQ (LETT |x| |z|)
                                 (EXIT
                                  (LETT |z| (SPADCALL |z| (QREFELT $ 14)))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (SPADCALL |x| (SPADCALL (QREFELT $ 66)) (QREFELT $ 57))
                       (EXIT |y|))))))) 

(SDEFUN |URAGG-;map!;M2A;36| ((|f| |Mapping| S S) (|l| A) ($ A))
        (SPROG ((|y| (A)))
               (SEQ (LETT |y| |l|)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |l| (QREFELT $ 20))))
                           (GO G191)))
                         (SEQ
                          (SPADCALL |l|
                                    (SPADCALL (SPADCALL |l| (QREFELT $ 8)) |f|)
                                    (QREFELT $ 53))
                          (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 14)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |y|)))) 

(DECLAIM (NOTINLINE |UnaryRecursiveAggregate&;|)) 

(DEFUN |UnaryRecursiveAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|UnaryRecursiveAggregate&| DV$1 DV$2))
          (LETT $ (GETREFV 72))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|shallowlyMutable|))))))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (QSETREFV $ 48
                      (CONS (|dispatchFunction| |URAGG-;last;ANniA;22|) $))))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (COND
             ((|HasCategory| |#2| '(|BasicType|))
              (PROGN
               (QSETREFV $ 50 (CONS (|dispatchFunction| |URAGG-;=;2AB;23|) $))
               (QSETREFV $ 52
                         (CONS (|dispatchFunction| |URAGG-;node?;2AB;24|)
                               $)))))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 54
                       (CONS (|dispatchFunction| |URAGG-;setelt!;Afirst2S;25|)
                             $))
             (QSETREFV $ 56
                       (CONS (|dispatchFunction| |URAGG-;setelt!;Alast2S;26|)
                             $))
             (QSETREFV $ 58
                       (CONS (|dispatchFunction| |URAGG-;setelt!;Arest2A;27|)
                             $))
             (QSETREFV $ 60
                       (CONS (|dispatchFunction| |URAGG-;concat;3A;28|) $))
             (QSETREFV $ 61
                       (CONS (|dispatchFunction| |URAGG-;qsetfirst!;A2S;29|)
                             $))
             (QSETREFV $ 62
                       (CONS (|dispatchFunction| |URAGG-;qsetrest!;3A;30|) $))
             (QSETREFV $ 63
                       (CONS (|dispatchFunction| |URAGG-;setlast!;A2S;31|) $))
             (QSETREFV $ 64
                       (CONS (|dispatchFunction| |URAGG-;setchildren!;ALA;32|)
                             $))
             (QSETREFV $ 65
                       (CONS (|dispatchFunction| |URAGG-;setvalue!;A2S;33|) $))
             (QSETREFV $ 67
                       (CONS (|dispatchFunction| |URAGG-;split!;ANniA;34|) $))
             (QSETREFV $ 68
                       (CONS (|dispatchFunction| |URAGG-;cycleSplit!;2A;35|)
                             $))
             (QSETREFV $ 70
                       (CONS (|dispatchFunction| |URAGG-;map!;M2A;36|) $)))))
          $))) 

(MAKEPROP '|UnaryRecursiveAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |first|) '#1="first" |URAGG-;elt;AfirstS;1| (5 . |last|)
              '#2="last" |URAGG-;elt;AlastS;2| (10 . |rest|) '#3="rest"
              |URAGG-;elt;ArestA;3| |URAGG-;second;AS;4| |URAGG-;third;AS;5|
              (|Boolean|) (15 . |empty?|) |URAGG-;cyclic?;AB;6| (20 . |tail|)
              |URAGG-;last;AS;7| (|List| $) |URAGG-;nodes;AL;8|
              |URAGG-;children;AL;9| |URAGG-;leaf?;AB;10| |URAGG-;value;AS;11|
              (|Integer|) (25 . >) (|NonNegativeInteger|)
              |URAGG-;less?;ANniB;12| |URAGG-;more?;ANniB;13|
              |URAGG-;size?;ANniB;14| (31 . |cyclic?|) |URAGG-;#;ANni;15|
              |URAGG-;tail;2A;16| (36 . |eq?|) (42 . |cycleEntry|)
              |URAGG-;cycleTail;2A;18| |URAGG-;cycleEntry;2A;19|
              |URAGG-;cycleLength;ANni;20| |URAGG-;rest;ANniA;21| (47 . |#|)
              (52 . >) (58 . |rest|) (64 . |copy|) (69 . |last|) (75 . ~=)
              (81 . =) (87 . =) (93 . |node?|) (99 . |setfirst!|)
              (105 . |setelt!|) (112 . |setlast!|) (118 . |setelt!|)
              (125 . |setrest!|) (131 . |setelt!|) (138 . |concat!|)
              (144 . |concat|) (150 . |qsetfirst!|) (156 . |qsetrest!|)
              (162 . |setlast!|) (168 . |setchildren!|) (174 . |setvalue!|)
              (180 . |empty|) (184 . |split!|) (190 . |cycleSplit!|)
              (|Mapping| 7 7) (195 . |map!|) '#4="value")
           '#(|value| 201 |third| 206 |tail| 211 |split!| 216 |size?| 222
              |setvalue!| 228 |setlast!| 234 |setelt!| 240 |setchildren!| 261
              |second| 267 |rest| 272 |qsetrest!| 278 |qsetfirst!| 284 |nodes|
              290 |node?| 295 |more?| 301 |map!| 307 |less?| 313 |leaf?| 319
              |last| 324 |elt| 335 |cyclic?| 353 |cycleTail| 358 |cycleSplit!|
              363 |cycleLength| 368 |cycleEntry| 373 |concat| 378 |children|
              384 = 389 |#| 395)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|split!| (|#1| |#1| (|NonNegativeInteger|)))
                                T)
                              '((|setelt!| (|#2| |#1| "last" |#2|)) T)
                              '((|setlast!| (|#2| |#1| |#2|)) T)
                              '((|setelt!| (|#1| |#1| "rest" |#1|)) T)
                              '((|qsetrest!| (|#1| |#1| |#1|)) T)
                              '((|setelt!| (|#2| |#1| "first" |#2|)) T)
                              '((|qsetfirst!| (|#2| |#1| |#2|)) T)
                              '((|cycleSplit!| (|#1| |#1|)) T)
                              '((|cycleTail| (|#1| |#1|)) T)
                              '((|cycleLength| ((|NonNegativeInteger|) |#1|))
                                T)
                              '((|cycleEntry| (|#1| |#1|)) T)
                              '((|third| (|#2| |#1|)) T)
                              '((|second| (|#2| |#1|)) T)
                              '((|tail| (|#1| |#1|)) T)
                              '((|last| (|#1| |#1| (|NonNegativeInteger|))) T)
                              '((|elt| (|#2| |#1| #2#)) T)
                              '((|last| (|#2| |#1|)) T)
                              '((|rest| (|#1| |#1| (|NonNegativeInteger|))) T)
                              '((|elt| (|#1| |#1| #3#)) T)
                              '((|rest| (|#1| |#1|)) T)
                              '((|elt| (|#2| |#1| #1#)) T)
                              '((|concat| (|#1| |#2| |#1|)) T)
                              '((|concat| (|#1| |#1| |#1|)) T)
                              '((|setvalue!| (|#2| |#1| |#2|)) T)
                              '((|setelt!| (|#2| |#1| #4# |#2|)) T)
                              '((|setchildren!| (|#1| |#1| (|List| |#1|))) T)
                              '((|node?| ((|Boolean|) |#1| |#1|)) T)
                              '((|cyclic?| ((|Boolean|) |#1|)) T)
                              '((|elt| (|#2| |#1| #4#)) T)
                              '((|value| (|#2| |#1|)) T)
                              '((|leaf?| ((|Boolean|) |#1|)) T)
                              '((|nodes| ((|List| |#1|) |#1|)) T)
                              '((|children| ((|List| |#1|) |#1|)) T)
                              '((= ((|Boolean|) |#1| |#1|)) T)
                              '((|map!| (|#1| (|Mapping| |#2| |#2|) |#1|)) T)
                              '((|#| ((|NonNegativeInteger|) |#1|)) T)
                              '((|size?|
                                 ((|Boolean|) |#1| (|NonNegativeInteger|)))
                                T)
                              '((|more?|
                                 ((|Boolean|) |#1| (|NonNegativeInteger|)))
                                T)
                              '((|less?|
                                 ((|Boolean|) |#1| (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 70
                                            '(1 6 7 0 8 1 6 7 0 11 1 6 0 0 14 1
                                              6 19 0 20 1 6 0 0 22 2 29 19 0 0
                                              30 1 6 19 0 35 2 6 19 0 0 38 1 6
                                              0 0 39 1 6 31 0 44 2 31 19 0 0 45
                                              2 6 0 0 31 46 1 6 0 0 47 2 0 0 0
                                              31 48 2 7 19 0 0 49 2 0 19 0 0 50
                                              2 6 19 0 0 51 2 0 19 0 0 52 2 6 7
                                              0 7 53 3 0 7 0 9 7 54 2 6 7 0 7
                                              55 3 0 7 0 12 7 56 2 6 0 0 0 57 3
                                              0 0 0 15 0 58 2 6 0 0 0 59 2 0 0
                                              0 0 60 2 0 7 0 7 61 2 0 0 0 0 62
                                              2 0 7 0 7 63 2 0 0 0 24 64 2 0 7
                                              0 7 65 0 6 0 66 2 0 0 0 31 67 1 0
                                              0 0 68 2 0 0 69 0 70 1 0 7 0 28 1
                                              0 7 0 18 1 0 0 0 37 2 0 0 0 31 67
                                              2 0 19 0 31 34 2 0 7 0 7 65 2 0 7
                                              0 7 63 3 0 7 0 12 7 56 3 0 0 0 15
                                              0 58 3 0 7 0 9 7 54 2 0 0 0 24 64
                                              1 0 7 0 17 2 0 0 0 31 43 2 0 0 0
                                              0 62 2 0 7 0 7 61 1 0 24 0 25 2 0
                                              19 0 0 52 2 0 19 0 31 33 2 0 0 69
                                              0 70 2 0 19 0 31 32 1 0 19 0 27 2
                                              0 0 0 31 48 1 0 7 0 23 2 0 7 0 12
                                              13 2 0 0 0 15 16 2 0 7 0 9 10 1 0
                                              19 0 21 1 0 0 0 40 1 0 0 0 68 1 0
                                              31 0 42 1 0 0 0 41 2 0 0 0 0 60 1
                                              0 24 0 26 2 0 19 0 0 50 1 0 31 0
                                              36)))))
           '|lookupComplete|)) 
