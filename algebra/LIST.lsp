
(PUT '|LIST;#;$Nni;1| '|SPADreplace| 'LENGTH) 

(SDEFUN |LIST;#;$Nni;1| ((|x| $) ($ |NonNegativeInteger|)) (LENGTH |x|)) 

(PUT '|LIST;cons;S2$;2| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;cons;S2$;2| ((|s| S) (|x| $) ($ $)) (CONS |s| |x|)) 

(PUT '|LIST;concat;S2$;3| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;concat;S2$;3| ((|s| S) (|x| $) ($ $)) (CONS |s| |x|)) 

(PUT '|LIST;eq?;2$B;4| '|SPADreplace| 'EQ) 

(SDEFUN |LIST;eq?;2$B;4| ((|x| $) (|y| $) ($ |Boolean|)) (EQ |x| |y|)) 

(PUT '|LIST;first;$S;5| '|SPADreplace| '|SPADfirst|) 

(SDEFUN |LIST;first;$S;5| ((|x| $) ($ S)) (|SPADfirst| |x|)) 

(PUT '|LIST;elt;$firstS;6| '|SPADreplace|
     '(XLAM (|x| "first") (|SPADfirst| |x|))) 

(SDEFUN |LIST;elt;$firstS;6| ((|x| $) (T11 "first") ($ S)) (|SPADfirst| |x|)) 

(PUT '|LIST;empty;$;7| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LIST;empty;$;7| (($ $)) NIL) 

(PUT '|LIST;empty?;$B;8| '|SPADreplace| 'NULL) 

(SDEFUN |LIST;empty?;$B;8| ((|x| $) ($ |Boolean|)) (NULL |x|)) 

(PUT '|LIST;rest;2$;9| '|SPADreplace| 'CDR) 

(SDEFUN |LIST;rest;2$;9| ((|x| $) ($ $)) (CDR |x|)) 

(PUT '|LIST;elt;$rest$;10| '|SPADreplace| '(XLAM (|x| "rest") (CDR |x|))) 

(SDEFUN |LIST;elt;$rest$;10| ((|x| $) (T12 "rest") ($ $)) (CDR |x|)) 

(PUT '|LIST;qsetfirst!;$2S;11| '|SPADreplace| '|qset_first|) 

(SDEFUN |LIST;qsetfirst!;$2S;11| ((|x| $) (|s| S) ($ S)) (|qset_first| |x| |s|)) 

(SDEFUN |LIST;setfirst!;$2S;12| ((|x| $) (|s| S) ($ S))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(SDEFUN |LIST;setelt!;$first2S;13| ((|x| $) (T13 "first") (|s| S) ($ S))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_first| |x| |s|)))) 

(PUT '|LIST;qsetrest!;3$;14| '|SPADreplace| '|qset_rest|) 

(SDEFUN |LIST;qsetrest!;3$;14| ((|x| $) (|y| $) ($ $)) (|qset_rest| |x| |y|)) 

(SDEFUN |LIST;setrest!;3$;15| ((|x| $) (|y| $) ($ $))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(SDEFUN |LIST;setelt!;$rest2$;16| ((|x| $) (T14 "rest") (|y| $) ($ $))
        (COND ((NULL |x|) (|error| "Cannot update an empty list"))
              ('T (|qset_rest| |x| |y|)))) 

(PUT '|LIST;construct;2$;17| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |LIST;construct;2$;17| ((|l| |List| S) ($ $)) |l|) 

(PUT '|LIST;parts;2$;18| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |LIST;parts;2$;18| ((|s| $) ($ |List| S)) |s|) 

(PUT '|LIST;reverse!;2$;19| '|SPADreplace| 'NREVERSE) 

(SDEFUN |LIST;reverse!;2$;19| ((|x| $) ($ $)) (NREVERSE |x|)) 

(PUT '|LIST;reverse;2$;20| '|SPADreplace| 'REVERSE) 

(SDEFUN |LIST;reverse;2$;20| ((|x| $) ($ $)) (REVERSE |x|)) 

(PUT '|LIST;minIndex;$I;21| '|SPADreplace| '(XLAM (|x|) 1)) 

(SDEFUN |LIST;minIndex;$I;21| ((|x| $) ($ |Integer|)) 1) 

(PUT '|LIST;maxIndex;$I;22| '|SPADreplace| 'LENGTH) 

(SDEFUN |LIST;maxIndex;$I;22| ((|x| $) ($ |Integer|)) (LENGTH |x|)) 

(SDEFUN |LIST;rest;$Nni$;23| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G1440 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (COND ((NULL |x|) (|error| "index out of range")))
                          (EXIT (LETT |x| (QCDR |x|))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |LIST;copy;2$;24| ((|x| $) ($ $))
        (SPROG ((|y| ($)) (|i| NIL))
               (SEQ (LETT |y| NIL)
                    (SEQ (LETT |i| 0) G190
                         (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                         (SEQ
                          (COND
                           ((EQL |i| 1000)
                            (COND
                             ((SPADCALL |x| (QREFELT $ 36))
                              (|error| "cyclic list")))))
                          (LETT |y| (CONS (QCAR |x|) |y|))
                          (EXIT (LETT |x| (QCDR |x|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |y|))))) 

(SDEFUN |LIST;leaves;2$;25| ((|x| $) ($ |List| S))
        (SPROG ((#1=#:G1453 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND ((NULL |x|) NIL)
                       ('T
                        (SEQ (LETT |i| 0) G190
                             (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                             (SEQ
                              (COND
                               ((EQL |i| 1000)
                                (COND
                                 ((SPADCALL |x| (QREFELT $ 36))
                                  (EXIT (|error| "cyclic list"))))))
                              (EXIT
                               (COND
                                ((SPADCALL |x| (QREFELT $ 38))
                                 (PROGN
                                  (LETT #1#
                                        (LIST (SPADCALL |x| (QREFELT $ 39))))
                                  (GO #2=#:G1452)))
                                ('T (LETT |x| (QCDR |x|))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LIST;coerce;$Of;26| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|z| (|List| (|OutputForm|))) (|y| (|List| (|OutputForm|)))
          (|s| ($)))
         (SEQ (LETT |y| NIL) (LETT |s| (SPADCALL |x| (QREFELT $ 41)))
              (SEQ G190 (COND ((NULL (NULL (EQ |x| |s|))) (GO G191)))
                   (SEQ
                    (LETT |y|
                          (SPADCALL (SPADCALL (|SPADfirst| |x|) (QREFELT $ 43))
                                    |y| (QREFELT $ 45)))
                    (EXIT (LETT |x| (CDR |x|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |y| (NREVERSE |y|))
              (EXIT
               (COND ((NULL |s|) (SPADCALL |y| (QREFELT $ 47)))
                     ('T
                      (SEQ
                       (LETT |z|
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |x|) (QREFELT $ 43))
                              (QREFELT $ 48)))
                       (SEQ G190
                            (COND ((NULL (NULL (EQ |s| (CDR |x|)))) (GO G191)))
                            (SEQ (LETT |x| (CDR |x|))
                                 (EXIT
                                  (LETT |z|
                                        (SPADCALL
                                         (SPADCALL (|SPADfirst| |x|)
                                                   (QREFELT $ 43))
                                         |z| (QREFELT $ 45)))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (NREVERSE |z|) (QREFELT $ 49))
                                    (QREFELT $ 50))
                                   (QREFELT $ 51))
                         (QREFELT $ 47)))))))))) 

(SDEFUN |LIST;=;2$B;27| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G1471 NIL))
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
                                            (QREFELT $ 53))
                                  (PROGN (LETT #1# NIL) (GO #3=#:G1470)))
                                 ('T
                                  (SEQ (LETT |x| (QCDR |x|))
                                       (EXIT (LETT |y| (QCDR |y|))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (COND ((NULL |x|) (NULL |y|)) (#2# NIL)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |LIST;member?;S$B;28| ((|s| S) (|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G1477 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |s| (QCAR |x|) (QREFELT $ 55))
                           (PROGN (LETT #1# 'T) (GO #2=#:G1476)))
                          ('T (LETT |x| (QCDR |x|))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |LIST;latex;$S;29| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| "\\left[")
                    (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                         (SEQ
                          (LETT |s|
                                (STRCONC |s|
                                         (SPADCALL (QCAR |x|) (QREFELT $ 58))))
                          (LETT |x| (QCDR |x|))
                          (EXIT
                           (COND
                            ((NULL (NULL |x|))
                             (LETT |s| (STRCONC |s| ", "))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (STRCONC |s| " \\right]"))))) 

(SDEFUN |LIST;hashUpdate!;Hs$Hs;30| ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SEQ
         (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
              (SEQ (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT $ 61)))
                   (EXIT (LETT |x| (QCDR |x|))))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |s|))) 

(SDEFUN |LIST;concat!;3$;31| ((|x| $) (|y| $) ($ $))
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

(SDEFUN |LIST;removeDuplicates!;2$;32| ((|l| $) ($ $))
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
                                                  (QREFELT $ 55))
                                        (|qset_rest| |pp| (QCDR |pr|)))
                                       ('T (LETT |pp| |pr|)))))
                                    NIL (GO G190) G191 (EXIT NIL))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |LIST;sort!;M2$;33| ((|f| |Mapping| (|Boolean|) S S) (|l| $) ($ $))
        (|LIST;mergeSort| |f| |l| (LENGTH |l|) $)) 

(SDEFUN |LIST;merge!;M3$;34|
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

(SDEFUN |LIST;split!;$Nni$;35| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|q| ($)) (#1=#:G1521 NIL))
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
                                        (QREFELT $ 35)))
                        (LETT |q| (QCDR |p|)) (|qset_rest| |p| NIL)
                        (EXIT |q|))))))) 

(SDEFUN |LIST;mergeSort|
        ((|f| |Mapping| (|Boolean|) S S) (|p| $) (|n| |Integer|) ($ $))
        (SPROG ((|q| ($)) (|l| (|NonNegativeInteger|)) (#1=#:G1525 NIL))
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
                         (LETT |q| (SPADCALL |p| |l| (QREFELT $ 67)))
                         (LETT |p| (|LIST;mergeSort| |f| |p| |l| $))
                         (LETT |q| (|LIST;mergeSort| |f| |q| (- |n| |l|) $))
                         (EXIT (SPADCALL |f| |p| |q| (QREFELT $ 66)))))))))) 

(SDEFUN |LIST;append;3$;37| ((|l| $) (|t| $) ($ $))
        (SPADCALL |l| |t| (QREFELT $ 68))) 

(SDEFUN |LIST;tails;$L;38| ((|x| $) ($ |List| $))
        (SPROG ((#1=#:G1539 NIL) (|i| NIL) (#2=#:G1538 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# (- (LENGTH |x|) 1)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |x| |i| (QREFELT $ 35)) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LIST;writeOMList| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 73))
             (SPADCALL |dev| "list1" "list" (QREFELT $ 74))
             (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                  (SEQ (SPADCALL |dev| (|SPADfirst| |x|) NIL (QREFELT $ 75))
                       (EXIT (LETT |x| (CDR |x|))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |dev| (QREFELT $ 76))))) 

(SDEFUN |LIST;OMwrite;Omd$BV;40|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 77))))
             (|LIST;writeOMList| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 78))))))) 

(SDEFUN |LIST;setUnion;3$;41| ((|l1| $) (|l2| $) ($ $))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 68)) (QREFELT $ 80))) 

(SDEFUN |LIST;setIntersection;3$;42| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|u| ($)))
               (SEQ (LETT |u| NIL) (LETT |l1| (SPADCALL |l1| (QREFELT $ 80)))
                    (SEQ G190 (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL (|SPADfirst| |l1|) |l2| (QREFELT $ 56))
                            (LETT |u| (CONS (|SPADfirst| |l1|) |u|))))
                          (EXIT (LETT |l1| (CDR |l1|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |u|)))) 

(SDEFUN |LIST;setDifference;3$;43| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|lu| ($)) (|l11| (S)))
               (SEQ (LETT |l1| (SPADCALL |l1| (QREFELT $ 80)))
                    (EXIT
                     (COND ((NULL |l2|) |l1|)
                           ('T
                            (SEQ (LETT |lu| NIL)
                                 (SEQ G190
                                      (COND
                                       ((NULL (NULL (NULL |l1|))) (GO G191)))
                                      (SEQ
                                       (LETT |l11|
                                             (SPADCALL |l1| 1 (QREFELT $ 83)))
                                       (COND
                                        ((NULL
                                          (SPADCALL |l11| |l2| (QREFELT $ 56)))
                                         (LETT |lu|
                                               (SPADCALL |l11| |lu|
                                                         (QREFELT $ 10)))))
                                       (EXIT (LETT |l1| (CDR |l1|))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT |lu|)))))))) 

(SDEFUN |LIST;map!;M2$;44| ((|f| |Mapping| S S) (|l| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ (LETT |y| |l|)
                    (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                         (SEQ
                          (SPADCALL |l| (SPADCALL (|SPADfirst| |l|) |f|)
                                    (QREFELT $ 22))
                          (EXIT (LETT |l| (CDR |l|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |y|)))) 

(SDEFUN |LIST;convert;$If;45| ((|x| $) ($ |InputForm|))
        (SPROG ((#1=#:G1579 NIL) (|a| NIL) (#2=#:G1578 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL '|construct| (QREFELT $ 89))
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |a| NIL) (LETT #1# |x|) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |a| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |a| (QREFELT $ 90))
                                               #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 92))
                 (QREFELT $ 93))))) 

(DECLAIM (NOTINLINE |List;|)) 

(DEFUN |List| (#1=#:G1592)
  (SPROG NIL
         (PROG (#2=#:G1593)
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
   ((#1=#:G1588 NIL) (#2=#:G1589 NIL) (#3=#:G1591 NIL) (#4=#:G1590 NIL)
    (|pv$| NIL) (#5=#:G1585 NIL) (#6=#:G1586 NIL) (#7=#:G1587 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|List| DV$1))
    (LETT $ (GETREFV 105))
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
      (QSETREFV $ 52 (CONS (|dispatchFunction| |LIST;coerce;$Of;26|) $))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 54 (CONS (|dispatchFunction| |LIST;=;2$B;27|) $))
       (QSETREFV $ 56 (CONS (|dispatchFunction| |LIST;member?;S$B;28|) $)))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 59 (CONS (|dispatchFunction| |LIST;latex;$S;29|) $))
       (QSETREFV $ 61
                 (CONS (|dispatchFunction| |LIST;hashUpdate!;Hs$Hs;30|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 63
                (CONS (|dispatchFunction| |LIST;removeDuplicates!;2$;32|) $))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 79
                 (CONS (|dispatchFunction| |LIST;OMwrite;Omd$BV;40|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 81 (CONS (|dispatchFunction| |LIST;setUnion;3$;41|) $))
       (QSETREFV $ 82
                 (CONS (|dispatchFunction| |LIST;setIntersection;3$;42|) $))
       (QSETREFV $ 84
                 (CONS (|dispatchFunction| |LIST;setDifference;3$;43|) $)))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 94 (CONS (|dispatchFunction| |LIST;convert;$If;45|) $))))
    $))) 

(MAKEPROP '|List| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |LIST;#;$Nni;1| |LIST;cons;S2$;2| |LIST;concat;S2$;3| (|Boolean|)
              |LIST;eq?;2$B;4| |LIST;first;$S;5| '"first" |LIST;elt;$firstS;6|
              |LIST;empty;$;7| |LIST;empty?;$B;8| |LIST;rest;2$;9| '"rest"
              |LIST;elt;$rest$;10| |LIST;qsetfirst!;$2S;11|
              |LIST;setfirst!;$2S;12| |LIST;setelt!;$first2S;13|
              |LIST;qsetrest!;3$;14| |LIST;setrest!;3$;15|
              |LIST;setelt!;$rest2$;16| (|List| 6) |LIST;construct;2$;17|
              |LIST;parts;2$;18| |LIST;reverse!;2$;19| |LIST;reverse;2$;20|
              (|Integer|) |LIST;minIndex;$I;21| |LIST;maxIndex;$I;22|
              |LIST;rest;$Nni$;23| (0 . |cyclic?|) |LIST;copy;2$;24|
              (5 . |leaf?|) (10 . |value|) |LIST;leaves;2$;25|
              (15 . |cycleEntry|) (|OutputForm|) (20 . |coerce|) (|List| 42)
              (25 . |concat|) (|List| $) (31 . |bracket|) (36 . |list|)
              (41 . |commaSeparate|) (46 . |overbar|) (51 . |concat!|)
              (57 . |coerce|) (62 . ~=) (68 . =) (74 . =) (80 . |member?|)
              (|String|) (86 . |latex|) (91 . |latex|) (|HashState|)
              (96 . |hashUpdate!|) |LIST;concat!;3$;31|
              (102 . |removeDuplicates!|) (|Mapping| 11 6 6)
              |LIST;sort!;M2$;33| |LIST;merge!;M3$;34| |LIST;split!;$Nni$;35|
              (107 . |concat|) |LIST;append;3$;37| |LIST;tails;$L;38| (|Void|)
              (|OpenMathDevice|) (113 . |OMputApp|) (118 . |OMputSymbol|)
              (125 . |OMwrite|) (132 . |OMputEndApp|) (137 . |OMputObject|)
              (142 . |OMputEndObject|) (147 . |OMwrite|)
              (154 . |removeDuplicates|) (159 . |setUnion|)
              (165 . |setIntersection|) (171 . |elt|) (177 . |setDifference|)
              (|Mapping| 6 6) |LIST;map!;M2$;44| (|Symbol|) (|InputForm|)
              (183 . |convert|) (188 . |convert|) (|List| 88) (193 . |concat|)
              (199 . |convert|) (204 . |convert|) (|Mapping| 6 6 6)
              (|Equation| 6) (|List| 96) (|SingleInteger|) (|Mapping| 11 6)
              (|UniversalSegment| 32) '"last" '"value" (|List| 32)
              (|Union| 6 '"failed"))
           '#(~= 209 |value| 215 |trim| 220 |third| 226 |tails| 231 |tail| 236
              |swap!| 241 |split!| 248 |sorted?| 254 |sort!| 265 |sort| 276
              |smaller?| 287 |size?| 293 |setvalue!| 299 |setrest!| 305
              |setlast!| 311 |setfirst!| 317 |setelt!| 323 |setchildren!| 365
              |setUnion| 371 |setIntersection| 377 |setDifference| 383
              |select!| 389 |select| 395 |second| 401 |sample| 406 |rightTrim|
              410 |reverse!| 416 |reverse| 421 |rest| 426 |removeDuplicates!|
              437 |removeDuplicates| 442 |remove!| 447 |remove| 459 |reduce|
              471 |qsetrest!| 492 |qsetfirst!| 498 |qsetelt!| 504 |qelt| 511
              |possiblyInfinite?| 517 |position| 522 |parts| 541 |nodes| 546
              |node?| 551 |new| 557 |more?| 563 |minIndex| 569 |min| 574
              |merge!| 585 |merge| 598 |members| 611 |member?| 616 |maxIndex|
              622 |max| 627 |map!| 644 |map| 650 |list| 663 |less?| 668
              |leftTrim| 674 |leaves| 680 |leaf?| 685 |latex| 690 |last| 695
              |insert!| 706 |insert| 720 |indices| 734 |index?| 739
              |hashUpdate!| 745 |hash| 751 |first| 756 |find| 767 |fill!| 773
              |explicitlyFinite?| 779 |every?| 784 |eval| 790 |eq?| 816
              |entry?| 822 |entries| 828 |empty?| 833 |empty| 838 |elt| 842
              |distance| 885 |delete!| 891 |delete| 903 |cyclic?| 915
              |cycleTail| 920 |cycleSplit!| 925 |cycleLength| 930 |cycleEntry|
              935 |count| 940 |copyInto!| 952 |copy| 959 |convert| 964
              |construct| 969 |cons| 974 |concat!| 980 |concat| 992 |coerce|
              1015 |children| 1020 |child?| 1025 |append| 1031 |any?| 1037
              |OMwrite| 1043 >= 1067 > 1073 = 1079 <= 1085 < 1091 |#| 1097)
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
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 32 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 32 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 100 $$) (|Type|)
                 (|Eltable| 32 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 42) (|PartialOrder|) (|ConvertibleTo| 88)
                 (|OpenMath|))
              (|makeByteWordVec2| 104
                                  '(1 0 11 0 36 1 0 11 0 38 1 0 6 0 39 1 0 0 0
                                    41 1 6 42 0 43 2 44 0 42 0 45 1 42 0 46 47
                                    1 44 0 42 48 1 42 0 46 49 1 42 0 0 50 2 44
                                    0 0 42 51 1 0 42 0 52 2 6 11 0 0 53 2 0 11
                                    0 0 54 2 6 11 0 0 55 2 0 11 6 0 56 1 6 57 0
                                    58 1 0 57 0 59 2 0 60 60 0 61 1 0 0 0 63 2
                                    0 0 0 0 68 1 72 71 0 73 3 72 71 0 57 57 74
                                    3 6 71 72 0 11 75 1 72 71 0 76 1 72 71 0 77
                                    1 72 71 0 78 3 0 71 72 0 11 79 1 0 0 0 80 2
                                    0 0 0 0 81 2 0 0 0 0 82 2 0 6 0 32 83 2 0 0
                                    0 0 84 1 88 0 87 89 1 6 88 0 90 2 91 0 88 0
                                    92 1 88 0 46 93 1 0 88 0 94 2 20 11 0 0 1 1
                                    0 6 0 39 2 19 0 0 6 1 1 0 6 0 1 1 0 46 0 70
                                    1 0 0 0 1 3 21 71 0 32 32 1 2 21 0 0 7 67 1
                                    15 11 0 1 2 14 11 64 0 1 1 22 0 0 1 2 23 0
                                    64 0 65 1 15 0 0 1 2 14 0 64 0 1 2 18 11 0
                                    0 1 2 0 11 0 7 1 2 21 6 0 6 1 2 21 0 0 0 25
                                    2 21 6 0 6 1 2 21 6 0 6 22 3 21 6 0 32 6 1
                                    3 21 6 0 100 6 1 3 21 6 0 101 6 1 3 21 0 0
                                    19 0 26 3 21 6 0 14 6 23 3 21 6 0 102 6 1 2
                                    21 0 0 46 1 2 4 0 0 0 81 2 4 0 0 0 82 2 4 0
                                    0 0 84 2 0 0 99 0 1 2 14 0 99 0 1 1 0 6 0 1
                                    0 0 0 1 2 19 0 0 6 1 1 23 0 0 30 1 14 0 0
                                    31 2 0 0 0 7 35 1 0 0 0 18 1 4 0 0 63 1 19
                                    0 0 80 2 4 0 6 0 1 2 0 0 99 0 1 2 19 0 6 0
                                    1 2 14 0 99 0 1 4 19 6 95 0 6 6 1 3 14 6 95
                                    0 6 1 2 14 6 95 0 1 2 21 0 0 0 24 2 21 6 0
                                    6 21 3 21 6 0 32 6 1 2 0 6 0 32 1 1 0 11 0
                                    1 2 19 32 6 0 1 3 19 32 6 0 32 1 2 14 32 99
                                    0 1 1 14 27 0 29 1 0 46 0 1 2 4 11 0 0 1 2
                                    0 0 7 6 1 2 0 11 0 7 1 1 13 32 0 33 2 15 0
                                    0 0 1 1 15 6 0 1 2 1 0 0 0 1 3 0 0 64 0 0
                                    66 2 15 0 0 0 1 3 14 0 64 0 0 1 1 14 27 0 1
                                    2 19 11 6 0 56 1 13 32 0 34 2 15 0 0 0 1 1
                                    15 6 0 1 2 14 6 64 0 1 2 21 0 85 0 86 3 0 0
                                    95 0 0 1 2 0 0 85 0 1 1 0 0 6 1 2 0 11 0 7
                                    1 2 19 0 0 6 1 1 0 27 0 40 1 0 11 0 38 1 17
                                    57 0 59 2 0 0 0 7 1 1 0 6 0 1 3 0 0 6 0 32
                                    1 3 0 0 0 0 32 1 3 0 0 0 0 32 1 3 0 0 6 0
                                    32 1 1 0 103 0 1 2 0 11 32 0 1 2 17 60 60 0
                                    61 1 17 98 0 1 2 0 0 0 7 1 1 0 6 0 13 2 0
                                    104 99 0 1 2 21 0 0 6 1 1 0 11 0 1 2 14 11
                                    99 0 1 3 8 0 0 6 6 1 3 8 0 0 27 27 1 2 8 0
                                    0 96 1 2 8 0 0 97 1 2 0 11 0 0 12 2 19 11 6
                                    0 1 1 0 27 0 1 1 0 11 0 17 0 0 0 16 2 0 6 0
                                    32 83 3 0 6 0 32 6 1 2 0 0 0 100 1 2 0 6 0
                                    101 1 2 0 0 0 19 20 2 0 6 0 14 15 2 0 6 0
                                    102 1 2 0 32 0 0 1 2 0 0 0 32 1 2 0 0 0 100
                                    1 2 0 0 0 32 1 2 0 0 0 100 1 1 0 11 0 36 1
                                    0 0 0 1 1 21 0 0 1 1 0 7 0 1 1 0 0 0 41 2
                                    19 7 6 0 1 2 14 7 99 0 1 3 23 0 0 0 32 1 1
                                    0 0 0 37 1 2 88 0 94 1 0 0 27 28 2 0 0 6 0
                                    9 2 0 0 0 6 1 2 0 0 0 0 62 1 0 0 46 1 2 0 0
                                    0 6 1 2 0 0 6 0 10 2 0 0 0 0 68 1 16 42 0
                                    52 1 0 46 0 1 2 4 11 0 0 1 2 0 0 0 0 69 2
                                    14 11 99 0 1 1 3 57 0 1 2 3 71 72 0 1 2 3
                                    57 0 11 1 3 3 71 72 0 11 79 2 15 11 0 0 1 2
                                    15 11 0 0 1 2 20 11 0 0 54 2 15 11 0 0 1 2
                                    15 11 0 0 1 1 14 7 0 8)))))
           '|lookupComplete|)) 
