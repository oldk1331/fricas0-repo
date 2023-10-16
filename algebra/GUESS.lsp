
(SDEFUN |GUESS;guessExpRat;LL;1| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 15))) 

(SDEFUN |GUESS;guessExpRat;LLL;2|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| |options| (QREFELT $ 15))) 

(SDEFUN |GUESS;guessBinRat;LL;3| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 18))) 

(SDEFUN |GUESS;guessBinRat;LLL;4|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| |options| (QREFELT $ 18))) 

(SDEFUN |GUESS;guessExpRat;SM;5|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPADCALL |q| (QREFELT $ 23))) 

(SDEFUN |GUESS;guessBinRat;SM;6|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPADCALL |q| (QREFELT $ 25))) 

(SDEFUN |GUESS;getVariables| ((|lF| |List| F) ($ |List| EXPRR))
        (SPROG
         ((|lvar| (|List| (|Symbol|))) (|ll| (|List| (|List| (|Symbol|)))))
         (SEQ (LETT |lvar| NIL)
              (COND
               ((|HasSignature| (QREFELT $ 7)
                                (LIST '|variables|
                                      (LIST (LIST '|List| '(|Symbol|))
                                            (|devaluate| (QREFELT $ 7)))))
                (SEQ
                 (COND
                  ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
                   (LETT |ll| (SPADCALL (ELT $ 28) |lF| (QREFELT $ 33))))
                  ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
                   (LETT |ll|
                         (SPADCALL (CONS #'|GUESS;getVariables!0| $) |lF|
                                   (QREFELT $ 40))))
                  (#1='T
                   (|error|
                    (SPADCALL "Guess: type parameter F should be either"
                              " equal to S or equal to Fraction S"
                              (QREFELT $ 42)))))
                 (EXIT
                  (LETT |lvar| (SPADCALL (ELT $ 37) |ll| (QREFELT $ 44))))))
               (#1# (LETT |lvar| NIL)))
              (EXIT (SPADCALL (ELT $ 45) |lvar| (QREFELT $ 48)))))) 

(SDEFUN |GUESS;getVariables!0| ((|g| NIL) ($ NIL))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 35)) (QREFELT $ 28))
                  (SPADCALL (SPADCALL |g| (QREFELT $ 36)) (QREFELT $ 28))
                  (QREFELT $ 37))) 

(SDEFUN |GUESS;SUPS2SUPF|
        ((|p| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| F))
        (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SPADCALL (ELT $ 49) |p| (QREFELT $ 54)))
              ('T
               (|error|
                (SPADCALL "Guess: type parameter F should be either"
                          " equal to S or equal to Fraction S"
                          (QREFELT $ 42)))))) 

