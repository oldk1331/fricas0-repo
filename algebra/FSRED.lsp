
(SDEFUN |FSRED;newReduc;IV;1| ((|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G108 NIL) (|k| NIL))
               (SEQ (SETELT $ 12 |n|)
                    (SEQ (LETT |k| NIL . #2=(|FSRED;newReduc;IV;1|))
                         (LETT #1# (SPADCALL (QREFELT $ 11) (QREFELT $ 14))
                               . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (SPADCALL |k| (QREFELT $ 11) (QREFELT $ 17))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL (QREFELT $ 19)))))) 

(SDEFUN |FSRED;bringDown;FKSup;2|
        ((|f| F) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|bc|
           (|Union|
            (|Record|
             (|:| |coef1|
                  (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
             (|:| |coef2|
                  (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
            "failed"))
          (|m| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|ff| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (LETT |ff| (SPADCALL |f| |k| (QREFELT $ 24))
                . #1=(|FSRED;bringDown;FKSup;2|))
          (LETT |bc|
                (SPADCALL
                 (SPADCALL (ELT $ 26) (SPADCALL |ff| (QREFELT $ 29))
                           (QREFELT $ 33))
                 (LETT |m|
                       (SPADCALL (ELT $ 26) (SPADCALL |k| (QREFELT $ 35))
                                 (QREFELT $ 33))
                       . #1#)
                 (|spadConstant| $ 36) (QREFELT $ 39))
                . #1#)
          (EXIT
           (COND ((QEQCAR |bc| 1) (|error| "denominator is 0"))
                 ('T
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (ELT $ 26) (SPADCALL |ff| (QREFELT $ 40))
                              (QREFELT $ 33))
                    (QCAR (QCDR |bc|)) (QREFELT $ 41))
                   |m| (QREFELT $ 42)))))))) 

(SDEFUN |FSRED;bringDown;FF;3| ((|f| F) ($ |Fraction| (|Integer|)))
        (SPROG
         ((#1=#:G125 NIL) (|k| NIL) (#2=#:G124 NIL)
          (|lk| (|List| (|Kernel| F))))
         (SEQ
          (SPADCALL
           (SPADCALL |f|
                     (LETT |lk| (SPADCALL |f| (QREFELT $ 45))
                           . #3=(|FSRED;bringDown;FF;3|))
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2# (CONS (|FSRED;K2Z| |k| $) #2#) . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 47))
           (QREFELT $ 48))))) 

(SDEFUN |FSRED;K2Z| ((|k| |Kernel| F) ($ F))
        (SPROG ((|u| (|Union| (|Integer|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |k| (QREFELT $ 50)) (QREFELT $ 8)
                            (QREFELT $ 53))
                  (|error| "Cannot reduce constant field"))
                 (#1='T
                  (SEQ
                   (LETT |u| (SPADCALL |k| (QREFELT $ 11) (QREFELT $ 54))
                         |FSRED;K2Z|)
                   (EXIT
                    (COND
                     ((QEQCAR |u| 1)
                      (SPADCALL
                       (SPADCALL (QREFELT $ 11) |k| (RANDOM (QREFELT $ 12))
                                 (QREFELT $ 55))
                       (QREFELT $ 56)))
                     (#1# (SPADCALL (QCDR |u|) (QREFELT $ 56))))))))))) 

(DECLAIM (NOTINLINE |FunctionSpaceReduce;|)) 

(DEFUN |FunctionSpaceReduce| (&REST #1=#:G132)
  (SPROG NIL
         (PROG (#2=#:G133)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceReduce|)
                                               '|domainEqualList|)
                    . #3=(|FunctionSpaceReduce|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionSpaceReduce;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FunctionSpaceReduce|)))))))))) 

(DEFUN |FunctionSpaceReduce;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpaceReduce|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpaceReduce| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 57) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FunctionSpaceReduce|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          (QSETREFV $ 12 1)
          $))) 

(MAKEPROP '|FunctionSpaceReduce| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|AssociationList| 16 20) (0 . |table|) '|redmap| '|nn|
              (|List| 16) (4 . |keys|) (|Union| 20 '"failed") (|Kernel| 7)
              (9 . |remove!|) (|Void|) (15 . |void|) (|Integer|)
              |FSRED;newReduc;IV;1| (|Fraction| 34) (|Kernel| $)
              (19 . |univariate|) (|Fraction| 20) |FSRED;bringDown;FF;3|
              (|SparseUnivariatePolynomial| 7) (|Fraction| 27) (25 . |denom|)
              (|SparseUnivariatePolynomial| 25) (|Mapping| 25 7)
              (|SparseUnivariatePolynomialFunctions2| 7 25) (30 . |map|)
              (|SparseUnivariatePolynomial| $) (36 . |minPoly|) (41 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 37 '"failed")
              (45 . |extendedEuclidean|) (52 . |numer|) (57 . *) (63 . |rem|)
              |FSRED;bringDown;FKSup;2| (|List| 23) (69 . |kernels|) (|List| $)
              (74 . |eval|) (81 . |retract|) (|BasicOperator|)
              (86 . |operator|) (|Boolean|) (|Symbol|) (91 . |has?|)
              (97 . |search|) (103 . |setelt!|) (110 . |coerce|))
           '#(|newReduc| 115 |bringDown| 120) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 56
                                                 '(0 9 0 10 1 9 13 0 14 2 9 15
                                                   16 0 17 0 18 0 19 2 7 22 0
                                                   23 24 1 28 27 0 29 2 32 30
                                                   31 27 33 1 7 34 23 35 0 30 0
                                                   36 3 30 38 0 0 0 39 1 28 27
                                                   0 40 2 30 0 0 0 41 2 30 0 0
                                                   0 42 1 7 44 0 45 3 7 0 0 44
                                                   46 47 1 7 25 0 48 1 16 49 0
                                                   50 2 49 51 0 52 53 2 9 15 16
                                                   0 54 3 9 20 0 16 20 55 1 7 0
                                                   20 56 1 0 18 20 21 1 0 25 7
                                                   26 2 0 30 7 16 43)))))
           '|lookupComplete|)) 
