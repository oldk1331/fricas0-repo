
(SDEFUN |SYMANA;ansatz;Jvf;1|
        (($ |JetVectorField| JB1 (|JetBundleExpression| JB1)))
        (SPROG
         ((|res| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
          (#1=#:G133 NIL) (|f| (|JetBundleExpression| JB1)) (|s| (|Symbol|))
          (#2=#:G139 NIL) (|i| NIL) (#3=#:G129 NIL) (#4=#:G138 NIL))
         (SEQ (LETT |res| (|spadConstant| $ 37))
              (SEQ (LETT |i| 1) (LETT #4# (QREFELT $ 11)) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |s| (SPADCALL (QREFELT $ 22) |i| (QREFELT $ 39)))
                        (LETT |f|
                              (SPADCALL |s| (QREFELT $ 35) 0 (QREFELT $ 41)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |f|
                                                   (SPADCALL
                                                    (PROG1 (LETT #3# |i|)
                                                      (|check_subtype2|
                                                       (> #3# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #3#))
                                                    (QREFELT $ 42))
                                                   (QREFELT $ 43))
                                         (QREFELT $ 44)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1) (LETT #2# (QREFELT $ 13)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |s|
                          (SPADCALL (QREFELT $ 22) (+ (QREFELT $ 11) |i|)
                                    (QREFELT $ 39)))
                    (LETT |f| (SPADCALL |s| (QREFELT $ 35) 0 (QREFELT $ 41)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |f|
                                               (SPADCALL
                                                (PROG1 (LETT #1# |i|)
                                                  (|check_subtype2| (> #1# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                (QREFELT $ 45))
                                               (QREFELT $ 43))
                                     (QREFELT $ 44)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
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
         (SEQ (LETT JV NIL) (LETT |SubL| NIL)
              (LETT |LKernels| (SPADCALL |f| (QREFELT $ 48)))
              (LETT |LOps|
                    (PROGN
                     (LETT #14# NIL)
                     (SEQ (LETT |Ke| NIL) (LETT #13# |LKernels|) G190
                          (COND
                           ((OR (ATOM #13#) (PROGN (LETT |Ke| (CAR #13#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |Ke| (QREFELT $ 51)) #14#))))
                          (LETT #13# (CDR #13#)) (GO G190) G191
                          (EXIT (NREVERSE #14#)))))
              (SEQ (LETT |Op| NIL) (LETT #12# |LOps|) (LETT |Ke| NIL)
                   (LETT #11# |LKernels|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |Ke| (CAR #11#)) NIL)
                         (ATOM #12#) (PROGN (LETT |Op| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |Op| '|%jet| (QREFELT $ 52))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #10#
                                        (SPADCALL |Op| '|%jet| (QREFELT $ 54)))
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #10#)))
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Deriv|)
                           (|error|
                            "function contains illegal jet variables in transform"))
                          ('T
                           (SEQ
                            (LETT |ind|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |Ke| (QREFELT $ 56))
                                             (QREFELT $ 57))
                                   (QREFELT $ 58)))
                            (LETT JV
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL
                                     (PROG1 (LETT #9# |ind|)
                                       (|check_subtype2| (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#))
                                     (QREFELT $ 60))
                                    (QREFELT $ 62))
                                   JV))
                            (EXIT
                             (COND
                              ((SPADCALL |ind| (QREFELT $ 11) (QREFELT $ 63))
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1
                                              (LETT #8#
                                                    (- |ind| (QREFELT $ 11)))
                                            (|check_subtype2| (> #8# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #8#))
                                          (QREFELT $ 15))
                                         (QREFELT $ 64))
                                        (QREFELT $ 65)))
                                      |SubL|)))
                              ('T
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1 (LETT #7# |ind|)
                                            (|check_subtype2| (> #7# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #7#))
                                          (QREFELT $ 14))
                                         (QREFELT $ 64))
                                        (QREFELT $ 65)))
                                      |SubL|)))))))))))
                      ('T
                       (SEQ (LETT |fname| (SPADCALL |Op| (QREFELT $ 66)))
                            (LETT |pos|
                                  (SPADCALL |fname| (QREFELT $ 22)
                                            (QREFELT $ 67)))
                            (EXIT
                             (COND
                              ((>= |pos|
                                   (SPADCALL (QREFELT $ 22) (QREFELT $ 68)))
                               (SEQ (LETT |arg| (SPADCALL |Ke| (QREFELT $ 56)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL (LENGTH |arg|) 3
                                                 (QREFELT $ 69))
                                       (SEQ (LETT |arg| (CDR |arg|))
                                            (LETT |num|
                                                  (SPADCALL (|SPADfirst| |arg|)
                                                            (QREFELT $ 58)))
                                            (LETT |arg| (CDR (CDR |arg|)))
                                            (LETT |rarg| NIL)
                                            (SEQ (LETT |i| 1) (LETT #6# |num|)
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |i| #6#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |rarg|
                                                        (CONS
                                                         (|SPADfirst| |arg|)
                                                         |rarg|))
                                                  (EXIT
                                                   (LETT |arg| (CDR |arg|))))
                                                 (LETT |i| (|inc_SI| |i|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (LETT |rarg| (NREVERSE |rarg|))
                                            (LETT |diff| |arg|)
                                            (EXIT
                                             (COND
                                              ((NULL |diff|)
                                               (SEQ
                                                (LETT JV
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (PROG1
                                                             (LETT #5# |pos|)
                                                           (|check_subtype2|
                                                            (> #5# 0)
                                                            '(|PositiveInteger|)
                                                            '(|Integer|) #5#))
                                                         (QREFELT $ 70))
                                                        (QREFELT $ 62))
                                                       JV))
                                                (EXIT
                                                 (LETT |SubL|
                                                       (CONS
                                                        (|SPADfirst|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |Ke|
                                                                     (QREFELT $
                                                                              72))
                                                           (QREFELT $ 73))
                                                          (QREFELT $ 65)))
                                                        |SubL|)))))
                                              ('T
                                               (SEQ
                                                (LETT |up|
                                                      (PROG1 (LETT #4# |pos|)
                                                        (|check_subtype2|
                                                         (> #4# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #4#)))
                                                (LETT |lower| NIL)
                                                (SEQ (LETT |d| NIL)
                                                     (LETT #3# |diff|) G190
                                                     (COND
                                                      ((OR (ATOM #3#)
                                                           (PROGN
                                                            (LETT |d|
                                                                  (CAR #3#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (LETT |id|
                                                            (SPADCALL |d|
                                                                      (QREFELT
                                                                       $ 58)))
                                                      (EXIT
                                                       (LETT |lower|
                                                             (CONS
                                                              (PROG1
                                                                  (LETT #1#
                                                                        |id|)
                                                                (|check_subtype2|
                                                                 (> #1# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                                              |lower|))))
                                                     (LETT #3# (CDR #3#))
                                                     (GO G190) G191 (EXIT NIL))
                                                (LETT |lower|
                                                      (NREVERSE |lower|))
                                                (LETT JV
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL |up| |lower|
                                                                  (QREFELT $
                                                                           75))
                                                        (QREFELT $ 62))
                                                       JV))
                                                (EXIT
                                                 (LETT |SubL|
                                                       (CONS
                                                        (|SPADfirst|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |Ke|
                                                                     (QREFELT $
                                                                              72))
                                                           (QREFELT $ 73))
                                                          (QREFELT $ 65)))
                                                        |SubL|))))))))))))))))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |g|
                    (SPADCALL (SPADCALL |f| (QREFELT $ 73)) |SubL| JV
                              (QREFELT $ 76)))
              (EXIT (SPADCALL |g| (QREFELT $ 78)))))) 

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
                           (LETT #4# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #3# |sys|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #4#))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 46)) (QREFELT $ 81)))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |eq| NIL) (LETT #1# |ds|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 79)) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;detSys;LJvfL;4|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G203 NIL) (|eq| NIL) (#2=#:G202 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #1# |sys|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |eq| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 81))))) 

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
         (SEQ (LETT |solEq| NIL)
              (SEQ (LETT |jv| NIL) (LETT #12# |sjb|) (LETT |eq| NIL)
                   (LETT #11# |sys|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#)) NIL)
                         (ATOM #12#) (PROGN (LETT |jv| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |tmp| (SPADCALL |eq| |jv| (QREFELT $ 86)))
                        (EXIT
                         (COND
                          ((QEQCAR |tmp| 1) (|error| "cannot solve in detsys"))
                          ('T
                           (LETT |solEq|
                                 (CONS
                                  (SPADCALL (SPADCALL |jv| (QREFELT $ 34))
                                            (QCDR |tmp|) (QREFELT $ 89))
                                  |solEq|))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |solEq| (NREVERSE |solEq|))
              (LETT |ol|
                    (PROGN
                     (LETT #10# NIL)
                     (SEQ (LETT |eq| NIL) (LETT #9# |sys|) G190
                          (COND
                           ((OR (ATOM #9#) (PROGN (LETT |eq| (CAR #9#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS (SPADCALL |eq| (QREFELT $ 90)) #10#))))
                          (LETT #9# (CDR #9#)) (GO G190) G191
                          (EXIT (NREVERSE #10#)))))
              (LETT |o| (SPADCALL (ELT $ 95) |ol| 0 (QREFELT $ 98)))
              (LETT |pvf| (SPADCALL |vf| |o| (QREFELT $ 99)))
              (LETT |crit|
                    (PROGN
                     (LETT #8# NIL)
                     (SEQ (LETT |eq| NIL) (LETT #7# |sys|) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |eq| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |pvf| |eq| (QREFELT $ 100))
                                        #8#))))
                          (LETT #7# (CDR #7#)) (GO G190) G191
                          (EXIT (NREVERSE #8#)))))
              (LETT |pcrit|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |eq| NIL) (LETT #5# |crit|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |eq| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |eq| |solEq| (QREFELT $ 102))
                                    (QREFELT $ 104))
                                   #6#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (LETT |coL|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |jp| NIL) (LETT #3# |pcrit|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |jp| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |jp| (QREFELT $ 106)) #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |conds| (SPADCALL (ELT $ 107) |coL| NIL (QREFELT $ 110)))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |co| NIL) (LETT #1# |conds|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |co| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |co| (QREFELT $ 111)) #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
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
                           (LETT #4# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #3# |sys|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #4#))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 46)) (QREFELT $ 112)))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |eq| NIL) (LETT #1# |ds|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 79)) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LJvfL;7|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G269 NIL) (|eq| NIL) (#2=#:G268 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #1# |sys|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |eq| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 112))))) 

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
         (SEQ (LETT |dirs| (SPADCALL |vf| (QREFELT $ 115)))
              (LETT |coeffs| (SPADCALL |vf| (QREFELT $ 116))) (LETT |Xi| NIL)
              (LETT |tmp| NIL) (LETT |ind1| NIL) (LETT |ind2| NIL)
              (SEQ (LETT |co| NIL) (LETT #12# |coeffs|) (LETT |jv| NIL)
                   (LETT #11# |dirs|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |jv| (CAR #11#)) NIL)
                         (ATOM #12#) (PROGN (LETT |co| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 117)))
                        (EXIT
                         (COND
                          ((EQUAL |jt| '|Indep|)
                           (SEQ (LETT |Xi| (CONS |co| |Xi|))
                                (EXIT
                                 (LETT |ind1|
                                       (CONS (SPADCALL |jv| (QREFELT $ 118))
                                             |ind1|)))))
                          ((EQUAL |jt| '|Dep|)
                           (SEQ (LETT |tmp| (CONS |co| |tmp|))
                                (EXIT
                                 (LETT |ind2|
                                       (CONS (SPADCALL |jv| (QREFELT $ 118))
                                             |ind2|)))))
                          ('T
                           (|error|
                            "Only independent and dependent variables allowed")))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |j| (QREFELT $ 13)) (LETT |Eta| NIL)
              (SEQ (LETT |i| NIL) (LETT #9# |ind2|) (LETT |co| NIL)
                   (LETT #8# |tmp|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |co| (CAR #8#)) NIL)
                         (ATOM #9#) (PROGN (LETT |i| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |j| |i| (QREFELT $ 63))) (GO G191)))
                         (SEQ (LETT |Eta| (CONS (|spadConstant| $ 119) |Eta|))
                              (EXIT (LETT |j| (- |j| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |Eta| (CONS |co| |Eta|)) (EXIT (LETT |j| (- |j| 1))))
                   (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#)))) (GO G190)
                   G191 (EXIT NIL))
              (COND
               ((NULL (ZEROP |j|))
                (SEQ (LETT |i| 1) (LETT #7# |j|) G190
                     (COND ((|greater_SI| |i| #7#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |Eta| (CONS (|spadConstant| $ 119) |Eta|))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
              (LETT |isc| NIL) (LETT |ijb| NIL)
              (SEQ (LETT |j| 1) (LETT #6# (QREFELT $ 13)) (LETT |e| NIL)
                   (LETT #5# |Eta|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |e| (CAR #5#)) NIL)
                         (|greater_SI| |j| #6#))
                     (GO G191)))
                   (SEQ (LETT |cond| (SPADCALL |e| (QREFELT $ 120)))
                        (LETT |jv| (|spadConstant| $ 23))
                        (SEQ (LETT |i| NIL) (LETT #4# |ind1|) (LETT |x| NIL)
                             (LETT #3# |Xi|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL)
                                   (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |x| (QREFELT $ 121)))
                                 (SEQ
                                  (LETT |jv|
                                        (SPADCALL
                                         (PROG1 (LETT #2# |j|)
                                           (|check_subtype2| (> #2# 0)
                                                             '(|PositiveInteger|)
                                                             '(|NonNegativeInteger|)
                                                             #2#))
                                         (LIST |i|) (QREFELT $ 122)))
                                  (EXIT
                                   (LETT |cond|
                                         (SPADCALL |cond|
                                                   (SPADCALL |x|
                                                             (SPADCALL |jv|
                                                                       (QREFELT
                                                                        $ 34))
                                                             (QREFELT $ 123))
                                                   (QREFELT $ 124)))))))))
                             (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |jv| (QREFELT $ 125))
                           (|error|
                            "cannot solve invariant surface condition"))
                          ('T
                           (SEQ (LETT |ijb| (CONS |jv| |ijb|))
                                (EXIT (LETT |isc| (CONS |cond| |isc|))))))))
                   (LETT #5# (PROG1 (CDR #5#) (LETT |j| (|inc_SI| |j|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |isc| |sys| (QREFELT $ 126))
                         (SPADCALL |ijb| |sjb| (QREFELT $ 127)) |vf|
                         (QREFELT $ 81)))))) 

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
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SymmetryAnalysis;|) #1#)
                    (LETT #2# T))
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
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 (|devaluate| |#2|))
     (LETT DV$3 (|devaluate| |#3|))
     (LETT |dv$| (LIST '|SymmetryAnalysis| DV$1 DV$2 DV$3))
     (LETT $ (GETREFV 129))
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
                 (LETT #14# NIL)
                 (SEQ (LETT |i| 1) (LETT #13# (QREFELT $ 11)) G190
                      (COND ((|greater_SI| |i| #13#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #12# |i|)
                                  (|check_subtype2| (> #12# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #12#))
                                (QREFELT $ 14))
                               #14#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                (PROGN
                 (LETT #11# NIL)
                 (SEQ (LETT |i| 1) (LETT #10# (QREFELT $ 13)) G190
                      (COND ((|greater_SI| |i| #10#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #9# |i|)
                                  (|check_subtype2| (> #9# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #9#))
                                (QREFELT $ 15))
                               #11#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #11#))))
                (QREFELT $ 17)))
     (QSETREFV $ 21
               (PROGN
                (LETT #8# NIL)
                (SEQ (LETT |jv| NIL) (LETT #7# (QREFELT $ 18)) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |jv| (CAR #7#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #8# (CONS (SPADCALL |jv| (QREFELT $ 20)) #8#))))
                     (LETT #7# (CDR #7#)) (GO G190) G191
                     (EXIT (NREVERSE #8#)))))
     (QSETREFV $ 22 NIL)
     (COND
      ((QEQCAR |#2| 0)
       (COND
        ((SPADCALL (QREFELT $ 11) 1 (QREFELT $ 25))
         (SETELT $ 22
                 (PROGN
                  (LETT #6# NIL)
                  (SEQ (LETT |i| 1) (LETT #5# (QREFELT $ 11)) G190
                       (COND ((|greater_SI| |i| #5#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6#
                               (CONS
                                (SPADCALL (QCDR |#2|)
                                          (LIST (SPADCALL |i| (QREFELT $ 28)))
                                          (QREFELT $ 30))
                                #6#))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                       (EXIT (NREVERSE #6#))))))
        ('T (SETELT $ 22 (LIST (QCDR |#2|))))))
      ('T (SETELT $ 22 (QCDR |#2|))))
     (COND
      ((QEQCAR |#3| 0)
       (COND
        ((SPADCALL (QREFELT $ 13) 1 (QREFELT $ 25))
         (SETELT $ 22
                 (SPADCALL (QREFELT $ 22)
                           (PROGN
                            (LETT #4# NIL)
                            (SEQ (LETT |i| 1) (LETT #3# (QREFELT $ 13)) G190
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
                                          #4#))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT (NREVERSE #4#))))
                           (QREFELT $ 32))))
        ('T
         (SETELT $ 22
                 (SPADCALL (QREFELT $ 22) (LIST (QCDR |#3|))
                           (QREFELT $ 32))))))
      ('T (SETELT $ 22 (SPADCALL (QREFELT $ 22) (QCDR |#3|) (QREFELT $ 32)))))
     (QSETREFV $ 35
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |jv| NIL) (LETT #1# (QREFELT $ 18)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |jv| (QREFELT $ 34)) #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
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
              (44 . |superscript|) (|List| 19) (50 . |append|)
              (|JetBundleExpression| 6) (56 . |coerce|) '|JVars|
              (|JetVectorField| 6 33) (61 . |Zero|) (|Integer|) (65 . |qelt|)
              (|List| $) (71 . |function|) (78 . |diffX|) (83 . *) (89 . +)
              (95 . |diffU|) |SYMANA;ansatz;Jvf;1| (|List| 71) (100 . |tower|)
              (|BasicOperator|) (|Kernel| 33) (105 . |operator|) (110 . |has?|)
              (|Union| (|None|) '"failed") (116 . |property|) (|List| 33)
              (122 . |argument|) (127 . |second|) (132 . |retract|)
              (|JetBundleSymAna| 6 (NRTEVAL (QREFELT $ 7))
                                 (NRTEVAL (QREFELT $ 8)))
              (137 . X) (|Expression| 38) (142 . |coerce|) (147 . >)
              (153 . |coerce|) (158 . |kernels|) (163 . |name|)
              (168 . |position|) (174 . |minIndex|) (179 . >) (185 . U)
              (|Kernel| $) (190 . |coerce|) (195 . |coerce|) (|List| 9)
              (200 . |Pr|) (206 . |eval|) (|JetBundleExpression| 59)
              (213 . |coerce|) |SYMANA;transform;JbeJbe;2| (218 . |leadingDer|)
              |SYMANA;detSys;LLJvfL;5| (|List| 77) |SYMANA;detSys;LL;3|
              |SYMANA;detSys;LJvfL;4| (|Union| $ '"failed") (223 . |solveFor|)
              (229 . =) (|Equation| 33) (235 . =) (241 . |order|) (246 . |max|)
              (252 . |max|) (|Character|) (258 . |max|) (264 . |max|)
              (|Mapping| 27 27 27) (|List| 27) (270 . |reduce|)
              (277 . |prolong|) (283 . |eval|) (|List| (|Equation| $))
              (289 . |eval|) (|SparseMultivariatePolynomial| 61 6)
              (295 . |numerJP|) (|List| 61) (300 . |coefficients|)
              (305 . |append|) (|Mapping| 105 105 105) (|List| 105)
              (311 . |reduce|) (318 . |coerce|) |SYMANA;ncDetSys;LLJvfL;8|
              |SYMANA;ncDetSys;LL;6| |SYMANA;ncDetSys;LJvfL;7|
              (323 . |directions|) (328 . |coefficients|) (333 . |type|)
              (338 . |index|) (343 . |Zero|) (347 . -) (352 . |zero?|)
              (357 . |Pr|) (363 . *) (369 . +) (375 . |one?|) (380 . |append|)
              (386 . |append|)
              (|List|
               (|JetBundleLinearFunction| 59 (|JetBundleXExpression| 59))))
           '#(|transform| 392 |ncDetSys| 397 |linearize| 415 |detSysNS| 420
              |detSys| 431 |ansatz| 449)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 128
                                                 '(0 6 9 10 0 6 9 12 1 6 0 9 14
                                                   1 6 0 9 15 2 16 0 0 0 17 1 6
                                                   19 0 20 0 6 0 23 2 9 24 0 0
                                                   25 1 27 26 0 28 2 19 0 0 29
                                                   30 2 31 0 0 0 32 1 33 0 6 34
                                                   0 36 0 37 2 31 19 0 38 39 3
                                                   33 0 19 40 27 41 1 36 0 9 42
                                                   2 36 0 33 0 43 2 36 0 0 0 44
                                                   1 36 0 9 45 1 33 47 0 48 1
                                                   50 49 0 51 2 49 24 0 19 52 2
                                                   49 53 0 19 54 1 50 55 0 56 1
                                                   55 33 0 57 1 33 38 0 58 1 59
                                                   0 9 60 1 59 61 0 62 2 38 24
                                                   0 0 63 1 6 61 0 64 1 61 47 0
                                                   65 1 49 19 0 66 2 31 38 19 0
                                                   67 1 31 38 0 68 2 27 24 0 0
                                                   69 1 59 0 9 70 1 33 0 71 72
                                                   1 33 61 0 73 2 59 0 9 74 75
                                                   3 61 0 0 47 40 76 1 77 0 61
                                                   78 1 33 6 0 80 2 33 85 0 6
                                                   86 2 33 24 0 0 87 2 88 0 33
                                                   33 89 1 33 27 0 90 2 19 0 0
                                                   0 91 2 6 0 0 0 92 2 93 0 0 0
                                                   94 2 27 0 0 0 95 3 97 27 96
                                                   0 27 98 2 36 0 0 27 99 2 36
                                                   33 0 33 100 2 33 0 0 101 102
                                                   1 33 103 0 104 1 103 105 0
                                                   106 2 105 0 0 0 107 3 109
                                                   105 108 0 105 110 1 33 0 61
                                                   111 1 36 16 0 115 1 36 55 0
                                                   116 1 6 19 0 117 1 6 9 0 118
                                                   0 33 0 119 1 33 0 0 120 1 33
                                                   24 0 121 2 6 0 9 74 122 2 33
                                                   0 0 0 123 2 33 0 0 0 124 1 6
                                                   24 0 125 2 55 0 0 0 126 2 16
                                                   0 0 0 127 1 0 77 33 79 2 0
                                                   55 55 36 114 1 0 82 55 113 3
                                                   0 55 55 16 36 112 1 0 128 82
                                                   1 2 0 55 55 36 1 1 0 82 55 1
                                                   2 0 55 55 36 84 1 0 82 55 83
                                                   3 0 55 55 16 36 81 0 0 36
                                                   46)))))
           '|lookupComplete|)) 
