
(/VERSIONCHECK 2) 

(DEFUN |IRRF2F;toEF| (|i| $) (SPADCALL (ELT $ 9) |i| (QREFELT $ 14))) 

(DEFUN |IRRF2F;expand;IrL;2| (|i| $)
  (SPADCALL (|IRRF2F;toEF| |i| $) (QREFELT $ 17))) 

(DEFUN |IRRF2F;complexExpand;IrE;3| (|i| $)
  (SPADCALL (|IRRF2F;toEF| |i| $) (QREFELT $ 19))) 

(DEFUN |IRRF2F;split;2Ir;4| (|i| $)
  (SPADCALL (ELT $ 21) (SPADCALL (|IRRF2F;toEF| |i| $) (QREFELT $ 22))
            (QREFELT $ 25))) 

(DEFUN |IRRF2F;complexIntegrate;FSE;5| (|f| |x| $)
  (SPADCALL (SPADCALL |f| |x| (QREFELT $ 29)) (QREFELT $ 20))) 

(DEFUN |IRRF2F;integrate;FSU;6| (|f| |x| $)
  (CONS 0 (SPADCALL |f| |x| (QREFELT $ 30)))) 

(DEFUN |IRRF2F;integrate;FSU;7| (|f| |x| $)
  (PROG (|l| #1=#:G146 |g| #2=#:G145)
    (RETURN
     (SEQ
      (LETT |l|
            (PROGN
             (LETT #2# NIL . #3=(|IRRF2F;integrate;FSU;7|))
             (SEQ (LETT |g| NIL . #3#)
                  (LETT #1#
                        (SPADCALL (SPADCALL |f| |x| (QREFELT $ 29))
                                  (QREFELT $ 18))
                        . #3#)
                  G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL (SPADCALL |g| (QREFELT $ 34)) |x|
                                     (QREFELT $ 36))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((NULL (CDR |l|)) (CONS 0 (|SPADfirst| |l|)))
             ('T (CONS 1 |l|)))))))) 

(DEFUN |IntegrationResultRFToFunction| (#1=#:G147)
  (PROG ()
    (RETURN
     (PROG (#2=#:G148)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|IntegrationResultRFToFunction|)
                                           '|domainEqualList|)
                . #3=(|IntegrationResultRFToFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|IntegrationResultRFToFunction;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|IntegrationResultRFToFunction|))))))))))) 

(DEFUN |IntegrationResultRFToFunction;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegrationResultRFToFunction|))
      (LETT |dv$| (LIST '|IntegrationResultRFToFunction| DV$1) . #1#)
      (LETT $ (GETREFV 37) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|IntegrationResultRFToFunction|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 30
                   (CONS (|dispatchFunction| |IRRF2F;complexIntegrate;FSE;5|)
                         $))
         (COND
          ((|HasSignature| |#1| (LIST '|imaginary| (LIST (|devaluate| |#1|))))
           (QSETREFV $ 32
                     (CONS (|dispatchFunction| |IRRF2F;integrate;FSU;6|) $)))
          ('T
           (QSETREFV $ 32
                     (CONS (|dispatchFunction| |IRRF2F;integrate;FSU;7|)
                           $)))))))
      $)))) 

(MAKEPROP '|IntegrationResultRFToFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Fraction| (|Polynomial| 6)) (|Expression| 6) (0 . |coerce|)
              (|IntegrationResult| 8) (|Mapping| 8 7) (|IntegrationResult| 7)
              (|IntegrationResultFunctions2| 7 8) (5 . |map|) (|List| 8)
              (|IntegrationResultToFunction| 6 8) (11 . |expand|)
              |IRRF2F;expand;IrL;2| (16 . |complexExpand|)
              |IRRF2F;complexExpand;IrE;3| (21 . |retract|) (26 . |split|)
              (|Mapping| 7 8) (|IntegrationResultFunctions2| 8 7) (31 . |map|)
              |IRRF2F;split;2Ir;4| (|Symbol|) (|RationalFunctionIntegration| 6)
              (37 . |internalIntegrate|) (43 . |complexIntegrate|)
              (|Union| 8 15) (49 . |integrate|)
              (|TrigonometricManipulations| 6 8) (55 . |real|)
              (|IntegrationTools| 6 8) (60 . |mkPrim|))
           '#(|split| 66 |integrate| 71 |expand| 77 |complexIntegrate| 82
              |complexExpand| 88)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 36
                                                 '(1 8 0 7 9 2 13 10 11 12 14 1
                                                   16 15 10 17 1 16 8 10 19 1 8
                                                   7 0 21 1 16 10 10 22 2 24 12
                                                   23 10 25 2 28 12 7 27 29 2 0
                                                   8 7 27 30 2 0 31 7 27 32 1
                                                   33 8 8 34 2 35 8 8 27 36 1 0
                                                   12 12 26 2 1 31 7 27 32 1 0
                                                   15 12 18 2 1 8 7 27 30 1 0 8
                                                   12 20)))))
           '|lookupComplete|)) 
