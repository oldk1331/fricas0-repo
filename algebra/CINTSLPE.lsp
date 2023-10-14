
(/VERSIONCHECK 2) 

(DEFUN |CINTSLPE;solveLinearPolynomialEquation;LSupU;1| (|lp| |p| $)
  (PROG (|answer| #1=#:G136 |ans| |deg| #2=#:G133 #3=#:G132 #4=#:G134 #5=#:G147
         |u|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QREFELT $ 8) |lp| (QREFELT $ 15))
        (SEQ
         (LETT |deg|
               (PROGN
                (LETT #2# NIL
                      . #6=(|CINTSLPE;solveLinearPolynomialEquation;LSupU;1|))
                (SEQ (LETT |u| NIL . #6#) (LETT #5# |lp| . #6#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #4# (SPADCALL |u| (QREFELT $ 18)) . #6#)
                        (COND (#2# (LETT #3# (+ #3# #4#) . #6#))
                              ('T
                               (PROGN
                                (LETT #3# #4# . #6#)
                                (LETT #2# 'T . #6#)))))))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (COND (#2# #3#) ('T 0)))
               . #6#)
         (LETT |ans| (CONS 1 "failed") . #6#)
         (SETELT $ 11 (SPADCALL 67108859 (QREFELT $ 10)))
         (SEQ G190 (COND ((NULL (QEQCAR |ans| 1)) (GO G191)))
              (SEQ
               (LETT |ans|
                     (SPADCALL |deg|
                               (SPADCALL (QREFELT $ 11) (|spadConstant| $ 19)
                                         (QREFELT $ 21))
                               |lp| (QREFELT $ 24))
                     . #6#)
               (EXIT
                (COND
                 ((QEQCAR |ans| 1)
                  (SEQ
                   (SETELT $ 11
                           (SPADCALL (QREFELT $ 11) (SPADCALL 4 (QREFELT $ 10))
                                     (QREFELT $ 25)))
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((SPADCALL (QREFELT $ 11) (QREFELT $ 27)) 'NIL)
                             ('T 'T)))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT $ 11
                                   (SPADCALL (QREFELT $ 11)
                                             (SPADCALL 4 (QREFELT $ 10))
                                             (QREFELT $ 25)))))
                         NIL (GO G190) G191 (EXIT NIL))))))))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT
          (SETELT $ 12
                  (PROG2 (LETT #1# |ans| . #6#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|Vector|
                                    (|List|
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 7))))
                                   #1#)))))))
      (LETT |answer|
            (SPADCALL |p|
                      (SPADCALL (QREFELT $ 11) (|spadConstant| $ 19)
                                (QREFELT $ 21))
                      (QREFELT $ 12) (QREFELT $ 30))
            . #6#)
      (EXIT |answer|))))) 

(DECLAIM (NOTINLINE |ComplexIntegerSolveLinearPolynomialEquation;|)) 

(DEFUN |ComplexIntegerSolveLinearPolynomialEquation| (&REST #1=#:G148)
  (PROG ()
    (RETURN
     (PROG (#2=#:G149)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ComplexIntegerSolveLinearPolynomialEquation|)
                                           '|domainEqualList|)
                . #3=(|ComplexIntegerSolveLinearPolynomialEquation|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |ComplexIntegerSolveLinearPolynomialEquation;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ComplexIntegerSolveLinearPolynomialEquation|))))))))))) 

(DEFUN |ComplexIntegerSolveLinearPolynomialEquation;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|ComplexIntegerSolveLinearPolynomialEquation|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$|
            (LIST '|ComplexIntegerSolveLinearPolynomialEquation| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 32) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache|
                  '|ComplexIntegerSolveLinearPolynomialEquation|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 NIL)
      (QSETREFV $ 11 (SPADCALL 2 (QREFELT $ 10)))
      (QSETREFV $ 12 (MAKE-ARRAY 0))
      $)))) 

(MAKEPROP '|ComplexIntegerSolveLinearPolynomialEquation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|oldlp|
              (|Integer|) (0 . |coerce|) '|slpePrime| '|oldtable| (|Boolean|)
              (|List| 17) (5 . ~=) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (11 . |degree|) (16 . |Zero|)
              (20 . |Zero|) (24 . |complex|) (|Union| 29 '"failed")
              (|GenExEuclid| 7 17) (30 . |tablePow|) (37 . -)
              (|IntegerPrimesPackage| 6) (43 . |prime?|) (|Union| 14 '"failed")
              (|Vector| 14) (48 . |solveid|)
              |CINTSLPE;solveLinearPolynomialEquation;LSupU;1|)
           '#(|solveLinearPolynomialEquation| 55) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 31
                                                 '(1 6 0 9 10 2 14 13 0 0 15 1
                                                   17 16 0 18 0 6 0 19 0 7 0 20
                                                   2 7 0 6 6 21 3 23 22 16 7 14
                                                   24 2 6 0 0 0 25 1 26 13 6 27
                                                   3 23 28 17 7 29 30 2 0 28 14
                                                   17 31)))))
           '|lookupComplete|)) 
