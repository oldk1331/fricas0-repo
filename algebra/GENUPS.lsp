
(SDEFUN |GENUPS;genStream|
        ((|f| |Mapping| FE (|Integer|)) (|n| |Integer|) ($ |Stream| FE))
        (SPROG NIL
               (SPADCALL (CONS #'|GENUPS;genStream!0| (VECTOR $ |f| |n|))
                         (QREFELT $ 16)))) 

(SDEFUN |GENUPS;genStream!0| (($$ NIL))
        (PROG (|n| |f| $)
          (LETT |n| (QREFELT $$ 2))
          (LETT |f| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |n| |f|)
                      (|GENUPS;genStream| |f|
                       (SPADCALL |n| (|spadConstant| $ 11) (QREFELT $ 12)) $)
                      (QREFELT $ 14)))))) 

(SDEFUN |GENUPS;genFiniteStream|
        ((|f| |Mapping| FE (|Integer|)) (|n| |Integer|) (|m| |Integer|)
         ($ |Stream| FE))
        (COND ((> |n| |m|) (SPADCALL (QREFELT $ 17)))
              ('T (|GENUPS;genFiniteStream0| |f| |n| |m| $)))) 

(SDEFUN |GENUPS;genFiniteStream0|
        ((|f| |Mapping| FE (|Integer|)) (|n| |Integer|) (|m| |Integer|)
         ($ |Stream| FE))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS;genFiniteStream0!0| (VECTOR |f| $ |m| |n|))
                (QREFELT $ 16)))) 

(SDEFUN |GENUPS;genFiniteStream0!0| (($$ NIL))
        (PROG (|n| |m| $ |f|)
          (LETT |n| (QREFELT $$ 3))
          (LETT |m| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |n| |m| (QREFELT $ 19))
              (SPADCALL (SPADCALL |n| |f|) (SPADCALL (QREFELT $ 17))
                        (QREFELT $ 14)))
             ('T
              (SPADCALL (SPADCALL |n| |f|)
                        (|GENUPS;genFiniteStream0| |f|
                         (SPADCALL |n| (|spadConstant| $ 11) (QREFELT $ 12))
                         |m| $)
                        (QREFELT $ 14)))))))) 

(SDEFUN |GENUPS;taylor;MEA;4|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 23)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 24)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (|GENUPS;genStream| |f| 0 $)
                              (|compiledLookupCheck| '|series|
                                                     (LIST '$
                                                           (LIST '|Stream|
                                                                 (|devaluate|
                                                                  (ELT $ 7))))
                                                     (|UnivariateTaylorSeries|
                                                      (ELT $ 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariateTaylorSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|))
                                           (|AnyFunctions1|
                                            (|UnivariateTaylorSeries| (ELT $ 7)
                                                                      |x|
                                                                      |a|)))))))))))) 

(SDEFUN |GENUPS;taylor;FESEA;5|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE) ($ |Any|))
        (SPROG NIL
               (SPADCALL (CONS #'|GENUPS;taylor;FESEA;5!0| (VECTOR $ |n| |an|))
                         |eq| (QREFELT $ 27)))) 

(SDEFUN |GENUPS;taylor;FESEA;5!0| ((|i| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                (SPADCALL |i| (QREFELT $ 30)) (QREFELT $ 32))
                      (QREFELT $ 34)))))) 

