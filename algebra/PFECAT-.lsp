
(/VERSIONCHECK 2) 

(DEFUN |PFECAT-;gcdPolynomial;3Sup;1| (|f| |g| $)
  (PROG (#1=#:G119 |ans| |cg| |cf|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 9)) |g|)
            ((SPADCALL |g| (QREFELT $ 9)) |f|)
            ('T
             (SEQ
              (LETT |cf| (SPADCALL |f| (QREFELT $ 10))
                    . #2=(|PFECAT-;gcdPolynomial;3Sup;1|))
              (COND
               ((NULL (SPADCALL |cf| (QREFELT $ 11)))
                (LETT |f|
                      (PROG2
                          (LETT #1# (SPADCALL |f| |cf| (QREFELT $ 13)) . #2#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0)
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT $ 6))
                                       #1#))
                      . #2#)))
              (LETT |cg| (SPADCALL |g| (QREFELT $ 10)) . #2#)
              (COND
               ((NULL (SPADCALL |cg| (QREFELT $ 11)))
                (LETT |g|
                      (PROG2
                          (LETT #1# (SPADCALL |g| |cg| (QREFELT $ 13)) . #2#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0)
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT $ 6))
                                       #1#))
                      . #2#)))
              (LETT |ans| (SPADCALL |f| |g| (QREFELT $ 14)) . #2#)
              (EXIT
               (SPADCALL (SPADCALL |cf| |cg| (QREFELT $ 15))
                         (PROG2
                             (LETT #1#
                                   (SPADCALL |ans|
                                             (SPADCALL |ans| (QREFELT $ 10))
                                             (QREFELT $ 13))
                                   . #2#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 6))
                                          #1#))
                         (QREFELT $ 16)))))))))) 

(DEFUN |PFECAT-;charthRoot;SU;2| (|f| $)
  (PROG (|ans| |m|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 19)) (CONS 0 (|spadConstant| $ 20)))
            (#1='T
             (SEQ
              (LETT |m|
                    (SPADCALL
                     (LIST
                      (LIST (|spadConstant| $ 21)
                            (SPADCALL |f| (QREFELT $ 22))))
                     (QREFELT $ 25))
                    . #2=(|PFECAT-;charthRoot;SU;2|))
              (LETT |ans| (SPADCALL |m| (QREFELT $ 28)) . #2#)
              (EXIT
               (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                     (#1#
                      (SPADCALL (SPADCALL (QCDR |ans|) 1 (QREFELT $ 31))
                                (SPADCALL (QCDR |ans|) 2 (QREFELT $ 31))
                                (QREFELT $ 32)))))))))))) 

(DEFUN |PFECAT-;solveLinearPolynomialEquation;LSupU;3| (|lf| |g| $)
  (SPADCALL |lf| |g| (QREFELT $ 36))) 

(DEFUN |PFECAT-;solveLinearPolynomialEquation;LSupU;4| (|lf| |g| $)
  (SPADCALL |lf| |g| (QREFELT $ 43))) 

(DECLAIM (NOTINLINE |PolynomialFactorizationExplicit&;|)) 

(DEFUN |PolynomialFactorizationExplicit&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialFactorizationExplicit&|))
      (LETT |dv$| (LIST '|PolynomialFactorizationExplicit&| DV$1) . #1#)
      (LETT $ (GETREFV 44) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 33
                  (CONS (|dispatchFunction| |PFECAT-;charthRoot;SU;2|) $))))
      (COND
       ((|HasCategory| |#1| '(|Field|))
        (QSETREFV $ 39
                  (CONS
                   (|dispatchFunction|
                    |PFECAT-;solveLinearPolynomialEquation;LSupU;3|)
                   $)))
       ('T
        (QSETREFV $ 39
                  (CONS
                   (|dispatchFunction|
                    |PFECAT-;solveLinearPolynomialEquation;LSupU;4|)
                   $))))
      $)))) 

(MAKEPROP '|PolynomialFactorizationExplicit&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|SparseUnivariatePolynomial| 6) (0 . |zero?|) (5 . |content|)
              (10 . |one?|) (|Union| $ '"failed") (15 . |exquo|)
              (21 . |subResultantGcd|) (27 . |gcd|) (33 . *)
              (|SparseUnivariatePolynomial| $) |PFECAT-;gcdPolynomial;3Sup;1|
              (39 . |zero?|) (44 . |Zero|) (48 . |One|) (52 . -)
              (|List| (|List| 6)) (|Matrix| 6) (57 . |matrix|)
              (|Union| (|Vector| $) '"failed") (|Matrix| $) (62 . |conditionP|)
              (|Integer|) (|Vector| 6) (67 . |elt|) (73 . |exquo|)
              (79 . |charthRoot|) (|Union| 35 '"failed") (|List| $)
              (84 . |multiEuclidean|) (|Union| 38 '"failed") (|List| 17)
              (90 . |solveLinearPolynomialEquation|) (|Union| 41 '"failed")
              (|List| 8) (|LinearPolynomialEquationByFractions| 6)
              (96 . |solveLinearPolynomialEquationByFractions|))
           '#(|solveLinearPolynomialEquation| 102 |gcdPolynomial| 108
              |charthRoot| 114)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(1 8 7 0 9 1 8 6 0 10 1 6 7 0
                                                   11 2 8 12 0 6 13 2 8 0 0 0
                                                   14 2 6 0 0 0 15 2 8 0 6 0 16
                                                   1 6 7 0 19 0 6 0 20 0 6 0 21
                                                   1 6 0 0 22 1 24 0 23 25 1 6
                                                   26 27 28 2 30 6 0 29 31 2 6
                                                   12 0 0 32 1 0 12 0 33 2 8 34
                                                   35 0 36 2 0 37 38 17 39 2 42
                                                   40 41 8 43 2 0 37 38 17 39 2
                                                   0 17 17 17 18 1 0 12 0
                                                   33)))))
           '|lookupComplete|)) 
