
(/VERSIONCHECK 2) 

(DEFUN |NCODIV;leftDivide;2PR;1| (|a| |b| $)
  (PROG (|q| |r| |h| #1=#:G131 |iv|)
    (RETURN
     (SEQ (LETT |q| (|spadConstant| $ 8) . #2=(|NCODIV;leftDivide;2PR;1|))
          (LETT |r| |a| . #2#)
          (LETT |iv| (SPADCALL (SPADCALL |b| (QREFELT $ 9)) (QREFELT $ 10))
                . #2#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((>= (SPADCALL |r| (QREFELT $ 12))
                        (SPADCALL |b| (QREFELT $ 12)))
                    (SPADCALL |r| (|spadConstant| $ 8) (QREFELT $ 15)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ
                (LETT |h|
                      (SPADCALL
                       (SPADCALL |iv| (SPADCALL |r| (QREFELT $ 9))
                                 (QREFELT $ 16))
                       (PROG1
                           (LETT #1#
                                 (- (SPADCALL |r| (QREFELT $ 12))
                                    (SPADCALL |b| (QREFELT $ 12)))
                                 . #2#)
                         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                          #1#))
                       (QREFELT $ 17))
                      . #2#)
                (LETT |r|
                      (SPADCALL |r| (SPADCALL |b| |h| (QREFELT $ 18))
                                (QREFELT $ 19))
                      . #2#)
                (EXIT (LETT |q| (SPADCALL |q| |h| (QREFELT $ 20)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |q| |r|)))))) 

(DEFUN |NCODIV;leftQuotient;3P;2| (|a| |b| $)
  (QCAR (SPADCALL |a| |b| (QREFELT $ 22)))) 

(DEFUN |NCODIV;leftRemainder;3P;3| (|a| |b| $)
  (QCDR (SPADCALL |a| |b| (QREFELT $ 22)))) 

(DEFUN |NCODIV;leftExactQuotient;2PU;4| (|a| |b| $)
  (PROG (|qr|)
    (RETURN
     (SEQ
      (LETT |qr| (SPADCALL |a| |b| (QREFELT $ 22))
            |NCODIV;leftExactQuotient;2PU;4|)
      (EXIT
       (COND
        ((SPADCALL (QCDR |qr|) (|spadConstant| $ 8) (QREFELT $ 25))
         (CONS 0 (QCAR |qr|)))
        ('T (CONS 1 "failed")))))))) 

(DEFUN |NCODIV;leftGcd;3P;5| (|a| |b| $)
  (PROG (|#G15| |#G14|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (|spadConstant| $ 8) (QREFELT $ 25)) |b|)
            ((SPADCALL |b| (|spadConstant| $ 8) (QREFELT $ 25)) |a|)
            (#1='T
             (SEQ
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |b| (QREFELT $ 12)) 0
                                (QREFELT $ 28)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT |#G14| |b| . #2=(|NCODIV;leftGcd;3P;5|))
                      (LETT |#G15| (SPADCALL |a| |b| (QREFELT $ 24)) . #2#)
                      (LETT |a| |#G14| . #2#)
                      (LETT |b| |#G15| . #2#))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((SPADCALL |b| (|spadConstant| $ 8) (QREFELT $ 25)) |a|)
                     (#1# |b|)))))))))) 

(DEFUN |NCODIV;leftLcm;3P;6| (|a| |b| $)
  (PROG (|v| |u| |#G21| |#G20| |#G19| |#G18| |qr| |b0|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (|spadConstant| $ 8) (QREFELT $ 25)) |b|)
            ((SPADCALL |b| (|spadConstant| $ 8) (QREFELT $ 25)) |a|)
            ('T
             (SEQ (LETT |b0| |b| . #1=(|NCODIV;leftLcm;3P;6|))
                  (LETT |u| (SPADCALL (|spadConstant| $ 31) 0 (QREFELT $ 17))
                        . #1#)
                  (LETT |v| (|spadConstant| $ 8) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |b| (QREFELT $ 9))
                                    (|spadConstant| $ 13) (QREFELT $ 32)))
                         (GO G191)))
                       (SEQ (LETT |qr| (SPADCALL |a| |b| (QREFELT $ 22)) . #1#)
                            (PROGN
                             (LETT |#G18| |b| . #1#)
                             (LETT |#G19| (QCDR |qr|) . #1#)
                             (LETT |a| |#G18| . #1#)
                             (LETT |b| |#G19| . #1#))
                            (EXIT
                             (PROGN
                              (LETT |#G20|
                                    (SPADCALL
                                     (SPADCALL |u| (QCAR |qr|) (QREFELT $ 18))
                                     |v| (QREFELT $ 20))
                                    . #1#)
                              (LETT |#G21| |u| . #1#)
                              (LETT |u| |#G20| . #1#)
                              (LETT |v| |#G21| . #1#))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |b0| |u| (QREFELT $ 18)))))))))) 

(DECLAIM (NOTINLINE |NonCommutativeOperatorDivision;|)) 

(DEFUN |NonCommutativeOperatorDivision| (&REST #1=#:G158)
  (PROG ()
    (RETURN
     (PROG (#2=#:G159)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|NonCommutativeOperatorDivision|)
                                           '|domainEqualList|)
                . #3=(|NonCommutativeOperatorDivision|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |NonCommutativeOperatorDivision;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|NonCommutativeOperatorDivision|))))))))))) 

(DEFUN |NonCommutativeOperatorDivision;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|NonCommutativeOperatorDivision|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|NonCommutativeOperatorDivision| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 34) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NonCommutativeOperatorDivision|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NonCommutativeOperatorDivision| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |leadingCoefficient|) (9 . |inv|)
              (|NonNegativeInteger|) (14 . |degree|) (19 . |Zero|) (|Boolean|)
              (23 . ~=) (29 . *) (35 . |monomial|) (41 . *) (47 . -) (53 . +)
              (|Record| (|:| |quotient| 6) (|:| |remainder| 6))
              |NCODIV;leftDivide;2PR;1| |NCODIV;leftQuotient;3P;2|
              |NCODIV;leftRemainder;3P;3| (59 . =) (|Union| 6 '"failed")
              |NCODIV;leftExactQuotient;2PU;4| (65 . >) |NCODIV;leftGcd;3P;5|
              (71 . |One|) (75 . |One|) (79 . ~=) |NCODIV;leftLcm;3P;6|)
           '#(|leftRemainder| 85 |leftQuotient| 91 |leftLcm| 97 |leftGcd| 103
              |leftExactQuotient| 109 |leftDivide| 115)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(0 6 0 8 1 6 7 0 9 1 7 0 0 10
                                                   1 6 11 0 12 0 7 0 13 2 6 14
                                                   0 0 15 2 7 0 0 0 16 2 6 0 7
                                                   11 17 2 6 0 0 0 18 2 6 0 0 0
                                                   19 2 6 0 0 0 20 2 6 14 0 0
                                                   25 2 11 14 0 0 28 0 6 0 30 0
                                                   7 0 31 2 7 14 0 0 32 2 0 6 6
                                                   6 24 2 0 6 6 6 23 2 0 6 6 6
                                                   33 2 0 6 6 6 29 2 0 26 6 6
                                                   27 2 0 21 6 6 22)))))
           '|lookupComplete|)) 
