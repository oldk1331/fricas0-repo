
(DEFUN |FSUPFACT;UPAN2F| (|p| $) (SPADCALL (ELT $ 15) |p| (QREFELT $ 19))) 

(DEFUN |FSUPFACT;UPQ2AN| (|p| $) (SPADCALL (ELT $ 21) |p| (QREFELT $ 25))) 

(DEFUN |FSUPFACT;ffactor;UPF;3| (|p| $)
  (PROG (|pq|)
    (RETURN
     (SEQ (LETT |pq| (SPADCALL |p| (QREFELT $ 27)) |FSUPFACT;ffactor;UPF;3|)
          (EXIT
           (COND
            ((QEQCAR |pq| 0)
             (SPADCALL (CONS (|function| |FSUPFACT;UPAN2F|) $) (QCDR |pq|)
                       (QREFELT $ 32)))
            ('T (|FSUPFACT;ffactor0| |p| $)))))))) 

(DEFUN |FSUPFACT;anfactor;UPU;4| (|p| $)
  (PROG (#1=#:G116 |q|)
    (RETURN
     (SEQ
      (LETT |q| (SPADCALL |p| (QREFELT $ 35)) . #2=(|FSUPFACT;anfactor;UPU;4|))
      (EXIT
       (COND
        ((QEQCAR |q| 0)
         (CONS 0
               (SPADCALL (CONS (|function| |FSUPFACT;UPQ2AN|) $)
                         (SPADCALL (CDR |q|) (QREFELT $ 38)) (QREFELT $ 41))))
        ((QEQCAR |q| 1)
         (CONS 0
               (SPADCALL
                (PROG2 (LETT #1# |q| . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 1)
                                 (|SparseUnivariatePolynomial|
                                  (|AlgebraicNumber|))
                                 #1#))
                (QREFELT $ 43))))
        ('T (CONS 1 "failed")))))))) 

(DEFUN |FSUPFACT;UP2ifCan;UPU;5| (|p| $)
  (PROG (#1=#:G137 |ansa| |ra| |goforq?| |ansq| |rq|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ansq| (|spadConstant| $ 44) . #2=(|FSUPFACT;UP2ifCan;UPU;5|))
        (LETT |ansa| (|spadConstant| $ 45) . #2#) (LETT |goforq?| 'T . #2#)
        (SEQ G190
             (COND
              ((NULL (SPADCALL |p| (|spadConstant| $ 48) (QREFELT $ 50)))
               (GO G191)))
             (SEQ
              (COND
               (|goforq?|
                (SEQ
                 (LETT |rq|
                       (SPADCALL (SPADCALL |p| (QREFELT $ 51)) (QREFELT $ 53))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |rq| 0)
                    (SEQ
                     (LETT |ansq|
                           (SPADCALL |ansq|
                                     (SPADCALL (QCDR |rq|)
                                               (SPADCALL |p| (QREFELT $ 55))
                                               (QREFELT $ 56))
                                     (QREFELT $ 57))
                           . #2#)
                     (EXIT
                      (LETT |ansa|
                            (SPADCALL |ansa|
                                      (SPADCALL
                                       (SPADCALL (QCDR |rq|) (QREFELT $ 21))
                                       (SPADCALL |p| (QREFELT $ 55))
                                       (QREFELT $ 58))
                                      (QREFELT $ 59))
                            . #2#))))
                   ('T
                    (SEQ (LETT |goforq?| 'NIL . #2#)
                         (LETT |ra|
                               (SPADCALL (SPADCALL |p| (QREFELT $ 51))
                                         (QREFELT $ 61))
                               . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |ra| 0)
                            (LETT |ansa|
                                  (SPADCALL |ansa|
                                            (SPADCALL (QCDR |ra|)
                                                      (SPADCALL |p|
                                                                (QREFELT $ 55))
                                                      (QREFELT $ 58))
                                            (QREFELT $ 59))
                                  . #2#))
                           ('T
                            (PROGN
                             (LETT #1# (CONS 2 'T) . #2#)
                             (GO #1#)))))))))))
               ('T
                (SEQ
                 (LETT |ra|
                       (SPADCALL (SPADCALL |p| (QREFELT $ 51)) (QREFELT $ 61))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |ra| 0)
                    (LETT |ansa|
                          (SPADCALL |ansa|
                                    (SPADCALL (QCDR |ra|)
                                              (SPADCALL |p| (QREFELT $ 55))
                                              (QREFELT $ 58))
                                    (QREFELT $ 59))
                          . #2#))
                   ('T (PROGN (LETT #1# (CONS 2 'T) . #2#) (GO #1#))))))))
              (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 62)) . #2#)))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (COND (|goforq?| (CONS 0 |ansq|)) ('T (CONS 1 |ansa|))))))
      #1# (EXIT #1#))))) 

(DEFUN |FSUPFACT;UPQ2F| (|p| $) (SPADCALL (ELT $ 63) |p| (QREFELT $ 66))) 

(DEFUN |FSUPFACT;ffactor;UPF;7| (|p| $)
  (PROG (|pq|)
    (RETURN
     (SEQ (LETT |pq| (SPADCALL |p| (QREFELT $ 68)) |FSUPFACT;ffactor;UPF;7|)
          (EXIT
           (COND
            ((QEQCAR |pq| 0)
             (SPADCALL (CONS (|function| |FSUPFACT;UPQ2F|) $) (QCDR |pq|)
                       (QREFELT $ 71)))
            ('T (|FSUPFACT;ffactor0| |p| $)))))))) 

(DEFUN |FSUPFACT;UP2ifCan;UPU;8| (|p| $)
  (PROG (#1=#:G154 |ansq| |rq|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ansq| (|spadConstant| $ 44) . #2=(|FSUPFACT;UP2ifCan;UPU;8|))
        (SEQ G190
             (COND
              ((NULL (SPADCALL |p| (|spadConstant| $ 48) (QREFELT $ 50)))
               (GO G191)))
             (SEQ
              (LETT |rq|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 51)) (QREFELT $ 53))
                    . #2#)
              (COND
               ((QEQCAR |rq| 0)
                (LETT |ansq|
                      (SPADCALL |ansq|
                                (SPADCALL (QCDR |rq|)
                                          (SPADCALL |p| (QREFELT $ 55))
                                          (QREFELT $ 56))
                                (QREFELT $ 57))
                      . #2#))
               ('T (PROGN (LETT #1# (CONS 2 'T) . #2#) (GO #1#))))
              (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 62)) . #2#)))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ansq|))))
      #1# (EXIT #1#))))) 

(DEFUN |FSUPFACT;ffactor0| (|p| $)
  (PROG (|q| |smp| |ep|)
    (RETURN
     (SEQ
      (LETT |smp|
            (SPADCALL
             (LETT |ep|
                   (SPADCALL |p| (SPADCALL (QREFELT $ 13) (QREFELT $ 73))
                             (QREFELT $ 74))
                   . #1=(|FSUPFACT;ffactor0|))
             (QREFELT $ 76))
            . #1#)
      (LETT |q| (|FSUPFACT;P2QifCan| |smp| $) . #1#)
      (EXIT
       (COND ((QEQCAR |q| 1) (SPADCALL |p| (QREFELT $ 77)))
             ('T
              (SPADCALL
               (CONS #'|FSUPFACT;ffactor0!0| (VECTOR |ep| $ (QREFELT $ 13)))
               (SPADCALL (QCDR |q|) (QREFELT $ 85)) (QREFELT $ 88))))))))) 

(DEFUN |FSUPFACT;ffactor0!0| (|x| $$)
  (PROG (|dummy| $ |ep|)
    (LETT |dummy| (QREFELT $$ 2) . #1=(|FSUPFACT;ffactor0|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |ep| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|FSUPFACT;UPQ2UP| (SPADCALL |x| |dummy| (QREFELT $ 80))
       (SPADCALL (SPADCALL |ep| (QREFELT $ 81)) (QREFELT $ 82)) $))))) 

(DEFUN |FSUPFACT;UPQ2UP| (|p| |d| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|FSUPFACT;UPQ2UP!0| (VECTOR $ |d|)) |p|
               (QREFELT $ 92))))) 

(DEFUN |FSUPFACT;UPQ2UP!0| (|x| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|FSUPFACT;UPQ2UP|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|FSUPFACT;PQ2F| |x| |d| $))))) 

(DEFUN |FSUPFACT;PQ2F| (|p| |d| $)
  (SPADCALL (SPADCALL (ELT $ 73) (ELT $ 63) |p| (QREFELT $ 95)) |d|
            (QREFELT $ 96))) 

(DEFUN |FSUPFACT;qfactor;UPU;12| (|p| $)
  (PROG (|q|)
    (RETURN
     (SEQ (LETT |q| (SPADCALL |p| (QREFELT $ 35)) |FSUPFACT;qfactor;UPU;12|)
          (EXIT
           (COND ((QEQCAR |q| 0) (CONS 0 (SPADCALL (CDR |q|) (QREFELT $ 38))))
                 ('T (CONS 1 "failed")))))))) 

(DEFUN |FSUPFACT;P2QifCan| (|p| $)
  (PROG (#1=#:G176 #2=#:G175 #3=#:G177 #4=#:G184 |c|)
    (RETURN
     (SEQ
      (COND
       ((PROGN
         (LETT #1# NIL . #5=(|FSUPFACT;P2QifCan|))
         (SEQ (LETT |c| NIL . #5#)
              (LETT #4# (SPADCALL |p| (QREFELT $ 99)) . #5#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #5#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (QEQCAR
                        (SPADCALL (SPADCALL |c| (QREFELT $ 100))
                                  (QREFELT $ 53))
                        0)
                       . #5#)
                 (COND (#1# (LETT #2# (COND (#2# #3#) ('T 'NIL)) . #5#))
                       ('T
                        (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
              (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#6='T 'T)))
        (CONS 0
              (SPADCALL (ELT $ 101) (CONS #'|FSUPFACT;P2QifCan!0| $) |p|
                        (QREFELT $ 107))))
       (#6# (CONS 1 "failed"))))))) 

(DEFUN |FSUPFACT;P2QifCan!0| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 100)) (QREFELT $ 102))
            (QREFELT $ 103))) 

(DECLAIM (NOTINLINE |FunctionSpaceUnivariatePolynomialFactor;|)) 

(DEFUN |FunctionSpaceUnivariatePolynomialFactor| (&REST #1=#:G185)
  (PROG ()
    (RETURN
     (PROG (#2=#:G186)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FunctionSpaceUnivariatePolynomialFactor|)
                                           '|domainEqualList|)
                . #3=(|FunctionSpaceUnivariatePolynomialFactor|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |FunctionSpaceUnivariatePolynomialFactor;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FunctionSpaceUnivariatePolynomialFactor|))))))))))) 

(DEFUN |FunctionSpaceUnivariatePolynomialFactor;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|FunctionSpaceUnivariatePolynomialFactor|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$|
            (LIST '|FunctionSpaceUnivariatePolynomialFactor| DV$1 DV$2 DV$3)
            . #1#)
      (LETT $ (GETREFV 108) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|AlgebraicNumber|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache|
                  '|FunctionSpaceUnivariatePolynomialFactor|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 13 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 12)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 33 (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPF;3|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |FSUPFACT;anfactor;UPU;4|) $))
         (QSETREFV $ 35
                   (CONS (|dispatchFunction| |FSUPFACT;UP2ifCan;UPU;5|) $))))
       ('T
        (PROGN
         (QSETREFV $ 33 (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPF;7|) $))
         (QSETREFV $ 35
                   (CONS (|dispatchFunction| |FSUPFACT;UP2ifCan;UPU;8|) $)))))
      $)))) 

(MAKEPROP '|FunctionSpaceUnivariatePolynomialFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |new|) (|Kernel| 7) (4 . |kernel|)
              '|dummy| (|AlgebraicNumber|) (9 . |coerce|) (|Mapping| 7 14)
              (|SparseUnivariatePolynomial| 14)
              (|UnivariatePolynomialCategoryFunctions2| 14 17 7 8) (14 . |map|)
              (|Fraction| (|Integer|)) (20 . |coerce|) (|Mapping| 14 20)
              (|SparseUnivariatePolynomial| 20)
              (|UnivariatePolynomialCategoryFunctions2| 20 23 14 17)
              (25 . |map|) (|Union| 30 '"failed") (31 . |anfactor|)
              (|Factored| 8) (|Mapping| 8 17) (|Factored| 17)
              (|FactoredFunctions2| 17 8) (36 . |map|) (42 . |ffactor|)
              (|Union| (|:| |overq| 23) (|:| |overan| 17) (|:| |failed| 49))
              (47 . |UP2ifCan|) (|Factored| 23) (|RationalFactorize| 23)
              (52 . |factor|) (|Mapping| 17 23) (|FactoredFunctions2| 23 17)
              (57 . |map|) (|AlgFactor| 17) (63 . |factor|) (68 . |Zero|)
              (72 . |Zero|) (76 . |Zero|) (80 . |Zero|) (84 . |Zero|)
              (|Boolean|) (88 . ~=) (94 . |leadingCoefficient|)
              (|Union| 20 '#1="failed") (99 . |retractIfCan|)
              (|NonNegativeInteger|) (104 . |degree|) (109 . |monomial|)
              (115 . +) (121 . |monomial|) (127 . +) (|Union| 14 '#1#)
              (133 . |retractIfCan|) (138 . |reductum|) (143 . |coerce|)
              (|Mapping| 7 20)
              (|UnivariatePolynomialCategoryFunctions2| 20 23 7 8)
              (148 . |map|) (|Union| 36 '"failed") |FSUPFACT;qfactor;UPU;12|
              (|Mapping| 8 23) (|FactoredFunctions2| 23 8) (154 . |map|)
              (|Kernel| $) (160 . |coerce|) (165 . |elt|)
              (|SparseMultivariatePolynomial| 6 72) (171 . |numer|)
              (176 . |coerce|) (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 20 11) (181 . |univariate|)
              (187 . |denom|) (192 . |coerce|) (|Factored| 79)
              (|MRationalFactorize| (|IndexedExponents| 11) 11 (|Integer|) 79)
              (197 . |factor|) (|Mapping| 8 79) (|FactoredFunctions2| 79 8)
              (202 . |map|) (|Mapping| 7 79) (|SparseUnivariatePolynomial| 79)
              (|UnivariatePolynomialCategoryFunctions2| 79 90 7 8)
              (208 . |map|) (|Mapping| 7 11)
              (|PolynomialCategoryLifting| (|IndexedExponents| 11) 11 20 79 7)
              (214 . |map|) (221 . /) (|List| 6)
              (|SparseMultivariatePolynomial| 6 11) (227 . |coefficients|)
              (232 . |coerce|) (237 . |coerce|) (242 . |retract|)
              (247 . |coerce|) (|Mapping| 79 11) (|Mapping| 79 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 11) 11 6 98 79)
              (252 . |map|))
           '#(|qfactor| 259 |ffactor| 264 |anfactor| 269 |UP2ifCan| 274) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 107
                                                 '(0 9 0 10 1 11 0 9 12 1 7 0
                                                   14 15 2 18 8 16 17 19 1 14 0
                                                   20 21 2 24 17 22 23 25 1 0
                                                   26 8 27 2 31 28 29 30 32 1 0
                                                   28 8 33 1 0 34 8 35 1 37 36
                                                   23 38 2 40 30 39 36 41 1 42
                                                   30 17 43 0 23 0 44 0 17 0 45
                                                   0 6 0 46 0 7 0 47 0 8 0 48 2
                                                   8 49 0 0 50 1 8 7 0 51 1 7
                                                   52 0 53 1 8 54 0 55 2 23 0
                                                   20 54 56 2 23 0 0 0 57 2 17
                                                   0 14 54 58 2 17 0 0 0 59 1 7
                                                   60 0 61 1 8 0 0 62 1 7 0 20
                                                   63 2 65 8 64 23 66 2 70 28
                                                   69 36 71 1 7 0 72 73 2 8 7 0
                                                   7 74 1 7 75 0 76 1 28 0 8 77
                                                   2 79 78 0 11 80 1 7 75 0 81
                                                   1 7 0 75 82 1 84 83 79 85 2
                                                   87 28 86 83 88 2 91 8 89 90
                                                   92 3 94 7 93 64 79 95 2 7 0
                                                   0 0 96 1 98 97 0 99 1 7 0 6
                                                   100 1 79 0 11 101 1 7 20 0
                                                   102 1 79 0 20 103 3 106 79
                                                   104 105 98 107 1 0 67 8 68 1
                                                   0 28 8 33 1 1 26 8 27 1 0 34
                                                   8 35)))))
           '|lookupComplete|)) 
