
(SDEFUN |FRUTIL;refine;FMF;1|
        ((|f| |Factored| R) (|func| |Mapping| #1=(|Factored| R) R)
         ($ |Factored| R))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (#2=#:G122 NIL) (|v| NIL) (#3=#:G121 NIL) (|u| (R)) (#4=#:G107 NIL)
          (|fitem| #1#) (#5=#:G120 NIL) (|item| NIL))
         (SEQ
          (LETT |u| (SPADCALL |f| (QREFELT $ 8)) . #6=(|FRUTIL;refine;FMF;1|))
          (LETT |l| NIL . #6#)
          (SEQ (LETT |item| NIL . #6#)
               (LETT #5# (SPADCALL |f| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |item| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ (LETT |fitem| (SPADCALL (QVELT |item| 1) |func|) . #6#)
                    (LETT |u|
                          (SPADCALL |u|
                                    (SPADCALL (SPADCALL |fitem| (QREFELT $ 8))
                                              (PROG1
                                                  (LETT #4# (QVELT |item| 2)
                                                        . #6#)
                                                (|check_subtype2| (>= #4# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #4#))
                                              (QREFELT $ 14))
                                    (QREFELT $ 15))
                          . #6#)
                    (EXIT
                     (COND
                      ((EQL (QVELT |item| 2) 1)
                       (LETT |l|
                             (SPADCALL (SPADCALL |fitem| (QREFELT $ 12)) |l|
                                       (QREFELT $ 16))
                             . #6#))
                      ('T
                       (LETT |l|
                             (SPADCALL
                              (PROGN
                               (LETT #3# NIL . #6#)
                               (SEQ (LETT |v| NIL . #6#)
                                    (LETT #2# (SPADCALL |fitem| (QREFELT $ 12))
                                          . #6#)
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT |v| (CAR #2#) . #6#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (VECTOR (QVELT |v| 0)
                                                     (QVELT |v| 1)
                                                     (* (QVELT |v| 2)
                                                        (QVELT |item| 2)))
                                             #3#)
                                            . #6#)))
                                    (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              |l| (QREFELT $ 16))
                             . #6#)))))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |u| |l| (QREFELT $ 17)))))) 

(DECLAIM (NOTINLINE |FactoredFunctionUtilities;|)) 

(DEFUN |FactoredFunctionUtilities| (#1=#:G123)
  (SPROG NIL
         (PROG (#2=#:G124)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FactoredFunctionUtilities|)
                                               '|domainEqualList|)
                    . #3=(|FactoredFunctionUtilities|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FactoredFunctionUtilities;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FactoredFunctionUtilities|)))))))))) 

(DEFUN |FactoredFunctionUtilities;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FactoredFunctionUtilities|))
          (LETT |dv$| (LIST '|FactoredFunctionUtilities| DV$1) . #1#)
          (LETT $ (GETREFV 20) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FactoredFunctionUtilities|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FactoredFunctionUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Factored| 6)
              (0 . |unit|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 9) (|:| |factor| 6)
                        (|:| |exponent| (|Integer|)))
              (|List| 10) (5 . |factorList|) (|NonNegativeInteger|) (10 . ^)
              (16 . *) (22 . |concat|) (28 . |makeFR|) (|Mapping| 7 6)
              |FRUTIL;refine;FMF;1|)
           '#(|refine| 34) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(1 7 6 0 8 1 7 11 0 12 2 6 0
                                                   0 13 14 2 6 0 0 0 15 2 11 0
                                                   0 0 16 2 7 0 6 11 17 2 0 7 7
                                                   18 19)))))
           '|lookupComplete|)) 
