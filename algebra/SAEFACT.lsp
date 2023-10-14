
(/VERSIONCHECK 2) 

(DEFUN |SAEFACT;factor;UPAF;1| (|q| $) (SPADCALL |q| (ELT $ 11) (QREFELT $ 15))) 

(DECLAIM (NOTINLINE |SimpleAlgebraicExtensionAlgFactor;|)) 

(DEFUN |SimpleAlgebraicExtensionAlgFactor| (&REST #1=#:G105)
  (PROG ()
    (RETURN
     (PROG (#2=#:G106)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SimpleAlgebraicExtensionAlgFactor|)
                                           '|domainEqualList|)
                . #3=(|SimpleAlgebraicExtensionAlgFactor|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |SimpleAlgebraicExtensionAlgFactor;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SimpleAlgebraicExtensionAlgFactor|))))))))))) 

(DEFUN |SimpleAlgebraicExtensionAlgFactor;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SimpleAlgebraicExtensionAlgFactor|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|SimpleAlgebraicExtensionAlgFactor| DV$1 DV$2 DV$3)
            . #1#)
      (LETT $ (GETREFV 17) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SimpleAlgebraicExtensionAlgFactor|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SimpleAlgebraicExtensionAlgFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Factored| 6) (|RationalFactorize| 6)
              (0 . |factor|) (|Factored| 8) (|Mapping| 9 6)
              (|InnerAlgFactor| (|Fraction| (|Integer|)) 6 7 8) (5 . |factor|)
              |SAEFACT;factor;UPAF;1|)
           '#(|factor| 11) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(1 10 9 6 11 2 14 12 8 13 15
                                                   1 0 12 8 16)))))
           '|lookupComplete|)) 
