
(SDEFUN |SYMANA;ansatz;Jvf;1|
        (($ |JetVectorField| JB1 (|JetBundleExpression| JB1)))
        (SPROG
         ((|res| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
          (#1=#:G133 NIL) (|f| (|JetBundleExpression| JB1)) (|s| (|Symbol|))
          (#2=#:G139 NIL) (|i| NIL) (#3=#:G129 NIL) (#4=#:G138 NIL))
         (SEQ (LETT |res| (|spadConstant| $ 35) . #5=(|SYMANA;ansatz;Jvf;1|))
              (SEQ (LETT |i| 1 . #5#) (LETT #4# (QREFELT $ 11) . #5#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (LETT |s| (SPADCALL (QREFELT $ 22) |i| (QREFELT $ 38))
                          . #5#)
                    (LETT |f| (SPADCALL |s| (QREFELT $ 33) 0 (QREFELT $ 40))
                          . #5#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |f|
                                               (SPADCALL
                                                (PROG1 (LETT #3# |i| . #5#)
                                                  (|check_subtype| (> #3# 0)
                                                                   '(|PositiveInteger|)
                                                                   #3#))
                                                (QREFELT $ 41))
                                               (QREFELT $ 42))
                                     (QREFELT $ 43))
                           . #5#)))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1 . #5#) (LETT #2# (QREFELT $ 13) . #5#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |s|
                          (SPADCALL (QREFELT $ 22) (+ (QREFELT $ 11) |i|)
                                    (QREFELT $ 38))
                          . #5#)
                    (LETT |f| (SPADCALL |s| (QREFELT $ 33) 0 (QREFELT $ 40))
                          . #5#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |f|
                                               (SPADCALL
                                                (PROG1 (LETT #1# |i| . #5#)
                                                  (|check_subtype| (> #1# 0)
                                                                   '(|PositiveInteger|)
                                                                   #1#))
                                                (QREFELT $ 44))
                                               (QREFELT $ 42))
                                     (QREFELT $ 43))
                           . #5#)))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SYMANA;transform;JbeJbe;2|
        ((|f| |JetBundleExpression| JB1)
         ($ |JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|)))
        (SPROG
         ((|g| (|Expression| (|Integer|)))
          (|SubL| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (JV (|List| (|Expression| (|Integer|))))
          (|lower| (|List| (|PositiveInteger|))) (#1=#:G175 NIL)
          (|id| #2=(|Integer|)) (#3=#:G190 NIL) (|d| NIL)
          (|up| (|PositiveInteger|)) (#4=#:G173 NIL) (#5=#:G171 NIL)
          (|diff| (|List| (|JetBundleExpression| JB1)))
          (|rarg| (|List| (|JetBundleExpression| JB1)))
          (|arg| (|List| (|JetBundleExpression| JB1))) (|i| NIL) (|num| #2#)
          (|pos| (|Integer|)) (|fname| (|Symbol|)) (#6=#:G162 NIL)
          (#7=#:G152 NIL) (#8=#:G148 NIL) (|ind| #2#) (|typ| (|Symbol|))
          (#9=#:G142 NIL) (#10=#:G188 NIL) (|Ke| NIL) (#11=#:G189 NIL)
          (|Op| NIL) (|LOps| (|List| (|BasicOperator|))) (#12=#:G187 NIL)
          (#13=#:G186 NIL)
          (|LKernels| (|List| (|Kernel| (|JetBundleExpression| JB1)))))
         (SEQ (LETT JV NIL . #14=(|SYMANA;transform;JbeJbe;2|))
              (LETT |SubL| NIL . #14#)
              (LETT |LKernels| (SPADCALL |f| (QREFELT $ 47)) . #14#)
              (LETT |LOps|
                    (PROGN
                     (LETT #13# NIL . #14#)
                     (SEQ (LETT |Ke| NIL . #14#) (LETT #12# |LKernels| . #14#)
                          G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |Ke| (CAR #12#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS (SPADCALL |Ke| (QREFELT $ 50)) #13#)
                                  . #14#)))
                          (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #14#)
              (SEQ (LETT |Op| NIL . #14#) (LETT #11# |LOps| . #14#)
                   (LETT |Ke| NIL . #14#) (LETT #10# |LKernels| . #14#) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |Ke| (CAR #10#) . #14#) NIL)
                         (ATOM #11#) (PROGN (LETT |Op| (CAR #11#) . #14#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |Op| '|%jet| (QREFELT $ 51))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #9#
                                        (SPADCALL |Op| '|%jet| (QREFELT $ 53))
                                        . #14#)
                                  (QCDR #9#)
                                (|check_union| (QEQCAR #9# 0) (|None|) #9#))
                              . #14#)
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Deriv|)
                           (|error|
                            "function contains illegal jet variables in transform"))
                          ('T
                           (SEQ
                            (LETT |ind|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |Ke| (QREFELT $ 55))
                                             (QREFELT $ 56))
                                   (QREFELT $ 57))
                                  . #14#)
                            (LETT JV
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL
                                     (PROG1 (LETT #8# |ind| . #14#)
                                       (|check_subtype| (> #8# 0)
                                                        '(|PositiveInteger|)
                                                        #8#))
                                     (QREFELT $ 59))
                                    (QREFELT $ 61))
                                   JV)
                                  . #14#)
                            (EXIT
                             (COND
                              ((SPADCALL |ind| (QREFELT $ 11) (QREFELT $ 62))
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1
                                              (LETT #7#
                                                    (- |ind| (QREFELT $ 11))
                                                    . #14#)
                                            (|check_subtype| (> #7# 0)
                                                             '(|PositiveInteger|)
                                                             #7#))
                                          (QREFELT $ 15))
                                         (QREFELT $ 63))
                                        (QREFELT $ 64)))
                                      |SubL|)
                                     . #14#))
                              ('T
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1 (LETT #6# |ind| . #14#)
                                            (|check_subtype| (> #6# 0)
                                                             '(|PositiveInteger|)
                                                             #6#))
                                          (QREFELT $ 14))
                                         (QREFELT $ 63))
                                        (QREFELT $ 64)))
                                      |SubL|)
                                     . #14#))))))))))
                      ('T
                       (SEQ
                        (LETT |fname| (SPADCALL |Op| (QREFELT $ 65)) . #14#)
                        (LETT |pos|
                              (SPADCALL |fname| (QREFELT $ 22) (QREFELT $ 66))
                              . #14#)
                        (EXIT
                         (COND
                          ((>= |pos| (SPADCALL (QREFELT $ 22) (QREFELT $ 67)))
                           (SEQ
                            (LETT |arg| (SPADCALL |Ke| (QREFELT $ 55)) . #14#)
                            (EXIT
                             (COND
                              ((SPADCALL (LENGTH |arg|) 3 (QREFELT $ 68))
                               (SEQ (LETT |arg| (CDR |arg|) . #14#)
                                    (LETT |num|
                                          (SPADCALL (|SPADfirst| |arg|)
                                                    (QREFELT $ 57))
                                          . #14#)
                                    (LETT |arg| (CDR (CDR |arg|)) . #14#)
                                    (LETT |rarg| NIL . #14#)
                                    (SEQ (LETT |i| 1 . #14#) G190
                                         (COND
                                          ((|greater_SI| |i| |num|) (GO G191)))
                                         (SEQ
                                          (LETT |rarg|
                                                (CONS (|SPADfirst| |arg|)
                                                      |rarg|)
                                                . #14#)
                                          (EXIT
                                           (LETT |arg| (CDR |arg|) . #14#)))
                                         (LETT |i| (|inc_SI| |i|) . #14#)
                                         (GO G190) G191 (EXIT NIL))
                                    (LETT |rarg| (NREVERSE |rarg|) . #14#)
                                    (LETT |diff| |arg| . #14#)
                                    (EXIT
                                     (COND
                                      ((NULL |diff|)
                                       (SEQ
                                        (LETT JV
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL
                                                 (PROG1 (LETT #5# |pos| . #14#)
                                                   (|check_subtype| (> #5# 0)
                                                                    '(|PositiveInteger|)
                                                                    #5#))
                                                 (QREFELT $ 70))
                                                (QREFELT $ 61))
                                               JV)
                                              . #14#)
                                        (EXIT
                                         (LETT |SubL|
                                               (CONS
                                                (|SPADfirst|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |Ke|
                                                             (QREFELT $ 72))
                                                   (QREFELT $ 73))
                                                  (QREFELT $ 64)))
                                                |SubL|)
                                               . #14#))))
                                      ('T
                                       (SEQ
                                        (LETT |up|
                                              (PROG1 (LETT #4# |pos| . #14#)
                                                (|check_subtype| (> #4# 0)
                                                                 '(|PositiveInteger|)
                                                                 #4#))
                                              . #14#)
                                        (LETT |lower| NIL . #14#)
                                        (SEQ (LETT |d| NIL . #14#)
                                             (LETT #3# |diff| . #14#) G190
                                             (COND
                                              ((OR (ATOM #3#)
                                                   (PROGN
                                                    (LETT |d| (CAR #3#) . #14#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |id|
                                                    (SPADCALL |d|
                                                              (QREFELT $ 57))
                                                    . #14#)
                                              (EXIT
                                               (LETT |lower|
                                                     (CONS
                                                      (PROG1
                                                          (LETT #1# |id|
                                                                . #14#)
                                                        (|check_subtype|
                                                         (> #1# 0)
                                                         '(|PositiveInteger|)
                                                         #1#))
                                                      |lower|)
                                                     . #14#)))
                                             (LETT #3# (CDR #3#) . #14#)
                                             (GO G190) G191 (EXIT NIL))
                                        (LETT |lower| (NREVERSE |lower|)
                                              . #14#)
                                        (LETT JV
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL |up| |lower|
                                                          (QREFELT $ 75))
                                                (QREFELT $ 61))
                                               JV)
                                              . #14#)
                                        (EXIT
                                         (LETT |SubL|
                                               (CONS
                                                (|SPADfirst|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |Ke|
                                                             (QREFELT $ 72))
                                                   (QREFELT $ 73))
                                                  (QREFELT $ 64)))
                                                |SubL|)
                                               . #14#)))))))))))))))))))
                   (LETT #10# (PROG1 (CDR #10#) (LETT #11# (CDR #11#) . #14#))
                         . #14#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |g|
                    (SPADCALL (SPADCALL |f| (QREFELT $ 73)) |SubL| JV
                              (QREFELT $ 76))
                    . #14#)
              (EXIT (SPADCALL |g| (QREFELT $ 78)))))) 

(SDEFUN |SYMANA;detSys;LL;3|
        ((|sys| |List| (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|))))
        (SPROG
         ((#1=#:G198 NIL) (|eq| NIL) (#2=#:G197 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G196 NIL)
          (#4=#:G195 NIL))
         (SEQ
          (LETT |ds|
                (SPADCALL |sys|
                          (PROGN
                           (LETT #4# NIL . #5=(|SYMANA;detSys;LL;3|))
                           (SEQ (LETT |eq| NIL . #5#) (LETT #3# |sys| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #4#)
                                        . #5#)))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 45)) (QREFELT $ 81))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |eq| NIL . #5#) (LETT #1# |ds| . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 79)) #2#) . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;detSys;LJvfL;4|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G202 NIL) (|eq| NIL) (#2=#:G201 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #2# NIL . #3=(|SYMANA;detSys;LJvfL;4|))
                           (SEQ (LETT |eq| NIL . #3#) (LETT #1# |sys| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 81))))) 

(SDEFUN |SYMANA;detSys;LLJvfL;5|
        ((|sys| |List| (|JetBundleExpression| JB1)) (|sjb| |List| JB1)
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG
         ((#1=#:G252 NIL) (|co| NIL) (#2=#:G251 NIL)
          (|conds| (|List| (|Expression| (|Integer|))))
          (|coL| (|List| (|List| (|Expression| (|Integer|))))) (#3=#:G250 NIL)
          (|jp| NIL) (#4=#:G249 NIL)
          (|pcrit|
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB1)))
          (#5=#:G248 NIL) (|eq| NIL) (#6=#:G247 NIL)
          (|crit| (|List| (|JetBundleExpression| JB1))) (#7=#:G246 NIL)
          (#8=#:G245 NIL)
          (|pvf| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
          (|o| (|NonNegativeInteger|)) (|ol| (|List| (|NonNegativeInteger|)))
          (#9=#:G244 NIL) (#10=#:G243 NIL)
          (|solEq| (|List| (|Equation| (|JetBundleExpression| JB1))))
          (|tmp| (|Union| (|JetBundleExpression| JB1) "failed"))
          (#11=#:G241 NIL) (#12=#:G242 NIL) (|jv| NIL))
         (SEQ (LETT |solEq| NIL . #13=(|SYMANA;detSys;LLJvfL;5|))
              (SEQ (LETT |jv| NIL . #13#) (LETT #12# |sjb| . #13#)
                   (LETT |eq| NIL . #13#) (LETT #11# |sys| . #13#) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#) . #13#) NIL)
                         (ATOM #12#) (PROGN (LETT |jv| (CAR #12#) . #13#) NIL))
                     (GO G191)))
                   (SEQ (LETT |tmp| (SPADCALL |eq| |jv| (QREFELT $ 86)) . #13#)
                        (EXIT
                         (COND
                          ((QEQCAR |tmp| 1) (|error| "cannot solve in detsys"))
                          ('T
                           (LETT |solEq|
                                 (CONS
                                  (SPADCALL (SPADCALL |jv| (QREFELT $ 32))
                                            (QCDR |tmp|) (QREFELT $ 89))
                                  |solEq|)
                                 . #13#)))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #13#))
                         . #13#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |solEq| (NREVERSE |solEq|) . #13#)
              (LETT |ol|
                    (PROGN
                     (LETT #10# NIL . #13#)
                     (SEQ (LETT |eq| NIL . #13#) (LETT #9# |sys| . #13#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |eq| (CAR #9#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS (SPADCALL |eq| (QREFELT $ 90)) #10#)
                                  . #13#)))
                          (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #13#)
              (LETT |o| (SPADCALL (ELT $ 93) |ol| 0 (QREFELT $ 96)) . #13#)
              (LETT |pvf| (SPADCALL |vf| |o| (QREFELT $ 97)) . #13#)
              (LETT |crit|
                    (PROGN
                     (LETT #8# NIL . #13#)
                     (SEQ (LETT |eq| NIL . #13#) (LETT #7# |sys| . #13#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |eq| (CAR #7#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |pvf| |eq| (QREFELT $ 98))
                                        #8#)
                                  . #13#)))
                          (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #13#)
              (LETT |pcrit|
                    (PROGN
                     (LETT #6# NIL . #13#)
                     (SEQ (LETT |eq| NIL . #13#) (LETT #5# |crit| . #13#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |eq| (CAR #5#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |eq| |solEq| (QREFELT $ 100))
                                    (QREFELT $ 102))
                                   #6#)
                                  . #13#)))
                          (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #13#)
              (LETT |coL|
                    (PROGN
                     (LETT #4# NIL . #13#)
                     (SEQ (LETT |jp| NIL . #13#) (LETT #3# |pcrit| . #13#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |jp| (CAR #3#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |jp| (QREFELT $ 104)) #4#)
                                  . #13#)))
                          (LETT #3# (CDR #3#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #13#)
              (LETT |conds| (SPADCALL (ELT $ 105) |coL| NIL (QREFELT $ 108))
                    . #13#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #13#)
                (SEQ (LETT |co| NIL . #13#) (LETT #1# |conds| . #13#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |co| (CAR #1#) . #13#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |co| (QREFELT $ 109)) #2#)
                             . #13#)))
                     (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LL;6|
        ((|sys| |List| (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|))))
        (SPROG
         ((#1=#:G260 NIL) (|eq| NIL) (#2=#:G259 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G258 NIL)
          (#4=#:G257 NIL))
         (SEQ
          (LETT |ds|
                (SPADCALL |sys|
                          (PROGN
                           (LETT #4# NIL . #5=(|SYMANA;ncDetSys;LL;6|))
                           (SEQ (LETT |eq| NIL . #5#) (LETT #3# |sys| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #4#)
                                        . #5#)))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 45)) (QREFELT $ 110))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |eq| NIL . #5#) (LETT #1# |ds| . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 79)) #2#) . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LJvfL;7|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G264 NIL) (|eq| NIL) (#2=#:G263 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #2# NIL . #3=(|SYMANA;ncDetSys;LJvfL;7|))
                           (SEQ (LETT |eq| NIL . #3#) (LETT #1# |sys| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 110))))) 

(SDEFUN |SYMANA;ncDetSys;LLJvfL;8|
        ((|sys| |List| (|JetBundleExpression| JB1)) (|sjb| |List| JB1)
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG
         ((|isc| #1=(|List| (|JetBundleExpression| JB1))) (|ijb| (|List| JB1))
          (|cond| (|JetBundleExpression| JB1)) (|jv| (JB1)) (#2=#:G276 NIL)
          (#3=#:G291 NIL) (|x| NIL) (#4=#:G292 NIL) (|i| NIL) (#5=#:G289 NIL)
          (|e| NIL) (#6=#:G290 NIL) (|j| (|Integer|)) (|Eta| #1#)
          (#7=#:G287 NIL) (|co| NIL) (#8=#:G288 NIL)
          (|ind2| #9=(|List| (|PositiveInteger|))) (|tmp| #1#) (|ind1| #9#)
          (|Xi| #1#) (|jt| (|Symbol|)) (#10=#:G285 NIL) (#11=#:G286 NIL)
          (|coeffs| (|List| (|JetBundleExpression| JB1)))
          (|dirs| (|List| JB1)))
         (SEQ
          (LETT |dirs| (SPADCALL |vf| (QREFELT $ 113))
                . #12=(|SYMANA;ncDetSys;LLJvfL;8|))
          (LETT |coeffs| (SPADCALL |vf| (QREFELT $ 114)) . #12#)
          (LETT |Xi| NIL . #12#) (LETT |tmp| NIL . #12#)
          (LETT |ind1| NIL . #12#) (LETT |ind2| NIL . #12#)
          (SEQ (LETT |co| NIL . #12#) (LETT #11# |coeffs| . #12#)
               (LETT |jv| NIL . #12#) (LETT #10# |dirs| . #12#) G190
               (COND
                ((OR (ATOM #10#) (PROGN (LETT |jv| (CAR #10#) . #12#) NIL)
                     (ATOM #11#) (PROGN (LETT |co| (CAR #11#) . #12#) NIL))
                 (GO G191)))
               (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 115)) . #12#)
                    (EXIT
                     (COND
                      ((EQUAL |jt| '|Indep|)
                       (SEQ (LETT |Xi| (CONS |co| |Xi|) . #12#)
                            (EXIT
                             (LETT |ind1|
                                   (CONS (SPADCALL |jv| (QREFELT $ 116))
                                         |ind1|)
                                   . #12#))))
                      ((EQUAL |jt| '|Dep|)
                       (SEQ (LETT |tmp| (CONS |co| |tmp|) . #12#)
                            (EXIT
                             (LETT |ind2|
                                   (CONS (SPADCALL |jv| (QREFELT $ 116))
                                         |ind2|)
                                   . #12#))))
                      ('T (|error| |errmsg|)))))
               (LETT #10# (PROG1 (CDR #10#) (LETT #11# (CDR #11#) . #12#))
                     . #12#)
               (GO G190) G191 (EXIT NIL))
          (LETT |j| (QREFELT $ 13) . #12#) (LETT |Eta| NIL . #12#)
          (SEQ (LETT |i| NIL . #12#) (LETT #8# |ind2| . #12#)
               (LETT |co| NIL . #12#) (LETT #7# |tmp| . #12#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |co| (CAR #7#) . #12#) NIL)
                     (ATOM #8#) (PROGN (LETT |i| (CAR #8#) . #12#) NIL))
                 (GO G191)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |j| |i| (QREFELT $ 62))) (GO G191)))
                     (SEQ
                      (LETT |Eta| (CONS (|spadConstant| $ 117) |Eta|) . #12#)
                      (EXIT (LETT |j| (- |j| 1) . #12#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |Eta| (CONS |co| |Eta|) . #12#)
                (EXIT (LETT |j| (- |j| 1) . #12#)))
               (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #12#)) . #12#)
               (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (ZEROP |j|))
            (SEQ (LETT |i| 1 . #12#) G190
                 (COND ((|greater_SI| |i| |j|) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |Eta| (CONS (|spadConstant| $ 117) |Eta|) . #12#)))
                 (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191 (EXIT NIL))))
          (LETT |isc| NIL . #12#) (LETT |ijb| NIL . #12#)
          (SEQ (LETT |j| 1 . #12#) (LETT #6# (QREFELT $ 13) . #12#)
               (LETT |e| NIL . #12#) (LETT #5# |Eta| . #12#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |e| (CAR #5#) . #12#) NIL)
                     (|greater_SI| |j| #6#))
                 (GO G191)))
               (SEQ (LETT |cond| (SPADCALL |e| (QREFELT $ 118)) . #12#)
                    (LETT |jv| (SPADCALL (QREFELT $ 23)) . #12#)
                    (SEQ (LETT |i| NIL . #12#) (LETT #4# |ind1| . #12#)
                         (LETT |x| NIL . #12#) (LETT #3# |Xi| . #12#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |x| (CAR #3#) . #12#) NIL)
                               (ATOM #4#)
                               (PROGN (LETT |i| (CAR #4#) . #12#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |x| (QREFELT $ 119)))
                             (SEQ
                              (LETT |jv|
                                    (SPADCALL
                                     (PROG1 (LETT #2# |j| . #12#)
                                       (|check_subtype| (> #2# 0)
                                                        '(|PositiveInteger|)
                                                        #2#))
                                     (LIST |i|) (QREFELT $ 120))
                                    . #12#)
                              (EXIT
                               (LETT |cond|
                                     (SPADCALL |cond|
                                               (SPADCALL |x|
                                                         (SPADCALL |jv|
                                                                   (QREFELT $
                                                                            32))
                                                         (QREFELT $ 121))
                                               (QREFELT $ 122))
                                     . #12#)))))))
                         (LETT #3#
                               (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #12#))
                               . #12#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |jv| (QREFELT $ 123))
                       (|error| "cannot solve invariant surface condition"))
                      ('T
                       (SEQ (LETT |ijb| (CONS |jv| |ijb|) . #12#)
                            (EXIT (LETT |isc| (CONS |cond| |isc|) . #12#)))))))
               (LETT #5# (PROG1 (CDR #5#) (LETT |j| (|inc_SI| |j|) . #12#))
                     . #12#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (APPEND |isc| |sys|) (APPEND |ijb| |sjb|) |vf|
                     (QREFELT $ 81)))))) 

(DECLAIM (NOTINLINE |SymmetryAnalysis;|)) 

(DEFUN |SymmetryAnalysis| (&REST #1=#:G305)
  (SPROG NIL
         (PROG (#2=#:G306)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SymmetryAnalysis|)
                                               '|domainEqualList|)
                    . #3=(|SymmetryAnalysis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SymmetryAnalysis;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SymmetryAnalysis|)))))))))) 

(DEFUN |SymmetryAnalysis;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G304 NIL) (|jv| NIL) (#2=#:G303 NIL) (#3=#:G302 NIL) (|i| NIL)
    (#4=#:G301 NIL) (#5=#:G300 NIL) (#6=#:G299 NIL) (#7=#:G298 NIL)
    (#8=#:G297 NIL) (#9=#:G122 NIL) (#10=#:G296 NIL) (#11=#:G295 NIL)
    (#12=#:G119 NIL) (#13=#:G294 NIL) (#14=#:G293 NIL) (|pv$| NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #15=(|SymmetryAnalysis|))
     (LETT DV$2 (|devaluate| |#2|) . #15#)
     (LETT DV$3 (|devaluate| |#3|) . #15#)
     (LETT |dv$| (LIST '|SymmetryAnalysis| DV$1 DV$2 DV$3) . #15#)
     (LETT $ (GETREFV 125) . #15#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #15#))
     (|haddProp| |$ConstructorCache| '|SymmetryAnalysis| (LIST DV$1 DV$2 DV$3)
                 (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
     (QSETREFV $ 13 (SPADCALL (QREFELT $ 12)))
     (QSETREFV $ 18
               (SPADCALL
                (PROGN
                 (LETT #14# NIL . #15#)
                 (SEQ (LETT |i| 1 . #15#) (LETT #13# (QREFELT $ 11) . #15#)
                      G190 (COND ((|greater_SI| |i| #13#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #12# |i| . #15#)
                                  (|check_subtype| (> #12# 0)
                                                   '(|PositiveInteger|) #12#))
                                (QREFELT $ 14))
                               #14#)
                              . #15#)))
                      (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                (PROGN
                 (LETT #11# NIL . #15#)
                 (SEQ (LETT |i| 1 . #15#) (LETT #10# (QREFELT $ 13) . #15#)
                      G190 (COND ((|greater_SI| |i| #10#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #9# |i| . #15#)
                                  (|check_subtype| (> #9# 0)
                                                   '(|PositiveInteger|) #9#))
                                (QREFELT $ 15))
                               #11#)
                              . #15#)))
                      (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #11#))))
                (QREFELT $ 17)))
     (QSETREFV $ 21
               (PROGN
                (LETT #8# NIL . #15#)
                (SEQ (LETT |jv| NIL . #15#) (LETT #7# (QREFELT $ 18) . #15#)
                     G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |jv| (CAR #7#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #8# (CONS (SPADCALL |jv| (QREFELT $ 20)) #8#)
                             . #15#)))
                     (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                     (EXIT (NREVERSE #8#)))))
     (QSETREFV $ 22 NIL)
     (COND
      ((QEQCAR |#2| 0)
       (COND
        ((SPADCALL (QREFELT $ 11) 1 (QREFELT $ 25))
         (SETELT $ 22
                 (PROGN
                  (LETT #6# NIL . #15#)
                  (SEQ (LETT |i| 1 . #15#) (LETT #5# (QREFELT $ 11) . #15#)
                       G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6#
                               (CONS
                                (SPADCALL (QCDR |#2|)
                                          (LIST (SPADCALL |i| (QREFELT $ 28)))
                                          (QREFELT $ 30))
                                #6#)
                               . #15#)))
                       (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))))
        ('T (SETELT $ 22 (LIST (QCDR |#2|))))))
      ('T (SETELT $ 22 (QCDR |#2|))))
     (COND
      ((QEQCAR |#3| 0)
       (COND
        ((SPADCALL (QREFELT $ 13) 1 (QREFELT $ 25))
         (SETELT $ 22
                 (APPEND (QREFELT $ 22)
                         (PROGN
                          (LETT #4# NIL . #15#)
                          (SEQ (LETT |i| 1 . #15#)
                               (LETT #3# (QREFELT $ 13) . #15#) G190
                               (COND ((|greater_SI| |i| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (SPADCALL (QCDR |#3|)
                                                  (LIST
                                                   (SPADCALL |i|
                                                             (QREFELT $ 28)))
                                                  (QREFELT $ 30))
                                        #4#)
                                       . #15#)))
                               (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                               (EXIT (NREVERSE #4#)))))))
        ('T (SETELT $ 22 (APPEND (QREFELT $ 22) (LIST (QCDR |#3|)))))))
      ('T (SETELT $ 22 (APPEND (QREFELT $ 22) (QCDR |#3|)))))
     (QSETREFV $ 33
               (PROGN
                (LETT #2# NIL . #15#)
                (SEQ (LETT |jv| NIL . #15#) (LETT #1# (QREFELT $ 18) . #15#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |jv| (QREFELT $ 32)) #2#)
                             . #15#)))
                     (LETT #1# (CDR #1#) . #15#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))
     $)))) 

(MAKEPROP '|SymmetryAnalysis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|PositiveInteger|) (0 . |numIndVar|) '|nn|
              (4 . |numDepVar|) '|mm| (8 . X) (13 . U) (|List| 6)
              (18 . |concat!|) '|vars| (|Symbol|) (24 . |name|) '|indVars|
              '|depVars| (29 . |One|) (|Boolean|) (33 . >) (|OutputForm|)
              (|NonNegativeInteger|) (39 . |coerce|) (|List| 26)
              (44 . |superscript|) (|JetBundleExpression| 6) (50 . |coerce|)
              '|JVars| (|JetVectorField| 6 31) (55 . |Zero|) (|Integer|)
              (|List| 19) (59 . |qelt|) (|List| $) (65 . |function|)
              (72 . |diffX|) (77 . *) (83 . +) (89 . |diffU|)
              |SYMANA;ansatz;Jvf;1| (|List| 71) (94 . |tower|)
              (|BasicOperator|) (|Kernel| 31) (99 . |operator|) (104 . |has?|)
              (|Union| (|None|) '"failed") (110 . |property|) (|List| 31)
              (116 . |argument|) (121 . |second|) (126 . |retract|)
              (|JetBundleSymAna| 6 7 8) (131 . X) (|Expression| 36)
              (136 . |coerce|) (141 . >) (147 . |coerce|) (152 . |kernels|)
              (157 . |name|) (162 . |position|) (168 . |minIndex|) (173 . >)
              (179 . |empty|) (183 . U) (|Kernel| $) (188 . |coerce|)
              (193 . |coerce|) (|List| 9) (198 . |Pr|) (204 . |eval|)
              (|JetBundleExpression| 58) (211 . |coerce|)
              |SYMANA;transform;JbeJbe;2| (216 . |leadingDer|)
              |SYMANA;detSys;LLJvfL;5| (|List| 77) |SYMANA;detSys;LL;3|
              |SYMANA;detSys;LJvfL;4| (|Union| $ '"failed") (221 . |solveFor|)
              (227 . =) (|Equation| 31) (233 . =) (239 . |order|) (244 . |max|)
              (250 . |max|) (256 . |max|) (|Mapping| 27 27 27) (|List| 27)
              (262 . |reduce|) (269 . |prolong|) (275 . |eval|)
              (|List| (|Equation| $)) (281 . |eval|)
              (|SparseMultivariatePolynomial| 60 6) (287 . |numerJP|)
              (|List| 60) (292 . |coefficients|) (297 . |append|)
              (|Mapping| 103 103 103) (|List| 103) (303 . |reduce|)
              (310 . |coerce|) |SYMANA;ncDetSys;LLJvfL;8|
              |SYMANA;ncDetSys;LL;6| |SYMANA;ncDetSys;LJvfL;7|
              (315 . |directions|) (320 . |coefficients|) (325 . |type|)
              (330 . |index|) (335 . |Zero|) (339 . -) (344 . |zero?|)
              (349 . |Pr|) (355 . *) (361 . +) (367 . |one?|)
              (|List|
               (|JetBundleLinearFunction| 58 (|JetBundleXExpression| 58))))
           '#(|transform| 372 |ncDetSys| 377 |linearize| 395 |detSysNS| 400
              |detSys| 411 |ansatz| 429)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 124
                                                 '(0 6 9 10 0 6 9 12 1 6 0 9 14
                                                   1 6 0 9 15 2 16 0 0 0 17 1 6
                                                   19 0 20 0 6 0 23 2 9 24 0 0
                                                   25 1 27 26 0 28 2 19 0 0 29
                                                   30 1 31 0 6 32 0 34 0 35 2
                                                   37 19 0 36 38 3 31 0 19 39
                                                   27 40 1 34 0 9 41 2 34 0 31
                                                   0 42 2 34 0 0 0 43 1 34 0 9
                                                   44 1 31 46 0 47 1 49 48 0 50
                                                   2 48 24 0 19 51 2 48 52 0 19
                                                   53 1 49 54 0 55 1 54 31 0 56
                                                   1 31 36 0 57 1 58 0 9 59 1
                                                   58 60 0 61 2 36 24 0 0 62 1
                                                   6 60 0 63 1 60 46 0 64 1 48
                                                   19 0 65 2 37 36 19 0 66 1 37
                                                   36 0 67 2 27 24 0 0 68 0 26
                                                   0 69 1 58 0 9 70 1 31 0 71
                                                   72 1 31 60 0 73 2 58 0 9 74
                                                   75 3 60 0 0 46 39 76 1 77 0
                                                   60 78 1 31 6 0 80 2 31 85 0
                                                   6 86 2 31 24 0 0 87 2 88 0
                                                   31 31 89 1 31 27 0 90 2 19 0
                                                   0 0 91 2 6 0 0 0 92 2 27 0 0
                                                   0 93 3 95 27 94 0 27 96 2 34
                                                   0 0 27 97 2 34 31 0 31 98 2
                                                   31 0 0 99 100 1 31 101 0 102
                                                   1 101 103 0 104 2 103 0 0 0
                                                   105 3 107 103 106 0 103 108
                                                   1 31 0 60 109 1 34 16 0 113
                                                   1 34 54 0 114 1 6 19 0 115 1
                                                   6 9 0 116 0 31 0 117 1 31 0
                                                   0 118 1 31 24 0 119 2 6 0 9
                                                   74 120 2 31 0 0 0 121 2 31 0
                                                   0 0 122 1 6 24 0 123 1 0 77
                                                   31 79 2 0 54 54 34 112 1 0
                                                   82 54 111 3 0 54 54 16 34
                                                   110 1 0 124 82 1 2 0 54 54
                                                   34 1 1 0 82 54 1 2 0 54 54
                                                   34 84 1 0 82 54 83 3 0 54 54
                                                   16 34 81 0 0 34 45)))))
           '|lookupComplete|)) 
