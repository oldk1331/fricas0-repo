
(/VERSIONCHECK 2) 

(DEFUN |HOAGG-;eval;ALA;1| (|u| |l| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|HOAGG-;eval;ALA;1!0| (VECTOR $ |l|)) |u|
               (QREFELT $ 11))))) 

(DEFUN |HOAGG-;eval;ALA;1!0| (|x| $$)
  (PROG (|l| $)
    (LETT |l| (QREFELT $$ 1) . #1=(|HOAGG-;eval;ALA;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |l| (QREFELT $ 9)))))) 

(DEFUN |HOAGG-;#;ANni;2| (|c| $) (LENGTH (SPADCALL |c| (QREFELT $ 14)))) 

(DEFUN |HOAGG-;any?;MAB;3| (|f| |c| $)
  (PROG (#1=#:G120 #2=#:G121 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |x| NIL . #3=(|HOAGG-;any?;MAB;3|))
             (LETT #2# (SPADCALL |c| (QREFELT $ 14)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |x| |f|) (PROGN (LETT #1# 'T . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |HOAGG-;every?;MAB;4| (|f| |c| $)
  (PROG (#1=#:G125 #2=#:G126 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |x| NIL . #3=(|HOAGG-;every?;MAB;4|))
             (LETT #2# (SPADCALL |c| (QREFELT $ 14)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((COND ((SPADCALL |x| |f|) 'NIL) ('T 'T))
                 (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |HOAGG-;count;MANni;5| (|f| |c| $)
  (PROG (#1=#:G128 #2=#:G127 #3=#:G129 #4=#:G131 |x|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|HOAGG-;count;MANni;5|))
       (SEQ (LETT |x| NIL . #5#) (LETT #4# (SPADCALL |c| (QREFELT $ 14)) . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL |x| |f|)
                (PROGN
                 (LETT #3# 1 . #5#)
                 (COND (#1# (LETT #2# (+ #2# #3#) . #5#))
                       ('T
                        (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T 0))))))) 

(DEFUN |HOAGG-;members;AL;6| (|x| $) (SPADCALL |x| (QREFELT $ 14))) 

(DEFUN |HOAGG-;count;SANni;7| (|s| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|HOAGG-;count;SANni;7!0| (VECTOR $ |s|)) |x|
               (QREFELT $ 24))))) 

(DEFUN |HOAGG-;count;SANni;7!0| (|y| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|HOAGG-;count;SANni;7|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |y| (QREFELT $ 23)))))) 

(DEFUN |HOAGG-;member?;SAB;8| (|e| |c| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|HOAGG-;member?;SAB;8!0| (VECTOR $ |e|)) |c|
               (QREFELT $ 26))))) 

(DEFUN |HOAGG-;member?;SAB;8!0| (|x| $$)
  (PROG (|e| $)
    (LETT |e| (QREFELT $$ 1) . #1=(|HOAGG-;member?;SAB;8|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |e| |x| (QREFELT $ 23)))))) 

(DEFUN |HOAGG-;=;2AB;9| (|x| |y| $)
  (PROG (#1=#:G140 #2=#:G141 |a| #3=#:G142 |b|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL (SPADCALL |x| (SPADCALL |y| (QREFELT $ 28)) (QREFELT $ 29)))
         'NIL)
        ('T
         (SEQ
          (SEQ (LETT |b| NIL . #4=(|HOAGG-;=;2AB;9|))
               (LETT #3# (SPADCALL |y| (QREFELT $ 14)) . #4#)
               (LETT |a| NIL . #4#)
               (LETT #2# (SPADCALL |x| (QREFELT $ 14)) . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #4#) NIL)
                     (ATOM #3#) (PROGN (LETT |b| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |a| |b| (QREFELT $ 30))
                   (PROGN (LETT #1# 'NIL . #4#) (GO #1#))))))
               (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT 'T)))))
      #1# (EXIT #1#))))) 

(DEFUN |HOAGG-;coerce;AOf;10| (|x| $)
  (PROG (#1=#:G147 |a| #2=#:G146)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL
        (PROGN
         (LETT #2# NIL . #3=(|HOAGG-;coerce;AOf;10|))
         (SEQ (LETT |a| NIL . #3#)
              (LETT #1# (SPADCALL |x| (QREFELT $ 14)) . #3#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #2# (CONS (SPADCALL |a| (QREFELT $ 33)) #2#) . #3#)))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        (QREFELT $ 35))
       (QREFELT $ 36)))))) 

(DECLAIM (NOTINLINE |HomogeneousAggregate&;|)) 

(DEFUN |HomogeneousAggregate&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|HomogeneousAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|HomogeneousAggregate&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 39) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2| '(|BasicType|))
                                          (|HasCategory| |#1|
                                                         '(|finiteAggregate|))
                                          (|HasCategory| |#1|
                                                         '(|shallowlyMutable|))
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|SetCategory|))
                                          (|HasCategory| |#2|
                                                         '(|CoercibleTo|
                                                           (|OutputForm|)))))
                      . #1#))
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
         (QSETREFV $ 20 (CONS (|dispatchFunction| |HOAGG-;every?;MAB;4|) $))
         (QSETREFV $ 21 (CONS (|dispatchFunction| |HOAGG-;count;MANni;5|) $))
         (QSETREFV $ 22 (CONS (|dispatchFunction| |HOAGG-;members;AL;6|) $))
         (COND
          ((|testBitVector| |pv$| 1)
           (PROGN
            (QSETREFV $ 25
                      (CONS (|dispatchFunction| |HOAGG-;count;SANni;7|) $))
            (QSETREFV $ 27
                      (CONS (|dispatchFunction| |HOAGG-;member?;SAB;8|) $))
            (QSETREFV $ 31 (CONS (|dispatchFunction| |HOAGG-;=;2AB;9|) $)))))
         (COND
          ((|testBitVector| |pv$| 6)
           (QSETREFV $ 37
                     (CONS (|dispatchFunction| |HOAGG-;coerce;AOf;10|) $)))))))
      $)))) 

(MAKEPROP '|HomogeneousAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 38)
              (0 . |eval|) (|Mapping| 7 7) (6 . |map|) (12 . |eval|) (|List| 7)
              (18 . |parts|) (|NonNegativeInteger|) (23 . |#|) (|Boolean|)
              (|Mapping| 17 7) (28 . |any?|) (34 . |every?|) (40 . |count|)
              (46 . |members|) (51 . =) (57 . |count|) (63 . |count|)
              (69 . |any?|) (75 . |member?|) (81 . |#|) (86 . |size?|)
              (92 . ~=) (98 . =) (|OutputForm|) (104 . |coerce|) (|List| $)
              (109 . |commaSeparate|) (114 . |bracket|) (119 . |coerce|)
              (|Equation| 7))
           '#(|members| 124 |member?| 129 |every?| 135 |eval| 141 |count| 147
              |coerce| 159 |any?| 164 = 170 |#| 176)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 37
                                                 '(2 7 0 0 8 9 2 6 0 10 0 11 2
                                                   0 0 0 8 12 1 6 13 0 14 1 0
                                                   15 0 16 2 0 17 18 0 19 2 0
                                                   17 18 0 20 2 0 15 18 0 21 1
                                                   0 13 0 22 2 7 17 0 0 23 2 6
                                                   15 18 0 24 2 0 15 7 0 25 2 6
                                                   17 18 0 26 2 0 17 7 0 27 1 6
                                                   15 0 28 2 6 17 0 15 29 2 7
                                                   17 0 0 30 2 0 17 0 0 31 1 7
                                                   32 0 33 1 32 0 34 35 1 32 0
                                                   0 36 1 0 32 0 37 1 0 13 0 22
                                                   2 0 17 7 0 27 2 0 17 18 0 20
                                                   2 0 0 0 8 12 2 0 15 7 0 25 2
                                                   0 15 18 0 21 1 0 32 0 37 2 0
                                                   17 18 0 19 2 0 17 0 0 31 1 0
                                                   15 0 16)))))
           '|lookupComplete|)) 
