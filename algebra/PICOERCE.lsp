
(/VERSIONCHECK 2) 

(DEFUN |PICOERCE;coerce;PE;1| (|x| $)
  (PROG (|f|)
    (RETURN
     (SEQ (LETT |f| (SPADCALL |x| (QREFELT $ 9)) |PICOERCE;coerce;PE;1|)
          (EXIT
           (SPADCALL (|PICOERCE;p2e| (SPADCALL |f| (QREFELT $ 11)) $)
                     (|PICOERCE;p2e| (SPADCALL |f| (QREFELT $ 12)) $)
                     (QREFELT $ 14))))))) 

(DEFUN |PICOERCE;p2e| (|p| $)
  (SPADCALL (SPADCALL (ELT $ 17) |p| (QREFELT $ 21)) (SPADCALL (QREFELT $ 22))
            (QREFELT $ 23))) 

(DECLAIM (NOTINLINE |PiCoercions;|)) 

(DEFUN |PiCoercions| (#1=#:G130)
  (PROG ()
    (RETURN
     (PROG (#2=#:G131)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|PiCoercions|)
                                           '|domainEqualList|)
                . #3=(|PiCoercions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|PiCoercions;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|PiCoercions|))))))))))) 

(DEFUN |PiCoercions;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PiCoercions|))
      (LETT |dv$| (LIST '|PiCoercions| DV$1) . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PiCoercions| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PiCoercions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Fraction| 10) (|Pi|)
              (0 . |convert|) (|SparseUnivariatePolynomial| 16) (5 . |numer|)
              (10 . |denom|) (|Expression| 6) (15 . /) |PICOERCE;coerce;PE;1|
              (|Integer|) (21 . |coerce|) (|SparseUnivariatePolynomial| 13)
              (|Mapping| 13 16) (|SparseUnivariatePolynomialFunctions2| 16 13)
              (26 . |map|) (32 . |pi|) (36 . |elt|))
           '#(|coerce| 42) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 8 7 0 9 1 7 10 0 11 1 7 10
                                                   0 12 2 13 0 0 0 14 1 13 0 16
                                                   17 2 20 18 19 10 21 0 13 0
                                                   22 2 18 13 0 13 23 1 0 13 8
                                                   15)))))
           '|lookupComplete|)) 
