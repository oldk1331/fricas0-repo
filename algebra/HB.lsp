
(SDEFUN |HB;lfunc;3I;1| ((|d| |Integer|) (|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|res| (|Integer|)) (#1=#:G122 NIL) (|sum| (|Integer|))
          (#2=#:G125 NIL) (|m| NIL))
         (SEQ
          (COND ((< |n| 0) 0) ((EQL |n| 0) 1) ((EQL |n| 1) |d|)
                ('T
                 (SEQ (LETT |sum| 0 . #3=(|HB;lfunc;3I;1|))
                      (SEQ (LETT |m| 1 . #3#) (LETT #2# (- |n| 1) . #3#) G190
                           (COND ((|greater_SI| |m| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL (REM |n| |m|) 0)
                               (LETT |sum|
                                     (+ |sum|
                                        (SPADCALL |m|
                                                  (SPADCALL |d| |m|
                                                            (QREFELT $ 7))
                                                  (QREFELT $ 9)))
                                     . #3#)))))
                           (LETT |m| (|inc_SI| |m|) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (LETT |res|
                             (QUOTIENT2
                              (-
                               (EXPT |d|
                                     (PROG1 (LETT #1# |n| . #3#)
                                       (|check_subtype| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        #1#)))
                               |sum|)
                              |n|)
                             . #3#)))))))) 

(SDEFUN |HB;inHallBasis?;4IB;2|
        ((|n| |Integer|) (|i| |Integer|) (|j| |Integer|) (|l| |Integer|)
         ($ |Boolean|))
        (COND ((>= |i| |j|) 'NIL)
              ((OR (SPADCALL |j| |n| (QREFELT $ 11))
                   (SPADCALL |l| |i| (QREFELT $ 11)))
               'T)
              ('T 'NIL))) 

(SDEFUN |HB;basis;2NniV;3|
        ((|n| |NonNegativeInteger|) (|c| |NonNegativeInteger|)
         ($ |Vector| (|List| (|Integer|))))
        (SPROG
         ((|numComms| #1=(|Integer|)) (|cW| (|Integer|))
          (|leftIndex| (|NonNegativeInteger|)) (|newNumComms| #1#)
          (#2=#:G141 NIL) (|rightIndex| NIL) (|done| (|Boolean|))
          (|wt| (|Integer|)) (|firstindex| (|Vector| (|Integer|))) (|i| NIL)
          (|v| (|Vector| (|List| (|Integer|)))) (#3=#:G129 NIL)
          (|siz| (|Integer|)) (|maxweight| (|NonNegativeInteger|))
          (|gens| (|NonNegativeInteger|)))
         (SEQ (LETT |gens| |n| . #4=(|HB;basis;2NniV;3|))
              (LETT |maxweight| |c| . #4#) (LETT |siz| 0 . #4#)
              (SEQ (LETT |i| 1 . #4#) G190
                   (COND ((|greater_SI| |i| |maxweight|) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |siz| (+ |siz| (SPADCALL |gens| |i| (QREFELT $ 7)))
                           . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |v|
                    (MAKEARR1
                     (PROG1 (LETT #3# |siz| . #4#)
                       (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                        #3#))
                     NIL)
                    . #4#)
              (SEQ (LETT |i| 1 . #4#) G190
                   (COND ((|greater_SI| |i| |gens|) (GO G191)))
                   (SEQ
                    (EXIT (SPADCALL |v| |i| (LIST 0 1 |i|) (QREFELT $ 15))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |firstindex| (MAKEARR1 |maxweight| 0) . #4#)
              (LETT |wt| 1 . #4#) (SPADCALL |firstindex| 1 1 (QREFELT $ 17))
              (LETT |numComms| |gens| . #4#)
              (LETT |newNumComms| |numComms| . #4#) (LETT |done| 'NIL . #4#)
              (SEQ G190 (COND ((NULL (COND (|done| 'NIL) ('T 'T))) (GO G191)))
                   (SEQ (LETT |wt| (+ |wt| 1) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |wt| |maxweight| (QREFELT $ 18))
                           (LETT |done| 'T . #4#))
                          ('T
                           (SEQ
                            (SPADCALL |firstindex| |wt| (+ |newNumComms| 1)
                                      (QREFELT $ 17))
                            (LETT |leftIndex| 1 . #4#)
                            (LETT |cW| (- |wt| 1) . #4#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND
                                     ((SPADCALL |leftIndex| |numComms|
                                                (QREFELT $ 11))
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |v| |leftIndex|
                                                  (QREFELT $ 19))
                                        2 (QREFELT $ 20))
                                       |cW| (QREFELT $ 11)))
                                     ('T 'NIL)))
                                   (GO G191)))
                                 (SEQ
                                  (SEQ
                                   (LETT |rightIndex|
                                         (SPADCALL |firstindex| |cW|
                                                   (QREFELT $ 21))
                                         . #4#)
                                   (LETT #2#
                                         (-
                                          (SPADCALL |firstindex| (+ |cW| 1)
                                                    (QREFELT $ 21))
                                          1)
                                         . #4#)
                                   G190 (COND ((> |rightIndex| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL |gens| |leftIndex|
                                                 |rightIndex|
                                                 (SPADCALL
                                                  (SPADCALL |v| |rightIndex|
                                                            (QREFELT $ 19))
                                                  1 (QREFELT $ 20))
                                                 (QREFELT $ 12))
                                       (SEQ
                                        (LETT |newNumComms| (+ |newNumComms| 1)
                                              . #4#)
                                        (EXIT
                                         (SPADCALL |v| |newNumComms|
                                                   (LIST |leftIndex| |wt|
                                                         |rightIndex|)
                                                   (QREFELT $ 15))))))))
                                   (LETT |rightIndex| (+ |rightIndex| 1) . #4#)
                                   (GO G190) G191 (EXIT NIL))
                                  (LETT |leftIndex| (+ |leftIndex| 1) . #4#)
                                  (EXIT
                                   (LETT |cW|
                                         (- |wt|
                                            (SPADCALL
                                             (SPADCALL |v| |leftIndex|
                                                       (QREFELT $ 19))
                                             2 (QREFELT $ 20)))
                                         . #4#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (LETT |numComms| |newNumComms| . #4#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |v|)))) 

(DECLAIM (NOTINLINE |HallBasis;|)) 

(DEFUN |HallBasis| ()
  (SPROG NIL
         (PROG (#1=#:G143)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HallBasis|)
                    . #2=(|HallBasis|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HallBasis|
                             (LIST (CONS NIL (CONS 1 (|HallBasis;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|HallBasis|)))))))))) 

(DEFUN |HallBasis;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|HallBasis|) . #1=(|HallBasis|))
          (LETT $ (GETREFV 23) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|HallBasis| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|HallBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |HB;lfunc;3I;1|
              (|NonNegativeInteger|) (0 . *) (|Boolean|) (6 . <=)
              |HB;inHallBasis?;4IB;2| (|List| 6) (|Vector| 13) (12 . |setelt|)
              (|Vector| 6) (19 . |setelt|) (26 . >) (32 . |elt|) (38 . |elt|)
              (44 . |elt|) |HB;basis;2NniV;3|)
           '#(|lfunc| 50 |inHallBasis?| 56 |basis| 64) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(2 6 0 8 0 9 2 6 10 0 0 11 3
                                                   14 13 0 6 13 15 3 16 6 0 6 6
                                                   17 2 6 10 0 0 18 2 14 13 0 6
                                                   19 2 13 6 0 6 20 2 16 6 0 6
                                                   21 2 0 6 6 6 7 4 0 10 6 6 6
                                                   6 12 2 0 14 8 8 22)))))
           '|lookupComplete|)) 

(MAKEPROP '|HallBasis| 'NILADIC T) 
