
(SDEFUN |GENUPS2;taylor;MEA;1|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 11)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 12)))
                  (EXIT (SPADCALL |f| |x| |a| (QREFELT $ 17)))))))))) 

(SDEFUN |GENUPS2;taylor;MEUsA;2|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|NonNegativeInteger|)) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 11)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 12)))
                  (EXIT (SPADCALL |f| |x| |a| |seg| (QREFELT $ 20)))))))))) 

(SDEFUN |GENUPS2;laurent;MEUsA;3|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 11)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 12)))
                  (EXIT (SPADCALL |f| |x| |a| |seg| (QREFELT $ 23)))))))))) 

(SDEFUN |GENUPS2;puiseux;MEUsFA;4|
        ((|f| |Mapping| FE (|Fraction| (|Integer|))) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Fraction| (|Integer|)))
         (|r| |Fraction| (|Integer|)) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 11)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "puiseux: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 12)))
                  (EXIT (SPADCALL |f| |x| |a| |seg| |r| (QREFELT $ 28)))))))))) 

(SDEFUN |GENUPS2;series;MEA;5|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE) ($ |Any|))
        (SPROG NIL
               (SPADCALL (CONS #'|GENUPS2;series;MEA;5!0| (VECTOR |f| $)) |eq|
                         (SPADCALL (|spadConstant| $ 34) (QREFELT $ 35))
                         (|spadConstant| $ 36) (QREFELT $ 29)))) 

(SDEFUN |GENUPS2;series;MEA;5!0| ((|r| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |r| (QREFELT $ 31)) |f|))))) 

(SDEFUN |GENUPS2;series;MEUsA;6|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG ((|ratSeg| (|UniversalSegment| (|Fraction| (|Integer|)))))
               (SEQ (LETT |ratSeg| (SPADCALL (ELT $ 38) |seg| (QREFELT $ 41)))
                    (EXIT
                     (SPADCALL
                      (CONS #'|GENUPS2;series;MEUsA;6!0| (VECTOR |f| $)) |eq|
                      |ratSeg| (|spadConstant| $ 36) (QREFELT $ 29)))))) 

(SDEFUN |GENUPS2;series;MEUsA;6!0| ((|r| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |r| (QREFELT $ 31)) |f|))))) 

(SDEFUN |GENUPS2;series;MEUsFA;7|
        ((|f| |Mapping| FE (|Fraction| (|Integer|))) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Fraction| (|Integer|)))
         (|r| |Fraction| (|Integer|)) ($ |Any|))
        (SPADCALL |f| |eq| |seg| |r| (QREFELT $ 29))) 

(SDEFUN |GENUPS2;taylor;FESEA;8|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS2;taylor;FESEA;8!0| (VECTOR $ |n| |an|)) |eq|
                (QREFELT $ 18)))) 

(SDEFUN |GENUPS2;taylor;FESEA;8!0| ((|i| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 44))
                                (SPADCALL |i| (QREFELT $ 45)) (QREFELT $ 48))
                      (QREFELT $ 50)))))) 

(SDEFUN |GENUPS2;taylor;FESEUsA;9|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|NonNegativeInteger|)) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS2;taylor;FESEUsA;9!0| (VECTOR $ |n| |an|)) |eq|
                |seg| (QREFELT $ 21)))) 

(SDEFUN |GENUPS2;taylor;FESEUsA;9!0| ((|i| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 44))
                                (SPADCALL |i| (QREFELT $ 45)) (QREFELT $ 48))
                      (QREFELT $ 50)))))) 

(SDEFUN |GENUPS2;laurent;FESEUsA;10|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS2;laurent;FESEUsA;10!0| (VECTOR $ |n| |an|))
                |eq| |seg| (QREFELT $ 24)))) 

(SDEFUN |GENUPS2;laurent;FESEUsA;10!0| ((|i| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 44))
                                (SPADCALL |i| (QREFELT $ 45)) (QREFELT $ 48))
                      (QREFELT $ 50)))))) 

