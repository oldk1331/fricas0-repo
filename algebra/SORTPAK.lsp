
(SDEFUN |SORTPAK;bubbleSort!;AMA;1|
        ((|m| A) (|f| |Mapping| (|Boolean|) S S) ($ A))
        (SPROG
         ((#1=#:G115 NIL) (|j| NIL) (#2=#:G114 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL |m| (QREFELT $ 9)))
              (SEQ (LETT |i| 1) (LETT #2# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| |n|) (LETT #1# (+ |i| 1)) G190
                          (COND ((< |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |m| |j| (QREFELT $ 11))
                                        (SPADCALL |m| (- |j| 1) (QREFELT $ 11))
                                        |f|)
                              (SPADCALL |m| |j| (- |j| 1) (QREFELT $ 13))))))
                          (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |SORTPAK;insertionSort!;AMA;2|
        ((|m| A) (|f| |Mapping| (|Boolean|) S S) ($ A))
        (SPROG ((|j| (|NonNegativeInteger|)) (#1=#:G122 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 2) (LETT #1# (SPADCALL |m| (QREFELT $ 9))) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (LETT |j| |i|)
                          (EXIT
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND
                                    ((SPADCALL |j| 1 (QREFELT $ 17))
                                     (SPADCALL
                                      (SPADCALL |m| |j| (QREFELT $ 11))
                                      (SPADCALL |m| (- |j| 1) (QREFELT $ 11))
                                      |f|))
                                    ('T NIL)))
                                  (GO G191)))
                                (SEQ
                                 (SPADCALL |m| |j| (- |j| 1) (QREFELT $ 13))
                                 (EXIT (LETT |j| (- |j| 1))))
                                NIL (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |SORTPAK;bubbleSort!;2A;3| ((|m| A) ($ A))
        (SPADCALL |m| (ELT $ 19) (QREFELT $ 15))) 

(SDEFUN |SORTPAK;insertionSort!;2A;4| ((|m| A) ($ A))
        (SPADCALL |m| (ELT $ 19) (QREFELT $ 18))) 

(SDEFUN |SORTPAK;bubbleSort!;AMA;5|
        ((|m| A) (|fn| |Mapping| (|Boolean|) S S) ($ A))
        (SPROG ((|l| (A)) (|x| (S)) (|r| (A)))
               (SEQ
                (COND ((SPADCALL |m| (QREFELT $ 22)) |m|)
                      ('T
                       (SEQ (LETT |l| |m|)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL
                                     (SPADCALL
                                      (LETT |r|
                                            (SPADCALL |l| '|rest|
                                                      (QREFELT $ 24)))
                                      (QREFELT $ 22))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |r| (SPADCALL |r| |fn| (QREFELT $ 15)))
                                  (LETT |x|
                                        (SPADCALL |l| '|first| (QREFELT $ 26)))
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |r| '|first| (QREFELT $ 26)) |x|
                                     |fn|)
                                    (SEQ
                                     (SPADCALL |l| '|first|
                                               (SPADCALL |r| '|first|
                                                         (QREFELT $ 26))
                                               (QREFELT $ 27))
                                     (EXIT
                                      (SPADCALL |r| '|first| |x|
                                                (QREFELT $ 27))))))
                                  (SPADCALL |l| '|rest| |r| (QREFELT $ 28))
                                  (EXIT
                                   (LETT |l|
                                         (SPADCALL |l| '|rest|
                                                   (QREFELT $ 24)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |m|))))))) 

(DECLAIM (NOTINLINE |SortPackage;|)) 

(DEFUN |SortPackage| (&REST #1=#:G139)
  (SPROG NIL
         (PROG (#2=#:G140)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SortPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SortPackage;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SortPackage|)))))))))) 

(DEFUN |SortPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|SortPackage| DV$1 DV$2))
          (LETT $ (GETREFV 29))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))))))
          (|haddProp| |$ConstructorCache| '|SortPackage| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 20
                       (CONS (|dispatchFunction| |SORTPAK;bubbleSort!;2A;3|)
                             $))
             (QSETREFV $ 21
                       (CONS (|dispatchFunction| |SORTPAK;insertionSort!;2A;4|)
                             $)))))
          (COND
           ((|HasCategory| |#2|
                           (LIST '|UnaryRecursiveAggregate|
                                 (|devaluate| |#1|)))
            (QSETREFV $ 15
                      (CONS (|dispatchFunction| |SORTPAK;bubbleSort!;AMA;5|)
                            $))))
          $))) 

(MAKEPROP '|SortPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |#|) (|Integer|) (5 . |elt|) (|Void|)
              (11 . |swap!|) (|Mapping| 16 6 6) |SORTPAK;bubbleSort!;AMA;1|
              (|Boolean|) (18 . >) |SORTPAK;insertionSort!;AMA;2| (24 . <)
              (30 . |bubbleSort!|) (35 . |insertionSort!|) (40 . |empty?|)
              '"rest" (45 . |elt|) '"first" (51 . |elt|) (57 . |setelt!|)
              (64 . |setelt!|))
           '#(|insertionSort!| 71 |bubbleSort!| 82) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|bubbleSort!|
                                 (|#2| |#2| (|Mapping| (|Boolean|) |#1| |#1|)))
                                T)
                              '((|insertionSort!|
                                 (|#2| |#2| (|Mapping| (|Boolean|) |#1| |#1|)))
                                T)
                              '((|bubbleSort!| (|#2| |#2|))
                                (|has| 6 (|OrderedSet|)))
                              '((|insertionSort!| (|#2| |#2|))
                                (|has| 6 (|OrderedSet|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 28
                                            '(1 7 8 0 9 2 7 6 0 10 11 3 7 12 0
                                              10 10 13 2 8 16 0 0 17 2 6 16 0 0
                                              19 1 0 7 7 20 1 0 7 7 21 1 7 16 0
                                              22 2 7 0 0 23 24 2 7 6 0 25 26 3
                                              7 6 0 25 6 27 3 7 0 0 23 0 28 1 1
                                              7 7 21 2 0 7 7 14 18 1 1 7 7 20 2
                                              0 7 7 14 15)))))
           '|lookupComplete|)) 
