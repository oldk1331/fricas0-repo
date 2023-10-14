
(/VERSIONCHECK 2) 

(DEFUN |INPRODFF;liftPoly| (|poly| $)
  (PROG (|ans| |coef|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 11) . #1=(|INPRODFF;liftPoly|))
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |poly| (QREFELT $ 13)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ
                (LETT |coef|
                      (SPADCALL
                       (SPADCALL (SPADCALL |poly| (QREFELT $ 14))
                                 (QREFELT $ 16))
                       (QREFELT $ 18))
                      . #1#)
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL |coef|
                                          (SPADCALL |poly| (QREFELT $ 20))
                                          (QREFELT $ 21))
                                (QREFELT $ 22))
                      . #1#)
                (EXIT (LETT |poly| (SPADCALL |poly| (QREFELT $ 23)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |INPRODFF;reducePoly| (|poly| $)
  (PROG (|ans| |coef|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 24) . #1=(|INPRODFF;reducePoly|))
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |poly| (QREFELT $ 25)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ
                (LETT |coef|
                      (SPADCALL
                       (SPADCALL (SPADCALL |poly| (QREFELT $ 26))
                                 (QREFELT $ 27))
                       (QREFELT $ 28))
                      . #1#)
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL |coef|
                                          (SPADCALL |poly| (QREFELT $ 29))
                                          (QREFELT $ 30))
                                (QREFELT $ 31))
                      . #1#)
                (EXIT (LETT |poly| (SPADCALL |poly| (QREFELT $ 32)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |INPRODFF;infiniteProduct;2UTS;3| (|x| $)
  (PROG (|stUP| |stSUP| |stALG|)
    (RETURN
     (SEQ
      (LETT |stUP|
            (SPADCALL (ELT $ 36) (SPADCALL |x| (QREFELT $ 38)) (QREFELT $ 42))
            . #1=(|INPRODFF;infiniteProduct;2UTS;3|))
      (LETT |stSUP|
            (SPADCALL (CONS (|function| |INPRODFF;liftPoly|) $) |stUP|
                      (QREFELT $ 46))
            . #1#)
      (LETT |stALG| (SPADCALL (ELT $ 47) |stSUP| (QREFELT $ 51)) . #1#)
      (LETT |stALG|
            (SPADCALL
             (SPADCALL (SPADCALL |stALG| (QREFELT $ 53)) (QREFELT $ 55))
             (QREFELT $ 56))
            . #1#)
      (LETT |stSUP| (SPADCALL (ELT $ 57) |stALG| (QREFELT $ 60)) . #1#)
      (LETT |stUP|
            (SPADCALL (CONS (|function| |INPRODFF;reducePoly|) $) |stSUP|
                      (QREFELT $ 63))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL (ELT $ 64) |stUP| (QREFELT $ 67))
                 (QREFELT $ 68))))))) 

(DEFUN |INPRODFF;evenInfiniteProduct;2UTS;4| (|x| $)
  (PROG (|stUP| |stSUP| |stALG|)
    (RETURN
     (SEQ
      (LETT |stUP|
            (SPADCALL (ELT $ 36) (SPADCALL |x| (QREFELT $ 38)) (QREFELT $ 42))
            . #1=(|INPRODFF;evenInfiniteProduct;2UTS;4|))
      (LETT |stSUP|
            (SPADCALL (CONS (|function| |INPRODFF;liftPoly|) $) |stUP|
                      (QREFELT $ 46))
            . #1#)
      (LETT |stALG| (SPADCALL (ELT $ 47) |stSUP| (QREFELT $ 51)) . #1#)
      (LETT |stALG|
            (SPADCALL
             (SPADCALL (SPADCALL |stALG| (QREFELT $ 53)) (QREFELT $ 70))
             (QREFELT $ 56))
            . #1#)
      (LETT |stSUP| (SPADCALL (ELT $ 57) |stALG| (QREFELT $ 60)) . #1#)
      (LETT |stUP|
            (SPADCALL (CONS (|function| |INPRODFF;reducePoly|) $) |stSUP|
                      (QREFELT $ 63))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL (ELT $ 64) |stUP| (QREFELT $ 67))
                 (QREFELT $ 68))))))) 

(DEFUN |INPRODFF;oddInfiniteProduct;2UTS;5| (|x| $)
  (PROG (|stUP| |stSUP| |stALG|)
    (RETURN
     (SEQ
      (LETT |stUP|
            (SPADCALL (ELT $ 36) (SPADCALL |x| (QREFELT $ 38)) (QREFELT $ 42))
            . #1=(|INPRODFF;oddInfiniteProduct;2UTS;5|))
      (LETT |stSUP|
            (SPADCALL (CONS (|function| |INPRODFF;liftPoly|) $) |stUP|
                      (QREFELT $ 46))
            . #1#)
      (LETT |stALG| (SPADCALL (ELT $ 47) |stSUP| (QREFELT $ 51)) . #1#)
      (LETT |stALG|
            (SPADCALL
             (SPADCALL (SPADCALL |stALG| (QREFELT $ 53)) (QREFELT $ 72))
             (QREFELT $ 56))
            . #1#)
      (LETT |stSUP| (SPADCALL (ELT $ 57) |stALG| (QREFELT $ 60)) . #1#)
      (LETT |stUP|
            (SPADCALL (CONS (|function| |INPRODFF;reducePoly|) $) |stSUP|
                      (QREFELT $ 63))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL (ELT $ 64) |stUP| (QREFELT $ 67))
                 (QREFELT $ 68))))))) 

(DEFUN |INPRODFF;generalInfiniteProduct;UTS2IUTS;6| (|x| |a| |d| $)
  (PROG (|stUP| |stSUP| |stALG|)
    (RETURN
     (SEQ
      (LETT |stUP|
            (SPADCALL (ELT $ 36) (SPADCALL |x| (QREFELT $ 38)) (QREFELT $ 42))
            . #1=(|INPRODFF;generalInfiniteProduct;UTS2IUTS;6|))
      (LETT |stSUP|
            (SPADCALL (CONS (|function| |INPRODFF;liftPoly|) $) |stUP|
                      (QREFELT $ 46))
            . #1#)
      (LETT |stALG| (SPADCALL (ELT $ 47) |stSUP| (QREFELT $ 51)) . #1#)
      (LETT |stALG|
            (SPADCALL (SPADCALL |stALG| (QREFELT $ 53)) |a| |d| (QREFELT $ 74))
            . #1#)
      (LETT |stALG| (SPADCALL |stALG| (QREFELT $ 56)) . #1#)
      (LETT |stSUP| (SPADCALL (ELT $ 57) |stALG| (QREFELT $ 60)) . #1#)
      (LETT |stUP|
            (SPADCALL (CONS (|function| |INPRODFF;reducePoly|) $) |stSUP|
                      (QREFELT $ 63))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL (ELT $ 64) |stUP| (QREFELT $ 67))
                 (QREFELT $ 68))))))) 

(DEFUN |InfiniteProductFiniteField| (&REST #1=#:G171)
  (PROG ()
    (RETURN
     (PROG (#2=#:G172)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InfiniteProductFiniteField|)
                                           '|domainEqualList|)
                . #3=(|InfiniteProductFiniteField|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |InfiniteProductFiniteField;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|InfiniteProductFiniteField|))))))))))) 

(DEFUN |InfiniteProductFiniteField;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InfiniteProductFiniteField|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|InfiniteProductFiniteField| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 76) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InfiniteProductFiniteField|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 34 (|INPRODFF;liftPoly| (SPADCALL (QREFELT $ 33)) $))
      (QSETREFV $ 35
                (|SimpleAlgebraicExtension| (|Fraction| (|Integer|))
                                            (|SparseUnivariatePolynomial|
                                             (|Fraction| (|Integer|)))
                                            (QREFELT $ 34)))
      $)))) 

(MAKEPROP '|InfiniteProductFiniteField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|SparseUnivariatePolynomial| 17)
              (0 . |Zero|) (|Boolean|) (4 . |zero?|) (9 . |leadingCoefficient|)
              (|Integer|) (14 . |convert|) (|Fraction| 15) (19 . |coerce|)
              (|NonNegativeInteger|) (24 . |degree|) (29 . |monomial|) (35 . +)
              (41 . |reductum|) (46 . |Zero|) (50 . |zero?|)
              (55 . |leadingCoefficient|) (60 . |numer|) (65 . |coerce|)
              (70 . |degree|) (75 . |monomial|) (81 . +) (87 . |reductum|)
              (92 . |definingPolynomial|) 'POLY 'ALG (96 . |lift|) (|Stream| 8)
              (101 . |coefficients|) (|Stream| 7) (|Mapping| 7 8)
              (|StreamFunctions2| 8 7) (106 . |map|) (|Stream| 10)
              (|Mapping| 10 7) (|StreamFunctions2| 7 10) (112 . |map|)
              (118 . |reduce|) (|Stream| 35) (|Mapping| 35 10)
              (|StreamFunctions2| 10 35) (123 . |map|)
              (|StreamTranscendentalFunctions| 35) (129 . |log|)
              (|StreamTaylorSeriesOperations| 35) (134 . |lambert|)
              (139 . |exp|) (144 . |lift|) (|Mapping| 10 35)
              (|StreamFunctions2| 35 10) (149 . |map|) (|Mapping| 7 10)
              (|StreamFunctions2| 10 7) (155 . |map|) (161 . |reduce|)
              (|Mapping| 8 7) (|StreamFunctions2| 7 8) (166 . |map|)
              (172 . |series|) |INPRODFF;infiniteProduct;2UTS;3|
              (177 . |evenlambert|) |INPRODFF;evenInfiniteProduct;2UTS;4|
              (182 . |oddlambert|) |INPRODFF;oddInfiniteProduct;2UTS;5|
              (187 . |generalLambert|)
              |INPRODFF;generalInfiniteProduct;UTS2IUTS;6|)
           '#(|oddInfiniteProduct| 194 |infiniteProduct| 199
              |generalInfiniteProduct| 204 |evenInfiniteProduct| 211)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 75
                                                 '(0 10 0 11 1 7 12 0 13 1 7 6
                                                   0 14 1 6 15 0 16 1 17 0 15
                                                   18 1 7 19 0 20 2 10 0 17 19
                                                   21 2 10 0 0 0 22 1 7 0 0 23
                                                   0 7 0 24 1 10 12 0 25 1 10
                                                   17 0 26 1 17 15 0 27 1 6 0
                                                   15 28 1 10 19 0 29 2 7 0 6
                                                   19 30 2 7 0 0 0 31 1 10 0 0
                                                   32 0 8 7 33 1 8 7 0 36 1 9
                                                   37 0 38 2 41 39 40 37 42 2
                                                   45 43 44 39 46 1 35 0 10 47
                                                   2 50 48 49 43 51 1 52 48 48
                                                   53 1 54 48 48 55 1 52 48 48
                                                   56 1 35 10 0 57 2 59 43 58
                                                   48 60 2 62 39 61 43 63 1 8 0
                                                   7 64 2 66 37 65 39 67 1 9 0
                                                   37 68 1 54 48 48 70 1 54 48
                                                   48 72 3 54 48 48 15 15 74 1
                                                   0 9 9 73 1 0 9 9 69 3 0 9 9
                                                   15 15 75 1 0 9 9 71)))))
           '|lookupComplete|)) 
