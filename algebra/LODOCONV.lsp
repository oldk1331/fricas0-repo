
(SDEFUN |LODOCONV;convert;LodoLodo;1|
        ((|l1| |LinearOrdinaryDifferentialOperator1| R)
         ($ |LinearOrdinaryDifferentialOperator3| |Coeff| |Ab| R))
        (SPROG
         ((|l3| (|LinearOrdinaryDifferentialOperator3| |Coeff| |Ab| R))
          (#1=#:G105 NIL))
         (SEQ
          (LETT |l3| (|spadConstant| $ 10)
                . #2=(|LODOCONV;convert;LodoLodo;1|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |l1| (|spadConstant| $ 14) (QREFELT $ 16)))
                 (GO G191)))
               (SEQ
                (LETT |l3|
                      (SPADCALL |l3|
                                (SPADCALL (SPADCALL |l1| (QREFELT $ 17))
                                          (SPADCALL
                                           (SPADCALL
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (|spadConstant| $ 18)
                                                         1 (QREFELT $ 21))
                                                        (|spadConstant| $ 22)
                                                        (QREFELT $ 23))
                                                       (QREFELT $ 25))
                                                      . #2#)
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0)
                                                              (QREFELT $ 8)
                                                              (|Union|
                                                               (QREFELT $ 8)
                                                               "failed")
                                                              #1#))
                                            (SPADCALL (QREFELT $ 26))
                                            (QREFELT $ 27))
                                           (SPADCALL |l1| (QREFELT $ 28))
                                           (QREFELT $ 29))
                                          (QREFELT $ 27))
                                (QREFELT $ 30))
                      . #2#)
                (EXIT (LETT |l1| (SPADCALL |l1| (QREFELT $ 31)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |l3|)))) 

(SDEFUN |LODOCONV;convert;LodoLodo;2|
        ((|l3| |LinearOrdinaryDifferentialOperator3| |Coeff| |Ab| R)
         ($ |LinearOrdinaryDifferentialOperator1| R))
        (SPROG ((|l1| (|LinearOrdinaryDifferentialOperator1| R)))
               (SEQ
                (LETT |l1| (|spadConstant| $ 14)
                      . #1=(|LODOCONV;convert;LodoLodo;2|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |l3| (|spadConstant| $ 10) (QREFELT $ 33)))
                       (GO G191)))
                     (SEQ
                      (LETT |l1|
                            (SPADCALL |l1|
                                      (SPADCALL (SPADCALL |l3| (QREFELT $ 34))
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (|spadConstant| $ 18) 1
                                                    (QREFELT $ 21))
                                                   (|spadConstant| $ 22)
                                                   (QREFELT $ 23))
                                                  (SPADCALL (QREFELT $ 35))
                                                  (QREFELT $ 36))
                                                 (SPADCALL |l3| (QREFELT $ 37))
                                                 (QREFELT $ 38))
                                                (QREFELT $ 36))
                                      (QREFELT $ 39))
                            . #1#)
                      (EXIT (LETT |l3| (SPADCALL |l3| (QREFELT $ 40)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |l1|)))) 

(DECLAIM (NOTINLINE |LODOConvertions;|)) 

(DEFUN |LODOConvertions| (&REST #1=#:G115)
  (SPROG NIL
         (PROG (#2=#:G116)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LODOConvertions|)
                                               '|domainEqualList|)
                    . #3=(|LODOConvertions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LODOConvertions;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LODOConvertions|)))))))))) 

(DEFUN |LODOConvertions;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LODOConvertions|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|LODOConvertions| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 42) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LODOConvertions|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|LODOConvertions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|LinearOrdinaryDifferentialOperator3| 6 7 8)
              (0 . |Zero|) (4 . |Zero|) (8 . |Zero|)
              (|LinearOrdinaryDifferentialOperator1| 8) (12 . |Zero|)
              (|Boolean|) (16 . ~=) (22 . |leadingCoefficient|) (27 . |One|)
              (31 . |One|) (|NonNegativeInteger|) (35 . |monomial|)
              (41 . |One|) (45 . *) (|Union| $ '"failed") (51 . |recip|)
              (56 . D) (60 . *) (66 . |degree|) (71 . ^) (77 . +)
              (83 . |reductum|) |LODOCONV;convert;LodoLodo;1| (88 . ~=)
              (94 . |leadingCoefficient|) (99 . D) (103 . *) (109 . |degree|)
              (114 . ^) (120 . +) (126 . |reductum|)
              |LODOCONV;convert;LodoLodo;2|)
           '#(|convert| 131) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 41
                                                 '(0 9 0 10 0 6 0 11 0 7 0 12 0
                                                   13 0 14 2 13 15 0 0 16 1 13
                                                   8 0 17 0 6 0 18 0 7 0 19 2 7
                                                   0 6 20 21 0 8 0 22 2 8 0 7 0
                                                   23 1 8 24 0 25 0 9 0 26 2 9
                                                   0 8 0 27 1 13 20 0 28 2 9 0
                                                   0 20 29 2 9 0 0 0 30 1 13 0
                                                   0 31 2 9 15 0 0 33 1 9 8 0
                                                   34 0 13 0 35 2 13 0 8 0 36 1
                                                   9 20 0 37 2 13 0 0 20 38 2
                                                   13 0 0 0 39 1 9 0 0 40 1 0
                                                   13 9 41 1 0 9 13 32)))))
           '|lookupComplete|)) 
