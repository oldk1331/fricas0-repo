
(/VERSIONCHECK 2) 

(DEFUN |FLASORT;quickSort;M2V;1| (|l| |r| $)
  (|FLASORT;QuickSort| |l| |r| (SPADCALL |r| (QREFELT $ 9))
   (SPADCALL |r| (QREFELT $ 10)) $)) 

(DEFUN |FLASORT;siftUp| (|l| |r| |i| |n| $)
  (PROG (#1=#:G140 |j| |k| |t|)
    (RETURN
     (SEQ (LETT |t| (SPADCALL |r| |i| (QREFELT $ 13)) . #2=(|FLASORT;siftUp|))
          (EXIT
           (SEQ
            (EXIT
             (SEQ G190
                  (COND
                   ((NULL
                     (< (LETT |j| (+ (SPADCALL 2 |i| (QREFELT $ 15)) 1) . #2#)
                        |n|))
                    (GO G191)))
                  (SEQ
                   (SEQ (LETT |k| (+ |j| 1) . #2#)
                        (EXIT
                         (COND
                          ((< |k| |n|)
                           (COND
                            ((SPADCALL (SPADCALL |r| |j| (QREFELT $ 13))
                                       (SPADCALL |r| |k| (QREFELT $ 13)) |l|)
                             (LETT |j| |k| . #2#)))))))
                   (EXIT
                    (COND
                     ((SPADCALL |t| (SPADCALL |r| |j| (QREFELT $ 13)) |l|)
                      (SEQ
                       (SPADCALL |r| |i| (SPADCALL |r| |j| (QREFELT $ 13))
                                 (QREFELT $ 16))
                       (SPADCALL |r| |j| |t| (QREFELT $ 16))
                       (EXIT (LETT |i| |j| . #2#))))
                     ('T (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#))))))
                  NIL (GO G190) G191 (EXIT NIL)))
            #1# (EXIT #1#))))))) 

(DEFUN |FLASORT;heapSort;M2V;3| (|l| |r| $)
  (PROG (|k| |n|)
    (RETURN
     (SEQ
      (COND
       ((NULL (ZEROP (SPADCALL |r| (QREFELT $ 9))))
        (|error| "not implemented"))
       ('T
        (SEQ
         (LETT |n| (SPADCALL |r| (QREFELT $ 18))
               . #1=(|FLASORT;heapSort;M2V;3|))
         (SEQ (LETT |k| (- (ASH |n| -1) 1) . #1#) G190
              (COND ((< |k| 0) (GO G191)))
              (SEQ (EXIT (|FLASORT;siftUp| |l| |r| |k| |n| $)))
              (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
         (SEQ (LETT |k| (- |n| 1) . #1#) G190 (COND ((< |k| 1) (GO G191)))
              (SEQ (SPADCALL |r| 0 |k| (QREFELT $ 20))
                   (EXIT (|FLASORT;siftUp| |l| |r| 0 |k| $)))
              (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
         (EXIT |r|)))))))) 

(DEFUN |FLASORT;partition| (|l| |r| |i| |j| |k| $)
  (PROG (|s| |t| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |r| |k| (QREFELT $ 13)) . #1=(|FLASORT;partition|))
      (SEQ G190 (COND ((NULL (SPADCALL |i| |j| (QREFELT $ 23))) (GO G191)))
           (SEQ (LETT |t| (SPADCALL |r| |i| (QREFELT $ 13)) . #1#)
                (SEQ G190 (COND ((NULL (SPADCALL |t| |x| |l|)) (GO G191)))
                     (SEQ (LETT |i| (+ |i| 1) . #1#)
                          (EXIT
                           (LETT |t| (SPADCALL |r| |i| (QREFELT $ 13)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |s| (SPADCALL |r| |j| (QREFELT $ 13)) . #1#)
                (SEQ G190 (COND ((NULL (SPADCALL |x| |s| |l|)) (GO G191)))
                     (SEQ (LETT |j| (- |j| 1) . #1#)
                          (EXIT
                           (LETT |s| (SPADCALL |r| |j| (QREFELT $ 13)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((SPADCALL |i| |j| (QREFELT $ 23))
                   (SEQ (SPADCALL |r| |i| |s| (QREFELT $ 16))
                        (SPADCALL |r| |j| |t| (QREFELT $ 16))
                        (LETT |i| (+ |i| 1) . #1#)
                        (EXIT (LETT |j| (- |j| 1) . #1#)))))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT (+ |j| 1)))))) 

(DEFUN |FLASORT;QuickSort| (|l| |r| |i| |j| $)
  (PROG (|k| #1=#:G174 |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ G190 NIL
            (SEQ (LETT |n| (- |j| |i|) . #2=(|FLASORT;QuickSort|))
                 (COND
                  ((EQL |n| 1)
                   (COND
                    ((SPADCALL (SPADCALL |r| |j| (QREFELT $ 13))
                               (SPADCALL |r| |i| (QREFELT $ 13)) |l|)
                     (SPADCALL |r| |i| |j| (QREFELT $ 20))))))
                 (EXIT
                  (COND ((< |n| 2) (PROGN (LETT #1# |r| . #2#) (GO #1#)))
                        ('T
                         (SEQ
                          (LETT |k|
                                (|FLASORT;partition| |l| |r| |i| |j|
                                 (+ |i| (ASH |n| -1)) $)
                                . #2#)
                          (EXIT
                           (COND
                            ((< (- |k| |i|) (- |j| |k|))
                             (SEQ (|FLASORT;QuickSort| |l| |r| |i| (- |k| 1) $)
                                  (EXIT (LETT |i| |k| . #2#))))
                            ('T
                             (SEQ (|FLASORT;QuickSort| |l| |r| |k| |j| $)
                                  (EXIT (LETT |j| (- |k| 1) . #2#)))))))))))
            NIL (GO G190) G191 (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |FLASORT;shellSort;M2V;6| (|l| |r| $)
  (PROG (|g| |j| |i| |n| |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |r| (QREFELT $ 9)) . #1=(|FLASORT;shellSort;M2V;6|))
      (LETT |n| (SPADCALL |r| (QREFELT $ 10)) . #1#) (LETT |g| 1 . #1#)
      (SEQ G190
           (COND ((NULL (SPADCALL |g| (- |n| |m|) (QREFELT $ 23))) (GO G191)))
           (SEQ (EXIT (LETT |g| (+ (SPADCALL 3 |g| (QREFELT $ 15)) 1) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |g| (QUOTIENT2 |g| 3) . #1#)
      (SEQ G190 (COND ((NULL (SPADCALL |g| 0 (QREFELT $ 24))) (GO G191)))
           (SEQ
            (SEQ (LETT |i| (+ |m| |g|) . #1#) G190
                 (COND ((> |i| |n|) (GO G191)))
                 (SEQ (LETT |j| (- |i| |g|) . #1#)
                      (EXIT
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND
                                ((>= |j| |m|)
                                 (SPADCALL
                                  (SPADCALL |r| (+ |j| |g|) (QREFELT $ 13))
                                  (SPADCALL |r| |j| (QREFELT $ 13)) |l|))
                                ('T 'NIL)))
                              (GO G191)))
                            (SEQ (SPADCALL |r| |j| (+ |j| |g|) (QREFELT $ 20))
                                 (EXIT (LETT |j| (- |j| |g|) . #1#)))
                            NIL (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
            (EXIT (LETT |g| (QUOTIENT2 |g| 3) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |r|))))) 

(DECLAIM (NOTINLINE |FiniteLinearAggregateSort;|)) 

(DEFUN |FiniteLinearAggregateSort| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteLinearAggregateSort|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FiniteLinearAggregateSort| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 26) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FiniteLinearAggregateSort| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |maxIndex|) (|Mapping| 22 6 6)
              |FLASORT;quickSort;M2V;1| (10 . |qelt|) (|PositiveInteger|)
              (16 . *) (22 . |qsetelt!|) (|NonNegativeInteger|) (29 . |#|)
              (|Void|) (34 . |swap!|) |FLASORT;heapSort;M2V;3| (|Boolean|)
              (41 . <=) (47 . >) |FLASORT;shellSort;M2V;6|)
           '#(|shellSort| 53 |quickSort| 59 |heapSort| 65) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 25
                                                 '(1 7 8 0 9 1 7 8 0 10 2 7 6 0
                                                   8 13 2 8 0 14 0 15 3 7 6 0 8
                                                   6 16 1 7 17 0 18 3 7 19 0 8
                                                   8 20 2 8 22 0 0 23 2 8 22 0
                                                   0 24 2 0 7 11 7 25 2 0 7 11
                                                   7 12 2 0 7 11 7 21)))))
           '|lookupComplete|)) 
