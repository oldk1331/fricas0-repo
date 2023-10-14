
(/VERSIONCHECK 2) 

(DEFUN |MULDEP;solveOverQ| (|m| |v| $) (SPADCALL |m| |v| (QREFELT $ 10))) 

(DEFUN |MULDEP;logDependenceQ;LFU;2| (|lq| |q| $)
  (PROG (|qv| #1=#:G125 |i| #2=#:G124 |m| |j| #3=#:G123 #4=#:G122 #5=#:G121
         |tm| |li| #6=#:G120 |k0| |bas| |dr| |v| |n|)
    (RETURN
     (SEQ
      (COND ((NULL |lq|) (CONS 1 "failed"))
            (#7='T
             (SEQ (LETT |n| (LENGTH |lq|) . #8=(|MULDEP;logDependenceQ;LFU;2|))
                  (LETT |v|
                        (SPADCALL (SPADCALL |lq| (LIST |q|) (QREFELT $ 12))
                                  (QREFELT $ 13))
                        . #8#)
                  (LETT |dr| (SPADCALL |v| (QREFELT $ 16)) . #8#)
                  (LETT |bas| (QCAR |dr|) . #8#)
                  (LETT |k0| (QVSIZE |bas|) . #8#)
                  (LETT |li|
                        (PROGN
                         (LETT #6# NIL . #8#)
                         (SEQ (LETT |i| 1 . #8#) G190
                              (COND ((|greater_SI| |i| |k0|) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL
                                     (SPADCALL |bas| |i| (QREFELT $ 19))
                                     (QREFELT $ 21))
                                    'NIL)
                                   (#7# 'T))
                                  (LETT #6# (CONS |i| #6#) . #8#)))))
                              (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                              (EXIT (NREVERSE #6#))))
                        . #8#)
                  (EXIT
                   (COND ((NULL |li|) (CONS 1 "failed"))
                         (#7#
                          (SEQ (LETT |tm| (QCDR |dr|) . #8#)
                               (LETT |m|
                                     (SPADCALL
                                      (PROGN
                                       (LETT #5# NIL . #8#)
                                       (SEQ (LETT |i| NIL . #8#)
                                            (LETT #4# |li| . #8#) G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |i| (CAR #4#) . #8#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (PROGN
                                                      (LETT #3# NIL . #8#)
                                                      (SEQ (LETT |j| 1 . #8#)
                                                           G190
                                                           (COND
                                                            ((|greater_SI| |j|
                                                                           |n|)
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #3#
                                                                   (CONS
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |tm| |i|
                                                                      |j|
                                                                      (QREFELT
                                                                       $ 23))
                                                                     (QREFELT $
                                                                              25))
                                                                    #3#)
                                                                   . #8#)))
                                                           (LETT |j|
                                                                 (|inc_SI| |j|)
                                                                 . #8#)
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #3#))))
                                                     #5#)
                                                    . #8#)))
                                            (LETT #4# (CDR #4#) . #8#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT $ 27))
                                     . #8#)
                               (LETT |qv|
                                     (SPADCALL
                                      (PROGN
                                       (LETT #2# NIL . #8#)
                                       (SEQ (LETT |i| NIL . #8#)
                                            (LETT #1# |li| . #8#) G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |i| (CAR #1#) . #8#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL |tm| |i|
                                                                (+ |n| 1)
                                                                (QREFELT $ 23))
                                                      (QREFELT $ 25))
                                                     #2#)
                                                    . #8#)))
                                            (LETT #1# (CDR #1#) . #8#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      (QREFELT $ 13))
                                     . #8#)
                               (EXIT
                                (|MULDEP;solveOverQ| |m| |qv| $))))))))))))) 

(DECLAIM (NOTINLINE |MultiplicativeDependence;|)) 

(DEFUN |MultiplicativeDependence| ()
  (PROG ()
    (RETURN
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
                          (CONS NIL (CONS 1 (|MultiplicativeDependence;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|MultiplicativeDependence|))))))))))) 

(DEFUN |MultiplicativeDependence;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
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
      $)))) 

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
