
(/VERSIONCHECK 2) 

(DEFUN |GALUTIL;safeFloor;RI;1| (|x| $)
  (PROG (|shift|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |shift|
             (+ (- (SPADCALL |x| (QREFELT $ 9)) (SPADCALL (QREFELT $ 11)))
                (QREFELT $ 7))
             . #1=(|GALUTIL;safeFloor;RI;1|))
       (EXIT
        (COND
         ((>= |shift| 0)
          (LETT |x|
                (SPADCALL |x| (SPADCALL 1 |shift| (QREFELT $ 14))
                          (QREFELT $ 15))
                . #1#)))))
      (EXIT (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 17))))))) 

(DEFUN |GALUTIL;safeCeiling;RI;2| (|x| $)
  (PROG (|shift|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |shift|
             (+ (- (SPADCALL |x| (QREFELT $ 9)) (SPADCALL (QREFELT $ 11)))
                (QREFELT $ 7))
             . #1=(|GALUTIL;safeCeiling;RI;2|))
       (EXIT
        (COND
         ((>= |shift| 0)
          (LETT |x|
                (SPADCALL |x| (SPADCALL 1 |shift| (QREFELT $ 14))
                          (QREFELT $ 15))
                . #1#)))))
      (EXIT (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 17))))))) 

(DEFUN |GALUTIL;safetyMargin;2Nni;3| (|n| $)
  (PROG (|#G7| |#G6|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G6| |n| . #1=(|GALUTIL;safetyMargin;2Nni;3|))
       (LETT |#G7| (QREFELT $ 7) . #1#)
       (SETELT $ 7 |#G6|)
       (LETT |n| |#G7| . #1#))
      (EXIT |n|))))) 

(DEFUN |GALUTIL;safetyMargin;Nni;4| ($) (QREFELT $ 7)) 

(DEFUN |GALUTIL;pascalTriangle;NniIR;5| (|n| |r| $)
  (PROG (#1=#:G141 #2=#:G140 #3=#:G150 |j| |i| |mq| |m| |d|)
    (RETURN
     (SEQ
      (COND ((MINUSP |r|) (|spadConstant| $ 12))
            (#4='T
             (SEQ
              (LETT |d| (- |n| |r|) . #5=(|GALUTIL;pascalTriangle;NniIR;5|))
              (EXIT
               (COND ((< |d| |r|) (SPADCALL |n| |d| (QREFELT $ 29)))
                     ((ZEROP |r|) (|spadConstant| $ 13))
                     ((EQL |r| 1) (SPADCALL |n| (QREFELT $ 30)))
                     ((SPADCALL |n| (QREFELT $ 28) (QREFELT $ 32))
                      (SPADCALL (SPADCALL |n| |r| (QREFELT $ 34))
                                (QREFELT $ 30)))
                     ((SPADCALL |n| (QREFELT $ 27) (QREFELT $ 35))
                      (SEQ (LETT |m| (DIVIDE2 (- |n| 4) 2) . #5#)
                           (LETT |mq| (QCAR |m|) . #5#)
                           (EXIT
                            (SPADCALL (QREFELT $ 26)
                                      (-
                                       (+ (* (+ |mq| 1) (+ |mq| (QCDR |m|)))
                                          |r|)
                                       1)
                                      (QREFELT $ 36)))))
                     (#4#
                      (SEQ
                       (SEQ (LETT |i| (+ (QREFELT $ 27) 1) . #5#) G190
                            (COND ((> |i| |n|) (GO G191)))
                            (SEQ
                             (SEQ (LETT |j| 2 . #5#)
                                  (LETT #3# (QUOTIENT2 |i| 2) . #5#) G190
                                  (COND ((|greater_SI| |j| #3#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SETELT $ 26
                                            (SPADCALL (QREFELT $ 26)
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (PROG1
                                                            (LETT #2# (- |i| 1)
                                                                  . #5#)
                                                          (|check_subtype|
                                                           (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           #2#))
                                                        (- |j| 1)
                                                        (QREFELT $ 29))
                                                       (SPADCALL
                                                        (PROG1
                                                            (LETT #1# (- |i| 1)
                                                                  . #5#)
                                                          (|check_subtype|
                                                           (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                                        |j| (QREFELT $ 29))
                                                       (QREFELT $ 15))
                                                      (QREFELT $ 37)))))
                                  (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                  G191 (EXIT NIL))
                             (EXIT (SETELT $ 27 |i|)))
                            (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL |n| |r| (QREFELT $ 29)))))))))))))) 

(DEFUN |GALUTIL;rangePascalTriangle;2Nni;6| (|n| $)
  (PROG (|#G18| |#G17| |dq| |d|)
    (RETURN
     (SEQ
      (COND
       ((< |n| (QREFELT $ 27))
        (COND
         ((< |n| 3)
          (SEQ
           (SETELT $ 26
                   (SPADCALL (QREFELT $ 26)
                             (SPADCALL 1
                                       (SPADCALL (QREFELT $ 26) (QREFELT $ 38))
                                       (QREFELT $ 40))
                             (QREFELT $ 41)))
           (EXIT (SETELT $ 27 3))))
         ('T
          (SEQ
           (LETT |d| (DIVIDE2 (- |n| 3) 2)
                 . #1=(|GALUTIL;rangePascalTriangle;2Nni;6|))
           (LETT |dq| (QCAR |d|) . #1#)
           (SETELT $ 26
                   (SPADCALL (QREFELT $ 26)
                             (SPADCALL (+ (* (+ |dq| 1) (+ |dq| (QCDR |d|))) 1)
                                       (SPADCALL (QREFELT $ 26) (QREFELT $ 38))
                                       (QREFELT $ 40))
                             (QREFELT $ 41)))
           (EXIT (SETELT $ 27 |n|)))))))
      (PROGN
       (LETT |#G17| |n| . #1#)
       (LETT |#G18| (QREFELT $ 28) . #1#)
       (SETELT $ 28 |#G17|)
       (LETT |n| |#G18| . #1#))
      (EXIT |n|))))) 

(DEFUN |GALUTIL;rangePascalTriangle;Nni;7| ($) (QREFELT $ 28)) 

(DEFUN |GALUTIL;sizePascalTriangle;Nni;8| ($)
  (SPADCALL (QREFELT $ 26) (QREFELT $ 38))) 

(DEFUN |GALUTIL;fillPascalTriangle;V;9| ($)
  (SPADCALL (QREFELT $ 28) 2 (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |GaloisGroupUtilities;|)) 

(DEFUN |GaloisGroupUtilities| (#1=#:G159)
  (PROG ()
    (RETURN
     (PROG (#2=#:G160)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|GaloisGroupUtilities|)
                                           '|domainEqualList|)
                . #3=(|GaloisGroupUtilities|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|GaloisGroupUtilities;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|GaloisGroupUtilities|))))))))))) 

(DEFUN |GaloisGroupUtilities;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GaloisGroupUtilities|))
      (LETT |dv$| (LIST '|GaloisGroupUtilities| DV$1) . #1#)
      (LETT $ (GETREFV 47) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|FloatingPointSystem|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|GaloisGroupUtilities| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 7 6)
         (QSETREFV $ 18 (CONS (|dispatchFunction| |GALUTIL;safeFloor;RI;1|) $))
         (QSETREFV $ 20
                   (CONS (|dispatchFunction| |GALUTIL;safeCeiling;RI;2|) $))
         (QSETREFV $ 22
                   (CONS (|dispatchFunction| |GALUTIL;safetyMargin;2Nni;3|) $))
         (QSETREFV $ 23
                   (CONS (|dispatchFunction| |GALUTIL;safetyMargin;Nni;4|)
                         $)))))
      (QSETREFV $ 26 (SPADCALL (QREFELT $ 25)))
      (QSETREFV $ 27 3)
      (QSETREFV $ 28 216)
      $)))) 

(MAKEPROP '|GaloisGroupUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|safetymargin|
              (|Integer|) (0 . |order|) (|PositiveInteger|) (5 . |precision|)
              (9 . |Zero|) (13 . |One|) (17 . |float|) (23 . +) (29 . |floor|)
              (34 . |retract|) (39 . |safeFloor|) (44 . |ceiling|)
              (49 . |safeCeiling|) (|NonNegativeInteger|) (54 . |safetyMargin|)
              (59 . |safetyMargin|) (|FlexibleArray| 6) (63 . |empty|)
              '|pascaltriangle| '|ncomputed| '|rangepascaltriangle|
              |GALUTIL;pascalTriangle;NniIR;5| (67 . |coerce|) (|Boolean|)
              (72 . >) (|IntegerCombinatoricFunctions| 8) (78 . |binomial|)
              (84 . <=) (90 . |elt|) (96 . |concat!|) (102 . |#|)
              (|UniversalSegment| 8) (107 . SEGMENT) (113 . |delete!|)
              |GALUTIL;rangePascalTriangle;2Nni;6|
              |GALUTIL;rangePascalTriangle;Nni;7|
              |GALUTIL;sizePascalTriangle;Nni;8| (|Void|)
              |GALUTIL;fillPascalTriangle;V;9|)
           '#(|sizePascalTriangle| 119 |safetyMargin| 123 |safeFloor| 132
              |safeCeiling| 137 |rangePascalTriangle| 142 |pascalTriangle| 151
              |fillPascalTriangle| 157)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 46
                                                 '(1 6 8 0 9 0 6 10 11 0 6 0 12
                                                   0 6 0 13 2 6 0 8 8 14 2 6 0
                                                   0 0 15 1 6 0 0 16 1 6 8 0 17
                                                   1 0 8 6 18 1 6 0 0 19 1 0 8
                                                   6 20 1 0 21 21 22 0 0 21 23
                                                   0 24 0 25 1 6 0 8 30 2 21 31
                                                   0 0 32 2 33 8 8 8 34 2 21 31
                                                   0 0 35 2 24 6 0 8 36 2 24 0
                                                   0 6 37 1 24 21 0 38 2 39 0 8
                                                   8 40 2 24 0 0 39 41 0 0 21
                                                   44 0 1 21 23 1 1 21 21 22 1
                                                   1 8 6 18 1 1 8 6 20 1 0 21
                                                   21 42 0 0 21 43 2 0 6 21 8
                                                   29 0 0 45 46)))))
           '|lookupComplete|)) 
