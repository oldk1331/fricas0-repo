
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
                                                  (|check_subtype2| (> #3# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
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
                                                  (|check_subtype2| (> #1# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
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
          (|id| #2=(|Integer|)) (#3=#:G191 NIL) (|d| NIL)
          (|up| (|PositiveInteger|)) (#4=#:G173 NIL) (#5=#:G171 NIL)
          (|diff| (|List| (|JetBundleExpression| JB1)))
          (|rarg| (|List| (|JetBundleExpression| JB1)))
          (|arg| (|List| (|JetBundleExpression| JB1))) (#6=#:G190 NIL)
          (|i| NIL) (|num| #2#) (|pos| (|Integer|)) (|fname| (|Symbol|))
          (#7=#:G162 NIL) (#8=#:G152 NIL) (#9=#:G148 NIL) (|ind| #2#)
          (|typ| (|Symbol|)) (#10=#:G142 NIL) (#11=#:G188 NIL) (|Ke| NIL)
          (#12=#:G189 NIL) (|Op| NIL) (|LOps| (|List| (|BasicOperator|)))
          (#13=#:G187 NIL) (#14=#:G186 NIL)
          (|LKernels| (|List| (|Kernel| (|JetBundleExpression| JB1)))))
         (SEQ (LETT JV NIL . #15=(|SYMANA;transform;JbeJbe;2|))
              (LETT |SubL| NIL . #15#)
              (LETT |LKernels| (SPADCALL |f| (QREFELT $ 47)) . #15#)
              (LETT |LOps|
                    (PROGN
                     (LETT #14# NIL . #15#)
                     (SEQ (LETT |Ke| NIL . #15#) (LETT #13# |LKernels| . #15#)
                          G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |Ke| (CAR #13#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |Ke| (QREFELT $ 50)) #14#)
                                  . #15#)))
                          (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #15#)
              (SEQ (LETT |Op| NIL . #15#) (LETT #12# |LOps| . #15#)
                   (LETT |Ke| NIL . #15#) (LETT #11# |LKernels| . #15#) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |Ke| (CAR #11#) . #15#) NIL)
                         (ATOM #12#) (PROGN (LETT |Op| (CAR #12#) . #15#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |Op| '|%jet| (QREFELT $ 51))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #10#
                                        (SPADCALL |Op| '|%jet| (QREFELT $ 53))
                                        . #15#)
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #10#))
                              . #15#)
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
                                  . #15#)
                            (LETT JV
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL
                                     (PROG1 (LETT #9# |ind| . #15#)
                                       (|check_subtype2| (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#))
                                     (QREFELT $ 59))
                                    (QREFELT $ 61))
                                   JV)
                                  . #15#)
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
                                              (LETT #8#
                                                    (- |ind| (QREFELT $ 11))
                                                    . #15#)
                                            (|check_subtype2| (> #8# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #8#))
                                          (QREFELT $ 15))
                                         (QREFELT $ 63))
                                        (QREFELT $ 64)))
                                      |SubL|)
                                     . #15#))
                              ('T
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1 (LETT #7# |ind| . #15#)
                                            (|check_subtype2| (> #7# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #7#))
                                          (QREFELT $ 14))
                                         (QREFELT $ 63))
                                        (QREFELT $ 64)))
                                      |SubL|)
                                     . #15#))))))))))
                      ('T
                       (SEQ
                        (LETT |fname| (SPADCALL |Op| (QREFELT $ 65)) . #15#)
                        (LETT |pos|
                              (SPADCALL |fname| (QREFELT $ 22) (QREFELT $ 66))
                              . #15#)
                        (EXIT
                         (COND
                          ((>= |pos| (SPADCALL (QREFELT $ 22) (QREFELT $ 67)))
                           (SEQ
                            (LETT |arg| (SPADCALL |Ke| (QREFELT $ 55)) . #15#)
                            (EXIT
                             (COND
                              ((SPADCALL (LENGTH |arg|) 3 (QREFELT $ 68))
                               (SEQ (LETT |arg| (CDR |arg|) . #15#)
                                    (LETT |num|
                                          (SPADCALL (|SPADfirst| |arg|)
                                                    (QREFELT $ 57))
                                          . #15#)
                                    (LETT |arg| (CDR (CDR |arg|)) . #15#)
                                    (LETT |rarg| NIL . #15#)
                                    (SEQ (LETT |i| 1 . #15#)
                                         (LETT #6# |num| . #15#) G190
                                         (COND
                                          ((|greater_SI| |i| #6#) (GO G191)))
                                         (SEQ
                                          (LETT |rarg|
                                                (CONS (|SPADfirst| |arg|)
                                                      |rarg|)
                                                . #15#)
                                          (EXIT
                                           (LETT |arg| (CDR |arg|) . #15#)))
                                         (LETT |i| (|inc_SI| |i|) . #15#)
                                         (GO G190) G191 (EXIT NIL))
                                    (LETT |rarg| (NREVERSE |rarg|) . #15#)
                                    (LETT |diff| |arg| . #15#)
                                    (EXIT
                                     (COND
                                      ((NULL |diff|)
                                       (SEQ
                                        (LETT JV
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL
                                                 (PROG1 (LETT #5# |pos| . #15#)
                                                   (|check_subtype2| (> #5# 0)
                                                                     '(|PositiveInteger|)
                                                                     '(|Integer|)
                                                                     #5#))
                                                 (QREFELT $ 69))
                                                (QREFELT $ 61))
                                               JV)
                                              . #15#)
                                        (EXIT
                                         (LETT |SubL|
                                               (CONS
                                                (|SPADfirst|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |Ke|
                                                             (QREFELT $ 71))
                                                   (QREFELT $ 72))
                                                  (QREFELT $ 64)))
                                                |SubL|)
                                               . #15#))))
                                      ('T
                                       (SEQ
                                        (LETT |up|
                                              (PROG1 (LETT #4# |pos| . #15#)
                                                (|check_subtype2| (> #4# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|Integer|)
                                                                  #4#))
                                              . #15#)
                                        (LETT |lower| NIL . #15#)
                                        (SEQ (LETT |d| NIL . #15#)
                                             (LETT #3# |diff| . #15#) G190
                                             (COND
                                              ((OR (ATOM #3#)
                                                   (PROGN
                                                    (LETT |d| (CAR #3#) . #15#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |id|
                                                    (SPADCALL |d|
                                                              (QREFELT $ 57))
                                                    . #15#)
                                              (EXIT
                                               (LETT |lower|
                                                     (CONS
                                                      (PROG1
                                                          (LETT #1# |id|
                                                                . #15#)
                                                        (|check_subtype2|
                                                         (> #1# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #1#))
                                                      |lower|)
                                                     . #15#)))
                                             (LETT #3# (CDR #3#) . #15#)
                                             (GO G190) G191 (EXIT NIL))
                                        (LETT |lower| (NREVERSE |lower|)
                                              . #15#)
                                        (LETT JV
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL |up| |lower|
                                                          (QREFELT $ 74))
                                                (QREFELT $ 61))
                                               JV)
                                              . #15#)
                                        (EXIT
                                         (LETT |SubL|
                                               (CONS
                                                (|SPADfirst|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |Ke|
                                                             (QREFELT $ 71))
                                                   (QREFELT $ 72))
                                                  (QREFELT $ 64)))
                                                |SubL|)
                                               . #15#)))))))))))))))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #15#))
                         . #15#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |g|
                    (SPADCALL (SPADCALL |f| (QREFELT $ 72)) |SubL| JV
                              (QREFELT $ 75))
                    . #15#)
              (EXIT (SPADCALL |g| (QREFELT $ 77)))))) 

(SDEFUN |SYMANA;detSys;LL;3|
        ((|sys| |List| (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|))))
        (SPROG
         ((#1=#:G199 NIL) (|eq| NIL) (#2=#:G198 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G197 NIL)
          (#4=#:G196 NIL))
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
                                        (CONS (SPADCALL |eq| (QREFELT $ 79))
                                              #4#)
                                        . #5#)))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 45)) (QREFELT $ 80))
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
                   (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 78)) #2#) . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;detSys;LJvfL;4|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G203 NIL) (|eq| NIL) (#2=#:G202 NIL))
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
                                        (CONS (SPADCALL |eq| (QREFELT $ 79))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 80))))) 

(SDEFUN |SYMANA;detSys;LLJvfL;5|
        ((|sys| |List| (|JetBundleExpression| JB1)) (|sjb| |List| JB1)
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG
         ((#1=#:G257 NIL) (|co| NIL) (#2=#:G256 NIL)
          (|conds| (|List| (|Expression| (|Integer|))))
          (|coL| (|List| (|List| (|Expression| (|Integer|))))) (#3=#:G255 NIL)
          (|jp| NIL) (#4=#:G254 NIL)
          (|pcrit|
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB1)))
          (#5=#:G253 NIL) (|eq| NIL) (#6=#:G252 NIL)
          (|crit| (|List| (|JetBundleExpression| JB1))) (#7=#:G251 NIL)
          (#8=#:G250 NIL)
          (|pvf| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
          (|o| (|NonNegativeInteger|)) (|ol| (|List| (|NonNegativeInteger|)))
          (#9=#:G249 NIL) (#10=#:G248 NIL)
          (|solEq| (|List| (|Equation| (|JetBundleExpression| JB1))))
          (|tmp| (|Union| (|JetBundleExpression| JB1) "failed"))
          (#11=#:G246 NIL) (#12=#:G247 NIL) (|jv| NIL))
         (SEQ (LETT |solEq| NIL . #13=(|SYMANA;detSys;LLJvfL;5|))
              (SEQ (LETT |jv| NIL . #13#) (LETT #12# |sjb| . #13#)
                   (LETT |eq| NIL . #13#) (LETT #11# |sys| . #13#) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#) . #13#) NIL)
                         (ATOM #12#) (PROGN (LETT |jv| (CAR #12#) . #13#) NIL))
                     (GO G191)))
                   (SEQ (LETT |tmp| (SPADCALL |eq| |jv| (QREFELT $ 85)) . #13#)
                        (EXIT
                         (COND
                          ((QEQCAR |tmp| 1) (|error| "cannot solve in detsys"))
                          ('T
                           (LETT |solEq|
                                 (CONS
                                  (SPADCALL (SPADCALL |jv| (QREFELT $ 32))
                                            (QCDR |tmp|) (QREFELT $ 88))
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
                                  (CONS (SPADCALL |eq| (QREFELT $ 89)) #10#)
                                  . #13#)))
                          (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #13#)
              (LETT |o| (SPADCALL (ELT $ 94) |ol| 0 (QREFELT $ 97)) . #13#)
              (LETT |pvf| (SPADCALL |vf| |o| (QREFELT $ 98)) . #13#)
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
                                  (CONS (SPADCALL |pvf| |eq| (QREFELT $ 99))
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
                                    (SPADCALL |eq| |solEq| (QREFELT $ 101))
                                    (QREFELT $ 103))
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
                                  (CONS (SPADCALL |jp| (QREFELT $ 105)) #4#)
                                  . #13#)))
                          (LETT #3# (CDR #3#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #13#)
              (LETT |conds| (SPADCALL (ELT $ 106) |coL| NIL (QREFELT $ 109))
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
                       (LETT #2# (CONS (SPADCALL |co| (QREFELT $ 110)) #2#)
                             . #13#)))
                     (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LL;6|
        ((|sys| |List| (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|))))
        (SPROG
         ((#1=#:G265 NIL) (|eq| NIL) (#2=#:G264 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G263 NIL)
          (#4=#:G262 NIL))
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
                                        (CONS (SPADCALL |eq| (QREFELT $ 79))
                                              #4#)
                                        . #5#)))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 45)) (QREFELT $ 111))
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
                   (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 78)) #2#) . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LJvfL;7|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G269 NIL) (|eq| NIL) (#2=#:G268 NIL))
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
                                        (CONS (SPADCALL |eq| (QREFELT $ 79))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 111))))) 

(SDEFUN |SYMANA;ncDetSys;LLJvfL;8|
        ((|sys| |List| (|JetBundleExpression| JB1)) (|sjb| |List| JB1)
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG
         ((|isc| #1=(|List| (|JetBundleExpression| JB1))) (|ijb| (|List| JB1))
          (|cond| (|JetBundleExpression| JB1)) (|jv| (JB1)) (#2=#:G281 NIL)
          (#3=#:G297 NIL) (|x| NIL) (#4=#:G298 NIL) (|i| NIL) (#5=#:G295 NIL)
          (|e| NIL) (#6=#:G296 NIL) (|j| (|Integer|)) (|Eta| #1#)
          (#7=#:G294 NIL) (#8=#:G292 NIL) (|co| NIL) (#9=#:G293 NIL)
          (|ind2| #10=(|List| (|PositiveInteger|))) (|tmp| #1#) (|ind1| #10#)
          (|Xi| #1#) (|jt| (|Symbol|)) (#11=#:G290 NIL) (#12=#:G291 NIL)
          (|coeffs| (|List| (|JetBundleExpression| JB1)))
          (|dirs| (|List| JB1)))
         (SEQ
          (LETT |dirs| (SPADCALL |vf| (QREFELT $ 114))
                . #13=(|SYMANA;ncDetSys;LLJvfL;8|))
          (LETT |coeffs| (SPADCALL |vf| (QREFELT $ 115)) . #13#)
          (LETT |Xi| NIL . #13#) (LETT |tmp| NIL . #13#)
          (LETT |ind1| NIL . #13#) (LETT |ind2| NIL . #13#)
          (SEQ (LETT |co| NIL . #13#) (LETT #12# |coeffs| . #13#)
               (LETT |jv| NIL . #13#) (LETT #11# |dirs| . #13#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |jv| (CAR #11#) . #13#) NIL)
                     (ATOM #12#) (PROGN (LETT |co| (CAR #12#) . #13#) NIL))
                 (GO G191)))
               (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 116)) . #13#)
                    (EXIT
                     (COND
                      ((EQUAL |jt| '|Indep|)
                       (SEQ (LETT |Xi| (CONS |co| |Xi|) . #13#)
                            (EXIT
                             (LETT |ind1|
                                   (CONS (SPADCALL |jv| (QREFELT $ 117))
                                         |ind1|)
                                   . #13#))))
                      ((EQUAL |jt| '|Dep|)
                       (SEQ (LETT |tmp| (CONS |co| |tmp|) . #13#)
                            (EXIT
                             (LETT |ind2|
                                   (CONS (SPADCALL |jv| (QREFELT $ 117))
                                         |ind2|)
                                   . #13#))))
                      ('T
                       (|error|
                        "Only independent and dependent variables allowed")))))
               (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #13#))
                     . #13#)
               (GO G190) G191 (EXIT NIL))
          (LETT |j| (QREFELT $ 13) . #13#) (LETT |Eta| NIL . #13#)
          (SEQ (LETT |i| NIL . #13#) (LETT #9# |ind2| . #13#)
               (LETT |co| NIL . #13#) (LETT #8# |tmp| . #13#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |co| (CAR #8#) . #13#) NIL)
                     (ATOM #9#) (PROGN (LETT |i| (CAR #9#) . #13#) NIL))
                 (GO G191)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |j| |i| (QREFELT $ 62))) (GO G191)))
                     (SEQ
                      (LETT |Eta| (CONS (|spadConstant| $ 118) |Eta|) . #13#)
                      (EXIT (LETT |j| (- |j| 1) . #13#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |Eta| (CONS |co| |Eta|) . #13#)
                (EXIT (LETT |j| (- |j| 1) . #13#)))
               (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#) . #13#)) . #13#)
               (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (ZEROP |j|))
            (SEQ (LETT |i| 1 . #13#) (LETT #7# |j| . #13#) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |Eta| (CONS (|spadConstant| $ 118) |Eta|) . #13#)))
                 (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191 (EXIT NIL))))
          (LETT |isc| NIL . #13#) (LETT |ijb| NIL . #13#)
          (SEQ (LETT |j| 1 . #13#) (LETT #6# (QREFELT $ 13) . #13#)
               (LETT |e| NIL . #13#) (LETT #5# |Eta| . #13#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |e| (CAR #5#) . #13#) NIL)
                     (|greater_SI| |j| #6#))
                 (GO G191)))
               (SEQ (LETT |cond| (SPADCALL |e| (QREFELT $ 119)) . #13#)
                    (LETT |jv| (|spadConstant| $ 23) . #13#)
                    (SEQ (LETT |i| NIL . #13#) (LETT #4# |ind1| . #13#)
                         (LETT |x| NIL . #13#) (LETT #3# |Xi| . #13#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |x| (CAR #3#) . #13#) NIL)
                               (ATOM #4#)
                               (PROGN (LETT |i| (CAR #4#) . #13#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |x| (QREFELT $ 120)))
                             (SEQ
                              (LETT |jv|
                                    (SPADCALL
                                     (PROG1 (LETT #2# |j| . #13#)
                                       (|check_subtype2| (> #2# 0)
                                                         '(|PositiveInteger|)
                                                         '(|NonNegativeInteger|)
                                                         #2#))
                                     (LIST |i|) (QREFELT $ 121))
                                    . #13#)
                              (EXIT
                               (LETT |cond|
                                     (SPADCALL |cond|
                                               (SPADCALL |x|
                                                         (SPADCALL |jv|
                                                                   (QREFELT $
                                                                            32))
                                                         (QREFELT $ 122))
                                               (QREFELT $ 123))
                                     . #13#)))))))
                         (LETT #3#
                               (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #13#))
                               . #13#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |jv| (QREFELT $ 124))
                       (|error| "cannot solve invariant surface condition"))
                      ('T
                       (SEQ (LETT |ijb| (CONS |jv| |ijb|) . #13#)
                            (EXIT (LETT |isc| (CONS |cond| |isc|) . #13#)))))))
               (LETT #5# (PROG1 (CDR #5#) (LETT |j| (|inc_SI| |j|) . #13#))
                     . #13#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (APPEND |isc| |sys|) (APPEND |ijb| |sjb|) |vf|
                     (QREFELT $ 80)))))) 

(DECLAIM (NOTINLINE |SymmetryAnalysis;|)) 

(DEFUN |SymmetryAnalysis| (&REST #1=#:G311)
  (SPROG NIL
         (PROG (#2=#:G312)
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
   ((#1=#:G310 NIL) (|jv| NIL) (#2=#:G309 NIL) (#3=#:G308 NIL) (|i| NIL)
    (#4=#:G307 NIL) (#5=#:G306 NIL) (#6=#:G305 NIL) (#7=#:G304 NIL)
    (#8=#:G303 NIL) (#9=#:G122 NIL) (#10=#:G302 NIL) (#11=#:G301 NIL)
    (#12=#:G119 NIL) (#13=#:G300 NIL) (#14=#:G299 NIL) (|pv$| NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #15=(|SymmetryAnalysis|))
     (LETT DV$2 (|devaluate| |#2|) . #15#)
     (LETT DV$3 (|devaluate| |#3|) . #15#)
     (LETT |dv$| (LIST '|SymmetryAnalysis| DV$1 DV$2 DV$3) . #15#)
     (LETT $ (GETREFV 126) . #15#)
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
                                  (|check_subtype2| (> #12# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #12#))
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
                                  (|check_subtype2| (> #9# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #9#))
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
              |SYMANA;ansatz;Jvf;1| (|List| 70) (94 . |tower|)
              (|BasicOperator|) (|Kernel| 31) (99 . |operator|) (104 . |has?|)
              (|Union| (|None|) '"failed") (110 . |property|) (|List| 31)
              (116 . |argument|) (121 . |second|) (126 . |retract|)
              (|JetBundleSymAna| 6 7 8) (131 . X) (|Expression| 36)
              (136 . |coerce|) (141 . >) (147 . |coerce|) (152 . |kernels|)
              (157 . |name|) (162 . |position|) (168 . |minIndex|) (173 . >)
              (179 . U) (|Kernel| $) (184 . |coerce|) (189 . |coerce|)
              (|List| 9) (194 . |Pr|) (200 . |eval|) (|JetBundleExpression| 58)
              (207 . |coerce|) |SYMANA;transform;JbeJbe;2| (212 . |leadingDer|)
              |SYMANA;detSys;LLJvfL;5| (|List| 76) |SYMANA;detSys;LL;3|
              |SYMANA;detSys;LJvfL;4| (|Union| $ '"failed") (217 . |solveFor|)
              (223 . =) (|Equation| 31) (229 . =) (235 . |order|) (240 . |max|)
              (246 . |max|) (|Character|) (252 . |max|) (258 . |max|)
              (|Mapping| 27 27 27) (|List| 27) (264 . |reduce|)
              (271 . |prolong|) (277 . |eval|) (|List| (|Equation| $))
              (283 . |eval|) (|SparseMultivariatePolynomial| 60 6)
              (289 . |numerJP|) (|List| 60) (294 . |coefficients|)
              (299 . |append|) (|Mapping| 104 104 104) (|List| 104)
              (305 . |reduce|) (312 . |coerce|) |SYMANA;ncDetSys;LLJvfL;8|
              |SYMANA;ncDetSys;LL;6| |SYMANA;ncDetSys;LJvfL;7|
              (317 . |directions|) (322 . |coefficients|) (327 . |type|)
              (332 . |index|) (337 . |Zero|) (341 . -) (346 . |zero?|)
              (351 . |Pr|) (357 . *) (363 . +) (369 . |one?|)
              (|List|
               (|JetBundleLinearFunction| 58 (|JetBundleXExpression| 58))))
           '#(|transform| 374 |ncDetSys| 379 |linearize| 397 |detSysNS| 402
              |detSys| 413 |ansatz| 431)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 125
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
                                                   36 0 67 2 27 24 0 0 68 1 58
                                                   0 9 69 1 31 0 70 71 1 31 60
                                                   0 72 2 58 0 9 73 74 3 60 0 0
                                                   46 39 75 1 76 0 60 77 1 31 6
                                                   0 79 2 31 84 0 6 85 2 31 24
                                                   0 0 86 2 87 0 31 31 88 1 31
                                                   27 0 89 2 19 0 0 0 90 2 6 0
                                                   0 0 91 2 92 0 0 0 93 2 27 0
                                                   0 0 94 3 96 27 95 0 27 97 2
                                                   34 0 0 27 98 2 34 31 0 31 99
                                                   2 31 0 0 100 101 1 31 102 0
                                                   103 1 102 104 0 105 2 104 0
                                                   0 0 106 3 108 104 107 0 104
                                                   109 1 31 0 60 110 1 34 16 0
                                                   114 1 34 54 0 115 1 6 19 0
                                                   116 1 6 9 0 117 0 31 0 118 1
                                                   31 0 0 119 1 31 24 0 120 2 6
                                                   0 9 73 121 2 31 0 0 0 122 2
                                                   31 0 0 0 123 1 6 24 0 124 1
                                                   0 76 31 78 2 0 54 54 34 113
                                                   1 0 81 54 112 3 0 54 54 16
                                                   34 111 1 0 125 81 1 2 0 54
                                                   54 34 1 1 0 81 54 1 2 0 54
                                                   54 34 83 1 0 81 54 82 3 0 54
                                                   54 16 34 80 0 0 34 45)))))
           '|lookupComplete|)) 
