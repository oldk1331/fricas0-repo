
(/VERSIONCHECK 2) 

(DEFUN |ODETOOLS;wronskianMatrix;LM;1| (|l| $)
  (SPADCALL |l| (LENGTH |l|) (QREFELT $ 13))) 

(DEFUN |ODETOOLS;wronskianMatrix;LNniM;2| (|l| |q| $)
  (PROG (|v| #1=#:G133 |i| |m|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |l| (QREFELT $ 16))
            . #2=(|ODETOOLS;wronskianMatrix;LNniM;2|))
      (LETT |m| (SPADCALL |q| (QVSIZE |v|) (QREFELT $ 17)) . #2#)
      (SEQ (LETT |i| 1 . #2#) (LETT #1# (SPADCALL |m| (QREFELT $ 19)) . #2#)
           G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (SPADCALL |m| |i| |v| (QREFELT $ 20))
                (EXIT
                 (LETT |v|
                       (SPADCALL
                        (CONS #'|ODETOOLS;wronskianMatrix;LNniM;2!0|
                              (VECTOR $ (QREFELT $ 9)))
                        |v| (QREFELT $ 23))
                       . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DEFUN |ODETOOLS;wronskianMatrix;LNniM;2!0| (|f1| $$)
  (PROG (|diff| $)
    (LETT |diff| (QREFELT $$ 1) . #1=(|ODETOOLS;wronskianMatrix;LNniM;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |diff| |f1| (QREFELT $ 21)))))) 

(DEFUN |ODETOOLS;variationOfParameters;LODOFLU;3| (|op| |g| |b| $)
  (PROG (|v| |n|)
    (RETURN
     (SEQ
      (COND ((NULL |b|) (CONS 1 "failed"))
            ('T
             (SEQ
              (LETT |v|
                    (MAKEARR1
                     (LETT |n| (SPADCALL |op| (QREFELT $ 24))
                           . #1=(|ODETOOLS;variationOfParameters;LODOFLU;3|))
                     (|spadConstant| $ 25))
                    . #1#)
              (QSETAREF1O |v| (QVSIZE |v|)
                          (SPADCALL |g| (SPADCALL |op| (QREFELT $ 26))
                                    (QREFELT $ 27))
                          1)
              (EXIT
               (SPADCALL (SPADCALL |b| |n| (QREFELT $ 13)) |v|
                         (QREFELT $ 30)))))))))) 

(DEFUN |ODETOOLS;particularSolution;LODOFLMU;4| (|op| |g| |b| |integration| $)
  (PROG (|ans| #1=#:G154 |f| |i| |s| |sol|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |g| (QREFELT $ 33)) (CONS 0 (|spadConstant| $ 25)))
            (#2='T
             (SEQ
              (LETT |sol| (SPADCALL |op| |g| |b| (QREFELT $ 31))
                    . #3=(|ODETOOLS;particularSolution;LODOFLMU;4|))
              (EXIT
               (COND ((QEQCAR |sol| 1) (CONS 1 "failed"))
                     (#2#
                      (SEQ (LETT |ans| (|spadConstant| $ 25) . #3#)
                           (SEQ
                            (LETT |i|
                                  (SPADCALL (LETT |s| (QCDR |sol|) . #3#)
                                            (QREFELT $ 34))
                                  . #3#)
                            (LETT |f| NIL . #3#) (LETT #1# |b| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL
                                               (SPADCALL (QAREF1O |s| |i| 1)
                                                         |integration|)
                                               |f| (QREFELT $ 35))
                                              (QREFELT $ 36))
                                    . #3#)))
                            (LETT #1#
                                  (PROG1 (CDR #1#) (LETT |i| (+ |i| 1) . #3#))
                                  . #3#)
                            (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS 0 |ans|))))))))))))) 

(DEFUN |ODETools| (&REST #1=#:G155)
  (PROG ()
    (RETURN
     (PROG (#2=#:G156)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ODETools|)
                                           '|domainEqualList|)
                . #3=(|ODETools|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ODETools;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|ODETools|))))))))))) 

(DEFUN |ODETools;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ODETools|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ODETools| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 39) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ODETools| (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
      $)))) 

(MAKEPROP '|ODETools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . D)
              '|diff| (|Matrix| 6) (|List| 6) (|NonNegativeInteger|)
              |ODETOOLS;wronskianMatrix;LNniM;2|
              |ODETOOLS;wronskianMatrix;LM;1| (|Vector| 6) (4 . |vector|)
              (9 . |zero|) (|Integer|) (15 . |maxRowIndex|) (20 . |setRow!|)
              (27 . |elt|) (|Mapping| 6 6) (33 . |map!|) (39 . |degree|)
              (44 . |Zero|) (48 . |leadingCoefficient|) (53 . /)
              (|Union| 15 '"failed") (|LinearSystemMatrixPackage| 6 15 15 10)
              (59 . |particularSolution|)
              |ODETOOLS;variationOfParameters;LODOFLU;3| (|Boolean|)
              (65 . |zero?|) (70 . |minIndex|) (75 . *) (81 . +)
              (|Union| 6 '"failed") |ODETOOLS;particularSolution;LODOFLMU;4|)
           '#(|wronskianMatrix| 87 |variationOfParameters| 98
              |particularSolution| 105)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 38
                                                 '(0 7 0 8 1 15 0 11 16 2 10 0
                                                   12 12 17 1 10 18 0 19 3 10 0
                                                   0 18 15 20 2 7 6 0 6 21 2 15
                                                   0 22 0 23 1 7 12 0 24 0 6 0
                                                   25 1 7 6 0 26 2 6 0 0 0 27 2
                                                   29 28 10 15 30 1 6 32 0 33 1
                                                   15 18 0 34 2 6 0 0 0 35 2 6
                                                   0 0 0 36 2 0 10 11 12 13 1 0
                                                   10 11 14 3 0 28 7 6 11 31 4
                                                   0 37 7 6 11 22 38)))))
           '|lookupComplete|)) 
