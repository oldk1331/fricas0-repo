
(DEFUN |IBATOOL;diagonalProduct;MR;1| (|m| $)
  (PROG (|ans| #1=#:G116 |i| #2=#:G117 |j|)
    (RETURN
     (SEQ
      (LETT |ans| (|spadConstant| $ 9) . #3=(|IBATOOL;diagonalProduct;MR;1|))
      (SEQ (LETT |j| 1 . #3#) (LETT #2# (SPADCALL |m| (QREFELT $ 13)) . #3#)
           (LETT |i| 1 . #3#) (LETT #1# (SPADCALL |m| (QREFELT $ 12)) . #3#)
           G190
           (COND
            ((OR (|greater_SI| |i| #1#) (|greater_SI| |j| #2#)) (GO G191)))
           (SEQ
            (EXIT
             (LETT |ans|
                   (SPADCALL |ans| (QAREF2O |m| |i| |j| 1 1) (QREFELT $ 14))
                   . #3#)))
           (LETT |i| (PROG1 (|inc_SI| |i|) (LETT |j| (|inc_SI| |j|) . #3#))
                 . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |IBATOOL;matrixGcd;MRNniR;2| (|mat| |sing| |n| $)
  (PROG (#1=#:G123 |d| |mij| |j| |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |d| |sing| . #2=(|IBATOOL;matrixGcd;MRNniR;2|))
            (SEQ (LETT |i| 1 . #2#) G190
                 (COND ((|greater_SI| |i| |n|) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| |i| . #2#) G190
                        (COND ((> |j| |n|) (GO G191)))
                        (SEQ
                         (COND
                          ((NULL
                            (SPADCALL
                             (LETT |mij| (QAREF2O |mat| |i| |j| 1 1) . #2#)
                             (QREFELT $ 17)))
                           (LETT |d| (SPADCALL |d| |mij| (QREFELT $ 18))
                                 . #2#)))
                         (EXIT
                          (COND
                           ((SPADCALL |d| (|spadConstant| $ 9) (QREFELT $ 20))
                            (PROGN (LETT #1# |d| . #2#) (GO #1#))))))
                        (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
            (EXIT |d|)))
      #1# (EXIT #1#))))) 

(DEFUN |IBATOOL;divideIfCan!;2MRIR;3| (|matrix| |matrixOut| |prime| |n| $)
  (PROG (#1=#:G131 |a| |j| |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #2=(|IBATOOL;divideIfCan!;2MRIR;3|)) G190
             (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| |i| . #2#) G190 (COND ((> |j| |n|) (GO G191)))
                    (SEQ
                     (LETT |a|
                           (SPADCALL (QAREF2O |matrix| |i| |j| 1 1) |prime|
                                     (QREFELT $ 24))
                           . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |a| 1)
                        (PROGN (LETT #1# |prime| . #2#) (GO #1#)))
                       ('T (QSETAREF2O |matrixOut| |i| |j| (QCDR |a|) 1 1)))))
                    (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT (|spadConstant| $ 9))))
      #1# (EXIT #1#))))) 

(DEFUN |IBATOOL;leastPower;3Nni;4| (|p| |n| $)
  (PROG (|q| |e|)
    (RETURN
     (SEQ (LETT |e| 1 . #1=(|IBATOOL;leastPower;3Nni;4|)) (LETT |q| |p| . #1#)
          (SEQ G190 (COND ((NULL (< |q| |n|)) (GO G191)))
               (SEQ (LETT |e| (+ |e| 1) . #1#)
                    (EXIT (LETT |q| (* |q| |p|) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |e|))))) 

(DEFUN |IBATOOL;idealiserMatrix;3M;5| (|ideal| |idealinv| $)
  (PROG (#1=#:G144 |k| #2=#:G143 |j| |m| |r| #3=#:G142 |i| |v| |mc| |mr| |bigm|
         |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 28))
            . #4=(|IBATOOL;idealiserMatrix;3M;5|))
      (LETT |bigm| (SPADCALL (* |n| |n|) |n| (QREFELT $ 29)) . #4#)
      (LETT |mr| 1 . #4#) (LETT |mc| 1 . #4#)
      (LETT |v| (SPADCALL (QREFELT $ 31)) . #4#)
      (SEQ (LETT |i| 0 . #4#) (LETT #3# (- |n| 1) . #4#) G190
           (COND ((|greater_SI| |i| #3#) (GO G191)))
           (SEQ
            (LETT |r|
                  (SPADCALL
                   (SPADCALL
                    (QAREF1O |v| (+ |i| (SPADCALL |v| (QREFELT $ 33))) 1)
                    (QREFELT $ 34))
                   (QREFELT $ 35))
                  . #4#)
            (LETT |m|
                  (SPADCALL (SPADCALL |ideal| |r| (QREFELT $ 36)) |idealinv|
                            (QREFELT $ 36))
                  . #4#)
            (EXIT
             (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#) G190
                  (COND ((|greater_SI| |j| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |k| 0 . #4#) (LETT #1# (- |n| 1) . #4#) G190
                         (COND ((|greater_SI| |k| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |bigm| (+ (+ (* |j| |n|) |k|) |mr|)
                                     (+ |i| |mc|)
                                     (QAREF2O |m| (+ |j| |mr|) (+ |k| |mc|) 1
                                              1)
                                     (QREFELT $ 37))))
                         (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT |bigm|))))) 

(DEFUN |IBATOOL;idealiser;3M;6| (|ideal| |idealinv| $)
  (PROG (|bigm|)
    (RETURN
     (SEQ
      (LETT |bigm| (SPADCALL |ideal| |idealinv| (QREFELT $ 38))
            |IBATOOL;idealiser;3M;6|)
      (EXIT
       (SPADCALL (SPADCALL (SPADCALL |bigm| (QREFELT $ 40)) (QREFELT $ 41))
                 (QREFELT $ 35))))))) 

(DEFUN |IBATOOL;idealiser;2MRM;7| (|ideal| |idealinv| |denom| $)
  (PROG (|bigm| #1=#:G148)
    (RETURN
     (SEQ
      (LETT |bigm|
            (PROG2
                (LETT #1#
                      (SPADCALL (SPADCALL |ideal| |idealinv| (QREFELT $ 38))
                                |denom| (QREFELT $ 43))
                      . #2=(|IBATOOL;idealiser;2MRM;7|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|Matrix| (QREFELT $ 6)) #1#))
            . #2#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL |bigm| |denom| (QREFELT $ 44)) (QREFELT $ 41))
        (QREFELT $ 35))))))) 

(DEFUN |IBATOOL;moduleSum;3R;8| (|mod1| |mod2| $)
  (PROG (|rbinv| |rb| |c2| |c1| |den| |n| |rbinv2| |rbden2| |rb2| |rbinv1|
         |rbden1| |rb1|)
    (RETURN
     (SEQ (LETT |rb1| (QVELT |mod1| 0) . #1=(|IBATOOL;moduleSum;3R;8|))
          (LETT |rbden1| (QVELT |mod1| 1) . #1#)
          (LETT |rbinv1| (QVELT |mod1| 2) . #1#)
          (LETT |rb2| (QVELT |mod2| 0) . #1#)
          (LETT |rbden2| (QVELT |mod2| 1) . #1#)
          (LETT |rbinv2| (QVELT |mod2| 2) . #1#)
          (COND
           ((SPADCALL |rb1| (QREFELT $ 46))
            (COND
             ((SPADCALL |rbinv1| (QREFELT $ 46))
              (COND
               ((SPADCALL |rb2| (QREFELT $ 46))
                (COND
                 ((NULL (SPADCALL |rbinv2| (QREFELT $ 46)))
                  (EXIT (|error| #2="moduleSum: matrices must be square")))))
               (#3='T (EXIT (|error| #2#)))))
             (#3# (EXIT (|error| #2#)))))
           (#3# (EXIT (|error| #2#))))
          (COND
           ((OR
             (SPADCALL (LETT |n| (ANROWS |rb1|) . #1#) (ANROWS |rbinv1|)
                       (QREFELT $ 47))
             (OR (SPADCALL |n| (ANROWS |rb2|) (QREFELT $ 47))
                 (SPADCALL |n| (ANROWS |rbinv2|) (QREFELT $ 47))))
            (EXIT (|error| "moduleSum: matrices of incompatible dimensions"))))
          (COND
           ((OR (SPADCALL |rbden1| (QREFELT $ 17))
                (SPADCALL |rbden2| (QREFELT $ 17)))
            (EXIT (|error| "moduleSum: denominator must be non-zero"))))
          (LETT |den| (SPADCALL |rbden1| |rbden2| (QREFELT $ 48)) . #1#)
          (LETT |c1| (SPADCALL |den| |rbden1| (QREFELT $ 49)) . #1#)
          (LETT |c2| (SPADCALL |den| |rbden2| (QREFELT $ 49)) . #1#)
          (LETT |rb|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |c1| |rb1| (QREFELT $ 50))
                            (SPADCALL |c2| |rb2| (QREFELT $ 50))
                            (QREFELT $ 51))
                  |den| (QREFELT $ 44))
                 (QREFELT $ 41))
                . #1#)
          (LETT |rbinv| (SPADCALL |rb| |den| (QREFELT $ 53)) . #1#)
          (EXIT (VECTOR |rb| |den| |rbinv|)))))) 

(DECLAIM (NOTINLINE |IntegralBasisTools;|)) 

(DEFUN |IntegralBasisTools| (&REST #1=#:G165)
  (PROG ()
    (RETURN
     (PROG (#2=#:G166)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|IntegralBasisTools|)
                                           '|domainEqualList|)
                . #3=(|IntegralBasisTools|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |IntegralBasisTools;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|IntegralBasisTools|))))))))))) 

(DEFUN |IntegralBasisTools;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegralBasisTools|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|IntegralBasisTools| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 56) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|IntegralBasisTools|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|IntegralBasisTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |One|) (|Integer|) (|Matrix| 6)
              (4 . |maxRowIndex|) (9 . |maxColIndex|) (14 . *)
              |IBATOOL;diagonalProduct;MR;1| (|Boolean|) (20 . |zero?|)
              (25 . |gcd|) (31 . |One|) (35 . =) (|NonNegativeInteger|)
              |IBATOOL;matrixGcd;MRNniR;2| (|Union| $ '"failed") (41 . |exquo|)
              |IBATOOL;divideIfCan!;2MRIR;3| |IBATOOL;leastPower;3Nni;4|
              (|PositiveInteger|) (47 . |rank|) (51 . |zero|) (|Vector| $)
              (57 . |basis|) (|Vector| 8) (61 . |minIndex|)
              (66 . |regularRepresentation|) (71 . |transpose|) (76 . *)
              (82 . |setelt|) |IBATOOL;idealiserMatrix;3M;5|
              (|ModularHermitianRowReduction| 6) (90 . |rowEch|)
              (95 . |squareTop|) |IBATOOL;idealiser;3M;6| (100 . |exquo|)
              (106 . |rowEchelon|) |IBATOOL;idealiser;2MRM;7| (112 . |square?|)
              (117 . ~=) (123 . |lcm|) (129 . |quo|) (135 . *)
              (141 . |vertConcat|)
              (|TriangularMatrixOperations| 6 (|Vector| 6) (|Vector| 6) 11)
              (147 . |UpTriBddDenomInv|)
              (|Record| (|:| |basis| 11) (|:| |basisDen| 6)
                        (|:| |basisInv| 11))
              |IBATOOL;moduleSum;3R;8|)
           '#(|moduleSum| 153 |matrixGcd| 159 |leastPower| 166
              |idealiserMatrix| 172 |idealiser| 178 |divideIfCan!| 191
              |diagonalProduct| 199)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(0 6 0 9 1 11 10 0 12 1 11 10
                                                   0 13 2 6 0 0 0 14 1 6 16 0
                                                   17 2 6 0 0 0 18 0 7 0 19 2 6
                                                   16 0 0 20 2 6 23 0 0 24 0 8
                                                   27 28 2 11 0 21 21 29 0 8 30
                                                   31 1 32 10 0 33 1 8 11 0 34
                                                   1 11 0 0 35 2 11 0 0 0 36 4
                                                   11 6 0 10 10 6 37 1 39 11 11
                                                   40 1 11 0 0 41 2 11 23 0 6
                                                   43 2 39 11 11 6 44 1 11 16 0
                                                   46 2 21 16 0 0 47 2 6 0 0 0
                                                   48 2 6 0 0 0 49 2 11 0 6 0
                                                   50 2 11 0 0 0 51 2 52 11 11
                                                   6 53 2 0 54 54 54 55 3 0 6
                                                   11 6 21 22 2 0 21 21 21 26 2
                                                   0 11 11 11 38 3 0 11 11 11 6
                                                   45 2 0 11 11 11 42 4 0 6 11
                                                   11 6 10 25 1 0 6 11 15)))))
           '|lookupComplete|)) 
