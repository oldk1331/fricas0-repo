
(SDEFUN |CHARPOL;characteristicPolynomial;M2R;1| ((A |Matrix| R) (|v| R) ($ R))
        (SPROG
         ((|j| NIL) (|i| NIL) (B (|Matrix| R)) (|dimA| (|PositiveInteger|))
          (#1=#:G105 NIL))
         (SEQ
          (LETT |dimA|
                (PROG1
                    (LETT #1# (ANROWS A)
                          . #2=(|CHARPOL;characteristicPolynomial;M2R;1|))
                  (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                . #2#)
          (EXIT
           (COND
            ((SPADCALL |dimA| (ANCOLS A) (QREFELT $ 9))
             (|error| " The matrix is not square"))
            ('T
             (SEQ (LETT B (SPADCALL |dimA| |dimA| (QREFELT $ 11)) . #2#)
                  (SEQ (LETT |i| 1 . #2#) G190
                       (COND ((|greater_SI| |i| |dimA|) (GO G191)))
                       (SEQ
                        (SEQ (LETT |j| 1 . #2#) G190
                             (COND ((|greater_SI| |j| |dimA|) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL B |i| |j|
                                         (SPADCALL A |i| |j| (QREFELT $ 13))
                                         (QREFELT $ 14))))
                             (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL B |i| |i|
                                   (SPADCALL
                                    (SPADCALL B |i| |i| (QREFELT $ 13)) |v|
                                    (QREFELT $ 15))
                                   (QREFELT $ 14))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (SPADCALL B (QREFELT $ 16)))))))))) 

(DECLAIM (NOTINLINE |CharacteristicPolynomialPackage;|)) 

(DEFUN |CharacteristicPolynomialPackage| (#1=#:G112)
  (SPROG NIL
         (PROG (#2=#:G113)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CharacteristicPolynomialPackage|)
                                               '|domainEqualList|)
                    . #3=(|CharacteristicPolynomialPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CharacteristicPolynomialPackage;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CharacteristicPolynomialPackage|)))))))))) 

(DEFUN |CharacteristicPolynomialPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|CharacteristicPolynomialPackage|))
          (LETT |dv$| (LIST '|CharacteristicPolynomialPackage| DV$1) . #1#)
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CharacteristicPolynomialPackage|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|CharacteristicPolynomialPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|NonNegativeInteger|) (0 . ~=) (|Matrix| 6) (6 . |zero|)
              (|Integer|) (12 . |elt|) (19 . |setelt!|) (27 . -)
              (33 . |determinant|) |CHARPOL;characteristicPolynomial;M2R;1|)
           '#(|characteristicPolynomial| 38) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(2 8 7 0 0 9 2 10 0 8 8 11 3
                                                   10 6 0 12 12 13 4 10 6 0 12
                                                   12 6 14 2 6 0 0 0 15 1 10 6
                                                   0 16 2 0 6 10 6 17)))))
           '|lookupComplete|)) 
