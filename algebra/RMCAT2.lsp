
(/VERSIONCHECK 2) 

(DEFUN |RMCAT2;map;MM1M2;1| (|f| |mat| $)
  (PROG (#1=#:G134 |j| #2=#:G135 |l| #3=#:G132 |i| #4=#:G133 |k| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (QREFELT $ 6) (QREFELT $ 7) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #5=(|RMCAT2;map;MM1M2;1|))
      (SEQ (LETT |k| (SPADCALL |ans| (QREFELT $ 23)) . #5#)
           (LETT #4# (SPADCALL |ans| (QREFELT $ 24)) . #5#)
           (LETT |i| (SPADCALL |mat| (QREFELT $ 21)) . #5#)
           (LETT #3# (SPADCALL |mat| (QREFELT $ 22)) . #5#) G190
           (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |l| (SPADCALL |ans| (QREFELT $ 27)) . #5#)
                  (LETT #2# (SPADCALL |ans| (QREFELT $ 28)) . #5#)
                  (LETT |j| (SPADCALL |mat| (QREFELT $ 25)) . #5#)
                  (LETT #1# (SPADCALL |mat| (QREFELT $ 26)) . #5#) G190
                  (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF2O |ans| |k| |l|
                                (SPADCALL
                                 (SPADCALL |mat| |i| |j| (QREFELT $ 29)) |f|)
                                1 1)))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |RMCAT2;reduce;MM12R2;2| (|f| |mat| |ident| $)
  (PROG (|s| #1=#:G142 |j| #2=#:G141 |i|)
    (RETURN
     (SEQ (LETT |s| |ident| . #3=(|RMCAT2;reduce;MM12R2;2|))
          (SEQ (LETT |i| (SPADCALL |mat| (QREFELT $ 21)) . #3#)
               (LETT #2# (SPADCALL |mat| (QREFELT $ 22)) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |mat| (QREFELT $ 25)) . #3#)
                      (LETT #1# (SPADCALL |mat| (QREFELT $ 26)) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |s|
                              (SPADCALL (SPADCALL |mat| |i| |j| (QREFELT $ 29))
                                        |s| |f|)
                              . #3#)))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |s|))))) 

(DECLAIM (NOTINLINE |RectangularMatrixCategoryFunctions2;|)) 

(DEFUN |RectangularMatrixCategoryFunctions2| (&REST #1=#:G143)
  (PROG ()
    (RETURN
     (PROG (#2=#:G144)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|RectangularMatrixCategoryFunctions2|)
                                           '|domainEqualList|)
                . #3=(|RectangularMatrixCategoryFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |RectangularMatrixCategoryFunctions2;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|RectangularMatrixCategoryFunctions2|))))))))))) 

(DEFUN |RectangularMatrixCategoryFunctions2;|
       (|#1| |#2| |#3| |#4| |#5| |#6| |#7| |#8| |#9| |#10|)
  (PROG (|pv$| $ |dv$| DV$10 DV$9 DV$8 DV$7 DV$6 DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|RectangularMatrixCategoryFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT DV$6 (|devaluate| |#6|) . #1#)
      (LETT DV$7 (|devaluate| |#7|) . #1#)
      (LETT DV$8 (|devaluate| |#8|) . #1#)
      (LETT DV$9 (|devaluate| |#9|) . #1#)
      (LETT DV$10 (|devaluate| |#10|) . #1#)
      (LETT |dv$|
            (LIST '|RectangularMatrixCategoryFunctions2| DV$1 DV$2 DV$3 DV$4
                  DV$5 DV$6 DV$7 DV$8 DV$9 DV$10)
            . #1#)
      (LETT $ (GETREFV 34) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RectangularMatrixCategoryFunctions2|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7 DV$8 DV$9 DV$10)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (QSETREFV $ 11 |#6|)
      (QSETREFV $ 12 |#7|)
      (QSETREFV $ 13 |#8|)
      (QSETREFV $ 14 |#9|)
      (QSETREFV $ 15 |#10|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RectangularMatrixCategoryFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) (|local| |#9|) (|local| |#10|)
              (0 . |Zero|) (|NonNegativeInteger|) (|Matrix| 12) (4 . |new|)
              (|Integer|) (11 . |minRowIndex|) (16 . |maxRowIndex|)
              (21 . |minRowIndex|) (26 . |maxRowIndex|) (31 . |minColIndex|)
              (36 . |maxColIndex|) (41 . |minColIndex|) (46 . |maxColIndex|)
              (51 . |qelt|) (|Mapping| 12 8) |RMCAT2;map;MM1M2;1|
              (|Mapping| 12 8 12) |RMCAT2;reduce;MM12R2;2|)
           '#(|reduce| 58 |map| 65) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(0 12 0 16 3 18 0 17 17 12 19
                                                   1 11 20 0 21 1 11 20 0 22 1
                                                   15 20 0 23 1 15 20 0 24 1 11
                                                   20 0 25 1 11 20 0 26 1 15 20
                                                   0 27 1 15 20 0 28 3 11 8 0
                                                   20 20 29 3 0 12 32 11 12 33
                                                   2 0 15 30 11 31)))))
           '|lookupComplete|)) 
