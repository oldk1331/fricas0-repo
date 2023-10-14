
(SDEFUN |MULDEP;solveOverQ|
        ((|m| |Matrix| (|Fraction| (|Integer|)))
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
        (SPADCALL |m| |v| (QREFELT $ 10))) 

(SDEFUN |MULDEP;logDependenceQ;LFU;2|
        ((|lq| |List| (|Fraction| (|Integer|))) (|q| |Fraction| (|Integer|))
         ($ |Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
        (SPROG
         ((|qv| #1=(|Vector| (|Fraction| (|Integer|)))) (#2=#:G125 NIL)
          (|i| NIL) (#3=#:G124 NIL) (|m| (|Matrix| (|Fraction| (|Integer|))))
          (|j| NIL) (#4=#:G123 NIL) (#5=#:G122 NIL) (#6=#:G121 NIL)
          (|tm| #7=(|Matrix| (|Integer|)))
          (|li| (|List| (|NonNegativeInteger|))) (#8=#:G120 NIL)
          (|k0| (|NonNegativeInteger|)) (|bas| #9=(|Vector| (|Integer|)))
          (|dr| (|Record| (|:| |basis| #9#) (|:| |transform| #7#))) (|v| #1#)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lq|) (CONS 1 "failed"))
                (#10='T
                 (SEQ
                  (LETT |n| (LENGTH |lq|)
                        . #11=(|MULDEP;logDependenceQ;LFU;2|))
                  (LETT |v|
                        (SPADCALL (SPADCALL |lq| (LIST |q|) (QREFELT $ 12))
                                  (QREFELT $ 13))
                        . #11#)
                  (LETT |dr| (SPADCALL |v| (QREFELT $ 16)) . #11#)
                  (LETT |bas| (QCAR |dr|) . #11#)
                  (LETT |k0| (QVSIZE |bas|) . #11#)
                  (LETT |li|
                        (PROGN
                         (LETT #8# NIL . #11#)
                         (SEQ (LETT |i| 1 . #11#) G190
                              (COND ((|greater_SI| |i| |k0|) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL
                                     (SPADCALL |bas| |i| (QREFELT $ 19))
                                     (QREFELT $ 21))
                                    'NIL)
                                   (#10# 'T))
                                  (LETT #8# (CONS |i| #8#) . #11#)))))
                              (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #11#)
                  (EXIT
                   (COND ((NULL |li|) (CONS 1 "failed"))
                         (#10#
                          (SEQ (LETT |tm| (QCDR |dr|) . #11#)
                               (LETT |m|
                                     (SPADCALL
                                      (PROGN
                                       (LETT #6# NIL . #11#)
                                       (SEQ (LETT |i| NIL . #11#)
                                            (LETT #5# |li| . #11#) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |i| (CAR #5#) . #11#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (PROGN
                                                      (LETT #4# NIL . #11#)
                                                      (SEQ (LETT |j| 1 . #11#)
                                                           G190
                                                           (COND
                                                            ((|greater_SI| |j|
                                                                           |n|)
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #4#
                                                                   (CONS
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |tm| |i|
                                                                      |j|
                                                                      (QREFELT
                                                                       $ 23))
                                                                     (QREFELT $
                                                                              25))
                                                                    #4#)
                                                                   . #11#)))
                                                           (LETT |j|
                                                                 (|inc_SI| |j|)
                                                                 . #11#)
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #4#))))
                                                     #6#)
                                                    . #11#)))
                                            (LETT #5# (CDR #5#) . #11#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      (QREFELT $ 27))
                                     . #11#)
                               (LETT |qv|
                                     (SPADCALL
                                      (PROGN
                                       (LETT #3# NIL . #11#)
                                       (SEQ (LETT |i| NIL . #11#)
                                            (LETT #2# |li| . #11#) G190
                                            (COND
                                             ((OR (ATOM #2#)
                                                  (PROGN
                                                   (LETT |i| (CAR #2#) . #11#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #3#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL |tm| |i|
                                                                (+ |n| 1)
                                                                (QREFELT $ 23))
                                                      (QREFELT $ 25))
                                                     #3#)
                                                    . #11#)))
                                            (LETT #2# (CDR #2#) . #11#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #3#))))
                                      (QREFELT $ 13))
                                     . #11#)
                               (EXIT (|MULDEP;solveOverQ| |m| |qv| $)))))))))))) 

(DECLAIM (NOTINLINE |MultiplicativeDependence;|)) 

(DEFUN |MultiplicativeDependence| ()
  (SPROG NIL
         (PROG (#1=#:G127)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MultiplicativeDependence|)
                    . #2=(|MultiplicativeDependence|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MultiplicativeDependence|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|MultiplicativeDependence;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|MultiplicativeDependence|)))))))))) 

(DEFUN |MultiplicativeDependence;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MultiplicativeDependence|)
                . #1=(|MultiplicativeDependence|))
          (LETT $ (GETREFV 30) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|MultiplicativeDependence| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|MultiplicativeDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Union| 8 '"failed") (|Matrix| 24)
              (|Vector| 24) (|LinearSystemMatrixPackage| 24 8 8 7)
              (0 . |particularSolution|) (|List| 24) (6 . |concat|)
              (12 . |vector|) (|Record| (|:| |basis| 18) (|:| |transform| 22))
              (|GcdBasis| 17) (17 . |gcdDecomposition|) (|Integer|)
              (|Vector| 17) (22 . |elt|) (|Boolean|) (28 . |unit?|)
              (|Matrix| 17) (33 . |elt|) (|Fraction| 17) (40 . |coerce|)
              (|List| 11) (45 . |matrix|) (50 . |One|)
              |MULDEP;logDependenceQ;LFU;2|)
           '#(|logDependenceQ| 54) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 29
                                                 '(2 9 6 7 8 10 2 11 0 0 0 12 1
                                                   8 0 11 13 1 15 14 8 16 2 18
                                                   17 0 17 19 1 17 20 0 21 3 22
                                                   17 0 17 17 23 1 24 0 17 25 1
                                                   7 0 26 27 0 24 0 28 2 0 6 11
                                                   24 29)))))
           '|lookupComplete|)) 

(MAKEPROP '|MultiplicativeDependence| 'NILADIC T) 
