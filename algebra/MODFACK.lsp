
(DECLAIM (NOTINLINE |ModularFactorizationK;|)) 

(DEFUN |ModularFactorizationK| (#1=#:G112)
  (SPROG NIL
         (PROG (#2=#:G113)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ModularFactorizationK|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ModularFactorizationK;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ModularFactorizationK|)))))))))) 

(DEFUN |ModularFactorizationK;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|ModularFactorizationK| DV$1))
          (LETT % (GETREFV 14))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ModularFactorizationK| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|ModularFactorizationK| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|ModularFactorizationGeneral| 8
                                             (|PrimitiveTwoDimensionalArray| 6)
                                             9
                                             (|Record| (|:| |mod_data| 9)
                                                       (|:| |p_mod| 8))
                                             (|ModularFactorizationTools3| 6))
              (|local| |#1|) (|List| 8) (|PrimitiveArray| 6)
              (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|)))
              (|Boolean|) (|Mapping| 7)
              (|Record| (|:| |poly| 8) (|:| |degree| (|NonNegativeInteger|))
                        (|:| |separate_factors| 11))
              (|List| 12))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|mfactor|
                                 ((|List| (|PrimitiveArray| |#1|))
                                  (|PrimitiveArray| |#1|)
                                  #1=(|Record| (|:| |i_mod| (|Integer|))
                                               (|:| |deg| (|Integer|)))))
                                T)
                              '((|ddfact|
                                 ((|List|
                                   (|Record|
                                    (|:| |poly| (|PrimitiveArray| |#1|))
                                    (|:| |degree| (|NonNegativeInteger|))
                                    (|:| |separate_factors|
                                         (|Mapping|
                                          (|List| (|PrimitiveArray| |#1|))))))
                                  (|PrimitiveArray| |#1|) #1#))
                                T)
                              '((|irreducible?|
                                 ((|Boolean|) (|PrimitiveArray| |#1|) #1#))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