(SDEFUN |GUESS;FilteredPartitionStream|
        ((|options| |List| (|GuessOption|)) ($ |Stream| (|List| (|Integer|))))
        (SPROG
         ((|s| (|Stream| (|List| (|Integer|))))
          (|s3| (|Stream| (|List| (|Integer|))))
          (|s2| (|Stream| (|Stream| (|List| (|Integer|)))))
          (|s1| (|Stream| (|Integer|)))
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|Somo| (|Union| (|PositiveInteger|) (|Boolean|)))
          (|maxP| (|Union| (|PositiveInteger|) "arbitrary"))
          (|homo| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ (LETT |maxP| (SPADCALL |options| (QREFELT $ 57)))
              (LETT |homo| (SPADCALL |options| (QREFELT $ 59)))
              (COND
               ((QEQCAR |homo| 1)
                (COND
                 ((QCDR |homo|)
                  (EXIT
                   (|error|
                    (SPADCALL "Guess: internal error - homogeneous should not"
                              " be true in FilteredPartitionStream"
                              (QREFELT $ 42)))))))
               (#1='T (LETT |maxP| (CONS 0 (QCDR |homo|)))))
              (LETT |maxD| (SPADCALL |options| (QREFELT $ 61)))
              (LETT |Somo| (SPADCALL |options| (QREFELT $ 62)))
              (COND
               ((QEQCAR |Somo| 1)
                (COND
                 ((QCDR |Somo|)
                  (EXIT
                   (|error|
                    (SPADCALL "Guess: internal error - Somos should not be"
                              " true in FilteredPartitionStream"
                              (QREFELT $ 42)))))))
               ((QEQCAR |maxD| 0)
                (LETT |maxD| (CONS 0 (MIN (QCDR |maxD|) (QCDR |Somo|)))))
               (#1# (LETT |maxD| (CONS 0 (QCDR |Somo|)))))
              (COND
               ((QEQCAR |maxD| 0)
                (COND
                 ((QEQCAR |maxP| 0)
                  (LETT |s|
                        (SPADCALL (+ (QCDR |maxD|) 1) (QCDR |maxP|)
                                  (QREFELT $ 68))))
                 (#1#
                  (SEQ (LETT |s1| (SPADCALL (ELT $ 69) 1 (QREFELT $ 72)))
                       (LETT |s2|
                             (COND
                              ((QEQCAR |maxD| 0)
                               (SPADCALL
                                (CONS #'|GUESS;FilteredPartitionStream!0|
                                      (VECTOR $ |maxD|))
                                |s1| (QREFELT $ 81)))
                              ((QEQCAR |maxP| 0)
                               (SPADCALL
                                (CONS #'|GUESS;FilteredPartitionStream!1|
                                      (VECTOR $ |maxP|))
                                |s1| (QREFELT $ 81)))
                              (#1# (SPADCALL (ELT $ 82) |s1| (QREFELT $ 81)))))
                       (LETT |s3| (SPADCALL |s2| (QREFELT $ 84)))
                       (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 86))))))))
               (#1#
                (SEQ (LETT |s1| (SPADCALL (ELT $ 69) 1 (QREFELT $ 72)))
                     (LETT |s2|
                           (COND
                            ((QEQCAR |maxD| 0)
                             (SPADCALL
                              (CONS #'|GUESS;FilteredPartitionStream!2|
                                    (VECTOR $ |maxD|))
                              |s1| (QREFELT $ 81)))
                            ((QEQCAR |maxP| 0)
                             (SPADCALL
                              (CONS #'|GUESS;FilteredPartitionStream!3|
                                    (VECTOR $ |maxP|))
                              |s1| (QREFELT $ 81)))
                            (#1# (SPADCALL (ELT $ 82) |s1| (QREFELT $ 81)))))
                     (LETT |s3| (SPADCALL |s2| (QREFELT $ 84)))
                     (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 86)))))))
              (LETT |s| (SPADCALL |s| (QREFELT $ 87)))
              (COND
               ((QEQCAR |homo| 0)
                (LETT |s|
                      (SPADCALL
                       (CONS #'|GUESS;FilteredPartitionStream!4|
                             (VECTOR |maxP| $))
                       |s| (QREFELT $ 92)))))
              (COND
               ((QEQCAR |Somo| 0)
                (LETT |s|
                      (SPADCALL
                       (CONS #'|GUESS;FilteredPartitionStream!5|
                             (VECTOR |Somo| $))
                       |s| (QREFELT $ 92)))))
              (EXIT |s|)))) 

(SDEFUN |GUESS;FilteredPartitionStream!5| ((|z1| NIL) ($$ NIL))
        (PROG ($ |Somo|)
          (LETT $ (QREFELT $$ 1))
          (LETT |Somo| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (ELT $ 94) |z1| (|spadConstant| $ 95) (QREFELT $ 97))
             (SPADCALL (QCDR |Somo|) (SPADCALL |z1| (QREFELT $ 88))
                       (QREFELT $ 76))
             (QREFELT $ 98)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!4| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxP|)
          (LETT $ (QREFELT $$ 1))
          (LETT |maxP| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G244 NIL))
                   (SPADCALL (SPADCALL |z1| (QREFELT $ 88))
                             (PROG2 (LETT #1# |maxP|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|PositiveInteger|)
                                               (|Union| (|PositiveInteger|)
                                                        "arbitrary")
                                               #1#))
                             (QREFELT $ 90))))))) 

(SDEFUN |GUESS;FilteredPartitionStream!3| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!2| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| $ 74) (QREFELT $ 76)) |z1|
             |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!1| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| $ 74) (QREFELT $ 76)) |z1|
             |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;termAsEXPRR|
        ((|f| EXPRR) (|xx| |Symbol|) (|partition| |List| (|Integer|))
         (DX |Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|))
         (D1X |Mapping| EXPRR (|Symbol|)) ($ EXPRR))
        (SPROG
         ((|fl| (|List| EXPRR)) (#1=#:G282 NIL) (#2=#:G281 NIL) (#3=#:G290 NIL)
          (|part| NIL) (#4=#:G289 NIL) (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) (SPADCALL |xx| D1X))
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |part| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |f| |xx|
                                                      (PROG1
                                                          (LETT #2#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                                      DX)
                                            (PROG1
                                                (LETT #1#
                                                      (SPADCALL |part|
                                                                (QREFELT $
                                                                         102)))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 103))
                                           #4#))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (EXIT (SPADCALL (ELT $ 104) |fl| (QREFELT $ 106))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|degreeLoss| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|fl| (|List| (|U32Vector|))) (#1=#:G294 NIL) (#2=#:G293 NIL)
          (#3=#:G303 NIL) (|part| NIL) (#4=#:G302 NIL)
          (|ll| (|List| (|List| (|Integer|)))) (|d| (|NonNegativeInteger|))
          (#5=#:G292 NIL) (#6=#:G301 NIL) (|i| NIL) (#7=#:G300 NIL))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (CONS 1
                   (PROGN
                    (LETT #7# NIL)
                    (SEQ (LETT |i| (+ |degreeLoss| 2))
                         (LETT #6# (QV_LEN_U32 |f|)) G190
                         (COND ((> |i| #6#) (GO G191)))
                         (SEQ (EXIT (LETT #7# (CONS 0 #7#))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT (NREVERSE #7#)))))
             (QREFELT $ 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #5# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1))
                     (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #5#)))
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
             (LETT |fl|
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |part| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL |f|
                                             (PROG1
                                                 (LETT #2#
                                                       (- (|SPADfirst| |part|)
                                                          1))
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             |prime| (QREFELT $ 110))
                                   (PROG1
                                       (LETT #1#
                                             (SPADCALL |part| (QREFELT $ 102)))
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#))
                                   |d| |prime| (QREFELT $ 111))
                                  #4#))))
                         (LETT #3# (CDR #3#)) (GO G190) G191
                         (EXIT (NREVERSE #4#)))))
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 115))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2))
          (LETT |prime| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 112)))))) 

(SDEFUN |GUESS;termAsU32VectorShift|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|degreeLoss| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G321 NIL) (|e| NIL) (#2=#:G320 NIL) (|i| NIL)
          (|r| (|U32Vector|)) (|fl| (|List| (|U32Vector|))) (#3=#:G306 NIL)
          (#4=#:G319 NIL) (|j| NIL) (#5=#:G318 NIL) (#6=#:G317 NIL)
          (|part| NIL) (#7=#:G316 NIL) (|ll| (|List| (|List| (|Integer|))))
          (|d| (|NonNegativeInteger|)) (#8=#:G305 NIL) (#9=#:G315 NIL)
          (#10=#:G314 NIL))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (PROGN
              (LETT #10# NIL)
              (SEQ (LETT |i| (+ |degreeLoss| 1)) (LETT #9# (QV_LEN_U32 |f|))
                   G190 (COND ((> |i| #9#) (GO G191)))
                   (SEQ (EXIT (LETT #10# (CONS 1 #10#)))) (LETT |i| (+ |i| 1))
                   (GO G190) G191 (EXIT (NREVERSE #10#))))
             (QREFELT $ 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #8# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1))
                     (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #8#)))
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
             (LETT |fl|
                   (PROGN
                    (LETT #7# NIL)
                    (SEQ (LETT |part| NIL) (LETT #6# |ll|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |part| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #7#
                                 (CONS
                                  (SPADCALL
                                   (PROGN
                                    (LETT #5# NIL)
                                    (SEQ (LETT |j| (- (|SPADfirst| |part|) 1))
                                         (LETT #4#
                                               (+ (- (|SPADfirst| |part|) 1)
                                                  |d|))
                                         G190 (COND ((> |j| #4#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #5#
                                                 (CONS
                                                  (REM
                                                   (EXPT (ELT_U32 |f| |j|)
                                                         (PROG1
                                                             (LETT #3#
                                                                   (SPADCALL
                                                                    |part|
                                                                    (QREFELT $
                                                                             102)))
                                                           (|check_subtype2|
                                                            (> #3# 0)
                                                            '(|PositiveInteger|)
                                                            '(|Integer|) #3#)))
                                                   |prime|)
                                                  #5#))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT (NREVERSE #5#))))
                                   (QREFELT $ 108))
                                  #7#))))
                         (LETT #6# (CDR #6#)) (GO G190) G191
                         (EXIT (NREVERSE #7#)))))
             (LETT |r| (GETREFV_U32 (+ |d| 1) 0))
             (SPADCALL |r| (|SPADfirst| |fl|) (+ |d| 1) (QREFELT $ 117))
             (SEQ (LETT |i| 0) (LETT #2# |d|) G190
                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |e| NIL) (LETT #1# (CDR |fl|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT_U32 |r| |i|
                                       (QSMULMOD32 (ELT_U32 |r| |i|)
                                                   (ELT_U32 |e| |i|)
                                                   |prime|))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
             (EXIT |r|))))))) 

(SDEFUN |GUESS;termAsUFPSF|
        ((|f| |UnivariateFormalPowerSeries| F) (|partition| |List| (|Integer|))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG
         ((|fl| (|List| (|UnivariateFormalPowerSeries| F))) (#1=#:G330 NIL)
          (#2=#:G329 NIL) (#3=#:G338 NIL) (|part| NIL) (#4=#:G337 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |part| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |f|
                                                      (PROG1
                                                          (LETT #2#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                                      DS)
                                            (PROG1
                                                (LETT #1#
                                                      (SPADCALL |part|
                                                                (QREFELT $
                                                                         102)))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 119))
                                           #4#))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (EXIT (SPADCALL (ELT $ 120) |fl| (QREFELT $ 123))))))))) 

(SDEFUN |GUESS;termAsUFPSF2|
        ((|f| |UnivariateFormalPowerSeries| F) (|partition| |List| (|Integer|))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG
         ((|fl| (|List| (|UnivariateFormalPowerSeries| F))) (#1=#:G342 NIL)
          (#2=#:G350 NIL) (|part| NIL) (#3=#:G349 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |part| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |part| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (SPADCALL
                                            (CONS #'|GUESS;termAsUFPSF2!0|
                                                  (VECTOR $ |part|))
                                            (SPADCALL |f|
                                                      (PROG1
                                                          (LETT #1#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                                      DS)
                                            (QREFELT $ 126))
                                           #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#)))))
                      (EXIT (SPADCALL (ELT $ 128) |fl| (QREFELT $ 123))))))))) 

(SDEFUN |GUESS;termAsUFPSF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G340 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #1# (SPADCALL |part| (QREFELT $ 102)))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT $ 124))))))) 

(SDEFUN |GUESS;termAsUFPSSUPF2|
        ((|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|partition| |List| (|Integer|))
         (DSF |Mapping|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|NonNegativeInteger|))
         (D1F |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG
         ((|fl|
           (|List|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#1=#:G353 NIL) (#2=#:G361 NIL) (|part| NIL) (#3=#:G360 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1F)
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |part| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |part| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (SPADCALL
                                            (CONS #'|GUESS;termAsUFPSSUPF2!0|
                                                  (VECTOR $ |part|))
                                            (SPADCALL |f|
                                                      (PROG1
                                                          (LETT #1#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                                      DSF)
                                            (QREFELT $ 133))
                                           #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#)))))
                      (EXIT (SPADCALL (ELT $ 135) |fl| (QREFELT $ 138))))))))) 

(SDEFUN |GUESS;termAsUFPSSUPF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G351 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #1# (SPADCALL |part| (QREFELT $ 102)))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT $ 130))))))) 

(SDEFUN |GUESS;ADEguessStream|
        ((|f| |UnivariateFormalPowerSeries| F)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |Stream| (|UnivariateFormalPowerSeries| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;ADEguessStream!0| (VECTOR $ D1 DS |f|))
                         |partitions| (QREFELT $ 142)))) 

(SDEFUN |GUESS;ADEguessStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| DS D1 $)
          (LETT |f| (QREFELT $$ 3))
          (LETT DS (QREFELT $$ 2))
          (LETT D1 (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;termAsUFPSF| |f| |z1| DS D1 $))))) 

(SDEFUN |GUESS;ADEguessStream2|
        ((|f| |UnivariateFormalPowerSeries| F)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |Stream| (|UnivariateFormalPowerSeries| F)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GUESS;ADEguessStream2!0| (VECTOR $ D1 DS |f|))
                |partitions| (QREFELT $ 142)))) 

(SDEFUN |GUESS;ADEguessStream2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| DS D1 $)
          (LETT |f| (QREFELT $$ 3))
          (LETT DS (QREFELT $$ 2))
          (LETT D1 (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;termAsUFPSF2| |f| |z1| DS D1 $))))) 

(SDEFUN |GUESS;guessModGenCached|
        ((|cache| |PrimitiveArray| (|U32Vector|)) (|np| |NonNegativeInteger|)
         (|sigma| |Integer|) (|addOne| |Boolean|) (|maxD| |NonNegativeInteger|)
         (|prodl| |List| (|List| (|Integer|))) (|terml| |List| (|Integer|))
         (|prime| |Integer|) ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G383 NIL) (|i| NIL) (#2=#:G384 NIL) (|r| NIL)
          (|res| (|Vector| (|U32Vector|))) (#3=#:G381 NIL) (#4=#:G382 NIL)
          (|res1| (|U32Vector|)) (#5=#:G372 NIL) (|nt| (|NonNegativeInteger|))
          (#6=#:G379 NIL) (#7=#:G380 NIL) (|pp| NIL))
         (SEQ
          (SEQ (LETT |pp| NIL) (LETT #7# |prodl|) (LETT |i| (+ |maxD| 1))
               (LETT #6# (+ |maxD| |np|)) G190
               (COND
                ((OR (> |i| #6#) (ATOM #7#) (PROGN (LETT |pp| (CAR #7#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |cache| |i|
                            (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                      (QAREF1 |cache|
                                              (SPADCALL |pp| (QREFELT $ 102)))
                                      (- |sigma| 1) |prime| (QREFELT $ 112)))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#)))) (GO G190) G191
               (EXIT NIL))
          (LETT |nt| (LENGTH |terml|))
          (COND
           (|addOne|
            (SEQ (LETT |res| (MAKEARR1 (+ |nt| 1) (GETREFV_U32 0 0)))
                 (LETT |res1|
                       (GETREFV_U32
                        (PROG1 (LETT #5# |sigma|)
                          (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #5#))
                        0))
                 (SETELT_U32 |res1| 0 1)
                 (SPADCALL |res| 1 |res1| (QREFELT $ 146))
                 (EXIT
                  (SEQ (LETT |r| NIL) (LETT #4# |terml|) (LETT |i| 2)
                       (LETT #3# (+ |nt| 1)) G190
                       (COND
                        ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                             (PROGN (LETT |r| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 146))))
                       (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#))))
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (SEQ (LETT |res| (MAKEARR1 |nt| (GETREFV_U32 0 0)))
                 (EXIT
                  (SEQ (LETT |r| NIL) (LETT #2# |terml|) (LETT |i| 1)
                       (LETT #1# |nt|) G190
                       (COND
                        ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                             (PROGN (LETT |r| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 146))))
                       (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT |res|)))) 

(SDEFUN |GUESS;DEPguessModGenCached|
        ((|fl| |List| (|U32Vector|)) (|addOne| |Boolean|)
         (|maxD| |NonNegativeInteger|) (|prodl| |List| (|List| (|Integer|)))
         (|terml| |List| (|Integer|)) (|prime| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G389 NIL) (|i| NIL) (#2=#:G390 NIL) (|f| (|U32Vector|))
          (|cache| (|PrimitiveArray| (|U32Vector|)))
          (|np| (|NonNegativeInteger|)) (|sigma| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((< (LENGTH |fl|) (+ |maxD| 1))
            (|error| "DEPguessModGenCached: #fl < maxD + 1"))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |fl|)) (LETT |sigma| (QV_LEN_U32 |f|))
                 (LETT |np| (LENGTH |prodl|))
                 (LETT |cache|
                       (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0)))
                 (SEQ (LETT |f| NIL) (LETT #2# |fl|) (LETT |i| 0)
                      (LETT #1# |maxD|) G190
                      (COND
                       ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                            (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (QSETAREF1 |cache| |i| |f|)))
                      (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne|
                   |maxD| |prodl| |terml| |prime| $)))))))) 

(SDEFUN |GUESS;ADEguessModGenCached|
        ((|fl| |List| (|U32Vector|)) (|addOne| |Boolean|)
         (|maxD| |NonNegativeInteger|) (|prodl| |List| (|List| (|Integer|)))
         (|terml| |List| (|Integer|)) (|prime| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G395 NIL) (|i| NIL) (|cache| (|PrimitiveArray| (|U32Vector|)))
          (|np| (|NonNegativeInteger|)) (|sigma| (|Integer|))
          (|f| (|U32Vector|)))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 147))
            (|error| "ADEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |fl|))
                 (LETT |sigma| (- (QV_LEN_U32 |f|) |maxD|))
                 (LETT |np| (LENGTH |prodl|))
                 (LETT |cache|
                       (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0)))
                 (QSETAREF1 |cache| 0 |f|)
                 (SEQ (LETT |i| 1) (LETT #1# |maxD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |cache| |i|
                                   (SPADCALL (QAREF1 |cache| (- |i| 1)) |prime|
                                             (QREFELT $ 148)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne|
                   |maxD| |prodl| |terml| |prime| $)))))))) 

(SDEFUN |GUESS;ADEtestGenCached|
        ((|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|addOne| |Boolean|) (|maxD| |NonNegativeInteger|)
         (|prodl| |List| (|List| (|Integer|))) (|terml| |List| (|Integer|))
         (DSF |Mapping|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|NonNegativeInteger|))
         (D1F |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |Vector|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G409 NIL) (|i| NIL) (#2=#:G410 NIL) (|r| NIL)
          (|res|
           (|Vector|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#3=#:G407 NIL) (#4=#:G408 NIL) (|nt| (|NonNegativeInteger|))
          (#5=#:G405 NIL) (#6=#:G406 NIL) (|pp| NIL) (#7=#:G404 NIL)
          (|cache|
           (|PrimitiveArray|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|np| (|NonNegativeInteger|)))
         (SEQ (LETT |np| (LENGTH |prodl|))
              (LETT |cache|
                    (MAKEARR1 (+ (+ |maxD| 1) |np|) (|spadConstant| $ 149)))
              (QSETAREF1 |cache| 0 |f|)
              (SEQ (LETT |i| 1) (LETT #7# |maxD|) G190
                   (COND ((|greater_SI| |i| #7#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| 0) |i| DSF))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |pp| NIL) (LETT #6# |prodl|) (LETT |i| (+ |maxD| 1))
                   (LETT #5# (+ |maxD| |np|)) G190
                   (COND
                    ((OR (> |i| #5#) (ATOM #6#)
                         (PROGN (LETT |pp| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                          (QAREF1 |cache|
                                                  (SPADCALL |pp|
                                                            (QREFELT $ 102)))
                                          (QREFELT $ 150)))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |nt| (LENGTH |terml|))
              (COND
               (|addOne|
                (SEQ (LETT |res| (MAKEARR1 (+ |nt| 1) (|spadConstant| $ 149)))
                     (SPADCALL |res| 1 D1F (QREFELT $ 152))
                     (EXIT
                      (SEQ (LETT |r| NIL) (LETT #4# |terml|) (LETT |i| 2)
                           (LETT #3# (+ |nt| 1)) G190
                           (COND
                            ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                                 (PROGN (LETT |r| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                       (QREFELT $ 152))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#))))
                           (GO G190) G191 (EXIT NIL)))))
               ('T
                (SEQ (LETT |res| (MAKEARR1 |nt| (|spadConstant| $ 149)))
                     (EXIT
                      (SEQ (LETT |r| NIL) (LETT #2# |terml|) (LETT |i| 1)
                           (LETT #1# |nt|) G190
                           (COND
                            ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                                 (PROGN (LETT |r| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                       (QREFELT $ 152))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))))))
              (EXIT |res|)))) 

(SDEFUN |GUESS;multiplyExponents|
        ((|f| |U32Vector|) (|n| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G414 NIL) (|i| NIL) (|deg| (|Integer|)) (|f0| (|U32Vector|))
          (|nn| (|NonNegativeInteger|)))
         (SEQ (LETT |nn| (QV_LEN_U32 |f|)) (LETT |f0| (GETREFV_U32 |nn| 0))
              (LETT |deg| (- |nn| 1))
              (SEQ (LETT |i| 0) (LETT #1# |deg|) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#)
                         (NULL (SPADCALL (* |n| |i|) |deg| (QREFELT $ 153))))
                     (GO G191)))
                   (SEQ (EXIT (SETELT_U32 |f0| (* |n| |i|) (ELT_U32 |f| |i|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |f0|)))) 

(SDEFUN |GUESS;FEguessModGenCached|
        ((|fl| |List| (|U32Vector|)) (|addOne| |Boolean|)
         (|maxD| |NonNegativeInteger|) (|prodl| |List| (|List| (|Integer|)))
         (|terml| |List| (|Integer|)) (|prime| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G419 NIL) (|i| NIL) (|cache| (|PrimitiveArray| (|U32Vector|)))
          (|np| (|NonNegativeInteger|)) (|sigma| (|NonNegativeInteger|))
          (|f| (|U32Vector|)))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 147))
            (|error| "FEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |fl|)) (LETT |sigma| (QV_LEN_U32 |f|))
                 (LETT |np| (LENGTH |prodl|))
                 (LETT |cache|
                       (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0)))
                 (QSETAREF1 |cache| 0 |f|)
                 (SEQ (LETT |i| 1) (LETT #1# |maxD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |cache| |i|
                                   (|GUESS;multiplyExponents|
                                    (QAREF1 |cache| 0) (+ |i| 1) $))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne|
                   |maxD| |prodl| |terml| |prime| $)))))))) 

(SDEFUN |GUESS;optimiseFactor|
        ((|partition| |Partition|) (|partitions| |List| (|Partition|))
         ($ |Union| (|List| (|Integer|)) "failed"))
        (SPROG
         ((#1=#:G439 NIL) (|j| (|Integer|))
          (|r| (|Union| (|Partition|) "failed")) (#2=#:G440 NIL) (|p| NIL)
          (#3=#:G441 NIL) (|i| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |partitions|))
                (SEQ (LETT |i| 1) (LETT #3# |n|) (LETT |p| NIL)
                     (LETT #2# |partitions|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL)
                           (|greater_SI| |i| #3#))
                       (GO G191)))
                     (SEQ (LETT |r| (SPADCALL |partition| |p| (QREFELT $ 155)))
                          (EXIT
                           (COND
                            ((QEQCAR |r| 0)
                             (SEQ
                              (LETT |j|
                                    (SPADCALL (QCDR |r|) |partitions|
                                              (QREFELT $ 157)))
                              (EXIT
                               (COND
                                ((SPADCALL |j| 0 (QREFELT $ 158))
                                 (PROGN
                                  (LETT #1# (CONS 0 (LIST |i| |j|)))
                                  (GO #4=#:G438))))))))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |GUESS;optimiseProducts1|
        ((|p| |Partition|) (|prods0| |Reference| (|List| (|List| (|Integer|))))
         (|parts0| |Reference| (|List| (|Partition|))) ($ |Void|))
        (SPROG
         ((|lp0| (|NonNegativeInteger|))
          (|r| (|Union| (|List| (|Integer|)) "failed")))
         (SEQ
          (SEQ
           (LETT |r|
                 (|GUESS;optimiseFactor| |p|
                  (SPADCALL |parts0| (QREFELT $ 160)) $))
           (EXIT
            (COND
             ((QEQCAR |r| 1)
              (SEQ
               (|GUESS;optimiseProducts1|
                (SPADCALL (CDR (SPADCALL |p| (QREFELT $ 161))) (QREFELT $ 162))
                |prods0| |parts0| $)
               (EXIT
                (LETT |r|
                      (|GUESS;optimiseFactor| |p|
                       (SPADCALL |parts0| (QREFELT $ 160)) $))))))))
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (|error| "Internal error: failed adding intermediate partition"))
            ('T
             (SEQ (LETT |lp0| (LENGTH (SPADCALL |parts0| (QREFELT $ 160))))
                  (SPADCALL |prods0|
                            (CONS
                             (LIST (- |lp0| (|SPADfirst| (QCDR |r|)))
                                   (- |lp0|
                                      (SPADCALL (QCDR |r|) (QREFELT $ 102))))
                             (SPADCALL |prods0| (QREFELT $ 164)))
                            (QREFELT $ 165))
                  (EXIT
                   (SPADCALL |parts0|
                             (CONS |p| (SPADCALL |parts0| (QREFELT $ 160)))
                             (QREFELT $ 166)))))))))) 

(SDEFUN |GUESS;optimiseProducts|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Record| (|:| |addOne| (|Boolean|))
          (|:| |maxDiff| (|NonNegativeInteger|))
          (|:| |prods| (|List| (|List| (|Integer|))))
          (|:| |terms| (|List| (|Integer|)))))
        (SPROG
         ((#1=#:G457 NIL) (|terms0| (|List| (|Integer|))) (#2=#:G462 NIL)
          (|p| NIL) (|parts0| (|Reference| (|List| (|Partition|)))) (|i| NIL)
          (#3=#:G461 NIL)
          (|prods0| (|Reference| (|List| (|List| (|Integer|)))))
          (|maxD0| (|Integer|)) (#4=#:G460 NIL) (|addOne0| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ (LETT |addOne0| (NULL (|SPADfirst| |partitions|)))
                (COND
                 (|addOne0|
                  (SEQ (LETT |partitions| (CDR |partitions|))
                       (EXIT
                        (COND
                         ((NULL |partitions|)
                          (PROGN
                           (LETT #4# (VECTOR |addOne0| 0 NIL NIL))
                           (GO #5=#:G459))))))))
                (LETT |maxD0|
                      (SPADCALL (ELT $ 167)
                                (SPADCALL (ELT $ 168) |partitions|
                                          (QREFELT $ 171))
                                (QREFELT $ 172)))
                (LETT |prods0| (SPADCALL NIL (QREFELT $ 173)))
                (LETT |terms0| NIL)
                (LETT |parts0|
                      (SPADCALL
                       (PROGN
                        (LETT #3# NIL)
                        (SEQ (LETT |i| |maxD0|) G190
                             (COND ((< |i| 1) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS
                                      (SPADCALL (LIST |i|) (QREFELT $ 162))
                                      #3#))))
                             (LETT |i| (+ |i| -1)) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       (QREFELT $ 174)))
                (SEQ (LETT |p| NIL) (LETT #2# |partitions|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |p|) 1)
                         (LETT |terms0|
                               (CONS (- (|SPADfirst| |p|) 1) |terms0|)))
                        ('T
                         (SEQ
                          (|GUESS;optimiseProducts1|
                           (SPADCALL |p| (QREFELT $ 162)) |prods0| |parts0| $)
                          (EXIT
                           (LETT |terms0|
                                 (CONS
                                  (-
                                   (LENGTH (SPADCALL |parts0| (QREFELT $ 160)))
                                   1)
                                  |terms0|))))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (VECTOR |addOne0|
                         (PROG1 (LETT #1# (- |maxD0| 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (NREVERSE (SPADCALL |prods0| (QREFELT $ 164)))
                         (NREVERSE |terms0|)))))
          #5# (EXIT #4#)))) 

(SDEFUN |GUESS;ADEguessModOptimisedGen|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| $))
              (EXIT
               (CONS #'|GUESS;ADEguessModOptimisedGen!0| (VECTOR $ |r|)))))) 

(SDEFUN |GUESS;ADEguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) |prime| $))))) 

(SDEFUN |GUESS;FEguessModOptimisedGen|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| $))
              (EXIT (CONS #'|GUESS;FEguessModOptimisedGen!0| (VECTOR $ |r|)))))) 

(SDEFUN |GUESS;FEguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;FEguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) |prime| $))))) 

(SDEFUN |GUESS;DEPguessModOptimisedGen|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| $))
              (EXIT
               (CONS #'|GUESS;DEPguessModOptimisedGen!0| (VECTOR $ |r|)))))) 

(SDEFUN |GUESS;DEPguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;DEPguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) |prime| $))))) 

(SDEFUN |GUESS;ADEguessModGen2|
        ((|partitions| |List| (|List| (|Integer|))) (|d| |NonNegativeInteger|)
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEguessModGen2!0|
                      (VECTOR |d| |partitions| $))))) 

(SDEFUN |GUESS;ADEguessModGen2!0| ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG ($ |partitions| |d|)
          (LETT $ (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT |d| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G486 NIL) (|p| NIL) (#2=#:G485 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 175))
                                (|spadConstant| $ 176) (QREFELT $ 147))
                      (|error| "ADEguessModGen2, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 177)))
                           (EXIT
                            (SPADCALL
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |p| NIL) (LETT #1# |partitions|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |p| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|GUESS;termAsU32VectorShift| |f|
                                             |p| |prime| |d| $)
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 178)))))))))))) 

(SDEFUN |GUESS;ADEtestOptimisedGen|
        ((|partitions| |List| (|List| (|Integer|)))
         (DSF |Mapping|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|NonNegativeInteger|))
         (D1F |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |Mapping|
          (|Vector|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| $))
              (EXIT
               (CONS #'|GUESS;ADEtestOptimisedGen!0| (VECTOR $ D1F DSF |r|)))))) 

(SDEFUN |GUESS;ADEtestOptimisedGen!0| ((|f| NIL) ($$ NIL))
        (PROG (|r| DSF D1F $)
          (LETT |r| (QREFELT $$ 3))
          (LETT DSF (QREFELT $$ 2))
          (LETT D1F (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEtestGenCached| |f| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) DSF D1F $))))) 

(SDEFUN |GUESS;ADEtestGen2|
        ((|partitions| |List| (|List| (|Integer|)))
         (DSF |Mapping|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|NonNegativeInteger|))
         (D1F |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |Mapping|
          (|Vector|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEtestGen2!0|
                      (VECTOR $ D1F DSF |partitions|))))) 

(SDEFUN |GUESS;ADEtestGen2!0| ((|f| NIL) ($$ NIL))
        (PROG (|partitions| DSF D1F $)
          (LETT |partitions| (QREFELT $$ 3))
          (LETT DSF (QREFELT $$ 2))
          (LETT D1F (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G499 NIL) (|p| NIL) (#2=#:G498 NIL))
                   (SEQ
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |p| NIL) (LETT #1# |partitions|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|GUESS;termAsUFPSSUPF2| |f| |p| DSF D1F $)
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 179)))))))) 

(SDEFUN |GUESS;ADEEXPRRStream|
        ((|f| EXPRR) (|xx| |Symbol|)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DX |Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|))
         (D1X |Mapping| EXPRR (|Symbol|)) ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GUESS;ADEEXPRRStream!0| (VECTOR $ D1X DX |xx| |f|))
                |partitions| (QREFELT $ 183)))) 

(SDEFUN |GUESS;ADEEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| |xx| DX D1X $)
          (LETT |f| (QREFELT $$ 4))
          (LETT |xx| (QREFELT $$ 3))
          (LETT DX (QREFELT $$ 2))
          (LETT D1X (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;termAsEXPRR| |f| |xx| |z1| DX D1X $))))) 

(SDEFUN |GUESS;ADEdegreeStream|
        ((|partitions| |Stream| (|List| (|Integer|)))
         ($ |Stream| (|NonNegativeInteger|)))
        (SPADCALL 0 (CONS #'|GUESS;ADEdegreeStream!0| $) |partitions|
                  (QREFELT $ 190))) 

(SDEFUN |GUESS;ADEdegreeStream!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPROG ((#1=#:G507 NIL))
               (SPADCALL
                (COND ((SPADCALL |z1| (QREFELT $ 184)) (|spadConstant| $ 95))
                      ('T
                       (PROG1
                           (LETT #1#
                                 (SPADCALL (SPADCALL |z1| (QREFELT $ 168))
                                           (|spadConstant| $ 176)
                                           (QREFELT $ 185)))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))))
                |z2| (QREFELT $ 186)))) 

(SDEFUN |GUESS;diffDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| |x| |n| (QREFELT $ 191))) 

(SDEFUN |GUESS;diffDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| |n| (QREFELT $ 192))) 

(SDEFUN |GUESS;diffDSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (COND
         ((|HasSignature|
           (|SparseMultivariatePolynomial| (QREFELT $ 6)
                                           (|NonNegativeInteger|))
           (LIST '*
                 (LIST
                  (LIST '|SparseMultivariatePolynomial|
                        (|devaluate| (QREFELT $ 6)) '(|NonNegativeInteger|))
                  '(|NonNegativeInteger|)
                  (LIST '|SparseMultivariatePolynomial|
                        (|devaluate| (QREFELT $ 6)) '(|NonNegativeInteger|)))))
          (SPADCALL |s| |n| (QREFELT $ 193))))) 

(SDEFUN |GUESS;diffAX|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 45)) |l| (QREFELT $ 103))
                  |f| (QREFELT $ 104))) 

(SDEFUN |GUESS;diffA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 195))) 

(SDEFUN |GUESS;diffAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 197))) 

(SDEFUN |GUESS;diffC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 198))) 

(SDEFUN |GUESS;diff1X| ((|x| |Symbol|) ($ EXPRR)) (|spadConstant| $ 199)) 

(SDEFUN |GUESS;diffHP;LR;43|
        ((|options| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|degrees| (|Stream| (|NonNegativeInteger|)))
          (|partitions| (|Stream| (|List| (|Integer|)))) (|dk| (|Symbol|)))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 200))))
            (|error|
             (SPADCALL "Guess: no support for mixed shifts in differential"
                       " equations" (QREFELT $ 42)))))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 201)))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $))
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $))
              (EXIT
               (VECTOR |degrees|
                       (CONS #'|GUESS;diffHP;LR;43!0| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;43!1| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;43!2| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;43!3| (VECTOR $ |partitions|))
                       '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                       (CONS (|function| |GUESS;diffAF|) $)
                       (CONS (|function| |GUESS;diffAX|) $)
                       (CONS (|function| |GUESS;diffC|) $)))))
            ('T (|error| "Guess: guessADE supports only displayAsGF"))))))) 

(SDEFUN |GUESS;diffHP;LR;43!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;diffDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;diffHP;LR;43!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G534 NIL) (|i| NIL) (#2=#:G533 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 206))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS (|function| |GUESS;diffDSF|) $)
                     (|spadConstant| $ 207) $))))))) 

(SDEFUN |GUESS;diffHP;LR;43!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 203))
                        (QREFELT $ 204))
              (QREFELT $ 205))
             $))))) 

(SDEFUN |GUESS;diffHP;LR;43!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;diffDS|) $) (|spadConstant| $ 202) $))))) 

(SDEFUN |GUESS;monomialAsEXPRR|
        ((|fl0| |List| EXPRR) (|partition| |List| (|Integer|)) ($ EXPRR))
        (SPROG
         ((|fl| (|List| EXPRR)) (#1=#:G570 NIL) (#2=#:G569 NIL) (#3=#:G578 NIL)
          (|part| NIL) (#4=#:G577 NIL) (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) (|spadConstant| $ 199))
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |part| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |fl0|
                                                      (PROG1
                                                          (LETT #2#
                                                                (|SPADfirst|
                                                                 |part|))
                                                        (|check_subtype2|
                                                         (> #2# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #2#))
                                                      (QREFELT $ 220))
                                            (PROG1
                                                (LETT #1#
                                                      (SPADCALL |part|
                                                                (QREFELT $
                                                                         102)))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 103))
                                           #4#))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (EXIT (SPADCALL (ELT $ 104) |fl| (QREFELT $ 106))))))))) 

(SDEFUN |GUESS;DEPEXPRRStream|
        ((|fl| |List| EXPRR) (|partitions| |Stream| (|List| (|Integer|)))
         ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;DEPEXPRRStream!0| (VECTOR $ |fl|))
                         |partitions| (QREFELT $ 183)))) 

(SDEFUN |GUESS;DEPEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|fl| $)
          (LETT |fl| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;monomialAsEXPRR| |fl| |z1| $))))) 

(SDEFUN |GUESS;get_fnames|
        ((|n| |Integer|) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((#1=#:G593 NIL) (|sym| NIL) (#2=#:G592 NIL)
          (|syms| (|List| (|Symbol|))) (#3=#:G591 NIL) (|i| NIL)
          (#4=#:G590 NIL) (|snums| (|List| (|String|))) (#5=#:G589 NIL)
          (|q| NIL) (#6=#:G588 NIL) (|n1| (|NonNegativeInteger|)))
         (SEQ (LETT |syms| (SPADCALL |options| (QREFELT $ 221)))
              (LETT |n1| (LENGTH |syms|))
              (COND
               ((SPADCALL |n1| 0 (QREFELT $ 222))
                (COND
                 ((SPADCALL |n1| |n| (QREFELT $ 223))
                  (EXIT
                   (|error|
                    "numbers of sequences and names are different"))))))
              (COND
               ((EQL |n1| 0)
                (SEQ
                 (LETT |snums|
                       (PROGN
                        (LETT #6# NIL)
                        (SEQ (LETT |q| 1) (LETT #5# |n|) G190
                             (COND ((|greater_SI| |q| #5#) (GO G191)))
                             (SEQ
                              (EXIT (LETT #6# (CONS (STRINGIMAGE |q|) #6#))))
                             (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                             (EXIT (NREVERSE #6#)))))
                 (EXIT
                  (LETT |syms|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |i| NIL) (LETT #3# |snums|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |i| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (SPADCALL
                                        (STRCONC "%" (STRCONC "f" |i|))
                                        (QREFELT $ 224))
                                       #4#))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #4#)))))))))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |sym| NIL) (LETT #1# |syms|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |sym| (QREFELT $ 45)) #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47|
        ((|lists| |List| (|List| F)) (|options| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|fakeDSF|
           (|Mapping|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
            (|NonNegativeInteger|)))
          (|fakeDS|
           (|Mapping| (|UnivariateFormalPowerSeries| F)
                      (|UnivariateFormalPowerSeries| F)
                      (|NonNegativeInteger|)))
          (|fl| (|List| EXPRR)) (|degrees| (|Stream| (|NonNegativeInteger|)))
          (|partitions| (|Stream| (|List| (|Integer|)))) (|dk| (|Symbol|)))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 200))))
            (|error|
             (SPADCALL "Guess: no support for mixed shifts in algebraic"
                       " dependencies" (QREFELT $ 42)))))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 201)))
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsEQ| (QREFELT $ 225))
             (|error| "Guess: guessAlgDep supports only displayAsEQ"))
            ('T
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $))
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $))
              (LETT |fl| (|GUESS;get_fnames| (LENGTH |lists|) |options| $))
              (LETT |fakeDS|
                    (CONS #'|GUESS;algDepHP;LLR;47!0| (VECTOR $ |lists|)))
              (LETT |fakeDSF|
                    (CONS #'|GUESS;algDepHP;LLR;47!1| (VECTOR $ |lists|)))
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;algDepHP;LLR;47!2| $) |partitions|
                          (QREFELT $ 229))
                (CONS #'|GUESS;algDepHP;LLR;47!3|
                      (VECTOR $ |fakeDS| |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;47!4| (VECTOR $ |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;47!5|
                      (VECTOR |fakeDSF| $ |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;47!6| (VECTOR $ |partitions| |fl|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                (CONS (|function| |GUESS;diffAF|) $)
                (CONS (|function| |GUESS;diffAX|) $)
                (CONS (|function| |GUESS;diffC|) $)))))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!6| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|fl| |partitions| $)
          (LETT |fl| (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;DEPEXPRRStream| |fl| |partitions| $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |fakeDSF|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |fakeDSF| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G612 NIL) (|i| NIL) (#2=#:G611 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 206))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     |fakeDSF| (|spadConstant| $ 207) $))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!4| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;DEPguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 203))
                        (QREFELT $ 204))
              (QREFELT $ 205))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!3| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| |fakeDS| $)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |fakeDS| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions| |fakeDS|
             (|spadConstant| $ 202) $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!2| ((|c| NIL) ($ NIL)) (|spadConstant| $ 95)) 

(SDEFUN |GUESS;algDepHP;LLR;47!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;list2UFPSSUPF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 176) (QREFELT $ 76))
                       (QREFELT $ 227))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!0| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;list2UFPSF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 176) (QREFELT $ 76))
                       (QREFELT $ 227))
             $))))) 

(SDEFUN |GUESS;substDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 45)) (+ |n| 1)
                            (QREFELT $ 103))
                  (QREFELT $ 231))) 

(SDEFUN |GUESS;substDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG ((#1=#:G628 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1))
                           (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #1#))
                         (QREFELT $ 232)))) 

(SDEFUN |GUESS;substDSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG ((#1=#:G630 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1))
                           (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #1#))
                         (QREFELT $ 233)))) 

(SDEFUN |GUESS;substHP;LR;51|
        ((|options| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|partitions| (|Stream| (|List| (|Integer|)))) (|dk| (|Symbol|)))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 200))))
            (|error|
             "Guess: no support for mixed shifts in functional equations")))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 201)))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $))
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;substHP;LR;51!0| $) |partitions|
                          (QREFELT $ 229))
                (CONS #'|GUESS;substHP;LR;51!1| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;51!2| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;51!3| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;51!4| (VECTOR $ |partitions|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                (CONS (|function| |GUESS;diffAF|) $)
                (CONS (|function| |GUESS;diffAX|) $)
                (CONS (|function| |GUESS;diffC|) $)))))
            ('T (|error| "Guess: guessSubst supports only displayAsGF"))))))) 

(SDEFUN |GUESS;substHP;LR;51!4| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;substDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;substHP;LR;51!3| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G648 NIL) (|i| NIL) (#2=#:G647 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 206))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS (|function| |GUESS;substDSF|) $)
                     (|spadConstant| $ 207) $))))))) 

(SDEFUN |GUESS;substHP;LR;51!2| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;FEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 203))
                        (QREFELT $ 204))
              (QREFELT $ 205))
             $))))) 

(SDEFUN |GUESS;substHP;LR;51!1| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;substDS|) $) (|spadConstant| $ 202) $))))) 

(SDEFUN |GUESS;substHP;LR;51!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 95)) 

(SDEFUN |GUESS;qDiffDX|
        ((|q| |Symbol|) (|expr| EXPRR) (|x| |Symbol|)
         (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT $ 45)) |n| (QREFELT $ 103))
                   (SPADCALL |x| (QREFELT $ 45)) (QREFELT $ 104))
                  (QREFELT $ 231))) 

(SDEFUN |GUESS;qDiffDS|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|n| |NonNegativeInteger|) ($ |UnivariateFormalPowerSeries| F))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;qDiffDS!0| (VECTOR |n| $ |q|)) |s|
                         (QREFELT $ 238)))) 

