
(SDEFUN |HOAGG-;eval;ALA;1| ((|u| A) (|l| |List| (|Equation| S)) ($ A))
        (SPROG NIL
               (SPADCALL (CONS #'|HOAGG-;eval;ALA;1!0| (VECTOR $ |l|)) |u|
                         (QREFELT $ 11)))) 

(SDEFUN |HOAGG-;eval;ALA;1!0| ((|x| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |l| (QREFELT $ 9)))))) 

(SDEFUN |HOAGG-;#;ANni;2| ((|c| A) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |c| (QREFELT $ 14)))) 

(SDEFUN |HOAGG-;any?;MAB;3|
        ((|f| |Mapping| (|Boolean|) S) (|c| A) ($ |Boolean|))
        (SPROG ((#1=#:G122 NIL) (#2=#:G123 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |x| NIL) (LETT #2# (SPADCALL |c| (QREFELT $ 14)))
                       G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |x| |f|)
                           (PROGN (LETT #1# 'T) (GO #3=#:G121))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |HOAGG-;every?;MAB;4|
        ((|f| |Mapping| (|Boolean|) S) (|c| A) ($ |Boolean|))
        (SPROG ((#1=#:G128 NIL) (#2=#:G129 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |x| NIL) (LETT #2# (SPADCALL |c| (QREFELT $ 14)))
                       G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |x| |f|))
                           (PROGN (LETT #1# NIL) (GO #3=#:G127))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |HOAGG-;count;MANni;5|
        ((|f| |Mapping| (|Boolean|) S) (|c| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G131 NIL) (#2=#:G130 #3=(|NonNegativeInteger|)) (#4=#:G132 #3#)
          (#5=#:G134 NIL) (|x| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |x| NIL) (LETT #5# (SPADCALL |c| (QREFELT $ 14))) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL |x| |f|)
                    (PROGN
                     (LETT #4# 1)
                     (COND (#1# (LETT #2# (+ #2# #4#)))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T 0)))))) 

(SDEFUN |HOAGG-;members;AL;6| ((|x| A) ($ |List| S))
        (SPADCALL |x| (QREFELT $ 14))) 

(SDEFUN |HOAGG-;count;SANni;7| ((|e| S) (|c| A) ($ |NonNegativeInteger|))
        (SPROG NIL
               (SPADCALL (CONS #'|HOAGG-;count;SANni;7!0| (VECTOR $ |e|)) |c|
                         (QREFELT $ 24)))) 

(SDEFUN |HOAGG-;count;SANni;7!0| ((|x| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |e| |x| (QREFELT $ 23)))))) 

(SDEFUN |HOAGG-;member?;SAB;8| ((|e| S) (|c| A) ($ |Boolean|))
        (SPROG NIL
               (SPADCALL (CONS #'|HOAGG-;member?;SAB;8!0| (VECTOR $ |e|)) |c|
                         (QREFELT $ 26)))) 

(SDEFUN |HOAGG-;member?;SAB;8!0| ((|x| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |e| |x| (QREFELT $ 23)))))) 

(SDEFUN |HOAGG-;=;2AB;9| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G144 NIL) (#2=#:G145 NIL) (|a| NIL) (#3=#:G146 NIL) (|b| NIL))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL |x| (SPADCALL |y| (QREFELT $ 28)) (QREFELT $ 29)))
             NIL)
            ('T
             (SEQ
              (SEQ (LETT |b| NIL) (LETT #3# (SPADCALL |y| (QREFELT $ 14)))
                   (LETT |a| NIL) (LETT #2# (SPADCALL |x| (QREFELT $ 14))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#)) NIL) (ATOM #3#)
                         (PROGN (LETT |b| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |a| |b| (QREFELT $ 30))
                       (PROGN (LETT #1# NIL) (GO #4=#:G143))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT 'T)))))
          #4# (EXIT #1#)))) 

(SDEFUN |HOAGG-;coerce;AOf;10| ((|x| A) ($ |OutputForm|))
        (SPROG ((#1=#:G150 NIL) (|a| NIL) (#2=#:G149 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |a| NIL) (LETT #1# (SPADCALL |x| (QREFELT $ 14)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |a| (QREFELT $ 33)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 35))))) 

(DECLAIM (NOTINLINE |HomogeneousAggregate&;|)) 

(DEFUN |HomogeneousAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|HomogeneousAggregate&| DV$1 DV$2))
          (LETT $ (GETREFV 38))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))
                                              (|HasCategory| |#1|
                                                             '(|finiteAggregate|))
                                              (|HasCategory| |#1|
                                                             '(|shallowlyMutable|))
                                              (|HasCategory| |#2|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#2|)))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|))
                                              (|HasCategory| |#2|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))))))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 4)
            (QSETREFV $ 12 (CONS (|dispatchFunction| |HOAGG-;eval;ALA;1|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 16 (CONS (|dispatchFunction| |HOAGG-;#;ANni;2|) $))
             (QSETREFV $ 19 (CONS (|dispatchFunction| |HOAGG-;any?;MAB;3|) $))
             (QSETREFV $ 20
                       (CONS (|dispatchFunction| |HOAGG-;every?;MAB;4|) $))
             (QSETREFV $ 21
                       (CONS (|dispatchFunction| |HOAGG-;count;MANni;5|) $))
             (QSETREFV $ 22
                       (CONS (|dispatchFunction| |HOAGG-;members;AL;6|) $))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 25
                          (CONS (|dispatchFunction| |HOAGG-;count;SANni;7|) $))
                (QSETREFV $ 27
                          (CONS (|dispatchFunction| |HOAGG-;member?;SAB;8|) $))
                (QSETREFV $ 31
                          (CONS (|dispatchFunction| |HOAGG-;=;2AB;9|) $)))))
             (COND
              ((|testBitVector| |pv$| 6)
               (QSETREFV $ 36
                         (CONS (|dispatchFunction| |HOAGG-;coerce;AOf;10|)
                               $)))))))
          $))) 

(MAKEPROP '|HomogeneousAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 37)
              (0 . |eval|) (|Mapping| 7 7) (6 . |map|) (12 . |eval|) (|List| 7)
              (18 . |parts|) (|NonNegativeInteger|) (23 . |#|) (|Boolean|)
              (|Mapping| 17 7) (28 . |any?|) (34 . |every?|) (40 . |count|)
              (46 . |members|) (51 . =) (57 . |count|) (63 . |count|)
              (69 . |any?|) (75 . |member?|) (81 . |#|) (86 . |size?|)
              (92 . ~=) (98 . =) (|OutputForm|) (104 . |coerce|) (|List| $)
              (109 . |bracket|) (114 . |coerce|) (|Equation| 7))
           '#(|members| 119 |member?| 124 |every?| 130 |eval| 136 |count| 142
              |coerce| 154 |any?| 159 = 165 |#| 171)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 36
                                                 '(2 7 0 0 8 9 2 6 0 10 0 11 2
                                                   0 0 0 8 12 1 6 13 0 14 1 0
                                                   15 0 16 2 0 17 18 0 19 2 0
                                                   17 18 0 20 2 0 15 18 0 21 1
                                                   0 13 0 22 2 7 17 0 0 23 2 6
                                                   15 18 0 24 2 0 15 7 0 25 2 6
                                                   17 18 0 26 2 0 17 7 0 27 1 6
                                                   15 0 28 2 6 17 0 15 29 2 7
                                                   17 0 0 30 2 0 17 0 0 31 1 7
                                                   32 0 33 1 32 0 34 35 1 0 32
                                                   0 36 1 0 13 0 22 2 0 17 7 0
                                                   27 2 0 17 18 0 20 2 0 0 0 8
                                                   12 2 0 15 7 0 25 2 0 15 18 0
                                                   21 1 0 32 0 36 2 0 17 18 0
                                                   19 2 0 17 0 0 31 1 0 15 0
                                                   16)))))
           '|lookupComplete|)) 
