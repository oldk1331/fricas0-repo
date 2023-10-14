
(/VERSIONCHECK 2) 

(DEFUN |DISTRO2;mapall;MDD;1| (|f| |x| $)
  (PROG (|bcum2| |fcum2| |cum2| |mom2|)
    (RETURN
     (SEQ
      (LETT |mom2| (SPADCALL |f| (SPADCALL |x| (QREFELT $ 10)) (QREFELT $ 14))
            . #1=(|DISTRO2;mapall;MDD;1|))
      (LETT |cum2| (SPADCALL |f| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 14))
            . #1#)
      (LETT |fcum2| (SPADCALL |f| (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 14))
            . #1#)
      (LETT |bcum2| (SPADCALL |f| (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 14))
            . #1#)
      (EXIT (SPADCALL |mom2| |cum2| |fcum2| |bcum2| (QREFELT $ 19))))))) 

(DEFUN |DISTRO2;R1_to_R2_coercion;R1R2;2| (|x| $) (SPADCALL |x| (QREFELT $ 21))) 

(DEFUN |DISTRO2;R1_to_R2_coercion;R1R2;3| (|x| $) (SPADCALL |x| (QREFELT $ 23))) 

(PUT '|DISTRO2;R1_to_R2_coercion;R1R2;4| '|SPADreplace|
     '(XLAM (|x|) (|error| "unimplemented"))) 

(DEFUN |DISTRO2;R1_to_R2_coercion;R1R2;4| (|x| $) (|error| "unimplemented")) 

(DEFUN |DISTRO2;coerce;DD;5| (|x| $) (SPADCALL (ELT $ 22) |x| (QREFELT $ 20))) 

(DECLAIM (NOTINLINE |DistributionFunctions2;|)) 

(DEFUN |DistributionFunctions2| (&REST #1=#:G114)
  (PROG ()
    (RETURN
     (PROG (#2=#:G115)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|DistributionFunctions2|)
                                           '|domainEqualList|)
                . #3=(|DistributionFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |DistributionFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|DistributionFunctions2|))))))))))) 

(DEFUN |DistributionFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DistributionFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|DistributionFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 25) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DistributionFunctions2|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasSignature| |#2|
                        (LIST '|coerce|
                              (LIST (|devaluate| |#2|) (|devaluate| |#1|))))
        (QSETREFV $ 22
                  (CONS (|dispatchFunction| |DISTRO2;R1_to_R2_coercion;R1R2;2|)
                        $)))
       ((|HasSignature| |#1|
                        (LIST '|coerce|
                              (LIST (|devaluate| |#2|) (|devaluate| |#1|))))
        (QSETREFV $ 22
                  (CONS (|dispatchFunction| |DISTRO2;R1_to_R2_coercion;R1R2;3|)
                        $)))
       ('T
        (QSETREFV $ 22
                  (CONS (|dispatchFunction| |DISTRO2;R1_to_R2_coercion;R1R2;4|)
                        $))))
      $)))) 

(MAKEPROP '|DistributionFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Sequence| 6) (|Distribution| 6) (0 . |moments|) (|Sequence| 7)
              (|Mapping| 7 6) (|SequenceFunctions2| 6 7) (5 . |map|)
              (11 . |classicalCumulants|) (16 . |freeCumulants|)
              (21 . |booleanCumulants|) (|Distribution| 7) (26 . |construct|)
              |DISTRO2;mapall;MDD;1| (34 . |coerce|) (39 . |R1_to_R2_coercion|)
              (44 . |coerce|) |DISTRO2;coerce;DD;5|)
           '#(|mapall| 49 |coerce| 55 |R1_to_R2_coercion| 60) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 24
                                                 '(1 9 8 0 10 2 13 11 12 8 14 1
                                                   9 8 0 15 1 9 8 0 16 1 9 8 0
                                                   17 4 18 0 11 11 11 11 19 1 7
                                                   0 6 21 1 0 7 6 22 1 6 7 0 23
                                                   2 0 18 12 9 20 1 0 18 9 24 1
                                                   0 7 6 22)))))
           '|lookupComplete|)) 
