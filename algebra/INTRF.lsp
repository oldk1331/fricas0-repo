
(DEFUN |INTRF;infieldIntegrate;FSU;1| (|f| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|INTRF;infieldIntegrate;FSU;1!0| (VECTOR $ |x|))
               (SPADCALL (SPADCALL |f| |x| (QREFELT $ 12)) (QREFELT $ 15))
               (QREFELT $ 19))))) 

(DEFUN |INTRF;infieldIntegrate;FSU;1!0| (|x1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTRF;infieldIntegrate;FSU;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 11)))))) 

(DEFUN |INTRF;internalIntegrate;FSIr;2| (|f| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|INTRF;internalIntegrate;FSIr;2!0| (VECTOR $ |x|))
               (SPADCALL (SPADCALL |f| |x| (QREFELT $ 12)) (QREFELT $ 22))
               (QREFELT $ 24))))) 

(DEFUN |INTRF;internalIntegrate;FSIr;2!0| (|x1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTRF;internalIntegrate;FSIr;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 11)))))) 

(DEFUN |INTRF;extendedIntegrate;FSFU;3| (|f| |x| |g| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|INTRF;extendedIntegrate;FSFU;3!0| (VECTOR $ |x|))
               (SPADCALL (SPADCALL |f| |x| (QREFELT $ 12))
                         (SPADCALL |g| |x| (QREFELT $ 12)) (QREFELT $ 28))
               (QREFELT $ 31))))) 

(DEFUN |INTRF;extendedIntegrate;FSFU;3!0| (|x1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTRF;extendedIntegrate;FSFU;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 11)))))) 

(DEFUN |INTRF;limitedIntegrate;FSLU;4| (|f| |x| |lu| $)
  (PROG (#1=#:G135 |u| #2=#:G134)
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|INTRF;limitedIntegrate;FSLU;4!0| (VECTOR $ |x|))
                (SPADCALL (SPADCALL |f| |x| (QREFELT $ 12))
                          (PROGN
                           (LETT #2# NIL
                                 . #3=(|INTRF;limitedIntegrate;FSLU;4|))
                           (SEQ (LETT |u| NIL . #3#) (LETT #1# |lu| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |u| |x| (QREFELT $ 12))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 37))
                (QREFELT $ 41)))))) 

(DEFUN |INTRF;limitedIntegrate;FSLU;4!0| (|x1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTRF;limitedIntegrate;FSLU;4|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 11)))))) 

(DECLAIM (NOTINLINE |RationalFunctionIntegration;|)) 

(DEFUN |RationalFunctionIntegration| (#1=#:G136)
  (PROG ()
    (RETURN
     (PROG (#2=#:G137)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|RationalFunctionIntegration|)
                                           '|domainEqualList|)
                . #3=(|RationalFunctionIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|RationalFunctionIntegration;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|RationalFunctionIntegration|))))))))))) 

(DEFUN |RationalFunctionIntegration;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalFunctionIntegration|))
      (LETT |dv$| (LIST '|RationalFunctionIntegration| DV$1) . #1#)
      (LETT $ (GETREFV 44) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RationalFunctionIntegration|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RationalFunctionIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Fraction| (|Polynomial| 6))
              (|Fraction| (|SparseUnivariatePolynomial| 7)) (|Symbol|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 9) 9 6
                                                     (|Polynomial| 6) 7)
              (0 . |multivariate|) (6 . |univariate|) (|Union| 8 '"failed")
              (|RationalIntegration| 7 (|SparseUnivariatePolynomial| 7))
              (12 . |infieldint|) (|Union| 7 '"failed") (|Mapping| 7 8)
              (|IntegrationResultFunctions2| 8 7) (17 . |map|)
              |INTRF;infieldIntegrate;FSU;1| (|IntegrationResult| 8)
              (23 . |integrate|) (|IntegrationResult| 7) (28 . |map|)
              |INTRF;internalIntegrate;FSIr;2|
              (|Record| (|:| |ratpart| 8) (|:| |coeff| 8))
              (|Union| 26 '"failed") (34 . |extendedint|)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 29 '"failed") (40 . |map|)
              |INTRF;extendedIntegrate;FSFU;3|
              (|Record| (|:| |coeff| 8) (|:| |logand| 8))
              (|Record| (|:| |mainpart| 8) (|:| |limitedlogs| (|List| 33)))
              (|Union| 34 '"failed") (|List| 8) (46 . |limitedint|)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 38)))
              (|Union| 39 '"failed") (52 . |map|) (|List| 7)
              |INTRF;limitedIntegrate;FSLU;4|)
           '#(|limitedIntegrate| 58 |internalIntegrate| 65 |infieldIntegrate|
              71 |extendedIntegrate| 77)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(2 10 7 8 9 11 2 10 8 7 9 12
                                                   1 14 13 8 15 2 18 16 17 13
                                                   19 1 14 21 8 22 2 18 23 17
                                                   21 24 2 14 27 8 8 28 2 18 30
                                                   17 27 31 2 14 35 8 36 37 2
                                                   18 40 17 35 41 3 0 40 7 9 42
                                                   43 2 0 23 7 9 25 2 0 16 7 9
                                                   20 3 0 30 7 9 7 32)))))
           '|lookupComplete|)) 
