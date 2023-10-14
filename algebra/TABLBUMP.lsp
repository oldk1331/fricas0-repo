
(SDEFUN |TABLBUMP;bumprow;MLLR;1|
        ((|cf| |Mapping| (|Boolean|) S S) (|x| |List| S)
         (|lls| |List| (|List| S))
         ($ |Record| (|:| |fs| (|Boolean|)) (|:| |sd| (|List| S))
          (|:| |td| (|List| (|List| S)))))
        (SPROG
         ((|rw|
           (|Record| (|:| |fs| (|Boolean|)) (|:| |sd| (|List| S))
                     (|:| |td| (|List| (|List| S)))))
          (|y| (|List| S)))
         (SEQ
          (COND ((NULL |lls|) (VECTOR 'NIL |x| (LIST |x|)))
                (#1='T
                 (SEQ
                  (LETT |y| (|SPADfirst| |lls|)
                        . #2=(|TABLBUMP;bumprow;MLLR;1|))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |x| 2 (QREFELT $ 9))
                               (SPADCALL |y| 2 (QREFELT $ 9)) |cf|)
                     (VECTOR 'T
                             (LIST (SPADCALL |x| 1 (QREFELT $ 9))
                                   (SPADCALL |y| 2 (QREFELT $ 9)))
                             (CONS
                              (LIST (SPADCALL |y| 1 (QREFELT $ 9))
                                    (SPADCALL |x| 2 (QREFELT $ 9)))
                              (CDR |lls|))))
                    (#1#
                     (SEQ
                      (LETT |rw| (SPADCALL |cf| |x| (CDR |lls|) (QREFELT $ 13))
                            . #2#)
                      (EXIT
                       (VECTOR (QVELT |rw| 0) (QVELT |rw| 1)
                               (CONS (|SPADfirst| |lls|)
                                     (QVELT |rw| 2)))))))))))))) 