(SDEFUN |GUESS;qDiffDS!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G669 NIL))
                   (SPADCALL (SPADCALL |q| (QREFELT $ 235))
                             (PROG1
                                 (LETT #1# (SPADCALL |n| |z1| (QREFELT $ 236)))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT $ 124))))))) 

(SDEFUN |GUESS;qDiffDSV|
        ((|f| |U32Vector|) (|n| |NonNegativeInteger|) (|prime| |Integer|)
         (|q| |Integer|) ($ |U32Vector|))
        (SPROG
         ((Q (|Integer|)) (#1=#:G680 NIL) (|i| NIL) (|qn| (|Integer|))
          (|r| (|U32Vector|)) (#2=#:G673 NIL) (|d| (|Integer|)))
         (SEQ
          (COND ((ZEROP |n|) |f|)
                ('T
                 (SEQ (LETT |d| (- (QV_LEN_U32 |f|) 1))
                      (LETT |r|
                            (GETREFV_U32
                             (+
                              (PROG1 (LETT #2# |d|)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              1)
                             0))
                      (SETELT_U32 |r| 0 (ELT_U32 |f| 0))
                      (COND
                       ((SPADCALL |d| 0 (QREFELT $ 158))
                        (SEQ (LETT Q 1)
                             (LETT |qn| (REM (EXPT |q| |n|) |prime|))
                             (EXIT
                              (SEQ (LETT |i| 1) (LETT #1# |d|) G190
                                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                                   (SEQ (LETT Q (QSMULMOD32 |qn| Q |prime|))
                                        (EXIT
                                         (SETELT_U32 |r| |i|
                                                     (QSMULMOD32
                                                      (ELT_U32 |f| |i|) Q
                                                      |prime|))))
                                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                   (EXIT NIL))))))
                      (EXIT |r|))))))) 

(SDEFUN |GUESS;qDiffDSF|
        ((|q| |Symbol|)
         (|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;qDiffDSF!0| (VECTOR |n| $ |q|)) |s|
                         (QREFELT $ 241)))) 

(SDEFUN |GUESS;qDiffDSF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G681 NIL))
                   (SPADCALL
                    (SPADCALL (SPADCALL |q| (QREFELT $ 235)) (QREFELT $ 239))
                    (PROG1 (LETT #1# (SPADCALL |n| |z1| (QREFELT $ 236)))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#))
                    (QREFELT $ 130))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|q| |Integer|) (|dl| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|fl| (|List| (|U32Vector|))) (#1=#:G687 NIL) (#2=#:G686 NIL)
          (#3=#:G697 NIL) (|part| NIL) (#4=#:G696 NIL)
          (|ll| (|List| (|List| (|Integer|)))) (|d| (|NonNegativeInteger|))
          (#5=#:G685 NIL) (#6=#:G695 NIL) (|i| NIL) (#7=#:G694 NIL))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (CONS 1
                   (PROGN
                    (LETT #7# NIL)
                    (SEQ (LETT |i| (+ |dl| 2)) (LETT #6# (QV_LEN_U32 |f|)) G190
                         (COND ((> |i| #6#) (GO G191)))
                         (SEQ (EXIT (LETT #7# (CONS 0 #7#))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT (NREVERSE #7#)))))
             (QREFELT $ 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #5# (- (- (QV_LEN_U32 |f|) |dl|) 1))
                     (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #5#)))
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
             (LETT |fl|
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |part| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (SPADCALL
                                   (|GUESS;qDiffDSV| |f|
                                    (PROG1
                                        (LETT #2# (- (|SPADfirst| |part|) 1))
                                      (|check_subtype2| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                    |prime| |q| $)
                                   (PROG1
                                       (LETT #1#
                                             (SPADCALL |part| (QREFELT $ 102)))
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#))
                                   |d| |prime| (QREFELT $ 111))
                                  #4#))))
                         (LETT #3# (CDR #3#)) (GO G190) G191
                         (EXIT (NREVERSE #4#)))))
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorqDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 115))))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2))
          (LETT |prime| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 112)))))) 

(SDEFUN |GUESS;ADEguessModGenq|
        ((|partitions| |List| (|List| (|Integer|))) (|d| |NonNegativeInteger|)
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEguessModGenq!0|
                      (VECTOR |d| |partitions| $))))) 

(SDEFUN |GUESS;ADEguessModGenq!0| ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG ($ |partitions| |d|)
          (LETT $ (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT |d| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G703 NIL) (|p| NIL) (#2=#:G702 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 175))
                                (|spadConstant| $ 176) (QREFELT $ 147))
                      (|error| "ADEguessModGenq, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 177)))
                           (EXIT
                            (SPADCALL
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |p| NIL) (LETT #1# |partitions|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |p| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|GUESS;termAsU32VectorqDiff| |f|
                                             |p| |prime| |q| |d| $)
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 178)))))))))))) 

(SDEFUN |GUESS;diffHP;SM;58|
        ((|q| |Symbol|)
         ($ |Mapping|
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
          (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;diffHP;SM;58!8| (VECTOR |q| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!8| ((|l1| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|partitions| NIL))
                   (SEQ
                    (COND
                     ((NULL
                       (SPADCALL (SPADCALL |l1| (QREFELT $ 200))
                                 (QREFELT $ 242)))
                      (|error|
                       (SPADCALL "Guess: no support for mixed shifts in"
                                 " differential equations" (QREFELT $ 42)))))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |l1| (QREFELT $ 201)) '|displayAsGF|
                                 (QREFELT $ 243))
                       (SEQ
                        (LETT |partitions|
                              (|GUESS;FilteredPartitionStream| |l1| $))
                        (EXIT
                         (VECTOR
                          (SPADCALL (CONS #'|GUESS;diffHP;SM;58!0| $)
                                    |partitions| (QREFELT $ 229))
                          (CONS #'|GUESS;diffHP;SM;58!2|
                                (VECTOR |q| $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;58!3|
                                (VECTOR $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;58!5|
                                (VECTOR |q| $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;58!7|
                                (VECTOR |q| $ |partitions|))
                          '|qdiffHP| |q| (CONS (|function| |GUESS;diffA|) $)
                          (CONS (|function| |GUESS;diffAF|) $)
                          (CONS (|function| |GUESS;diffAX|) $)
                          (CONS (|function| |GUESS;diffC|) $)))))
                      ('T
                       (|error|
                        "Guess: guessADE supports only displayAsGF")))))))))) 

(SDEFUN |GUESS;diffHP;SM;58!7| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
                    (CONS #'|GUESS;diffHP;SM;58!6| (VECTOR $ |q|))
                    (CONS (|function| |GUESS;diff1X|) $) $)))))) 

(SDEFUN |GUESS;diffHP;SM;58!6| ((|w1| NIL) (|w2| NIL) (|w3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qDiffDX| |q| |w1| |w2| |w3| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G719 NIL) (|i| NIL) (#2=#:G718 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 206))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS #'|GUESS;diffHP;SM;58!4| (VECTOR $ |q|))
                     (|spadConstant| $ 207) $))))))) 

(SDEFUN |GUESS;diffHP;SM;58!4| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qDiffDSF| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!3| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGenq|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 203))
                        (QREFELT $ 204))
              (QREFELT $ 205))
             (|spadConstant| $ 95) $))))) 

(SDEFUN |GUESS;diffHP;SM;58!2| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEguessStream| |z1| |partitions|
                    (CONS #'|GUESS;diffHP;SM;58!1| (VECTOR $ |q|))
                    (|spadConstant| $ 202) $)))))) 

(SDEFUN |GUESS;diffHP;SM;58!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qDiffDS| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 95)) 

(SDEFUN |GUESS;ShiftSX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 45))
                            (SPADCALL |n| (QREFELT $ 246)) (QREFELT $ 93))
                  (QREFELT $ 231))) 

(SDEFUN |GUESS;ShiftSXGF|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPROG ((|l| (|List| EXPRR)) (#1=#:G746 NIL) (|i| NIL) (#2=#:G745 NIL))
               (SEQ
                (COND ((ZEROP |n|) |expr|)
                      ('T
                       (SEQ
                        (LETT |l|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |expr| |x| |i|
                                                          (QREFELT $ 191))
                                                (SPADCALL
                                                 (SPADCALL |i| (QREFELT $ 247))
                                                 (QREFELT $ 246))
                                                (QREFELT $ 248))
                                               (SPADCALL |x| (QREFELT $ 45))
                                               (|spadConstant| $ 249)
                                               (QREFELT $ 231))
                                              (SPADCALL
                                               (SPADCALL |x| (QREFELT $ 45))
                                               |i| (QREFELT $ 103))
                                              (QREFELT $ 104))
                                             #2#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))
                        (EXIT
                         (SPADCALL
                          (SPADCALL |expr|
                                    (SPADCALL (ELT $ 93) |l| (QREFELT $ 106))
                                    (QREFELT $ 250))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 45)) |n|
                                    (QREFELT $ 103))
                          (QREFELT $ 248))))))))) 

(SDEFUN |GUESS;ShiftSS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| (SPADCALL (ELT $ 251) |n| (QREFELT $ 254)))) 

(SDEFUN |GUESS;ShiftSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL |s| (SPADCALL (ELT $ 255) |n| (QREFELT $ 258)))) 

(SDEFUN |GUESS;ShiftAX|
        ((|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT $ 45)) |l| (QREFELT $ 103))
                  |f| (QREFELT $ 104))) 

(SDEFUN |GUESS;ShiftAXGF|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPROG ((|s| (|List| EXPRR)) (#1=#:G757 NIL) (|i| NIL) (#2=#:G756 NIL))
               (SEQ
                (COND ((ZEROP |l|) |f|)
                      ('T
                       (SEQ
                        (LETT |s|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |i| 1) (LETT #1# |l|) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |l| |i|
                                                          (QREFELT $ 260))
                                                (QREFELT $ 246))
                                               (SPADCALL
                                                (SPADCALL |x| (QREFELT $ 45))
                                                |i| (QREFELT $ 103))
                                               (QREFELT $ 104))
                                              (SPADCALL |f| |x| |i|
                                                        (QREFELT $ 191))
                                              (QREFELT $ 104))
                                             #2#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))
                        (EXIT (SPADCALL (ELT $ 93) |s| (QREFELT $ 106))))))))) 

(SDEFUN |GUESS;ShiftA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 261))) 

(SDEFUN |GUESS;ShiftAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 262))) 

(SDEFUN |GUESS;ShiftC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 263))) 

(SDEFUN |GUESS;shiftHP;LR;68|
        ((|options| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|degrees| (|Stream| (|NonNegativeInteger|))) (|dk| (|Symbol|))
          (|partitions| (|Stream| (|List| (|Integer|)))))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 200))))
            (|error| "Guess: need a symbol for mixed Shifting")))
          (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 201)))
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsRec| (QREFELT $ 225))
             (|error|
              "Guess: no support for the Shift operator with displayAsGF"))
            ('T
             (SEQ (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $))
                  (EXIT
                   (VECTOR |degrees|
                           (CONS #'|GUESS;shiftHP;LR;68!0|
                                 (VECTOR $ |partitions|))
                           (CONS #'|GUESS;shiftHP;LR;68!1|
                                 (VECTOR |degrees| $ |partitions|))
                           (CONS #'|GUESS;shiftHP;LR;68!2|
                                 (VECTOR $ |partitions|))
                           (CONS #'|GUESS;shiftHP;LR;68!3|
                                 (VECTOR $ |partitions|))
                           '|shiftHP| '|dummy|
                           (CONS (|function| |GUESS;ShiftA|) $)
                           (CONS (|function| |GUESS;ShiftAF|) $)
                           (CONS (|function| |GUESS;ShiftAX|) $)
                           (CONS (|function| |GUESS;ShiftC|) $)))))))))) 

(SDEFUN |GUESS;shiftHP;LR;68!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;shiftHP;LR;68!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G776 NIL) (|i| NIL) (#2=#:G775 NIL))
                   (SEQ
                    (|GUESS;ADEtestGen2|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 206))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 207)
                                (SPADCALL (|spadConstant| $ 271)
                                          (|spadConstant| $ 74)
                                          (QREFELT $ 272))
                                (QREFELT $ 273))
                      (SPADCALL (|spadConstant| $ 267) (QREFELT $ 268))
                      (QREFELT $ 274))
                     $))))))) 

(SDEFUN |GUESS;shiftHP;LR;68!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $ |degrees|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |degrees| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 203))
                        (QREFELT $ 204))
              (QREFELT $ 205))
             (SPADCALL |degrees| |o| (QREFELT $ 270)) $))))) 

(SDEFUN |GUESS;shiftHP;LR;68!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 202)
                        (SPADCALL (|spadConstant| $ 63) (|spadConstant| $ 176)
                                  (QREFELT $ 264))
                        (QREFELT $ 265))
              (SPADCALL (|spadConstant| $ 267) (QREFELT $ 268))
              (QREFELT $ 269))
             $))))) 

(SDEFUN |GUESS;qShiftAX|
        ((|q| |Symbol|) (|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR)
         ($ EXPRR))
        (SPADCALL
         (SPADCALL (SPADCALL |q| (QREFELT $ 45))
                   (SPADCALL |l| (SPADCALL |n| (QREFELT $ 45)) (QREFELT $ 276))
                   (QREFELT $ 277))
         |f| (QREFELT $ 104))) 

(SDEFUN |GUESS;qShiftA|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 278)) |k| |l| |f| (QREFELT $ 279))) 

(SDEFUN |GUESS;qShiftAF|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 235)) (QREFELT $ 239)) |k|
                  |l| |f| (QREFELT $ 280))) 

(SDEFUN |GUESS;qShiftC|
        ((|q| |Symbol|) (|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 278)) |total| (QREFELT $ 281))) 

(SDEFUN |GUESS;qSubstUFPSF|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|maxMD| |NonNegativeInteger|)
         ($ |List| (|UnivariateFormalPowerSeries| F)))
        (SPROG ((#1=#:G802 NIL) (|i| NIL) (#2=#:G801 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# |maxMD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |s|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |q| (QREFELT $ 235)) |i|
                                           (QREFELT $ 124))
                                          (SPADCALL (|spadConstant| $ 63) 1
                                                    (QREFELT $ 264))
                                          (QREFELT $ 282))
                                         (QREFELT $ 283))
                               #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GUESS;qSubstEXPRR|
        ((|q| |Symbol|) (|xx| |Symbol|) (|s| EXPRR)
         (|maxMD| |NonNegativeInteger|) ($ |List| EXPRR))
        (SPROG ((#1=#:G806 NIL) (|i| NIL) (#2=#:G805 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# |maxMD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |q| (QREFELT $ 45))
                                          (SPADCALL |i|
                                                    (SPADCALL |xx|
                                                              (QREFELT $ 45))
                                                    (QREFELT $ 276))
                                          (QREFELT $ 277))
                                |s| (QREFELT $ 104))
                               #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GUESS;ADEguessStreamMixShift|
        ((|q| |Symbol|) (|f| |UnivariateFormalPowerSeries| F)
         (|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|)
         ($ |Stream| (|UnivariateFormalPowerSeries| F)))
        (SPROG ((|s| (|Stream| (|UnivariateFormalPowerSeries| F))))
               (SEQ
                (LETT |s|
                      (|GUESS;ADEguessStream2| |f| |partitions|
                       (CONS (|function| |GUESS;ShiftSS|) $)
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 202)
                                  (SPADCALL (|spadConstant| $ 63) 1
                                            (QREFELT $ 264))
                                  (QREFELT $ 265))
                        (SPADCALL (|spadConstant| $ 267) (QREFELT $ 268))
                        (QREFELT $ 269))
                       $))
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEguessStreamMixShift!0|
                                 (VECTOR $ |maxMD| |q|))
                           (QREFELT $ 286)))))) 

(SDEFUN |GUESS;ADEguessStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |maxMD| $)
          (LETT |q| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qSubstUFPSF| |q| |z1| |maxMD| $))))) 

(SDEFUN |GUESS;ADEguessModGen2Mixed|
        ((|partitions| |Stream| (|List| (|Integer|)))
         (|dl| |NonNegativeInteger|) (|maxMD| |NonNegativeInteger|)
         (|o| |NonNegativeInteger|)
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEguessModGen2Mixed!0|
                      (VECTOR |partitions| |maxMD| |o| |dl| $))))) 