(SDEFUN |GENUPS2;puiseux;FESEUsFA;11|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|r0| |UniversalSegment| (|Fraction| (|Integer|)))
         (|m| |Fraction| (|Integer|)) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS2;puiseux;FESEUsFA;11!0| (VECTOR $ |n| |an|))
                |eq| |r0| |m| (QREFELT $ 29)))) 

(SDEFUN |GENUPS2;puiseux;FESEUsFA;11!0| ((|r| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 44))
                                (SPADCALL |r| (QREFELT $ 54)) (QREFELT $ 48))
                      (QREFELT $ 50)))))) 

(SDEFUN |GENUPS2;series;FESEA;12|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE) ($ |Any|))
        (SPADCALL |an| |n| |eq| (SPADCALL (|spadConstant| $ 34) (QREFELT $ 35))
                  (|spadConstant| $ 36) (QREFELT $ 55))) 

(SDEFUN |GENUPS2;series;FESEUsA;13|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG ((|ratSeg| (|UniversalSegment| (|Fraction| (|Integer|)))))
               (SEQ (LETT |ratSeg| (SPADCALL (ELT $ 38) |seg| (QREFELT $ 41)))
                    (EXIT
                     (SPADCALL |an| |n| |eq| |ratSeg| (|spadConstant| $ 36)
                               (QREFELT $ 55)))))) 

(SDEFUN |GENUPS2;series;FESEUsFA;14|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Fraction| (|Integer|)))
         (|r| |Fraction| (|Integer|)) ($ |Any|))
        (SPADCALL |an| |n| |eq| |seg| |r| (QREFELT $ 55))) 

(DECLAIM (NOTINLINE |GenerateUnivariatePowerSeries2;|)) 

(DEFUN |GenerateUnivariatePowerSeries2| (&REST #1=#:G153)
  (SPROG NIL
         (PROG (#2=#:G154)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenerateUnivariatePowerSeries2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GenerateUnivariatePowerSeries2;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GenerateUnivariatePowerSeries2|)))))))))) 

(DEFUN |GenerateUnivariatePowerSeries2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|GenerateUnivariatePowerSeries2| DV$1 DV$2))
          (LETT $ (GETREFV 61))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             (LIST
                                                              '|FunctionSpace|
                                                              (|devaluate|
                                                               |#1|)))))))
          (|haddProp| |$ConstructorCache| '|GenerateUnivariatePowerSeries2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 51
                       (CONS (|dispatchFunction| |GENUPS2;taylor;FESEA;8|) $))
             (QSETREFV $ 52
                       (CONS (|dispatchFunction| |GENUPS2;taylor;FESEUsA;9|)
                             $))
             (QSETREFV $ 53
                       (CONS (|dispatchFunction| |GENUPS2;laurent;FESEUsA;10|)
                             $))
             (QSETREFV $ 55
                       (CONS (|dispatchFunction| |GENUPS2;puiseux;FESEUsFA;11|)
                             $))
             (QSETREFV $ 56
                       (CONS (|dispatchFunction| |GENUPS2;series;FESEA;12|) $))
             (QSETREFV $ 59
                       (CONS (|dispatchFunction| |GENUPS2;series;FESEUsA;13|)
                             $))
             (QSETREFV $ 60
                       (CONS (|dispatchFunction| |GENUPS2;series;FESEUsFA;14|)
                             $)))))
          $))) 