(SDEFUN |TABLBUMP;bumptab;ML2L;2|
        ((|cf| |Mapping| (|Boolean|) S S) (|x| |List| S)
         (|llls| |List| (|List| (|List| S))) ($ |List| (|List| (|List| S))))
        (SPROG
         ((|rw|
           (|Record| (|:| |fs| (|Boolean|)) (|:| |sd| (|List| S))
                     (|:| |td| (|List| (|List| S))))))
         (SEQ
          (COND ((NULL |llls|) (LIST (LIST |x|)))
                (#1='T
                 (SEQ
                  (LETT |rw|
                        (SPADCALL |cf| |x| (|SPADfirst| |llls|) (QREFELT $ 13))
                        |TABLBUMP;bumptab;ML2L;2|)
                  (EXIT
                   (COND
                    ((QVELT |rw| 0)
                     (CONS (QVELT |rw| 2)
                           (SPADCALL |cf| (QVELT |rw| 1) (CDR |llls|)
                                     (QREFELT $ 15))))
                    (#1# (CONS (QVELT |rw| 2) (CDR |llls|))))))))))) 

(SDEFUN |TABLBUMP;bumptab1;L2L;3|
        ((|x| |List| S) (|llls| |List| (|List| (|List| S)))
         ($ |List| (|List| (|List| S))))
        (SPADCALL (ELT $ 17) |x| |llls| (QREFELT $ 15))) 

(SDEFUN |TABLBUMP;tab1;LL;4|
        ((|lls| |List| (|List| S)) ($ |List| (|List| (|List| S))))
        (SPADCALL NIL (ELT $ 18) (SPADCALL |lls| (QREFELT $ 20))
                  (QREFELT $ 23))) 

(SDEFUN |TABLBUMP;lexorder| ((|p1| |List| S) (|p2| |List| S) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |p1| 1 (QREFELT $ 9))
                    (SPADCALL |p2| 1 (QREFELT $ 9)) (QREFELT $ 25))
          (SPADCALL (SPADCALL |p1| 2 (QREFELT $ 9))
                    (SPADCALL |p2| 2 (QREFELT $ 9)) (QREFELT $ 17)))
         ('T
          (SPADCALL (SPADCALL |p1| 1 (QREFELT $ 9))
                    (SPADCALL |p2| 1 (QREFELT $ 9)) (QREFELT $ 17))))) 

(SDEFUN |TABLBUMP;lex;2L;6| ((|lp| |List| (|List| S)) ($ |List| (|List| S)))
        (SPADCALL (CONS #'|TABLBUMP;lex;2L;6!0| $) |lp| (QREFELT $ 27))) 

(SDEFUN |TABLBUMP;lex;2L;6!0| ((|s1| NIL) (|s2| NIL) ($ NIL))
        (|TABLBUMP;lexorder| |s1| |s2| $)) 

(SDEFUN |TABLBUMP;slex;LL;7| ((|ls| |List| S) ($ |List| (|List| S)))
        (SPROG
         ((#1=#:G133 NIL) (|i| NIL) (#2=#:G134 NIL) (|j| NIL) (#3=#:G132 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #3# NIL . #4=(|TABLBUMP;slex;LL;7|))
            (SEQ (LETT |j| NIL . #4#) (LETT #2# |ls| . #4#)
                 (LETT |i| NIL . #4#)
                 (LETT #1# (SPADCALL (ELT $ 17) |ls| (QREFELT $ 29)) . #4#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #4#) NIL)
                       (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #3# (CONS (LIST |i| |j|) #3#) . #4#)))
                 (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
                 (GO G190) G191 (EXIT (NREVERSE #3#))))
           (QREFELT $ 28))))) 

(SDEFUN |TABLBUMP;inverse;2L;8| ((|ls| |List| S) ($ |List| S))
        (SPROG
         ((#1=#:G139 NIL) (#2=#:G141 NIL) (|i| NIL) (#3=#:G142 NIL) (|j| NIL)
          (#4=#:G140 NIL) (|lss| NIL) (#5=#:G138 NIL))
         (SEQ
          (PROGN
           (LETT #5# NIL . #6=(|TABLBUMP;inverse;2L;8|))
           (SEQ (LETT |lss| NIL . #6#)
                (LETT #1#
                      (SPADCALL
                       (PROGN
                        (LETT #4# NIL . #6#)
                        (SEQ (LETT |j| NIL . #6#) (LETT #3# |ls| . #6#)
                             (LETT |i| NIL . #6#)
                             (LETT #2#
                                   (SPADCALL (ELT $ 17) |ls| (QREFELT $ 29))
                                   . #6#)
                             G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |i| (CAR #2#) . #6#) NIL)
                                   (ATOM #3#)
                                   (PROGN (LETT |j| (CAR #3#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #4# (CONS (LIST |j| |i|) #4#) . #6#)))
                             (LETT #2#
                                   (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #6#))
                                   . #6#)
                             (GO G190) G191 (EXIT (NREVERSE #4#))))
                       (QREFELT $ 28))
                      . #6#)
                G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |lss| (CAR #1#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #5# (CONS (SPADCALL |lss| 2 (QREFELT $ 9)) #5#)
                        . #6#)))
                (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                (EXIT (NREVERSE #5#))))))) 

(SDEFUN |TABLBUMP;tab;LT;9| ((|ls| |List| S) ($ |Tableau| (|List| S)))
        (SPADCALL (SPADCALL (SPADCALL |ls| (QREFELT $ 30)) (QREFELT $ 24))
                  (QREFELT $ 33))) 

(SDEFUN |TABLBUMP;maxrow;LLL3LR;10|
        ((|n| |List| S) (|a| |List| (|List| (|List| S)))
         (|b| |List| (|List| S)) (|c| |List| (|List| (|List| S)))
         (|d| |List| (|List| (|List| S))) (|llls| |List| (|List| (|List| S)))
         ($ |Record| (|:| |f1| (|List| S))
          (|:| |f2| (|List| (|List| (|List| S))))
          (|:| |f3| (|List| (|List| S)))
          (|:| |f4| (|List| (|List| (|List| S))))))
        (SPROG ((|rst| (|List| (|List| S))) (|fst| (|List| S)))
               (SEQ
                (COND
                 ((OR (NULL |llls|) (NULL (|SPADfirst| |llls|)))
                  (VECTOR |n| |a| |b| |c|))
                 ('T
                  (SEQ
                   (LETT |fst| (|SPADfirst| (|SPADfirst| |llls|))
                         . #1=(|TABLBUMP;maxrow;LLL3LR;10|))
                   (LETT |rst| (CDR (|SPADfirst| |llls|)) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |fst| 1 (QREFELT $ 9))
                                (SPADCALL |n| 1 (QREFELT $ 9)) (QREFELT $ 35))
                      (SPADCALL |fst| |d| |rst| (CDR |llls|)
                                (CONS (|SPADfirst| |llls|) |d|) (CDR |llls|)
                                (QREFELT $ 37)))
                     ('T
                      (SPADCALL |n| |a| |b| |c| (CONS (|SPADfirst| |llls|) |d|)
                                (CDR |llls|) (QREFELT $ 37))))))))))) 

(SDEFUN |TABLBUMP;mr;LR;11|
        ((|llls| |List| (|List| (|List| S)))
         ($ |Record| (|:| |f1| (|List| S))
          (|:| |f2| (|List| (|List| (|List| S))))
          (|:| |f3| (|List| (|List| S)))
          (|:| |f4| (|List| (|List| (|List| S))))))
        (SPADCALL (|SPADfirst| (|SPADfirst| |llls|)) NIL
                  (CDR (|SPADfirst| |llls|)) (CDR |llls|) NIL |llls|
                  (QREFELT $ 37))) 

(SDEFUN |TABLBUMP;untab;LLL;12|
        ((|lp| |List| (|List| S)) (|llls| |List| (|List| (|List| S)))
         ($ |List| (|List| S)))
        (SPROG
         ((|rv| (|List| (|List| (|List| S))))
          (|rc|
           (|Record| (|:| |f1| (|List| S))
                     (|:| |f2| (|List| (|List| (|List| S))))
                     (|:| |f3| (|List| (|List| S)))
                     (|:| |f4| (|List| (|List| (|List| S)))))))
         (SEQ
          (COND ((NULL |llls|) |lp|)
                (#1='T
                 (SEQ
                  (LETT |rc| (SPADCALL |llls| (QREFELT $ 38))
                        . #2=(|TABLBUMP;untab;LLL;12|))
                  (LETT |rv|
                        (REVERSE
                         (SPADCALL (CONS #'|TABLBUMP;untab;LLL;12!0| $)
                                   (QVELT |rc| 0) (QVELT |rc| 1)
                                   (QREFELT $ 15)))
                        . #2#)
                  (EXIT
                   (SPADCALL (CONS (|SPADfirst| (|SPADfirst| |rv|)) |lp|)
                             (APPEND (CDR |rv|)
                                     (COND ((NULL (QVELT |rc| 2)) NIL)
                                           (#1#
                                            (CONS (QVELT |rc| 2)
                                                  (QVELT |rc| 3)))))
                             (QREFELT $ 39))))))))) 

(SDEFUN |TABLBUMP;untab;LLL;12!0| ((|s1| NIL) (|s2| NIL) ($ NIL))
        (SPADCALL |s2| |s1| (QREFELT $ 17))) 

(SDEFUN |TABLBUMP;bat1;LL;13|
        ((|llls| |List| (|List| (|List| S))) ($ |List| (|List| S)))
        (SPROG ((#1=#:G160 NIL) (|lls| NIL) (#2=#:G159 NIL))
               (SEQ
                (SPADCALL NIL
                          (PROGN
                           (LETT #2# NIL . #3=(|TABLBUMP;bat1;LL;13|))
                           (SEQ (LETT |lls| NIL . #3#) (LETT #1# |llls| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |lls| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2# (CONS (REVERSE |lls|) #2#) . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 39))))) 

(SDEFUN |TABLBUMP;bat;TL;14|
        ((|tb| |Tableau| (|List| S)) ($ |List| (|List| S)))
        (SPADCALL (SPADCALL |tb| (QREFELT $ 41)) (QREFELT $ 40))) 

(DECLAIM (NOTINLINE |TableauxBumpers;|)) 

(DEFUN |TableauxBumpers| (#1=#:G162)
  (SPROG NIL
         (PROG (#2=#:G163)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TableauxBumpers|)
                                               '|domainEqualList|)
                    . #3=(|TableauxBumpers|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TableauxBumpers;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TableauxBumpers|)))))))))) 

(DEFUN |TableauxBumpers;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TableauxBumpers|))
          (LETT |dv$| (LIST '|TableauxBumpers| DV$1) . #1#)
          (LETT $ (GETREFV 43) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TableauxBumpers| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TableauxBumpers| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|List| 6)
              (0 . |elt|) (|Record| (|:| |fs| 16) (|:| |sd| 8) (|:| |td| 12))
              (|Mapping| 16 6 6) (|List| 8) |TABLBUMP;bumprow;MLLR;1|
              (|List| 12) |TABLBUMP;bumptab;ML2L;2| (|Boolean|) (6 . <)
              |TABLBUMP;bumptab1;L2L;3| (|Stream| 8) (12 . |coerce|)
              (|Mapping| 14 8 14) (|StreamFunctions2| 8 14) (17 . |reduce|)
              |TABLBUMP;tab1;LL;4| (24 . =) (|Mapping| 16 8 8) (30 . |sort|)
              |TABLBUMP;lex;2L;6| (36 . |sort|) |TABLBUMP;slex;LL;7|
              |TABLBUMP;inverse;2L;8| (|Tableau| 8) (42 . |tableau|)
              |TABLBUMP;tab;LT;9| (47 . >)
              (|Record| (|:| |f1| 8) (|:| |f2| 14) (|:| |f3| 12) (|:| |f4| 14))
              |TABLBUMP;maxrow;LLL3LR;10| |TABLBUMP;mr;LR;11|
              |TABLBUMP;untab;LLL;12| |TABLBUMP;bat1;LL;13|
              (53 . |listOfLists|) |TABLBUMP;bat;TL;14|)
           '#(|untab| 58 |tab1| 64 |tab| 69 |slex| 74 |mr| 79 |maxrow| 84 |lex|
              94 |inverse| 99 |bumptab1| 104 |bumptab| 110 |bumprow| 117 |bat1|
              124 |bat| 129)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 42
                                                 '(2 8 6 0 7 9 2 6 16 0 0 17 1
                                                   19 0 12 20 3 22 14 14 21 19
                                                   23 2 6 16 0 0 25 2 12 0 26 0
                                                   27 2 8 0 11 0 29 1 32 0 14
                                                   33 2 6 16 0 0 35 1 32 14 0
                                                   41 2 0 12 12 14 39 1 0 14 12
                                                   24 1 0 32 8 34 1 0 12 8 30 1
                                                   0 36 14 38 6 0 36 8 14 12 14
                                                   14 14 37 1 0 12 12 28 1 0 8
                                                   8 31 2 0 14 8 14 18 3 0 14
                                                   11 8 14 15 3 0 10 11 8 12 13
                                                   1 0 12 14 40 1 0 12 32
                                                   42)))))
           '|lookupComplete|)) 
