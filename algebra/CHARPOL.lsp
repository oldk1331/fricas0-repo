
(/VERSIONCHECK 2) 

(DEFUN |CHARPOL;characteristicPolynomial;M2R;1| (A |v| $)
  (PROG (|j| |i| B |dimA| #1=#:G128)
    (RETURN
     (SEQ
      (LETT |dimA|
            (PROG1
                (LETT #1# (QVSIZE A)
                      . #2=(|CHARPOL;characteristicPolynomial;M2R;1|))
              (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
            . #2#)
      (EXIT
       (COND
        ((SPADCALL |dimA| (SPADCALL A (QREFELT $ 9)) (QREFELT $ 11))
         (|error| " The matrix is not square"))
        ('T
         (SEQ (LETT B (SPADCALL |dimA| |dimA| (QREFELT $ 12)) . #2#)
              (SEQ (LETT |i| 1 . #2#) G190
                   (COND ((|greater_SI| |i| |dimA|) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1 . #2#) G190
                         (COND ((|greater_SI| |j| |dimA|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL A |i| |j| (QREFELT $ 14))
                                     (QREFELT $ 15))))
                         (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL (SPADCALL B |i| |i| (QREFELT $ 14))
                                         |v| (QREFELT $ 16))
                               (QREFELT $ 15))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL B (QREFELT $ 17))))))))))) 

(DEFUN |CharacteristicPolynomialPackage| (#1=#:G135)
  (PROG ()
    (RETURN
     (PROG (#2=#:G136)
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
                    '|CharacteristicPolynomialPackage|))))))))))) 

(DEFUN |CharacteristicPolynomialPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|CharacteristicPolynomialPackage|))
      (LETT |dv$| (LIST '|CharacteristicPolynomialPackage| DV$1) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|CharacteristicPolynomialPackage|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|CharacteristicPolynomialPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (|Matrix| 6) (0 . |ncols|) (|Boolean|) (5 . ~=) (11 . |zero|)
              (|Integer|) (17 . |elt|) (24 . |setelt|) (32 . -)
              (38 . |determinant|) |CHARPOL;characteristicPolynomial;M2R;1|)
           '#(|characteristicPolynomial| 43) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(1 8 7 0 9 2 7 10 0 0 11 2 8
                                                   0 7 7 12 3 8 6 0 13 13 14 4
                                                   8 6 0 13 13 6 15 2 6 0 0 0
                                                   16 1 8 6 0 17 2 0 6 8 6
                                                   18)))))
           '|lookupComplete|)) 
