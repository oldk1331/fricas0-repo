
(/VERSIONCHECK 2) 

(DEFUN |FINRALG-;discriminant;VR;1| (|v| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 11)) (QREFELT $ 12))) 

(DEFUN |FINRALG-;coordinates;2VM;2| (|v| |b| $)
  (PROG (#1=#:G138 |i| |j| |m|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL (QVSIZE |v|) (QVSIZE |b|) (|spadConstant| $ 14)
                      (QREFELT $ 16))
            . #2=(|FINRALG-;coordinates;2VM;2|))
      (SEQ (LETT |j| 1 . #2#) (LETT |i| (SPADCALL |v| (QREFELT $ 19)) . #2#)
           (LETT #1# (QVSIZE |v|) . #2#) G190 (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |m| |j|
                       (SPADCALL (QAREF1O |v| |i| 1) |b| (QREFELT $ 21))
                       (QREFELT $ 22))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DEFUN |FINRALG-;represents;VVS;3| (|v| |b| $)
  (PROG (#1=#:G140 #2=#:G139 #3=#:G141 #4=#:G144 |i| |m|)
    (RETURN
     (SEQ
      (LETT |m| (- (SPADCALL |v| (QREFELT $ 24)) 1)
            . #5=(|FINRALG-;represents;VVS;3|))
      (EXIT
       (PROGN
        (LETT #1# NIL . #5#)
        (SEQ (LETT |i| 1 . #5#) (LETT #4# (SPADCALL (QREFELT $ 27)) . #5#) G190
             (COND ((|greater_SI| |i| #4#) (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3#
                      (SPADCALL (SPADCALL |v| (+ |i| |m|) (QREFELT $ 28))
                                (SPADCALL |b| (+ |i| |m|) (QREFELT $ 29))
                                (QREFELT $ 30))
                      . #5#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 31)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
             (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|spadConstant| $ 32))))))))) 

(DEFUN |FINRALG-;traceMatrix;VM;4| (|v| $)
  (PROG (#1=#:G151 |j| #2=#:G150 #3=#:G149 |i| #4=#:G148)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #4# NIL . #5=(|FINRALG-;traceMatrix;VM;4|))
        (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 19)) . #5#)
             (LETT #3# (QVSIZE |v|) . #5#) G190 (COND ((> |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #4#
                     (CONS
                      (PROGN
                       (LETT #2# NIL . #5#)
                       (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 19)) . #5#)
                            (LETT #1# (QVSIZE |v|) . #5#) G190
                            (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |v| |i| (QREFELT $ 29))
                                       (SPADCALL |v| |j| (QREFELT $ 29))
                                       (QREFELT $ 34))
                                      (QREFELT $ 35))
                                     #2#)
                                    . #5#)))
                            (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      #4#)
                     . #5#)))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
       (QREFELT $ 37)))))) 

(DEFUN |FINRALG-;regularRepresentation;SVM;5| (|x| |b| $)
  (PROG (#1=#:G156 |i| #2=#:G155 |m|)
    (RETURN
     (SEQ
      (LETT |m| (- (SPADCALL |b| (QREFELT $ 19)) 1)
            . #3=(|FINRALG-;regularRepresentation;SVM;5|))
      (EXIT
       (SPADCALL
        (SPADCALL
         (PROGN
          (LETT #2# NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #1# (SPADCALL (QREFELT $ 27)) . #3#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT #2#
                       (CONS
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |x|
                                    (SPADCALL |b| (+ |i| |m|) (QREFELT $ 29))
                                    (QREFELT $ 34))
                          |b| (QREFELT $ 21))
                         (QREFELT $ 40))
                        #2#)
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#))))
         (QREFELT $ 37))
        (QREFELT $ 41))))))) 

(DEFUN |FiniteRankAlgebra&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteRankAlgebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|FiniteRankAlgebra&| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 43) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2| '(|Field|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FiniteRankAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Matrix| 7) (|Vector| $) (0 . |traceMatrix|)
              (5 . |determinant|) |FINRALG-;discriminant;VR;1| (10 . |Zero|)
              (|NonNegativeInteger|) (14 . |new|) (|Integer|) (|Vector| 6)
              (21 . |minIndex|) (|Vector| 7) (26 . |coordinates|)
              (32 . |setRow!|) |FINRALG-;coordinates;2VM;2| (39 . |minIndex|)
              (44 . |One|) (|PositiveInteger|) (48 . |rank|) (52 . |elt|)
              (58 . |elt|) (64 . *) (70 . +) (76 . |Zero|)
              |FINRALG-;represents;VVS;3| (80 . *) (86 . |trace|) (|List| 39)
              (91 . |matrix|) |FINRALG-;traceMatrix;VM;4| (|List| 7)
              (96 . |parts|) (101 . |transpose|)
              |FINRALG-;regularRepresentation;SVM;5|)
           '#(|traceMatrix| 106 |represents| 111 |regularRepresentation| 117
              |discriminant| 123 |coordinates| 128)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 42
                                                 '(1 6 9 10 11 1 9 7 0 12 0 7 0
                                                   14 3 9 0 15 15 7 16 1 18 17
                                                   0 19 2 6 20 0 10 21 3 9 0 0
                                                   17 20 22 1 20 17 0 24 0 6 0
                                                   25 0 6 26 27 2 20 7 0 17 28
                                                   2 18 6 0 17 29 2 6 0 7 0 30
                                                   2 6 0 0 0 31 0 6 0 32 2 6 0
                                                   0 0 34 1 6 7 0 35 1 9 0 36
                                                   37 1 20 39 0 40 1 9 0 0 41 1
                                                   0 9 10 38 2 0 0 20 10 33 2 0
                                                   9 0 10 42 1 0 7 10 13 2 0 9
                                                   10 10 23)))))
           '|lookupComplete|)) 