(SDEFUN |GUESS;ADEguessModGen2Mixed!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG ($ |dl| |o| |maxMD| |partitions|)
          (LETT $ (QREFELT $$ 4))
          (LETT |dl| (QREFELT $$ 3))
          (LETT |o| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT |partitions| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|l| NIL) (|vv| NIL) (#1=#:G836 NIL) (|e| NIL) (|vn| NIL)
              (#2=#:G835 NIL) (|i| NIL) (|r| NIL) (#3=#:G834 NIL)
              (#4=#:G833 NIL) (|lastv| NIL) (#5=#:G831 NIL) (|v| NIL)
              (#6=#:G832 NIL) (|w| NIL) (|vv1| NIL) (#7=#:G830 NIL) (|p| NIL)
              (#8=#:G829 NIL) (O NIL) (#9=#:G814 NIL) (#10=#:G828 NIL)
              (|qv| NIL) (|d| NIL) (#11=#:G812 NIL) (|f| NIL))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |fl| (QREFELT $ 175))
                          (|spadConstant| $ 176) (QREFELT $ 147))
                (|error| "ADEguessModGen2Mixed: #fl ~= 1"))
               ('T
                (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 177)))
                     (LETT |d|
                           (PROG1
                               (LETT #11#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |f| (QREFELT $ 287))
                                                |dl| (QREFELT $ 185))
                                      (|spadConstant| $ 176) (QREFELT $ 185)))
                             (|check_subtype2| (>= #11# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #11#)))
                     (LETT |qv|
                           (SPADCALL
                            (SPADCALL |d| (|spadConstant| $ 176)
                                      (QREFELT $ 76))
                            (|spadConstant| $ 176) (QREFELT $ 288)))
                     (SEQ (LETT |i| (|spadConstant| $ 176)) (LETT #10# |d|)
                          G190 (COND ((> |i| #10#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |qv| |i|
                                      (SPADCALL
                                       (SPADCALL |q| |i| (QREFELT $ 291))
                                       |prime| (QREFELT $ 292))
                                      (QREFELT $ 293))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                     (LETT O
                           (PROG1
                               (LETT #9#
                                     (SPADCALL
                                      (SPADCALL |o|
                                                (SPADCALL |maxMD|
                                                          (|spadConstant| $
                                                                          176)
                                                          (QREFELT $ 76))
                                                (QREFELT $ 294))
                                      (QREFELT $ 295)))
                             (|check_subtype2| (>= #9# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #9#)))
                     (LETT |vv1|
                           (PROGN
                            (LETT #8# NIL)
                            (SEQ (LETT |p| NIL)
                                 (LETT #7#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |partitions| O
                                                   (QREFELT $ 203))
                                         (QREFELT $ 204))
                                        (QREFELT $ 205)))
                                 G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |p| (CAR #7#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #8#
                                         (CONS
                                          (|GUESS;termAsU32VectorShift| |f| |p|
                                           |prime| |dl| $)
                                          #8#))))
                                 (LETT #7# (CDR #7#)) (GO G190) G191
                                 (EXIT (NREVERSE #8#)))))
                     (LETT |l| NIL)
                     (LETT |lastv| (SPADCALL |vv1| (QREFELT $ 177)))
                     (SEQ (LETT |w| NIL)
                          (LETT #6# (SPADCALL |vv1| (QREFELT $ 296)))
                          (LETT |v| NIL) (LETT #5# |vv1|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |v| (CAR #5#)) NIL)
                                (ATOM #6#) (PROGN (LETT |w| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |lastv| |w|) (LETT |vv| (LIST |v|))
                               (LETT |vn| |v|)
                               (SEQ (LETT |i| (|spadConstant| $ 176))
                                    (LETT #4# |maxMD|) G190
                                    (COND ((> |i| #4#) (GO G191)))
                                    (SEQ
                                     (LETT |vn|
                                           (SPADCALL |vn| (QREFELT $ 297)))
                                     (SEQ (LETT |e| (|spadConstant| $ 176))
                                          (LETT #3# |d|) G190
                                          (COND ((> |e| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |vn| |e|
                                                      (QSMULMOD32
                                                       (SPADCALL |vn| |e|
                                                                 (QREFELT $
                                                                          298))
                                                       (SPADCALL |qv| |e|
                                                                 (QREFELT $
                                                                          298))
                                                       |prime|)
                                                      (QREFELT $ 293))))
                                          (LETT |e| (+ |e| 1)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT
                                      (LETT |vv|
                                            (SPADCALL |vn| |vv|
                                                      (QREFELT $ 299)))))
                                    (LETT |i| (+ |i| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |l|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |vv| (QREFELT $ 300))
                                        (QREFELT $ 178))
                                       |l| (QREFELT $ 302)))))
                          (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#))))
                          (GO G190) G191 (EXIT NIL))
                     (LETT |vv| (LIST |lastv|)) (LETT |vn| |lastv|)
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL |o|
                                      (SPADCALL |maxMD| (|spadConstant| $ 176)
                                                (QREFELT $ 76))
                                      (QREFELT $ 303))
                            (|spadConstant| $ 176) (QREFELT $ 185)))
                     (COND
                      ((SPADCALL |r|
                                 (SPADCALL (|spadConstant| $ 290)
                                           (QREFELT $ 304))
                                 (QREFELT $ 98))
                       (LETT |r| |maxMD|)))
                     (SEQ (LETT |i| (|spadConstant| $ 176)) (LETT #2# |r|) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ (LETT |vn| (SPADCALL |vn| (QREFELT $ 297)))
                               (SEQ (LETT |e| (|spadConstant| $ 176))
                                    (LETT #1# |d|) G190
                                    (COND ((> |e| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |vn| |e|
                                                (QSMULMOD32
                                                 (SPADCALL |vn| |e|
                                                           (QREFELT $ 298))
                                                 (SPADCALL |qv| |e|
                                                           (QREFELT $ 298))
                                                 |prime|)
                                                (QREFELT $ 293))))
                                    (LETT |e| (+ |e| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |vv|
                                      (SPADCALL |vn| |vv| (QREFELT $ 299)))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                     (LETT |l|
                           (SPADCALL
                            (SPADCALL (SPADCALL |vv| (QREFELT $ 300))
                                      (QREFELT $ 178))
                            |l| (QREFELT $ 302)))
                     (EXIT
                      (SPADCALL (SPADCALL |l| (QREFELT $ 305))
                                (QREFELT $ 307)))))))))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift|
        ((|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|) ($ |Stream| (|NonNegativeInteger|)))
        (SPROG ((|s| (|Stream| (|NonNegativeInteger|))))
               (SEQ (LETT |s| (|GUESS;ADEdegreeStream| |partitions| $))
                    (EXIT
                     (SPADCALL |s|
                               (CONS #'|GUESS;ADEdegreeStreamMixShift!0|
                                     (VECTOR |maxMD| $))
                               (QREFELT $ 311)))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxMD|)
          (LETT $ (QREFELT $$ 1))
          (LETT |maxMD| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G841 NIL) (|i| NIL) (#2=#:G840 NIL))
                   (SEQ
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |i| (|spadConstant| $ 95)) (LETT #1# |maxMD|)
                          G190 (COND ((> |i| #1#) (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS |z1| #2#))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |GUESS;ADEtestMixShiftGen|
        ((|q| |Symbol|) (|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|) (|l| |List| (|PositiveInteger|))
         ($ |Mapping|
          (|Vector|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEtestMixShiftGen!0|
                      (VECTOR |q| |partitions| |maxMD| $ |l|))))) 

(SDEFUN |GUESS;ADEtestMixShiftGen!0| ((|f| NIL) ($$ NIL))
        (PROG (|l| $ |maxMD| |partitions| |q|)
          (LETT |l| (QREFELT $$ 4))
          (LETT $ (QREFELT $$ 3))
          (LETT |maxMD| (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|res| NIL) (#1=#:G864 NIL) (|i| NIL) (#2=#:G863 NIL) (|f0| NIL)
              (|exponents| NIL) (#3=#:G851 NIL) (|oldPartition| NIL)
              (#4=#:G862 NIL) (#5=#:G861 NIL) (|newPartition| NIL)
              (#6=#:G845 NIL) (#7=#:G860 NIL) (|p| NIL) (#8=#:G844 NIL))
             (SEQ (LETT |res| NIL) (LETT |exponents| NIL)
                  (LETT |oldPartition|
                        (PROG1
                            (LETT #8#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |l| (QREFELT $ 313))
                                             (SPADCALL |maxMD|
                                                       (|spadConstant| $ 74)
                                                       (QREFELT $ 76))
                                             (QREFELT $ 294))
                                   (QREFELT $ 295)))
                          (|check_subtype2| (> #8# 0) '(|PositiveInteger|)
                                            '(|Integer|) #8#)))
                  (SEQ (LETT |p| NIL) (LETT #7# |l|) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |newPartition|
                              (PROG1
                                  (LETT #6#
                                        (SPADCALL
                                         (SPADCALL |p|
                                                   (SPADCALL |maxMD|
                                                             (|spadConstant| $
                                                                             74)
                                                             (QREFELT $ 76))
                                                   (QREFELT $ 294))
                                         (QREFELT $ 295)))
                                (|check_subtype2| (> #6# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #6#)))
                        (COND
                         ((SPADCALL |newPartition| |oldPartition|
                                    (QREFELT $ 314))
                          (SEQ
                           (LETT |f0|
                                 (|GUESS;termAsUFPSSUPF2| |f|
                                  (SPADCALL |partitions| |oldPartition|
                                            (QREFELT $ 206))
                                  (CONS (|function| |GUESS;ShiftSF|) $)
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 207)
                                             (SPADCALL (|spadConstant| $ 271)
                                                       (|spadConstant| $ 74)
                                                       (QREFELT $ 272))
                                             (QREFELT $ 273))
                                   (SPADCALL (|spadConstant| $ 267)
                                             (QREFELT $ 268))
                                   (QREFELT $ 274))
                                  $))
                           (LETT |res|
                                 (SPADCALL
                                  (PROGN
                                   (LETT #5# NIL)
                                   (SEQ (LETT |i| NIL) (LETT #4# |exponents|)
                                        G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN (LETT |i| (CAR #4#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |f0|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |q|
                                                                        (QREFELT
                                                                         $
                                                                         235))
                                                              |i|
                                                              (QREFELT $ 124))
                                                             (QREFELT $ 239))
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             271)
                                                             (|spadConstant| $
                                                                             74)
                                                             (QREFELT $ 272))
                                                            (QREFELT $ 315))
                                                           (QREFELT $ 316))
                                                 #5#))))
                                        (LETT #4# (CDR #4#)) (GO G190) G191
                                        (EXIT (NREVERSE #5#))))
                                  |res| (QREFELT $ 317)))
                           (LETT |exponents| NIL)
                           (EXIT (LETT |oldPartition| |newPartition|)))))
                        (EXIT
                         (LETT |exponents|
                               (SPADCALL
                                (PROG1
                                    (LETT #3#
                                          (SPADCALL
                                           (SPADCALL |p| (|spadConstant| $ 74)
                                                     (QREFELT $ 185))
                                           (SPADCALL |maxMD|
                                                     (|spadConstant| $ 74)
                                                     (QREFELT $ 76))
                                           (QREFELT $ 292)))
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#))
                                |exponents| (QREFELT $ 319)))))
                       (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                  (LETT |f0|
                        (|GUESS;termAsUFPSSUPF2| |f|
                         (SPADCALL |partitions| |oldPartition| (QREFELT $ 206))
                         (CONS (|function| |GUESS;ShiftSF|) $)
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 207)
                                    (SPADCALL (|spadConstant| $ 271)
                                              (|spadConstant| $ 74)
                                              (QREFELT $ 272))
                                    (QREFELT $ 273))
                          (SPADCALL (|spadConstant| $ 267) (QREFELT $ 268))
                          (QREFELT $ 274))
                         $))
                  (LETT |res|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |i| NIL) (LETT #1# |exponents|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |i| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL |f0|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |q|
                                                               (QREFELT $ 235))
                                                     |i| (QREFELT $ 124))
                                                    (QREFELT $ 239))
                                                   (SPADCALL
                                                    (|spadConstant| $ 271)
                                                    (|spadConstant| $ 74)
                                                    (QREFELT $ 272))
                                                   (QREFELT $ 315))
                                                  (QREFELT $ 316))
                                        #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         |res| (QREFELT $ 317)))
                  (EXIT
                   (SPADCALL (SPADCALL |res| (QREFELT $ 320))
                             (QREFELT $ 179))))))))) 

(SDEFUN |GUESS;ADEEXPRRStreamMixShift|
        ((|q| |Symbol|) (|f| EXPRR) (|xx| |Symbol|)
         (|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|) ($ |Stream| EXPRR))
        (SPROG ((|s| (|Stream| EXPRR)))
               (SEQ
                (LETT |s|
                      (|GUESS;ADEEXPRRStream| |f| |xx| |partitions|
                       (CONS (|function| |GUESS;ShiftSX|) $)
                       (CONS (|function| |GUESS;diff1X|) $) $))
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEEXPRRStreamMixShift!0|
                                 (VECTOR $ |maxMD| |xx| |q|))
                           (QREFELT $ 323)))))) 

(SDEFUN |GUESS;ADEEXPRRStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |xx| |maxMD| $)
          (LETT |q| (QREFELT $$ 3))
          (LETT |xx| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qSubstEXPRR| |q| |xx| |z1| |maxMD| $))))) 

(SDEFUN |GUESS;shift_hp_aux|
        ((|q| |Symbol|) (|l1| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|degrees| (|Stream| (|NonNegativeInteger|)))
          (|maxMD| (|NonNegativeInteger|))
          (|partitions| (|Stream| (|List| (|Integer|)))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |l1| (QREFELT $ 201)) '|displayAsRec|
                      (QREFELT $ 225))
            (|error|
             (SPADCALL "Guess: no support for the qShift operator"
                       " with displayAsGF" (QREFELT $ 42))))
           (#1='T
            (SEQ (LETT |partitions| (|GUESS;FilteredPartitionStream| |l1| $))
                 (LETT |maxMD| (SPADCALL |l1| (QREFELT $ 200)))
                 (EXIT
                  (COND
                   ((ZEROP |maxMD|)
                    (SEQ
                     (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $))
                     (EXIT
                      (VECTOR |degrees|
                              (CONS #'|GUESS;shift_hp_aux!0|
                                    (VECTOR $ |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!1|
                                    (VECTOR |degrees| $ |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!2|
                                    (VECTOR $ |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!3|
                                    (VECTOR $ |partitions|))
                              '|qshiftHP| |q|
                              (CONS #'|GUESS;shift_hp_aux!4| (VECTOR $ |q|))
                              (CONS #'|GUESS;shift_hp_aux!5| (VECTOR $ |q|))
                              (CONS #'|GUESS;shift_hp_aux!6| (VECTOR $ |q|))
                              (CONS #'|GUESS;shift_hp_aux!7|
                                    (VECTOR $ |q|))))))
                   (#1#
                    (SEQ
                     (LETT |degrees|
                           (|GUESS;ADEdegreeStreamMixShift| |partitions|
                            |maxMD| $))
                     (EXIT
                      (VECTOR |degrees|
                              (CONS #'|GUESS;shift_hp_aux!8|
                                    (VECTOR $ |maxMD| |partitions| |q|))
                              (CONS #'|GUESS;shift_hp_aux!9|
                                    (VECTOR |maxMD| $ |degrees| |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!10|
                                    (VECTOR $ |maxMD| |partitions| |q|))
                              (CONS #'|GUESS;shift_hp_aux!11|
                                    (VECTOR $ |maxMD| |partitions| |q|))
                              '|qmixed| |q|
                              (CONS (|function| |GUESS;ShiftA|) $)
                              (CONS (|function| |GUESS;ShiftAF|) $)
                              (CONS (|function| |GUESS;ShiftAX|) $)
                              (CONS (|function| |GUESS;ShiftC|) $))))))))))))) 

(SDEFUN |GUESS;shift_hp_aux!11| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3))
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStreamMixShift| |q| |z1| |z2| |partitions| |maxMD|
             $))))) 

(SDEFUN |GUESS;shift_hp_aux!10| ((|l| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3))
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEtestMixShiftGen| |q| |partitions| |maxMD| |l| $))))) 

(SDEFUN |GUESS;shift_hp_aux!9| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| |degrees| $ |maxMD|)
          (LETT |partitions| (QREFELT $$ 3))
          (LETT |degrees| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |maxMD| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2Mixed| |partitions|
             (SPADCALL |degrees| |o| (QREFELT $ 270)) |maxMD| |o| $))))) 

(SDEFUN |GUESS;shift_hp_aux!8| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3))
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStreamMixShift| |q| |z1| |partitions| |maxMD| $))))) 

(SDEFUN |GUESS;shift_hp_aux!7| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftC| |q| |z1| $))))) 

(SDEFUN |GUESS;shift_hp_aux!6| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftAX| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shift_hp_aux!5| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftAF| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shift_hp_aux!4| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftA| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shift_hp_aux!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;shift_hp_aux!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G887 NIL) (|i| NIL) (#2=#:G886 NIL))
                   (SEQ
                    (|GUESS;ADEtestGen2|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 206))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 207)
                                (SPADCALL (|spadConstant| $ 271)
                                          (|spadConstant| $ 74)
                                          (QREFELT $ 272))
                                (QREFELT $ 273))
                      (SPADCALL (|spadConstant| $ 267) (QREFELT $ 268))
                      (QREFELT $ 274))
                     $))))))) 

(SDEFUN |GUESS;shift_hp_aux!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $ |degrees|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |degrees| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 203))
                        (QREFELT $ 204))
              (QREFELT $ 205))
             (SPADCALL |degrees| |o| (QREFELT $ 270)) $))))) 

(SDEFUN |GUESS;shift_hp_aux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 202)
                        (SPADCALL (|spadConstant| $ 63) (|spadConstant| $ 176)
                                  (QREFELT $ 264))
                        (QREFELT $ 265))
              (SPADCALL (|spadConstant| $ 267) (QREFELT $ 268))
              (QREFELT $ 269))
             $))))) 

(SDEFUN |GUESS;shiftHP;SM;81|
        ((|q| |Symbol|)
         ($ |Mapping|
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
          (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;shiftHP;SM;81!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESS;shiftHP;SM;81!0| ((|l1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;shift_hp_aux| |q| |l1| $))))) 

(SDEFUN |GUESS;makeEXPRR|
        ((DAX |Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR)
         (|x| |Symbol|) (|p| |SparseUnivariatePolynomial| F) (|expr| EXPRR)
         ($ EXPRR))
        (COND ((SPADCALL |p| (QREFELT $ 325)) (|spadConstant| $ 249))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 326)) (QREFELT $ 10))
                 (SPADCALL (SPADCALL |p| (QREFELT $ 327)) |x| |expr| DAX)
                 (QREFELT $ 104))
                (|GUESS;makeEXPRR| DAX |x| (SPADCALL |p| (QREFELT $ 328))
                 |expr| $)
                (QREFELT $ 93))))) 

(SDEFUN |GUESS;list2UFPSF|
        ((|list| |List| F) ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL (SPADCALL |list| (QREFELT $ 330)) (QREFELT $ 331))) 

