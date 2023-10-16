
(PUT '|LIST;#;$Nni;1| '|SPADreplace| 'LENGTH) 

(SDEFUN |LIST;#;$Nni;1| ((|x| $) ($ |NonNegativeInteger|)) (LENGTH |x|)) 

(PUT '|LIST;concat;S2$;2| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;concat;S2$;2| ((|s| S) (|x| $) ($ $)) (CONS |s| |x|)) 

(PUT '|LIST;eq?;2$B;3| '|SPADreplace| 'EQ) 

(SDEFUN |LIST;eq?;2$B;3| ((|x| $) (|y| $) ($ |Boolean|)) (EQ |x| |y|)) 

(PUT '|LIST;first;$S;4| '|SPADreplace| '|SPADfirst|) 

(SDEFUN |LIST;first;$S;4| ((|x| $) ($ S)) (|SPADfirst| |x|)) 

(PUT '|LIST;elt;$firstS;5| '|SPADreplace|
     '(XLAM (|x| "first") (|SPADfirst| |x|))) 

(SDEFUN |LIST;elt;$firstS;5| ((|x| $) (T11 "first") ($ S)) (|SPADfirst| |x|)) 

(PUT '|LIST;empty;$;6| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LIST;empty;$;6| (($ $)) NIL) 

(PUT '|LIST;empty?;$B;7| '|SPADreplace| 'NULL) 

(SDEFUN |LIST;empty?;$B;7| ((|x| $) ($ |Boolean|)) (NULL |x|)) 

(PUT '|LIST;rest;2$;8| '|SPADreplace| 'CDR) 

(SDEFUN |LIST;rest;2$;8| ((|x| $) ($ $)) (CDR |x|)) 

(PUT '|LIST;elt;$rest$;9| '|SPADreplace| '(XLAM (|x| "rest") (CDR |x|))) 

(SDEFUN |LIST;elt;$rest$;9| ((|x| $) (T12 "rest") ($ $)) (CDR |x|)) 

(SDEFUN |LIST;setfirst!;$2S;10| ((|x| $) (|s| S) ($ S))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(PUT '|LIST;qsetfirst!;$2S;11| '|SPADreplace| '|qset_first|) 

(SDEFUN |LIST;qsetfirst!;$2S;11| ((|x| $) (|s| S) ($ S)) (|qset_first| |x| |s|)) 

(SDEFUN |LIST;setelt!;$first2S;12| ((|x| $) (T13 "first") (|s| S) ($ S))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(SDEFUN |LIST;setrest!;3$;13| ((|x| $) (|y| $) ($ $))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(PUT '|LIST;qsetrest!;3$;14| '|SPADreplace| '|qset_rest|) 

(SDEFUN |LIST;qsetrest!;3$;14| ((|x| $) (|y| $) ($ $)) (|qset_rest| |x| |y|)) 

(SDEFUN |LIST;setelt!;$rest2$;15| ((|x| $) (T14 "rest") (|y| $) ($ $))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(PUT '|LIST;construct;2$;16| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |LIST;construct;2$;16| ((|l| |List| S) ($ $)) |l|) 

(PUT '|LIST;parts;2$;17| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |LIST;parts;2$;17| ((|s| $) ($ |List| S)) |s|) 

(PUT '|LIST;reverse!;2$;18| '|SPADreplace| 'NREVERSE) 

(SDEFUN |LIST;reverse!;2$;18| ((|x| $) ($ $)) (NREVERSE |x|)) 

(PUT '|LIST;reverse;2$;19| '|SPADreplace| 'REVERSE) 

(SDEFUN |LIST;reverse;2$;19| ((|x| $) ($ $)) (REVERSE |x|)) 

(PUT '|LIST;minIndex;$I;20| '|SPADreplace| '(XLAM (|x|) 1)) 

(SDEFUN |LIST;minIndex;$I;20| ((|x| $) ($ |Integer|)) 1) 

(PUT '|LIST;maxIndex;$I;21| '|SPADreplace| 'LENGTH) 

(SDEFUN |LIST;maxIndex;$I;21| ((|x| $) ($ |Integer|)) (LENGTH |x|)) 

(SDEFUN |LIST;rest;$Nni$;22| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G1441 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (COND ((NULL |x|) (|error| "index out of range")))
                          (EXIT (LETT |x| (QCDR |x|))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |LIST;copy;2$;23| ((|x| $) ($ $))
        (SPROG ((|y| ($)) (|i| NIL))
               (SEQ (LETT |y| NIL)
                    (SEQ (LETT |i| 0) G190
                         (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                         (SEQ
                          (COND
                           ((EQ |i| 1000)
                            (COND
                             ((SPADCALL |x| (QREFELT $ 35))
                              (|error| "cyclic list")))))
                          (LETT |y| (CONS (QCAR |x|) |y|))
                          (EXIT (LETT |x| (QCDR |x|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |y|))))) 

(SDEFUN |LIST;leaves;2$;24| ((|x| $) ($ |List| S))
        (SPROG ((#1=#:G1456 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND ((NULL |x|) NIL)
                       ('T
                        (SEQ (LETT |i| 0) G190
                             (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                             (SEQ
                              (COND
                               ((EQ |i| 1000)
                                (COND
                                 ((SPADCALL |x| (QREFELT $ 35))
                                  (EXIT (|error| "cyclic list"))))))
                              (EXIT
                               (COND
                                ((SPADCALL |x| (QREFELT $ 37))
                                 (PROGN
                                  (LETT #1#
                                        (LIST (SPADCALL |x| (QREFELT $ 38))))
                                  (GO #2=#:G1455)))
                                ('T (LETT |x| (QCDR |x|))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LIST;coerce;$Of;25| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|z| (|List| (|OutputForm|))) (|y| (|List| (|OutputForm|)))
          (|s| ($)))
         (SEQ (LETT |y| NIL) (LETT |s| (SPADCALL |x| (QREFELT $ 40)))
              (SEQ G190 (COND ((NULL (NULL (EQ |x| |s|))) (GO G191)))
                   (SEQ
                    (LETT |y|
                          (CONS (SPADCALL (|SPADfirst| |x|) (QREFELT $ 42))
                                |y|))
                    (EXIT (LETT |x| (CDR |x|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |y| (NREVERSE |y|))
              (EXIT
               (COND ((NULL |s|) (SPADCALL |y| (QREFELT $ 44)))
                     ('T
                      (SEQ
                       (LETT |z|
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |x|) (QREFELT $ 42))
                              (QREFELT $ 46)))
                       (SEQ G190
                            (COND ((NULL (NULL (EQ |s| (CDR |x|)))) (GO G191)))
                            (SEQ (LETT |x| (CDR |x|))
                                 (EXIT
                                  (LETT |z|
                                        (CONS
                                         (SPADCALL (|SPADfirst| |x|)
                                                   (QREFELT $ 42))
                                         |z|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (NREVERSE |z|) (QREFELT $ 47))
                                    (QREFELT $ 48))
                                   (QREFELT $ 49))
                         (QREFELT $ 44)))))))))) 

(SDEFUN |LIST;=;2$B;26| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G1474 NIL))
               (SEQ
                (EXIT
                 (COND ((EQ |x| |y|) 'T)
                       (#2='T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND ((NULL |x|) NIL)
                                       ('T (NULL (NULL |y|)))))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (QCAR |x|) (QCAR |y|)
                                            (QREFELT $ 51))
                                  (PROGN (LETT #1# NIL) (GO #3=#:G1473)))
                                 ('T
                                  (SEQ (LETT |x| (QCDR |x|))
                                       (EXIT (LETT |y| (QCDR |y|))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (COND ((NULL |x|) (NULL |y|)) (#2# NIL)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |LIST;member?;S$B;27| ((|s| S) (|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G1480 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |s| (QCAR |x|) (QREFELT $ 53))
                           (PROGN (LETT #1# 'T) (GO #2=#:G1479)))
                          ('T (LETT |x| (QCDR |x|))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |LIST;latex;$S;28| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| "\\left[")
                    (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                         (SEQ
                          (LETT |s|
                                (STRCONC |s|
                                         (SPADCALL (QCAR |x|) (QREFELT $ 56))))
                          (LETT |x| (QCDR |x|))
                          (EXIT
                           (COND
                            ((NULL (NULL |x|))
                             (LETT |s| (STRCONC |s| ", "))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (STRCONC |s| " \\right]"))))) 

(SDEFUN |LIST;hashUpdate!;Hs$Hs;29| ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SEQ
         (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
              (SEQ (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT $ 59)))
                   (EXIT (LETT |x| (QCDR |x|))))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |s|))) 

(SDEFUN |LIST;concat!;3$;30| ((|x| $) (|y| $) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (COND ((NULL |x|) |y|)
                      ('T
                       (SEQ (LETT |z| |x|)
                            (SEQ G190
                                 (COND
                                  ((NULL (NULL (NULL (QCDR |z|)))) (GO G191)))
                                 (SEQ (EXIT (LETT |z| (QCDR |z|)))) NIL
                                 (GO G190) G191 (EXIT NIL))
                            (|qset_rest| |z| |y|) (EXIT |x|))))))) 

(SDEFUN |LIST;removeDuplicates!;2$;31| ((|l| $) ($ $))
        (SPROG ((|pp| ($)) (|pr| ($)) (|p| ($)) (|f| (S)))
               (SEQ (LETT |p| |l|)
                    (SEQ G190 (COND ((NULL (NULL (NULL |p|))) (GO G191)))
                         (SEQ (LETT |pp| |p|) (LETT |f| (QCAR |p|))
                              (LETT |p| (QCDR |p|))
                              (EXIT
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (NULL (NULL (LETT |pr| (QCDR |pp|)))))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCAR |pr|) |f|
                                                  (QREFELT $ 53))
                                        (|qset_rest| |pp| (QCDR |pr|)))
                                       ('T (LETT |pp| |pr|)))))
                                    NIL (GO G190) G191 (EXIT NIL))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |LIST;sort!;M2$;32| ((|f| |Mapping| (|Boolean|) S S) (|l| $) ($ $))
        (|LIST;mergeSort| |f| |l| (LENGTH |l|) $)) 

(SDEFUN |LIST;merge!;M3$;33|
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
                          (SEQ (LETT |r| (LETT |t| |p|))
                               (EXIT (LETT |p| (QCDR |p|)))))
                         (#1#
                          (SEQ (LETT |r| (LETT |t| |q|))
                               (EXIT (LETT |q| (QCDR |q|))))))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p|) NIL) ('T (NULL (NULL |q|)))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                                 (SEQ (|qset_rest| |t| |p|) (LETT |t| |p|)
                                      (EXIT (LETT |p| (QCDR |p|)))))
                                ('T
                                 (SEQ (|qset_rest| |t| |q|) (LETT |t| |q|)
                                      (EXIT (LETT |q| (QCDR |q|))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (|qset_rest| |t| (COND ((NULL |p|) |q|) (#1# |p|)))
                        (EXIT |r|))))))) 

(SDEFUN |LIST;split!;$Nni$;34| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|q| ($)) (#1=#:G1524 NIL))
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
                                        (QREFELT $ 34)))
                        (LETT |q| (QCDR |p|)) (|qset_rest| |p| NIL)
                        (EXIT |q|))))))) 

(SDEFUN |LIST;mergeSort|
        ((|f| |Mapping| (|Boolean|) S S) (|p| $) (|n| |Integer|) ($ $))
        (SPROG ((|q| ($)) (|l| (|NonNegativeInteger|)) (#1=#:G1528 NIL))
               (SEQ
                (COND
                 ((EQL |n| 2)
                  (COND
                   ((SPADCALL (|SPADfirst| (CDR |p|)) (|SPADfirst| |p|) |f|)
                    (LETT |p| (NREVERSE |p|))))))
                (EXIT
                 (COND ((< |n| 3) |p|)
                       ('T
                        (SEQ
                         (LETT |l|
                               (PROG1 (LETT #1# (QUOTIENT2 |n| 2))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#)))
                         (LETT |q| (SPADCALL |p| |l| (QREFELT $ 65)))
                         (LETT |p| (|LIST;mergeSort| |f| |p| |l| $))
                         (LETT |q| (|LIST;mergeSort| |f| |q| (- |n| |l|) $))
                         (EXIT (SPADCALL |f| |p| |q| (QREFELT $ 64)))))))))) 

(PUT '|LIST;cons;S2$;36| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;cons;S2$;36| ((|s| S) (|l| $) ($ $)) (CONS |s| |l|)) 

(SDEFUN |LIST;append;3$;37| ((|l| $) (|t| $) ($ $))
        (SPADCALL |l| |t| (QREFELT $ 67))) 

(SDEFUN |LIST;tails;$L;38| ((|x| $) ($ |List| $))
        (SPROG ((#1=#:G1543 NIL) (|i| NIL) (#2=#:G1542 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# (- (LENGTH |x|) 1)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |x| |i| (QREFELT $ 34)) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LIST;writeOMList| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 72))
             (SPADCALL |dev| "list1" "list" (QREFELT $ 73))
             (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                  (SEQ (SPADCALL |dev| (|SPADfirst| |x|) NIL (QREFELT $ 74))
                       (EXIT (LETT |x| (CDR |x|))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |dev| (QREFELT $ 75))))) 

(SDEFUN |LIST;OMwrite;Omd$BV;40|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 76))))
             (|LIST;writeOMList| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 77))))))) 

(SDEFUN |LIST;setUnion;3$;41| ((|l1| $) (|l2| $) ($ $))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 67)) (QREFELT $ 79))) 

(SDEFUN |LIST;setIntersection;3$;42| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|u| ($)))
               (SEQ (LETT |u| NIL) (LETT |l1| (SPADCALL |l1| (QREFELT $ 79)))
                    (SEQ G190 (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL (|SPADfirst| |l1|) |l2| (QREFELT $ 54))
                            (LETT |u|
                                  (SPADCALL (|SPADfirst| |l1|) |u|
                                            (QREFELT $ 66)))))
                          (EXIT (LETT |l1| (CDR |l1|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |u|)))) 

(SDEFUN |LIST;setDifference;3$;43| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|lu| ($)) (|l11| (S)))
               (SEQ (LETT |l1| (SPADCALL |l1| (QREFELT $ 79)))
                    (EXIT
                     (COND ((NULL |l2|) |l1|)
                           ('T
                            (SEQ (LETT |lu| NIL)
                                 (SEQ G190
                                      (COND
                                       ((NULL (NULL (NULL |l1|))) (GO G191)))
                                      (SEQ
                                       (LETT |l11|
                                             (SPADCALL |l1| 1 (QREFELT $ 82)))
                                       (COND
                                        ((NULL
                                          (SPADCALL |l11| |l2| (QREFELT $ 54)))
                                         (LETT |lu| (CONS |l11| |lu|))))
                                       (EXIT (LETT |l1| (CDR |l1|))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT |lu|)))))))) 

(SDEFUN |LIST;map!;M2$;44| ((|f| |Mapping| S S) (|l| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ (LETT |y| |l|)
                    (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                         (SEQ
                          (SPADCALL |l| (SPADCALL (|SPADfirst| |l|) |f|)
                                    (QREFELT $ 20))
                          (EXIT (LETT |l| (CDR |l|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |y|)))) 

(SDEFUN |LIST;convert;$If;45| ((|x| $) ($ |InputForm|))
        (SPROG ((#1=#:G1583 NIL) (|a| NIL) (#2=#:G1582 NIL))
               (SEQ
                (SPADCALL
                 (CONS (SPADCALL '|construct| (QREFELT $ 88))
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |a| NIL) (LETT #1# |x|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |a| (QREFELT $ 89))
                                           #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 90))))) 

(DECLAIM (NOTINLINE |List;|)) 

(DEFUN |List| (#1=#:G1596)
  (SPROG NIL
         (PROG (#2=#:G1597)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|List|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|List;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|List|)))))))))) 

(DEFUN |List;| (|#1|)
  (SPROG
   ((#1=#:G1592 NIL) (#2=#:G1593 NIL) (#3=#:G1595 NIL) (#4=#:G1594 NIL)
    (|pv$| NIL) (#5=#:G1589 NIL) (#6=#:G1590 NIL) (#7=#:G1591 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|List| DV$1))
    (LETT $ (GETREFV 102))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|OpenMath|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #6#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #5# #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|List| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)))
         (|augmentPredVector| $ 8192))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 16384))
    (AND (OR #5# (AND #7# #4#) #3#) (|augmentPredVector| $ 32768))
    (AND (OR (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 65536))
    (AND (OR (AND #7# #4#) #3#) (|augmentPredVector| $ 131072))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 262144))
    (AND (OR #2# (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 524288))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)))
         (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #1#
         (|augmentPredVector| $ 2097152))
    (AND #4# #1# (|augmentPredVector| $ 4194304))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 50 (CONS (|dispatchFunction| |LIST;coerce;$Of;25|) $))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 52 (CONS (|dispatchFunction| |LIST;=;2$B;26|) $))
       (QSETREFV $ 54 (CONS (|dispatchFunction| |LIST;member?;S$B;27|) $)))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 57 (CONS (|dispatchFunction| |LIST;latex;$S;28|) $))
       (QSETREFV $ 59
                 (CONS (|dispatchFunction| |LIST;hashUpdate!;Hs$Hs;29|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 61
                (CONS (|dispatchFunction| |LIST;removeDuplicates!;2$;31|) $))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 78
                 (CONS (|dispatchFunction| |LIST;OMwrite;Omd$BV;40|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 80 (CONS (|dispatchFunction| |LIST;setUnion;3$;41|) $))
       (QSETREFV $ 81
                 (CONS (|dispatchFunction| |LIST;setIntersection;3$;42|) $))
       (QSETREFV $ 83
                 (CONS (|dispatchFunction| |LIST;setDifference;3$;43|) $)))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 91 (CONS (|dispatchFunction| |LIST;convert;$If;45|) $))))
    $))) 

(MAKEPROP '|List| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |LIST;#;$Nni;1| |LIST;concat;S2$;2| (|Boolean|) |LIST;eq?;2$B;3|
              |LIST;first;$S;4| '"first" |LIST;elt;$firstS;5| |LIST;empty;$;6|
              |LIST;empty?;$B;7| |LIST;rest;2$;8| '"rest" |LIST;elt;$rest$;9|
              |LIST;setfirst!;$2S;10| |LIST;qsetfirst!;$2S;11|
              |LIST;setelt!;$first2S;12| |LIST;setrest!;3$;13|
              |LIST;qsetrest!;3$;14| |LIST;setelt!;$rest2$;15| (|List| 6)
              |LIST;construct;2$;16| |LIST;parts;2$;17| |LIST;reverse!;2$;18|
              |LIST;reverse;2$;19| (|Integer|) |LIST;minIndex;$I;20|
              |LIST;maxIndex;$I;21| |LIST;rest;$Nni$;22| (0 . |cyclic?|)
              |LIST;copy;2$;23| (5 . |leaf?|) (10 . |value|)
              |LIST;leaves;2$;24| (15 . |cycleEntry|) (|OutputForm|)
              (20 . |coerce|) (|List| $) (25 . |bracket|) (|List| 41)
              (30 . |list|) (35 . |commaSeparate|) (40 . |overbar|)
              (45 . |concat!|) (51 . |coerce|) (56 . ~=) (62 . =) (68 . =)
              (74 . |member?|) (|String|) (80 . |latex|) (85 . |latex|)
              (|HashState|) (90 . |hashUpdate!|) |LIST;concat!;3$;30|
              (96 . |removeDuplicates!|) (|Mapping| 10 6 6) |LIST;sort!;M2$;32|
              |LIST;merge!;M3$;33| |LIST;split!;$Nni$;34| |LIST;cons;S2$;36|
              (101 . |concat|) |LIST;append;3$;37| |LIST;tails;$L;38| (|Void|)
              (|OpenMathDevice|) (107 . |OMputApp|) (112 . |OMputSymbol|)
              (119 . |OMwrite|) (126 . |OMputEndApp|) (131 . |OMputObject|)
              (136 . |OMputEndObject|) (141 . |OMwrite|)
              (148 . |removeDuplicates|) (153 . |setUnion|)
              (159 . |setIntersection|) (165 . |elt|) (171 . |setDifference|)
              (|Mapping| 6 6) |LIST;map!;M2$;44| (|Symbol|) (|InputForm|)
              (177 . |convert|) (182 . |convert|) (187 . |convert|)
              (192 . |convert|) (|Mapping| 6 6 6) (|Equation| 6) (|List| 93)
              (|SingleInteger|) (|Mapping| 10 6) (|UniversalSegment| 31)
              '"last" '"value" (|List| 31) (|Union| 6 '"failed"))
           '#(~= 197 |value| 203 |trim| 208 |third| 214 |tails| 219 |tail| 224
              |swap!| 229 |split!| 236 |sorted?| 242 |sort!| 253 |sort| 264
              |smaller?| 275 |size?| 281 |setvalue!| 287 |setrest!| 293
              |setlast!| 299 |setfirst!| 305 |setelt!| 311 |setchildren!| 353
              |setUnion| 359 |setIntersection| 365 |setDifference| 371
              |select!| 377 |select| 383 |second| 389 |sample| 394 |rightTrim|
              398 |reverse!| 404 |reverse| 409 |rest| 414 |removeDuplicates!|
              425 |removeDuplicates| 430 |remove!| 435 |remove| 447 |reduce|
              459 |qsetrest!| 480 |qsetfirst!| 486 |qsetelt!| 492 |qelt| 499
              |possiblyInfinite?| 505 |position| 510 |parts| 529 |nodes| 534
              |node?| 539 |new| 545 |more?| 551 |minIndex| 557 |min| 562
              |merge!| 573 |merge| 586 |members| 599 |member?| 604 |maxIndex|
              610 |max| 615 |map!| 632 |map| 638 |list| 651 |less?| 656
              |leftTrim| 662 |leaves| 668 |leaf?| 673 |latex| 678 |last| 683
              |insert!| 694 |insert| 708 |indices| 722 |index?| 727
              |hashUpdate!| 733 |hash| 739 |first| 744 |find| 755 |fill!| 761
              |explicitlyFinite?| 767 |every?| 772 |eval| 778 |eq?| 804
              |entry?| 810 |entries| 816 |empty?| 821 |empty| 826 |elt| 830
              |distance| 873 |delete!| 879 |delete| 891 |cyclic?| 903
              |cycleTail| 908 |cycleSplit!| 913 |cycleLength| 918 |cycleEntry|
              923 |count| 928 |copyInto!| 940 |copy| 947 |convert| 952
              |construct| 957 |cons| 962 |concat!| 968 |concat| 980 |coerce|
              1003 |children| 1008 |child?| 1013 |append| 1019 |any?| 1025
              |OMwrite| 1031 >= 1055 > 1061 = 1067 <= 1073 < 1079 |#| 1085)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 0 0 0 1 0 6 0 0 8 10 0 0 0 0 0 8
                                  9 12 1 2 3))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| NIL |UnaryRecursiveAggregate&|
                |LinearAggregate&| |RecursiveAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL NIL |InnerEvalable&| |BasicType&| NIL
                |PartialOrder&| NIL |OpenMath&|)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 31 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 31 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 97 $$) (|Type|)
                 (|Eltable| 31 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 41) (|PartialOrder|) (|ConvertibleTo| 87)
                 (|OpenMath|))
              (|makeByteWordVec2| 101
                                  '(1 0 10 0 35 1 0 10 0 37 1 0 6 0 38 1 0 0 0
                                    40 1 6 41 0 42 1 41 0 43 44 1 45 0 41 46 1
                                    41 0 43 47 1 41 0 0 48 2 45 0 0 41 49 1 0
                                    41 0 50 2 6 10 0 0 51 2 0 10 0 0 52 2 6 10
                                    0 0 53 2 0 10 6 0 54 1 6 55 0 56 1 0 55 0
                                    57 2 0 58 58 0 59 1 0 0 0 61 2 0 0 0 0 67 1
                                    71 70 0 72 3 71 70 0 55 55 73 3 6 70 71 0
                                    10 74 1 71 70 0 75 1 71 70 0 76 1 71 70 0
                                    77 3 0 70 71 0 10 78 1 0 0 0 79 2 0 0 0 0
                                    80 2 0 0 0 0 81 2 0 6 0 31 82 2 0 0 0 0 83
                                    1 87 0 86 88 1 6 87 0 89 1 87 0 43 90 1 0
                                    87 0 91 2 20 10 0 0 1 1 0 6 0 38 2 19 0 0 6
                                    1 1 0 6 0 1 1 0 43 0 69 1 0 0 0 1 3 21 70 0
                                    31 31 1 2 21 0 0 7 65 1 15 10 0 1 2 14 10
                                    62 0 1 1 22 0 0 1 2 23 0 62 0 63 1 15 0 0 1
                                    2 14 0 62 0 1 2 18 10 0 0 1 2 0 10 0 7 1 2
                                    21 6 0 6 1 2 21 0 0 0 23 2 21 6 0 6 1 2 21
                                    6 0 6 20 3 21 6 0 31 6 1 3 21 6 0 97 6 1 3
                                    21 6 0 98 6 1 3 21 0 0 18 0 25 3 21 6 0 13
                                    6 22 3 21 6 0 99 6 1 2 21 0 0 43 1 2 4 0 0
                                    0 80 2 4 0 0 0 81 2 4 0 0 0 83 2 0 0 96 0 1
                                    2 14 0 96 0 1 1 0 6 0 1 0 0 0 1 2 19 0 0 6
                                    1 1 23 0 0 29 1 14 0 0 30 2 0 0 0 7 34 1 0
                                    0 0 17 1 4 0 0 61 1 19 0 0 79 2 4 0 6 0 1 2
                                    0 0 96 0 1 2 19 0 6 0 1 2 14 0 96 0 1 4 19
                                    6 92 0 6 6 1 3 14 6 92 0 6 1 2 14 6 92 0 1
                                    2 21 0 0 0 24 2 21 6 0 6 21 3 21 6 0 31 6 1
                                    2 0 6 0 31 1 1 0 10 0 1 2 19 31 6 0 1 3 19
                                    31 6 0 31 1 2 14 31 96 0 1 1 14 26 0 28 1 0
                                    43 0 1 2 4 10 0 0 1 2 0 0 7 6 1 2 0 10 0 7
                                    1 1 13 31 0 32 2 15 0 0 0 1 1 15 6 0 1 2 1
                                    0 0 0 1 3 0 0 62 0 0 64 2 15 0 0 0 1 3 14 0
                                    62 0 0 1 1 14 26 0 1 2 19 10 6 0 54 1 13 31
                                    0 33 2 15 0 0 0 1 1 15 6 0 1 2 14 6 62 0 1
                                    2 21 0 84 0 85 3 0 0 92 0 0 1 2 0 0 84 0 1
                                    1 0 0 6 1 2 0 10 0 7 1 2 19 0 0 6 1 1 0 26
                                    0 39 1 0 10 0 37 1 17 55 0 57 2 0 0 0 7 1 1
                                    0 6 0 1 3 0 0 6 0 31 1 3 0 0 0 0 31 1 3 0 0
                                    0 0 31 1 3 0 0 6 0 31 1 1 0 100 0 1 2 0 10
                                    31 0 1 2 17 58 58 0 59 1 17 95 0 1 2 0 0 0
                                    7 1 1 0 6 0 12 2 0 101 96 0 1 2 21 0 0 6 1
                                    1 0 10 0 1 2 14 10 96 0 1 3 8 0 0 6 6 1 3 8
                                    0 0 26 26 1 2 8 0 0 93 1 2 8 0 0 94 1 2 0
                                    10 0 0 11 2 19 10 6 0 1 1 0 26 0 1 1 0 10 0
                                    16 0 0 0 15 2 0 6 0 31 82 3 0 6 0 31 6 1 2
                                    0 0 0 97 1 2 0 6 0 98 1 2 0 0 0 18 19 2 0 6
                                    0 13 14 2 0 6 0 99 1 2 0 31 0 0 1 2 0 0 0
                                    31 1 2 0 0 0 97 1 2 0 0 0 31 1 2 0 0 0 97 1
                                    1 0 10 0 35 1 0 0 0 1 1 21 0 0 1 1 0 7 0 1
                                    1 0 0 0 40 2 19 7 6 0 1 2 14 7 96 0 1 3 23
                                    0 0 0 31 1 1 0 0 0 36 1 2 87 0 91 1 0 0 26
                                    27 2 0 0 6 0 66 2 0 0 0 6 1 2 0 0 0 0 60 1
                                    0 0 43 1 2 0 0 0 6 1 2 0 0 6 0 9 2 0 0 0 0
                                    67 1 16 41 0 50 1 0 43 0 1 2 4 10 0 0 1 2 0
                                    0 0 0 68 2 14 10 96 0 1 1 3 55 0 1 2 3 70
                                    71 0 1 2 3 55 0 10 1 3 3 70 71 0 10 78 2 15
                                    10 0 0 1 2 15 10 0 0 1 2 20 10 0 0 52 2 15
                                    10 0 0 1 2 15 10 0 0 1 1 14 7 0 8)))))
           '|lookupComplete|)) 
