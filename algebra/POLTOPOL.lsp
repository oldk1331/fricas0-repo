
(/VERSIONCHECK 2) 

(DEFUN |POLTOPOL;variable1| (|xx| $)
  (PROG (#1=#:G104)
    (RETURN
     (PROG2 (LETT #1# (SPADCALL |xx| (QREFELT $ 11)) |POLTOPOL;variable1|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (|OrderedVariableList| (QREFELT $ 6))
                      #1#))))) 

(DEFUN |POLTOPOL;pToHdmp;PHdmp;2| (|pol| $)
  (SPADCALL (CONS (|function| |POLTOPOL;variable1|) $) |pol| (QREFELT $ 16))) 

(DEFUN |POLTOPOL;hdmpToP;HdmpP;3| (|hdpol| $)
  (SPADCALL (ELT $ 18) |hdpol| (QREFELT $ 21))) 

(DEFUN |POLTOPOL;dmpToP;DmpP;4| (|dpol| $)
  (SPADCALL (ELT $ 18) |dpol| (QREFELT $ 25))) 

(DEFUN |POLTOPOL;pToDmp;PDmp;5| (|pol| $)
  (SPADCALL (CONS (|function| |POLTOPOL;variable1|) $) |pol| (QREFELT $ 28))) 

(DEFUN |POLTOPOL;dmpToHdmp;DmpHdmp;6| (|dpol| $)
  (COND
   ((SPADCALL |dpol| (|spadConstant| $ 31) (QREFELT $ 33))
    (|spadConstant| $ 34))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |dpol| (QREFELT $ 35))
               (SPADCALL
                (SPADCALL (SPADCALL |dpol| (QREFELT $ 37)) (QREFELT $ 39))
                (QREFELT $ 41))
               (QREFELT $ 42))
     (SPADCALL (SPADCALL |dpol| (QREFELT $ 43)) (QREFELT $ 44))
     (QREFELT $ 45))))) 

(DEFUN |POLTOPOL;hdmpToDmp;HdmpDmp;7| (|hdpol| $)
  (PROG (|dd|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |hdpol| (|spadConstant| $ 34) (QREFELT $ 46))
        (|spadConstant| $ 31))
       ('T
        (SEQ
         (LETT |dd|
               (SPADCALL
                (SPADCALL (SPADCALL |hdpol| (QREFELT $ 47)) (QREFELT $ 48))
                (QREFELT $ 49))
               |POLTOPOL;hdmpToDmp;HdmpDmp;7|)
         (EXIT
          (SPADCALL
           (SPADCALL (SPADCALL |hdpol| (QREFELT $ 50)) |dd| (QREFELT $ 51))
           (SPADCALL (SPADCALL |hdpol| (QREFELT $ 52)) (QREFELT $ 53))
           (QREFELT $ 54)))))))))) 

(DECLAIM (NOTINLINE |PolToPol;|)) 

(DEFUN |PolToPol| (&REST #1=#:G118)
  (PROG ()
    (RETURN
     (PROG (#2=#:G119)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PolToPol|)
                                           '|domainEqualList|)
                . #3=(|PolToPol|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PolToPol;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|PolToPol|))))))))))) 

(DEFUN |PolToPol;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PolToPol|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PolToPol| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 55) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PolToPol| (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PolToPol| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| $ '"failed") (|Symbol|) (|OrderedVariableList| 6)
              (0 . |variable|)
              (|HomogeneousDistributedMultivariatePolynomial| 6 7)
              (|Mapping| 10 9) (|Polynomial| 7)
              (|MPolyCatFunctions3| 9 10 (|IndexedExponents| 9) 40 7 14 12)
              (5 . |map|) |POLTOPOL;pToHdmp;PHdmp;2| (11 . |convert|)
              (|Mapping| 9 10)
              (|MPolyCatFunctions3| 10 9 40 (|IndexedExponents| 9) 7 12 14)
              (16 . |map|) |POLTOPOL;hdmpToP;HdmpP;3|
              (|DistributedMultivariatePolynomial| 6 7)
              (|MPolyCatFunctions3| 10 9 36 (|IndexedExponents| 9) 7 23 14)
              (22 . |map|) |POLTOPOL;dmpToP;DmpP;4|
              (|MPolyCatFunctions3| 9 10 (|IndexedExponents| 9) 36 7 14 23)
              (28 . |map|) |POLTOPOL;pToDmp;PDmp;5| (34 . |Zero|) (38 . |Zero|)
              (|Boolean|) (42 . =) (48 . |Zero|) (52 . |leadingCoefficient|)
              (|DirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6)))
                               (|NonNegativeInteger|))
              (57 . |degree|) (|Vector| (|NonNegativeInteger|)) (62 . |coerce|)
              (|HomogeneousDirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6)))
                                          (|NonNegativeInteger|))
              (67 . |directProduct|) (72 . |monomial|) (78 . |reductum|)
              |POLTOPOL;dmpToHdmp;DmpHdmp;6| (83 . +) (89 . =) (95 . |degree|)
              (100 . |coerce|) (105 . |directProduct|)
              (110 . |leadingCoefficient|) (115 . |monomial|)
              (121 . |reductum|) |POLTOPOL;hdmpToDmp;HdmpDmp;7| (126 . +))
           '#(|pToHdmp| 132 |pToDmp| 137 |hdmpToP| 142 |hdmpToDmp| 147 |dmpToP|
              152 |dmpToHdmp| 157)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 54
                                                 '(1 10 8 9 11 2 15 12 13 14 16
                                                   1 10 9 0 18 2 20 14 19 12 21
                                                   2 24 14 19 23 25 2 27 23 13
                                                   14 28 0 7 0 30 0 23 0 31 2
                                                   23 32 0 0 33 0 12 0 34 1 23
                                                   7 0 35 1 23 36 0 37 1 36 38
                                                   0 39 1 40 0 38 41 2 12 0 7
                                                   40 42 1 23 0 0 43 2 12 0 0 0
                                                   45 2 12 32 0 0 46 1 12 40 0
                                                   47 1 40 38 0 48 1 36 0 38 49
                                                   1 12 7 0 50 2 23 0 7 36 51 1
                                                   12 0 0 52 2 23 0 0 0 54 1 0
                                                   12 14 17 1 0 23 14 29 1 0 14
                                                   12 22 1 0 23 12 53 1 0 14 23
                                                   26 1 0 12 23 44)))))
           '|lookupComplete|)) 
