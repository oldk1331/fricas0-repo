
(SDEFUN |TUPLE;coerce;Pa$;1| ((|x| |PrimitiveArray| S) ($ $))
        (CONS (QVSIZE |x|) |x|)) 

(PUT '|TUPLE;coerce;$Pa;2| '|SPADreplace| 'QCDR) 

(SDEFUN |TUPLE;coerce;$Pa;2| ((|x| $) ($ |PrimitiveArray| S)) (QCDR |x|)) 

(PUT '|TUPLE;length;$Nni;3| '|SPADreplace| 'QCAR) 

(SDEFUN |TUPLE;length;$Nni;3| ((|x| $) ($ |NonNegativeInteger|)) (QCAR |x|)) 

(SDEFUN |TUPLE;select;$NniS;4| ((|x| $) (|n| |NonNegativeInteger|) ($ S))
        (COND ((>= |n| (QCAR |x|)) (|error| "Index out of bounds"))
              ('T (QAREF1 (QCDR |x|) |n|)))) 

(SDEFUN |TUPLE;=;2$B;5| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((EQL (QCAR |x|) (QCAR |y|))
          (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 15)))
         ('T NIL))) 

(SDEFUN |TUPLE;coerce;$Of;6| ((|x| $) ($ |OutputForm|))
        (SPROG ((#1=#:G120 NIL) (|i| NIL) (#2=#:G119 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|TUPLE;coerce;$Of;6|))
                  (SEQ (LETT |i| 0 . #3#)
                       (LETT #1# (SPADCALL (QCDR |x|) (QREFELT $ 18)) . #3#)
                       G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (QAREF1 (QCDR |x|) |i|)
                                          (QREFELT $ 20))
                                #2#)
                               . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 22))))) 

(DECLAIM (NOTINLINE |Tuple;|)) 

(DEFUN |Tuple| (#1=#:G121)
  (SPROG NIL
         (PROG (#2=#:G122)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Tuple|)
                                               '|domainEqualList|)
                    . #3=(|Tuple|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Tuple;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Tuple|)))))))))) 

(DEFUN |Tuple;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Tuple|))
          (LETT |dv$| (LIST '|Tuple| DV$1) . #1#)
          (LETT $ (GETREFV 27) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|Tuple| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |len| (|NonNegativeInteger|))
                              (|:| |elts| (|PrimitiveArray| |#1|))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 16 (CONS (|dispatchFunction| |TUPLE;=;2$B;5|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (QSETREFV $ 23
                      (CONS (|dispatchFunction| |TUPLE;coerce;$Of;6|) $))))
          $))) 

(MAKEPROP '|Tuple| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|PrimitiveArray| 6) |TUPLE;coerce;Pa$;1| |TUPLE;coerce;$Pa;2|
              (|NonNegativeInteger|) |TUPLE;length;$Nni;3|
              |TUPLE;select;$NniS;4| (|Boolean|) (0 . =) (6 . =) (|Integer|)
              (12 . |maxIndex|) (|OutputForm|) (17 . |coerce|) (|List| $)
              (22 . |paren|) (27 . |coerce|) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 32 |select| 38 |length| 44 |latex| 49 |hashUpdate!| 54 |hash|
              60 |coerce| 65 = 80)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(1 0 1 2))
                 (CONS '#(|SetCategory&| NIL |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| (|PrimitiveArray| 6))
                           (|BasicType|) (|CoercibleTo| 19))
                        (|makeByteWordVec2| 26
                                            '(2 8 14 0 0 15 2 0 14 0 0 16 1 8
                                              17 0 18 1 6 19 0 20 1 19 0 21 22
                                              1 0 19 0 23 2 1 14 0 0 1 2 0 6 0
                                              11 13 1 0 11 0 12 1 1 25 0 1 2 1
                                              24 24 0 1 1 1 26 0 1 1 2 19 0 23
                                              1 0 0 8 9 1 0 8 0 10 2 1 14 0 0
                                              16)))))
           '|lookupComplete|)) 
