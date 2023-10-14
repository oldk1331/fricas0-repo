
(SDEFUN |FINITE-;random;S;1| (($ S))
        (SPROG ((#1=#:G112 NIL))
               (SPADCALL
                (PROG1
                    (LETT #1# (+ 1 (RANDOM (SPADCALL (QREFELT $ 10))))
                          |FINITE-;random;S;1|)
                  (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                    '(|NonNegativeInteger|) #1#))
                (QREFELT $ 12)))) 

(SDEFUN |FINITE-;enumerate;L;2| (($ |List| S))
        (SPROG ((#1=#:G115 NIL) (#2=#:G119 NIL) (|i| NIL) (#3=#:G118 NIL))
               (SEQ
                (PROGN
                 (LETT #3# NIL . #4=(|FINITE-;enumerate;L;2|))
                 (SEQ (LETT |i| 1 . #4#)
                      (LETT #2# (SPADCALL (QREFELT $ 10)) . #4#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #1# |i| . #4#)
                                  (|check_subtype2| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                (QREFELT $ 12))
                               #3#)
                              . #4#)))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))))) 

(SDEFUN |FINITE-;convert;SIf;3| ((|x| S) ($ |InputForm|))
        (SPADCALL '|index|
                  (LIST
                   (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 19)))
                  (QREFELT $ 23))) 

(DECLAIM (NOTINLINE |Finite&;|)) 

(DEFUN |Finite&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Finite&|))
          (LETT |dv$| (LIST '|Finite&| DV$1) . #1#)
          (LETT $ (GETREFV 25) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Finite&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |random|)
              (4 . |random|) (|NonNegativeInteger|) (8 . |size|)
              (|PositiveInteger|) (12 . |index|) |FINITE-;random;S;1|
              (|List| $) |FINITE-;enumerate;L;2| (17 . |lookup|) (|Integer|)
              (|InputForm|) (22 . |convert|) (|Symbol|) (|List| 18)
              (|InputFormFunctions1| 6) (27 . |packageCall|)
              |FINITE-;convert;SIf;3|)
           '#(|random| 33 |enumerate| 37 |convert| 41) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 24
                                                 '(0 6 0 7 0 0 6 8 0 6 9 10 1 6
                                                   0 11 12 1 6 11 0 16 1 18 0
                                                   17 19 2 22 18 20 21 23 0 0 0
                                                   13 0 0 14 15 1 0 18 0
                                                   24)))))
           '|lookupComplete|)) 