(SDEFUN |GUESS;list2UFPSSUPF|
        ((|list| |List| F)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG
         ((|l2|
           (|Stream|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|s1| (|Stream| (|Integer|)))
          (|l1|
           (|Stream|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (#1=#:G935 NIL) (|e| NIL) (#2=#:G934 NIL))
         (SEQ
          (LETT |l1|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |e| NIL) (LETT #1# |list|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |e| (QREFELT $ 239)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 334)))
          (LETT |s1| (SPADCALL (ELT $ 69) 0 (QREFELT $ 72)))
          (LETT |l2|
                (SPADCALL (CONS #'|GUESS;list2UFPSSUPF!0| $) |s1|
                          (QREFELT $ 339)))
          (EXIT
           (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 340)) (QREFELT $ 341)))))) 

(SDEFUN |GUESS;list2UFPSSUPF!0| ((|i| NIL) ($ NIL))
        (SPROG ((#1=#:G930 NIL))
               (SPADCALL (|spadConstant| $ 63)
                         (SPADCALL (|spadConstant| $ 176)
                                   (PROG1 (LETT #1# |i|)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 336))
                         (QREFELT $ 337)))) 

(SDEFUN |GUESS;SUPF2SUPSUPF|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL (ELT $ 239) |p| (QREFELT $ 345))) 

(SDEFUN |GUESS;UFPSF2SUPF|
        ((|f| |UnivariateFormalPowerSeries| F) (|deg| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (SPADCALL |f| |deg| (QREFELT $ 347)) (QREFELT $ 348))) 

(SDEFUN |GUESS;getListSUPF|
        ((|s| |List| (|UnivariateFormalPowerSeries| F))
         (|deg| |NonNegativeInteger|)
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;getListSUPF!0| (VECTOR $ |deg|)) |s|
                         (QREFELT $ 352)))) 

(SDEFUN |GUESS;getListSUPF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|deg| $)
          (LETT |deg| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;UFPSF2SUPF| |z1| |deg| $))))) 

(SDEFUN |GUESS;guessInterpolateModular|
        ((|lists| |List| (|List| F)) (|degs| |List| (|Integer|))
         (|o| |NonNegativeInteger|) (|degreeLoss| |Integer|)
         (|guessDegree| |NonNegativeInteger|)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((|check|
           (|Mapping| (|Union| "good" "reject" "no_solution")
                      (|List| (|SparseUnivariatePolynomial| S))))
          (#1=#:G996 NIL) (|i| NIL) (#2=#:G995 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#3=#:G994 NIL) (#4=#:G993 NIL) (#5=#:G992 NIL) (#6=#:G991 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary")) (#7=#:G947 NIL)
          (#8=#:G989 NIL) (|del| (|Integer|)) (|leadingZeros| (|Integer|))
          (#9=#:G990 NIL) (|el| NIL) (|sigma| (|NonNegativeInteger|))
          (#10=#:G945 NIL) (|list| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |list| (|SPADfirst| |lists|))
                (LETT |sigma|
                      (PROG1 (LETT #10# (- (LENGTH |list|) |degreeLoss|))
                        (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #10#)))
                (LETT |leadingZeros| 0)
                (SEQ (LETT |el| NIL) (LETT #9# |list|) G190
                     (COND
                      ((OR (ATOM #9#) (PROGN (LETT |el| (CAR #9#)) NIL)
                           (NULL (SPADCALL |el| (QREFELT $ 353))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |leadingZeros| (+ |leadingZeros| 1))))
                     (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL |leadingZeros| |degreeLoss| (QREFELT $ 158))
                  (SEQ (LETT |del| (- |leadingZeros| |degreeLoss|))
                       (EXIT
                        (COND
                         ((SPADCALL |del| |guessDegree| (QREFELT $ 158))
                          (PROGN (LETT #8# (CONS 1 NIL)) (GO #11=#:G988)))
                         (#12='T
                          (LETT |guessDegree|
                                (PROG1 (LETT #7# (- |guessDegree| |del|))
                                  (|check_subtype2| (>= #7# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #7#)))))))))
                (COND
                 ((NULL (SPADCALL |options| (QREFELT $ 354)))
                  (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 355)))
                       (EXIT
                        (COND
                         ((QEQCAR |maxD| 0)
                          (COND
                           ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                            (LETT |degs|
                                  (PROGN
                                   (LETT #6# NIL)
                                   (SEQ (LETT |i| 1) (LETT #5# |o|) G190
                                        (COND
                                         ((|greater_SI| |i| #5#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6# (CONS (QCDR |maxD|) #6#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #6#))))))
                           (#12#
                            (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|))
                                 (EXIT
                                  (LETT |degs|
                                        (PROGN
                                         (LETT #4# NIL)
                                         (SEQ (LETT |i| 1) (LETT #3# |o|) G190
                                              (COND
                                               ((|greater_SI| |i| #3#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #4#
                                                      (CONS
                                                       (COND
                                                        ((SPADCALL |i|
                                                                   (QCDR |deg|)
                                                                   (QREFELT $
                                                                            356))
                                                         (+ (QCAR |deg|) 1))
                                                        ('T (QCAR |deg|)))
                                                       #4#))))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191
                                              (EXIT (NREVERSE #4#))))))))))
                         (#12#
                          (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|))
                               (EXIT
                                (LETT |degs|
                                      (PROGN
                                       (LETT #2# NIL)
                                       (SEQ (LETT |i| 1) (LETT #1# |o|) G190
                                            (COND
                                             ((|greater_SI| |i| #1#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (COND
                                                      ((SPADCALL |i|
                                                                 (QCDR |deg|)
                                                                 (QREFELT $
                                                                          356))
                                                       (+ (QCAR |deg|) 1))
                                                      ('T (QCAR |deg|)))
                                                     #2#))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191
                                            (EXIT (NREVERSE #2#)))))))))))))
                (LETT |check|
                      (CONS #'|GUESS;guessInterpolateModular!0|
                            (VECTOR $ |sigma| |options| D |o| |list|)))
                (COND
                 ((QEQCAR (SPADCALL |options| (QREFELT $ 358)) 1)
                  (LETT |check|
                        (SPADCALL |check| |lists| (QVELT D 5) (QVELT D 6)
                                  |sigma| (SPADCALL |o| (QVELT D 2))
                                  (QREFELT $ 362))))
                 ((QEQCAR (SPADCALL |options| (QREFELT $ 358)) 0)
                  (SEQ
                   (COND
                    ((SPADCALL |options| (QREFELT $ 363))
                     (SPADCALL "Guess: skipping checks" (QREFELT $ 365))))
                   (EXIT
                    (LETT |check|
                          (LIST #'|GUESS;guessInterpolateModular!1|)))))
                 (#12#
                  (LETT |check|
                        (CONS #'|GUESS;guessInterpolateModular!2|
                              (VECTOR $ |sigma| |options| D |o| |list|)))))
                (EXIT
                 (SPADCALL |lists| |degs| (QVELT D 5) (QVELT D 6) |sigma|
                           (SPADCALL |o| (QVELT D 2)) |check|
                           (QREFELT $ 367)))))
          #11# (EXIT #8#)))) 

(SDEFUN |GUESS;guessInterpolateModular!2| ((|x| NIL) ($$ NIL))
        (PROG (|list| |o| D |options| |sigma| $)
          (LETT |list| (QREFELT $$ 5))
          (LETT |o| (QREFELT $$ 4))
          (LETT D (QREFELT $$ 3))
          (LETT |options| (QREFELT $$ 2))
          (LETT |sigma| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;checkInterpolant| |list| |o| |x| D |options| |sigma| $))))) 

(SDEFUN |GUESS;guessInterpolateModular!1| ((|x| NIL) ($$ NIL)) (CONS 0 "good")) 

(SDEFUN |GUESS;guessInterpolateModular!0| ((|x| NIL) ($$ NIL))
        (PROG (|list| |o| D |options| |sigma| $)
          (LETT |list| (QREFELT $$ 5))
          (LETT |o| (QREFELT $$ 4))
          (LETT D (QREFELT $$ 3))
          (LETT |options| (QREFELT $$ 2))
          (LETT |sigma| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;checkInterpolant| |list| |o| |x| D |options| |sigma| $))))) 

(SDEFUN |GUESS;guessInterpolateFFFG|
        ((|lists| |List| (|List| F)) (|degs| |List| (|Integer|))
         (|o| |NonNegativeInteger|) (|guessDegree| |NonNegativeInteger|)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| #1=(|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|))
         ($ |Matrix| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#2=#:G1080 NIL) (#3=#:G1102 NIL) (|j| NIL) (|c| (S))
          (|cl| (|List| S)) (#4=#:G1101 NIL) (#5=#:G1100 NIL) (#6=#:G1099 NIL)
          (#7=#:G1097 NIL) (|i1| NIL) (#8=#:G1098 NIL) (|i2| NIL)
          (|Mr| (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|m| (|NonNegativeInteger|)) (|rl| (|List| (|Integer|)))
          (|ce| (|List| (|SparseUnivariatePolynomial| S))) (#9=#:G1096 NIL)
          (|i| NIL) (M (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|vguessListF| (|Vector| (|SparseUnivariatePolynomial| F)))
          (|vguessList| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|guessPolys| (|List| (|SparseUnivariatePolynomial| F)))
          (#10=#:G1060 NIL)
          (|guessList| (|List| (|UnivariateFormalPowerSeries| F)))
          (|guessS| #1#) (|sumEta| (|NonNegativeInteger|))
          (|eta| (|List| (|NonNegativeInteger|))) (#11=#:G1095 NIL)
          (#12=#:G1094 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#13=#:G1022 NIL) (#14=#:G1093 NIL) (#15=#:G1092 NIL)
          (#16=#:G1011 NIL) (#17=#:G1091 NIL) (#18=#:G1090 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#19=#:G999 NIL) (#20=#:G1089 NIL) (|d| NIL) (#21=#:G1088 NIL)
          (|list| (|List| F)))
         (SEQ (LETT |list| (|SPADfirst| |lists|))
              (COND
               ((SPADCALL |options| (QREFELT $ 363))
                (SPADCALL "Guess: using FFFG" (QREFELT $ 365))))
              (COND
               ((SPADCALL |options| (QREFELT $ 354))
                (SEQ
                 (LETT |eta|
                       (PROGN
                        (LETT #21# NIL)
                        (SEQ (LETT |d| NIL) (LETT #20# |degs|) G190
                             (COND
                              ((OR (ATOM #20#)
                                   (PROGN (LETT |d| (CAR #20#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #21#
                                     (CONS
                                      (PROG1 (LETT #19# |d|)
                                        (|check_subtype2| (>= #19# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #19#))
                                      #21#))))
                             (LETT #20# (CDR #20#)) (GO G190) G191
                             (EXIT (NREVERSE #21#)))))
                 (EXIT
                  (SPADCALL |eta| 1 (+ (SPADCALL |eta| 1 (QREFELT $ 368)) 1)
                            (QREFELT $ 369)))))
               (#22='T
                (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 355)))
                     (EXIT
                      (COND
                       ((QEQCAR |maxD| 0)
                        (COND
                         ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                          (LETT |eta|
                                (PROGN
                                 (LETT #18# NIL)
                                 (SEQ (LETT |i| 1) (LETT #17# |o|) G190
                                      (COND
                                       ((|greater_SI| |i| #17#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #18#
                                              (CONS
                                               (COND
                                                ((< |i| |o|)
                                                 (+ (QCDR |maxD|) 1))
                                                ('T (QCDR |maxD|)))
                                               #18#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #18#))))))
                         (#22#
                          (SEQ
                           (LETT |deg|
                                 (DIVIDE2
                                  (PROG1
                                      (LETT #16# (- (+ |guessDegree| |o|) 1))
                                    (|check_subtype2| (>= #16# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #16#))
                                  |o|))
                           (EXIT
                            (LETT |eta|
                                  (PROGN
                                   (LETT #15# NIL)
                                   (SEQ (LETT |i| 1) (LETT #14# |o|) G190
                                        (COND
                                         ((|greater_SI| |i| #14#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #15#
                                                (CONS
                                                 (COND
                                                  ((SPADCALL |i| (QCDR |deg|)
                                                             (QREFELT $ 356))
                                                   (+ (QCAR |deg|) 1))
                                                  ('T (QCAR |deg|)))
                                                 #15#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #15#))))))))))
                       (#22#
                        (SEQ
                         (LETT |deg|
                               (DIVIDE2
                                (PROG1 (LETT #13# (- (+ |guessDegree| |o|) 1))
                                  (|check_subtype2| (>= #13# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #13#))
                                |o|))
                         (EXIT
                          (LETT |eta|
                                (PROGN
                                 (LETT #12# NIL)
                                 (SEQ (LETT |i| 1) (LETT #11# |o|) G190
                                      (COND
                                       ((|greater_SI| |i| #11#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #12#
                                              (CONS
                                               (COND
                                                ((SPADCALL |i| (QCDR |deg|)
                                                           (QREFELT $ 356))
                                                 (+ (QCAR |deg|) 1))
                                                ('T (QCAR |deg|)))
                                               #12#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #12#)))))))))))))
              (LETT |sumEta| (SPADCALL (ELT $ 76) |eta| (QREFELT $ 376)))
              (LETT |guessS|
                    (SPADCALL (|GUESS;list2UFPSF| |list| $) (QVELT D 1)))
              (LETT |guessList|
                    (SPADCALL
                     (SPADCALL (SPADCALL |guessS| |o| (QREFELT $ 377))
                               (QREFELT $ 378))
                     (QREFELT $ 379)))
              (LETT |guessPolys|
                    (|GUESS;getListSUPF| |guessList|
                     (PROG1 (LETT #10# (- |sumEta| 1))
                       (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #10#))
                     $))
              (COND
               ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
                (SEQ
                 (LETT |vguessList| (SPADCALL |guessPolys| (QREFELT $ 382)))
                 (EXIT
                  (LETT M
                        (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                                  |vguessList| |eta| (QREFELT $ 384))))))
               ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
                (SEQ
                 (LETT |vguessListF| (SPADCALL |guessPolys| (QREFELT $ 386)))
                 (EXIT
                  (LETT M
                        (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                                  |vguessListF| |eta| (QREFELT $ 388))))))
               (#22#
                (|error|
                 (SPADCALL "Guess: type parameter F should be either equal to"
                           " S or equal to Fraction S" (QREFELT $ 42)))))
              (LETT |rl| NIL)
              (SEQ (LETT |i| 1) (LETT #9# (ANCOLS M)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ
                    (LETT |ce|
                          (SPADCALL (SPADCALL M |i| (QREFELT $ 389))
                                    (QREFELT $ 390)))
                    (EXIT
                     (COND
                      ((QEQCAR
                        (|GUESS;checkInterpolant| |list| |o|
                         (SPADCALL (SPADCALL M |i| (QREFELT $ 389))
                                   (QREFELT $ 390))
                         D |options| |guessDegree| $)
                        0)
                       (LETT |rl| (CONS |i| |rl|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((NULL |rl|) (MAKE_MATRIX 0 0))
                     (#22#
                      (SEQ (LETT |rl| (NREVERSE |rl|)) (LETT |m| (ANROWS M))
                           (LETT |Mr|
                                 (MAKE_MATRIX1 |m| (LENGTH |rl|)
                                               (|spadConstant| $ 391)))
                           (SEQ (LETT |i2| NIL) (LETT #8# |rl|) (LETT |i1| 1)
                                (LETT #7# (LENGTH |rl|)) G190
                                (COND
                                 ((OR (|greater_SI| |i1| #7#) (ATOM #8#)
                                      (PROGN (LETT |i2| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (COND
                                  ((|HasCategory| (QREFELT $ 7) '(|Field|))
                                   (SEQ (LETT |c| (|spadConstant| $ 144))
                                        (EXIT
                                         (SEQ (LETT |j| 1) (LETT #6# |m|) G190
                                              (COND
                                               ((OR (|greater_SI| |j| #6#)
                                                    (NULL
                                                     (SPADCALL |c|
                                                               (QREFELT $
                                                                        392))))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |c|
                                                      (SPADCALL
                                                       (SPADCALL M |j| |i2|
                                                                 (QREFELT $
                                                                          393))
                                                       (QREFELT $ 394)))))
                                              (LETT |j| (|inc_SI| |j|))
                                              (GO G190) G191 (EXIT NIL)))))
                                  ('T
                                   (SEQ
                                    (LETT |cl|
                                          (PROGN
                                           (LETT #5# NIL)
                                           (SEQ (LETT |j| 1) (LETT #4# |m|)
                                                G190
                                                (COND
                                                 ((|greater_SI| |j| #4#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #5#
                                                        (CONS
                                                         (SPADCALL
                                                          (SPADCALL M |j| |i2|
                                                                    (QREFELT $
                                                                             393))
                                                          (QREFELT $ 395))
                                                         #5#))))
                                                (LETT |j| (|inc_SI| |j|))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #5#)))))
                                    (EXIT
                                     (LETT |c|
                                           (SPADCALL |cl| (QREFELT $ 396)))))))
                                 (EXIT
                                  (SEQ (LETT |j| 1) (LETT #3# |m|) G190
                                       (COND
                                        ((|greater_SI| |j| #3#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |Mr| |j| |i1|
                                                   (PROG2
                                                       (LETT #2#
                                                             (SPADCALL
                                                              (SPADCALL M |j|
                                                                        |i2|
                                                                        (QREFELT
                                                                         $
                                                                         393))
                                                              |c|
                                                              (QREFELT $ 397)))
                                                       (QCDR #2#)
                                                     (|check_union2|
                                                      (QEQCAR #2# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 7))
                                                      (|Union|
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 7))
                                                       "failed")
                                                      #2#))
                                                   (QREFELT $ 398))))
                                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |i1|
                                      (PROG1 (|inc_SI| |i1|)
                                        (LETT #8# (CDR #8#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT |Mr|)))))))) 

(SDEFUN |GUESS;guessInterpolate3|
        ((|lists| |List| (|List| F)) (|o| |NonNegativeInteger|)
         (|degreeLoss| |Integer|) (|guessDegree| |NonNegativeInteger|)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|))
         (|vs| |Stream| (|List| (|Integer|)))
         ($ |Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GUESS;guessInterpolate3!1|
                       (VECTOR |options| D |guessDegree| |degreeLoss| |o|
                               |lists| $ |vs|))
                 (QREFELT $ 410))))) 

(SDEFUN |GUESS;guessInterpolate3!1| (($$ NIL))
        (PROG (|vs| $ |lists| |o| |degreeLoss| |guessDegree| D |options|)
          (LETT |vs| (QREFELT $$ 7))
          (LETT $ (QREFELT $$ 6))
          (LETT |lists| (QREFELT $$ 5))
          (LETT |o| (QREFELT $$ 4))
          (LETT |degreeLoss| (QREFELT $$ 3))
          (LETT |guessDegree| (QREFELT $$ 2))
          (LETT D (QREFELT $$ 1))
          (LETT |options| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|degs| NIL) (M0 NIL) (#1=#:G1119 NIL) (M NIL))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |vs| (QREFELT $ 399))
                           (SPADCALL |vs| (QREFELT $ 402)))
                       (SPADCALL (QREFELT $ 401)))
                      ('T
                       (SEQ (LETT |degs| (SPADCALL |vs| (QREFELT $ 403)))
                            (LETT M0
                                  (|GUESS;guessInterpolateModular| |lists|
                                   |degs| |o| |degreeLoss| |guessDegree| D
                                   |options| $))
                            (LETT M
                                  (COND
                                   ((QEQCAR M0 1)
                                    (SEQ
                                     (COND
                                      ((QCDR M0)
                                       (COND
                                        ((SPADCALL
                                          (CONS #'|GUESS;guessInterpolate3!0|
                                                $)
                                          |degs| (QREFELT $ 406))
                                         (EXIT
                                          (|GUESS;guessInterpolateFFFG| |lists|
                                           |degs| |o| |guessDegree| D |options|
                                           $))))))
                                     (EXIT
                                      (PROGN
                                       (LETT #1#
                                             (|GUESS;guessInterpolate3| |lists|
                                              |o| |degreeLoss| |guessDegree| D
                                              |options|
                                              (SPADCALL |vs| (QREFELT $ 407))
                                              $))
                                       (GO #2=#:G1118)))))
                                   ('T (QCDR M0))))
                            (EXIT
                             (SPADCALL M
                                       (|GUESS;guessInterpolate3| |lists| |o|
                                        |degreeLoss| |guessDegree| D |options|
                                        (SPADCALL |vs| (QREFELT $ 407)) $)
                                       (QREFELT $ 408)))))))
                    #2# (EXIT #1#))))))) 

(SDEFUN |GUESS;guessInterpolate3!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 95) (QREFELT $ 404))) 

(SDEFUN |GUESS;listDecr|
        ((|l| |List| (|NonNegativeInteger|)) ($ |List| (|Integer|)))
        (SPADCALL (CONS #'|GUESS;listDecr!0| $) |l| (QREFELT $ 413))) 

(SDEFUN |GUESS;listDecr!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 176) (QREFELT $ 185))) 

(SDEFUN |GUESS;guessInterpolate2|
        ((|lists| |List| (|List| F)) (|o| |NonNegativeInteger|)
         (|degreeLoss| |Integer|) (|guessDegree| |NonNegativeInteger|)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|))
         ($ |Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
        (SPROG
         ((|vs| (|Stream| (|List| (|Integer|))))
          (|vs0| (|Stream| (|List| (|NonNegativeInteger|))))
          (|maxD| (|NonNegativeInteger|))
          (|maxD0| (|Union| (|NonNegativeInteger|) "arbitrary")))
         (SEQ
          (LETT |vs|
                (COND
                 ((SPADCALL |options| (QREFELT $ 354))
                  (SEQ (LETT |maxD0| (SPADCALL |options| (QREFELT $ 355)))
                       (LETT |maxD|
                             (COND ((QEQCAR |maxD0| 0) (QCDR |maxD0|))
                                   (#1='T (- (+ |guessDegree| |o|) 2))))
                       (LETT |vs0|
                             (SPADCALL (+ |guessDegree| |o|) (+ |maxD| 1) |o|
                                       (QREFELT $ 415)))
                       (EXIT
                        (SPADCALL (CONS (|function| |GUESS;listDecr|) $) |vs0|
                                  (QREFELT $ 418)))))
                 (#1#
                  (SPADCALL NIL (SPADCALL (QREFELT $ 419)) (QREFELT $ 420)))))
          (EXIT
           (|GUESS;guessInterpolate3| |lists| |o| |degreeLoss| |guessDegree| D
            |options| |vs| $))))) 

(SDEFUN |GUESS;precCheck|
        ((|list| |List| F) (|resi| |List| (|SparseUnivariatePolynomial| S))
         (|options| |List| (|GuessOption|)) (|sigma| |Integer|)
         (|bad| |Boolean|) ($ |Union| "good" "reject" "no_solution"))
        (SPROG
         ((#1=#:G1177 NIL) (#2=#:G1175 NIL) (|res2| (S)) (|p2val| (S))
          (|p2| (|SparseUnivariatePolynomial| S)) (#3=#:G1187 NIL) (|j| NIL)
          (#4=#:G1174 NIL) (#5=#:G1186 NIL) (|si| (S)) (#6=#:G1185 NIL)
          (|i| NIL) (#7=#:G1176 NIL) (|res1| (S)) (#8=#:G1184 NIL)
          (#9=#:G1183 NIL) (|gl| (|Vector| S)) (#10=#:G1172 NIL)
          (#11=#:G1182 NIL) (#12=#:G1171 NIL) (#13=#:G1181 NIL)
          (#14=#:G1180 NIL) (#15=#:G1173 NIL) (|cden| (S)) (|c2| (S))
          (#16=#:G1141 NIL) (|c1| (S)) (|pp| (S)) (|vd| (S)) (|vi| (F))
          (#17=#:G1179 NIL) (#18=#:G1178 NIL) (|order| (|Integer|))
          (|j0| (|Integer|)) (|svar| (|SingletonAsOrderedSet|))
          (|max_ind| #19=(|Integer|)) (|degree_loss| #19#) (|gl0| (|Vector| F))
          (|m| (|NonNegativeInteger|))
          (|resv| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|homo| (|Boolean|))
          (|homp| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ
          (EXIT
           (SEQ (LETT |homp| (SPADCALL |options| (QREFELT $ 59)))
                (LETT |homo|
                      (COND ((QEQCAR |homp| 1) (QCDR |homp|)) (#20='T 'T)))
                (LETT |resv| (SPADCALL |resi| (QREFELT $ 382)))
                (LETT |m| (QVSIZE |resv|))
                (LETT |gl0| (SPADCALL |list| (QREFELT $ 422)))
                (LETT |degree_loss| (COND (|homo| (- |m| 1)) (#20# (- |m| 2))))
                (COND
                 ((SPADCALL |options| (QREFELT $ 423))
                  (LETT |max_ind| (- (- (QVSIZE |gl0|) |degree_loss|) 1)))
                 (#20# (LETT |max_ind| (- |sigma| 1))))
                (LETT |svar| (SPADCALL (QREFELT $ 425)))
                (LETT |j0| (COND (|homo| 1) (#20# 2))) (LETT |order| 0)
                (EXIT
                 (COND
                  ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
                   (SEQ (LETT |gl| |gl0|)
                        (SEQ (LETT |i| 0) (LETT #18# |max_ind|) G190
                             (COND ((|greater_SI| |i| #18#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |res1| (|spadConstant| $ 144))
                                    (LETT |cden| (|spadConstant| $ 64))
                                    (LETT |si| (SPADCALL |i| (QREFELT $ 426)))
                                    (COND
                                     ((NULL |homo|)
                                      (LETT |res1|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |resv| 1
                                                        (QREFELT $ 427))
                                              |svar| |si| (QREFELT $ 428))
                                             (QREFELT $ 429)))))
                                    (SEQ (LETT |j| |j0|) (LETT #17# |m|) G190
                                         (COND ((> |j| #17#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT $ 427)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT $ 428))
                                                 (QREFELT $ 429)))
                                          (LETT |vi|
                                                (SPADCALL |gl|
                                                          (+
                                                           (- (+ |i| |j|) |j0|)
                                                           1)
                                                          (QREFELT $ 430)))
                                          (LETT |vd|
                                                (SPADCALL |vi| (QREFELT $ 36)))
                                          (LETT |pp|
                                                (SPADCALL |cden| |vd|
                                                          (QREFELT $ 431)))
                                          (LETT |c1|
                                                (PROG2
                                                    (LETT #16#
                                                          (SPADCALL |cden| |pp|
                                                                    (QREFELT $
                                                                             432)))
                                                    (QCDR #16#)
                                                  (|check_union2|
                                                   (QEQCAR #16# 0)
                                                   (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7)
                                                            #21="failed")
                                                   #16#)))
                                          (LETT |c2|
                                                (PROG2
                                                    (LETT #16#
                                                          (SPADCALL |vd| |pp|
                                                                    (QREFELT $
                                                                             432)))
                                                    (QCDR #16#)
                                                  (|check_union2|
                                                   (QEQCAR #16# 0)
                                                   (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7) #21#)
                                                   #16#)))
                                          (LETT |res1|
                                                (SPADCALL
                                                 (SPADCALL |c2| |res1|
                                                           (QREFELT $ 433))
                                                 (SPADCALL
                                                  (SPADCALL |p2val| |c1|
                                                            (QREFELT $ 433))
                                                  (SPADCALL |vi|
                                                            (QREFELT $ 35))
                                                  (QREFELT $ 433))
                                                 (QREFELT $ 372)))
                                          (EXIT
                                           (LETT |cden|
                                                 (SPADCALL |cden| |c2|
                                                           (QREFELT $ 433)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res1| (|spadConstant| $ 144)
                                                 (QREFELT $ 434))
                                       (PROGN
                                        (LETT #15#
                                              (COND
                                               ((< |i| |sigma|)
                                                (PROGN
                                                 (LETT #1#
                                                       (CONS 2 "no_solution"))
                                                 (GO #22=#:G1170)))
                                               ('T
                                                (PROGN
                                                 (LETT #1# (CONS 1 "reject"))
                                                 (GO #22#)))))
                                        (GO #23=#:G1145)))))))
                              #23# (EXIT #15#))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((NULL (SPADCALL |options| (QREFELT $ 423)))
                          (PROGN (LETT #1# (CONS 0 "good")) (GO #22#))))
                        (EXIT
                         (COND
                          (|bad|
                           (PROGN (LETT #1# (CONS 1 "reject")) (GO #22#)))
                          (#20#
                           (SEQ
                            (SEQ (LETT |i| 1) (LETT #14# |degree_loss|) G190
                                 (COND ((|greater_SI| |i| #14#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |si|
                                          (SPADCALL (+ |i| |max_ind|)
                                                    (QREFELT $ 426)))
                                    (SEQ (LETT |j| (- |m| |i|)) (LETT #13# |m|)
                                         G190 (COND ((> |j| #13#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ
                                            (LETT |p2|
                                                  (SPADCALL |resv| |j|
                                                            (QREFELT $ 427)))
                                            (LETT |p2val|
                                                  (SPADCALL
                                                   (SPADCALL |p2| |svar| |si|
                                                             (QREFELT $ 428))
                                                   (QREFELT $ 429)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |p2val|
                                                         (|spadConstant| $ 144)
                                                         (QREFELT $ 434))
                                               (PROGN
                                                (LETT #12#
                                                      (PROGN
                                                       (LETT #1#
                                                             (CONS 0 "good"))
                                                       (GO #22#)))
                                                (GO #24=#:G1148)))))))
                                          #24# (EXIT #12#))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (LETT |res2| (|spadConstant| $ 143))
                                    (COND
                                     (|homo|
                                      (LETT |res2|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |resv| 1
                                                         (QREFELT $ 427))
                                               |svar| |si| (QREFELT $ 428))
                                              (QREFELT $ 429))
                                             (QREFELT $ 49)))))
                                    (SEQ (LETT |j| |j0|)
                                         (LETT #11# (- |m| |i|)) G190
                                         (COND ((> |j| #11#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT $ 427)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT $ 428))
                                                 (QREFELT $ 429)))
                                          (EXIT
                                           (LETT |res2|
                                                 (SPADCALL |res2|
                                                           (SPADCALL |p2val|
                                                                     (SPADCALL
                                                                      |gl|
                                                                      (+
                                                                       (-
                                                                        (+
                                                                         (+ |i|
                                                                            |max_ind|)
                                                                         |j|)
                                                                        |j0|)
                                                                       1)
                                                                      (QREFELT
                                                                       $ 430))
                                                                     (QREFELT $
                                                                              435))
                                                           (QREFELT $ 436)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res2| (|spadConstant| $ 143)
                                                 (QREFELT $ 437))
                                       (PROGN
                                        (LETT #10#
                                              (PROGN
                                               (LETT #1# (CONS 1 "reject"))
                                               (GO #22#)))
                                        (GO #25=#:G1152)))))))
                                  #25# (EXIT #10#))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 0 "good"))
                              (GO #22#)))))))))
                  ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
                   (SEQ (LETT |gl| |gl0|)
                        (SEQ (LETT |i| 0) (LETT #9# |max_ind|) G190
                             (COND ((|greater_SI| |i| #9#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |res1| (|spadConstant| $ 144))
                                    (LETT |si| (SPADCALL |i| (QREFELT $ 426)))
                                    (COND
                                     ((NULL |homo|)
                                      (LETT |res1|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |resv| 1
                                                        (QREFELT $ 427))
                                              |svar| |si| (QREFELT $ 428))
                                             (QREFELT $ 429)))))
                                    (SEQ (LETT |j| |j0|) (LETT #8# |m|) G190
                                         (COND ((> |j| #8#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT $ 427)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT $ 428))
                                                 (QREFELT $ 429)))
                                          (EXIT
                                           (LETT |res1|
                                                 (SPADCALL |res1|
                                                           (SPADCALL |p2val|
                                                                     (SPADCALL
                                                                      |gl|
                                                                      (+
                                                                       (-
                                                                        (+ |i|
                                                                           |j|)
                                                                        |j0|)
                                                                       1)
                                                                      (QREFELT
                                                                       $ 439))
                                                                     (QREFELT $
                                                                              433))
                                                           (QREFELT $ 372)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res1| (|spadConstant| $ 144)
                                                 (QREFELT $ 434))
                                       (PROGN
                                        (LETT #7#
                                              (COND
                                               ((< |i| |sigma|)
                                                (PROGN
                                                 (LETT #1#
                                                       (CONS 2 "no_solution"))
                                                 (GO #22#)))
                                               ('T
                                                (PROGN
                                                 (LETT #1# (CONS 1 "reject"))
                                                 (GO #22#)))))
                                        (GO #26=#:G1158)))))))
                              #26# (EXIT #7#))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((NULL (SPADCALL |options| (QREFELT $ 423)))
                          (PROGN (LETT #1# (CONS 0 "good")) (GO #22#))))
                        (EXIT
                         (COND
                          (|bad|
                           (PROGN (LETT #1# (CONS 1 "reject")) (GO #22#)))
                          (#20#
                           (SEQ
                            (SEQ (LETT |i| 1) (LETT #6# |degree_loss|) G190
                                 (COND ((|greater_SI| |i| #6#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |si|
                                          (SPADCALL (+ |i| |max_ind|)
                                                    (QREFELT $ 426)))
                                    (SEQ (LETT |j| (- |m| |i|)) (LETT #5# |m|)
                                         G190 (COND ((> |j| #5#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ
                                            (LETT |p2|
                                                  (SPADCALL |resv| |j|
                                                            (QREFELT $ 427)))
                                            (LETT |p2val|
                                                  (SPADCALL
                                                   (SPADCALL |p2| |svar| |si|
                                                             (QREFELT $ 428))
                                                   (QREFELT $ 429)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |p2val|
                                                         (|spadConstant| $ 144)
                                                         (QREFELT $ 434))
                                               (PROGN
                                                (LETT #4#
                                                      (PROGN
                                                       (LETT #1#
                                                             (CONS 0 "good"))
                                                       (GO #22#)))
                                                (GO #27=#:G1161)))))))
                                          #27# (EXIT #4#))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (LETT |res2| (|spadConstant| $ 144))
                                    (COND
                                     (|homo|
                                      (LETT |res2|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |resv| 1
                                                        (QREFELT $ 427))
                                              |svar| |si| (QREFELT $ 428))
                                             (QREFELT $ 429)))))
                                    (SEQ (LETT |j| |j0|) (LETT #3# (- |m| |i|))
                                         G190 (COND ((> |j| #3#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT $ 427)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT $ 428))
                                                 (QREFELT $ 429)))
                                          (EXIT
                                           (LETT |res2|
                                                 (SPADCALL |res2|
                                                           (SPADCALL |p2val|
                                                                     (SPADCALL
                                                                      |gl|
                                                                      (+
                                                                       (-
                                                                        (+
                                                                         (+ |i|
                                                                            |max_ind|)
                                                                         |j|)
                                                                        |j0|)
                                                                       1)
                                                                      (QREFELT
                                                                       $ 439))
                                                                     (QREFELT $
                                                                              433))
                                                           (QREFELT $ 372)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res2| (|spadConstant| $ 144)
                                                 (QREFELT $ 434))
                                       (PROGN
                                        (LETT #2#
                                              (PROGN
                                               (LETT #1# (CONS 1 "reject"))
                                               (GO #22#)))
                                        (GO #28=#:G1165)))))))
                                  #28# (EXIT #2#))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 0 "good"))
                              (GO #22#)))))))))
                  (#20# (|error| "F must be S or Fraction(S)"))))))
          #22# (EXIT #1#)))) 

(SDEFUN |GUESS;checkInterpolant|
        ((|list| |List| F) (|o| |NonNegativeInteger|)
         (|resi| |List| (|SparseUnivariatePolynomial| S))
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 #1=(|Vector|
                     (|UnivariateFormalPowerSeries|
                      (|SparseMultivariatePolynomial| F
                                                      (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|)) (|sigma| |Integer|)
         ($ |Union| "good" "reject" "no_solution"))
        (SPROG
         ((#2=#:G1240 NIL) (#3=#:G1238 NIL) (|order| (|Integer|))
          (|c| (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|d| NIL) (|dmax| (|NonNegativeInteger|))
          (|resiSUPF|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#4=#:G1245 NIL) (|i| NIL) (#5=#:G1244 NIL) (|testList| #1#)
          (|flist| (|List| (|PositiveInteger|))) (#6=#:G1219 NIL)
          (#7=#:G1243 NIL) (#8=#:G1242 NIL) (|maxPow| (|Integer|))
          (|maxP| (|Union| (|PositiveInteger|) "arbitrary"))
          (|len| (|NonNegativeInteger|)) (|reject_one_term| (|Boolean|))
          (#9=#:G1239 NIL)
          (|nonZeroCoefficients| (|Union| "one" "several" "none"))
          (#10=#:G1241 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |options| (QREFELT $ 363))
              (SPADCALL "Guess: checking solution" (QREFELT $ 365))))
            (LETT |nonZeroCoefficients| (CONS 2 "none"))
            (LETT |reject_one_term| NIL)
            (SEQ
             (EXIT
              (SEQ (LETT |i| 1) (LETT #10# (LENGTH |resi|)) G190
                   (COND ((|greater_SI| |i| #10#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |resi| |i| (QREFELT $ 440))
                                  (QREFELT $ 441)))
                       (COND
                        ((QEQCAR |nonZeroCoefficients| 2)
                         (LETT |nonZeroCoefficients| (CONS 0 "one")))
                        ('T
                         (SEQ (LETT |nonZeroCoefficients| (CONS 1 "several"))
                              (EXIT
                               (PROGN
                                (LETT #9# |$NoValue|)
                                (GO #11=#:G1196))))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
             #11# (EXIT #9#))
            (COND
             ((NULL (QEQCAR |nonZeroCoefficients| 1))
              (COND
               ((NULL (SPADCALL (ELT $ 353) |list| (QREFELT $ 448)))
                (SEQ (LETT |reject_one_term| 'T)
                     (EXIT
                      (COND
                       ((SPADCALL |options| (QREFELT $ 363))
                        (SPADCALL "Guess: encountered single-term solution"
                                  (QREFELT $ 365))))))))))
            (LETT |len| (LENGTH |list|))
            (LETT |maxP| (SPADCALL |options| (QREFELT $ 57)))
            (COND ((QEQCAR |maxP| 0) (LETT |maxPow| (QCDR |maxP|)))
                  (#12='T (LETT |maxPow| (+ |len| 2))))
            (COND
             ((EQL |maxPow| 1)
              (COND
               ((EQUAL (QVELT D 5) '|shiftHP|)
                (EXIT
                 (|GUESS;precCheck| |list| |resi| |options| |sigma|
                  |reject_one_term| $))))))
            (LETT |flist|
                  (PROGN
                   (LETT #8# NIL)
                   (SEQ (LETT |i| 1) (LETT #7# |o|) G190
                        (COND ((|greater_SI| |i| #7#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |resi| |i| (QREFELT $ 440))
                                       (QREFELT $ 441)))
                            (LETT #8#
                                  (CONS
                                   (PROG1 (LETT #6# |i|)
                                     (|check_subtype2| (> #6# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #6#))
                                   #8#))))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT (NREVERSE #8#)))))
            (LETT |testList|
                  (SPADCALL (|GUESS;list2UFPSSUPF| |list| $)
                            (SPADCALL |flist| (QVELT D 3))))
            (LETT |resiSUPF|
                  (PROGN
                   (LETT #5# NIL)
                   (SEQ (LETT |i| NIL) (LETT #4# |flist|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #5#
                                (CONS
                                 (|GUESS;SUPF2SUPSUPF|
                                  (|GUESS;SUPS2SUPF|
                                   (SPADCALL |resi| |i| (QREFELT $ 440)) $)
                                  $)
                                 #5#))))
                        (LETT #4# (CDR #4#)) (GO G190) G191
                        (EXIT (NREVERSE #5#)))))
            (LETT |order| 0)
            (LETT |dmax| (SPADCALL 10 (LENGTH |list|) (QREFELT $ 449)))
            (SEQ
             (EXIT
              (SEQ (LETT |d| 0) G190 NIL
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 423)))
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN (LETT #2# (CONS 0 "good")) (GO #13=#:G1237))))))
                    (COND
                     (|reject_one_term|
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN (LETT #2# (CONS 1 "reject")) (GO #13#))))))
                    (LETT |c|
                          (SPADCALL (QVELT D 8) |testList| |d|
                                    (SPADCALL |resiSUPF| (QREFELT $ 452))
                                    (QREFELT $ 453)))
                    (COND
                     ((NULL (SPADCALL |c| (QREFELT $ 454)))
                      (SEQ (LETT |order| |d|)
                           (EXIT
                            (PROGN (LETT #3# |$NoValue|) (GO #14=#:G1230))))))
                    (EXIT
                     (COND
                      ((SPADCALL |d| |dmax| (QREFELT $ 222))
                       (SEQ
                        (SPADCALL
                         (SPADCALL "bailing out from checkInterpolant"
                                   (QREFELT $ 456))
                         (QREFELT $ 457))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "please report the input to "
                                    "fricas-devel@googlegroups.com"
                                    (QREFELT $ 42))
                          (QREFELT $ 456))
                         (QREFELT $ 457))
                        (LETT |order| |d|)
                        (EXIT (PROGN (LETT #3# |$NoValue|) (GO #14#))))))))
                   (LETT |d| (|inc_SI| |d|)) (GO G190) G191 (EXIT NIL)))
             #14# (EXIT #3#))
            (EXIT
             (COND
              ((< |order| |sigma|)
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL "Order too low: " (QREFELT $ 456))
                           (SPADCALL |order| (QREFELT $ 458)) (QREFELT $ 459))
                 (QREFELT $ 457))
                (SPADCALL
                 (SPADCALL (SPADCALL "sigma: " (QREFELT $ 456))
                           (SPADCALL |sigma| (QREFELT $ 458)) (QREFELT $ 459))
                 (QREFELT $ 457))
                (EXIT (PROGN (LETT #2# (CONS 2 "no_solution")) (GO #13#)))))
              ((SPADCALL |c| (QREFELT $ 460))
               (SEQ
                (COND
                 ((SPADCALL |options| (QREFELT $ 363))
                  (SEQ
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL "Proposed solution does not fit coefficient "
                               (QREFELT $ 456))
                     (SPADCALL |order| (QREFELT $ 458)) (QREFELT $ 459))
                    (QREFELT $ 457))
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL "sigma: " (QREFELT $ 456))
                               (SPADCALL |sigma| (QREFELT $ 458))
                               (QREFELT $ 459))
                     (QREFELT $ 457))))))
                (EXIT (PROGN (LETT #2# (CONS 1 "reject")) (GO #13#)))))
              (#12# (CONS 0 "good"))))))
          #13# (EXIT #2#)))) 

(SDEFUN |GUESS;wrapInterpolant|
        ((|resi| |List| (|SparseUnivariatePolynomial| S))
         (|exprList| |List| EXPRR) (|initials| |List| F)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|op| |BasicOperator|) (|options| |List| (|GuessOption|)) ($ EXPRR))
        (SPROG
         ((|ex| (|List| EXPRR)) (#1=#:G1276 NIL) (|p| NIL) (#2=#:G1277 NIL)
          (|e| NIL) (#3=#:G1275 NIL) (|eq| (EXPRR)) (#4=#:G1273 NIL)
          (#5=#:G1274 NIL) (#6=#:G1272 NIL) (|dk| (|Symbol|)))
         (SEQ (LETT |dk| (SPADCALL |options| (QREFELT $ 201)))
              (COND
               ((OR (EQUAL |dk| '|displayAsGF|) (EQUAL |dk| '|displayAsEQ|))
                (EXIT
                 (SEQ
                  (LETT |ex|
                        (PROGN
                         (LETT #6# NIL)
                         (SEQ (LETT |e| NIL) (LETT #5# |exprList|)
                              (LETT |p| NIL) (LETT #4# |resi|) G190
                              (COND
                               ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL)
                                    (ATOM #5#)
                                    (PROGN (LETT |e| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (|GUESS;makeEXPRR| (QVELT D 9)
                                        (SPADCALL |options| (QREFELT $ 461))
                                        (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                       #6#))))
                              (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))
                              (GO G190) G191 (EXIT (NREVERSE #6#)))))
                  (LETT |eq|
                        (SPADCALL (SPADCALL (ELT $ 93) |ex| (QREFELT $ 106))
                                  (QREFELT $ 462)))
                  (EXIT
                   (COND ((EQUAL |dk| '|displayAsEQ|) |eq|)
                         (#7='T
                          (SPADCALL |op| (SPADCALL |options| (QREFELT $ 461))
                                    (SPADCALL |options| (QREFELT $ 463)) |eq|
                                    (|GUESS;getVariables| |initials| $)
                                    (SPADCALL (QREFELT $ 10)
                                              (SPADCALL |initials|
                                                        (QREFELT $ 330))
                                              (QREFELT $ 466))
                                    (QREFELT $ 469)))))))))
              (EXIT
               (COND
                ((EQUAL |dk| '|displayAsRec|)
                 (SEQ
                  (LETT |ex|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |e| NIL) (LETT #2# |exprList|)
                              (LETT |p| NIL) (LETT #1# |resi|) G190
                              (COND
                               ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL)
                                    (ATOM #2#)
                                    (PROGN (LETT |e| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (|GUESS;makeEXPRR| (QVELT D 9)
                                        (SPADCALL |options| (QREFELT $ 463))
                                        (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                       #3#))))
                              (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                              (GO G190) G191 (EXIT (NREVERSE #3#)))))
                  (EXIT
                   (SPADCALL |op| (SPADCALL |options| (QREFELT $ 463))
                             (SPADCALL
                              (SPADCALL (ELT $ 93) |ex| (QREFELT $ 106))
                              (QREFELT $ 462))
                             (|GUESS;getVariables| |initials| $)
                             (SPADCALL (QREFELT $ 10)
                                       (SPADCALL |initials| (QREFELT $ 330))
                                       (QREFELT $ 466))
                             (QREFELT $ 470)))))
                (#7# (|error| "wrapInterpolant: unsupported display kind"))))))) 

(SDEFUN |GUESS;guessHPaux|
        ((|lists| |List| (|List| F))
         (D |Record| (|:| |degreeStream| #1=(|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| #2=(|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((#3=#:G1348 NIL) (|reslist| (|List| EXPRR)) (|res| (EXPRR))
          (#4=#:G1350 NIL) (|i| NIL) (|exprList| (|List| EXPRR))
          (MS (|Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
          (M (|Matrix| (|SparseUnivariatePolynomial| S))) (#5=#:G1346 NIL)
          (#6=#:G1328 NIL) (#7=#:G1349 NIL) (#8=#:G1343 NIL) (#9=#:G1291 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|guessDegree| #10=(|Integer|)) (|degreeLoss| (|Integer|))
          (#11=#:G1347 NIL) (#12=#:G1282 NIL) (|o| NIL) (|exprS| #2#)
          (#13=#:G1342 NIL) (|dk| (|Symbol|)) (|degreeS| #1#)
          (|op| (|BasicOperator|)) (|listDegree| #10#) (|list| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |reslist| NIL) (LETT |list| (|SPADfirst| |lists|))
                (LETT |listDegree|
                      (- (- (LENGTH |list|) 1)
                         (SPADCALL |options| (QREFELT $ 471))))
                (COND
                 ((< |listDegree| 0)
                  (PROGN (LETT #3# |reslist|) (GO #14=#:G1341))))
                (LETT |op|
                      (SPADCALL (SPADCALL |options| (QREFELT $ 472))
                                (QREFELT $ 473)))
                (LETT |degreeS| (QVELT D 0))
                (LETT |dk| (SPADCALL |options| (QREFELT $ 201)))
                (LETT |exprS|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |dk| '|displayAsGF|)
                              (EQUAL |dk| '|displayAsEQ|))
                          (SPADCALL
                           (SPADCALL |op|
                                     (SPADCALL
                                      (SPADCALL |options| (QREFELT $ 461))
                                      (QREFELT $ 45))
                                     (QREFELT $ 474))
                           (SPADCALL |options| (QREFELT $ 461)) (QVELT D 4)))
                         ((EQUAL |dk| '|displayAsRec|)
                          (PROGN
                           (LETT #13#
                                 (SPADCALL
                                  (SPADCALL |op|
                                            (SPADCALL
                                             (SPADCALL |options|
                                                       (QREFELT $ 463))
                                             (QREFELT $ 45))
                                            (QREFELT $ 474))
                                  (SPADCALL |options| (QREFELT $ 463))
                                  (QVELT D 4)))
                           (GO #15=#:G1281)))))
                       #15# (EXIT #13#)))
                (SEQ
                 (EXIT
                  (SEQ (LETT |o| 2) G190 NIL
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL |degreeS|
                                      (PROG1 (LETT #12# (- |o| 1))
                                        (|check_subtype2| (>= #12# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #12#))
                                      (QREFELT $ 475))
                            (QREFELT $ 476))
                           (PROGN (LETT #11# |$NoValue|) (GO #16=#:G1339)))
                          ('T
                           (SEQ
                            (LETT |degreeLoss|
                                  (SPADCALL |degreeS| |o| (QREFELT $ 270)))
                            (LETT |guessDegree|
                                  (- (- (+ |listDegree| 2) |degreeLoss|) |o|))
                            (COND
                             ((< |guessDegree| 0)
                              (SEQ
                               (COND
                                ((SPADCALL |options| (QREFELT $ 363))
                                 (SPADCALL
                                  "Guess: not enough values for guessing"
                                  (QREFELT $ 365))))
                               (EXIT (PROGN (LETT #3# |reslist|) (GO #14#))))))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 363))
                              (SPADCALL
                               (SPADCALL
                                (LIST
                                 (SPADCALL "Guess: trying order "
                                           (QREFELT $ 456))
                                 (SPADCALL |o| (QREFELT $ 477))
                                 (SPADCALL ", guessDegree is " (QREFELT $ 456))
                                 (SPADCALL |guessDegree| (QREFELT $ 458)))
                                (QREFELT $ 478))
                               (QREFELT $ 479))))
                            (LETT |maxD| (SPADCALL |options| (QREFELT $ 355)))
                            (EXIT
                             (COND
                              ((QEQCAR |maxD| 0)
                               (COND
                                ((OR
                                  (OR
                                   (SPADCALL
                                    (SPADCALL |degreeS| |o| (QREFELT $ 475))
                                    (QREFELT $ 476))
                                   (NULL
                                    (< (* (QCDR |maxD|) |o|) |guessDegree|)))
                                  (NULL
                                   (SPADCALL (* (QCDR |maxD|) (+ |o| 1))
                                             (-
                                              (- (+ |listDegree| 2)
                                                 (SPADCALL |degreeS| (+ |o| 1)
                                                           (QREFELT $ 270)))
                                              (+ |o| 1))
                                             (QREFELT $ 153))))
                                 (SEQ (LETT |exprList| NIL)
                                      (COND
                                       ((SPADCALL |options| (QREFELT $ 363))
                                        (SEQ
                                         (LETT |exprList|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |exprS| |o|
                                                           (QREFELT $ 480))
                                                 (QREFELT $ 481))
                                                (QREFELT $ 482)))
                                         (SPADCALL
                                          #17="Guess: The list of expressions is"
                                          (QREFELT $ 365))
                                         (EXIT
                                          (SPADCALL
                                           (SPADCALL |exprList|
                                                     (QREFELT $ 483))
                                           (QREFELT $ 479))))))
                                      (LETT MS
                                            (|GUESS;guessInterpolate2| |lists|
                                             |o| |degreeLoss|
                                             (PROG1 (LETT #9# |guessDegree|)
                                               (|check_subtype2| (>= #9# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #9#))
                                             D |options| $))
                                      (EXIT
                                       (SEQ
                                        (EXIT
                                         (SEQ G190 NIL
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((SPADCALL MS (QREFELT $ 484))
                                                  (PROGN
                                                   (LETT #8# |$NoValue|)
                                                   (GO #18=#:G1298)))
                                                 ('T
                                                  (SEQ
                                                   (LETT M
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            485)))
                                                   (LETT MS
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            486)))
                                                   (COND
                                                    ((NULL |exprList|)
                                                     (LETT |exprList|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |exprS|
                                                                       |o|
                                                                       (QREFELT
                                                                        $ 480))
                                                             (QREFELT $ 481))
                                                            (QREFELT $ 482)))))
                                                   (SEQ (LETT |i| 1)
                                                        (LETT #7# (ANCOLS M))
                                                        G190
                                                        (COND
                                                         ((|greater_SI| |i|
                                                                        #7#)
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT |res|
                                                               (|GUESS;wrapInterpolant|
                                                                (SPADCALL
                                                                 (SPADCALL M
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            389))
                                                                 (QREFELT $
                                                                          390))
                                                                |exprList|
                                                                |list| D |op|
                                                                |options| $))
                                                         (EXIT
                                                          (COND
                                                           ((NULL
                                                             (SPADCALL |res|
                                                                       |reslist|
                                                                       (QREFELT
                                                                        $
                                                                        487)))
                                                            (LETT |reslist|
                                                                  (CONS |res|
                                                                        |reslist|))))))
                                                        (LETT |i|
                                                              (|inc_SI| |i|))
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                   (EXIT
                                                    (COND
                                                     ((NULL (NULL |reslist|))
                                                      (COND
                                                       ((SPADCALL |options|
                                                                  (QREFELT $
                                                                           488))
                                                        (PROGN
                                                         (LETT #3# |reslist|)
                                                         (GO #14#))))))))))))
                                              NIL (GO G190) G191 (EXIT NIL)))
                                        #18# (EXIT #8#)))))
                                ((SPADCALL |options| (QREFELT $ 363))
                                 (SPADCALL "Guess: iterating"
                                           (QREFELT $ 365)))))
                              ('T
                               (SEQ (LETT |exprList| NIL)
                                    (COND
                                     ((SPADCALL |options| (QREFELT $ 363))
                                      (SEQ
                                       (LETT |exprList|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |exprS| |o|
                                                         (QREFELT $ 480))
                                               (QREFELT $ 481))
                                              (QREFELT $ 482)))
                                       (SPADCALL #17# (QREFELT $ 365))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |exprList| (QREFELT $ 483))
                                         (QREFELT $ 479))))))
                                    (LETT MS
                                          (|GUESS;guessInterpolate2| |lists|
                                           |o| |degreeLoss|
                                           (PROG1 (LETT #6# |guessDegree|)
                                             (|check_subtype2| (>= #6# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #6#))
                                           D |options| $))
                                    (EXIT
                                     (SEQ
                                      (EXIT
                                       (SEQ G190 NIL
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((SPADCALL MS (QREFELT $ 484))
                                                (PROGN
                                                 (LETT #5# |$NoValue|)
                                                 (GO #19=#:G1335)))
                                               ('T
                                                (SEQ
                                                 (LETT M
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          485)))
                                                 (LETT MS
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          486)))
                                                 (COND
                                                  ((NULL |exprList|)
                                                   (LETT |exprList|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |exprS|
                                                                     |o|
                                                                     (QREFELT $
                                                                              480))
                                                           (QREFELT $ 481))
                                                          (QREFELT $ 482)))))
                                                 (SEQ (LETT |i| 1)
                                                      (LETT #4# (ANCOLS M))
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |i| #4#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (LETT |res|
                                                             (|GUESS;wrapInterpolant|
                                                              (SPADCALL
                                                               (SPADCALL M |i|
                                                                         (QREFELT
                                                                          $
                                                                          389))
                                                               (QREFELT $ 390))
                                                              |exprList| |list|
                                                              D |op| |options|
                                                              $))
                                                       (EXIT
                                                        (COND
                                                         ((NULL
                                                           (SPADCALL |res|
                                                                     |reslist|
                                                                     (QREFELT $
                                                                              487)))
                                                          (LETT |reslist|
                                                                (CONS |res|
                                                                      |reslist|))))))
                                                      (LETT |i| (|inc_SI| |i|))
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (EXIT
                                                  (COND
                                                   ((NULL (NULL |reslist|))
                                                    (COND
                                                     ((SPADCALL |options|
                                                                (QREFELT $
                                                                         488))
                                                      (PROGN
                                                       (LETT #3# |reslist|)
                                                       (GO #14#))))))))))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #19# (EXIT #5#))))))))))))
                       (LETT |o| (|inc_SI| |o|)) (GO G190) G191 (EXIT NIL)))
                 #16# (EXIT #11#))
                (EXIT |reslist|)))
          #14# (EXIT #3#)))) 

(SDEFUN |GUESS;processOptions|
        ((|options| |List| (|GuessOption|))
         ($ |List| (|List| (|GuessOption|))))
        (SPROG
         ((#1=#:G1400 NIL) (#2=#:G1394 NIL) (#3=#:G1392 NIL) (#4=#:G1404 NIL)
          (#5=#:G1358 NIL) (|i| NIL) (#6=#:G1403 NIL)
          (|minP| (|PositiveInteger|))
          (|hom?| (|Union| (|PositiveInteger|) (|Boolean|))) (#7=#:G1367 NIL)
          (#8=#:G1402 NIL) (#9=#:G1401 NIL) (|maxSomos| (|PositiveInteger|))
          (#10=#:G1352 NIL) (#11=#:G1363 NIL) (#12=#:G1361 NIL)
          (|maxD| (|NonNegativeInteger|)) (#13=#:G1355 NIL)
          (|Som?| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |Som?| (SPADCALL |options| (QREFELT $ 62)))
                 (EXIT
                  (COND
                   ((QEQCAR |Som?| 1)
                    (COND
                     ((QCDR |Som?|)
                      (SEQ
                       (LETT |maxD|
                             (PROG2
                                 (LETT #13#
                                       (SPADCALL |options| (QREFELT $ 61)))
                                 (QCDR #13#)
                               (|check_union2| (QEQCAR #13# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "arbitrary")
                                               #13#)))
                       (COND
                        ((QEQCAR (SPADCALL |options| (QREFELT $ 57)) 0)
                         (LETT |maxSomos|
                               (*
                                (PROG1 (LETT #12# |maxD|)
                                  (|check_subtype2| (> #12# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #12#))
                                (PROG2
                                    (LETT #5#
                                          (SPADCALL |options| (QREFELT $ 57)))
                                    (QCDR #5#)
                                  (|check_union2| (QEQCAR #5# 0)
                                                  (|PositiveInteger|)
                                                  (|Union| (|PositiveInteger|)
                                                           #14="arbitrary")
                                                  #5#)))))
                        ((QEQCAR (SPADCALL |options| (QREFELT $ 59)) 0)
                         (LETT |maxSomos|
                               (*
                                (PROG1 (LETT #11# |maxD|)
                                  (|check_subtype2| (> #11# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #11#))
                                (PROG2
                                    (LETT #10#
                                          (SPADCALL |options| (QREFELT $ 59)))
                                    (QCDR #10#)
                                  (|check_union2| (QEQCAR #10# 0)
                                                  (|PositiveInteger|)
                                                  (|Union| (|PositiveInteger|)
                                                           (|Boolean|))
                                                  #10#)))))
                        (#15='T
                         (|error|
                          "Guess: internal error - inconsistent options")))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (PROGN
                                 (LETT #9# NIL)
                                 (SEQ (LETT |i| 2) (LETT #8# |maxSomos|) G190
                                      (COND ((|greater_SI| |i| #8#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #9#
                                              (CONS
                                               (|GUESS;processOptions|
                                                (CONS
                                                 (SPADCALL
                                                  (CONS 0
                                                        (PROG1 (LETT #7# |i|)
                                                          (|check_subtype2|
                                                           (> #7# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #7#)))
                                                  (QREFELT $ 490))
                                                 |options|)
                                                $)
                                               #9#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #9#))))
                                (QREFELT $ 492)))
                         (GO #16=#:G1399))))))))))
            (SEQ (LETT |hom?| (SPADCALL |options| (QREFELT $ 59)))
                 (EXIT
                  (COND
                   ((QEQCAR |hom?| 1)
                    (COND
                     ((QCDR |hom?|)
                      (SEQ
                       (COND
                        ((QEQCAR (SPADCALL |options| (QREFELT $ 62)) 0)
                         (LETT |minP| 2))
                        (#15# (LETT |minP| 1)))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #6# NIL)
                                (SEQ (LETT |i| |minP|)
                                     (LETT #4#
                                           (PROG2
                                               (LETT #5#
                                                     (SPADCALL |options|
                                                               (QREFELT $ 57)))
                                               (QCDR #5#)
                                             (|check_union2| (QEQCAR #5# 0)
                                                             (|PositiveInteger|)
                                                             (|Union|
                                                              (|PositiveInteger|)
                                                              #14#)
                                                             #5#)))
                                     G190 (COND ((> |i| #4#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #6#
                                             (CONS
                                              (SPADCALL
                                               (LIST
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1 (LETT #3# |i|)
                                                         (|check_subtype2|
                                                          (> #3# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #3#)))
                                                 (QREFELT $ 493))
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1 (LETT #2# |i|)
                                                         (|check_subtype2|
                                                          (> #2# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #2#)))
                                                 (QREFELT $ 494)))
                                               |options| (QREFELT $ 495))
                                              #6#))))
                                     (LETT |i| (+ |i| 1)) (GO G190) G191
                                     (EXIT (NREVERSE #6#)))))
                         (GO #16#))))))))))
            (EXIT (LIST |options|))))
          #16# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LLL;98|
        ((|lists| |List| (|List| F)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1420 NIL) (|res| (|List| EXPRR))
          (#2=#:G1422 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))) (#3=#:G1410 NIL)
          (#4=#:G1419 NIL) (#5=#:G1421 NIL) (|li| NIL)
          (|nn| (|NonNegativeInteger|)) (|rl| (|List| (|List| F)))
          (|l| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 496))
                (EXIT
                 (COND
                  ((NULL |lists|)
                   (|error| "guessAlgDep: need at least one list"))
                  ('T
                   (SEQ (LETT |l| (|SPADfirst| |lists|))
                        (LETT |rl| (CDR |lists|)) (LETT |nn| (LENGTH |l|))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |li| NIL) (LETT #5# |rl|) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |li| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (LENGTH |li|) |nn|
                                             (QREFELT $ 147))
                                   (PROGN
                                    (LETT #4#
                                          (|error|
                                           "guessAlgDep: lists must have equal length"))
                                    (GO #6=#:G1406))))))
                               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #4#))
                        (LETT |lopts|
                              (|GUESS;processOptions|
                               (SPADCALL
                                (LIST (SPADCALL '|displayAsEQ| (QREFELT $ 497))
                                      (SPADCALL
                                       (CONS 0
                                             (PROG1 (LETT #3# (LENGTH |lists|))
                                               (|check_subtype2| (> #3# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #3#)))
                                       (QREFELT $ 498)))
                                |options| (QREFELT $ 499))
                               $))
                        (LETT |lres| NIL) (LETT |res| NIL)
                        (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |opts| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |res|
                                    (|GUESS;guessHPaux| |lists|
                                     (SPADCALL |lists| |opts| (QREFELT $ 230))
                                     |opts| $))
                              (COND
                               ((NULL (NULL |res|))
                                (COND
                                 ((SPADCALL |options| (QREFELT $ 488))
                                  (PROGN (LETT #1# |res|) (GO #7=#:G1418))))))
                              (EXIT
                               (LETT |lres|
                                     (SPADCALL |res| |lres| (QREFELT $ 500)))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (NREVERSE |lres|))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LL;99|
        ((|lists| |List| (|List| F)) ($ |List| EXPRR))
        (SPADCALL |lists| NIL (QREFELT $ 501))) 

(SDEFUN |GUESS;guessADE;LLL;100|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1431 NIL) (|res| (|List| EXPRR))
          (#2=#:G1432 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 496))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 497))
                             |options|)
                       $))
                (LETT |lres| NIL) (LETT |res| NIL)
                (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 219)) |opts| $))
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 488))
                          (PROGN (LETT #1# |res|) (GO #3=#:G1430))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 500)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #3# (EXIT #1#)))) 

(SDEFUN |GUESS;guessADE;LL;101| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 503))) 

(SDEFUN |GUESS;guessAlg;LLL;102|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 0) (QREFELT $ 505)) |options|)
                  (QREFELT $ 503))) 

(SDEFUN |GUESS;guessAlg;LL;103| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 506))) 

(SDEFUN |GUESS;guessHolo;LLL;104|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 494)) |options|)
                  (QREFELT $ 503))) 

(SDEFUN |GUESS;guessHolo;LL;105| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 508))) 

(SDEFUN |GUESS;guessPade;LLL;106|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 505))
                              (SPADCALL (CONS 0 1) (QREFELT $ 494)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 510))))
                       (QREFELT $ 511)))
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 503)))))) 

(SDEFUN |GUESS;guessPade;LL;107| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 512))) 

(SDEFUN |GUESS;guessFE;LLL;108|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1460 NIL) (|res| (|List| EXPRR))
          (#2=#:G1461 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 496))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 497))
                             |options|)
                       $))
                (LETT |lres| NIL) (LETT |res| NIL)
                (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 234)) |opts| $))
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 488))
                          (PROGN (LETT #1# |res|) (GO #3=#:G1459))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 500)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #3# (EXIT #1#)))) 

(SDEFUN |GUESS;guessFE;LL;109| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 514))) 

(SDEFUN |GUESS;guessADE;SM;110|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessADE;SM;110!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessADE;SM;110!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#1=#:G1470 NIL) (|res| NIL) (#2=#:G1471 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 496))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsGF| (QREFELT $ 497))
                                     |options| (QREFELT $ 516))
                           $))
                    (LETT |lres| NIL) (LETT |res| NIL)
                    (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GUESS;guessHPaux| (LIST |list|)
                                 (SPADCALL |opts|
                                           (SPADCALL |q| (QREFELT $ 245)))
                                 |opts| $))
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 517)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 488))
                              (PROGN (LETT #1# |res|) (GO #3=#:G1469))))))
                          (EXIT
                           (LETT |lres|
                                 (SPADCALL |res| |lres| (QREFELT $ 500)))))
                         (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 518)))))
              #3# (EXIT #1#))))))) 

(SDEFUN |GUESS;guessHolo;SM;111|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessHolo;SM;111!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessHolo;SM;111!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 74))
                                 (QREFELT $ 494))
                       |z2| (QREFELT $ 516))
                      (SPADCALL |q| (QREFELT $ 519))))))) 

(SDEFUN |GUESS;guessRec;LLL;112|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1485 NIL) (|res| (|List| EXPRR))
          (#2=#:G1486 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 496))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsRec| (QREFELT $ 497))
                             |options|)
                       $))
                (LETT |lres| NIL) (LETT |res| NIL)
                (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 275)) |opts| $))
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 488))
                          (PROGN (LETT #1# |res|) (GO #3=#:G1484))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 500)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #3# (EXIT #1#)))) 

(SDEFUN |GUESS;guessRec;LL;113| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 521))) 

(SDEFUN |GUESS;guessPRec;LLL;114|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 494)) |options|)
                  (QREFELT $ 521))) 

(SDEFUN |GUESS;guessPRec;LL;115| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 523))) 

(SDEFUN |GUESS;guessRat;LLL;116|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 525))
                              (SPADCALL (CONS 0 1) (QREFELT $ 494)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 510))))
                       (QREFELT $ 511)))
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 521)))))) 

(SDEFUN |GUESS;guessRat;LL;117| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 526))) 

(SDEFUN |GUESS;guessRec;SM;118|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessRec;SM;118!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessRec;SM;118!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#1=#:G1509 NIL) (|res| NIL) (#2=#:G1510 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 496))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsRec| (QREFELT $ 497))
                                     |options| (QREFELT $ 516))
                           $))
                    (LETT |lres| NIL) (LETT |res| NIL)
                    (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GUESS;guessHPaux| (LIST |list|)
                                 (SPADCALL |opts|
                                           (SPADCALL |q| (QREFELT $ 324)))
                                 |opts| $))
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 517)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 488))
                              (PROGN (LETT #1# |res|) (GO #3=#:G1508))))))
                          (EXIT
                           (LETT |lres|
                                 (SPADCALL |res| |lres| (QREFELT $ 500)))))
                         (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 518)))))
              #3# (EXIT #1#))))))) 

(SDEFUN |GUESS;guessPRec;SM;119|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessPRec;SM;119!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessPRec;SM;119!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 74))
                                 (QREFELT $ 494))
                       |z2| (QREFELT $ 516))
                      (SPADCALL |q| (QREFELT $ 528))))))) 

(SDEFUN |GUESS;guessRat;SM;120|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessRat;SM;120!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessRat;SM;120!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (LIST
                        (LIST
                         (SPADCALL (CONS 0 (|spadConstant| $ 95))
                                   (QREFELT $ 525))
                         (SPADCALL (CONS 0 (|spadConstant| $ 74))
                                   (QREFELT $ 494)))
                        |z2| (LIST (SPADCALL 'T (QREFELT $ 510))))
                       (QREFELT $ 511))
                      (SPADCALL |q| (QREFELT $ 528))))))) 

(SDEFUN |GUESS;guess;LLLLL;121|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G1621 NIL) (|guess| NIL)
          (|sumGuess| (|List| EXPRR)) (|summ| (EXPRR)) (|init| (EXPRR))
          (#2=#:G1620 NIL) (|var| (|Symbol|)) (|sumList| (|List| F))
          (#3=#:G1619 NIL) (|i| NIL) (#4=#:G1618 NIL) (#5=#:G1612 NIL)
          (#6=#:G1617 NIL) (|prodGuess| (|List| EXPRR)) (|prod| (EXPRR))
          (#7=#:G1616 NIL) (|prodList| (|List| F)) (#8=#:G1615 NIL)
          (#9=#:G1614 NIL)
          (|newMaxLevel| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#10=#:G1533 NIL) (#11=#:G1613 NIL) (|guesser| NIL)
          (|len| (|PositiveInteger|)) (#12=#:G1529 NIL) (|xx| (EXPRR)))
         (SEQ
          (EXIT
           (SEQ (LETT |newMaxLevel| (SPADCALL |options| (QREFELT $ 531)))
                (LETT |xx|
                      (SPADCALL (SPADCALL |options| (QREFELT $ 463))
                                (QREFELT $ 45)))
                (COND
                 ((SPADCALL |options| (QREFELT $ 363))
                  (COND
                   ((QEQCAR |newMaxLevel| 0)
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL "Guess: guessing level " (QREFELT $ 456))
                      (SPADCALL |newMaxLevel| (QREFELT $ 532)) (QREFELT $ 459))
                     (QREFELT $ 479))))))
                (LETT |res| NIL)
                (LETT |len|
                      (PROG1 (LETT #12# (LENGTH |list|))
                        (|check_subtype2| (> #12# 0) '(|PositiveInteger|)
                                          '(|NonNegativeInteger|) #12#)))
                (COND
                 ((SPADCALL |len| 1 (QREFELT $ 533))
                  (PROGN (LETT #5# |res|) (GO #13=#:G1611))))
                (SEQ (LETT |guesser| NIL) (LETT #11# |guessers|) G190
                     (COND
                      ((OR (ATOM #11#) (PROGN (LETT |guesser| (CAR #11#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (SPADCALL (SPADCALL |list| |options| |guesser|)
                                      |res| (QREFELT $ 500)))
                      (EXIT
                       (COND
                        ((SPADCALL |options| (QREFELT $ 488))
                         (COND
                          ((NULL (NULL |res|))
                           (PROGN (LETT #5# |res|) (GO #13#))))))))
                     (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((QEQCAR |newMaxLevel| 0)
                  (COND
                   ((ZEROP (QCDR |newMaxLevel|))
                    (PROGN (LETT #5# |res|) (GO #13#)))
                   (#14='T
                    (LETT |newMaxLevel|
                          (CONS 0
                                (PROG1 (LETT #10# (- (QCDR |newMaxLevel|) 1))
                                  (|check_subtype2| (>= #10# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #10#))))))))
                (COND
                 ((SPADCALL '|guessProduct| |ops| (QREFELT $ 534))
                  (COND
                   ((SPADCALL (|spadConstant| $ 143) |list| (QREFELT $ 535))
                    (SEQ (|spadConstant| $ 143)
                         (EXIT
                          (COND
                           ((SPADCALL |options| (QREFELT $ 363))
                            (SPADCALL
                             "Guess: cannot use guessProduct because of zeros"
                             (QREFELT $ 365)))))))
                   (#14#
                    (SEQ
                     (LETT |prodList|
                           (PROGN
                            (LETT #9# NIL)
                            (SEQ (LETT |i| 1) (LETT #8# (- |len| 1)) G190
                                 (COND ((|greater_SI| |i| #8#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #9#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |list| (+ |i| 1)
                                                     (QREFELT $ 536))
                                           (SPADCALL |list| |i|
                                                     (QREFELT $ 536))
                                           (QREFELT $ 537))
                                          #9#))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT (NREVERSE #9#)))))
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL (ELT $ 546) |prodList| (QREFELT $ 448)))
                        (SEQ
                         (LETT |var|
                               (SPADCALL '|p|
                                         (LIST
                                          (SPADCALL |len| (QREFELT $ 547)))
                                         (QREFELT $ 549)))
                         (LETT |prodGuess| NIL)
                         (SEQ (LETT |guess| NIL)
                              (LETT #7#
                                    (SPADCALL |prodList| |guessers| |ops|
                                              (SPADCALL
                                               (LIST
                                                (SPADCALL |var|
                                                          (QREFELT $ 550))
                                                (SPADCALL |newMaxLevel|
                                                          (QREFELT $ 551)))
                                               |options| (QREFELT $ 499))
                                              (QREFELT $ 553)))
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |guess| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |init|
                                     (SPADCALL
                                      (SPADCALL |list| 1 (QREFELT $ 536))
                                      (QREFELT $ 10)))
                               (LETT |prod|
                                     (SPADCALL |guess|
                                               (SPADCALL |var|
                                                         (SPADCALL
                                                          (|spadConstant| $
                                                                          249)
                                                          (SPADCALL |xx|
                                                                    (|spadConstant|
                                                                     $ 199)
                                                                    (QREFELT $
                                                                             250))
                                                          (QREFELT $ 555))
                                                         (QREFELT $ 557))
                                               (QREFELT $ 559)))
                               (EXIT
                                (LETT |prodGuess|
                                      (CONS
                                       (SPADCALL |init| |prod| (QREFELT $ 104))
                                       |prodGuess|))))
                              (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SEQ (LETT |guess| NIL) (LETT #6# |prodGuess|) G190
                               (COND
                                ((OR (ATOM #6#)
                                     (PROGN (LETT |guess| (CAR #6#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL |guess| |res| (QREFELT $ 487)))
                                   (LETT |res| (CONS |guess| |res|))))))
                               (LETT #6# (CDR #6#)) (GO G190) G191
                               (EXIT NIL))))))))))))
                (COND
                 ((SPADCALL |options| (QREFELT $ 488))
                  (COND
                   ((NULL (NULL |res|)) (PROGN (LETT #5# |res|) (GO #13#))))))
                (COND
                 ((SPADCALL '|guessSum| |ops| (QREFELT $ 534))
                  (SEQ
                   (LETT |sumList|
                         (PROGN
                          (LETT #4# NIL)
                          (SEQ (LETT |i| 1) (LETT #3# (- |len| 1)) G190
                               (COND ((|greater_SI| |i| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |list| (+ |i| 1)
                                                   (QREFELT $ 536))
                                         (SPADCALL |list| |i| (QREFELT $ 536))
                                         (QREFELT $ 560))
                                        #4#))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT (NREVERSE #4#)))))
                   (EXIT
                    (COND
                     ((NULL
                       (SPADCALL
                        (CONS #'|GUESS;guess;LLLLL;121!0| (VECTOR $ |sumList|))
                        |sumList| (QREFELT $ 448)))
                      (SEQ
                       (LETT |var|
                             (SPADCALL '|s|
                                       (LIST (SPADCALL |len| (QREFELT $ 547)))
                                       (QREFELT $ 549)))
                       (LETT |sumGuess| NIL)
                       (SEQ (LETT |guess| NIL)
                            (LETT #2#
                                  (SPADCALL |sumList| |guessers| |ops|
                                            (SPADCALL
                                             (LIST
                                              (SPADCALL |var| (QREFELT $ 550))
                                              (SPADCALL |newMaxLevel|
                                                        (QREFELT $ 551)))
                                             |options| (QREFELT $ 499))
                                            (QREFELT $ 553)))
                            G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |guess| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |init|
                                   (SPADCALL
                                    (SPADCALL |list| 1 (QREFELT $ 536))
                                    (QREFELT $ 10)))
                             (LETT |summ|
                                   (SPADCALL |guess|
                                             (SPADCALL |var|
                                                       (SPADCALL
                                                        (|spadConstant| $ 249)
                                                        (SPADCALL |xx|
                                                                  (|spadConstant|
                                                                   $ 199)
                                                                  (QREFELT $
                                                                           250))
                                                        (QREFELT $ 555))
                                                       (QREFELT $ 557))
                                             (QREFELT $ 562)))
                             (EXIT
                              (LETT |sumGuess|
                                    (CONS
                                     (SPADCALL |init| |summ| (QREFELT $ 93))
                                     |sumGuess|))))
                            (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |guess| NIL) (LETT #1# |sumGuess|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |guess| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL |guess| |res| (QREFELT $ 487)))
                                 (LETT |res| (CONS |guess| |res|))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT NIL))))))))))
                (EXIT |res|)))
          #13# (EXIT #5#)))) 

(SDEFUN |GUESS;guess;LLLLL;121!0| ((|z1| NIL) ($$ NIL))
        (PROG (|sumList| $)
          (LETT |sumList| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL |sumList| (|spadConstant| $ 74)
                                (QREFELT $ 536))
                      (QREFELT $ 561)))))) 

(SDEFUN |GUESS;guess;LL;122| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 526)) (LIST '|guessProduct| '|guessSum|)
                  NIL (QREFELT $ 553))) 

(SDEFUN |GUESS;guess;LLL;123|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 526)) (LIST '|guessProduct| '|guessSum|)
                  |options| (QREFELT $ 553))) 

(SDEFUN |GUESS;guess;LLLL;124|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) ($ |List| EXPRR))
        (SPADCALL |list| |guessers| |ops| NIL (QREFELT $ 553))) 

(DECLAIM (NOTINLINE |Guess;|)) 

(DEFUN |Guess| (&REST #1=#:G1629)
  (SPROG NIL
         (PROG (#2=#:G1630)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|Guess|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |Guess;|) #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Guess|)))))))))) 

(DEFUN |Guess;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|Guess| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT $ (GETREFV 566))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Symbol|))))))))
    (|haddProp| |$ConstructorCache| '|Guess| (LIST DV$1 DV$2 DV$3 DV$4 DV$5)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 24 (CONS (|dispatchFunction| |GUESS;guessExpRat;SM;5|) $))
         (QSETREFV $ 26
                   (CONS (|dispatchFunction| |GUESS;guessBinRat;SM;6|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 245
                   (CONS (|dispatchFunction| |GUESS;diffHP;SM;58|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 324
                   (CONS (|dispatchFunction| |GUESS;shiftHP;SM;81|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 519 (CONS (|dispatchFunction| |GUESS;guessADE;SM;110|) $))
         (QSETREFV $ 520
                   (CONS (|dispatchFunction| |GUESS;guessHolo;SM;111|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 528 (CONS (|dispatchFunction| |GUESS;guessRec;SM;118|) $))
         (QSETREFV $ 529
                   (CONS (|dispatchFunction| |GUESS;guessPRec;SM;119|) $))
         (QSETREFV $ 530
                   (CONS (|dispatchFunction| |GUESS;guessRat;SM;120|) $)))))))
    $))) 

(MAKEPROP '|Guess| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|List| 8)
              (|List| 6) (|List| 489)
              (|GuessExpBin| 6 7 8 (NRTEVAL (QREFELT $ 9))
                             (NRTEVAL (QREFELT $ 10)))
              (0 . |guessExpRat|) |GUESS;guessExpRat;LL;1|
              |GUESS;guessExpRat;LLL;2| (6 . |guessBinRat|)
              |GUESS;guessBinRat;LL;3| |GUESS;guessBinRat;LLL;4|
              (|Mapping| 11 12 13) (|Symbol|) (12 . |guessExpRat|)
              (17 . |guessExpRat|) (22 . |guessBinRat|) (27 . |guessBinRat|)
              (|List| 22) (32 . |variables|) (|List| 27) (|Mapping| 27 7)
              (|List| 7) (|ListFunctions2| 7 27) (37 . |map|) (|Fraction| 7)
              (43 . |numer|) (48 . |denom|) (53 . |setUnion|) (|Mapping| 27 6)
              (|ListFunctions2| 6 27) (59 . |map|) (|String|) (65 . |elt|)
              (|Mapping| 27 27 27) (71 . |reduce|) (77 . |coerce|)
              (|Mapping| 8 22) (|ListFunctions2| 22 8) (82 . |map|)
              (88 . |coerce|) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 7)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomialFunctions2| 7 6) (93 . |map|)
              (|Union| 73 '"arbitrary") (|GuessOptionFunctions0|)
              (99 . |maxPower|) (|Union| 73 89) (104 . |homogeneous|)
              (|Union| 75 '"arbitrary") (109 . |maxDerivative|) (114 . |Somos|)
              (119 . |One|) (123 . |One|) (|Stream| 85) (|Integer|)
              (|PartitionsAndPermutations|) (127 . |partitions|) (133 . |inc|)
              (|Mapping| 66 66) (|Stream| 66) (138 . |stream|)
              (|PositiveInteger|) (144 . |One|) (|NonNegativeInteger|)
              (148 . +) (154 . |partitions|) (|Stream| 65) (|Mapping| 65 66)
              (|StreamFunctions2| 66 65) (161 . |map|) (167 . |partitions|)
              (|StreamFunctions1| 85) (172 . |concat|) (|List| 66)
              (177 . |cons|) (183 . |conjugates|) (188 . |#|) (|Boolean|)
              (193 . =) (|Mapping| 89 85) (199 . |select|) (205 . +) (211 . +)
              (217 . |Zero|) (|Mapping| 66 66 66) (221 . |reduce|) (228 . =)
              (|List| 85) (|Partition|) (234 . |powers|) (239 . |second|)
              (244 . ^) (250 . *) (|Mapping| 8 8 8) (256 . |reduce|)
              (|U32Vector|) (262 . |construct|)
              (|U32VectorPolynomialOperations|) (267 . |differentiate|)
              (274 . |pow|) (282 . |truncated_multiplication|)
              (|Mapping| 107 107 107) (|List| 107) (290 . |reduce|) (|Void|)
              (296 . |copy_first|) (|UnivariateFormalPowerSeries| 6) (303 . ^)
              (309 . *) (|Mapping| 118 118 118) (|List| 118) (315 . |reduce|)
              (321 . ^) (|Mapping| 6 6) (327 . |map|)
              (|UnivariateFormalPowerSeriesFunctions| 6) (333 . |hadamard|)
              (|SparseMultivariatePolynomial| 6 75) (339 . ^)
              (|Mapping| 129 129) (|UnivariateFormalPowerSeries| 129)
              (345 . |map|) (|UnivariateFormalPowerSeriesFunctions| 129)
              (351 . |hadamard|) (|Mapping| 132 132 132) (|List| 132)
              (357 . |reduce|) (|Stream| 118) (|Mapping| 118 85)
              (|StreamFunctions2| 85 118) (363 . |map|) (369 . |Zero|)
              (373 . |Zero|) (|Vector| 107) (377 . |setelt!|) (384 . ~=)
              (390 . |differentiate|) (396 . |Zero|) (400 . *) (|Vector| 132)
              (406 . |setelt!|) (413 . <=) (|Union| $ '"failed")
              (419 . |subtractIfCan|) (|List| 100) (425 . |position|) (431 . >)
              (|Reference| 156) (437 . |deref|) (442 . |coerce|)
              (447 . |partition|) (|Reference| 99) (452 . |deref|)
              (457 . |setref|) (463 . |setref|) (469 . |max|) (475 . |first|)
              (|Mapping| 66 85) (|ListFunctions2| 85 66) (480 . |map|)
              (486 . |reduce|) (492 . |ref|) (497 . |ref|) (502 . |#|)
              (507 . |One|) (511 . |first|) (516 . |vector|) (521 . |vector|)
              (|Stream| 8) (|Mapping| 8 85) (|StreamFunctions2| 85 8)
              (526 . |map|) (532 . |empty?|) (537 . -) (543 . |max|)
              (|Stream| 75) (|Mapping| 75 85 75) (|StreamFunctions2| 85 75)
              (549 . |scan|) (556 . D) (563 . D) (569 . D)
              (|FractionFreeFastGaussian| 7 52) (575 . |DiffAction|)
              (|FractionFreeFastGaussian| 129 132) (582 . |DiffAction|)
              (589 . |DiffC|) (594 . |One|) (598 . |maxMixedDegree|)
              (603 . |displayKind|) (608 . |One|) (612 . |first|)
              (618 . |complete|) (623 . |entries|) (628 . |elt|) (634 . |One|)
              (|Mapping| 139 118) (|Mapping| 145 114 66 66) (|Mapping| 209 75)
              (|Mapping| 151 132) (|Mapping| 211 312) (|Mapping| 180 8 22)
              (|Mapping| 7 75 75 52) (|Mapping| 129 75 75 132)
              (|Mapping| 8 75 22 8) (|Mapping| 31 75)
              (|Record| (|:| |degreeStream| 187) (|:| |guessStream| 208)
                        (|:| |guessModGen| 210) (|:| |testGen| 212)
                        (|:| |exprStream| 213) (|:| |kind| 22) (|:| |qvar| 22)
                        (|:| A 214) (|:| AF 215) (|:| AX 216) (|:| C 217))
              |GUESS;diffHP;LR;43| (638 . |elt|) (644 . |functionNames|)
              (649 . >) (655 . ~=) (661 . |coerce|) (666 . ~=) (|List| 12)
              (672 . |elt|) (|Mapping| 75 85) (678 . |map|)
              |GUESS;algDepHP;LLR;47| (684 . |eval|)
              (691 . |multiplyExponents|) (697 . |multiplyExponents|)
              |GUESS;substHP;LR;51| (703 . |coerce|) (708 . *) (|Mapping| 6 66)
              (714 . |multiplyCoefficients|) (720 . |coerce|)
              (|Mapping| 129 66) (725 . |multiplyCoefficients|) (731 . |zero?|)
              (736 . =) (|Mapping| 218 13) (742 . |diffHP|) (747 . |coerce|)
              (752 . |factorial|) (757 . /) (763 . |Zero|) (767 . -)
              (773 . |quoByVar|) (|Mapping| 118 118) (|MappingPackage1| 118)
              (778 . ^) (784 . |quoByVar|) (|Mapping| 132 132)
              (|MappingPackage1| 132) (789 . ^)
              (|IntegerCombinatoricFunctions| 66) (795 . |stirling2|)
              (801 . |ShiftAction|) (808 . |ShiftAction|) (815 . |ShiftC|)
              (820 . |monomial|) (826 . -) (|Fraction| 66) (832 . |One|)
              (836 . -) (841 . ^) (847 . |elt|) (853 . |One|)
              (857 . |monomial|) (863 . -) (869 . ^) |GUESS;shiftHP;LR;68|
              (875 . *) (881 . ^) (887 . |coerce|) (892 . |qShiftAction|)
              (900 . |qShiftAction|) (908 . |qShiftC|) (914 . *) (920 . |elt|)
              (|Mapping| 122 118) (|StreamTensor| 118) (926 . |tensorMap|)
              (932 . |#|) (937 . |new|) (|SingleInteger|) (943 . |One|)
              (947 . ^) (953 . |rem|) (959 . |setelt!|) (966 . /)
              (972 . |ceiling|) (977 . |rest|) (982 . |copy|) (987 . |elt|)
              (993 . |cons|) (999 . |reverse!|) (|List| 145) (1004 . |cons|)
              (1010 . |rem|) (1016 . -) (1021 . |reverse!|) (|List| $)
              (1026 . |concat|) (1031 . |Zero|) (|Mapping| 318 75)
              (|StreamTensor| 75) (1035 . |tensorMap|) (|List| 73)
              (1041 . |first|) (1046 . >) (1052 . *) (1058 . |elt|)
              (1064 . |concat|) (|List| 75) (1070 . |cons|) (1076 . |reverse!|)
              (|Mapping| 11 8) (|StreamTensor| 8) (1081 . |tensorMap|)
              (1087 . |shiftHP|) (1092 . |zero?|) (1097 . |leadingCoefficient|)
              (1102 . |degree|) (1107 . |reductum|) (|Stream| 6)
              (1112 . |coerce|) (1117 . |series|) (|List| 129) (|Stream| 129)
              (1122 . |coerce|) (|IndexedExponents| 75) (1127 . |monomial|)
              (1133 . |monomial|) (|StreamFunctions2| 66 129) (1139 . |map|)
              (1145 . |concat|) (1151 . |series|)
              (|SparseUnivariatePolynomial| 129) (|Mapping| 129 6)
              (|SparseUnivariatePolynomialFunctions2| 6 129) (1156 . |map|)
              (|UnivariatePolynomial| (NRTEVAL '|x|) 6)
              (1162 . |univariatePolynomial|) (1168 . |makeSUP|) (|List| 50)
              (|Mapping| 50 118) (|ListFunctions2| 118 50) (1173 . |map|)
              (1179 . |zero?|) (1184 . |allDegrees|) (1189 . |maxDegree|)
              (1194 . <=) (|Union| '"skip" '"MonteCarlo" '"deterministic")
              (1200 . |check|) (|Union| '"good" '"reject" '"no_solution")
              (|Mapping| 359 380) (|ModularHermitePadeSolver| 6 7)
              (1205 . |gen_Monte_Carlo_check|) (1215 . |debug|)
              (|OutputPackage|) (1220 . |output|) (|Union| 383 89)
              (1225 . |HP_solve|) (1236 . |elt|) (1242 . |setelt!|) (1249 . +)
              (1255 . +) (1261 . +) (1267 . +) (1273 . +) (|Mapping| 75 75 75)
              (1279 . |reduce|) (1285 . |first|) (1291 . |complete|)
              (1296 . |entries|) (|List| 52) (|Vector| 52) (1301 . |vector|)
              (|Matrix| 52) (1306 . |generalInterpolation|) (|Vector| 50)
              (1314 . |vector|) (|FractionFreeFastGaussianFractions| 7 52 50)
              (1319 . |generalInterpolation|) (1327 . |column|)
              (1333 . |entries|) (1338 . |Zero|) (1342 . |zero?|)
              (1347 . |elt|) (1354 . |leadingCoefficient|) (1359 . |content|)
              (1364 . |gcd|) (1369 . |exquo|) (1375 . |setelt!|)
              (1383 . |explicitlyEmpty?|) (|Stream| 383) (1388 . |empty|)
              (1392 . |empty?|) (1397 . |frst|) (1402 . >=) (|Mapping| 89 66)
              (1408 . |every?|) (1414 . |rst|) (1419 . |concat|) (|Mapping| $)
              (1425 . |delay|) (|Mapping| 66 75) (|ListFunctions2| 75 66)
              (1430 . |map|) (|Stream| 318) (1436 . |genVectorStream|)
              (|Mapping| 85 318) (|StreamFunctions2| 318 85) (1443 . |map|)
              (1449 . |empty|) (1453 . |concat|) (|Vector| 6) (1459 . |vector|)
              (1464 . |checkExtraValues|) (|SingletonAsOrderedSet|)
              (1469 . |create|) (1473 . |coerce|) (1478 . |elt|)
              (1484 . |eval|) (1491 . |retract|) (1496 . |elt|) (1502 . |gcd|)
              (1508 . |exquo|) (1514 . *) (1520 . ~=) (1526 . *) (1532 . +)
              (1538 . ~=) (|Vector| 7) (1544 . |elt|) (1550 . |elt|)
              (1556 . |zero?|) (1561 . |zero?|) (1566 . |zero?|)
              (1571 . |zero?|) (1576 . |zero?|) (1581 . |zero?|)
              (|Mapping| 89 6) (1586 . |every?|) (1592 . *) (|List| 342)
              (|Vector| 342) (1598 . |vector|) (1603 . |generalCoefficient|)
              (1611 . |zero?|) (|OutputForm|) (1616 . |message|)
              (1621 . |print|) (1626 . |coerce|) (1631 . |hconcat|)
              (1637 . |ground?|) (1642 . |variableName|) (1647 . |numerator|)
              (1652 . |indexName|) (|Mapping| 8 6) (|StreamFunctions2| 6 8)
              (1657 . |map|) (|BasicOperator|) (|RecurrenceOperator| 66 8)
              (1663 . |makeFEq|) (1673 . |makeRec|) (1682 . |safety|)
              (1687 . |functionName|) (1692 . |operator|) (1697 . |elt|)
              (1703 . |rest|) (1709 . |empty?|) (1714 . |coerce|)
              (1719 . |hconcat|) (1724 . |output|) (1729 . |first|)
              (1735 . |complete|) (1740 . |entries|) (1745 . |coerce|)
              (1750 . |empty?|) (1755 . |first|) (1760 . |rst|)
              (1765 . |member?|) (1771 . |one|) (|GuessOption|)
              (1776 . |Somos|) (|List| 13) (1781 . |concat|)
              (1786 . |homogeneous|) (1791 . |maxPower|) (1796 . |concat|)
              (1802 . |checkOptions|) (1807 . |displayKind|)
              (1812 . |maxSubst|) (1817 . |append|) (1823 . |append|)
              |GUESS;guessAlgDep;LLL;98| |GUESS;guessAlgDep;LL;99|
              |GUESS;guessADE;LLL;100| |GUESS;guessADE;LL;101|
              (1829 . |maxDerivative|) |GUESS;guessAlg;LLL;102|
              |GUESS;guessAlg;LL;103| |GUESS;guessHolo;LLL;104|
              |GUESS;guessHolo;LL;105| (1834 . |allDegrees|) (1839 . |concat|)
              |GUESS;guessPade;LLL;106| |GUESS;guessPade;LL;107|
              |GUESS;guessFE;LLL;108| |GUESS;guessFE;LL;109| (1844 . |cons|)
              (1850 . |empty?|) (1855 . |reverse!|) (1860 . |guessADE|)
              (1865 . |guessHolo|) |GUESS;guessRec;LLL;112|
              |GUESS;guessRec;LL;113| |GUESS;guessPRec;LLL;114|
              |GUESS;guessPRec;LL;115| (1870 . |maxShift|)
              |GUESS;guessRat;LLL;116| |GUESS;guessRat;LL;117|
              (1875 . |guessRec|) (1880 . |guessPRec|) (1885 . |guessRat|)
              (1890 . |maxLevel|) (1895 . |coerce|) (1900 . <=)
              (1906 . |member?|) (1912 . |member?|) (1918 . |elt|) (1924 . /)
              (1930 . |one?|) (1935 . |one?|) (1940 . |one?|) (1945 . |one?|)
              (1950 . |one?|) (1955 . |one?|) (1960 . |one?|) (1965 . |one?|)
              (1970 . |one?|) (1975 . |coerce|) (|List| 455)
              (1980 . |subscript|) (1986 . |indexName|) (1991 . |maxLevel|)
              (|List| 21) |GUESS;guess;LLLLL;121| (|Segment| 8)
              (1996 . SEGMENT) (|SegmentBinding| 8) (2002 . |equation|)
              (|SegmentBinding| $) (2008 . |product|) (2014 . -) (2020 . =)
              (2026 . |summation|) |GUESS;guess;LL;122| |GUESS;guess;LLL;123|
              |GUESS;guess;LLLL;124|)
           '#(|substHP| 2032 |shiftHP| 2037 |guessRec| 2047 |guessRat| 2063
              |guessPade| 2079 |guessPRec| 2090 |guessHolo| 2106 |guessFE| 2122
              |guessExpRat| 2133 |guessBinRat| 2149 |guessAlgDep| 2165
              |guessAlg| 2176 |guessADE| 2187 |guess| 2203 |diffHP| 2229
              |algDepHP| 2239)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 565
                                                 '(2 14 11 12 13 15 2 14 11 12
                                                   13 18 1 14 21 22 23 1 0 21
                                                   22 24 1 14 21 22 25 1 0 21
                                                   22 26 1 7 27 0 28 2 32 29 30
                                                   31 33 1 34 7 0 35 1 34 7 0
                                                   36 2 27 0 0 0 37 2 39 29 38
                                                   12 40 2 41 0 0 0 42 2 29 27
                                                   43 0 44 1 8 0 22 45 2 47 11
                                                   46 27 48 1 34 0 7 49 2 53 50
                                                   51 52 54 1 56 55 13 57 1 56
                                                   58 13 59 1 56 60 13 61 1 56
                                                   58 13 62 0 6 0 63 0 7 0 64 2
                                                   67 65 66 66 68 1 66 0 0 69 2
                                                   71 0 70 66 72 0 73 0 74 2 75
                                                   0 0 0 76 3 67 65 66 66 66 77
                                                   2 80 78 79 71 81 1 67 65 66
                                                   82 1 83 65 78 84 2 65 0 85 0
                                                   86 1 67 65 65 87 1 85 75 0
                                                   88 2 75 89 0 0 90 2 65 0 91
                                                   0 92 2 8 0 0 0 93 2 66 0 0 0
                                                   94 0 75 0 95 3 85 66 96 0 66
                                                   97 2 66 89 0 0 98 1 100 99
                                                   85 101 1 85 66 0 102 2 8 0 0
                                                   75 103 2 8 0 0 0 104 2 11 8
                                                   105 0 106 1 107 0 85 108 3
                                                   109 107 107 75 66 110 4 109
                                                   107 107 73 75 66 111 4 109
                                                   107 107 107 66 66 112 2 114
                                                   107 113 0 115 3 109 116 107
                                                   107 66 117 2 118 0 0 75 119
                                                   2 118 0 0 0 120 2 122 118
                                                   121 0 123 2 6 0 0 75 124 2
                                                   118 0 125 0 126 2 127 118
                                                   118 118 128 2 129 0 0 75 130
                                                   2 132 0 131 0 133 2 134 132
                                                   132 132 135 2 137 132 136 0
                                                   138 2 141 139 140 65 142 0 6
                                                   0 143 0 7 0 144 3 145 107 0
                                                   66 107 146 2 75 89 0 0 147 2
                                                   109 107 107 66 148 0 132 0
                                                   149 2 132 0 0 0 150 3 151
                                                   132 0 66 132 152 2 66 89 0 0
                                                   153 2 100 154 0 0 155 2 156
                                                   66 100 0 157 2 66 89 0 0 158
                                                   1 159 156 0 160 1 100 85 0
                                                   161 1 100 0 85 162 1 163 99
                                                   0 164 2 163 99 0 99 165 2
                                                   159 156 0 156 166 2 66 0 0 0
                                                   167 1 85 66 0 168 2 170 85
                                                   169 99 171 2 85 66 96 0 172
                                                   1 163 0 99 173 1 159 0 156
                                                   174 1 114 75 0 175 0 75 0
                                                   176 1 114 107 0 177 1 145 0
                                                   114 178 1 151 0 137 179 2
                                                   182 180 181 65 183 1 85 89 0
                                                   184 2 66 0 0 0 185 2 75 0 0
                                                   0 186 3 189 187 75 188 65
                                                   190 3 8 0 0 22 75 191 2 118
                                                   0 0 75 192 2 132 0 0 75 193
                                                   3 194 7 75 75 52 195 3 196
                                                   129 75 75 132 197 1 194 31
                                                   75 198 0 8 0 199 1 56 75 13
                                                   200 1 56 22 13 201 0 118 0
                                                   202 2 65 0 0 75 203 1 65 0 0
                                                   204 1 65 99 0 205 2 65 85 0
                                                   66 206 0 132 0 207 2 11 8 0
                                                   66 220 1 56 27 13 221 2 75
                                                   89 0 0 222 2 66 89 0 0 223 1
                                                   22 0 41 224 2 22 89 0 0 225
                                                   2 226 12 0 66 227 2 189 187
                                                   228 65 229 3 8 0 0 0 0 231 2
                                                   118 0 0 73 232 2 132 0 0 73
                                                   233 1 6 0 22 235 2 66 0 75 0
                                                   236 2 118 0 237 0 238 1 129
                                                   0 6 239 2 132 0 240 0 241 1
                                                   66 89 0 242 2 22 89 0 0 243
                                                   1 0 244 22 245 1 8 0 66 246
                                                   1 66 0 0 247 2 8 0 0 0 248 0
                                                   8 0 249 2 8 0 0 0 250 1 118
                                                   0 0 251 2 253 252 252 75 254
                                                   1 132 0 0 255 2 257 256 256
                                                   75 258 2 259 66 66 66 260 3
                                                   194 7 75 75 52 261 3 196 129
                                                   75 75 132 262 1 194 31 75
                                                   263 2 118 0 6 75 264 2 118 0
                                                   0 0 265 0 266 0 267 1 266 0
                                                   0 268 2 118 0 0 266 269 2
                                                   187 75 0 66 270 0 129 0 271
                                                   2 132 0 129 75 272 2 132 0 0
                                                   0 273 2 132 0 0 266 274 2 8
                                                   0 75 0 276 2 8 0 0 0 277 1 7
                                                   0 22 278 4 194 7 7 75 75 52
                                                   279 4 196 129 129 75 75 132
                                                   280 2 194 31 7 75 281 2 118
                                                   0 6 0 282 2 118 0 0 0 283 2
                                                   285 139 139 284 286 1 107 75
                                                   0 287 2 107 0 75 66 288 0
                                                   289 0 290 2 66 0 0 75 291 2
                                                   66 0 0 0 292 3 107 66 0 66
                                                   66 293 2 266 0 66 66 294 1
                                                   266 66 0 295 1 114 0 0 296 1
                                                   107 0 0 297 2 107 66 0 66
                                                   298 2 114 0 107 0 299 1 114
                                                   0 0 300 2 301 0 145 0 302 2
                                                   75 0 0 0 303 1 289 0 0 304 1
                                                   301 0 0 305 1 145 0 306 307
                                                   0 289 0 308 2 310 187 187
                                                   309 311 1 312 73 0 313 2 73
                                                   89 0 0 314 2 132 0 129 0 315
                                                   2 132 0 0 0 316 2 137 0 0 0
                                                   317 2 318 0 75 0 319 1 137 0
                                                   0 320 2 322 180 180 321 323
                                                   1 0 244 22 324 1 50 89 0 325
                                                   1 50 6 0 326 1 50 75 0 327 1
                                                   50 0 0 328 1 329 0 12 330 1
                                                   118 0 329 331 1 333 0 332
                                                   334 2 335 0 75 75 336 2 129
                                                   0 6 335 337 2 338 333 240 71
                                                   339 2 333 0 0 0 340 1 132 0
                                                   333 341 2 344 342 343 50 345
                                                   2 118 346 0 75 347 1 346 50
                                                   0 348 2 351 349 350 122 352
                                                   1 6 89 0 353 1 56 89 13 354
                                                   1 56 60 13 355 2 75 89 0 0
                                                   356 1 56 357 13 358 6 361
                                                   360 360 226 22 22 75 209 362
                                                   1 56 89 13 363 1 364 116 41
                                                   365 7 361 366 226 85 22 22
                                                   75 209 360 367 2 318 75 0 66
                                                   368 3 318 75 0 66 75 369 2
                                                   118 0 0 0 370 2 132 0 0 0
                                                   371 2 7 0 0 0 372 2 50 0 0 0
                                                   373 2 6 0 0 0 374 2 318 75
                                                   375 0 376 2 139 0 0 75 377 1
                                                   139 0 0 378 1 139 122 0 379
                                                   1 381 0 380 382 4 194 383 31
                                                   214 381 318 384 1 385 0 349
                                                   386 4 387 383 31 214 385 318
                                                   388 2 383 381 0 66 389 1 381
                                                   380 0 390 0 52 0 391 1 7 89
                                                   0 392 3 383 52 0 66 66 393 1
                                                   52 7 0 394 1 52 7 0 395 1 7
                                                   0 306 396 2 52 154 0 7 397 4
                                                   383 52 0 66 66 52 398 1 65
                                                   89 0 399 0 400 0 401 1 65 89
                                                   0 402 1 65 85 0 403 2 66 89
                                                   0 0 404 2 85 89 405 0 406 1
                                                   65 0 0 407 2 400 0 383 0 408
                                                   1 400 0 409 410 2 412 85 411
                                                   318 413 3 194 414 75 75 75
                                                   415 2 417 65 416 414 418 0
                                                   65 0 419 2 65 0 85 0 420 1
                                                   421 0 12 422 1 56 89 13 423
                                                   0 424 0 425 1 7 0 66 426 2
                                                   381 52 0 66 427 3 52 0 0 424
                                                   7 428 1 52 7 0 429 2 421 6 0
                                                   66 430 2 7 0 0 0 431 2 7 154
                                                   0 0 432 2 7 0 0 0 433 2 7 89
                                                   0 0 434 2 34 0 7 0 435 2 34
                                                   0 0 0 436 2 34 89 0 0 437 2
                                                   438 7 0 66 439 2 380 52 0 66
                                                   440 1 52 89 0 441 1 8 89 0
                                                   442 1 118 89 0 443 1 132 89
                                                   0 444 1 75 89 0 445 1 383 89
                                                   0 446 2 12 89 447 0 448 2 75
                                                   0 73 0 449 1 451 0 450 452 4
                                                   196 129 215 151 75 451 453 1
                                                   129 89 0 454 1 455 0 41 456
                                                   1 455 116 0 457 1 66 455 0
                                                   458 2 455 0 0 0 459 1 129 89
                                                   0 460 1 56 22 13 461 1 8 0 0
                                                   462 1 56 22 13 463 2 465 180
                                                   464 329 466 6 468 8 467 22
                                                   22 8 11 180 469 5 468 8 467
                                                   22 8 11 180 470 1 56 75 13
                                                   471 1 56 22 13 472 1 467 0
                                                   22 473 2 8 0 467 0 474 2 187
                                                   0 0 75 475 1 187 89 0 476 1
                                                   75 455 0 477 1 455 0 306 478
                                                   1 364 116 455 479 2 180 0 0
                                                   75 480 1 180 0 0 481 1 180
                                                   11 0 482 1 11 455 0 483 1
                                                   400 89 0 484 1 400 383 0 485
                                                   1 400 0 0 486 2 11 89 8 0
                                                   487 1 56 89 13 488 1 489 0
                                                   58 490 1 491 0 306 492 1 489
                                                   0 58 493 1 489 0 55 494 2 13
                                                   0 0 0 495 1 56 116 13 496 1
                                                   489 0 22 497 1 489 0 55 498
                                                   2 13 0 0 0 499 2 11 0 0 0
                                                   500 1 489 0 60 505 1 489 0
                                                   89 510 1 13 0 306 511 2 13 0
                                                   489 0 516 1 11 89 0 517 1 11
                                                   0 0 518 1 0 21 22 519 1 0 21
                                                   22 520 1 489 0 60 525 1 0 21
                                                   22 528 1 0 21 22 529 1 0 21
                                                   22 530 1 56 60 13 531 1 60
                                                   455 0 532 2 73 89 0 0 533 2
                                                   27 89 22 0 534 2 12 89 6 0
                                                   535 2 12 6 0 66 536 2 6 0 0
                                                   0 537 1 8 89 0 538 1 118 89
                                                   0 539 1 66 89 0 540 1 132 89
                                                   0 541 1 75 89 0 542 1 7 89 0
                                                   543 1 50 89 0 544 1 52 89 0
                                                   545 1 6 89 0 546 1 73 455 0
                                                   547 2 22 0 0 548 549 1 489 0
                                                   22 550 1 489 0 60 551 2 554
                                                   0 8 8 555 2 556 0 22 554 557
                                                   2 8 0 0 558 559 2 6 0 0 0
                                                   560 2 6 89 0 0 561 2 8 0 0
                                                   558 562 1 0 218 13 234 1 1
                                                   244 22 324 1 0 218 13 275 1
                                                   1 21 22 528 2 0 11 12 13 521
                                                   1 0 11 12 522 1 1 21 22 530
                                                   2 0 11 12 13 526 1 0 11 12
                                                   527 2 0 11 12 13 512 1 0 11
                                                   12 513 1 1 21 22 529 1 0 11
                                                   12 524 2 0 11 12 13 523 1 1
                                                   21 22 520 1 0 11 12 509 2 0
                                                   11 12 13 508 2 0 11 12 13
                                                   514 1 0 11 12 515 1 1 21 22
                                                   24 2 0 11 12 13 17 1 0 11 12
                                                   16 1 1 21 22 26 1 0 11 12 19
                                                   2 0 11 12 13 20 1 0 11 226
                                                   502 2 0 11 226 13 501 1 0 11
                                                   12 507 2 0 11 12 13 506 1 1
                                                   21 22 519 2 0 11 12 13 503 1
                                                   0 11 12 504 2 0 11 12 13 564
                                                   1 0 11 12 563 4 0 11 12 552
                                                   27 13 553 3 0 11 12 552 27
                                                   565 1 1 244 22 245 1 0 218
                                                   13 219 2 0 218 226 13
                                                   230)))))
           '|lookupComplete|)) 
