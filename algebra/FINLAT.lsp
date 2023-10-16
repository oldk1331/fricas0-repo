
(PUT '|FINLAT;finiteLattice;Nni$;1| '|SPADreplace| '(XLAM (|index|) |index|)) 

(SDEFUN |FINLAT;finiteLattice;Nni$;1| ((|index| |NonNegativeInteger|) ($ $))
        |index|) 

(SDEFUN |FINLAT;finiteLattice;S$;2| ((|obj| S) ($ $))
        (SPADCALL (QREFELT $ 7) |obj| (QREFELT $ 12))) 

(SDEFUN |FINLAT;/\\;3$;3| ((|a| $) (|b| $) ($ $))
        (SPADCALL (QREFELT $ 7) |a| |b| (QREFELT $ 14))) 

(SDEFUN |FINLAT;\\/;3$;4| ((|a| $) (|b| $) ($ $))
        (SPADCALL (QREFELT $ 7) |a| |b| (QREFELT $ 16))) 

(PUT '|FINLAT;hash;$Si;5| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |FINLAT;hash;$Si;5| ((|s| $) ($ |SingleInteger|)) 0) 

(SDEFUN |FINLAT;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 21))) 

(SDEFUN |FINLAT;~=;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 21)))) 

(SDEFUN |FINLAT;coerce;$Of;8| ((|s| $) ($ |OutputForm|))
        (SPROG ((|obj| (S)) (|index| (|NonNegativeInteger|)))
               (SEQ (LETT |index| |s| . #1=(|FINLAT;coerce;$Of;8|))
                    (LETT |obj| (SPADCALL (QREFELT $ 7) |index| (QREFELT $ 23))
                          . #1#)
                    (EXIT (SPADCALL |obj| (QREFELT $ 25)))))) 

(DECLAIM (NOTINLINE |FiniteLattice;|)) 

(DEFUN |FiniteLattice| (&REST #1=#:G113)
  (SPROG NIL
         (PROG (#2=#:G114)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteLattice|)
                                               '|domainEqualList|)
                    . #3=(|FiniteLattice|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteLattice;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FiniteLattice|)))))))))) 

(DEFUN |FiniteLattice;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteLattice|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FiniteLattice| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 29) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteLattice| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|NonNegativeInteger|))
          $))) 

(MAKEPROP '|FiniteLattice| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) |FINLAT;finiteLattice;Nni$;1|
              (|FiniteBiCPO| 6) (0 . |objectToIndex|)
              |FINLAT;finiteLattice;S$;2| (6 . |meet|) |FINLAT;/\\;3$;3|
              (13 . |join|) |FINLAT;\\/;3$;4| (|SingleInteger|)
              |FINLAT;hash;$Si;5| (|Boolean|) |FINLAT;=;2$B;6|
              |FINLAT;~=;2$B;7| (20 . |indexToObject|) (|OutputForm|)
              (26 . |coerce|) |FINLAT;coerce;$Of;8| (|String|) (|HashState|))
           '#(~= 31 |latex| 37 |hashUpdate!| 42 |hash| 48 |finiteLattice| 53
              |coerce| 63 |\\/| 68 = 74 |/\\| 80)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS '#(NIL NIL NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|Lattice|) (|MeetSemilattice|) (|JoinSemilattice|)
                           (|SetCategory|) (|BasicType|) (|CoercibleTo| 24))
                        (|makeByteWordVec2| 28
                                            '(2 11 9 0 6 12 3 11 9 0 9 9 14 3
                                              11 9 0 9 9 16 2 11 6 0 9 23 1 6
                                              24 0 25 2 0 20 0 0 22 1 0 27 0 1
                                              2 0 28 28 0 1 1 0 18 0 19 1 0 0 9
                                              10 1 0 0 6 13 1 0 24 0 26 2 0 0 0
                                              0 17 2 0 20 0 0 21 2 0 0 0 0
                                              15)))))
           '|lookupComplete|)) 
