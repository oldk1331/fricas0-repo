
(/VERSIONCHECK 2) 

(DEFUN |INTSLPE;solveLinearPolynomialEquation;LSupU;1| (|lp| |p| $)
  (PROG (|answer| #1=#:G135 |ans| |deg| #2=#:G132 #3=#:G131 #4=#:G133 #5=#:G143
         |u|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QREFELT $ 6) |lp| (QREFELT $ 11))
        (SEQ
         (LETT |deg|
               (PROGN
                (LETT #2# NIL
                      . #6=(|INTSLPE;solveLinearPolynomialEquation;LSupU;1|))
                (SEQ (LETT |u| NIL . #6#) (LETT #5# |lp| . #6#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #4# (SPADCALL |u| (QREFELT $ 14)) . #6#)
                        (COND (#2# (LETT #3# (+ #3# #4#) . #6#))
                              ('T
                               (PROGN
                                (LETT #3# #4# . #6#)
                                (LETT #2# 'T . #6#)))))))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (COND (#2# #3#) ('T 0)))
               . #6#)
         (LETT |ans| (CONS 1 "failed") . #6#) (SETELT $ 7 2147483647)
         (SEQ G190 (COND ((NULL (QEQCAR |ans| 1)) (GO G191)))
              (SEQ
               (LETT |ans| (SPADCALL |deg| (QREFELT $ 7) |lp| (QREFELT $ 18))
                     . #6#)
               (EXIT
                (COND
                 ((QEQCAR |ans| 1)
                  (SETELT $ 7 (SPADCALL (QREFELT $ 7) (QREFELT $ 20)))))))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT
          (SETELT $ 8
                  (PROG2 (LETT #1# |ans| . #6#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|Vector|
                                    (|List|
                                     (|SparseUnivariatePolynomial|
                                      (|Integer|))))
                                   #1#)))))))
      (LETT |answer| (SPADCALL |p| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 23))
            . #6#)
      (EXIT |answer|))))) 

(DEFUN |IntegerSolveLinearPolynomialEquation| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G145)
       (RETURN
        (COND
         ((LETT #1#
                (HGET |$ConstructorCache|
                      '|IntegerSolveLinearPolynomialEquation|)
                . #2=(|IntegerSolveLinearPolynomialEquation|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache|
                         '|IntegerSolveLinearPolynomialEquation|
                         (LIST
                          (CONS NIL
                                (CONS 1
                                      (|IntegerSolveLinearPolynomialEquation;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|IntegerSolveLinearPolynomialEquation|))))))))))) 

(DEFUN |IntegerSolveLinearPolynomialEquation;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|IntegerSolveLinearPolynomialEquation|)
            . #1=(|IntegerSolveLinearPolynomialEquation|))
      (LETT $ (GETREFV 25) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|IntegerSolveLinearPolynomialEquation|
                  NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 NIL)
      (QSETREFV $ 7 2)
      (QSETREFV $ 8 (MAKE-ARRAY 0))
      $)))) 

(MAKEPROP '|IntegerSolveLinearPolynomialEquation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|oldlp| '|slpePrime| '|oldtable|
              (|Boolean|) (|List| 13) (0 . ~=) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 16) (6 . |degree|)
              (|Union| 22 '"failed") (|Integer|) (|GenExEuclid| 16 13)
              (11 . |tablePow|) (|IntegerPrimesPackage| 16) (18 . |prevPrime|)
              (|Union| 10 '"failed") (|Vector| 10) (23 . |solveid|)
              |INTSLPE;solveLinearPolynomialEquation;LSupU;1|)
           '#(|solveLinearPolynomialEquation| 30) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 24
                                                 '(2 10 9 0 0 11 1 13 12 0 14 3
                                                   17 15 12 16 10 18 1 19 16 16
                                                   20 3 17 21 13 16 22 23 2 0
                                                   21 10 13 24)))))
           '|lookupComplete|)) 

(MAKEPROP '|IntegerSolveLinearPolynomialEquation| 'NILADIC T) 