(MAKEPROP '|GenerateUnivariatePowerSeries2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Equation| 7) (0 . |lhs|) (|Union| 15 '"failed")
              (5 . |retractIfCan|) (10 . |rhs|) (|Any|) (|Mapping| 7 30)
              (|Symbol|) (|GenerateUnivariatePowerSeries1| 7) (15 . |taylor|)
              |GENUPS2;taylor;MEA;1|
              (|UniversalSegment| (|NonNegativeInteger|)) (22 . |taylor|)
              |GENUPS2;taylor;MEUsA;2| (|UniversalSegment| 30) (30 . |laurent|)
              |GENUPS2;laurent;MEUsA;3| (|Mapping| 7 27)
              (|UniversalSegment| 27) (|Fraction| 30) (38 . |puiseux|)
              |GENUPS2;puiseux;MEUsFA;4| (|Integer|) (47 . |numer|)
              (52 . |Zero|) (56 . |Zero|) (60 . |Zero|) (64 . |segment|)
              (69 . |One|) |GENUPS2;series;MEA;5| (73 . |coerce|)
              (|Mapping| 27 30) (|UniversalSegmentFunctions2| 30 27)
              (78 . |map|) |GENUPS2;series;MEUsA;6| |GENUPS2;series;MEUsFA;7|
              (84 . |coerce|) (89 . |coerce|) (|Boolean|) (94 . =) (100 . =)
              (|Equation| $) (106 . |eval|) (112 . |taylor|) (119 . |taylor|)
              (127 . |laurent|) (135 . |coerce|) (140 . |puiseux|)
              (149 . |series|) (156 . |One|) (160 . |One|) (164 . |series|)
              (172 . |series|))
           '#(|taylor| 181 |series| 209 |puiseux| 254 |laurent| 271) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|taylor|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)))
                                T)
                              '((|taylor|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|NonNegativeInteger|))))
                                T)
                              '((|laurent|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                T)
                              '((|puiseux|
                                 ((|Any|)
                                  (|Mapping| |#2| (|Fraction| (|Integer|)))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|series|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)))
                                T)
                              '((|series|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                T)
                              '((|series|
                                 ((|Any|)
                                  (|Mapping| |#2| (|Fraction| (|Integer|)))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|taylor|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)))
                                (|has| 7 (|FunctionSpace| 6)))
                              '((|taylor|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|NonNegativeInteger|))))
                                (|has| 7 (|FunctionSpace| 6)))
                              '((|laurent|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                (|has| 7 (|FunctionSpace| 6)))
                              '((|puiseux|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                (|has| 7 (|FunctionSpace| 6)))
                              '((|series|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)))
                                (|has| 7 (|FunctionSpace| 6)))
                              '((|series|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                (|has| 7 (|FunctionSpace| 6)))
                              '((|series|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                (|has| 7 (|FunctionSpace| 6))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 60
                                            '(1 8 7 0 9 1 7 10 0 11 1 8 7 0 12
                                              3 16 13 14 15 7 17 4 16 13 14 15
                                              7 19 20 4 16 13 14 15 7 22 23 5
                                              16 13 25 15 7 26 27 28 1 27 30 0
                                              31 0 6 0 32 0 7 0 33 0 27 0 34 1
                                              26 0 27 35 0 27 0 36 1 27 0 30 38
                                              2 40 26 39 22 41 1 7 0 15 44 1 7
                                              0 30 45 2 7 46 0 0 47 2 8 0 7 7
                                              48 2 7 0 0 49 50 3 0 13 7 15 8 51
                                              4 0 13 7 15 8 19 52 4 0 13 7 15 8
                                              22 53 1 7 0 27 54 5 0 13 7 15 8
                                              26 27 55 3 0 13 7 15 8 56 0 6 0
                                              57 0 7 0 58 4 0 13 7 15 8 22 59 5
                                              0 13 7 15 8 26 27 60 3 1 13 7 15
                                              8 51 4 1 13 7 15 8 19 52 2 0 13
                                              14 8 18 3 0 13 14 8 19 21 3 1 13
                                              7 15 8 56 5 1 13 7 15 8 26 27 60
                                              4 1 13 7 15 8 22 59 2 0 13 14 8
                                              37 4 0 13 25 8 26 27 43 3 0 13 14
                                              8 22 42 5 1 13 7 15 8 26 27 55 4
                                              0 13 25 8 26 27 29 4 1 13 7 15 8
                                              22 53 3 0 13 14 8 22 24)))))
           '|lookupComplete|)) 