(SDEFUN |GENUPS;taylor;MEUsA;6|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|NonNegativeInteger|)) ($ |Any|))
        (SPROG
         ((|uts| (|UnivariateTaylorSeries| FE |x| |a|))
          (|n0| #1=(|NonNegativeInteger|)) (|n1| #2=(|NonNegativeInteger|))
          (|#G21| #1#) (|#G20| #2#) (|a| (FE)) (|x| (|Symbol|))
          (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 23)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            (#3='T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 24)))
                  (EXIT
                   (COND
                    ((SPADCALL |seg| (QREFELT $ 37))
                     (SEQ (LETT |n0| (SPADCALL |seg| (QREFELT $ 39)))
                          (LETT |n1| (SPADCALL |seg| (QREFELT $ 40)))
                          (COND
                           ((< |n1| |n0|)
                            (PROGN
                             (LETT |#G20| |n1|)
                             (LETT |#G21| |n0|)
                             (LETT |n0| |#G20|)
                             (LETT |n1| |#G21|))))
                          (LETT |uts|
                                (SPADCALL
                                 (|GENUPS;genFiniteStream| |f| |n0| |n1| $)
                                 (|compiledLookupCheck| '|series|
                                                        (LIST '$
                                                              (LIST '|Stream|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))
                                                        (|UnivariateTaylorSeries|
                                                         (ELT $ 7) |x| |a|))))
                          (LETT |uts|
                                (SPADCALL |uts|
                                          (SPADCALL (|spadConstant| $ 9) |n0|
                                                    (|compiledLookupCheck|
                                                     '|monomial|
                                                     (LIST '$
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     (|UnivariateTaylorSeries|
                                                      (ELT $ 7) |x| |a|)))
                                          (|compiledLookupCheck| '*
                                                                 (LIST '$ '$
                                                                       '$)
                                                                 (|UnivariateTaylorSeries|
                                                                  (ELT $ 7) |x|
                                                                  |a|))))
                          (EXIT
                           (SPADCALL |uts|
                                     (|compiledLookupCheck| '|coerce|
                                                            (LIST (LIST '|Any|)
                                                                  (LIST
                                                                   '|UnivariateTaylorSeries|
                                                                   (|devaluate|
                                                                    (ELT $ 7))
                                                                   |x| |a|))
                                                            (|AnyFunctions1|
                                                             (|UnivariateTaylorSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))))))
                    (#3#
                     (SEQ (LETT |n0| (SPADCALL |seg| (QREFELT $ 39)))
                          (LETT |uts|
                                (SPADCALL (|GENUPS;genStream| |f| |n0| $)
                                          (|compiledLookupCheck| '|series|
                                                                 (LIST '$
                                                                       (LIST
                                                                        '|Stream|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              7))))
                                                                 (|UnivariateTaylorSeries|
                                                                  (ELT $ 7) |x|
                                                                  |a|))))
                          (LETT |uts|
                                (SPADCALL |uts|
                                          (SPADCALL (|spadConstant| $ 9) |n0|
                                                    (|compiledLookupCheck|
                                                     '|monomial|
                                                     (LIST '$
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     (|UnivariateTaylorSeries|
                                                      (ELT $ 7) |x| |a|)))
                                          (|compiledLookupCheck| '*
                                                                 (LIST '$ '$
                                                                       '$)
                                                                 (|UnivariateTaylorSeries|
                                                                  (ELT $ 7) |x|
                                                                  |a|))))
                          (EXIT
                           (SPADCALL |uts|
                                     (|compiledLookupCheck| '|coerce|
                                                            (LIST (LIST '|Any|)
                                                                  (LIST
                                                                   '|UnivariateTaylorSeries|
                                                                   (|devaluate|
                                                                    (ELT $ 7))
                                                                   |x| |a|))
                                                            (|AnyFunctions1|
                                                             (|UnivariateTaylorSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))))))))))))))) 

(SDEFUN |GENUPS;taylor;FESEUsA;7|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|NonNegativeInteger|)) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS;taylor;FESEUsA;7!0| (VECTOR $ |n| |an|)) |eq|
                |seg| (QREFELT $ 41)))) 

(SDEFUN |GENUPS;taylor;FESEUsA;7!0| ((|i| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                (SPADCALL |i| (QREFELT $ 30)) (QREFELT $ 32))
                      (QREFELT $ 34)))))) 

(SDEFUN |GENUPS;laurent;MEUsA;8|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG
         ((|uts| (|UnivariateTaylorSeries| FE |x| |a|)) (|n0| #1=(|Integer|))
          (|n1| #2=(|Integer|)) (|#G31| #1#) (|#G30| #2#) (|a| (FE))
          (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 23)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            (#3='T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 24)))
                  (EXIT
                   (COND
                    ((SPADCALL |seg| (QREFELT $ 44))
                     (SEQ (LETT |n0| (SPADCALL |seg| (QREFELT $ 45)))
                          (LETT |n1| (SPADCALL |seg| (QREFELT $ 46)))
                          (COND
                           ((< |n1| |n0|)
                            (PROGN
                             (LETT |#G30| |n1|)
                             (LETT |#G31| |n0|)
                             (LETT |n0| |#G30|)
                             (LETT |n1| |#G31|))))
                          (LETT |uts|
                                (SPADCALL
                                 (|GENUPS;genFiniteStream| |f| |n0| |n1| $)
                                 (|compiledLookupCheck| '|series|
                                                        (LIST '$
                                                              (LIST '|Stream|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))
                                                        (|UnivariateTaylorSeries|
                                                         (ELT $ 7) |x| |a|))))
                          (EXIT
                           (SPADCALL
                            (SPADCALL |n0| |uts|
                                      (|compiledLookupCheck| '|laurent|
                                                             (LIST '$
                                                                   (LIST
                                                                    '|Integer|)
                                                                   (LIST
                                                                    '|UnivariateTaylorSeries|
                                                                    (|devaluate|
                                                                     (ELT $ 7))
                                                                    |x| |a|))
                                                             (|UnivariateLaurentSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))
                            (|compiledLookupCheck| '|coerce|
                                                   (LIST (LIST '|Any|)
                                                         (LIST
                                                          '|UnivariateLaurentSeries|
                                                          (|devaluate|
                                                           (ELT $ 7))
                                                          |x| |a|))
                                                   (|AnyFunctions1|
                                                    (|UnivariateLaurentSeries|
                                                     (ELT $ 7) |x| |a|)))))))
                    (#3#
                     (SEQ (LETT |n0| (SPADCALL |seg| (QREFELT $ 45)))
                          (LETT |uts|
                                (SPADCALL (|GENUPS;genStream| |f| |n0| $)
                                          (|compiledLookupCheck| '|series|
                                                                 (LIST '$
                                                                       (LIST
                                                                        '|Stream|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              7))))
                                                                 (|UnivariateTaylorSeries|
                                                                  (ELT $ 7) |x|
                                                                  |a|))))
                          (EXIT
                           (SPADCALL
                            (SPADCALL |n0| |uts|
                                      (|compiledLookupCheck| '|laurent|
                                                             (LIST '$
                                                                   (LIST
                                                                    '|Integer|)
                                                                   (LIST
                                                                    '|UnivariateTaylorSeries|
                                                                    (|devaluate|
                                                                     (ELT $ 7))
                                                                    |x| |a|))
                                                             (|UnivariateLaurentSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))
                            (|compiledLookupCheck| '|coerce|
                                                   (LIST (LIST '|Any|)
                                                         (LIST
                                                          '|UnivariateLaurentSeries|
                                                          (|devaluate|
                                                           (ELT $ 7))
                                                          |x| |a|))
                                                   (|AnyFunctions1|
                                                    (|UnivariateLaurentSeries|
                                                     (ELT $ 7) |x|
                                                     |a|)))))))))))))))) 

(SDEFUN |GENUPS;laurent;FESEUsA;9|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS;laurent;FESEUsA;9!0| (VECTOR $ |n| |an|)) |eq|
                |seg| (QREFELT $ 47)))) 

(SDEFUN |GENUPS;laurent;FESEUsA;9!0| ((|i| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                (SPADCALL |i| (QREFELT $ 30)) (QREFELT $ 32))
                      (QREFELT $ 34)))))) 

(SDEFUN |GENUPS;modifyFcn|
        ((|f| |Mapping| FE (|Fraction| (|Integer|))) (|n0| |Integer|)
         (|nn| |Integer|) (|q| |Integer|) (|m| |Integer|) ($ FE))
        (COND
         ((ZEROP (REM (- |m| |n0|) |nn|))
          (SPADCALL (SPADCALL |m| |q| (QREFELT $ 50)) |f|))
         ('T (|spadConstant| $ 51)))) 

(SDEFUN |GENUPS;puiseux;MEUsFA;11|
        ((|f| |Mapping| FE (|Fraction| (|Integer|))) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Fraction| (|Integer|)))
         (|r| |Fraction| (|Integer|)) ($ |Any|))
        (SPROG
         ((|uls| (|UnivariateLaurentSeries| FE |x| |a|)) (|ulsUnion| (|Any|))
          (|nn| #1=(|Integer|)) (|n0| #1#) (|q| (|Integer|))
          (|q2| #2=(|Integer|)) (|p2| #3=(|Integer|)) (|q0| #2#) (|p0| #3#)
          (|r0| #4=(|Fraction| (|Integer|))) (|n1| #1#) (|q1| #2#) (|p1| #3#)
          (|r1| #5=(|Fraction| (|Integer|))) (|#G47| #4#) (|#G46| #5#)
          (|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 23)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "puiseux: left hand side must be a variable"))
            (#6='T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 24)))
                  (COND
                   ((NULL (SPADCALL |r| (QREFELT $ 52)))
                    (EXIT
                     (|error| "puiseux: last argument must be positive"))))
                  (EXIT
                   (COND
                    ((SPADCALL |seg| (QREFELT $ 54))
                     (SEQ (LETT |r0| (SPADCALL |seg| (QREFELT $ 55)))
                          (LETT |r1| (SPADCALL |seg| (QREFELT $ 56)))
                          (COND
                           ((SPADCALL |r1| |r0| (QREFELT $ 57))
                            (PROGN
                             (LETT |#G46| |r1|)
                             (LETT |#G47| |r0|)
                             (LETT |r0| |#G46|)
                             (LETT |r1| |#G47|))))
                          (LETT |p0| (SPADCALL |r0| (QREFELT $ 58)))
                          (LETT |q0| (SPADCALL |r0| (QREFELT $ 59)))
                          (LETT |p1| (SPADCALL |r1| (QREFELT $ 58)))
                          (LETT |q1| (SPADCALL |r1| (QREFELT $ 59)))
                          (LETT |p2| (SPADCALL |r| (QREFELT $ 58)))
                          (LETT |q2| (SPADCALL |r| (QREFELT $ 59)))
                          (LETT |q|
                                (SPADCALL (SPADCALL |q0| |q1| (QREFELT $ 60))
                                          |q2| (QREFELT $ 60)))
                          (LETT |n0| (* |p0| (QUOTIENT2 |q| |q0|)))
                          (LETT |n1| (* |p1| (QUOTIENT2 |q| |q1|)))
                          (LETT |nn| (* |p2| (QUOTIENT2 |q| |q2|)))
                          (LETT |ulsUnion|
                                (SPADCALL
                                 (CONS #'|GENUPS;puiseux;MEUsFA;11!0|
                                       (VECTOR $ |q| |nn| |n0| |f|))
                                 |eq| (SPADCALL |n0| |n1| (QREFELT $ 61))
                                 (QREFELT $ 47)))
                          (LETT |uls|
                                (SPADCALL |ulsUnion|
                                          (|compiledLookupCheck| '|retract|
                                                                 (LIST
                                                                  (LIST
                                                                   '|UnivariateLaurentSeries|
                                                                   (|devaluate|
                                                                    (ELT $ 7))
                                                                   |x| |a|)
                                                                  (LIST
                                                                   '|Any|))
                                                                 (|AnyFunctions1|
                                                                  (|UnivariateLaurentSeries|
                                                                   (ELT $ 7)
                                                                   |x| |a|)))))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (SPADCALL 1 |q| (QREFELT $ 50)) |uls|
                                      (|compiledLookupCheck| '|puiseux|
                                                             (LIST '$
                                                                   (LIST
                                                                    '|Fraction|
                                                                    (LIST
                                                                     '|Integer|))
                                                                   (LIST
                                                                    '|UnivariateLaurentSeries|
                                                                    (|devaluate|
                                                                     (ELT $ 7))
                                                                    |x| |a|))
                                                             (|UnivariatePuiseuxSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))
                            (|compiledLookupCheck| '|coerce|
                                                   (LIST (LIST '|Any|)
                                                         (LIST
                                                          '|UnivariatePuiseuxSeries|
                                                          (|devaluate|
                                                           (ELT $ 7))
                                                          |x| |a|))
                                                   (|AnyFunctions1|
                                                    (|UnivariatePuiseuxSeries|
                                                     (ELT $ 7) |x| |a|)))))))
                    (#6#
                     (SEQ
                      (LETT |p0|
                            (SPADCALL
                             (LETT |r0| (SPADCALL |seg| (QREFELT $ 55)))
                             (QREFELT $ 58)))
                      (LETT |q0| (SPADCALL |r0| (QREFELT $ 59)))
                      (LETT |p2| (SPADCALL |r| (QREFELT $ 58)))
                      (LETT |q2| (SPADCALL |r| (QREFELT $ 59)))
                      (LETT |q| (SPADCALL |q0| |q2| (QREFELT $ 60)))
                      (LETT |n0| (* |p0| (QUOTIENT2 |q| |q0|)))
                      (LETT |nn| (* |p2| (QUOTIENT2 |q| |q2|)))
                      (LETT |ulsUnion|
                            (SPADCALL
                             (CONS #'|GENUPS;puiseux;MEUsFA;11!1|
                                   (VECTOR $ |q| |nn| |n0| |f|))
                             |eq| (SPADCALL |n0| (QREFELT $ 62))
                             (QREFELT $ 47)))
                      (LETT |uls|
                            (SPADCALL |ulsUnion|
                                      (|compiledLookupCheck| '|retract|
                                                             (LIST
                                                              (LIST
                                                               '|UnivariateLaurentSeries|
                                                               (|devaluate|
                                                                (ELT $ 7))
                                                               |x| |a|)
                                                              (LIST '|Any|))
                                                             (|AnyFunctions1|
                                                              (|UnivariateLaurentSeries|
                                                               (ELT $ 7) |x|
                                                               |a|)))))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 |q| (QREFELT $ 50)) |uls|
                                  (|compiledLookupCheck| '|puiseux|
                                                         (LIST '$
                                                               (LIST
                                                                '|Fraction|
                                                                (LIST
                                                                 '|Integer|))
                                                               (LIST
                                                                '|UnivariateLaurentSeries|
                                                                (|devaluate|
                                                                 (ELT $ 7))
                                                                |x| |a|))
                                                         (|UnivariatePuiseuxSeries|
                                                          (ELT $ 7) |x| |a|)))
                        (|compiledLookupCheck| '|coerce|
                                               (LIST (LIST '|Any|)
                                                     (LIST
                                                      '|UnivariatePuiseuxSeries|
                                                      (|devaluate| (ELT $ 7))
                                                      |x| |a|))
                                               (|AnyFunctions1|
                                                (|UnivariatePuiseuxSeries|
                                                 (ELT $ 7) |x|
                                                 |a|)))))))))))))))) 

(SDEFUN |GENUPS;puiseux;MEUsFA;11!1| ((|i| NIL) ($$ NIL))
        (PROG (|f| |n0| |nn| |q| $)
          (LETT |f| (QREFELT $$ 4))
          (LETT |n0| (QREFELT $$ 3))
          (LETT |nn| (QREFELT $$ 2))
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GENUPS;modifyFcn| |f| |n0| |nn| |q| |i| $))))) 

(SDEFUN |GENUPS;puiseux;MEUsFA;11!0| ((|i| NIL) ($$ NIL))
        (PROG (|f| |n0| |nn| |q| $)
          (LETT |f| (QREFELT $$ 4))
          (LETT |n0| (QREFELT $$ 3))
          (LETT |nn| (QREFELT $$ 2))
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GENUPS;modifyFcn| |f| |n0| |nn| |q| |i| $))))) 

(SDEFUN |GENUPS;puiseux;FESEUsFA;12|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|r0| |UniversalSegment| (|Fraction| (|Integer|)))
         (|m| |Fraction| (|Integer|)) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS;puiseux;FESEUsFA;12!0| (VECTOR $ |n| |an|))
                |eq| |r0| |m| (QREFELT $ 64)))) 

(SDEFUN |GENUPS;puiseux;FESEUsFA;12!0| ((|r| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                (SPADCALL |r| (QREFELT $ 65)) (QREFELT $ 32))
                      (QREFELT $ 34)))))) 

(SDEFUN |GENUPS;series;MEA;13|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE) ($ |Any|))
        (SPROG NIL
               (SPADCALL (CONS #'|GENUPS;series;MEA;13!0| (VECTOR |f| $)) |eq|
                         (SPADCALL (|spadConstant| $ 68) (QREFELT $ 69))
                         (|spadConstant| $ 70) (QREFELT $ 64)))) 

(SDEFUN |GENUPS;series;MEA;13!0| ((|r| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |r| (QREFELT $ 58)) |f|))))) 

(SDEFUN |GENUPS;series;FESEA;14|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE) ($ |Any|))
        (SPADCALL |an| |n| |eq| (SPADCALL (|spadConstant| $ 68) (QREFELT $ 69))
                  (|spadConstant| $ 70) (QREFELT $ 66))) 

(SDEFUN |GENUPS;series;MEUsA;15|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG ((|ratSeg| (|UniversalSegment| (|Fraction| (|Integer|)))))
               (SEQ (LETT |ratSeg| (SPADCALL (ELT $ 73) |seg| (QREFELT $ 76)))
                    (EXIT
                     (SPADCALL
                      (CONS #'|GENUPS;series;MEUsA;15!0| (VECTOR |f| $)) |eq|
                      |ratSeg| (|spadConstant| $ 70) (QREFELT $ 64)))))) 

(SDEFUN |GENUPS;series;MEUsA;15!0| ((|r| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |r| (QREFELT $ 58)) |f|))))) 

(SDEFUN |GENUPS;series;FESEUsA;16|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG ((|ratSeg| (|UniversalSegment| (|Fraction| (|Integer|)))))
               (SEQ (LETT |ratSeg| (SPADCALL (ELT $ 73) |seg| (QREFELT $ 76)))
                    (EXIT
                     (SPADCALL |an| |n| |eq| |ratSeg| (|spadConstant| $ 70)
                               (QREFELT $ 66)))))) 

(SDEFUN |GENUPS;series;MEUsFA;17|
        ((|f| |Mapping| FE (|Fraction| (|Integer|))) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Fraction| (|Integer|)))
         (|r| |Fraction| (|Integer|)) ($ |Any|))
        (SPADCALL |f| |eq| |seg| |r| (QREFELT $ 64))) 

(SDEFUN |GENUPS;series;FESEUsFA;18|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Fraction| (|Integer|)))
         (|r| |Fraction| (|Integer|)) ($ |Any|))
        (SPADCALL |an| |n| |eq| |seg| |r| (QREFELT $ 66))) 

(DECLAIM (NOTINLINE |GenerateUnivariatePowerSeries;|)) 

(DEFUN |GenerateUnivariatePowerSeries| (&REST #1=#:G184)
  (SPROG NIL
         (PROG (#2=#:G185)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenerateUnivariatePowerSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GenerateUnivariatePowerSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GenerateUnivariatePowerSeries|)))))))))) 

(DEFUN |GenerateUnivariatePowerSeries;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|GenerateUnivariatePowerSeries| DV$1 DV$2))
          (LETT $ (GETREFV 81))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GenerateUnivariatePowerSeries|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GenerateUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|Integer|) (8 . |One|) (12 . +) (|Stream| 7)
              (18 . |concat|) (|Mapping| $) (24 . |delay|) (29 . |empty|)
              (|Boolean|) (33 . =) (|Equation| 7) (39 . |lhs|)
              (|Union| 28 '"failed") (44 . |retractIfCan|) (49 . |rhs|) (|Any|)
              (|Mapping| 7 10) |GENUPS;taylor;MEA;4| (|Symbol|) (54 . |coerce|)
              (59 . |coerce|) (64 . =) (70 . =) (|Equation| $) (76 . |eval|)
              |GENUPS;taylor;FESEA;5| (|UniversalSegment| 38) (82 . |hasHi|)
              (|NonNegativeInteger|) (87 . |low|) (92 . |high|)
              |GENUPS;taylor;MEUsA;6| |GENUPS;taylor;FESEUsA;7|
              (|UniversalSegment| 10) (97 . |hasHi|) (102 . |low|)
              (107 . |high|) |GENUPS;laurent;MEUsA;8|
              |GENUPS;laurent;FESEUsA;9| (|Fraction| 10) (112 . /)
              (118 . |Zero|) (122 . |positive?|) (|UniversalSegment| 49)
              (127 . |hasHi|) (132 . |low|) (137 . |high|) (142 . <)
              (148 . |numer|) (153 . |denom|) (158 . |lcm|) (164 . |segment|)
              (170 . |segment|) (|Mapping| 7 49) |GENUPS;puiseux;MEUsFA;11|
              (175 . |coerce|) |GENUPS;puiseux;FESEUsFA;12| (180 . |Zero|)
              (184 . |Zero|) (188 . |segment|) (193 . |One|)
              |GENUPS;series;MEA;13| |GENUPS;series;FESEA;14| (197 . |coerce|)
              (|Mapping| 49 10) (|UniversalSegmentFunctions2| 10 49)
              (202 . |map|) |GENUPS;series;MEUsA;15| |GENUPS;series;FESEUsA;16|
              |GENUPS;series;MEUsFA;17| |GENUPS;series;FESEUsFA;18|)
           '#(|taylor| 208 |series| 236 |puiseux| 281 |laurent| 298) 'NIL
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
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)))
                                T)
                              '((|taylor|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|NonNegativeInteger|))))
                                T)
                              '((|taylor|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|NonNegativeInteger|))))
                                T)
                              '((|laurent|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                T)
                              '((|laurent|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                T)
                              '((|puiseux|
                                 ((|Any|)
                                  (|Mapping| |#2| (|Fraction| (|Integer|)))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|puiseux|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|series|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)))
                                T)
                              '((|series|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)))
                                T)
                              '((|series|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                T)
                              '((|series|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                T)
                              '((|series|
                                 ((|Any|)
                                  (|Mapping| |#2| (|Fraction| (|Integer|)))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|series|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 80
                                            '(0 6 0 8 0 7 0 9 0 10 0 11 2 10 0
                                              0 0 12 2 13 0 7 0 14 1 13 0 15 16
                                              0 13 0 17 2 10 18 0 0 19 1 20 7 0
                                              21 1 7 22 0 23 1 20 7 0 24 1 7 0
                                              28 29 1 7 0 10 30 2 7 18 0 0 31 2
                                              20 0 7 7 32 2 7 0 0 33 34 1 36 18
                                              0 37 1 36 38 0 39 1 36 38 0 40 1
                                              43 18 0 44 1 43 10 0 45 1 43 10 0
                                              46 2 49 0 10 10 50 0 7 0 51 1 49
                                              18 0 52 1 53 18 0 54 1 53 49 0 55
                                              1 53 49 0 56 2 49 18 0 0 57 1 49
                                              10 0 58 1 49 10 0 59 2 10 0 0 0
                                              60 2 43 0 10 10 61 1 43 0 10 62 1
                                              7 0 49 65 0 6 0 67 0 49 0 68 1 53
                                              0 49 69 0 49 0 70 1 49 0 10 73 2
                                              75 53 74 43 76 2 0 25 26 20 27 3
                                              0 25 26 20 36 41 3 0 25 7 28 20
                                              35 4 0 25 7 28 20 36 42 3 0 25 7
                                              28 20 72 2 0 25 26 20 71 4 0 25 7
                                              28 20 43 78 3 0 25 26 20 43 77 5
                                              0 25 7 28 20 53 49 80 4 0 25 63
                                              20 53 49 79 4 0 25 63 20 53 49 64
                                              5 0 25 7 28 20 53 49 66 3 0 25 26
                                              20 43 47 4 0 25 7 28 20 43
                                              48)))))
           '|lookupComplete|)) 
