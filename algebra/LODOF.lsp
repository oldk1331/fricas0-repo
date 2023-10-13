
(/VERSIONCHECK 2) 

(DEFUN |LODOF;factor;LodoML;1| (|l| |zeros| $)
  (|LODOF;innerFactor| |l| |zeros| (ELT $ 12) 'T $)) 

(DEFUN |LODOF;expsol| (|l| |zeros| |ezfactor| $)
  (PROG (|sol|)
    (RETURN
     (COND
      ((NULL
        (LETT |sol| (|LODOF;expsols| |l| |zeros| |ezfactor| 'NIL $)
              |LODOF;expsol|))
       (CONS 1 "failed"))
      ('T (CONS 0 (|SPADfirst| |sol|))))))) 

(DEFUN |LODOF;expsols| (|l| |zeros| |ezfactor| |all?| $)
  (PROG (|sol| #1=#:G153 |f| #2=#:G152)
    (RETURN
     (SEQ
      (LETT |sol|
            (PROGN
             (LETT #2# NIL . #3=(|LODOF;expsols|))
             (SEQ (LETT |f| NIL . #3#)
                  (LETT #1#
                        (QCDR
                         (SPADCALL |l| (|spadConstant| $ 19) (QREFELT $ 23)))
                        . #3#)
                  G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |f| (|spadConstant| $ 19) (QREFELT $ 25))
                      (LETT #2#
                            (CONS
                             (SPADCALL (SPADCALL |f| (QREFELT $ 26)) |f|
                                       (QREFELT $ 27))
                             #2#)
                            . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (COND ((NULL |all?|) (COND ((NULL (NULL |sol|)) (EXIT |sol|)))))
      (EXIT
       (SPADCALL |sol| (SPADCALL |l| |zeros| |ezfactor| (QREFELT $ 31))
                 (QREFELT $ 32))))))) 

(DEFUN |LODOF;opeval| (|l1| |l2| $)
  (PROG (|l2n| |ans| #1=#:G158 |i|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 33) . #2=(|LODOF;opeval|))
          (LETT |l2n| (|spadConstant| $ 34) . #2#)
          (SEQ (LETT |i| 0 . #2#)
               (LETT #1# (SPADCALL |l1| (QREFELT $ 36)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL (SPADCALL |l1| |i| (QREFELT $ 37))
                                          |l2n| (QREFELT $ 38))
                                (QREFELT $ 39))
                      . #2#)
                (EXIT (LETT |l2n| (SPADCALL |l2| |l2n| (QREFELT $ 40)) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |LODOF;recurfactor| (|l| |r| |zeros| |ezfactor| |adj?| $)
  (PROG (|q| #1=#:G160)
    (RETURN
     (SEQ
      (LETT |q|
            (PROG2
                (LETT #1# (SPADCALL |l| |r| (QREFELT $ 42))
                      . #2=(|LODOF;recurfactor|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0)
                             (|LinearOrdinaryDifferentialOperator1|
                              (|Fraction| (QREFELT $ 7)))
                             #1#))
            . #2#)
      (COND (|adj?| (LETT |q| (SPADCALL |q| (QREFELT $ 43)) . #2#)))
      (EXIT (|LODOF;innerFactor| |q| |zeros| |ezfactor| 'T $)))))) 

(DEFUN |LODOF;rfactor| (|op| |r| |zeros| |ezfactor| |adj?| $)
  (PROG (|op1|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL (SPADCALL |r| (QREFELT $ 36)) 1 (QREFELT $ 45))
            (NULL
             (SPADCALL (SPADCALL |r| (QREFELT $ 46)) (|spadConstant| $ 47)
                       (QREFELT $ 48))))
        (|LODOF;recurfactor| |op| |r| |zeros| |ezfactor| |adj?| $))
       ('T
        (SEQ
         (LETT |op1|
               (|LODOF;opeval| |op|
                (SPADCALL (QREFELT $ 10)
                          (SPADCALL (SPADCALL |r| 0 (QREFELT $ 37))
                                    (QREFELT $ 49))
                          (QREFELT $ 50))
                $)
               |LODOF;rfactor|)
         (EXIT
          (SPADCALL (CONS #'|LODOF;rfactor!0| (VECTOR $ |r|))
                    (|LODOF;recurfactor| |op1| (QREFELT $ 10) |zeros|
                     |ezfactor| |adj?| $)
                    (QREFELT $ 52)))))))))) 

(DEFUN |LODOF;rfactor!0| (|z1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|LODOF;rfactor|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|LODOF;opeval| |z1| |r| $))))) 

(DEFUN |LODOF;innerFactor| (|l| |zeros| |ezfactor| |r1?| $)
  (PROG (#1=#:G195 #2=#:G199 |u| #3=#:G200 |i| |ll| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |n| (SPADCALL |l| (QREFELT $ 36)) . #4=(|LODOF;innerFactor|))
            (EXIT
             (COND ((SPADCALL |n| 1 (QREFELT $ 54)) (LIST |l|))
                   ('T
                    (SEQ (LETT |ll| (SPADCALL |l| (QREFELT $ 43)) . #4#)
                         (SEQ (LETT |i| 1 . #4#)
                              (LETT #3# (QUOTIENT2 |n| 2) . #4#) G190
                              (COND ((|greater_SI| |i| #3#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ
                                 (COND
                                  ((OR |r1?| (SPADCALL |i| 1 (QREFELT $ 45)))
                                   (SEQ
                                    (LETT |u|
                                          (|LODOF;rightFactor| |l| |i| |zeros|
                                           |ezfactor| $)
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |u| 0)
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2#
                                                     (SPADCALL
                                                      (|LODOF;rfactor| |l|
                                                       (QCDR |u|) |zeros|
                                                       |ezfactor| 'NIL $)
                                                      (QCDR |u|)
                                                      (QREFELT $ 55))
                                                     . #4#)
                                               (GO #2#))
                                              . #4#)
                                        (GO #1#))))))))
                                 (EXIT
                                  (COND
                                   ((< (SPADCALL 2 |i| (QREFELT $ 57)) |n|)
                                    (SEQ
                                     (LETT |u|
                                           (|LODOF;rightFactor| |ll| |i|
                                            |zeros| |ezfactor| $)
                                           . #4#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |u| 0)
                                        (PROGN
                                         (LETT #1#
                                               (PROGN
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL (QCDR |u|)
                                                                 (QREFELT $
                                                                          43))
                                                       (|LODOF;rfactor| |ll|
                                                        (QCDR |u|) |zeros|
                                                        |ezfactor| 'T $))
                                                      . #4#)
                                                (GO #2#))
                                               . #4#)
                                         (GO #1#)))))))))))
                               #1# (EXIT #1#))
                              (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (LIST |l|))))))))
      #2# (EXIT #2#))))) 

(DEFUN |LODOF;rightFactor| (|l| |n| |zeros| |ezfactor| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (COND
       ((EQL |n| 1)
        (SEQ
         (LETT |u| (|LODOF;expsol| |l| |zeros| |ezfactor| $)
               |LODOF;rightFactor|)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                (#1='T
                 (CONS 0
                       (SPADCALL (SPADCALL (QREFELT $ 9))
                                 (SPADCALL (QCDR |u|) (QREFELT $ 49))
                                 (QREFELT $ 50))))))))
       (#1# (CONS 1 "failed"))))))) 

(DEFUN |LODOF;zro| (|p| |ezfactor| $)
  (PROG (#1=#:G215 |r| #2=#:G214)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|LODOF;zro|))
        (SEQ (LETT |r| NIL . #3#)
             (LETT #1# (SPADCALL (SPADCALL |p| |ezfactor|) (QREFELT $ 61))
                   . #3#)
             G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (|LODOF;zro1| (QCAR |r|) $) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 64)))))) 

(DEFUN |LODOF;zro1| (|p| $)
  (LIST
   (SPADCALL (SPADCALL (LIST #'|LODOF;zro1!0|) |p| (QREFELT $ 68))
             (QREFELT $ 70)))) 

(DEFUN |LODOF;zro1!0| (|z1| $$) |z1|) 

(DEFUN |LODOF;factor;LodoL;11| (|l| $)
  (|LODOF;innerFactor| |l| (CONS #'|LODOF;factor;LodoL;11!0| $) (ELT $ 72) 'T
   $)) 

(DEFUN |LODOF;factor;LodoL;11!0| (|p1| $) (|LODOF;zro| |p1| (ELT $ 72) $)) 

(DEFUN |LODOF;factor1;LodoL;12| (|l| $)
  (|LODOF;innerFactor| |l| (CONS #'|LODOF;factor1;LodoL;12!0| $) (ELT $ 72)
   'NIL $)) 

(DEFUN |LODOF;factor1;LodoL;12!0| (|p1| $) (|LODOF;zro| |p1| (ELT $ 72) $)) 

(DEFUN |LODOF;factor;LodoL;13| (|l| $)
  (|LODOF;innerFactor| |l| (CONS #'|LODOF;factor;LodoL;13!0| $) (ELT $ 12) 'T
   $)) 

(DEFUN |LODOF;factor;LodoL;13!0| (|p1| $) (|LODOF;zro| |p1| (ELT $ 12) $)) 

(DEFUN |LODOF;factor1;LodoL;14| (|l| $)
  (|LODOF;innerFactor| |l| (CONS #'|LODOF;factor1;LodoL;14!0| $) (ELT $ 12)
   'NIL $)) 

(DEFUN |LODOF;factor1;LodoL;14!0| (|p1| $) (|LODOF;zro| |p1| (ELT $ 12) $)) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer| (&REST #1=#:G235)
  (PROG ()
    (RETURN
     (PROG (#2=#:G236)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LinearOrdinaryDifferentialOperatorFactorizer|)
                                           '|domainEqualList|)
                . #3=(|LinearOrdinaryDifferentialOperatorFactorizer|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |LinearOrdinaryDifferentialOperatorFactorizer;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|LinearOrdinaryDifferentialOperatorFactorizer|))))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|LinearOrdinaryDifferentialOperatorFactorizer|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$|
            (LIST '|LinearOrdinaryDifferentialOperatorFactorizer| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 75) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|AlgebraicallyClosedField|))))
                      . #1#))
      (|haddProp| |$ConstructorCache|
                  '|LinearOrdinaryDifferentialOperatorFactorizer|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (COND
          ((|domainEqual| |#1| (|AlgebraicNumber|))
           (PROGN
            (QSETREFV $ 73
                      (CONS (|dispatchFunction| |LODOF;factor;LodoL;11|) $))
            (QSETREFV $ 74
                      (CONS (|dispatchFunction| |LODOF;factor1;LodoL;12|) $))))
          ('T
           (PROGN
            (QSETREFV $ 73
                      (CONS (|dispatchFunction| |LODOF;factor;LodoL;13|) $))
            (QSETREFV $ 74
                      (CONS (|dispatchFunction| |LODOF;factor1;LodoL;14|)
                            $))))))))
      $)))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperatorFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|LinearOrdinaryDifferentialOperator1| 18) (0 . D) '|dd|
              (|Factored| $) (4 . |squareFree|) (|List| 8) (|Mapping| 63 7)
              |LODOF;factor;LodoML;1| (9 . |Zero|) (13 . |Zero|) (|Fraction| 7)
              (17 . |Zero|) (|Union| 18 '"failed")
              (|Record| (|:| |particular| 20) (|:| |basis| 28))
              (|RationalLODE| 6 7) (21 . |ratDsolve|) (|Boolean|) (27 . ~=)
              (33 . |differentiate|) (38 . /) (|List| 18) (|Mapping| 60 7)
              (|RationalRicDE| 6 7) (44 . |ricDsolve|) (51 . |concat|)
              (57 . |Zero|) (61 . |One|) (|NonNegativeInteger|) (65 . |degree|)
              (70 . |coefficient|) (76 . *) (82 . +) (88 . *)
              (|Union| $ '"failed") (94 . |rightExactQuotient|)
              (100 . |adjoint|) (105 . |One|) (109 . >)
              (115 . |leadingCoefficient|) (120 . |One|) (124 . =)
              (130 . |coerce|) (135 . -) (|Mapping| 8 8) (141 . |map!|)
              (147 . |One|) (151 . <=) (157 . |concat!|) (|PositiveInteger|)
              (163 . *)
              (|Record| (|:| |factor| 7) (|:| |exponent| (|Integer|)))
              (|List| 58) (|Factored| 7) (169 . |factors|) (|List| $)
              (|List| 6) (174 . |concat|) (|SparseUnivariatePolynomial| 6)
              (|Mapping| 6 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 6 65) (179 . |map|)
              (|SparseUnivariatePolynomial| $) (185 . |zeroOf|) (|AlgFactor| 7)
              (190 . |factor|) (195 . |factor|) (200 . |factor1|))
           '#(|factor1| 205 |factor| 210) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 74
                                                 '(0 8 0 9 1 7 11 0 12 0 6 0 16
                                                   0 7 0 17 0 18 0 19 2 22 21 8
                                                   18 23 2 18 24 0 0 25 1 18 0
                                                   0 26 2 18 0 0 0 27 3 30 28 8
                                                   14 29 31 2 28 0 0 0 32 0 8 0
                                                   33 0 8 0 34 1 8 35 0 36 2 8
                                                   18 0 35 37 2 8 0 18 0 38 2 8
                                                   0 0 0 39 2 8 0 0 0 40 2 8 41
                                                   0 0 42 1 8 0 0 43 0 6 0 44 2
                                                   35 24 0 0 45 1 8 18 0 46 0
                                                   18 0 47 2 18 24 0 0 48 1 8 0
                                                   18 49 2 8 0 0 0 50 2 13 0 51
                                                   0 52 0 7 0 53 2 35 24 0 0 54
                                                   2 13 0 0 8 55 2 35 0 56 0 57
                                                   1 60 59 0 61 1 63 0 62 64 2
                                                   67 65 66 7 68 1 6 0 69 70 1
                                                   71 60 7 72 1 0 13 8 73 1 0
                                                   13 8 74 1 1 13 8 74 1 1 13 8
                                                   73 2 0 13 8 14 15)))))
           '|lookupComplete|)) 
