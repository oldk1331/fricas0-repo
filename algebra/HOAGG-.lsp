
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
        (SPROG ((#1=#:G124 NIL) (#2=#:G125 NIL) (|x| NIL))
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
                           (PROGN (LETT #1# 'T) (GO #3=#:G123))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |HOAGG-;every?;MAB;4|
        ((|f| |Mapping| (|Boolean|) S) (|c| A) ($ |Boolean|))
        (SPROG ((#1=#:G130 NIL) (#2=#:G131 NIL) (|x| NIL))
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
                           (PROGN (LETT #1# NIL) (GO #3=#:G129))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |HOAGG-;count;MANni;5|
        ((|f| |Mapping| (|Boolean|) S) (|c| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G133 NIL) (#2=#:G132 #3=(|NonNegativeInteger|)) (#4=#:G134 #3#)
          (#5=#:G136 NIL) (|x| NIL))
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

(SDEFUN |HOAGG-;map1| ((|f| |Mapping| (|Void|) S) (|u| A) ($ |Void|))
        (SPROG ((#1=#:G140 NIL) (|x| NIL))
               (SEQ (LETT |x| NIL) (LETT #1# (SPADCALL |u| (QREFELT $ 14)))
                    G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (EXIT (SPADCALL |x| |f|))) (LETT #1# (CDR #1#))
                    (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |HOAGG-;max;MAS;8| ((|p| |Mapping| (|Boolean|) S S) (|u| A) ($ S))
        (SPROG
         ((#1=#:G142 NIL) (|f| (|Mapping| (|Void|) S))
          (|rr| (|Reference| (|Union| S #2="none"))))
         (SEQ
          (COND
           ((SPADCALL |u| (QREFELT $ 23)) (|error| "max of empty aggregate"))
           ('T
            (SEQ (LETT |rr| (SPADCALL (CONS 1 "none") (QREFELT $ 26)))
                 (LETT |f| (CONS #'|HOAGG-;max;MAS;8!0| (VECTOR |p| $ |rr|)))
                 (|HOAGG-;map1| |f| |u| $)
                 (EXIT
                  (PROG2 (LETT #1# (SPADCALL |rr| (QREFELT $ 27)))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                    (|Union| (QREFELT $ 7) #2#) #1#))))))))) 

(SDEFUN |HOAGG-;max;MAS;8!0| ((|s| NIL) ($$ NIL))
        (PROG (|rr| $ |p|)
          (LETT |rr| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|tu| NIL))
                   (SEQ (LETT |tu| (SPADCALL |rr| (QREFELT $ 27)))
                        (EXIT
                         (COND
                          ((OR (QEQCAR |tu| 1) (SPADCALL (QCDR |tu|) |s| |p|))
                           (SPADCALL |rr| (CONS 0 |s|) (QREFELT $ 28))))))))))) 

(SDEFUN |HOAGG-;min;AS;9| ((|u| A) ($ S))
        (SPADCALL (CONS #'|HOAGG-;min;AS;9!0| $) |u| (QREFELT $ 32))) 

(SDEFUN |HOAGG-;min;AS;9!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL |y| |x| (QREFELT $ 31))) 

(SDEFUN |HOAGG-;max;AS;10| ((|u| A) ($ S))
        (SPADCALL (ELT $ 31) |u| (QREFELT $ 32))) 

(SDEFUN |HOAGG-;count;SANni;11| ((|e| S) (|c| A) ($ |NonNegativeInteger|))
        (SPROG NIL
               (SPADCALL (CONS #'|HOAGG-;count;SANni;11!0| (VECTOR $ |e|)) |c|
                         (QREFELT $ 36)))) 

(SDEFUN |HOAGG-;count;SANni;11!0| ((|x| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |e| |x| (QREFELT $ 35)))))) 

(SDEFUN |HOAGG-;member?;SAB;12| ((|e| S) (|c| A) ($ |Boolean|))
        (SPROG NIL
               (SPADCALL (CONS #'|HOAGG-;member?;SAB;12!0| (VECTOR $ |e|)) |c|
                         (QREFELT $ 38)))) 

(SDEFUN |HOAGG-;member?;SAB;12!0| ((|x| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |e| |x| (QREFELT $ 35)))))) 

(SDEFUN |HOAGG-;=;2AB;13| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G166 NIL) (#2=#:G167 NIL) (|a| NIL) (#3=#:G168 NIL) (|b| NIL))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL |x| (SPADCALL |y| (QREFELT $ 40)) (QREFELT $ 41)))
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
                      ((SPADCALL |a| |b| (QREFELT $ 42))
                       (PROGN (LETT #1# NIL) (GO #4=#:G165))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT 'T)))))
          #4# (EXIT #1#)))) 

(SDEFUN |HOAGG-;coerce;AOf;14| ((|x| A) ($ |OutputForm|))
        (SPROG ((#1=#:G172 NIL) (|a| NIL) (#2=#:G171 NIL))
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
                         (LETT #2# (CONS (SPADCALL |a| (QREFELT $ 45)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 47))))) 

(DECLAIM (NOTINLINE |HomogeneousAggregate&;|)) 

(DEFUN |HomogeneousAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|HomogeneousAggregate&| DV$1 DV$2))
          (LETT $ (GETREFV 50))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))
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
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 12 (CONS (|dispatchFunction| |HOAGG-;eval;ALA;1|) $))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 16 (CONS (|dispatchFunction| |HOAGG-;#;ANni;2|) $))
             (QSETREFV $ 19 (CONS (|dispatchFunction| |HOAGG-;any?;MAB;3|) $))
             (QSETREFV $ 20
                       (CONS (|dispatchFunction| |HOAGG-;every?;MAB;4|) $))
             (QSETREFV $ 21
                       (CONS (|dispatchFunction| |HOAGG-;count;MANni;5|) $))
             (QSETREFV $ 22
                       (CONS (|dispatchFunction| |HOAGG-;members;AL;6|) $))
             (QSETREFV $ 30 (CONS (|dispatchFunction| |HOAGG-;max;MAS;8|) $))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 33 (CONS (|dispatchFunction| |HOAGG-;min;AS;9|) $))
                (QSETREFV $ 34
                          (CONS (|dispatchFunction| |HOAGG-;max;AS;10|) $)))))
             (COND
              ((|testBitVector| |pv$| 2)
               (PROGN
                (QSETREFV $ 37
                          (CONS (|dispatchFunction| |HOAGG-;count;SANni;11|)
                                $))
                (QSETREFV $ 39
                          (CONS (|dispatchFunction| |HOAGG-;member?;SAB;12|)
                                $))
                (QSETREFV $ 43
                          (CONS (|dispatchFunction| |HOAGG-;=;2AB;13|) $)))))
             (COND
              ((|testBitVector| |pv$| 7)
               (QSETREFV $ 48
                         (CONS (|dispatchFunction| |HOAGG-;coerce;AOf;14|)
                               $)))))))
          $))) 

(MAKEPROP '|HomogeneousAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 49)
              (0 . |eval|) (|Mapping| 7 7) (6 . |map|) (12 . |eval|) (|List| 7)
              (18 . |parts|) (|NonNegativeInteger|) (23 . |#|) (|Boolean|)
              (|Mapping| 17 7) (28 . |any?|) (34 . |every?|) (40 . |count|)
              (46 . |members|) (51 . |empty?|) (|Union| 7 '"none")
              (|Reference| 24) (56 . |ref|) (61 . |deref|) (66 . |setref|)
              (|Mapping| 17 7 7) (72 . |max|) (78 . <) (84 . |max|)
              (90 . |min|) (95 . |max|) (100 . =) (106 . |count|)
              (112 . |count|) (118 . |any?|) (124 . |member?|) (130 . |#|)
              (135 . |size?|) (141 . ~=) (147 . =) (|OutputForm|)
              (153 . |coerce|) (|List| $) (158 . |bracket|) (163 . |coerce|)
              (|Equation| 7))
           '#(|min| 168 |members| 173 |member?| 178 |max| 184 |every?| 195
              |eval| 201 |count| 207 |coerce| 219 |any?| 224 = 230 |#| 236)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|coerce| ((|OutputForm|) |#1|)) T)
                                   '((= ((|Boolean|) |#1| |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#2|) (|List| |#2|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#2| |#2|)) T)
                                   '((|eval| (|#1| |#1| (|Equation| |#2|))) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Equation| |#2|))))
                                     T)
                                   '((|member?| ((|Boolean|) |#2| |#1|)) T)
                                   '((|count|
                                      ((|NonNegativeInteger|) |#2| |#1|))
                                     T)
                                   '((|max| (|#2| |#1|)) T)
                                   '((|min| (|#2| |#1|)) T)
                                   '((|max|
                                      (|#2| (|Mapping| (|Boolean|) |#2| |#2|)
                                       |#1|))
                                     T)
                                   '((|members| ((|List| |#2|) |#1|)) T)
                                   '((|count|
                                      ((|NonNegativeInteger|)
                                       (|Mapping| (|Boolean|) |#2|) |#1|))
                                     T)
                                   '((|every?|
                                      ((|Boolean|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|any?|
                                      ((|Boolean|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|#| ((|NonNegativeInteger|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 48
                                            '(2 7 0 0 8 9 2 6 0 10 0 11 2 0 0 0
                                              8 12 1 6 13 0 14 1 0 15 0 16 2 0
                                              17 18 0 19 2 0 17 18 0 20 2 0 15
                                              18 0 21 1 0 13 0 22 1 6 17 0 23 1
                                              25 0 24 26 1 25 24 0 27 2 25 24 0
                                              24 28 2 0 7 29 0 30 2 7 17 0 0 31
                                              2 6 7 29 0 32 1 0 7 0 33 1 0 7 0
                                              34 2 7 17 0 0 35 2 6 15 18 0 36 2
                                              0 15 7 0 37 2 6 17 18 0 38 2 0 17
                                              7 0 39 1 6 15 0 40 2 6 17 0 15 41
                                              2 7 17 0 0 42 2 0 17 0 0 43 1 7
                                              44 0 45 1 44 0 46 47 1 0 44 0 48
                                              1 0 7 0 33 1 0 13 0 22 2 0 17 7 0
                                              39 1 0 7 0 34 2 0 7 29 0 30 2 0
                                              17 18 0 20 2 0 0 0 8 12 2 0 15 7
                                              0 37 2 0 15 18 0 21 1 0 44 0 48 2
                                              0 17 18 0 19 2 0 17 0 0 43 1 0 15
                                              0 16)))))
           '|lookupComplete|)) 
