
(/VERSIONCHECK 2) 

(DEFUN |PINTERP;interpolate;Up2LUp;1| (|qx| |lx| |ly| $)
  (PROG (|px|)
    (RETURN
     (SEQ
      (LETT |px| (SPADCALL |lx| |ly| (QREFELT $ 11))
            |PINTERP;interpolate;Up2LUp;1|)
      (EXIT (SPADCALL |px| |qx| (QREFELT $ 12))))))) 

(DEFUN |PINTERP;interpolate;2LSup;2| (|lx| |ly| $)
  (SPADCALL |lx| |ly| (QREFELT $ 16))) 

(DECLAIM (NOTINLINE |PolynomialInterpolation;|)) 

(DEFUN |PolynomialInterpolation| (&REST #1=#:G106)
  (PROG ()
    (RETURN
     (PROG (#2=#:G107)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PolynomialInterpolation|)
                                           '|domainEqualList|)
                . #3=(|PolynomialInterpolation|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PolynomialInterpolation;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PolynomialInterpolation|))))))))))) 

(DEFUN |PolynomialInterpolation;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialInterpolation|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PolynomialInterpolation| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 18) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PolynomialInterpolation|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PolynomialInterpolation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|UnivariatePolynomial| 6 7) (|List| 7)
              (|PolynomialInterpolationAlgorithms| 7 8)
              (0 . |LagrangeInterpolation|) (6 . |elt|)
              |PINTERP;interpolate;Up2LUp;1| (|SparseUnivariatePolynomial| 7)
              (|PolynomialInterpolationAlgorithms| 7 14)
              (12 . |LagrangeInterpolation|) |PINTERP;interpolate;2LSup;2|)
           '#(|interpolate| 18) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(2 10 8 9 9 11 2 8 0 0 0 12 2
                                                   15 14 9 9 16 2 0 14 9 9 17 3
                                                   0 8 8 9 9 13)))))
           '|lookupComplete|)) 
