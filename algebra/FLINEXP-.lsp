
(/VERSIONCHECK 2) 

(DEFUN |FLINEXP-;reducedSystem;MM;1| (|m| $)
  (SPADCALL (SPADCALL |m| (QREFELT $ 10)) (QREFELT $ 12))) 

(DEFUN |FLINEXP-;reducedSystem;MVR;2| (|m| |v| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |m| |v| (QREFELT $ 16))
            |FLINEXP-;reducedSystem;MVR;2|)
      (EXIT (SPADCALL (QCAR |rec|) (QCDR |rec|) (QREFELT $ 18))))))) 

(DECLAIM (NOTINLINE |FullyLinearlyExplicitRingOver&;|)) 

(DEFUN |FullyLinearlyExplicitRingOver&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FullyLinearlyExplicitRingOver&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FullyLinearlyExplicitRingOver&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 20) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND ((|domainEqual| |#2| (|Integer|)))
            ((|testBitVector| |pv$| 1)
             (PROGN
              (QSETREFV $ 13
                        (CONS
                         (|dispatchFunction| |FLINEXP-;reducedSystem;MM;1|) $))
              (QSETREFV $ 19
                        (CONS
                         (|dispatchFunction| |FLINEXP-;reducedSystem;MVR;2|)
                         $)))))
      $)))) 

(MAKEPROP '|FullyLinearlyExplicitRingOver&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Matrix| 7) (|Matrix| $) (0 . |reducedSystem|)
              (|Matrix| (|Integer|)) (5 . |reducedSystem|)
              (10 . |reducedSystem|)
              (|Record| (|:| |mat| 8) (|:| |vec| (|Vector| 7))) (|Vector| $)
              (15 . |reducedSystem|)
              (|Record| (|:| |mat| 11) (|:| |vec| (|Vector| (|Integer|))))
              (21 . |reducedSystem|) (27 . |reducedSystem|))
           '#(|reducedSystem| 33) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(1 6 8 9 10 1 7 11 9 12 1 0
                                                   11 9 13 2 6 14 9 15 16 2 7
                                                   17 9 15 18 2 0 17 9 15 19 2
                                                   0 17 9 15 19 1 0 11 9
                                                   13)))))
           '|lookupComplete|)) 
