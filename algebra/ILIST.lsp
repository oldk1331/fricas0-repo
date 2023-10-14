
(PUT '|ILIST;#;$Nni;1| '|SPADreplace| 'LENGTH) 

(SDEFUN |ILIST;#;$Nni;1| ((|x| $) ($ |NonNegativeInteger|)) (LENGTH |x|)) 

(PUT '|ILIST;concat;S2$;2| '|SPADreplace| 'CONS) 

(SDEFUN |ILIST;concat;S2$;2| ((|s| S) (|x| $) ($ $)) (CONS |s| |x|)) 

(PUT '|ILIST;eq?;2$B;3| '|SPADreplace| 'EQ) 

(SDEFUN |ILIST;eq?;2$B;3| ((|x| $) (|y| $) ($ |Boolean|)) (EQ |x| |y|)) 

(PUT '|ILIST;first;$S;4| '|SPADreplace| '|SPADfirst|) 

(SDEFUN |ILIST;first;$S;4| ((|x| $) ($ S)) (|SPADfirst| |x|)) 

(PUT '|ILIST;elt;$firstS;5| '|SPADreplace|
     '(XLAM (|x| "first") (|SPADfirst| |x|))) 

(SDEFUN |ILIST;elt;$firstS;5| ((|x| $) (T3 "first") ($ S)) (|SPADfirst| |x|)) 

(PUT '|ILIST;empty;$;6| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |ILIST;empty;$;6| (($ $)) NIL) 

(PUT '|ILIST;empty?;$B;7| '|SPADreplace| 'NULL) 

(SDEFUN |ILIST;empty?;$B;7| ((|x| $) ($ |Boolean|)) (NULL |x|)) 

(PUT '|ILIST;rest;2$;8| '|SPADreplace| 'CDR) 

(SDEFUN |ILIST;rest;2$;8| ((|x| $) ($ $)) (CDR |x|)) 

(PUT '|ILIST;elt;$rest$;9| '|SPADreplace| '(XLAM (|x| "rest") (CDR |x|))) 

(SDEFUN |ILIST;elt;$rest$;9| ((|x| $) (T4 "rest") ($ $)) (CDR |x|)) 

(SDEFUN |ILIST;setfirst!;$2S;10| ((|x| $) (|s| S) ($ S))
        (COND
         ((SPADCALL |x| (QREFELT $ 17))
          (|error| "Cannot update an empty list"))
         ('T (QCAR (RPLACA |x| |s|))))) 

(PUT '|ILIST;qsetfirst!;$2S;11| '|SPADreplace| '|qset_first|) 

(SDEFUN |ILIST;qsetfirst!;$2S;11| ((|x| $) (|s| S) ($ S))
        (|qset_first| |x| |s|)) 

(SDEFUN |ILIST;setelt!;$first2S;12| ((|x| $) (T11 "first") (|s| S) ($ S))
        (COND
         ((SPADCALL |x| (QREFELT $ 17))
          (|error| "Cannot update an empty list"))
         ('T (QCAR (RPLACA |x| |s|))))) 

(SDEFUN |ILIST;setrest!;3$;13| ((|x| $) (|y| $) ($ $))
        (COND
         ((SPADCALL |x| (QREFELT $ 17))
          (|error| "Cannot update an empty list"))
         ('T (QCDR (RPLACD |x| |y|))))) 

(PUT '|ILIST;qsetrest!;3$;14| '|SPADreplace| '|qset_rest|) 

(SDEFUN |ILIST;qsetrest!;3$;14| ((|x| $) (|y| $) ($ $)) (|qset_rest| |x| |y|)) 

(SDEFUN |ILIST;setelt!;$rest2$;15| ((|x| $) (T12 "rest") (|y| $) ($ $))
        (COND
         ((SPADCALL |x| (QREFELT $ 17))
          (|error| "Cannot update an empty list"))
         ('T (QCDR (RPLACD |x| |y|))))) 

(PUT '|ILIST;construct;L$;16| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |ILIST;construct;L$;16| ((|l| |List| S) ($ $)) |l|) 

(PUT '|ILIST;parts;$L;17| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |ILIST;parts;$L;17| ((|s| $) ($ |List| S)) |s|) 

(PUT '|ILIST;reverse!;2$;18| '|SPADreplace| 'NREVERSE) 

(SDEFUN |ILIST;reverse!;2$;18| ((|x| $) ($ $)) (NREVERSE |x|)) 

(PUT '|ILIST;reverse;2$;19| '|SPADreplace| 'REVERSE) 

(SDEFUN |ILIST;reverse;2$;19| ((|x| $) ($ $)) (REVERSE |x|)) 

(SDEFUN |ILIST;minIndex;$I;20| ((|x| $) ($ |Integer|)) (QREFELT $ 7)) 

(SDEFUN |ILIST;rest;$Nni$;21| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G1009 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1 . #2=(|ILIST;rest;$Nni$;21|))
                     (LETT #1# |n| . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (COND ((NULL |x|) (|error| "index out of range")))
                          (EXIT (LETT |x| (QCDR |x|) . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |ILIST;copy;2$;22| ((|x| $) ($ $))
        (SPROG ((|y| ($)) (|i| NIL))
               (SEQ
                (LETT |y| (SPADCALL (QREFELT $ 16)) . #1=(|ILIST;copy;2$;22|))
                (SEQ (LETT |i| 0 . #1#) G190
                     (COND ((NULL (COND ((NULL |x|) 'NIL) ('T 'T))) (GO G191)))
                     (SEQ
                      (COND
                       ((EQ |i| 1000)
                        (COND
                         ((SPADCALL |x| (QREFELT $ 35))
                          (|error| "cyclic list")))))
                      (LETT |y| (CONS (QCAR |x|) |y|) . #1#)
                      (EXIT (LETT |x| (QCDR |x|) . #1#)))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |y|))))) 

(SDEFUN |ILIST;coerce;$Of;23| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|z| (|List| (|OutputForm|))) (|y| (|List| (|OutputForm|)))
          (|s| ($)))
         (SEQ (LETT |y| NIL . #1=(|ILIST;coerce;$Of;23|))
              (LETT |s| (SPADCALL |x| (QREFELT $ 37)) . #1#)
              (SEQ G190
                   (COND ((NULL (COND ((EQ |x| |s|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ
                    (LETT |y|
                          (CONS
                           (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                     (QREFELT $ 39))
                           |y|)
                          . #1#)
                    (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 18)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |y| (NREVERSE |y|) . #1#)
              (EXIT
               (COND
                ((SPADCALL |s| (QREFELT $ 17)) (SPADCALL |y| (QREFELT $ 41)))
                ('T
                 (SEQ
                  (LETT |z|
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                   (QREFELT $ 39))
                         (QREFELT $ 43))
                        . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((EQ |s| (SPADCALL |x| (QREFELT $ 18))) 'NIL)
                                ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 18)) . #1#)
                            (EXIT
                             (LETT |z|
                                   (CONS
                                    (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                              (QREFELT $ 39))
                                    |z|)
                                   . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL
                    (SPADCALL |y|
                              (SPADCALL
                               (SPADCALL (NREVERSE |z|) (QREFELT $ 44))
                               (QREFELT $ 45))
                              (QREFELT $ 46))
                    (QREFELT $ 41)))))))))) 

(SDEFUN |ILIST;=;2$B;24| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G1035 NIL))
               (SEQ
                (EXIT
                 (COND ((EQ |x| |y|) 'T)
                       (#2='T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND ((OR (NULL |x|) (NULL |y|)) 'NIL)
                                       ('T 'T)))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (QCAR |x|) (QCAR |y|)
                                            (QREFELT $ 48))
                                  (PROGN
                                   (LETT #1# 'NIL . #3=(|ILIST;=;2$B;24|))
                                   (GO #4=#:G1034)))
                                 ('T
                                  (SEQ (LETT |x| (QCDR |x|) . #3#)
                                       (EXIT (LETT |y| (QCDR |y|) . #3#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (COND ((NULL |x|) (NULL |y|)) (#2# 'NIL)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |ILIST;member?;S$B;25| ((|s| S) (|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G1041 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL (COND ((NULL |x|) 'NIL) ('T 'T))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |s| (QCAR |x|) (QREFELT $ 50))
                           (PROGN
                            (LETT #1# 'T . #2=(|ILIST;member?;S$B;25|))
                            (GO #3=#:G1040)))
                          ('T (LETT |x| (QCDR |x|) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |ILIST;latex;$S;26| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| "\\left[" . #1=(|ILIST;latex;$S;26|))
                    (SEQ G190
                         (COND
                          ((NULL (COND ((NULL |x|) 'NIL) ('T 'T))) (GO G191)))
                         (SEQ
                          (LETT |s|
                                (STRCONC |s|
                                         (SPADCALL (QCAR |x|) (QREFELT $ 53)))
                                . #1#)
                          (LETT |x| (QCDR |x|) . #1#)
                          (EXIT
                           (COND
                            ((NULL (NULL |x|))
                             (LETT |s| (STRCONC |s| ", ") . #1#)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (STRCONC |s| " \\right]"))))) 

(SDEFUN |ILIST;hashUpdate!;Hs$Hs;27|
        ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SEQ
         (SEQ G190 (COND ((NULL (COND ((NULL |x|) 'NIL) ('T 'T))) (GO G191)))
              (SEQ
               (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT $ 56))
                     . #1=(|ILIST;hashUpdate!;Hs$Hs;27|))
               (EXIT (LETT |x| (QCDR |x|) . #1#)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |s|))) 

(SDEFUN |ILIST;concat!;3$;28| ((|x| $) (|y| $) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (COND
                 ((NULL |x|)
                  (COND ((NULL |y|) |x|)
                        (#1='T
                         (SEQ (PUSH (SPADCALL |y| (QREFELT $ 13)) |x|)
                              (QRPLACD |x| (SPADCALL |y| (QREFELT $ 18)))
                              (EXIT |x|)))))
                 (#1#
                  (SEQ (LETT |z| |x| . #2=(|ILIST;concat!;3$;28|))
                       (SEQ G190
                            (COND
                             ((NULL (COND ((NULL (QCDR |z|)) 'NIL) ('T 'T)))
                              (GO G191)))
                            (SEQ (EXIT (LETT |z| (QCDR |z|) . #2#))) NIL
                            (GO G190) G191 (EXIT NIL))
                       (QRPLACD |z| |y|) (EXIT |x|))))))) 

(SDEFUN |ILIST;removeDuplicates!;2$;29| ((|l| $) ($ $))
        (SPROG ((|pp| ($)) (|pr| ($)) (|p| ($)) (|f| (S)))
               (SEQ (LETT |p| |l| . #1=(|ILIST;removeDuplicates!;2$;29|))
                    (SEQ G190
                         (COND
                          ((NULL (COND ((NULL |p|) 'NIL) ('T 'T))) (GO G191)))
                         (SEQ (LETT |pp| |p| . #1#) (LETT |f| (QCAR |p|) . #1#)
                              (LETT |p| (QCDR |p|) . #1#)
                              (EXIT
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (COND
                                        ((NULL (LETT |pr| (QCDR |pp|) . #1#))
                                         'NIL)
                                        ('T 'T)))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCAR |pr|) |f|
                                                  (QREFELT $ 50))
                                        (QRPLACD |pp| (QCDR |pr|)))
                                       ('T (LETT |pp| |pr| . #1#)))))
                                    NIL (GO G190) G191 (EXIT NIL))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |ILIST;sort!;M2$;30| ((|f| |Mapping| (|Boolean|) S S) (|l| $) ($ $))
        (|ILIST;mergeSort| |f| |l| (SPADCALL |l| (QREFELT $ 9)) $)) 

(SDEFUN |ILIST;merge!;M3$;31|
        ((|f| |Mapping| (|Boolean|) S S) (|p| $) (|q| $) ($ $))
        (SPROG ((|t| ($)) (|r| ($)))
               (SEQ
                (COND ((NULL |p|) |q|) ((NULL |q|) |p|)
                      ((EQ |p| |q|)
                       (|error| "cannot merge a list into itself"))
                      (#1='T
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                          (SEQ
                           (LETT |r|
                                 (LETT |t| |p| . #2=(|ILIST;merge!;M3$;31|))
                                 . #2#)
                           (EXIT (LETT |p| (QCDR |p|) . #2#))))
                         (#1#
                          (SEQ (LETT |r| (LETT |t| |q| . #2#) . #2#)
                               (EXIT (LETT |q| (QCDR |q|) . #2#)))))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((OR (NULL |p|) (NULL |q|)) 'NIL)
                                      ('T 'T)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                                 (SEQ (QRPLACD |t| |p|) (LETT |t| |p| . #2#)
                                      (EXIT (LETT |p| (QCDR |p|) . #2#))))
                                ('T
                                 (SEQ (QRPLACD |t| |q|) (LETT |t| |q| . #2#)
                                      (EXIT (LETT |q| (QCDR |q|) . #2#)))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (QRPLACD |t| (COND ((NULL |p|) |q|) (#1# |p|)))
                        (EXIT |r|))))))) 

(SDEFUN |ILIST;split!;$I$;32| ((|p| $) (|n| |Integer|) ($ $))
        (SPROG ((|q| ($)) (#1=#:G1087 NIL))
               (SEQ
                (COND ((< |n| 1) (|error| "index out of range"))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL |p|
                                        (PROG1
                                            (LETT #1# (- |n| 1)
                                                  . #2=(|ILIST;split!;$I$;32|))
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 34))
                              . #2#)
                        (LETT |q| (QCDR |p|) . #2#) (QRPLACD |p| NIL)
                        (EXIT |q|))))))) 

(SDEFUN |ILIST;mergeSort|
        ((|f| |Mapping| (|Boolean|) S S) (|p| $) (|n| |Integer|) ($ $))
        (SPROG ((|q| ($)) (|l| (|NonNegativeInteger|)) (#1=#:G1091 NIL))
               (SEQ
                (COND
                 ((EQL |n| 2)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |p| (QREFELT $ 18)) (QREFELT $ 13))
                     (SPADCALL |p| (QREFELT $ 13)) |f|)
                    (LETT |p| (SPADCALL |p| (QREFELT $ 30))
                          . #2=(|ILIST;mergeSort|))))))
                (EXIT
                 (COND ((< |n| 3) |p|)
                       ('T
                        (SEQ
                         (LETT |l|
                               (PROG1 (LETT #1# (QUOTIENT2 |n| 2) . #2#)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               . #2#)
                         (LETT |q| (SPADCALL |p| |l| (QREFELT $ 63)) . #2#)
                         (LETT |p| (|ILIST;mergeSort| |f| |p| |l| $) . #2#)
                         (LETT |q| (|ILIST;mergeSort| |f| |q| (- |n| |l|) $)
                               . #2#)
                         (EXIT (SPADCALL |f| |p| |q| (QREFELT $ 62)))))))))) 

(DECLAIM (NOTINLINE |IndexedList;|)) 

(DEFUN |IndexedList| (&REST #1=#:G1112)
  (SPROG NIL
         (PROG (#2=#:G1113)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedList|)
                                               '|domainEqualList|)
                    . #3=(|IndexedList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedList;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedList|)))))))))) 

(DEFUN |IndexedList;| (|#1| |#2|)
  (SPROG
   ((#1=#:G1110 NIL) (#2=#:G1111 NIL) (|pv$| NIL) (#3=#:G1107 NIL)
    (#4=#:G1108 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|IndexedList|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT |dv$| (LIST '|IndexedList| DV$1 DV$2) . #5#)
    (LETT $ (GETREFV 77) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #5#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)
                                        (OR
                                         (|HasCategory| |#1| '(|OrderedSet|))
                                         #4#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          #4#))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #4#))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|IndexedList| (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 2048))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #5#)
     (|augmentPredVector| $ 4096))
    (AND (OR #2# #4#) (|augmentPredVector| $ 8192))
    (AND #4# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 16384))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #5#)
         (|augmentPredVector| $ 32768))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
         (|augmentPredVector| $ 65536))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 9)
      (QSETREFV $ 47 (CONS (|dispatchFunction| |ILIST;coerce;$Of;23|) $))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 49 (CONS (|dispatchFunction| |ILIST;=;2$B;24|) $))
       (QSETREFV $ 51 (CONS (|dispatchFunction| |ILIST;member?;S$B;25|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 54 (CONS (|dispatchFunction| |ILIST;latex;$S;26|) $))
       (QSETREFV $ 57
                 (CONS (|dispatchFunction| |ILIST;hashUpdate!;Hs$Hs;27|) $)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 59
                (CONS (|dispatchFunction| |ILIST;removeDuplicates!;2$;29|)
                      $))))
    $))) 

(MAKEPROP '|IndexedList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) |ILIST;#;$Nni;1| |ILIST;concat;S2$;2|
              (|Boolean|) |ILIST;eq?;2$B;3| |ILIST;first;$S;4| '"first"
              |ILIST;elt;$firstS;5| |ILIST;empty;$;6| |ILIST;empty?;$B;7|
              |ILIST;rest;2$;8| '"rest" |ILIST;elt;$rest$;9|
              |ILIST;setfirst!;$2S;10| |ILIST;qsetfirst!;$2S;11|
              |ILIST;setelt!;$first2S;12| |ILIST;setrest!;3$;13|
              |ILIST;qsetrest!;3$;14| |ILIST;setelt!;$rest2$;15| (|List| 6)
              |ILIST;construct;L$;16| |ILIST;parts;$L;17|
              |ILIST;reverse!;2$;18| |ILIST;reverse;2$;19| (|Integer|)
              |ILIST;minIndex;$I;20| |ILIST;rest;$Nni$;21| (0 . |cyclic?|)
              |ILIST;copy;2$;22| (5 . |cycleEntry|) (|OutputForm|)
              (10 . |coerce|) (|List| $) (15 . |bracket|) (|List| 38)
              (20 . |list|) (25 . |commaSeparate|) (30 . |overbar|)
              (35 . |concat!|) (41 . |coerce|) (46 . ~=) (52 . =) (58 . =)
              (64 . |member?|) (|String|) (70 . |latex|) (75 . |latex|)
              (|HashState|) (80 . |hashUpdate!|) (86 . |hashUpdate!|)
              |ILIST;concat!;3$;28| (92 . |removeDuplicates!|)
              (|Mapping| 11 6 6) |ILIST;sort!;M2$;30| |ILIST;merge!;M3$;31|
              |ILIST;split!;$I$;32| (|Mapping| 6 6 6) (|List| 66)
              (|Equation| 6) (|Mapping| 11 6) (|Void|) (|UniversalSegment| 32)
              '"last" '"value" (|Mapping| 6 6) (|InputForm|) (|SingleInteger|)
              (|List| 32) (|Union| 6 '"failed"))
           '#(~= 97 |value| 103 |third| 108 |tail| 113 |swap!| 118 |split!| 125
              |sorted?| 131 |sort!| 142 |sort| 153 |smaller?| 164 |size?| 170
              |setvalue!| 176 |setrest!| 182 |setlast!| 188 |setfirst!| 194
              |setelt!| 200 |setchildren!| 242 |select!| 248 |select| 254
              |second| 260 |sample| 265 |reverse!| 269 |reverse| 274 |rest| 279
              |removeDuplicates!| 290 |removeDuplicates| 295 |remove!| 300
              |remove| 312 |reduce| 324 |qsetrest!| 345 |qsetfirst!| 351
              |qsetelt!| 357 |qelt| 364 |possiblyInfinite?| 370 |position| 375
              |parts| 394 |nodes| 399 |node?| 404 |new| 410 |more?| 416
              |minIndex| 422 |min| 427 |merge!| 433 |merge| 446 |members| 459
              |member?| 464 |maxIndex| 470 |max| 475 |map!| 481 |map| 487
              |list| 500 |less?| 505 |leaves| 511 |leaf?| 516 |latex| 521
              |last| 526 |insert!| 537 |insert| 551 |indices| 565 |index?| 570
              |hashUpdate!| 576 |hash| 582 |first| 587 |find| 598 |fill!| 604
              |explicitlyFinite?| 610 |every?| 615 |eval| 621 |eq?| 647
              |entry?| 653 |entries| 659 |empty?| 664 |empty| 669 |elt| 673
              |distance| 716 |delete!| 722 |delete| 734 |cyclic?| 746
              |cycleTail| 751 |cycleSplit!| 756 |cycleLength| 761 |cycleEntry|
              766 |count| 771 |copyInto!| 783 |copy| 790 |convert| 795
              |construct| 800 |concat!| 805 |concat| 817 |coerce| 840
              |children| 845 |child?| 850 |any?| 856 >= 862 > 868 = 874 <= 880
              < 886 |#| 892)
           'NIL
           (CONS
            (|makeByteWordVec2| 10
                                '(0 0 0 0 0 0 0 0 0 2 0 2 0 0 8 6 0 0 0 0 8 10
                                  1 5 2))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| |FiniteLinearAggregate&|
                |UnaryRecursiveAggregate&| |LinearAggregate&|
                |RecursiveAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL NIL |BasicType&| |PartialOrder&|)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 32 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 32 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 32 6)
                 (|InnerEvalable| 6 6) (|CoercibleTo| 38) (|ConvertibleTo| 73)
                 (|BasicType|) (|PartialOrder|))
              (|makeByteWordVec2| 76
                                  '(1 0 11 0 35 1 0 0 0 37 1 6 38 0 39 1 38 0
                                    40 41 1 42 0 38 43 1 38 0 40 44 1 38 0 0 45
                                    2 42 0 0 38 46 1 0 38 0 47 2 6 11 0 0 48 2
                                    0 11 0 0 49 2 6 11 0 0 50 2 0 11 6 0 51 1 6
                                    52 0 53 1 0 52 0 54 2 32 55 55 0 56 2 0 55
                                    55 0 57 1 0 0 0 59 2 14 11 0 0 1 1 0 6 0 1
                                    1 0 6 0 1 1 0 0 0 1 3 16 68 0 32 32 1 2 16
                                    0 0 32 63 1 2 11 0 1 2 0 11 60 0 1 1 17 0 0
                                    1 2 16 0 60 0 61 1 2 0 0 1 2 0 0 60 0 1 2 2
                                    11 0 0 1 2 0 11 0 8 1 2 16 6 0 6 1 2 16 0 0
                                    0 24 2 16 6 0 6 1 2 16 6 0 6 21 3 16 6 0 32
                                    6 1 3 16 6 0 69 6 1 3 16 6 0 70 6 1 3 16 0
                                    0 19 0 26 3 16 6 0 14 6 23 3 16 6 0 71 6 1
                                    2 16 0 0 40 1 2 0 0 67 0 1 2 12 0 67 0 1 1
                                    0 6 0 1 0 0 0 1 1 16 0 0 30 1 0 0 0 31 2 0
                                    0 0 8 34 1 0 0 0 18 1 4 0 0 59 1 13 0 0 1 2
                                    4 0 6 0 1 2 0 0 67 0 1 2 13 0 6 0 1 2 12 0
                                    67 0 1 4 13 6 64 0 6 6 1 2 12 6 64 0 1 3 12
                                    6 64 0 6 1 2 16 0 0 0 25 2 16 6 0 6 22 3 16
                                    6 0 32 6 1 2 0 6 0 32 1 1 0 11 0 1 2 3 32 6
                                    0 1 3 3 32 6 0 32 1 2 0 32 67 0 1 1 12 27 0
                                    29 1 0 40 0 1 2 4 11 0 0 1 2 0 0 8 6 1 2 0
                                    11 0 8 1 1 11 32 0 33 2 2 0 0 0 1 2 2 0 0 0
                                    1 3 0 0 60 0 0 62 2 2 0 0 0 1 3 0 0 60 0 0
                                    1 1 12 27 0 1 2 13 11 6 0 51 1 11 32 0 1 2
                                    2 0 0 0 1 2 16 0 72 0 1 3 0 0 64 0 0 1 2 0
                                    0 72 0 1 1 0 0 6 1 2 0 11 0 8 1 1 0 27 0 1
                                    1 0 11 0 1 1 4 52 0 54 2 0 0 0 8 1 1 0 6 0
                                    1 3 0 0 0 0 32 1 3 0 0 6 0 32 1 3 0 0 0 0
                                    32 1 3 0 0 6 0 32 1 1 0 75 0 1 2 0 11 32 0
                                    1 2 4 55 55 0 57 1 4 74 0 1 2 0 0 0 8 1 1 0
                                    6 0 13 2 0 76 67 0 1 2 16 0 0 6 1 1 0 11 0
                                    1 2 12 11 67 0 1 3 7 0 0 27 27 1 3 7 0 0 6
                                    6 1 2 7 0 0 65 1 2 7 0 0 66 1 2 0 11 0 0 12
                                    2 15 11 6 0 1 1 0 27 0 1 1 0 11 0 17 0 0 0
                                    16 3 0 6 0 32 6 1 2 0 6 0 32 1 2 0 0 0 69 1
                                    2 0 6 0 70 1 2 0 0 0 19 20 2 0 6 0 14 15 2
                                    0 6 0 71 1 2 0 32 0 0 1 2 0 0 0 32 1 2 0 0
                                    0 69 1 2 0 0 0 32 1 2 0 0 0 69 1 1 0 11 0
                                    35 1 0 0 0 1 1 16 0 0 1 1 0 8 0 1 1 0 0 0
                                    37 2 13 8 6 0 1 2 12 8 67 0 1 3 16 0 0 0 32
                                    1 1 0 0 0 36 1 1 73 0 1 1 0 0 27 28 2 0 0 0
                                    6 1 2 0 0 0 0 58 2 0 0 0 6 1 1 0 0 40 1 2 0
                                    0 6 0 10 2 0 0 0 0 1 1 9 38 0 47 1 0 40 0 1
                                    2 4 11 0 0 1 2 12 11 67 0 1 2 2 11 0 0 1 2
                                    2 11 0 0 1 2 14 11 0 0 49 2 2 11 0 0 1 2 2
                                    11 0 0 1 1 12 8 0 9)))))
           '|lookupComplete|)) 
