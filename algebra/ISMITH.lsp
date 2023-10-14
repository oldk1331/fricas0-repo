
(SDEFUN |ISMITH;smith;MMM;1|
        ((|m| |Matrix| (|Integer|))
         (|full| |Mapping| (|Matrix| (|Integer|)) (|Matrix| (|Integer|)))
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((|i| NIL) (|nn2| #1=(|Integer|)) (|res| (|Matrix| (|Integer|)))
          (|count| #1#) (|nn| (|NonNegativeInteger|))
          (|k| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
          (|m3| (|Matrix| (|Integer|))) (|m2| (|Matrix| (|Integer|)))
          (|m1| (|Matrix| (|Integer|))))
         (SEQ
          (LETT |m1| (SPADCALL |m| (QREFELT $ 7)) . #2=(|ISMITH;smith;MMM;1|))
          (LETT |m2| (SPADCALL |m1| (QREFELT $ 9)) . #2#)
          (LETT |m3| (SPADCALL |m2| |full|) . #2#)
          (LETT |j| (ANROWS |m|) . #2#) (LETT |k| (ANCOLS |m|) . #2#)
          (LETT |nn| (MIN |j| |k|) . #2#)
          (LETT |count| (- |j| (ANROWS |m2|)) . #2#)
          (LETT |res| (SPADCALL |j| |k| (QREFELT $ 11)) . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |count|) (GO G191)))
               (SEQ (EXIT (QSETAREF2O |res| |i| |i| 1 1 1)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |nn2| (- |nn| |count|) . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |nn2|) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF2O |res| (+ |i| |count|) (+ |i| |count|)
                             (QAREF2O |m3| |i| |i| 1 1) 1 1)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |ISMITH;smith;2M;2|
        ((|m| |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPADCALL |m| (ELT $ 15) (QREFELT $ 13))) 

(DECLAIM (NOTINLINE |IntegerSmithNormalForm;|)) 

(DEFUN |IntegerSmithNormalForm| ()
  (SPROG NIL
         (PROG (#1=#:G112)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|IntegerSmithNormalForm|)
                    . #2=(|IntegerSmithNormalForm|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|IntegerSmithNormalForm|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|IntegerSmithNormalForm;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|IntegerSmithNormalForm|)))))))))) 

(DEFUN |IntegerSmithNormalForm;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IntegerSmithNormalForm|)
                . #1=(|IntegerSmithNormalForm|))
          (LETT $ (GETREFV 17) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IntegerSmithNormalForm| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|IntegerSmithNormalForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Matrix| (|Integer|)) (0 . |copy|)
              (|UnitGaussianElimination|) (5 . |pre_smith|)
              (|NonNegativeInteger|) (10 . |zero|) (|Mapping| 6 6)
              |ISMITH;smith;MMM;1|
              (|SmithNormalForm| (|Integer|) (|Vector| (|Integer|))
                                 (|Vector| (|Integer|)) 6)
              (16 . |smith|) |ISMITH;smith;2M;2|)
           '#(|smith| 21) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(1 6 0 0 7 1 8 6 6 9 2 6 0 10
                                                   10 11 1 14 6 6 15 2 0 6 6 12
                                                   13 1 0 6 6 16)))))
           '|lookupComplete|)) 

(MAKEPROP '|IntegerSmithNormalForm| 'NILADIC T) 
