
(/VERSIONCHECK 2) 

(DEFUN |UPCDEN;commonDenominator;UPR;1| (|p| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 10)) (QREFELT $ 12))) 

(DEFUN |UPCDEN;clearDenominator;2UP;2| (|p| $)
  (PROG (|d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |p| (QREFELT $ 13)) |UPCDEN;clearDenominator;2UP;2|)
      (EXIT
       (SPADCALL (CONS #'|UPCDEN;clearDenominator;2UP;2!0| (VECTOR $ |d|)) |p|
                 (QREFELT $ 18))))))) 

(DEFUN |UPCDEN;clearDenominator;2UP;2!0| (|x| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|UPCDEN;clearDenominator;2UP;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL |d| |x| (QREFELT $ 14)) (QREFELT $ 15))
                (QREFELT $ 16)))))) 

(DEFUN |UPCDEN;splitDenominator;UPR;3| (|p| $)
  (PROG (|d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |p| (QREFELT $ 13)) |UPCDEN;splitDenominator;UPR;3|)
      (EXIT
       (CONS
        (SPADCALL (CONS #'|UPCDEN;splitDenominator;UPR;3!0| (VECTOR $ |d|)) |p|
                  (QREFELT $ 18))
        |d|)))))) 

(DEFUN |UPCDEN;splitDenominator;UPR;3!0| (|x| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|UPCDEN;splitDenominator;UPR;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL |d| |x| (QREFELT $ 14)) (QREFELT $ 15))
                (QREFELT $ 16)))))) 

(DECLAIM (NOTINLINE |UnivariatePolynomialCommonDenominator;|)) 

(DEFUN |UnivariatePolynomialCommonDenominator| (&REST #1=#:G136)
  (PROG ()
    (RETURN
     (PROG (#2=#:G137)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|UnivariatePolynomialCommonDenominator|)
                                           '|domainEqualList|)
                . #3=(|UnivariatePolynomialCommonDenominator|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |UnivariatePolynomialCommonDenominator;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|UnivariatePolynomialCommonDenominator|))))))))))) 

(DEFUN |UnivariatePolynomialCommonDenominator;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|UnivariatePolynomialCommonDenominator|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$|
            (LIST '|UnivariatePolynomialCommonDenominator| DV$1 DV$2 DV$3)
            . #1#)
      (LETT $ (GETREFV 22) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|UnivariatePolynomialCommonDenominator|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|UnivariatePolynomialCommonDenominator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|List| 7) (0 . |coefficients|)
              (|CommonDenominator| 6 7 9) (5 . |commonDenominator|)
              |UPCDEN;commonDenominator;UPR;1| (10 . *) (16 . |numer|)
              (21 . |coerce|) (|Mapping| 7 7) (26 . |map|)
              |UPCDEN;clearDenominator;2UP;2|
              (|Record| (|:| |num| 8) (|:| |den| 6))
              |UPCDEN;splitDenominator;UPR;3|)
           '#(|splitDenominator| 32 |commonDenominator| 37 |clearDenominator|
              42)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(1 8 9 0 10 1 11 6 9 12 2 7 0
                                                   6 0 14 1 7 6 0 15 1 7 0 6 16
                                                   2 8 0 17 0 18 1 0 20 8 21 1
                                                   0 6 8 13 1 0 8 8 19)))))
           '|lookupComplete|)) 
