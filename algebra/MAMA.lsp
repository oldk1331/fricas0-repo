
(/VERSIONCHECK 2) 

(DEFUN |MAMA;expand| (|spi| $)
  (PROG (|l| |lr| |inc| |h|)
    (RETURN
     (SEQ (LETT |lr| NIL . #1=(|MAMA;expand|))
          (LETT |l| (SPADCALL |spi| (QREFELT $ 12)) . #1#)
          (LETT |h| (SPADCALL |spi| (QREFELT $ 13)) . #1#)
          (LETT |inc| (SPADCALL |spi| (QREFELT $ 15)) . #1#)
          (EXIT
           (COND
            ((ZEROP |inc|)
             (|error| "Cannot expand a segment with an increment of zero"))
            (#2='T
             (SEQ
              (COND
               ((SPADCALL |inc| 0 (QREFELT $ 18))
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |l| |h| (QREFELT $ 19))) (GO G191)))
                     (SEQ (LETT |lr| (CONS |l| |lr|) . #1#)
                          (EXIT (LETT |l| (+ |l| |inc|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL)))
               (#2#
                (SEQ G190 (COND ((NULL (>= |l| |h|)) (GO G191)))
                     (SEQ (LETT |lr| (CONS |l| |lr|) . #1#)
                          (EXIT (LETT |l| (+ |l| |inc|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))))
              (EXIT (NREVERSE |lr|)))))))))) 

(DEFUN |MAMA;element;M2PiM;2| (A |r| |c| $)
  (SPADCALL (LIST (LIST (SPADCALL A |r| |c| (QREFELT $ 20)))) (QREFELT $ 22))) 

(DEFUN |MAMA;rowMatrix;MPiM;3| (A |r| $)
  (SPADCALL A |r| |r| (SPADCALL A (QREFELT $ 24)) (SPADCALL A (QREFELT $ 25))
            (QREFELT $ 26))) 

(DEFUN |MAMA;rows;MLM;4| (A |lst| $)
  (PROG (|ls| |ncp| |nc|)
    (RETURN
     (SEQ (LETT |nc| (SPADCALL A (QREFELT $ 29)) . #1=(|MAMA;rows;MLM;4|))
          (EXIT
           (COND ((EQL |nc| 0) (SPADCALL (LENGTH |lst|) |nc| (QREFELT $ 30)))
                 ('T
                  (SEQ (LETT |ncp| |nc| . #1#)
                       (LETT |ls|
                             (|MAMA;expand| (SPADCALL 1 |ncp| (QREFELT $ 31))
                              $)
                             . #1#)
                       (EXIT (SPADCALL A |lst| |ls| (QREFELT $ 33))))))))))) 

(DEFUN |MAMA;rows;MSM;5| (A |si| $)
  (SPADCALL A (|MAMA;expand| |si| $) (QREFELT $ 34))) 

(DEFUN |MAMA;columnMatrix;MPiM;6| (A |c| $)
  (SPADCALL A (SPADCALL A (QREFELT $ 36)) (SPADCALL A (QREFELT $ 37)) |c| |c|
            (QREFELT $ 26))) 

(DEFUN |MAMA;columns;MLM;7| (A |lst| $)
  (PROG (|ls| |nrp| |nr|)
    (RETURN
     (SEQ (LETT |nr| (SPADCALL A (QREFELT $ 39)) . #1=(|MAMA;columns;MLM;7|))
          (EXIT
           (COND ((EQL |nr| 0) (SPADCALL |nr| (LENGTH |lst|) (QREFELT $ 30)))
                 ('T
                  (SEQ (LETT |nrp| |nr| . #1#)
                       (LETT |ls|
                             (|MAMA;expand| (SPADCALL 1 |nrp| (QREFELT $ 31))
                              $)
                             . #1#)
                       (EXIT (SPADCALL A |ls| |lst| (QREFELT $ 33))))))))))) 

(DEFUN |MAMA;columns;MSM;8| (A |si| $)
  (SPADCALL A (|MAMA;expand| |si| $) (QREFELT $ 40))) 

(DEFUN |MAMA;fill_diagonal| (B A |nr| |nc| |n| $)
  (PROG (#1=#:G133 |i| |sc| |sr| |dl|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |n| (- |nc| 1) (QREFELT $ 18))
        (|error| "requested diagonal out of range"))
       (#2='T
        (SEQ
         (COND
          ((< |n| 0)
           (COND
            ((SPADCALL (ABS |n|) (- |nr| 1) (QREFELT $ 18))
             (EXIT (|error| "requested diagonal out of range"))))))
         (COND
          ((>= |n| 0)
           (SEQ (LETT |dl| (MIN (- |nc| |n|) |nr|) . #3=(|MAMA;fill_diagonal|))
                (LETT |sr| (SPADCALL A (QREFELT $ 36)) . #3#)
                (EXIT (LETT |sc| (+ (SPADCALL A (QREFELT $ 24)) |n|) . #3#))))
          (#2#
           (SEQ (LETT |dl| (MIN |nc| (- |nr| (ABS |n|))) . #3#)
                (LETT |sr| (+ (SPADCALL A (QREFELT $ 36)) (ABS |n|)) . #3#)
                (EXIT (LETT |sc| (SPADCALL A (QREFELT $ 24)) . #3#)))))
         (EXIT
          (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |dl| 1) . #3#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL B (+ |sr| |i|) (+ |sc| |i|)
                           (SPADCALL A (+ |sr| |i|) (+ |sc| |i|)
                                     (QREFELT $ 20))
                           (QREFELT $ 42))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
               (EXIT NIL)))))))))) 

(DEFUN |MAMA;diagonalMatrix;MIM;10| (A |n| $)
  (PROG (B |nc| |nr|)
    (RETURN
     (SEQ
      (LETT |nr| (SPADCALL A (QREFELT $ 39))
            . #1=(|MAMA;diagonalMatrix;MIM;10|))
      (LETT |nc| (SPADCALL A (QREFELT $ 29)) . #1#)
      (LETT B (SPADCALL |nr| |nc| (QREFELT $ 30)) . #1#)
      (|MAMA;fill_diagonal| B A |nr| |nc| |n| $) (EXIT B))))) 

(DEFUN |MAMA;diagonalMatrix;2M;11| (A $) (SPADCALL A 0 (QREFELT $ 43))) 

(DEFUN |MAMA;bandMatrix;MLM;12| (A |ln| $)
  (PROG (#1=#:G140 |n| B |nc| |nr|)
    (RETURN
     (SEQ
      (LETT |nr| (SPADCALL A (QREFELT $ 39)) . #2=(|MAMA;bandMatrix;MLM;12|))
      (LETT |nc| (SPADCALL A (QREFELT $ 29)) . #2#)
      (LETT B (SPADCALL |nr| |nc| (QREFELT $ 30)) . #2#)
      (SEQ (LETT |n| NIL . #2#) (LETT #1# |ln| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (EXIT (|MAMA;fill_diagonal| B A |nr| |nc| |n| $)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT B))))) 

(DEFUN |MAMA;bandMatrix;MSM;13| (A |si| $)
  (SPADCALL A (SPADCALL |si| (QREFELT $ 48)) (QREFELT $ 46))) 

(DEFUN |MAMA;subMatrix;M2LM;14| (A |lr| |lc| $)
  (PROG (|j| #1=#:G147 |jj| |i| #2=#:G146 |ii| |res| |m| |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |lr|) . #3=(|MAMA;subMatrix;M2LM;14|))
          (LETT |m| (LENGTH |lc|) . #3#)
          (LETT |res| (SPADCALL |n| |m| (QREFELT $ 30)) . #3#)
          (SEQ (LETT |ii| NIL . #3#) (LETT #2# |lr| . #3#) (LETT |i| 1 . #3#)
               G190
               (COND
                ((OR (|greater_SI| |i| |n|) (ATOM #2#)
                     (PROGN (LETT |ii| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |jj| NIL . #3#) (LETT #1# |lc| . #3#)
                      (LETT |j| 1 . #3#) G190
                      (COND
                       ((OR (|greater_SI| |j| |m|) (ATOM #1#)
                            (PROGN (LETT |jj| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |res| |i| |j|
                                  (SPADCALL A |ii| |jj| (QREFELT $ 50))
                                  (QREFELT $ 42))))
                      (LETT |j|
                            (PROG1 (|inc_SI| |j|) (LETT #1# (CDR #1#) . #3#))
                            . #3#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |MAMA;subMatrix;M2SM;15| (A |sr| |sc| $)
  (SPADCALL A (SPADCALL |sr| (QREFELT $ 51)) (SPADCALL |sr| (QREFELT $ 52))
            (SPADCALL |sc| (QREFELT $ 51)) (SPADCALL |sc| (QREFELT $ 52))
            (QREFELT $ 26))) 

(DEFUN |MAMA;horizConcat;LM;16| (LA $) (SPADCALL (ELT $ 54) LA (QREFELT $ 57))) 

(DEFUN |MAMA;vertConcat;LM;17| (LA $) (SPADCALL (ELT $ 59) LA (QREFELT $ 57))) 

(DEFUN |MAMA;blockConcat;LM;18| (LLA $)
  (PROG (#1=#:G162 LA #2=#:G161)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 59)
                (PROGN
                 (LETT #2# NIL . #3=(|MAMA;blockConcat;LM;18|))
                 (SEQ (LETT LA NIL . #3#) (LETT #1# LLA . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT LA (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL (ELT $ 54) LA (QREFELT $ 57))
                                    #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 57)))))) 

(DEFUN |MAMA;vertSplit;MPiL;19| (A |r| $)
  (PROG (#1=#:G171 |i| #2=#:G170 |mac| |mic| |mir| |dr|)
    (RETURN
     (SEQ
      (LETT |dr| (SPADCALL (SPADCALL A (QREFELT $ 39)) |r| (QREFELT $ 64))
            . #3=(|MAMA;vertSplit;MPiL;19|))
      (EXIT
       (COND
        ((QEQCAR |dr| 1)
         (|error| "split does not result in an equal division"))
        ('T
         (SEQ (LETT |mir| (SPADCALL A (QREFELT $ 36)) . #3#)
              (LETT |mic| (SPADCALL A (QREFELT $ 24)) . #3#)
              (LETT |mac| (SPADCALL A (QREFELT $ 25)) . #3#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |r| 1) . #3#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL A (+ |mir| (* |i| (QCDR |dr|)))
                                        (- (+ |mir| (* (+ |i| 1) (QCDR |dr|)))
                                           1)
                                        |mic| |mac| (QREFELT $ 26))
                              #2#)
                             . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))))))))))) 

(DEFUN |MAMA;vertSplit;MLL;20| (A |lr| $)
  (PROG (|result| #1=#:G207 |i| #2=#:G206 |mac| |mic| |mir| |l|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL (ELT $ 68) |lr| (QREFELT $ 70))
                  (SPADCALL A (QREFELT $ 39)) (QREFELT $ 71))
        (|error| "split does not result in proper partition"))
       ('T
        (SEQ
         (LETT |l| (CONS 1 (SPADCALL (ELT $ 68) |lr| 1 (QREFELT $ 73)))
               . #3=(|MAMA;vertSplit;MLL;20|))
         (LETT |mir| (- (SPADCALL A (QREFELT $ 36)) 1) . #3#)
         (LETT |mic| (SPADCALL A (QREFELT $ 24)) . #3#)
         (LETT |mac| (SPADCALL A (QREFELT $ 25)) . #3#)
         (EXIT
          (LETT |result|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |i| 2 . #3#) (LETT #1# (LENGTH |l|) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL A
                                         (+ |mir|
                                            (SPADCALL |l| (- |i| 1)
                                                      (QREFELT $ 74)))
                                         (-
                                          (+ |mir|
                                             (SPADCALL |l| |i| (QREFELT $ 74)))
                                          1)
                                         |mic| |mac| (QREFELT $ 26))
                               #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#))))))))) 

(DEFUN |MAMA;horizSplit;MPiL;21| (A |c| $)
  (PROG (#1=#:G216 |i| #2=#:G215 |mic| |mar| |mir| |dc|)
    (RETURN
     (SEQ
      (LETT |dc| (SPADCALL (SPADCALL A (QREFELT $ 29)) |c| (QREFELT $ 64))
            . #3=(|MAMA;horizSplit;MPiL;21|))
      (EXIT
       (COND
        ((QEQCAR |dc| 1)
         (|error| "split does not result in an equal division"))
        ('T
         (SEQ (LETT |mir| (SPADCALL A (QREFELT $ 36)) . #3#)
              (LETT |mar| (SPADCALL A (QREFELT $ 37)) . #3#)
              (LETT |mic| (SPADCALL A (QREFELT $ 24)) . #3#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |c| 1) . #3#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL A |mir| |mar|
                                        (+ |mic| (* |i| (QCDR |dc|)))
                                        (- (+ |mic| (* (+ |i| 1) (QCDR |dc|)))
                                           1)
                                        (QREFELT $ 26))
                              #2#)
                             . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))))))))))) 

(DEFUN |MAMA;horizSplit;MLL;22| (A |lc| $)
  (PROG (|result| #1=#:G252 |i| #2=#:G251 |mic| |mar| |mir| |l|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL (ELT $ 68) |lc| (QREFELT $ 70))
                  (SPADCALL A (QREFELT $ 29)) (QREFELT $ 71))
        (|error| "split does not result in proper partition"))
       ('T
        (SEQ
         (LETT |l| (CONS 1 (SPADCALL (ELT $ 68) |lc| 1 (QREFELT $ 73)))
               . #3=(|MAMA;horizSplit;MLL;22|))
         (LETT |mir| (SPADCALL A (QREFELT $ 36)) . #3#)
         (LETT |mar| (SPADCALL A (QREFELT $ 37)) . #3#)
         (LETT |mic| (- (SPADCALL A (QREFELT $ 24)) 1) . #3#)
         (EXIT
          (LETT |result|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |i| 2 . #3#) (LETT #1# (LENGTH |l|) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL A |mir| |mar|
                                         (+ |mic|
                                            (SPADCALL |l| (- |i| 1)
                                                      (QREFELT $ 74)))
                                         (-
                                          (+ |mic|
                                             (SPADCALL |l| |i| (QREFELT $ 74)))
                                          1)
                                         (QREFELT $ 26))
                               #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#))))))))) 

(DEFUN |MAMA;blockSplit;M2PiL;23| (A |nr| |nc| $)
  (PROG (#1=#:G256 X #2=#:G255)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|MAMA;blockSplit;M2PiL;23|))
       (SEQ (LETT X NIL . #3#)
            (LETT #1# (SPADCALL A |nr| (QREFELT $ 65)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL X |nc| (QREFELT $ 76)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |MAMA;blockSplit;MLPiL;24| (A |lr| |nc| $)
  (PROG (#1=#:G260 X #2=#:G259)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|MAMA;blockSplit;MLPiL;24|))
       (SEQ (LETT X NIL . #3#)
            (LETT #1# (SPADCALL A |lr| (QREFELT $ 75)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL X |nc| (QREFELT $ 76)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |MAMA;blockSplit;MPiLL;25| (A |nr| |lc| $)
  (PROG (#1=#:G264 X #2=#:G263)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|MAMA;blockSplit;MPiLL;25|))
       (SEQ (LETT X NIL . #3#)
            (LETT #1# (SPADCALL A |nr| (QREFELT $ 65)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL X |lc| (QREFELT $ 77)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |MAMA;blockSplit;M2LL;26| (A |lr| |lc| $)
  (PROG (#1=#:G268 X #2=#:G267)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|MAMA;blockSplit;M2LL;26|))
       (SEQ (LETT X NIL . #3#)
            (LETT #1# (SPADCALL A |lr| (QREFELT $ 75)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL X |lc| (QREFELT $ 77)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |MatrixManipulation;|)) 

(DEFUN |MatrixManipulation| (&REST #1=#:G269)
  (PROG ()
    (RETURN
     (PROG (#2=#:G270)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MatrixManipulation|)
                                           '|domainEqualList|)
                . #3=(|MatrixManipulation|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MatrixManipulation;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MatrixManipulation|))))))))))) 

(DEFUN |MatrixManipulation;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MatrixManipulation|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|MatrixManipulation| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 82) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MatrixManipulation|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MatrixManipulation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|) (|Segment| 10)
              (0 . |lo|) (5 . |hi|) (|Integer|) (10 . |incr|) (15 . |Zero|)
              (|Boolean|) (19 . >) (25 . <=) (31 . |elt|) (|List| (|List| 6))
              (38 . |matrix|) |MAMA;element;M2PiM;2| (43 . |minColIndex|)
              (48 . |maxColIndex|) (53 . |subMatrix|) |MAMA;rowMatrix;MPiM;3|
              (|NonNegativeInteger|) (62 . |ncols|) (67 . |zero|)
              (73 . SEGMENT) (|List| 10) |MAMA;subMatrix;M2LM;14|
              |MAMA;rows;MLM;4| |MAMA;rows;MSM;5| (79 . |minRowIndex|)
              (84 . |maxRowIndex|) |MAMA;columnMatrix;MPiM;6| (89 . |nrows|)
              |MAMA;columns;MLM;7| |MAMA;columns;MSM;8| (94 . |qsetelt!|)
              |MAMA;diagonalMatrix;MIM;10| |MAMA;diagonalMatrix;2M;11|
              (|List| 14) |MAMA;bandMatrix;MLM;12| (|Segment| 14)
              (102 . |expand|) |MAMA;bandMatrix;MSM;13| (107 . |qelt|)
              (114 . |low|) (119 . |high|) |MAMA;subMatrix;M2SM;15|
              (124 . |horizConcat|) (|Mapping| 9 9 9) (|List| 9)
              (130 . |reduce|) |MAMA;horizConcat;LM;16| (136 . |vertConcat|)
              |MAMA;vertConcat;LM;17| (|List| 56) |MAMA;blockConcat;LM;18|
              (|Union| $ '"failed") (142 . |exquo|) |MAMA;vertSplit;MPiL;19|
              (148 . +) (154 . +) (160 . +) (|Mapping| 10 10 10)
              (166 . |reduce|) (172 . ~=) (|ListFunctions2| 10 10)
              (178 . |scan|) (185 . |elt|) |MAMA;vertSplit;MLL;20|
              |MAMA;horizSplit;MPiL;21| |MAMA;horizSplit;MLL;22|
              |MAMA;blockSplit;M2PiL;23| |MAMA;blockSplit;MLPiL;24|
              |MAMA;blockSplit;MPiLL;25| |MAMA;blockSplit;M2LL;26|)
           '#(|vertSplit| 191 |vertConcat| 203 |subMatrix| 208 |rows| 222
              |rowMatrix| 234 |horizSplit| 240 |horizConcat| 252 |element| 257
              |diagonalMatrix| 264 |columns| 275 |columnMatrix| 287
              |blockSplit| 293 |blockConcat| 321 |bandMatrix| 326)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 81
                                                 '(1 11 10 0 12 1 11 10 0 13 1
                                                   11 14 0 15 0 6 0 16 2 14 17
                                                   0 0 18 2 10 17 0 0 19 3 9 6
                                                   0 14 14 20 1 9 0 21 22 1 9
                                                   14 0 24 1 9 14 0 25 5 9 0 0
                                                   14 14 14 14 26 1 9 28 0 29 2
                                                   9 0 28 28 30 2 11 0 10 10 31
                                                   1 9 14 0 36 1 9 14 0 37 1 9
                                                   28 0 39 4 9 6 0 14 14 6 42 1
                                                   47 45 0 48 3 9 6 0 14 14 50
                                                   1 11 10 0 51 1 11 10 0 52 2
                                                   9 0 0 0 54 2 56 9 55 0 57 2
                                                   9 0 0 0 59 2 28 63 0 0 64 2
                                                   6 0 0 0 66 2 9 0 0 0 67 2 10
                                                   0 0 0 68 2 32 10 69 0 70 2
                                                   28 17 0 0 71 3 72 32 69 32
                                                   10 73 2 32 10 0 14 74 2 0 56
                                                   9 32 75 2 0 56 9 10 65 1 0 9
                                                   56 60 3 0 9 9 11 11 53 3 0 9
                                                   9 32 32 33 2 0 9 9 32 34 2 0
                                                   9 9 11 35 2 0 9 9 10 27 2 0
                                                   56 9 10 76 2 0 56 9 32 77 1
                                                   0 9 56 58 3 0 9 9 10 10 23 2
                                                   0 9 9 14 43 1 0 9 9 44 2 0 9
                                                   9 32 40 2 0 9 9 11 41 2 0 9
                                                   9 10 38 3 0 61 9 10 10 78 3
                                                   0 61 9 32 10 79 3 0 61 9 32
                                                   32 81 3 0 61 9 10 32 80 1 0
                                                   9 61 62 2 0 9 9 45 46 2 0 9
                                                   9 47 49)))))
           '|lookupComplete|)) 
