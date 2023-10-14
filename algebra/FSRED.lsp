
(/VERSIONCHECK 2) 

(DEFUN |FSRED;newReduc;V;1| ($)
  (PROG (#1=#:G107 |k|)
    (RETURN
     (SEQ
      (SEQ (LETT |k| NIL . #2=(|FSRED;newReduc;V;1|))
           (LETT #1# (SPADCALL (QREFELT $ 11) (QREFELT $ 13)) . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (EXIT (SPADCALL |k| (QREFELT $ 11) (QREFELT $ 16))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (QREFELT $ 18))))))) 

(DEFUN |FSRED;bringDown;FKSup;2| (|f| |k| $)
  (PROG (|bc| |m| |ff|)
    (RETURN
     (SEQ
      (LETT |ff| (SPADCALL |f| |k| (QREFELT $ 22))
            . #1=(|FSRED;bringDown;FKSup;2|))
      (LETT |bc|
            (SPADCALL
             (SPADCALL (ELT $ 24) (SPADCALL |ff| (QREFELT $ 27))
                       (QREFELT $ 31))
             (LETT |m|
                   (SPADCALL (ELT $ 24) (SPADCALL |k| (QREFELT $ 33))
                             (QREFELT $ 31))
                   . #1#)
             (|spadConstant| $ 34) (QREFELT $ 37))
            . #1#)
      (EXIT
       (COND ((QEQCAR |bc| 1) (|error| "denominator is 0"))
             ('T
              (SPADCALL
               (SPADCALL
                (SPADCALL (ELT $ 24) (SPADCALL |ff| (QREFELT $ 38))
                          (QREFELT $ 31))
                (QCAR (QCDR |bc|)) (QREFELT $ 39))
               |m| (QREFELT $ 40))))))))) 

(DEFUN |FSRED;bringDown;FF;3| (|f| $)
  (PROG (#1=#:G124 |k| #2=#:G123 |lk|)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL |f|
                 (LETT |lk| (SPADCALL |f| (QREFELT $ 43))
                       . #3=(|FSRED;bringDown;FF;3|))
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT (LETT #2# (CONS (|FSRED;K2Z| |k| $) #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 45))
       (QREFELT $ 46)))))) 

(DEFUN |FSRED;K2Z| (|k| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |k| (QREFELT $ 48)) (QREFELT $ 8) (QREFELT $ 51))
        (|error| "Cannot reduce constant field"))
       (#1='T
        (SEQ
         (LETT |u| (SPADCALL |k| (QREFELT $ 11) (QREFELT $ 52)) |FSRED;K2Z|)
         (EXIT
          (COND
           ((QEQCAR |u| 1)
            (SPADCALL (SPADCALL (QREFELT $ 11) |k| (|random|) (QREFELT $ 54))
                      (QREFELT $ 55)))
           (#1# (SPADCALL (QCDR |u|) (QREFELT $ 55)))))))))))) 

(DECLAIM (NOTINLINE |FunctionSpaceReduce;|)) 

(DEFUN |FunctionSpaceReduce| (&REST #1=#:G131)
  (PROG ()
    (RETURN
     (PROG (#2=#:G132)
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
              (HREM |$ConstructorCache| '|FunctionSpaceReduce|))))))))))) 

(DEFUN |FunctionSpaceReduce;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpaceReduce|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FunctionSpaceReduce| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 56) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FunctionSpaceReduce| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|%alg|)
      (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
      $)))) 

(MAKEPROP '|FunctionSpaceReduce| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|AssociationList| 15 53) (0 . |table|) '|redmap| (|List| 15)
              (4 . |keys|) (|Union| 53 '"failed") (|Kernel| 7) (9 . |remove!|)
              (|Void|) (15 . |void|) |FSRED;newReduc;V;1| (|Fraction| 32)
              (|Kernel| $) (19 . |univariate|) (|Fraction| 53)
              |FSRED;bringDown;FF;3| (|SparseUnivariatePolynomial| 7)
              (|Fraction| 25) (25 . |denom|) (|SparseUnivariatePolynomial| 23)
              (|Mapping| 23 7) (|SparseUnivariatePolynomialFunctions2| 7 23)
              (30 . |map|) (|SparseUnivariatePolynomial| $) (36 . |minPoly|)
              (41 . |One|) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 35 '"failed") (45 . |extendedEuclidean|) (52 . |numer|)
              (57 . *) (63 . |rem|) |FSRED;bringDown;FKSup;2| (|List| 21)
              (69 . |kernels|) (|List| $) (74 . |eval|) (81 . |retract|)
              (|BasicOperator|) (86 . |operator|) (|Boolean|) (|Symbol|)
              (91 . |has?|) (97 . |search|) (|Integer|) (103 . |setelt|)
              (110 . |coerce|))
           '#(|newReduc| 115 |bringDown| 119) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(0 9 0 10 1 9 12 0 13 2 9 14
                                                   15 0 16 0 17 0 18 2 7 20 0
                                                   21 22 1 26 25 0 27 2 30 28
                                                   29 25 31 1 7 32 21 33 0 28 0
                                                   34 3 28 36 0 0 0 37 1 26 25
                                                   0 38 2 28 0 0 0 39 2 28 0 0
                                                   0 40 1 7 42 0 43 3 7 0 0 42
                                                   44 45 1 7 23 0 46 1 15 47 0
                                                   48 2 47 49 0 50 51 2 9 14 15
                                                   0 52 3 9 53 0 15 53 54 1 7 0
                                                   53 55 0 0 17 19 1 0 23 7 24
                                                   2 0 28 7 15 41)))))
           '|lookupComplete|)) 
