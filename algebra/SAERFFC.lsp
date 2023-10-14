
(SDEFUN |SAERFFC;factor;UPAF;1| ((|q| UPA) ($ |Factored| UPA))
        (SPADCALL |q| (ELT $ 11) (QREFELT $ 15))) 

(DECLAIM (NOTINLINE |SAERationalFunctionAlgFactor;|)) 

(DEFUN |SAERationalFunctionAlgFactor| (&REST #1=#:G106)
  (SPROG NIL
         (PROG (#2=#:G107)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SAERationalFunctionAlgFactor|)
                                               '|domainEqualList|)
                    . #3=(|SAERationalFunctionAlgFactor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SAERationalFunctionAlgFactor;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SAERationalFunctionAlgFactor|)))))))))) 

(DEFUN |SAERationalFunctionAlgFactor;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SAERationalFunctionAlgFactor|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|SAERationalFunctionAlgFactor| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 17) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SAERationalFunctionAlgFactor|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SAERationalFunctionAlgFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Factored| 6) (|RationalFunctionFactor| 6)
              (0 . |factor|) (|Factored| 8) (|Mapping| 9 6)
              (|InnerAlgFactor| (|Fraction| (|Polynomial| (|Integer|))) 6 7 8)
              (5 . |factor|) |SAERFFC;factor;UPAF;1|)
           '#(|factor| 11) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(1 10 9 6 11 2 14 12 8 13 15
                                                   1 0 12 8 16)))))
           '|lookupComplete|)) 
