
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
         (SEQ (LETT |lvar| NIL . #1=(|GUESS;getVariables|))
              (COND
               ((|HasSignature| (QREFELT $ 7)
                                (LIST '|variables|
                                      (LIST (LIST '|List| '(|Symbol|))
                                            (|devaluate| (QREFELT $ 7)))))
                (SEQ
                 (COND
                  ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
                   (LETT |ll| (SPADCALL (ELT $ 28) |lF| (QREFELT $ 33)) . #1#))
                  ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
                   (LETT |ll|
                         (SPADCALL (CONS #'|GUESS;getVariables!0| $) |lF|
                                   (QREFELT $ 40))
                         . #1#))
                  (#2='T
                   (|error|
                    (SPADCALL "Guess: type parameter F should be either"
                              " equal to S or equal to Fraction S"
                              (QREFELT $ 42)))))
                 (EXIT
                  (LETT |lvar| (SPADCALL (ELT $ 37) |ll| (QREFELT $ 44))
                        . #1#))))
               (#2# (LETT |lvar| NIL . #1#)))
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
         (SEQ
          (LETT |maxP| (SPADCALL |options| (QREFELT $ 57))
                . #1=(|GUESS;FilteredPartitionStream|))
          (LETT |homo| (SPADCALL |options| (QREFELT $ 59)) . #1#)
          (COND
           ((QEQCAR |homo| 1)
            (COND
             ((QCDR |homo|)
              (EXIT
               (|error|
                (SPADCALL "Guess: internal error - homogeneous should not"
                          " be true in FilteredPartitionStream"
                          (QREFELT $ 42)))))))
           (#2='T (LETT |maxP| (CONS 0 (QCDR |homo|)) . #1#)))
          (LETT |maxD| (SPADCALL |options| (QREFELT $ 61)) . #1#)
          (LETT |Somo| (SPADCALL |options| (QREFELT $ 62)) . #1#)
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
            (LETT |maxD| (CONS 0 (MIN (QCDR |maxD|) (QCDR |Somo|))) . #1#))
           (#2# (LETT |maxD| (CONS 0 (QCDR |Somo|)) . #1#)))
          (COND
           ((QEQCAR |maxD| 0)
            (COND
             ((QEQCAR |maxP| 0)
              (LETT |s|
                    (SPADCALL (+ (QCDR |maxD|) 1) (QCDR |maxP|) (QREFELT $ 68))
                    . #1#))
             (#2#
              (SEQ (LETT |s1| (SPADCALL (ELT $ 69) 1 (QREFELT $ 72)) . #1#)
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
                          (#2# (SPADCALL (ELT $ 82) |s1| (QREFELT $ 81))))
                         . #1#)
                   (LETT |s3| (SPADCALL |s2| (QREFELT $ 84)) . #1#)
                   (EXIT
                    (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 86)) . #1#))))))
           (#2#
            (SEQ (LETT |s1| (SPADCALL (ELT $ 69) 1 (QREFELT $ 72)) . #1#)
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
                        (#2# (SPADCALL (ELT $ 82) |s1| (QREFELT $ 81))))
                       . #1#)
                 (LETT |s3| (SPADCALL |s2| (QREFELT $ 84)) . #1#)
                 (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 86)) . #1#)))))
          (LETT |s| (SPADCALL |s| (QREFELT $ 87)) . #1#)
          (COND
           ((QEQCAR |homo| 0)
            (LETT |s|
                  (SPADCALL
                   (CONS #'|GUESS;FilteredPartitionStream!4| (VECTOR |maxP| $))
                   |s| (QREFELT $ 92))
                  . #1#)))
          (COND
           ((QEQCAR |Somo| 0)
            (LETT |s|
                  (SPADCALL
                   (CONS #'|GUESS;FilteredPartitionStream!5| (VECTOR |Somo| $))
                   |s| (QREFELT $ 92))
                  . #1#)))
          (EXIT |s|)))) 

(SDEFUN |GUESS;FilteredPartitionStream!5| ((|z1| NIL) ($$ NIL))
        (PROG ($ |Somo|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT |Somo| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (ELT $ 94) |z1| (|spadConstant| $ 95) (QREFELT $ 97))
             (SPADCALL (QCDR |Somo|) (SPADCALL |z1| (QREFELT $ 88))
                       (QREFELT $ 76))
             (QREFELT $ 98)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!4| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxP|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT |maxP| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G244 NIL))
                   (SPADCALL (SPADCALL |z1| (QREFELT $ 88))
                             (PROG2 (LETT #2# |maxP| NIL)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|PositiveInteger|)
                                               (|Union| (|PositiveInteger|)
                                                        "arbitrary")
                                               #2#))
                             (QREFELT $ 90))))))) 

(SDEFUN |GUESS;FilteredPartitionStream!3| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!2| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| $ 74) (QREFELT $ 76)) |z1|
             |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!1| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 101))
                        . #5=(|GUESS;termAsEXPRR|))
                  (LETT |fl|
                        (PROGN
                         (LETT #4# NIL . #5#)
                         (SEQ (LETT |part| NIL . #5#) (LETT #3# |ll| . #5#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |part| (CAR #3#) . #5#) NIL))
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
                                                             1)
                                                            . #5#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  DX)
                                        (PROG1
                                            (LETT #1#
                                                  (SPADCALL |part|
                                                            (QREFELT $ 102))
                                                  . #5#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 103))
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
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
                    (LETT #7# NIL . #8=(|GUESS;termAsU32VectorDiff|))
                    (SEQ (LETT |i| (+ |degreeLoss| 2) . #8#)
                         (LETT #6# (QV_LEN_U32 |f|) . #8#) G190
                         (COND ((> |i| #6#) (GO G191)))
                         (SEQ (EXIT (LETT #7# (CONS 0 #7#) . #8#)))
                         (LETT |i| (+ |i| 1) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #7#)))))
             (QREFELT $ 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1
                       (LETT #5# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1) . #8#)
                     (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #5#))
                   . #8#)
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)) . #8#)
             (LETT |fl|
                   (PROGN
                    (LETT #4# NIL . #8#)
                    (SEQ (LETT |part| NIL . #8#) (LETT #3# |ll| . #8#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |part| (CAR #3#) . #8#) NIL))
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
                                                          1)
                                                       . #8#)
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             |prime| (QREFELT $ 110))
                                   (PROG1
                                       (LETT #1#
                                             (SPADCALL |part| (QREFELT $ 102))
                                             . #8#)
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#))
                                   |d| |prime| (QREFELT $ 111))
                                  #4#)
                                 . #8#)))
                         (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   . #8#)
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 115))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2) . #1=(|GUESS;termAsU32VectorDiff|))
          (LETT |prime| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
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
              (LETT #10# NIL . #11=(|GUESS;termAsU32VectorShift|))
              (SEQ (LETT |i| (+ |degreeLoss| 1) . #11#)
                   (LETT #9# (QV_LEN_U32 |f|) . #11#) G190
                   (COND ((> |i| #9#) (GO G191)))
                   (SEQ (EXIT (LETT #10# (CONS 1 #10#) . #11#)))
                   (LETT |i| (+ |i| 1) . #11#) (GO G190) G191
                   (EXIT (NREVERSE #10#))))
             (QREFELT $ 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1
                       (LETT #8# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1)
                             . #11#)
                     (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #8#))
                   . #11#)
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)) . #11#)
             (LETT |fl|
                   (PROGN
                    (LETT #7# NIL . #11#)
                    (SEQ (LETT |part| NIL . #11#) (LETT #6# |ll| . #11#) G190
                         (COND
                          ((OR (ATOM #6#)
                               (PROGN (LETT |part| (CAR #6#) . #11#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #7#
                                 (CONS
                                  (SPADCALL
                                   (PROGN
                                    (LETT #5# NIL . #11#)
                                    (SEQ
                                     (LETT |j| (- (|SPADfirst| |part|) 1)
                                           . #11#)
                                     (LETT #4#
                                           (+ (- (|SPADfirst| |part|) 1) |d|)
                                           . #11#)
                                     G190 (COND ((> |j| #4#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #5#
                                             (CONS
                                              (REM
                                               (EXPT (ELT_U32 |f| |j|)
                                                     (PROG1
                                                         (LETT #3#
                                                               (SPADCALL |part|
                                                                         (QREFELT
                                                                          $
                                                                          102))
                                                               . #11#)
                                                       (|check_subtype2|
                                                        (> #3# 0)
                                                        '(|PositiveInteger|)
                                                        '(|Integer|) #3#)))
                                               |prime|)
                                              #5#)
                                             . #11#)))
                                     (LETT |j| (+ |j| 1) . #11#) (GO G190) G191
                                     (EXIT (NREVERSE #5#))))
                                   (QREFELT $ 108))
                                  #7#)
                                 . #11#)))
                         (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                         (EXIT (NREVERSE #7#))))
                   . #11#)
             (LETT |r| (GETREFV_U32 (+ |d| 1) 0) . #11#)
             (SPADCALL |r| (|SPADfirst| |fl|) (+ |d| 1) (QREFELT $ 117))
             (SEQ (LETT |i| 0 . #11#) (LETT #2# |d| . #11#) G190
                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |e| NIL . #11#) (LETT #1# (CDR |fl|) . #11#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |e| (CAR #1#) . #11#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT_U32 |r| |i|
                                       (QSMULMOD32 (ELT_U32 |r| |i|)
                                                   (ELT_U32 |e| |i|)
                                                   |prime|))))
                         (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL))
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
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 101))
                        . #5=(|GUESS;termAsUFPSF|))
                  (LETT |fl|
                        (PROGN
                         (LETT #4# NIL . #5#)
                         (SEQ (LETT |part| NIL . #5#) (LETT #3# |ll| . #5#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |part| (CAR #3#) . #5#) NIL))
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
                                                             1)
                                                            . #5#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  DS)
                                        (PROG1
                                            (LETT #1#
                                                  (SPADCALL |part|
                                                            (QREFELT $ 102))
                                                  . #5#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 119))
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
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
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 101))
                        . #4=(|GUESS;termAsUFPSF2|))
                  (LETT |fl|
                        (PROGN
                         (LETT #3# NIL . #4#)
                         (SEQ (LETT |part| NIL . #4#) (LETT #2# |ll| . #4#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |part| (CAR #2#) . #4#) NIL))
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
                                                             1)
                                                            . #4#)
                                                    (|check_subtype2|
                                                     (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                                  DS)
                                        (QREFELT $ 126))
                                       #3#)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT (SPADCALL (ELT $ 128) |fl| (QREFELT $ 123))))))))) 

(SDEFUN |GUESS;termAsUFPSF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1) . #1=(|GUESS;termAsUFPSF2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G340 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #2# (SPADCALL |part| (QREFELT $ 102))
                                       NIL)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
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
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 101))
                        . #4=(|GUESS;termAsUFPSSUPF2|))
                  (LETT |fl|
                        (PROGN
                         (LETT #3# NIL . #4#)
                         (SEQ (LETT |part| NIL . #4#) (LETT #2# |ll| . #4#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |part| (CAR #2#) . #4#) NIL))
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
                                                             1)
                                                            . #4#)
                                                    (|check_subtype2|
                                                     (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                                  DSF)
                                        (QREFELT $ 133))
                                       #3#)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT (SPADCALL (ELT $ 135) |fl| (QREFELT $ 138))))))))) 

(SDEFUN |GUESS;termAsUFPSSUPF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1) . #1=(|GUESS;termAsUFPSSUPF2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G351 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #2# (SPADCALL |part| (QREFELT $ 102))
                                       NIL)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
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
          (LETT |f| (QREFELT $$ 3) . #1=(|GUESS;ADEguessStream|))
          (LETT DS (QREFELT $$ 2) . #1#)
          (LETT D1 (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (LETT |f| (QREFELT $$ 3) . #1=(|GUESS;ADEguessStream2|))
          (LETT DS (QREFELT $$ 2) . #1#)
          (LETT D1 (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (SEQ (LETT |pp| NIL . #8=(|GUESS;guessModGenCached|))
               (LETT #7# |prodl| . #8#) (LETT |i| (+ |maxD| 1) . #8#)
               (LETT #6# (+ |maxD| |np|) . #8#) G190
               (COND
                ((OR (> |i| #6#) (ATOM #7#)
                     (PROGN (LETT |pp| (CAR #7#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |cache| |i|
                            (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                      (QAREF1 |cache|
                                              (SPADCALL |pp| (QREFELT $ 102)))
                                      (- |sigma| 1) |prime| (QREFELT $ 112)))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#) . #8#)) . #8#)
               (GO G190) G191 (EXIT NIL))
          (LETT |nt| (LENGTH |terml|) . #8#)
          (COND
           (|addOne|
            (SEQ (LETT |res| (MAKEARR1 (+ |nt| 1) (GETREFV_U32 0 0)) . #8#)
                 (LETT |res1|
                       (GETREFV_U32
                        (PROG1 (LETT #5# |sigma| . #8#)
                          (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #5#))
                        0)
                       . #8#)
                 (SETELT_U32 |res1| 0 1)
                 (SPADCALL |res| 1 |res1| (QREFELT $ 154))
                 (EXIT
                  (SEQ (LETT |r| NIL . #8#) (LETT #4# |terml| . #8#)
                       (LETT |i| 2 . #8#) (LETT #3# (+ |nt| 1) . #8#) G190
                       (COND
                        ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                             (PROGN (LETT |r| (CAR #4#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 154))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #8#))
                             . #8#)
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (SEQ (LETT |res| (MAKEARR1 |nt| (GETREFV_U32 0 0)) . #8#)
                 (EXIT
                  (SEQ (LETT |r| NIL . #8#) (LETT #2# |terml| . #8#)
                       (LETT |i| 1 . #8#) (LETT #1# |nt| . #8#) G190
                       (COND
                        ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                             (PROGN (LETT |r| (CAR #2#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 154))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #8#))
                             . #8#)
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
            (SEQ
             (LETT |f| (|SPADfirst| |fl|) . #3=(|GUESS;DEPguessModGenCached|))
             (LETT |sigma| (QV_LEN_U32 |f|) . #3#)
             (LETT |np| (LENGTH |prodl|) . #3#)
             (LETT |cache| (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0))
                   . #3#)
             (SEQ (LETT |f| NIL . #3#) (LETT #2# |fl| . #3#) (LETT |i| 0 . #3#)
                  (LETT #1# |maxD| . #3#) G190
                  (COND
                   ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                        (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (QSETAREF1 |cache| |i| |f|)))
                  (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                        . #3#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne| |maxD|
               |prodl| |terml| |prime| $)))))))) 

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
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 155))
            (|error| "ADEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ
             (LETT |f| (|SPADfirst| |fl|) . #2=(|GUESS;ADEguessModGenCached|))
             (LETT |sigma| (- (QV_LEN_U32 |f|) |maxD|) . #2#)
             (LETT |np| (LENGTH |prodl|) . #2#)
             (LETT |cache| (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0))
                   . #2#)
             (QSETAREF1 |cache| 0 |f|)
             (SEQ (LETT |i| 1 . #2#) (LETT #1# |maxD| . #2#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF1 |cache| |i|
                               (SPADCALL (QAREF1 |cache| (- |i| 1)) |prime|
                                         (QREFELT $ 156)))))
                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne| |maxD|
               |prodl| |terml| |prime| $)))))))) 

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
         (SEQ (LETT |np| (LENGTH |prodl|) . #8=(|GUESS;ADEtestGenCached|))
              (LETT |cache|
                    (MAKEARR1 (+ (+ |maxD| 1) |np|) (|spadConstant| $ 148))
                    . #8#)
              (QSETAREF1 |cache| 0 |f|)
              (SEQ (LETT |i| 1 . #8#) (LETT #7# |maxD| . #8#) G190
                   (COND ((|greater_SI| |i| #7#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| 0) |i| DSF))))
                   (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |pp| NIL . #8#) (LETT #6# |prodl| . #8#)
                   (LETT |i| (+ |maxD| 1) . #8#)
                   (LETT #5# (+ |maxD| |np|) . #8#) G190
                   (COND
                    ((OR (> |i| #5#) (ATOM #6#)
                         (PROGN (LETT |pp| (CAR #6#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                          (QAREF1 |cache|
                                                  (SPADCALL |pp|
                                                            (QREFELT $ 102)))
                                          (QREFELT $ 157)))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#) . #8#))
                         . #8#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |nt| (LENGTH |terml|) . #8#)
              (COND
               (|addOne|
                (SEQ
                 (LETT |res| (MAKEARR1 (+ |nt| 1) (|spadConstant| $ 148))
                       . #8#)
                 (SPADCALL |res| 1 D1F (QREFELT $ 162))
                 (EXIT
                  (SEQ (LETT |r| NIL . #8#) (LETT #4# |terml| . #8#)
                       (LETT |i| 2 . #8#) (LETT #3# (+ |nt| 1) . #8#) G190
                       (COND
                        ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                             (PROGN (LETT |r| (CAR #4#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 162))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #8#))
                             . #8#)
                       (GO G190) G191 (EXIT NIL)))))
               ('T
                (SEQ (LETT |res| (MAKEARR1 |nt| (|spadConstant| $ 148)) . #8#)
                     (EXIT
                      (SEQ (LETT |r| NIL . #8#) (LETT #2# |terml| . #8#)
                           (LETT |i| 1 . #8#) (LETT #1# |nt| . #8#) G190
                           (COND
                            ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                                 (PROGN (LETT |r| (CAR #2#) . #8#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                       (QREFELT $ 162))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #2# (CDR #2#) . #8#))
                                 . #8#)
                           (GO G190) G191 (EXIT NIL))))))
              (EXIT |res|)))) 

(SDEFUN |GUESS;multiplyExponents|
        ((|f| |U32Vector|) (|n| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G414 NIL) (|i| NIL) (|deg| (|Integer|)) (|f0| (|U32Vector|))
          (|nn| (|NonNegativeInteger|)))
         (SEQ (LETT |nn| (QV_LEN_U32 |f|) . #2=(|GUESS;multiplyExponents|))
              (LETT |f0| (GETREFV_U32 |nn| 0) . #2#)
              (LETT |deg| (- |nn| 1) . #2#)
              (SEQ (LETT |i| 0 . #2#) (LETT #1# |deg| . #2#) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#)
                         (NULL (SPADCALL (* |n| |i|) |deg| (QREFELT $ 163))))
                     (GO G191)))
                   (SEQ (EXIT (SETELT_U32 |f0| (* |n| |i|) (ELT_U32 |f| |i|))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
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
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 155))
            (|error| "FEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ
             (LETT |f| (|SPADfirst| |fl|) . #2=(|GUESS;FEguessModGenCached|))
             (LETT |sigma| (QV_LEN_U32 |f|) . #2#)
             (LETT |np| (LENGTH |prodl|) . #2#)
             (LETT |cache| (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0))
                   . #2#)
             (QSETAREF1 |cache| 0 |f|)
             (SEQ (LETT |i| 1 . #2#) (LETT #1# |maxD| . #2#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF1 |cache| |i|
                               (|GUESS;multiplyExponents| (QAREF1 |cache| 0)
                                (+ |i| 1) $))))
                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne| |maxD|
               |prodl| |terml| |prime| $)))))))) 

(SDEFUN |GUESS;optimiseFactor|
        ((|partition| |Partition|) (|partitions| |List| (|Partition|))
         ($ |Union| (|List| (|Integer|)) "failed"))
        (SPROG
         ((#1=#:G437 NIL) (|j| (|Integer|))
          (|r| (|Union| (|Partition|) "failed")) (#2=#:G438 NIL) (|p| NIL)
          (#3=#:G439 NIL) (|i| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |partitions|) . #4=(|GUESS;optimiseFactor|))
                (SEQ (LETT |i| 1 . #4#) (LETT #3# |n| . #4#)
                     (LETT |p| NIL . #4#) (LETT #2# |partitions| . #4#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #4#) NIL)
                           (|greater_SI| |i| #3#))
                       (GO G191)))
                     (SEQ
                      (LETT |r| (SPADCALL |partition| |p| (QREFELT $ 165))
                            . #4#)
                      (EXIT
                       (COND
                        ((QEQCAR |r| 0)
                         (SEQ
                          (LETT |j|
                                (SPADCALL (QCDR |r|) |partitions|
                                          (QREFELT $ 167))
                                . #4#)
                          (EXIT
                           (COND
                            ((SPADCALL |j| 0 (QREFELT $ 168))
                             (PROGN
                              (LETT #1# (CONS 0 (LIST |i| |j|)) . #4#)
                              (GO #5=#:G436))))))))))
                     (LETT #2#
                           (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #4#))
                           . #4#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 1 "failed"))))
          #5# (EXIT #1#)))) 

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
                  (SPADCALL |parts0| (QREFELT $ 170)) $)
                 . #1=(|GUESS;optimiseProducts1|))
           (EXIT
            (COND
             ((QEQCAR |r| 1)
              (SEQ
               (|GUESS;optimiseProducts1|
                (SPADCALL (CDR (SPADCALL |p| (QREFELT $ 171))) (QREFELT $ 172))
                |prods0| |parts0| $)
               (EXIT
                (LETT |r|
                      (|GUESS;optimiseFactor| |p|
                       (SPADCALL |parts0| (QREFELT $ 170)) $)
                      . #1#)))))))
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (|error| "Internal error: failed adding intermediate partition"))
            ('T
             (SEQ
              (LETT |lp0| (LENGTH (SPADCALL |parts0| (QREFELT $ 170))) . #1#)
              (SPADCALL |prods0|
                        (CONS
                         (LIST (- |lp0| (|SPADfirst| (QCDR |r|)))
                               (- |lp0| (SPADCALL (QCDR |r|) (QREFELT $ 102))))
                         (SPADCALL |prods0| (QREFELT $ 174)))
                        (QREFELT $ 175))
              (EXIT
               (SPADCALL |parts0|
                         (CONS |p| (SPADCALL |parts0| (QREFELT $ 170)))
                         (QREFELT $ 176)))))))))) 

(SDEFUN |GUESS;optimiseProducts|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Record| (|:| |addOne| (|Boolean|))
          (|:| |maxDiff| (|NonNegativeInteger|))
          (|:| |prods| (|List| (|List| (|Integer|))))
          (|:| |terms| (|List| (|Integer|)))))
        (SPROG
         ((#1=#:G455 NIL) (|terms0| (|List| (|Integer|))) (#2=#:G460 NIL)
          (|p| NIL) (|parts0| (|Reference| (|List| (|Partition|)))) (|i| NIL)
          (#3=#:G459 NIL)
          (|prods0| (|Reference| (|List| (|List| (|Integer|)))))
          (|maxD0| (|Integer|)) (#4=#:G458 NIL) (|addOne0| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |addOne0| (NULL (|SPADfirst| |partitions|))
                  . #5=(|GUESS;optimiseProducts|))
            (COND
             (|addOne0|
              (SEQ (LETT |partitions| (CDR |partitions|) . #5#)
                   (EXIT
                    (COND
                     ((NULL |partitions|)
                      (PROGN
                       (LETT #4# (VECTOR |addOne0| 0 NIL NIL) . #5#)
                       (GO #6=#:G457))))))))
            (LETT |maxD0|
                  (SPADCALL (ELT $ 177)
                            (SPADCALL (ELT $ 178) |partitions| (QREFELT $ 181))
                            (QREFELT $ 182))
                  . #5#)
            (LETT |prods0| (SPADCALL NIL (QREFELT $ 183)) . #5#)
            (LETT |terms0| NIL . #5#)
            (LETT |parts0|
                  (SPADCALL
                   (PROGN
                    (LETT #3# NIL . #5#)
                    (SEQ (LETT |i| |maxD0| . #5#) G190
                         (COND ((< |i| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS (SPADCALL (LIST |i|) (QREFELT $ 172))
                                       #3#)
                                 . #5#)))
                         (LETT |i| (+ |i| -1) . #5#) (GO G190) G191
                         (EXIT (NREVERSE #3#))))
                   (QREFELT $ 184))
                  . #5#)
            (SEQ (LETT |p| NIL . #5#) (LETT #2# |partitions| . #5#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (LENGTH |p|) 1)
                     (LETT |terms0| (CONS (- (|SPADfirst| |p|) 1) |terms0|)
                           . #5#))
                    ('T
                     (SEQ
                      (|GUESS;optimiseProducts1| (SPADCALL |p| (QREFELT $ 172))
                       |prods0| |parts0| $)
                      (EXIT
                       (LETT |terms0|
                             (CONS
                              (- (LENGTH (SPADCALL |parts0| (QREFELT $ 170)))
                                 1)
                              |terms0|)
                             . #5#)))))))
                 (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (VECTOR |addOne0|
                     (PROG1 (LETT #1# (- |maxD0| 1) . #5#)
                       (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #1#))
                     (NREVERSE (SPADCALL |prods0| (QREFELT $ 174)))
                     (NREVERSE |terms0|)))))
          #6# (EXIT #4#)))) 

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
         (SEQ
          (LETT |r| (|GUESS;optimiseProducts| |partitions| $)
                |GUESS;ADEguessModOptimisedGen|)
          (EXIT (CONS #'|GUESS;ADEguessModOptimisedGen!0| (VECTOR $ |r|)))))) 

(SDEFUN |GUESS;ADEguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|GUESS;ADEguessModOptimisedGen|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
         (SEQ
          (LETT |r| (|GUESS;optimiseProducts| |partitions| $)
                |GUESS;FEguessModOptimisedGen|)
          (EXIT (CONS #'|GUESS;FEguessModOptimisedGen!0| (VECTOR $ |r|)))))) 

(SDEFUN |GUESS;FEguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|GUESS;FEguessModOptimisedGen|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
         (SEQ
          (LETT |r| (|GUESS;optimiseProducts| |partitions| $)
                |GUESS;DEPguessModOptimisedGen|)
          (EXIT (CONS #'|GUESS;DEPguessModOptimisedGen!0| (VECTOR $ |r|)))))) 

(SDEFUN |GUESS;DEPguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|GUESS;DEPguessModOptimisedGen|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (LETT $ (QREFELT $$ 2) . #1=(|GUESS;ADEguessModGen2|))
          (LETT |partitions| (QREFELT $$ 1) . #1#)
          (LETT |d| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G484 NIL) (|p| NIL) (#3=#:G483 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 185))
                                (|spadConstant| $ 186) (QREFELT $ 155))
                      (|error| "ADEguessModGen2, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 187)) NIL)
                           (EXIT
                            (SPADCALL
                             (PROGN
                              (LETT #3# NIL NIL)
                              (SEQ (LETT |p| NIL NIL)
                                   (LETT #2# |partitions| NIL) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |p| (CAR #2#) NIL) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS
                                            (|GUESS;termAsU32VectorShift| |f|
                                             |p| |prime| |d| $)
                                            #3#)
                                           NIL)))
                                   (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                   (EXIT (NREVERSE #3#))))
                             (QREFELT $ 188)))))))))))) 

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
         (SEQ
          (LETT |r| (|GUESS;optimiseProducts| |partitions| $)
                |GUESS;ADEtestOptimisedGen|)
          (EXIT
           (CONS #'|GUESS;ADEtestOptimisedGen!0| (VECTOR $ D1F DSF |r|)))))) 

(SDEFUN |GUESS;ADEtestOptimisedGen!0| ((|f| NIL) ($$ NIL))
        (PROG (|r| DSF D1F $)
          (LETT |r| (QREFELT $$ 3) . #1=(|GUESS;ADEtestOptimisedGen|))
          (LETT DSF (QREFELT $$ 2) . #1#)
          (LETT D1F (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (LETT |partitions| (QREFELT $$ 3) . #1=(|GUESS;ADEtestGen2|))
          (LETT DSF (QREFELT $$ 2) . #1#)
          (LETT D1F (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G497 NIL) (|p| NIL) (#3=#:G496 NIL))
                   (SEQ
                    (SPADCALL
                     (PROGN
                      (LETT #3# NIL NIL)
                      (SEQ (LETT |p| NIL NIL) (LETT #2# |partitions| NIL) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |p| (CAR #2#) NIL) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS
                                    (|GUESS;termAsUFPSSUPF2| |f| |p| DSF D1F $)
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (QREFELT $ 189)))))))) 

(SDEFUN |GUESS;ADEEXPRRStream|
        ((|f| EXPRR) (|xx| |Symbol|)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DX |Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|))
         (D1X |Mapping| EXPRR (|Symbol|)) ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GUESS;ADEEXPRRStream!0| (VECTOR $ D1X DX |xx| |f|))
                |partitions| (QREFELT $ 193)))) 

(SDEFUN |GUESS;ADEEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| |xx| DX D1X $)
          (LETT |f| (QREFELT $$ 4) . #1=(|GUESS;ADEEXPRRStream|))
          (LETT |xx| (QREFELT $$ 3) . #1#)
          (LETT DX (QREFELT $$ 2) . #1#)
          (LETT D1X (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;termAsEXPRR| |f| |xx| |z1| DX D1X $))))) 

(SDEFUN |GUESS;ADEdegreeStream|
        ((|partitions| |Stream| (|List| (|Integer|)))
         ($ |Stream| (|NonNegativeInteger|)))
        (SPADCALL 0 (CONS #'|GUESS;ADEdegreeStream!0| $) |partitions|
                  (QREFELT $ 200))) 

(SDEFUN |GUESS;ADEdegreeStream!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPROG ((#1=#:G505 NIL))
               (SPADCALL
                (COND ((SPADCALL |z1| (QREFELT $ 194)) (|spadConstant| $ 95))
                      ('T
                       (PROG1
                           (LETT #1#
                                 (SPADCALL (SPADCALL |z1| (QREFELT $ 178))
                                           (|spadConstant| $ 186)
                                           (QREFELT $ 195))
                                 NIL)
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))))
                |z2| (QREFELT $ 196)))) 

(SDEFUN |GUESS;diffDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| |x| |n| (QREFELT $ 201))) 

(SDEFUN |GUESS;diffDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| |n| (QREFELT $ 202))) 

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
          (SPADCALL |s| |n| (QREFELT $ 203))))) 

(SDEFUN |GUESS;diffAX|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 45)) |l| (QREFELT $ 103))
                  |f| (QREFELT $ 104))) 

(SDEFUN |GUESS;diffA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 205))) 

(SDEFUN |GUESS;diffAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 207))) 

(SDEFUN |GUESS;diffC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 208))) 

(SDEFUN |GUESS;diff1X| ((|x| |Symbol|) ($ EXPRR)) (|spadConstant| $ 149)) 

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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 209))))
            (|error|
             (SPADCALL "Guess: no support for mixed shifts in differential"
                       " equations" (QREFELT $ 42)))))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 210))
                . #1=(|GUESS;diffHP;LR;43|))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                    . #1#)
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
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
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;43|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;diffDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;diffHP;LR;43!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;43|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G532 NIL) (|i| NIL) (#3=#:G531 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #3# NIL NIL)
                      (SEQ (LETT |i| NIL NIL) (LETT #2# |l| NIL) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 214))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;diffDSF|) $)
                     (|spadConstant| $ 152) $))))))) 

(SDEFUN |GUESS;diffHP;LR;43!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;43|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 211))
                        (QREFELT $ 212))
              (QREFELT $ 213))
             $))))) 

(SDEFUN |GUESS;diffHP;LR;43!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;43|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;diffDS|) $) (|spadConstant| $ 151) $))))) 

(SDEFUN |GUESS;monomialAsEXPRR|
        ((|fl0| |List| EXPRR) (|partition| |List| (|Integer|)) ($ EXPRR))
        (SPROG
         ((|fl| (|List| EXPRR)) (#1=#:G568 NIL) (#2=#:G567 NIL) (#3=#:G576 NIL)
          (|part| NIL) (#4=#:G575 NIL) (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) (|spadConstant| $ 149))
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 101))
                        . #5=(|GUESS;monomialAsEXPRR|))
                  (LETT |fl|
                        (PROGN
                         (LETT #4# NIL . #5#)
                         (SEQ (LETT |part| NIL . #5#) (LETT #3# |ll| . #5#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |part| (CAR #3#) . #5#) NIL))
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
                                                             |part|)
                                                            . #5#)
                                                    (|check_subtype2| (> #2# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|Integer|)
                                                                      #2#))
                                                  (QREFELT $ 227))
                                        (PROG1
                                            (LETT #1#
                                                  (SPADCALL |part|
                                                            (QREFELT $ 102))
                                                  . #5#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 103))
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (EXIT (SPADCALL (ELT $ 104) |fl| (QREFELT $ 106))))))))) 

(SDEFUN |GUESS;DEPEXPRRStream|
        ((|fl| |List| EXPRR) (|partitions| |Stream| (|List| (|Integer|)))
         ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;DEPEXPRRStream!0| (VECTOR $ |fl|))
                         |partitions| (QREFELT $ 193)))) 

(SDEFUN |GUESS;DEPEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|fl| $)
          (LETT |fl| (QREFELT $$ 1) . #1=(|GUESS;DEPEXPRRStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;monomialAsEXPRR| |fl| |z1| $))))) 

(SDEFUN |GUESS;get_fnames|
        ((|n| |Integer|) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((#1=#:G591 NIL) (|sym| NIL) (#2=#:G590 NIL)
          (|syms| (|List| (|Symbol|))) (#3=#:G589 NIL) (|i| NIL)
          (#4=#:G588 NIL) (|snums| (|List| (|String|))) (#5=#:G587 NIL)
          (|q| NIL) (#6=#:G586 NIL) (|n1| (|NonNegativeInteger|)))
         (SEQ
          (LETT |syms| (SPADCALL |options| (QREFELT $ 228))
                . #7=(|GUESS;get_fnames|))
          (LETT |n1| (LENGTH |syms|) . #7#)
          (COND
           ((SPADCALL |n1| 0 (QREFELT $ 229))
            (COND
             ((SPADCALL |n1| |n| (QREFELT $ 230))
              (EXIT
               (|error| "numbers of sequences and names are different"))))))
          (COND
           ((EQL |n1| 0)
            (SEQ
             (LETT |snums|
                   (PROGN
                    (LETT #6# NIL . #7#)
                    (SEQ (LETT |q| 1 . #7#) (LETT #5# |n| . #7#) G190
                         (COND ((|greater_SI| |q| #5#) (GO G191)))
                         (SEQ
                          (EXIT (LETT #6# (CONS (STRINGIMAGE |q|) #6#) . #7#)))
                         (LETT |q| (|inc_SI| |q|) . #7#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   . #7#)
             (EXIT
              (LETT |syms|
                    (PROGN
                     (LETT #4# NIL . #7#)
                     (SEQ (LETT |i| NIL . #7#) (LETT #3# |snums| . #7#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |i| (CAR #3#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL (STRCONC "%" (STRCONC "f" |i|))
                                             (QREFELT $ 231))
                                   #4#)
                                  . #7#)))
                          (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #7#)))))
          (EXIT
           (PROGN
            (LETT #2# NIL . #7#)
            (SEQ (LETT |sym| NIL . #7#) (LETT #1# |syms| . #7#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |sym| (QREFELT $ 45)) #2#)
                         . #7#)))
                 (LETT #1# (CDR #1#) . #7#) (GO G190) G191
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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 209))))
            (|error|
             (SPADCALL "Guess: no support for mixed shifts in algebraic"
                       " dependencies" (QREFELT $ 42)))))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 210))
                . #1=(|GUESS;algDepHP;LLR;47|))
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsEQ| (QREFELT $ 232))
             (|error| "Guess: guessAlgDep supports only displayAsEQ"))
            ('T
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                    . #1#)
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
              (LETT |fl| (|GUESS;get_fnames| (LENGTH |lists|) |options| $)
                    . #1#)
              (LETT |fakeDS|
                    (CONS #'|GUESS;algDepHP;LLR;47!0| (VECTOR $ |lists|))
                    . #1#)
              (LETT |fakeDSF|
                    (CONS #'|GUESS;algDepHP;LLR;47!1| (VECTOR $ |lists|))
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;algDepHP;LLR;47!2| $) |partitions|
                          (QREFELT $ 236))
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
          (LETT |fl| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;47|))
          (LETT |partitions| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;DEPEXPRRStream| |fl| |partitions| $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |fakeDSF|)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;47|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |fakeDSF| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G610 NIL) (|i| NIL) (#3=#:G609 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #3# NIL NIL)
                      (SEQ (LETT |i| NIL NIL) (LETT #2# |l| NIL) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 214))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     |fakeDSF| (|spadConstant| $ 152) $))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!4| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;47|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;DEPguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 211))
                        (QREFELT $ 212))
              (QREFELT $ 213))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!3| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| |fakeDS| $)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;47|))
          (LETT |fakeDS| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions| |fakeDS|
             (|spadConstant| $ 151) $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!2| ((|c| NIL) ($ NIL)) (|spadConstant| $ 95)) 

(SDEFUN |GUESS;algDepHP;LLR;47!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;47|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;list2UFPSSUPF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 186) (QREFELT $ 76))
                       (QREFELT $ 234))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!0| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;47|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;list2UFPSF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 186) (QREFELT $ 76))
                       (QREFELT $ 234))
             $))))) 

(SDEFUN |GUESS;substDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 45)) (+ |n| 1)
                            (QREFELT $ 103))
                  (QREFELT $ 238))) 

(SDEFUN |GUESS;substDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG ((#1=#:G626 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1) |GUESS;substDS|)
                           (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #1#))
                         (QREFELT $ 239)))) 

(SDEFUN |GUESS;substDSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG ((#1=#:G628 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1) |GUESS;substDSF|)
                           (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #1#))
                         (QREFELT $ 240)))) 

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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 209))))
            (|error|
             "Guess: no support for mixed shifts in functional equations")))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 210))
                . #1=(|GUESS;substHP;LR;51|))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;substHP;LR;51!0| $) |partitions|
                          (QREFELT $ 236))
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
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;substDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;substHP;LR;51!3| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G646 NIL) (|i| NIL) (#3=#:G645 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #3# NIL NIL)
                      (SEQ (LETT |i| NIL NIL) (LETT #2# |l| NIL) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 214))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;substDSF|) $)
                     (|spadConstant| $ 152) $))))))) 

(SDEFUN |GUESS;substHP;LR;51!2| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;FEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 211))
                        (QREFELT $ 212))
              (QREFELT $ 213))
             $))))) 

(SDEFUN |GUESS;substHP;LR;51!1| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;substDS|) $) (|spadConstant| $ 151) $))))) 

(SDEFUN |GUESS;substHP;LR;51!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 95)) 

(SDEFUN |GUESS;qDiffDX|
        ((|q| |Symbol|) (|expr| EXPRR) (|x| |Symbol|)
         (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT $ 45)) |n| (QREFELT $ 103))
                   (SPADCALL |x| (QREFELT $ 45)) (QREFELT $ 104))
                  (QREFELT $ 238))) 

(SDEFUN |GUESS;qDiffDS|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|n| |NonNegativeInteger|) ($ |UnivariateFormalPowerSeries| F))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;qDiffDS!0| (VECTOR |n| $ |q|)) |s|
                         (QREFELT $ 245)))) 

(SDEFUN |GUESS;qDiffDS!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;qDiffDS|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G667 NIL))
                   (SPADCALL (SPADCALL |q| (QREFELT $ 242))
                             (PROG1
                                 (LETT #2# (SPADCALL |n| |z1| (QREFELT $ 243))
                                       NIL)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (QREFELT $ 124))))))) 

(SDEFUN |GUESS;qDiffDSV|
        ((|f| |U32Vector|) (|n| |NonNegativeInteger|) (|prime| |Integer|)
         (|q| |Integer|) ($ |U32Vector|))
        (SPROG
         ((Q (|Integer|)) (#1=#:G678 NIL) (|i| NIL) (|qn| (|Integer|))
          (|r| (|U32Vector|)) (#2=#:G671 NIL) (|d| (|Integer|)))
         (SEQ
          (COND ((ZEROP |n|) |f|)
                ('T
                 (SEQ (LETT |d| (- (QV_LEN_U32 |f|) 1) . #3=(|GUESS;qDiffDSV|))
                      (LETT |r|
                            (GETREFV_U32
                             (+
                              (PROG1 (LETT #2# |d| . #3#)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              1)
                             0)
                            . #3#)
                      (SETELT_U32 |r| 0 (ELT_U32 |f| 0))
                      (COND
                       ((SPADCALL |d| 0 (QREFELT $ 168))
                        (SEQ (LETT Q 1 . #3#)
                             (LETT |qn| (REM (EXPT |q| |n|) |prime|) . #3#)
                             (EXIT
                              (SEQ (LETT |i| 1 . #3#) (LETT #1# |d| . #3#) G190
                                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                                   (SEQ
                                    (LETT Q (QSMULMOD32 |qn| Q |prime|) . #3#)
                                    (EXIT
                                     (SETELT_U32 |r| |i|
                                                 (QSMULMOD32 (ELT_U32 |f| |i|)
                                                             Q |prime|))))
                                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                   G191 (EXIT NIL))))))
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
                         (QREFELT $ 249)))) 

(SDEFUN |GUESS;qDiffDSF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;qDiffDSF|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G679 NIL))
                   (SPADCALL
                    (SPADCALL (SPADCALL |q| (QREFELT $ 242)) (QREFELT $ 247))
                    (PROG1 (LETT #2# (SPADCALL |n| |z1| (QREFELT $ 243)) NIL)
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#))
                    (QREFELT $ 130))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|q| |Integer|) (|dl| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|fl| (|List| (|U32Vector|))) (#1=#:G685 NIL) (#2=#:G684 NIL)
          (#3=#:G695 NIL) (|part| NIL) (#4=#:G694 NIL)
          (|ll| (|List| (|List| (|Integer|)))) (|d| (|NonNegativeInteger|))
          (#5=#:G683 NIL) (#6=#:G693 NIL) (|i| NIL) (#7=#:G692 NIL))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (CONS 1
                   (PROGN
                    (LETT #7# NIL . #8=(|GUESS;termAsU32VectorqDiff|))
                    (SEQ (LETT |i| (+ |dl| 2) . #8#)
                         (LETT #6# (QV_LEN_U32 |f|) . #8#) G190
                         (COND ((> |i| #6#) (GO G191)))
                         (SEQ (EXIT (LETT #7# (CONS 0 #7#) . #8#)))
                         (LETT |i| (+ |i| 1) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #7#)))))
             (QREFELT $ 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #5# (- (- (QV_LEN_U32 |f|) |dl|) 1) . #8#)
                     (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #5#))
                   . #8#)
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)) . #8#)
             (LETT |fl|
                   (PROGN
                    (LETT #4# NIL . #8#)
                    (SEQ (LETT |part| NIL . #8#) (LETT #3# |ll| . #8#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |part| (CAR #3#) . #8#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (SPADCALL
                                   (|GUESS;qDiffDSV| |f|
                                    (PROG1
                                        (LETT #2# (- (|SPADfirst| |part|) 1)
                                              . #8#)
                                      (|check_subtype2| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                    |prime| |q| $)
                                   (PROG1
                                       (LETT #1#
                                             (SPADCALL |part| (QREFELT $ 102))
                                             . #8#)
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#))
                                   |d| |prime| (QREFELT $ 111))
                                  #4#)
                                 . #8#)))
                         (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   . #8#)
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorqDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 115))))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2) . #1=(|GUESS;termAsU32VectorqDiff|))
          (LETT |prime| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (LETT $ (QREFELT $$ 2) . #1=(|GUESS;ADEguessModGenq|))
          (LETT |partitions| (QREFELT $$ 1) . #1#)
          (LETT |d| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G701 NIL) (|p| NIL) (#3=#:G700 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 185))
                                (|spadConstant| $ 186) (QREFELT $ 155))
                      (|error| "ADEguessModGenq, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 187)) NIL)
                           (EXIT
                            (SPADCALL
                             (PROGN
                              (LETT #3# NIL NIL)
                              (SEQ (LETT |p| NIL NIL)
                                   (LETT #2# |partitions| NIL) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |p| (CAR #2#) NIL) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS
                                            (|GUESS;termAsU32VectorqDiff| |f|
                                             |p| |prime| |q| |d| $)
                                            #3#)
                                           NIL)))
                                   (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                   (EXIT (NREVERSE #3#))))
                             (QREFELT $ 188)))))))))))) 

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
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;diffHP;SM;58|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|partitions| NIL))
                   (SEQ
                    (COND
                     ((NULL
                       (SPADCALL (SPADCALL |l1| (QREFELT $ 209))
                                 (QREFELT $ 250)))
                      (|error|
                       (SPADCALL "Guess: no support for mixed shifts in"
                                 " differential equations" (QREFELT $ 42)))))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |l1| (QREFELT $ 210)) '|displayAsGF|
                                 (QREFELT $ 251))
                       (SEQ
                        (LETT |partitions|
                              (|GUESS;FilteredPartitionStream| |l1| $) NIL)
                        (EXIT
                         (VECTOR
                          (SPADCALL (CONS #'|GUESS;diffHP;SM;58!0| $)
                                    |partitions| (QREFELT $ 236))
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
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |q| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
                    (CONS #'|GUESS;diffHP;SM;58!6| (VECTOR $ |q|))
                    (CONS (|function| |GUESS;diff1X|) $) $)))))) 

(SDEFUN |GUESS;diffHP;SM;58!6| ((|w1| NIL) (|w2| NIL) (|w3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qDiffDX| |q| |w1| |w2| |w3| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |q| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG ((#1=#:G717 NIL) (|i| NIL) (#2=#:G716 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #2# NIL NIL)
                      (SEQ (LETT |i| NIL NIL) (LETT #1# |l| NIL) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |i| (CAR #1#) NIL) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 214))
                                    #2#)
                                   NIL)))
                           (LETT #1# (CDR #1#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS #'|GUESS;diffHP;SM;58!4| (VECTOR $ |q|))
                     (|spadConstant| $ 152) $))))))) 

(SDEFUN |GUESS;diffHP;SM;58!4| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qDiffDSF| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!3| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGenq|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 211))
                        (QREFELT $ 212))
              (QREFELT $ 213))
             (|spadConstant| $ 95) $))))) 

(SDEFUN |GUESS;diffHP;SM;58!2| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |q| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEguessStream| |z1| |partitions|
                    (CONS #'|GUESS;diffHP;SM;58!1| (VECTOR $ |q|))
                    (|spadConstant| $ 151) $)))))) 

(SDEFUN |GUESS;diffHP;SM;58!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qDiffDS| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 95)) 

(SDEFUN |GUESS;ShiftSX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 45))
                            (SPADCALL |n| (QREFELT $ 254)) (QREFELT $ 93))
                  (QREFELT $ 238))) 

(SDEFUN |GUESS;ShiftSXGF|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPROG ((|l| (|List| EXPRR)) (#1=#:G744 NIL) (|i| NIL) (#2=#:G743 NIL))
               (SEQ
                (COND ((ZEROP |n|) |expr|)
                      ('T
                       (SEQ
                        (LETT |l|
                              (PROGN
                               (LETT #2# NIL . #3=(|GUESS;ShiftSXGF|))
                               (SEQ (LETT |i| 0 . #3#)
                                    (LETT #1# (- |n| 1) . #3#) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |expr| |x| |i|
                                                          (QREFELT $ 201))
                                                (SPADCALL
                                                 (SPADCALL |i| (QREFELT $ 255))
                                                 (QREFELT $ 254))
                                                (QREFELT $ 256))
                                               (SPADCALL |x| (QREFELT $ 45))
                                               (|spadConstant| $ 145)
                                               (QREFELT $ 238))
                                              (SPADCALL
                                               (SPADCALL |x| (QREFELT $ 45))
                                               |i| (QREFELT $ 103))
                                              (QREFELT $ 104))
                                             #2#)
                                            . #3#)))
                                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                    G191 (EXIT (NREVERSE #2#))))
                              . #3#)
                        (EXIT
                         (SPADCALL
                          (SPADCALL |expr|
                                    (SPADCALL (ELT $ 93) |l| (QREFELT $ 106))
                                    (QREFELT $ 257))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 45)) |n|
                                    (QREFELT $ 103))
                          (QREFELT $ 256))))))))) 

(SDEFUN |GUESS;ShiftSS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| (SPADCALL (ELT $ 258) |n| (QREFELT $ 261)))) 

(SDEFUN |GUESS;ShiftSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL |s| (SPADCALL (ELT $ 262) |n| (QREFELT $ 265)))) 

(SDEFUN |GUESS;ShiftAX|
        ((|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT $ 45)) |l| (QREFELT $ 103))
                  |f| (QREFELT $ 104))) 

(SDEFUN |GUESS;ShiftAXGF|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPROG ((|s| (|List| EXPRR)) (#1=#:G755 NIL) (|i| NIL) (#2=#:G754 NIL))
               (SEQ
                (COND ((ZEROP |l|) |f|)
                      ('T
                       (SEQ
                        (LETT |s|
                              (PROGN
                               (LETT #2# NIL . #3=(|GUESS;ShiftAXGF|))
                               (SEQ (LETT |i| 1 . #3#) (LETT #1# |l| . #3#)
                                    G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |l| |i|
                                                          (QREFELT $ 267))
                                                (QREFELT $ 254))
                                               (SPADCALL
                                                (SPADCALL |x| (QREFELT $ 45))
                                                |i| (QREFELT $ 103))
                                               (QREFELT $ 104))
                                              (SPADCALL |f| |x| |i|
                                                        (QREFELT $ 201))
                                              (QREFELT $ 104))
                                             #2#)
                                            . #3#)))
                                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                    G191 (EXIT (NREVERSE #2#))))
                              . #3#)
                        (EXIT (SPADCALL (ELT $ 93) |s| (QREFELT $ 106))))))))) 

(SDEFUN |GUESS;ShiftA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 268))) 

(SDEFUN |GUESS;ShiftAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 269))) 

(SDEFUN |GUESS;ShiftC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 270))) 

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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 209))))
            (|error| "Guess: need a symbol for mixed Shifting")))
          (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                . #1=(|GUESS;shiftHP;LR;68|))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 210)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsRec| (QREFELT $ 232))
             (|error|
              "Guess: no support for the Shift operator with displayAsGF"))
            ('T
             (SEQ
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
              (EXIT
               (VECTOR |degrees|
                       (CONS #'|GUESS;shiftHP;LR;68!0| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;shiftHP;LR;68!1|
                             (VECTOR |degrees| $ |partitions|))
                       (CONS #'|GUESS;shiftHP;LR;68!2| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;shiftHP;LR;68!3| (VECTOR $ |partitions|))
                       '|shiftHP| '|dummy| (CONS (|function| |GUESS;ShiftA|) $)
                       (CONS (|function| |GUESS;ShiftAF|) $)
                       (CONS (|function| |GUESS;ShiftAX|) $)
                       (CONS (|function| |GUESS;ShiftC|) $)))))))))) 

(SDEFUN |GUESS;shiftHP;LR;68!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;68|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;shiftHP;LR;68!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;68|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G774 NIL) (|i| NIL) (#3=#:G773 NIL))
                   (SEQ
                    (|GUESS;ADEtestGen2|
                     (PROGN
                      (LETT #3# NIL NIL)
                      (SEQ (LETT |i| NIL NIL) (LETT #2# |l| NIL) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 214))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 152)
                                (SPADCALL (|spadConstant| $ 160)
                                          (|spadConstant| $ 74)
                                          (QREFELT $ 276))
                                (QREFELT $ 277))
                      (SPADCALL (|spadConstant| $ 159) (QREFELT $ 273))
                      (QREFELT $ 278))
                     $))))))) 

(SDEFUN |GUESS;shiftHP;LR;68!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $ |degrees|)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;shiftHP;LR;68|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |degrees| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 211))
                        (QREFELT $ 212))
              (QREFELT $ 213))
             (SPADCALL |degrees| |o| (QREFELT $ 275)) $))))) 

(SDEFUN |GUESS;shiftHP;LR;68!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;68|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 151)
                        (SPADCALL (|spadConstant| $ 63) (|spadConstant| $ 186)
                                  (QREFELT $ 271))
                        (QREFELT $ 272))
              (SPADCALL (|spadConstant| $ 159) (QREFELT $ 273))
              (QREFELT $ 274))
             $))))) 

(SDEFUN |GUESS;qShiftAX|
        ((|q| |Symbol|) (|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR)
         ($ EXPRR))
        (SPADCALL
         (SPADCALL (SPADCALL |q| (QREFELT $ 45))
                   (SPADCALL |l| (SPADCALL |n| (QREFELT $ 45)) (QREFELT $ 280))
                   (QREFELT $ 281))
         |f| (QREFELT $ 104))) 

(SDEFUN |GUESS;qShiftA|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 282)) |k| |l| |f| (QREFELT $ 283))) 

(SDEFUN |GUESS;qShiftAF|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 242)) (QREFELT $ 247)) |k|
                  |l| |f| (QREFELT $ 284))) 

(SDEFUN |GUESS;qShiftC|
        ((|q| |Symbol|) (|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 282)) |total| (QREFELT $ 285))) 

(SDEFUN |GUESS;qSubstUFPSF|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|maxMD| |NonNegativeInteger|)
         ($ |List| (|UnivariateFormalPowerSeries| F)))
        (SPROG ((#1=#:G800 NIL) (|i| NIL) (#2=#:G799 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GUESS;qSubstUFPSF|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# |maxMD| . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |s|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |q| (QREFELT $ 242)) |i|
                                           (QREFELT $ 124))
                                          (SPADCALL (|spadConstant| $ 63) 1
                                                    (QREFELT $ 271))
                                          (QREFELT $ 286))
                                         (QREFELT $ 287))
                               #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GUESS;qSubstEXPRR|
        ((|q| |Symbol|) (|xx| |Symbol|) (|s| EXPRR)
         (|maxMD| |NonNegativeInteger|) ($ |List| EXPRR))
        (SPROG ((#1=#:G804 NIL) (|i| NIL) (#2=#:G803 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GUESS;qSubstEXPRR|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# |maxMD| . #3#) G190
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
                                                    (QREFELT $ 280))
                                          (QREFELT $ 281))
                                |s| (QREFELT $ 104))
                               #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
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
                        (SPADCALL (|spadConstant| $ 151)
                                  (SPADCALL (|spadConstant| $ 63) 1
                                            (QREFELT $ 271))
                                  (QREFELT $ 272))
                        (SPADCALL (|spadConstant| $ 159) (QREFELT $ 273))
                        (QREFELT $ 274))
                       $)
                      |GUESS;ADEguessStreamMixShift|)
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEguessStreamMixShift!0|
                                 (VECTOR $ |maxMD| |q|))
                           (QREFELT $ 290)))))) 

(SDEFUN |GUESS;ADEguessStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |maxMD| $)
          (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;ADEguessStreamMixShift|))
          (LETT |maxMD| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (LETT $ (QREFELT $$ 4) . #1=(|GUESS;ADEguessModGen2Mixed|))
          (LETT |dl| (QREFELT $$ 3) . #1#)
          (LETT |o| (QREFELT $$ 2) . #1#)
          (LETT |maxMD| (QREFELT $$ 1) . #1#)
          (LETT |partitions| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|l| NIL) (|vv| NIL) (#2=#:G834 NIL) (|e| NIL) (|vn| NIL)
              (#3=#:G833 NIL) (|i| NIL) (|r| NIL) (#4=#:G832 NIL)
              (#5=#:G831 NIL) (|lastv| NIL) (#6=#:G829 NIL) (|v| NIL)
              (#7=#:G830 NIL) (|w| NIL) (|vv1| NIL) (#8=#:G828 NIL) (|p| NIL)
              (#9=#:G827 NIL) (O NIL) (#10=#:G812 NIL) (#11=#:G826 NIL)
              (|qv| NIL) (|d| NIL) (#12=#:G810 NIL) (|f| NIL))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |fl| (QREFELT $ 185))
                          (|spadConstant| $ 186) (QREFELT $ 155))
                (|error| "ADEguessModGen2Mixed: #fl ~= 1"))
               ('T
                (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 187)) NIL)
                     (LETT |d|
                           (PROG1
                               (LETT #12#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |f| (QREFELT $ 291))
                                                |dl| (QREFELT $ 195))
                                      (|spadConstant| $ 186) (QREFELT $ 195))
                                     NIL)
                             (|check_subtype2| (>= #12# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #12#))
                           NIL)
                     (LETT |qv|
                           (SPADCALL
                            (SPADCALL |d| (|spadConstant| $ 186)
                                      (QREFELT $ 76))
                            (|spadConstant| $ 186) (QREFELT $ 292))
                           NIL)
                     (SEQ (LETT |i| (|spadConstant| $ 186) NIL)
                          (LETT #11# |d| NIL) G190
                          (COND ((> |i| #11#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |qv| |i|
                                      (SPADCALL
                                       (SPADCALL |q| |i| (QREFELT $ 295))
                                       |prime| (QREFELT $ 296))
                                      (QREFELT $ 297))))
                          (LETT |i| (+ |i| 1) NIL) (GO G190) G191 (EXIT NIL))
                     (LETT O
                           (PROG1
                               (LETT #10#
                                     (SPADCALL
                                      (SPADCALL |o|
                                                (SPADCALL |maxMD|
                                                          (|spadConstant| $
                                                                          186)
                                                          (QREFELT $ 76))
                                                (QREFELT $ 298))
                                      (QREFELT $ 299))
                                     NIL)
                             (|check_subtype2| (>= #10# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #10#))
                           NIL)
                     (LETT |vv1|
                           (PROGN
                            (LETT #9# NIL NIL)
                            (SEQ (LETT |p| NIL NIL)
                                 (LETT #8#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |partitions| O
                                                   (QREFELT $ 211))
                                         (QREFELT $ 212))
                                        (QREFELT $ 213))
                                       NIL)
                                 G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN (LETT |p| (CAR #8#) NIL) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #9#
                                         (CONS
                                          (|GUESS;termAsU32VectorShift| |f| |p|
                                           |prime| |dl| $)
                                          #9#)
                                         NIL)))
                                 (LETT #8# (CDR #8#) NIL) (GO G190) G191
                                 (EXIT (NREVERSE #9#))))
                           NIL)
                     (LETT |l| NIL NIL)
                     (LETT |lastv| (SPADCALL |vv1| (QREFELT $ 187)) NIL)
                     (SEQ (LETT |w| NIL NIL)
                          (LETT #7# (SPADCALL |vv1| (QREFELT $ 300)) NIL)
                          (LETT |v| NIL NIL) (LETT #6# |vv1| NIL) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |v| (CAR #6#) NIL) NIL)
                                (ATOM #7#)
                                (PROGN (LETT |w| (CAR #7#) NIL) NIL))
                            (GO G191)))
                          (SEQ (LETT |lastv| |w| NIL)
                               (LETT |vv| (LIST |v|) NIL) (LETT |vn| |v| NIL)
                               (SEQ (LETT |i| (|spadConstant| $ 186) NIL)
                                    (LETT #5# |maxMD| NIL) G190
                                    (COND ((> |i| #5#) (GO G191)))
                                    (SEQ
                                     (LETT |vn| (SPADCALL |vn| (QREFELT $ 301))
                                           NIL)
                                     (SEQ (LETT |e| (|spadConstant| $ 186) NIL)
                                          (LETT #4# |d| NIL) G190
                                          (COND ((> |e| #4#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |vn| |e|
                                                      (QSMULMOD32
                                                       (SPADCALL |vn| |e|
                                                                 (QREFELT $
                                                                          302))
                                                       (SPADCALL |qv| |e|
                                                                 (QREFELT $
                                                                          302))
                                                       |prime|)
                                                      (QREFELT $ 297))))
                                          (LETT |e| (+ |e| 1) NIL) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (LETT |vv|
                                            (SPADCALL |vn| |vv|
                                                      (QREFELT $ 303))
                                            NIL)))
                                    (LETT |i| (+ |i| 1) NIL) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |l|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |vv| (QREFELT $ 304))
                                        (QREFELT $ 188))
                                       |l| (QREFELT $ 306))
                                      NIL)))
                          (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#) NIL))
                                NIL)
                          (GO G190) G191 (EXIT NIL))
                     (LETT |vv| (LIST |lastv|) NIL) (LETT |vn| |lastv| NIL)
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL |o|
                                      (SPADCALL |maxMD| (|spadConstant| $ 186)
                                                (QREFELT $ 76))
                                      (QREFELT $ 307))
                            (|spadConstant| $ 186) (QREFELT $ 195))
                           NIL)
                     (COND
                      ((SPADCALL |r|
                                 (SPADCALL (|spadConstant| $ 294)
                                           (QREFELT $ 308))
                                 (QREFELT $ 98))
                       (LETT |r| |maxMD| NIL)))
                     (SEQ (LETT |i| (|spadConstant| $ 186) NIL)
                          (LETT #3# |r| NIL) G190
                          (COND ((> |i| #3#) (GO G191)))
                          (SEQ (LETT |vn| (SPADCALL |vn| (QREFELT $ 301)) NIL)
                               (SEQ (LETT |e| (|spadConstant| $ 186) NIL)
                                    (LETT #2# |d| NIL) G190
                                    (COND ((> |e| #2#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |vn| |e|
                                                (QSMULMOD32
                                                 (SPADCALL |vn| |e|
                                                           (QREFELT $ 302))
                                                 (SPADCALL |qv| |e|
                                                           (QREFELT $ 302))
                                                 |prime|)
                                                (QREFELT $ 297))))
                                    (LETT |e| (+ |e| 1) NIL) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |vv| (SPADCALL |vn| |vv| (QREFELT $ 303))
                                      NIL)))
                          (LETT |i| (+ |i| 1) NIL) (GO G190) G191 (EXIT NIL))
                     (LETT |l|
                           (SPADCALL
                            (SPADCALL (SPADCALL |vv| (QREFELT $ 304))
                                      (QREFELT $ 188))
                            |l| (QREFELT $ 306))
                           NIL)
                     (EXIT
                      (SPADCALL (SPADCALL |l| (QREFELT $ 309))
                                (QREFELT $ 311)))))))))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift|
        ((|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|) ($ |Stream| (|NonNegativeInteger|)))
        (SPROG ((|s| (|Stream| (|NonNegativeInteger|))))
               (SEQ
                (LETT |s| (|GUESS;ADEdegreeStream| |partitions| $)
                      |GUESS;ADEdegreeStreamMixShift|)
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEdegreeStreamMixShift!0|
                                 (VECTOR |maxMD| $))
                           (QREFELT $ 315)))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxMD|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;ADEdegreeStreamMixShift|))
          (LETT |maxMD| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G839 NIL) (|i| NIL) (#3=#:G838 NIL))
                   (SEQ
                    (PROGN
                     (LETT #3# NIL NIL)
                     (SEQ (LETT |i| (|spadConstant| $ 95) NIL)
                          (LETT #2# |maxMD| NIL) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ (EXIT (LETT #3# (CONS |z1| #3#) NIL)))
                          (LETT |i| (+ |i| 1) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))))))) 

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
          (LETT |l| (QREFELT $$ 4) . #1=(|GUESS;ADEtestMixShiftGen|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |maxMD| (QREFELT $$ 2) . #1#)
          (LETT |partitions| (QREFELT $$ 1) . #1#)
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|res| NIL) (#2=#:G862 NIL) (|i| NIL) (#3=#:G861 NIL) (|f0| NIL)
              (|exponents| NIL) (#4=#:G849 NIL) (|oldPartition| NIL)
              (#5=#:G860 NIL) (#6=#:G859 NIL) (|newPartition| NIL)
              (#7=#:G843 NIL) (#8=#:G858 NIL) (|p| NIL) (#9=#:G842 NIL))
             (SEQ (LETT |res| NIL NIL) (LETT |exponents| NIL NIL)
                  (LETT |oldPartition|
                        (PROG1
                            (LETT #9#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |l| (QREFELT $ 317))
                                             (SPADCALL |maxMD|
                                                       (|spadConstant| $ 74)
                                                       (QREFELT $ 76))
                                             (QREFELT $ 298))
                                   (QREFELT $ 299))
                                  NIL)
                          (|check_subtype2| (> #9# 0) '(|PositiveInteger|)
                                            '(|Integer|) #9#))
                        NIL)
                  (SEQ (LETT |p| NIL NIL) (LETT #8# |l| NIL) G190
                       (COND
                        ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#) NIL) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |newPartition|
                              (PROG1
                                  (LETT #7#
                                        (SPADCALL
                                         (SPADCALL |p|
                                                   (SPADCALL |maxMD|
                                                             (|spadConstant| $
                                                                             74)
                                                             (QREFELT $ 76))
                                                   (QREFELT $ 298))
                                         (QREFELT $ 299))
                                        NIL)
                                (|check_subtype2| (> #7# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #7#))
                              NIL)
                        (COND
                         ((SPADCALL |newPartition| |oldPartition|
                                    (QREFELT $ 318))
                          (SEQ
                           (LETT |f0|
                                 (|GUESS;termAsUFPSSUPF2| |f|
                                  (SPADCALL |partitions| |oldPartition|
                                            (QREFELT $ 214))
                                  (CONS (|function| |GUESS;ShiftSF|) $)
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 152)
                                             (SPADCALL (|spadConstant| $ 160)
                                                       (|spadConstant| $ 74)
                                                       (QREFELT $ 276))
                                             (QREFELT $ 277))
                                   (SPADCALL (|spadConstant| $ 159)
                                             (QREFELT $ 273))
                                   (QREFELT $ 278))
                                  $)
                                 NIL)
                           (LETT |res|
                                 (SPADCALL
                                  (PROGN
                                   (LETT #6# NIL NIL)
                                   (SEQ (LETT |i| NIL NIL)
                                        (LETT #5# |exponents| NIL) G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN
                                               (LETT |i| (CAR #5#) NIL)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6#
                                                (CONS
                                                 (SPADCALL |f0|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |q|
                                                                        (QREFELT
                                                                         $
                                                                         242))
                                                              |i|
                                                              (QREFELT $ 124))
                                                             (QREFELT $ 247))
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             160)
                                                             (|spadConstant| $
                                                                             74)
                                                             (QREFELT $ 276))
                                                            (QREFELT $ 319))
                                                           (QREFELT $ 320))
                                                 #6#)
                                                NIL)))
                                        (LETT #5# (CDR #5#) NIL) (GO G190) G191
                                        (EXIT (NREVERSE #6#))))
                                  |res| (QREFELT $ 321))
                                 NIL)
                           (LETT |exponents| NIL NIL)
                           (EXIT (LETT |oldPartition| |newPartition| NIL)))))
                        (EXIT
                         (LETT |exponents|
                               (SPADCALL
                                (PROG1
                                    (LETT #4#
                                          (SPADCALL
                                           (SPADCALL |p| (|spadConstant| $ 74)
                                                     (QREFELT $ 195))
                                           (SPADCALL |maxMD|
                                                     (|spadConstant| $ 74)
                                                     (QREFELT $ 76))
                                           (QREFELT $ 296))
                                          NIL)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                |exponents| (QREFELT $ 323))
                               NIL)))
                       (LETT #8# (CDR #8#) NIL) (GO G190) G191 (EXIT NIL))
                  (LETT |f0|
                        (|GUESS;termAsUFPSSUPF2| |f|
                         (SPADCALL |partitions| |oldPartition| (QREFELT $ 214))
                         (CONS (|function| |GUESS;ShiftSF|) $)
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 152)
                                    (SPADCALL (|spadConstant| $ 160)
                                              (|spadConstant| $ 74)
                                              (QREFELT $ 276))
                                    (QREFELT $ 277))
                          (SPADCALL (|spadConstant| $ 159) (QREFELT $ 273))
                          (QREFELT $ 278))
                         $)
                        NIL)
                  (LETT |res|
                        (SPADCALL
                         (PROGN
                          (LETT #3# NIL NIL)
                          (SEQ (LETT |i| NIL NIL) (LETT #2# |exponents| NIL)
                               G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS
                                        (SPADCALL |f0|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |q|
                                                               (QREFELT $ 242))
                                                     |i| (QREFELT $ 124))
                                                    (QREFELT $ 247))
                                                   (SPADCALL
                                                    (|spadConstant| $ 160)
                                                    (|spadConstant| $ 74)
                                                    (QREFELT $ 276))
                                                   (QREFELT $ 319))
                                                  (QREFELT $ 320))
                                        #3#)
                                       NIL)))
                               (LETT #2# (CDR #2#) NIL) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         |res| (QREFELT $ 321))
                        NIL)
                  (EXIT
                   (SPADCALL (SPADCALL |res| (QREFELT $ 324))
                             (QREFELT $ 189))))))))) 

(SDEFUN |GUESS;ADEEXPRRStreamMixShift|
        ((|q| |Symbol|) (|f| EXPRR) (|xx| |Symbol|)
         (|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|) ($ |Stream| EXPRR))
        (SPROG ((|s| (|Stream| EXPRR)))
               (SEQ
                (LETT |s|
                      (|GUESS;ADEEXPRRStream| |f| |xx| |partitions|
                       (CONS (|function| |GUESS;ShiftSX|) $)
                       (CONS (|function| |GUESS;diff1X|) $) $)
                      |GUESS;ADEEXPRRStreamMixShift|)
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEEXPRRStreamMixShift!0|
                                 (VECTOR $ |maxMD| |xx| |q|))
                           (QREFELT $ 327)))))) 

(SDEFUN |GUESS;ADEEXPRRStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |xx| |maxMD| $)
          (LETT |q| (QREFELT $$ 3) . #1=(|GUESS;ADEEXPRRStreamMixShift|))
          (LETT |xx| (QREFELT $$ 2) . #1#)
          (LETT |maxMD| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
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
           ((SPADCALL (SPADCALL |l1| (QREFELT $ 210)) '|displayAsRec|
                      (QREFELT $ 232))
            (|error|
             (SPADCALL "Guess: no support for the qShift operator"
                       " with displayAsGF" (QREFELT $ 42))))
           (#1='T
            (SEQ
             (LETT |partitions| (|GUESS;FilteredPartitionStream| |l1| $)
                   . #2=(|GUESS;shift_hp_aux|))
             (LETT |maxMD| (SPADCALL |l1| (QREFELT $ 209)) . #2#)
             (EXIT
              (COND
               ((ZEROP |maxMD|)
                (SEQ
                 (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $)
                       . #2#)
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
                          (CONS #'|GUESS;shift_hp_aux!7| (VECTOR $ |q|))))))
               (#1#
                (SEQ
                 (LETT |degrees|
                       (|GUESS;ADEdegreeStreamMixShift| |partitions| |maxMD| $)
                       . #2#)
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
                          '|qmixed| |q| (CONS (|function| |GUESS;ShiftA|) $)
                          (CONS (|function| |GUESS;ShiftAF|) $)
                          (CONS (|function| |GUESS;ShiftAX|) $)
                          (CONS (|function| |GUESS;ShiftC|) $))))))))))))) 

(SDEFUN |GUESS;shift_hp_aux!11| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3) . #1=(|GUESS;shift_hp_aux|))
          (LETT |partitions| (QREFELT $$ 2) . #1#)
          (LETT |maxMD| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStreamMixShift| |q| |z1| |z2| |partitions| |maxMD|
             $))))) 

(SDEFUN |GUESS;shift_hp_aux!10| ((|l| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3) . #1=(|GUESS;shift_hp_aux|))
          (LETT |partitions| (QREFELT $$ 2) . #1#)
          (LETT |maxMD| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEtestMixShiftGen| |q| |partitions| |maxMD| |l| $))))) 

(SDEFUN |GUESS;shift_hp_aux!9| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| |degrees| $ |maxMD|)
          (LETT |partitions| (QREFELT $$ 3) . #1=(|GUESS;shift_hp_aux|))
          (LETT |degrees| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |maxMD| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2Mixed| |partitions|
             (SPADCALL |degrees| |o| (QREFELT $ 275)) |maxMD| |o| $))))) 

(SDEFUN |GUESS;shift_hp_aux!8| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3) . #1=(|GUESS;shift_hp_aux|))
          (LETT |partitions| (QREFELT $$ 2) . #1#)
          (LETT |maxMD| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStreamMixShift| |q| |z1| |partitions| |maxMD| $))))) 

(SDEFUN |GUESS;shift_hp_aux!7| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;shift_hp_aux|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;qShiftC| |q| |z1| $))))) 

(SDEFUN |GUESS;shift_hp_aux!6| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;shift_hp_aux|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;qShiftAX| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shift_hp_aux!5| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;shift_hp_aux|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;qShiftAF| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shift_hp_aux!4| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;shift_hp_aux|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;qShiftA| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shift_hp_aux!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shift_hp_aux|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;shift_hp_aux!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shift_hp_aux|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G885 NIL) (|i| NIL) (#3=#:G884 NIL))
                   (SEQ
                    (|GUESS;ADEtestGen2|
                     (PROGN
                      (LETT #3# NIL NIL)
                      (SEQ (LETT |i| NIL NIL) (LETT #2# |l| NIL) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 214))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 152)
                                (SPADCALL (|spadConstant| $ 160)
                                          (|spadConstant| $ 74)
                                          (QREFELT $ 276))
                                (QREFELT $ 277))
                      (SPADCALL (|spadConstant| $ 159) (QREFELT $ 273))
                      (QREFELT $ 278))
                     $))))))) 

(SDEFUN |GUESS;shift_hp_aux!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $ |degrees|)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;shift_hp_aux|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |degrees| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 211))
                        (QREFELT $ 212))
              (QREFELT $ 213))
             (SPADCALL |degrees| |o| (QREFELT $ 275)) $))))) 

(SDEFUN |GUESS;shift_hp_aux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shift_hp_aux|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 151)
                        (SPADCALL (|spadConstant| $ 63) (|spadConstant| $ 186)
                                  (QREFELT $ 271))
                        (QREFELT $ 272))
              (SPADCALL (|spadConstant| $ 159) (QREFELT $ 273))
              (QREFELT $ 274))
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
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;SM;81|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;shift_hp_aux| |q| |l1| $))))) 

(SDEFUN |GUESS;makeEXPRR|
        ((DAX |Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR)
         (|x| |Symbol|) (|p| |SparseUnivariatePolynomial| F) (|expr| EXPRR)
         ($ EXPRR))
        (COND ((SPADCALL |p| (QREFELT $ 329)) (|spadConstant| $ 145))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 330)) (QREFELT $ 10))
                 (SPADCALL (SPADCALL |p| (QREFELT $ 331)) |x| |expr| DAX)
                 (QREFELT $ 104))
                (|GUESS;makeEXPRR| DAX |x| (SPADCALL |p| (QREFELT $ 332))
                 |expr| $)
                (QREFELT $ 93))))) 

(SDEFUN |GUESS;list2UFPSF|
        ((|list| |List| F) ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL (SPADCALL |list| (QREFELT $ 334)) (QREFELT $ 335))) 

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
          (#1=#:G933 NIL) (|e| NIL) (#2=#:G932 NIL))
         (SEQ
          (LETT |l1|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|GUESS;list2UFPSSUPF|))
                  (SEQ (LETT |e| NIL . #3#) (LETT #1# |list| . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |e| (QREFELT $ 247)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 338))
                . #3#)
          (LETT |s1| (SPADCALL (ELT $ 69) 0 (QREFELT $ 72)) . #3#)
          (LETT |l2|
                (SPADCALL (CONS #'|GUESS;list2UFPSSUPF!0| $) |s1|
                          (QREFELT $ 343))
                . #3#)
          (EXIT
           (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 344)) (QREFELT $ 345)))))) 

(SDEFUN |GUESS;list2UFPSSUPF!0| ((|i| NIL) ($ NIL))
        (SPROG ((#1=#:G928 NIL))
               (SPADCALL (|spadConstant| $ 63)
                         (SPADCALL (|spadConstant| $ 186)
                                   (PROG1 (LETT #1# |i| NIL)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 340))
                         (QREFELT $ 341)))) 

(SDEFUN |GUESS;SUPF2SUPSUPF|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL (ELT $ 247) |p| (QREFELT $ 349))) 

(SDEFUN |GUESS;UFPSF2SUPF|
        ((|f| |UnivariateFormalPowerSeries| F) (|deg| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (SPADCALL |f| |deg| (QREFELT $ 351)) (QREFELT $ 352))) 

(SDEFUN |GUESS;getListSUPF|
        ((|s| |List| (|UnivariateFormalPowerSeries| F))
         (|deg| |NonNegativeInteger|)
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;getListSUPF!0| (VECTOR $ |deg|)) |s|
                         (QREFELT $ 356)))) 

(SDEFUN |GUESS;getListSUPF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|deg| $)
          (LETT |deg| (QREFELT $$ 1) . #1=(|GUESS;getListSUPF|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (#1=#:G994 NIL) (|i| NIL) (#2=#:G993 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#3=#:G992 NIL) (#4=#:G991 NIL) (#5=#:G990 NIL) (#6=#:G989 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary")) (#7=#:G945 NIL)
          (#8=#:G987 NIL) (|del| (|Integer|)) (|leadingZeros| (|Integer|))
          (#9=#:G988 NIL) (|el| NIL) (|sigma| (|NonNegativeInteger|))
          (#10=#:G943 NIL) (|list| (|List| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |list| (|SPADfirst| |lists|)
                  . #11=(|GUESS;guessInterpolateModular|))
            (LETT |sigma|
                  (PROG1 (LETT #10# (- (LENGTH |list|) |degreeLoss|) . #11#)
                    (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #10#))
                  . #11#)
            (LETT |leadingZeros| 0 . #11#)
            (SEQ (LETT |el| NIL . #11#) (LETT #9# |list| . #11#) G190
                 (COND
                  ((OR (ATOM #9#) (PROGN (LETT |el| (CAR #9#) . #11#) NIL)
                       (NULL (SPADCALL |el| (QREFELT $ 357))))
                   (GO G191)))
                 (SEQ (EXIT (LETT |leadingZeros| (+ |leadingZeros| 1) . #11#)))
                 (LETT #9# (CDR #9#) . #11#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |leadingZeros| |degreeLoss| (QREFELT $ 168))
              (SEQ (LETT |del| (- |leadingZeros| |degreeLoss|) . #11#)
                   (EXIT
                    (COND
                     ((SPADCALL |del| |guessDegree| (QREFELT $ 168))
                      (PROGN (LETT #8# (CONS 1 'NIL) . #11#) (GO #12=#:G986)))
                     (#13='T
                      (LETT |guessDegree|
                            (PROG1 (LETT #7# (- |guessDegree| |del|) . #11#)
                              (|check_subtype2| (>= #7# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #7#))
                            . #11#)))))))
            (COND
             ((NULL (SPADCALL |options| (QREFELT $ 358)))
              (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 359)) . #11#)
                   (EXIT
                    (COND
                     ((QEQCAR |maxD| 0)
                      (COND
                       ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                        (LETT |degs|
                              (PROGN
                               (LETT #6# NIL . #11#)
                               (SEQ (LETT |i| 1 . #11#) (LETT #5# |o| . #11#)
                                    G190
                                    (COND ((|greater_SI| |i| #5#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #6# (CONS (QCDR |maxD|) #6#)
                                            . #11#)))
                                    (LETT |i| (|inc_SI| |i|) . #11#) (GO G190)
                                    G191 (EXIT (NREVERSE #6#))))
                              . #11#))
                       (#13#
                        (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|) . #11#)
                             (EXIT
                              (LETT |degs|
                                    (PROGN
                                     (LETT #4# NIL . #11#)
                                     (SEQ (LETT |i| 1 . #11#)
                                          (LETT #3# |o| . #11#) G190
                                          (COND
                                           ((|greater_SI| |i| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #4#
                                                  (CONS
                                                   (COND
                                                    ((SPADCALL |i| (QCDR |deg|)
                                                               (QREFELT $ 360))
                                                     (+ (QCAR |deg|) 1))
                                                    ('T (QCAR |deg|)))
                                                   #4#)
                                                  . #11#)))
                                          (LETT |i| (|inc_SI| |i|) . #11#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #4#))))
                                    . #11#))))))
                     (#13#
                      (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|) . #11#)
                           (EXIT
                            (LETT |degs|
                                  (PROGN
                                   (LETT #2# NIL . #11#)
                                   (SEQ (LETT |i| 1 . #11#)
                                        (LETT #1# |o| . #11#) G190
                                        (COND
                                         ((|greater_SI| |i| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (COND
                                                  ((SPADCALL |i| (QCDR |deg|)
                                                             (QREFELT $ 360))
                                                   (+ (QCAR |deg|) 1))
                                                  ('T (QCAR |deg|)))
                                                 #2#)
                                                . #11#)))
                                        (LETT |i| (|inc_SI| |i|) . #11#)
                                        (GO G190) G191 (EXIT (NREVERSE #2#))))
                                  . #11#)))))))))
            (LETT |check|
                  (CONS #'|GUESS;guessInterpolateModular!0|
                        (VECTOR $ |sigma| |options| D |o| |list|))
                  . #11#)
            (COND
             ((QEQCAR (SPADCALL |options| (QREFELT $ 362)) 1)
              (LETT |check|
                    (SPADCALL |check| |lists| (QVELT D 5) (QVELT D 6) |sigma|
                              (SPADCALL |o| (QVELT D 2)) (QREFELT $ 366))
                    . #11#))
             ((QEQCAR (SPADCALL |options| (QREFELT $ 362)) 0)
              (SEQ
               (COND
                ((SPADCALL |options| (QREFELT $ 367))
                 (SPADCALL "Guess: skipping checks" (QREFELT $ 369))))
               (EXIT
                (LETT |check| (LIST #'|GUESS;guessInterpolateModular!1|)
                      . #11#))))
             (#13#
              (LETT |check|
                    (CONS #'|GUESS;guessInterpolateModular!2|
                          (VECTOR $ |sigma| |options| D |o| |list|))
                    . #11#)))
            (EXIT
             (SPADCALL |lists| |degs| (QVELT D 5) (QVELT D 6) |sigma|
                       (SPADCALL |o| (QVELT D 2)) |check| (QREFELT $ 371)))))
          #12# (EXIT #8#)))) 

(SDEFUN |GUESS;guessInterpolateModular!2| ((|x| NIL) ($$ NIL))
        (PROG (|list| |o| D |options| |sigma| $)
          (LETT |list| (QREFELT $$ 5) . #1=(|GUESS;guessInterpolateModular|))
          (LETT |o| (QREFELT $$ 4) . #1#)
          (LETT D (QREFELT $$ 3) . #1#)
          (LETT |options| (QREFELT $$ 2) . #1#)
          (LETT |sigma| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;checkInterpolant| |list| |o| |x| D |options| |sigma| $))))) 

(SDEFUN |GUESS;guessInterpolateModular!1| ((|x| NIL) ($$ NIL)) (CONS 0 "good")) 

(SDEFUN |GUESS;guessInterpolateModular!0| ((|x| NIL) ($$ NIL))
        (PROG (|list| |o| D |options| |sigma| $)
          (LETT |list| (QREFELT $$ 5) . #1=(|GUESS;guessInterpolateModular|))
          (LETT |o| (QREFELT $$ 4) . #1#)
          (LETT D (QREFELT $$ 3) . #1#)
          (LETT |options| (QREFELT $$ 2) . #1#)
          (LETT |sigma| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
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
         ((#2=#:G1078 NIL) (#3=#:G1100 NIL) (|j| NIL) (|c| (S))
          (|cl| (|List| S)) (#4=#:G1099 NIL) (#5=#:G1098 NIL) (#6=#:G1097 NIL)
          (#7=#:G1095 NIL) (|i1| NIL) (#8=#:G1096 NIL) (|i2| NIL)
          (|Mr| (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|m| (|NonNegativeInteger|)) (|rl| (|List| (|Integer|)))
          (|ce| (|List| (|SparseUnivariatePolynomial| S))) (#9=#:G1094 NIL)
          (|i| NIL) (M (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|vguessListF| (|Vector| (|SparseUnivariatePolynomial| F)))
          (|vguessList| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|guessPolys| (|List| (|SparseUnivariatePolynomial| F)))
          (#10=#:G1058 NIL)
          (|guessList| (|List| (|UnivariateFormalPowerSeries| F)))
          (|guessS| #1#) (|sumEta| (|NonNegativeInteger|))
          (|eta| (|List| (|NonNegativeInteger|))) (#11=#:G1093 NIL)
          (#12=#:G1092 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#13=#:G1020 NIL) (#14=#:G1091 NIL) (#15=#:G1090 NIL)
          (#16=#:G1009 NIL) (#17=#:G1089 NIL) (#18=#:G1088 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#19=#:G997 NIL) (#20=#:G1087 NIL) (|d| NIL) (#21=#:G1086 NIL)
          (|list| (|List| F)))
         (SEQ
          (LETT |list| (|SPADfirst| |lists|)
                . #22=(|GUESS;guessInterpolateFFFG|))
          (COND
           ((SPADCALL |options| (QREFELT $ 367))
            (SPADCALL "Guess: using FFFG" (QREFELT $ 369))))
          (COND
           ((SPADCALL |options| (QREFELT $ 358))
            (SEQ
             (LETT |eta|
                   (PROGN
                    (LETT #21# NIL . #22#)
                    (SEQ (LETT |d| NIL . #22#) (LETT #20# |degs| . #22#) G190
                         (COND
                          ((OR (ATOM #20#)
                               (PROGN (LETT |d| (CAR #20#) . #22#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #21#
                                 (CONS
                                  (PROG1 (LETT #19# |d| . #22#)
                                    (|check_subtype2| (>= #19# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #19#))
                                  #21#)
                                 . #22#)))
                         (LETT #20# (CDR #20#) . #22#) (GO G190) G191
                         (EXIT (NREVERSE #21#))))
                   . #22#)
             (EXIT
              (SPADCALL |eta| 1 (+ (SPADCALL |eta| 1 (QREFELT $ 372)) 1)
                        (QREFELT $ 373)))))
           (#23='T
            (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 359)) . #22#)
                 (EXIT
                  (COND
                   ((QEQCAR |maxD| 0)
                    (COND
                     ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                      (LETT |eta|
                            (PROGN
                             (LETT #18# NIL . #22#)
                             (SEQ (LETT |i| 1 . #22#) (LETT #17# |o| . #22#)
                                  G190
                                  (COND ((|greater_SI| |i| #17#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #18#
                                          (CONS
                                           (COND
                                            ((< |i| |o|) (+ (QCDR |maxD|) 1))
                                            ('T (QCDR |maxD|)))
                                           #18#)
                                          . #22#)))
                                  (LETT |i| (|inc_SI| |i|) . #22#) (GO G190)
                                  G191 (EXIT (NREVERSE #18#))))
                            . #22#))
                     (#23#
                      (SEQ
                       (LETT |deg|
                             (DIVIDE2
                              (PROG1
                                  (LETT #16# (- (+ |guessDegree| |o|) 1)
                                        . #22#)
                                (|check_subtype2| (>= #16# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #16#))
                              |o|)
                             . #22#)
                       (EXIT
                        (LETT |eta|
                              (PROGN
                               (LETT #15# NIL . #22#)
                               (SEQ (LETT |i| 1 . #22#) (LETT #14# |o| . #22#)
                                    G190
                                    (COND ((|greater_SI| |i| #14#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #15#
                                            (CONS
                                             (COND
                                              ((SPADCALL |i| (QCDR |deg|)
                                                         (QREFELT $ 360))
                                               (+ (QCAR |deg|) 1))
                                              ('T (QCAR |deg|)))
                                             #15#)
                                            . #22#)))
                                    (LETT |i| (|inc_SI| |i|) . #22#) (GO G190)
                                    G191 (EXIT (NREVERSE #15#))))
                              . #22#))))))
                   (#23#
                    (SEQ
                     (LETT |deg|
                           (DIVIDE2
                            (PROG1
                                (LETT #13# (- (+ |guessDegree| |o|) 1) . #22#)
                              (|check_subtype2| (>= #13# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #13#))
                            |o|)
                           . #22#)
                     (EXIT
                      (LETT |eta|
                            (PROGN
                             (LETT #12# NIL . #22#)
                             (SEQ (LETT |i| 1 . #22#) (LETT #11# |o| . #22#)
                                  G190
                                  (COND ((|greater_SI| |i| #11#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #12#
                                          (CONS
                                           (COND
                                            ((SPADCALL |i| (QCDR |deg|)
                                                       (QREFELT $ 360))
                                             (+ (QCAR |deg|) 1))
                                            ('T (QCAR |deg|)))
                                           #12#)
                                          . #22#)))
                                  (LETT |i| (|inc_SI| |i|) . #22#) (GO G190)
                                  G191 (EXIT (NREVERSE #12#))))
                            . #22#)))))))))
          (LETT |sumEta| (SPADCALL (ELT $ 76) |eta| (QREFELT $ 380)) . #22#)
          (LETT |guessS| (SPADCALL (|GUESS;list2UFPSF| |list| $) (QVELT D 1))
                . #22#)
          (LETT |guessList|
                (SPADCALL
                 (SPADCALL (SPADCALL |guessS| |o| (QREFELT $ 381))
                           (QREFELT $ 382))
                 (QREFELT $ 383))
                . #22#)
          (LETT |guessPolys|
                (|GUESS;getListSUPF| |guessList|
                 (PROG1 (LETT #10# (- |sumEta| 1) . #22#)
                   (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #10#))
                 $)
                . #22#)
          (COND
           ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
            (SEQ
             (LETT |vguessList| (SPADCALL |guessPolys| (QREFELT $ 386)) . #22#)
             (EXIT
              (LETT M
                    (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                              |vguessList| |eta| (QREFELT $ 388))
                    . #22#))))
           ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
            (SEQ
             (LETT |vguessListF| (SPADCALL |guessPolys| (QREFELT $ 390))
                   . #22#)
             (EXIT
              (LETT M
                    (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                              |vguessListF| |eta| (QREFELT $ 392))
                    . #22#))))
           (#23#
            (|error|
             (SPADCALL "Guess: type parameter F should be either equal to"
                       " S or equal to Fraction S" (QREFELT $ 42)))))
          (LETT |rl| NIL . #22#)
          (SEQ (LETT |i| 1 . #22#) (LETT #9# (ANCOLS M) . #22#) G190
               (COND ((|greater_SI| |i| #9#) (GO G191)))
               (SEQ
                (LETT |ce|
                      (SPADCALL (SPADCALL M |i| (QREFELT $ 393))
                                (QREFELT $ 394))
                      . #22#)
                (EXIT
                 (COND
                  ((QEQCAR
                    (|GUESS;checkInterpolant| |list| |o|
                     (SPADCALL (SPADCALL M |i| (QREFELT $ 393))
                               (QREFELT $ 394))
                     D |options| |guessDegree| $)
                    0)
                   (LETT |rl| (CONS |i| |rl|) . #22#)))))
               (LETT |i| (|inc_SI| |i|) . #22#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((NULL |rl|) (MAKE_MATRIX 0 0))
                 (#23#
                  (SEQ (LETT |rl| (NREVERSE |rl|) . #22#)
                       (LETT |m| (ANROWS M) . #22#)
                       (LETT |Mr|
                             (MAKE_MATRIX1 |m| (LENGTH |rl|)
                                           (|spadConstant| $ 395))
                             . #22#)
                       (SEQ (LETT |i2| NIL . #22#) (LETT #8# |rl| . #22#)
                            (LETT |i1| 1 . #22#)
                            (LETT #7# (LENGTH |rl|) . #22#) G190
                            (COND
                             ((OR (|greater_SI| |i1| #7#) (ATOM #8#)
                                  (PROGN (LETT |i2| (CAR #8#) . #22#) NIL))
                              (GO G191)))
                            (SEQ
                             (COND
                              ((|HasCategory| (QREFELT $ 7) '(|Field|))
                               (SEQ (LETT |c| (|spadConstant| $ 144) . #22#)
                                    (EXIT
                                     (SEQ (LETT |j| 1 . #22#)
                                          (LETT #6# |m| . #22#) G190
                                          (COND
                                           ((OR (|greater_SI| |j| #6#)
                                                (NULL
                                                 (SPADCALL |c|
                                                           (QREFELT $ 396))))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |c|
                                                  (SPADCALL
                                                   (SPADCALL M |j| |i2|
                                                             (QREFELT $ 397))
                                                   (QREFELT $ 398))
                                                  . #22#)))
                                          (LETT |j| (|inc_SI| |j|) . #22#)
                                          (GO G190) G191 (EXIT NIL)))))
                              ('T
                               (SEQ
                                (LETT |cl|
                                      (PROGN
                                       (LETT #5# NIL . #22#)
                                       (SEQ (LETT |j| 1 . #22#)
                                            (LETT #4# |m| . #22#) G190
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
                                                                         397))
                                                      (QREFELT $ 399))
                                                     #5#)
                                                    . #22#)))
                                            (LETT |j| (|inc_SI| |j|) . #22#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      . #22#)
                                (EXIT
                                 (LETT |c| (SPADCALL |cl| (QREFELT $ 400))
                                       . #22#)))))
                             (EXIT
                              (SEQ (LETT |j| 1 . #22#) (LETT #3# |m| . #22#)
                                   G190
                                   (COND ((|greater_SI| |j| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |Mr| |j| |i1|
                                               (PROG2
                                                   (LETT #2#
                                                         (SPADCALL
                                                          (SPADCALL M |j| |i2|
                                                                    (QREFELT $
                                                                             397))
                                                          |c| (QREFELT $ 401))
                                                         . #22#)
                                                   (QCDR #2#)
                                                 (|check_union2| (QEQCAR #2# 0)
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT $
                                                                           7))
                                                                 (|Union|
                                                                  (|SparseUnivariatePolynomial|
                                                                   (QREFELT $
                                                                            7))
                                                                  "failed")
                                                                 #2#))
                                               (QREFELT $ 402))))
                                   (LETT |j| (|inc_SI| |j|) . #22#) (GO G190)
                                   G191 (EXIT NIL))))
                            (LETT |i1|
                                  (PROG1 (|inc_SI| |i1|)
                                    (LETT #8# (CDR #8#) . #22#))
                                  . #22#)
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
                 (QREFELT $ 416))))) 

(SDEFUN |GUESS;guessInterpolate3!1| (($$ NIL))
        (PROG (|vs| $ |lists| |o| |degreeLoss| |guessDegree| D |options|)
          (LETT |vs| (QREFELT $$ 7) . #1=(|GUESS;guessInterpolate3|))
          (LETT $ (QREFELT $$ 6) . #1#)
          (LETT |lists| (QREFELT $$ 5) . #1#)
          (LETT |o| (QREFELT $$ 4) . #1#)
          (LETT |degreeLoss| (QREFELT $$ 3) . #1#)
          (LETT |guessDegree| (QREFELT $$ 2) . #1#)
          (LETT D (QREFELT $$ 1) . #1#)
          (LETT |options| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|degs| NIL) (M0 NIL) (#2=#:G1117 NIL) (M NIL))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |vs| (QREFELT $ 403))
                           (SPADCALL |vs| (QREFELT $ 406)))
                       (SPADCALL (QREFELT $ 405)))
                      ('T
                       (SEQ (LETT |degs| (SPADCALL |vs| (QREFELT $ 407)) NIL)
                            (LETT M0
                                  (|GUESS;guessInterpolateModular| |lists|
                                   |degs| |o| |degreeLoss| |guessDegree| D
                                   |options| $)
                                  NIL)
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
                                          |degs| (QREFELT $ 412))
                                         (EXIT
                                          (|GUESS;guessInterpolateFFFG| |lists|
                                           |degs| |o| |guessDegree| D |options|
                                           $))))))
                                     (EXIT
                                      (PROGN
                                       (LETT #2#
                                             (|GUESS;guessInterpolate3| |lists|
                                              |o| |degreeLoss| |guessDegree| D
                                              |options|
                                              (SPADCALL |vs| (QREFELT $ 413))
                                              $)
                                             NIL)
                                       (GO #3=#:G1116)))))
                                   ('T (QCDR M0)))
                                  NIL)
                            (EXIT
                             (SPADCALL M
                                       (|GUESS;guessInterpolate3| |lists| |o|
                                        |degreeLoss| |guessDegree| D |options|
                                        (SPADCALL |vs| (QREFELT $ 413)) $)
                                       (QREFELT $ 414)))))))
                    #3# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessInterpolate3!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 95) (QREFELT $ 410))) 

(SDEFUN |GUESS;listDecr|
        ((|l| |List| (|NonNegativeInteger|)) ($ |List| (|Integer|)))
        (SPADCALL (CONS #'|GUESS;listDecr!0| $) |l| (QREFELT $ 419))) 

(SDEFUN |GUESS;listDecr!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 186) (QREFELT $ 195))) 

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
                 ((SPADCALL |options| (QREFELT $ 358))
                  (SEQ
                   (LETT |maxD0| (SPADCALL |options| (QREFELT $ 359))
                         . #1=(|GUESS;guessInterpolate2|))
                   (LETT |maxD|
                         (COND ((QEQCAR |maxD0| 0) (QCDR |maxD0|))
                               (#2='T (- (+ |guessDegree| |o|) 2)))
                         . #1#)
                   (LETT |vs0|
                         (SPADCALL (+ |guessDegree| |o|) (+ |maxD| 1) |o|
                                   (QREFELT $ 421))
                         . #1#)
                   (EXIT
                    (SPADCALL (CONS (|function| |GUESS;listDecr|) $) |vs0|
                              (QREFELT $ 424)))))
                 (#2#
                  (SPADCALL NIL (SPADCALL (QREFELT $ 425)) (QREFELT $ 426))))
                . #1#)
          (EXIT
           (|GUESS;guessInterpolate3| |lists| |o| |degreeLoss| |guessDegree| D
            |options| |vs| $))))) 

(SDEFUN |GUESS;precCheck|
        ((|list| |List| F) (|resi| |List| (|SparseUnivariatePolynomial| S))
         (|options| |List| (|GuessOption|)) (|sigma| |Integer|)
         (|bad| |Boolean|) ($ |Union| "good" "reject" "no_solution"))
        (SPROG
         ((#1=#:G1175 NIL) (#2=#:G1173 NIL) (|res2| (S)) (|p2val| (S))
          (|p2| (|SparseUnivariatePolynomial| S)) (#3=#:G1185 NIL) (|j| NIL)
          (#4=#:G1172 NIL) (#5=#:G1184 NIL) (|si| (S)) (#6=#:G1183 NIL)
          (|i| NIL) (#7=#:G1174 NIL) (|res1| (S)) (#8=#:G1182 NIL)
          (#9=#:G1181 NIL) (|gl| (|Vector| S)) (#10=#:G1170 NIL)
          (#11=#:G1180 NIL) (#12=#:G1169 NIL) (#13=#:G1179 NIL)
          (#14=#:G1178 NIL) (#15=#:G1171 NIL) (|cden| (S)) (|c2| (S))
          (#16=#:G1139 NIL) (|c1| (S)) (|pp| (S)) (|vd| (S)) (|vi| (F))
          (#17=#:G1177 NIL) (#18=#:G1176 NIL) (|order| (|Integer|))
          (|j0| (|Integer|)) (|svar| (|SingletonAsOrderedSet|))
          (|max_ind| #19=(|Integer|)) (|degree_loss| #19#) (|gl0| (|Vector| F))
          (|m| (|NonNegativeInteger|))
          (|resv| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|homo| (|Boolean|))
          (|homp| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |homp| (SPADCALL |options| (QREFELT $ 59))
                  . #20=(|GUESS;precCheck|))
            (LETT |homo| (COND ((QEQCAR |homp| 1) (QCDR |homp|)) (#21='T 'T))
                  . #20#)
            (LETT |resv| (SPADCALL |resi| (QREFELT $ 386)) . #20#)
            (LETT |m| (QVSIZE |resv|) . #20#)
            (LETT |gl0| (SPADCALL |list| (QREFELT $ 428)) . #20#)
            (LETT |degree_loss| (COND (|homo| (- |m| 1)) (#21# (- |m| 2)))
                  . #20#)
            (COND
             ((SPADCALL |options| (QREFELT $ 429))
              (LETT |max_ind| (- (- (QVSIZE |gl0|) |degree_loss|) 1) . #20#))
             (#21# (LETT |max_ind| (- |sigma| 1) . #20#)))
            (LETT |svar| (SPADCALL (QREFELT $ 431)) . #20#)
            (LETT |j0| (COND (|homo| 1) (#21# 2)) . #20#)
            (LETT |order| 0 . #20#)
            (EXIT
             (COND
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SEQ (LETT |gl| |gl0| . #20#)
                    (SEQ (LETT |i| 0 . #20#) (LETT #18# |max_ind| . #20#) G190
                         (COND ((|greater_SI| |i| #18#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |res1| (|spadConstant| $ 144) . #20#)
                                (LETT |cden| (|spadConstant| $ 64) . #20#)
                                (LETT |si| (SPADCALL |i| (QREFELT $ 432))
                                      . #20#)
                                (COND
                                 ((NULL |homo|)
                                  (LETT |res1|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |resv| 1 (QREFELT $ 433))
                                          |svar| |si| (QREFELT $ 434))
                                         (QREFELT $ 435))
                                        . #20#)))
                                (SEQ (LETT |j| |j0| . #20#)
                                     (LETT #17# |m| . #20#) G190
                                     (COND ((> |j| #17#) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 433))
                                            . #20#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 434))
                                             (QREFELT $ 435))
                                            . #20#)
                                      (LETT |vi|
                                            (SPADCALL |gl|
                                                      (+ (- (+ |i| |j|) |j0|)
                                                         1)
                                                      (QREFELT $ 436))
                                            . #20#)
                                      (LETT |vd| (SPADCALL |vi| (QREFELT $ 36))
                                            . #20#)
                                      (LETT |pp|
                                            (SPADCALL |cden| |vd|
                                                      (QREFELT $ 437))
                                            . #20#)
                                      (LETT |c1|
                                            (PROG2
                                                (LETT #16#
                                                      (SPADCALL |cden| |pp|
                                                                (QREFELT $
                                                                         438))
                                                      . #20#)
                                                (QCDR #16#)
                                              (|check_union2| (QEQCAR #16# 0)
                                                              (QREFELT $ 7)
                                                              (|Union|
                                                               (QREFELT $ 7)
                                                               #22="failed")
                                                              #16#))
                                            . #20#)
                                      (LETT |c2|
                                            (PROG2
                                                (LETT #16#
                                                      (SPADCALL |vd| |pp|
                                                                (QREFELT $
                                                                         438))
                                                      . #20#)
                                                (QCDR #16#)
                                              (|check_union2| (QEQCAR #16# 0)
                                                              (QREFELT $ 7)
                                                              (|Union|
                                                               (QREFELT $ 7)
                                                               #22#)
                                                              #16#))
                                            . #20#)
                                      (LETT |res1|
                                            (SPADCALL
                                             (SPADCALL |c2| |res1|
                                                       (QREFELT $ 439))
                                             (SPADCALL
                                              (SPADCALL |p2val| |c1|
                                                        (QREFELT $ 439))
                                              (SPADCALL |vi| (QREFELT $ 35))
                                              (QREFELT $ 439))
                                             (QREFELT $ 376))
                                            . #20#)
                                      (EXIT
                                       (LETT |cden|
                                             (SPADCALL |cden| |c2|
                                                       (QREFELT $ 439))
                                             . #20#)))
                                     (LETT |j| (+ |j| 1) . #20#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res1| (|spadConstant| $ 144)
                                             (QREFELT $ 440))
                                   (PROGN
                                    (LETT #15#
                                          (COND
                                           ((< |i| |sigma|)
                                            (PROGN
                                             (LETT #1# (CONS 2 "no_solution")
                                                   . #20#)
                                             (GO #23=#:G1168)))
                                           ('T
                                            (PROGN
                                             (LETT #1# (CONS 1 "reject")
                                                   . #20#)
                                             (GO #23#))))
                                          . #20#)
                                    (GO #24=#:G1143)))))))
                          #24# (EXIT #15#))
                         (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                         (EXIT NIL))
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 429)))
                      (PROGN (LETT #1# (CONS 0 "good") . #20#) (GO #23#))))
                    (EXIT
                     (COND
                      (|bad|
                       (PROGN (LETT #1# (CONS 1 "reject") . #20#) (GO #23#)))
                      (#21#
                       (SEQ
                        (SEQ (LETT |i| 1 . #20#)
                             (LETT #14# |degree_loss| . #20#) G190
                             (COND ((|greater_SI| |i| #14#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ
                                (LETT |si|
                                      (SPADCALL (+ |i| |max_ind|)
                                                (QREFELT $ 432))
                                      . #20#)
                                (SEQ (LETT |j| (- |m| |i|) . #20#)
                                     (LETT #13# |m| . #20#) G190
                                     (COND ((> |j| #13#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ
                                        (LETT |p2|
                                              (SPADCALL |resv| |j|
                                                        (QREFELT $ 433))
                                              . #20#)
                                        (LETT |p2val|
                                              (SPADCALL
                                               (SPADCALL |p2| |svar| |si|
                                                         (QREFELT $ 434))
                                               (QREFELT $ 435))
                                              . #20#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |p2val|
                                                     (|spadConstant| $ 144)
                                                     (QREFELT $ 440))
                                           (PROGN
                                            (LETT #12#
                                                  (PROGN
                                                   (LETT #1# (CONS 0 "good")
                                                         . #20#)
                                                   (GO #23#))
                                                  . #20#)
                                            (GO #25=#:G1146)))))))
                                      #25# (EXIT #12#))
                                     (LETT |j| (+ |j| 1) . #20#) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |res2| (|spadConstant| $ 143) . #20#)
                                (COND
                                 (|homo|
                                  (LETT |res2|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |resv| 1 (QREFELT $ 433))
                                           |svar| |si| (QREFELT $ 434))
                                          (QREFELT $ 435))
                                         (QREFELT $ 49))
                                        . #20#)))
                                (SEQ (LETT |j| |j0| . #20#)
                                     (LETT #11# (- |m| |i|) . #20#) G190
                                     (COND ((> |j| #11#) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 433))
                                            . #20#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 434))
                                             (QREFELT $ 435))
                                            . #20#)
                                      (EXIT
                                       (LETT |res2|
                                             (SPADCALL |res2|
                                                       (SPADCALL |p2val|
                                                                 (SPADCALL |gl|
                                                                           (+
                                                                            (-
                                                                             (+
                                                                              (+
                                                                               |i|
                                                                               |max_ind|)
                                                                              |j|)
                                                                             |j0|)
                                                                            1)
                                                                           (QREFELT
                                                                            $
                                                                            436))
                                                                 (QREFELT $
                                                                          441))
                                                       (QREFELT $ 442))
                                             . #20#)))
                                     (LETT |j| (+ |j| 1) . #20#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res2| (|spadConstant| $ 143)
                                             (QREFELT $ 443))
                                   (PROGN
                                    (LETT #10#
                                          (PROGN
                                           (LETT #1# (CONS 1 "reject") . #20#)
                                           (GO #23#))
                                          . #20#)
                                    (GO #26=#:G1150)))))))
                              #26# (EXIT #10#))
                             (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN
                          (LETT #1# (CONS 0 "good") . #20#)
                          (GO #23#)))))))))
              ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
               (SEQ (LETT |gl| |gl0| . #20#)
                    (SEQ (LETT |i| 0 . #20#) (LETT #9# |max_ind| . #20#) G190
                         (COND ((|greater_SI| |i| #9#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |res1| (|spadConstant| $ 144) . #20#)
                                (LETT |si| (SPADCALL |i| (QREFELT $ 432))
                                      . #20#)
                                (COND
                                 ((NULL |homo|)
                                  (LETT |res1|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |resv| 1 (QREFELT $ 433))
                                          |svar| |si| (QREFELT $ 434))
                                         (QREFELT $ 435))
                                        . #20#)))
                                (SEQ (LETT |j| |j0| . #20#)
                                     (LETT #8# |m| . #20#) G190
                                     (COND ((> |j| #8#) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 433))
                                            . #20#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 434))
                                             (QREFELT $ 435))
                                            . #20#)
                                      (EXIT
                                       (LETT |res1|
                                             (SPADCALL |res1|
                                                       (SPADCALL |p2val|
                                                                 (SPADCALL |gl|
                                                                           (+
                                                                            (-
                                                                             (+
                                                                              |i|
                                                                              |j|)
                                                                             |j0|)
                                                                            1)
                                                                           (QREFELT
                                                                            $
                                                                            445))
                                                                 (QREFELT $
                                                                          439))
                                                       (QREFELT $ 376))
                                             . #20#)))
                                     (LETT |j| (+ |j| 1) . #20#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res1| (|spadConstant| $ 144)
                                             (QREFELT $ 440))
                                   (PROGN
                                    (LETT #7#
                                          (COND
                                           ((< |i| |sigma|)
                                            (PROGN
                                             (LETT #1# (CONS 2 "no_solution")
                                                   . #20#)
                                             (GO #23#)))
                                           ('T
                                            (PROGN
                                             (LETT #1# (CONS 1 "reject")
                                                   . #20#)
                                             (GO #23#))))
                                          . #20#)
                                    (GO #27=#:G1156)))))))
                          #27# (EXIT #7#))
                         (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                         (EXIT NIL))
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 429)))
                      (PROGN (LETT #1# (CONS 0 "good") . #20#) (GO #23#))))
                    (EXIT
                     (COND
                      (|bad|
                       (PROGN (LETT #1# (CONS 1 "reject") . #20#) (GO #23#)))
                      (#21#
                       (SEQ
                        (SEQ (LETT |i| 1 . #20#)
                             (LETT #6# |degree_loss| . #20#) G190
                             (COND ((|greater_SI| |i| #6#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ
                                (LETT |si|
                                      (SPADCALL (+ |i| |max_ind|)
                                                (QREFELT $ 432))
                                      . #20#)
                                (SEQ (LETT |j| (- |m| |i|) . #20#)
                                     (LETT #5# |m| . #20#) G190
                                     (COND ((> |j| #5#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ
                                        (LETT |p2|
                                              (SPADCALL |resv| |j|
                                                        (QREFELT $ 433))
                                              . #20#)
                                        (LETT |p2val|
                                              (SPADCALL
                                               (SPADCALL |p2| |svar| |si|
                                                         (QREFELT $ 434))
                                               (QREFELT $ 435))
                                              . #20#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |p2val|
                                                     (|spadConstant| $ 144)
                                                     (QREFELT $ 440))
                                           (PROGN
                                            (LETT #4#
                                                  (PROGN
                                                   (LETT #1# (CONS 0 "good")
                                                         . #20#)
                                                   (GO #23#))
                                                  . #20#)
                                            (GO #28=#:G1159)))))))
                                      #28# (EXIT #4#))
                                     (LETT |j| (+ |j| 1) . #20#) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |res2| (|spadConstant| $ 144) . #20#)
                                (COND
                                 (|homo|
                                  (LETT |res2|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |resv| 1 (QREFELT $ 433))
                                          |svar| |si| (QREFELT $ 434))
                                         (QREFELT $ 435))
                                        . #20#)))
                                (SEQ (LETT |j| |j0| . #20#)
                                     (LETT #3# (- |m| |i|) . #20#) G190
                                     (COND ((> |j| #3#) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 433))
                                            . #20#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 434))
                                             (QREFELT $ 435))
                                            . #20#)
                                      (EXIT
                                       (LETT |res2|
                                             (SPADCALL |res2|
                                                       (SPADCALL |p2val|
                                                                 (SPADCALL |gl|
                                                                           (+
                                                                            (-
                                                                             (+
                                                                              (+
                                                                               |i|
                                                                               |max_ind|)
                                                                              |j|)
                                                                             |j0|)
                                                                            1)
                                                                           (QREFELT
                                                                            $
                                                                            445))
                                                                 (QREFELT $
                                                                          439))
                                                       (QREFELT $ 376))
                                             . #20#)))
                                     (LETT |j| (+ |j| 1) . #20#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res2| (|spadConstant| $ 144)
                                             (QREFELT $ 440))
                                   (PROGN
                                    (LETT #2#
                                          (PROGN
                                           (LETT #1# (CONS 1 "reject") . #20#)
                                           (GO #23#))
                                          . #20#)
                                    (GO #29=#:G1163)))))))
                              #29# (EXIT #2#))
                             (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN
                          (LETT #1# (CONS 0 "good") . #20#)
                          (GO #23#)))))))))
              (#21# (|error| "F must be S or Fraction(S)"))))))
          #23# (EXIT #1#)))) 

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
         ((#2=#:G1238 NIL) (#3=#:G1236 NIL) (|order| (|Integer|))
          (|c| (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|d| NIL) (|dmax| (|NonNegativeInteger|))
          (|resiSUPF|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#4=#:G1243 NIL) (|i| NIL) (#5=#:G1242 NIL) (|testList| #1#)
          (|flist| (|List| (|PositiveInteger|))) (#6=#:G1217 NIL)
          (#7=#:G1241 NIL) (#8=#:G1240 NIL) (|maxPow| (|Integer|))
          (|maxP| (|Union| (|PositiveInteger|) "arbitrary"))
          (|len| (|NonNegativeInteger|)) (|reject_one_term| (|Boolean|))
          (#9=#:G1237 NIL)
          (|nonZeroCoefficients| (|Union| "one" "several" "none"))
          (#10=#:G1239 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |options| (QREFELT $ 367))
              (SPADCALL "Guess: checking solution" (QREFELT $ 369))))
            (LETT |nonZeroCoefficients| (CONS 2 "none")
                  . #11=(|GUESS;checkInterpolant|))
            (LETT |reject_one_term| 'NIL . #11#)
            (SEQ
             (EXIT
              (SEQ (LETT |i| 1 . #11#) (LETT #10# (LENGTH |resi|) . #11#) G190
                   (COND ((|greater_SI| |i| #10#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |resi| |i| (QREFELT $ 446))
                                  (QREFELT $ 447)))
                       (COND
                        ((QEQCAR |nonZeroCoefficients| 2)
                         (LETT |nonZeroCoefficients| (CONS 0 "one") . #11#))
                        ('T
                         (SEQ
                          (LETT |nonZeroCoefficients| (CONS 1 "several")
                                . #11#)
                          (EXIT
                           (PROGN
                            (LETT #9# |$NoValue| . #11#)
                            (GO #12=#:G1194))))))))))
                   (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL)))
             #12# (EXIT #9#))
            (COND
             ((NULL (QEQCAR |nonZeroCoefficients| 1))
              (COND
               ((NULL (SPADCALL (ELT $ 357) |list| (QREFELT $ 454)))
                (SEQ (LETT |reject_one_term| 'T . #11#)
                     (EXIT
                      (COND
                       ((SPADCALL |options| (QREFELT $ 367))
                        (SPADCALL "Guess: encountered single-term solution"
                                  (QREFELT $ 369))))))))))
            (LETT |len| (LENGTH |list|) . #11#)
            (LETT |maxP| (SPADCALL |options| (QREFELT $ 57)) . #11#)
            (COND ((QEQCAR |maxP| 0) (LETT |maxPow| (QCDR |maxP|) . #11#))
                  (#13='T (LETT |maxPow| (+ |len| 2) . #11#)))
            (COND
             ((EQL |maxPow| 1)
              (COND
               ((EQUAL (QVELT D 5) '|shiftHP|)
                (EXIT
                 (|GUESS;precCheck| |list| |resi| |options| |sigma|
                  |reject_one_term| $))))))
            (LETT |flist|
                  (PROGN
                   (LETT #8# NIL . #11#)
                   (SEQ (LETT |i| 1 . #11#) (LETT #7# |o| . #11#) G190
                        (COND ((|greater_SI| |i| #7#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((COND
                             ((SPADCALL (SPADCALL |resi| |i| (QREFELT $ 446))
                                        (QREFELT $ 447))
                              'NIL)
                             (#13# 'T))
                            (LETT #8#
                                  (CONS
                                   (PROG1 (LETT #6# |i| . #11#)
                                     (|check_subtype2| (> #6# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #6#))
                                   #8#)
                                  . #11#)))))
                        (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #8#))))
                  . #11#)
            (LETT |testList|
                  (SPADCALL (|GUESS;list2UFPSSUPF| |list| $)
                            (SPADCALL |flist| (QVELT D 3)))
                  . #11#)
            (LETT |resiSUPF|
                  (PROGN
                   (LETT #5# NIL . #11#)
                   (SEQ (LETT |i| NIL . #11#) (LETT #4# |flist| . #11#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |i| (CAR #4#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #5#
                                (CONS
                                 (|GUESS;SUPF2SUPSUPF|
                                  (|GUESS;SUPS2SUPF|
                                   (SPADCALL |resi| |i| (QREFELT $ 446)) $)
                                  $)
                                 #5#)
                                . #11#)))
                        (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #11#)
            (LETT |order| 0 . #11#)
            (LETT |dmax| (SPADCALL 10 (LENGTH |list|) (QREFELT $ 455)) . #11#)
            (SEQ
             (EXIT
              (SEQ (LETT |d| 0 . #11#) G190 NIL
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 429)))
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN
                         (LETT #2# (CONS 0 "good") . #11#)
                         (GO #14=#:G1235))))))
                    (COND
                     (|reject_one_term|
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN
                         (LETT #2# (CONS 1 "reject") . #11#)
                         (GO #14#))))))
                    (LETT |c|
                          (SPADCALL (QVELT D 8) |testList| |d|
                                    (SPADCALL |resiSUPF| (QREFELT $ 458))
                                    (QREFELT $ 459))
                          . #11#)
                    (COND
                     ((NULL (SPADCALL |c| (QREFELT $ 460)))
                      (SEQ (LETT |order| |d| . #11#)
                           (EXIT
                            (PROGN
                             (LETT #3# |$NoValue| . #11#)
                             (GO #15=#:G1228))))))
                    (EXIT
                     (COND
                      ((SPADCALL |d| |dmax| (QREFELT $ 229))
                       (SEQ
                        (SPADCALL "bailing out from checkInterpolant"
                                  (QREFELT $ 462))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "please report the input to "
                                    "fricas-devel@googlegroups.com"
                                    (QREFELT $ 42))
                          (QREFELT $ 463))
                         (QREFELT $ 462))
                        (LETT |order| |d| . #11#)
                        (EXIT
                         (PROGN (LETT #3# |$NoValue| . #11#) (GO #15#))))))))
                   (LETT |d| (|inc_SI| |d|) . #11#) (GO G190) G191 (EXIT NIL)))
             #15# (EXIT #3#))
            (EXIT
             (COND
              ((< |order| |sigma|)
               (SEQ
                (SPADCALL
                 (SPADCALL "Order too low: " (SPADCALL |order| (QREFELT $ 464))
                           (QREFELT $ 465))
                 (QREFELT $ 462))
                (SPADCALL
                 (SPADCALL "sigma: " (SPADCALL |sigma| (QREFELT $ 464))
                           (QREFELT $ 465))
                 (QREFELT $ 462))
                (EXIT
                 (PROGN (LETT #2# (CONS 2 "no_solution") . #11#) (GO #14#)))))
              ((SPADCALL |c| (QREFELT $ 466))
               (SEQ
                (COND
                 ((SPADCALL |options| (QREFELT $ 367))
                  (SEQ
                   (SPADCALL
                    (SPADCALL "Proposed solution does not fit coefficient "
                              (SPADCALL |order| (QREFELT $ 464))
                              (QREFELT $ 465))
                    (QREFELT $ 462))
                   (EXIT
                    (SPADCALL
                     (SPADCALL "sigma: " (SPADCALL |sigma| (QREFELT $ 464))
                               (QREFELT $ 465))
                     (QREFELT $ 462))))))
                (EXIT (PROGN (LETT #2# (CONS 1 "reject") . #11#) (GO #14#)))))
              (#13# (CONS 0 "good"))))))
          #14# (EXIT #2#)))) 

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
         ((|ex| (|List| EXPRR)) (#1=#:G1274 NIL) (|p| NIL) (#2=#:G1275 NIL)
          (|e| NIL) (#3=#:G1273 NIL) (|eq| (EXPRR)) (#4=#:G1271 NIL)
          (#5=#:G1272 NIL) (#6=#:G1270 NIL) (|dk| (|Symbol|)))
         (SEQ
          (LETT |dk| (SPADCALL |options| (QREFELT $ 210))
                . #7=(|GUESS;wrapInterpolant|))
          (COND
           ((OR (EQUAL |dk| '|displayAsGF|) (EQUAL |dk| '|displayAsEQ|))
            (EXIT
             (SEQ
              (LETT |ex|
                    (PROGN
                     (LETT #6# NIL . #7#)
                     (SEQ (LETT |e| NIL . #7#) (LETT #5# |exprList| . #7#)
                          (LETT |p| NIL . #7#) (LETT #4# |resi| . #7#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |p| (CAR #4#) . #7#) NIL)
                                (ATOM #5#)
                                (PROGN (LETT |e| (CAR #5#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (|GUESS;makeEXPRR| (QVELT D 9)
                                    (SPADCALL |options| (QREFELT $ 467))
                                    (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                   #6#)
                                  . #7#)))
                          (LETT #4#
                                (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #7#))
                                . #7#)
                          (GO G190) G191 (EXIT (NREVERSE #6#))))
                    . #7#)
              (LETT |eq|
                    (SPADCALL (SPADCALL (ELT $ 93) |ex| (QREFELT $ 106))
                              (QREFELT $ 468))
                    . #7#)
              (EXIT
               (COND ((EQUAL |dk| '|displayAsEQ|) |eq|)
                     (#8='T
                      (SPADCALL |op| (SPADCALL |options| (QREFELT $ 467))
                                (SPADCALL |options| (QREFELT $ 469)) |eq|
                                (|GUESS;getVariables| |initials| $)
                                (SPADCALL (QREFELT $ 10)
                                          (SPADCALL |initials| (QREFELT $ 334))
                                          (QREFELT $ 472))
                                (QREFELT $ 475)))))))))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsRec|)
             (SEQ
              (LETT |ex|
                    (PROGN
                     (LETT #3# NIL . #7#)
                     (SEQ (LETT |e| NIL . #7#) (LETT #2# |exprList| . #7#)
                          (LETT |p| NIL . #7#) (LETT #1# |resi| . #7#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |p| (CAR #1#) . #7#) NIL)
                                (ATOM #2#)
                                (PROGN (LETT |e| (CAR #2#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (|GUESS;makeEXPRR| (QVELT D 9)
                                    (SPADCALL |options| (QREFELT $ 469))
                                    (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                   #3#)
                                  . #7#)))
                          (LETT #1#
                                (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #7#))
                                . #7#)
                          (GO G190) G191 (EXIT (NREVERSE #3#))))
                    . #7#)
              (EXIT
               (SPADCALL |op| (SPADCALL |options| (QREFELT $ 469))
                         (SPADCALL (SPADCALL (ELT $ 93) |ex| (QREFELT $ 106))
                                   (QREFELT $ 468))
                         (|GUESS;getVariables| |initials| $)
                         (SPADCALL (QREFELT $ 10)
                                   (SPADCALL |initials| (QREFELT $ 334))
                                   (QREFELT $ 472))
                         (QREFELT $ 476)))))
            (#8# (|error| "wrapInterpolant: unsupported display kind"))))))) 

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
         ((#3=#:G1346 NIL) (|reslist| (|List| EXPRR)) (|res| (EXPRR))
          (#4=#:G1348 NIL) (|i| NIL) (|exprList| (|List| EXPRR))
          (MS (|Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
          (M (|Matrix| (|SparseUnivariatePolynomial| S))) (#5=#:G1344 NIL)
          (#6=#:G1326 NIL) (#7=#:G1347 NIL) (#8=#:G1341 NIL) (#9=#:G1289 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|guessDegree| #10=(|Integer|)) (|degreeLoss| (|Integer|))
          (#11=#:G1345 NIL) (#12=#:G1280 NIL) (|o| NIL) (|exprS| #2#)
          (#13=#:G1340 NIL) (|dk| (|Symbol|)) (|degreeS| #1#)
          (|op| (|BasicOperator|)) (|listDegree| #10#) (|list| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |reslist| NIL . #14=(|GUESS;guessHPaux|))
                (LETT |list| (|SPADfirst| |lists|) . #14#)
                (LETT |listDegree|
                      (- (- (LENGTH |list|) 1)
                         (SPADCALL |options| (QREFELT $ 477)))
                      . #14#)
                (COND
                 ((< |listDegree| 0)
                  (PROGN (LETT #3# |reslist| . #14#) (GO #15=#:G1339))))
                (LETT |op|
                      (SPADCALL (SPADCALL |options| (QREFELT $ 478))
                                (QREFELT $ 479))
                      . #14#)
                (LETT |degreeS| (QVELT D 0) . #14#)
                (LETT |dk| (SPADCALL |options| (QREFELT $ 210)) . #14#)
                (LETT |exprS|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |dk| '|displayAsGF|)
                              (EQUAL |dk| '|displayAsEQ|))
                          (SPADCALL
                           (SPADCALL |op|
                                     (SPADCALL
                                      (SPADCALL |options| (QREFELT $ 467))
                                      (QREFELT $ 45))
                                     (QREFELT $ 480))
                           (SPADCALL |options| (QREFELT $ 467)) (QVELT D 4)))
                         ((EQUAL |dk| '|displayAsRec|)
                          (PROGN
                           (LETT #13#
                                 (SPADCALL
                                  (SPADCALL |op|
                                            (SPADCALL
                                             (SPADCALL |options|
                                                       (QREFELT $ 469))
                                             (QREFELT $ 45))
                                            (QREFELT $ 480))
                                  (SPADCALL |options| (QREFELT $ 469))
                                  (QVELT D 4))
                                 . #14#)
                           (GO #16=#:G1279)))))
                       #16# (EXIT #13#))
                      . #14#)
                (SEQ
                 (EXIT
                  (SEQ (LETT |o| 2 . #14#) G190 NIL
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL |degreeS|
                                      (PROG1 (LETT #12# (- |o| 1) . #14#)
                                        (|check_subtype2| (>= #12# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #12#))
                                      (QREFELT $ 481))
                            (QREFELT $ 482))
                           (PROGN
                            (LETT #11# |$NoValue| . #14#)
                            (GO #17=#:G1337)))
                          ('T
                           (SEQ
                            (LETT |degreeLoss|
                                  (SPADCALL |degreeS| |o| (QREFELT $ 275))
                                  . #14#)
                            (LETT |guessDegree|
                                  (- (- (+ |listDegree| 2) |degreeLoss|) |o|)
                                  . #14#)
                            (COND
                             ((< |guessDegree| 0)
                              (SEQ
                               (COND
                                ((SPADCALL |options| (QREFELT $ 367))
                                 (SPADCALL
                                  "Guess: not enough values for guessing"
                                  (QREFELT $ 369))))
                               (EXIT
                                (PROGN
                                 (LETT #3# |reslist| . #14#)
                                 (GO #15#))))))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 367))
                              (SPADCALL
                               (SPADCALL
                                (LIST "Guess: trying order "
                                      (SPADCALL |o| (QREFELT $ 483))
                                      ", guessDegree is "
                                      (SPADCALL |guessDegree| (QREFELT $ 464)))
                                (QREFELT $ 484))
                               (QREFELT $ 485))))
                            (LETT |maxD| (SPADCALL |options| (QREFELT $ 359))
                                  . #14#)
                            (EXIT
                             (COND
                              ((QEQCAR |maxD| 0)
                               (COND
                                ((OR
                                  (OR
                                   (SPADCALL
                                    (SPADCALL |degreeS| |o| (QREFELT $ 481))
                                    (QREFELT $ 482))
                                   (NULL
                                    (< (* (QCDR |maxD|) |o|) |guessDegree|)))
                                  (NULL
                                   (SPADCALL (* (QCDR |maxD|) (+ |o| 1))
                                             (-
                                              (- (+ |listDegree| 2)
                                                 (SPADCALL |degreeS| (+ |o| 1)
                                                           (QREFELT $ 275)))
                                              (+ |o| 1))
                                             (QREFELT $ 163))))
                                 (SEQ (LETT |exprList| NIL . #14#)
                                      (COND
                                       ((SPADCALL |options| (QREFELT $ 367))
                                        (SEQ
                                         (LETT |exprList|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |exprS| |o|
                                                           (QREFELT $ 486))
                                                 (QREFELT $ 487))
                                                (QREFELT $ 488))
                                               . #14#)
                                         (SPADCALL
                                          #18="Guess: The list of expressions is"
                                          (QREFELT $ 369))
                                         (EXIT
                                          (SPADCALL
                                           (SPADCALL |exprList|
                                                     (QREFELT $ 489))
                                           (QREFELT $ 485))))))
                                      (LETT MS
                                            (|GUESS;guessInterpolate2| |lists|
                                             |o| |degreeLoss|
                                             (PROG1
                                                 (LETT #9# |guessDegree|
                                                       . #14#)
                                               (|check_subtype2| (>= #9# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #9#))
                                             D |options| $)
                                            . #14#)
                                      (EXIT
                                       (SEQ
                                        (EXIT
                                         (SEQ G190 NIL
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((SPADCALL MS (QREFELT $ 490))
                                                  (PROGN
                                                   (LETT #8# |$NoValue| . #14#)
                                                   (GO #19=#:G1296)))
                                                 ('T
                                                  (SEQ
                                                   (LETT M
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            491))
                                                         . #14#)
                                                   (LETT MS
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            492))
                                                         . #14#)
                                                   (COND
                                                    ((NULL |exprList|)
                                                     (LETT |exprList|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |exprS|
                                                                       |o|
                                                                       (QREFELT
                                                                        $ 486))
                                                             (QREFELT $ 487))
                                                            (QREFELT $ 488))
                                                           . #14#)))
                                                   (SEQ (LETT |i| 1 . #14#)
                                                        (LETT #7# (ANCOLS M)
                                                              . #14#)
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
                                                                            393))
                                                                 (QREFELT $
                                                                          394))
                                                                |exprList|
                                                                |list| D |op|
                                                                |options| $)
                                                               . #14#)
                                                         (EXIT
                                                          (COND
                                                           ((NULL
                                                             (SPADCALL |res|
                                                                       |reslist|
                                                                       (QREFELT
                                                                        $
                                                                        493)))
                                                            (LETT |reslist|
                                                                  (CONS |res|
                                                                        |reslist|)
                                                                  . #14#)))))
                                                        (LETT |i|
                                                              (|inc_SI| |i|)
                                                              . #14#)
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                   (EXIT
                                                    (COND
                                                     ((NULL (NULL |reslist|))
                                                      (COND
                                                       ((SPADCALL |options|
                                                                  (QREFELT $
                                                                           494))
                                                        (PROGN
                                                         (LETT #3# |reslist|
                                                               . #14#)
                                                         (GO #15#))))))))))))
                                              NIL (GO G190) G191 (EXIT NIL)))
                                        #19# (EXIT #8#)))))
                                ((SPADCALL |options| (QREFELT $ 367))
                                 (SPADCALL "Guess: iterating"
                                           (QREFELT $ 369)))))
                              ('T
                               (SEQ (LETT |exprList| NIL . #14#)
                                    (COND
                                     ((SPADCALL |options| (QREFELT $ 367))
                                      (SEQ
                                       (LETT |exprList|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |exprS| |o|
                                                         (QREFELT $ 486))
                                               (QREFELT $ 487))
                                              (QREFELT $ 488))
                                             . #14#)
                                       (SPADCALL #18# (QREFELT $ 369))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |exprList| (QREFELT $ 489))
                                         (QREFELT $ 485))))))
                                    (LETT MS
                                          (|GUESS;guessInterpolate2| |lists|
                                           |o| |degreeLoss|
                                           (PROG1
                                               (LETT #6# |guessDegree| . #14#)
                                             (|check_subtype2| (>= #6# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #6#))
                                           D |options| $)
                                          . #14#)
                                    (EXIT
                                     (SEQ
                                      (EXIT
                                       (SEQ G190 NIL
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((SPADCALL MS (QREFELT $ 490))
                                                (PROGN
                                                 (LETT #5# |$NoValue| . #14#)
                                                 (GO #20=#:G1333)))
                                               ('T
                                                (SEQ
                                                 (LETT M
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          491))
                                                       . #14#)
                                                 (LETT MS
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          492))
                                                       . #14#)
                                                 (COND
                                                  ((NULL |exprList|)
                                                   (LETT |exprList|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |exprS|
                                                                     |o|
                                                                     (QREFELT $
                                                                              486))
                                                           (QREFELT $ 487))
                                                          (QREFELT $ 488))
                                                         . #14#)))
                                                 (SEQ (LETT |i| 1 . #14#)
                                                      (LETT #4# (ANCOLS M)
                                                            . #14#)
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
                                                                          393))
                                                               (QREFELT $ 394))
                                                              |exprList| |list|
                                                              D |op| |options|
                                                              $)
                                                             . #14#)
                                                       (EXIT
                                                        (COND
                                                         ((NULL
                                                           (SPADCALL |res|
                                                                     |reslist|
                                                                     (QREFELT $
                                                                              493)))
                                                          (LETT |reslist|
                                                                (CONS |res|
                                                                      |reslist|)
                                                                . #14#)))))
                                                      (LETT |i| (|inc_SI| |i|)
                                                            . #14#)
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (EXIT
                                                  (COND
                                                   ((NULL (NULL |reslist|))
                                                    (COND
                                                     ((SPADCALL |options|
                                                                (QREFELT $
                                                                         494))
                                                      (PROGN
                                                       (LETT #3# |reslist|
                                                             . #14#)
                                                       (GO #15#))))))))))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #20# (EXIT #5#))))))))))))
                       (LETT |o| (|inc_SI| |o|) . #14#) (GO G190) G191
                       (EXIT NIL)))
                 #17# (EXIT #11#))
                (EXIT |reslist|)))
          #15# (EXIT #3#)))) 

(SDEFUN |GUESS;processOptions|
        ((|options| |List| (|GuessOption|))
         ($ |List| (|List| (|GuessOption|))))
        (SPROG
         ((#1=#:G1398 NIL) (#2=#:G1392 NIL) (#3=#:G1390 NIL) (#4=#:G1402 NIL)
          (#5=#:G1356 NIL) (|i| NIL) (#6=#:G1401 NIL)
          (|minP| (|PositiveInteger|))
          (|hom?| (|Union| (|PositiveInteger|) (|Boolean|))) (#7=#:G1365 NIL)
          (#8=#:G1400 NIL) (#9=#:G1399 NIL) (|maxSomos| (|PositiveInteger|))
          (#10=#:G1350 NIL) (#11=#:G1361 NIL) (#12=#:G1359 NIL)
          (|maxD| (|NonNegativeInteger|)) (#13=#:G1353 NIL)
          (|Som?| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |Som?| (SPADCALL |options| (QREFELT $ 62))
                   . #14=(|GUESS;processOptions|))
             (EXIT
              (COND
               ((QEQCAR |Som?| 1)
                (COND
                 ((QCDR |Som?|)
                  (SEQ
                   (LETT |maxD|
                         (PROG2
                             (LETT #13# (SPADCALL |options| (QREFELT $ 61))
                                   . #14#)
                             (QCDR #13#)
                           (|check_union2| (QEQCAR #13# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "arbitrary")
                                           #13#))
                         . #14#)
                   (COND
                    ((QEQCAR (SPADCALL |options| (QREFELT $ 57)) 0)
                     (LETT |maxSomos|
                           (*
                            (PROG1 (LETT #12# |maxD| . #14#)
                              (|check_subtype2| (> #12# 0) '(|PositiveInteger|)
                                                '(|NonNegativeInteger|) #12#))
                            (PROG2
                                (LETT #5# (SPADCALL |options| (QREFELT $ 57))
                                      . #14#)
                                (QCDR #5#)
                              (|check_union2| (QEQCAR #5# 0)
                                              (|PositiveInteger|)
                                              (|Union| (|PositiveInteger|)
                                                       #15="arbitrary")
                                              #5#)))
                           . #14#))
                    ((QEQCAR (SPADCALL |options| (QREFELT $ 59)) 0)
                     (LETT |maxSomos|
                           (*
                            (PROG1 (LETT #11# |maxD| . #14#)
                              (|check_subtype2| (> #11# 0) '(|PositiveInteger|)
                                                '(|NonNegativeInteger|) #11#))
                            (PROG2
                                (LETT #10# (SPADCALL |options| (QREFELT $ 59))
                                      . #14#)
                                (QCDR #10#)
                              (|check_union2| (QEQCAR #10# 0)
                                              (|PositiveInteger|)
                                              (|Union| (|PositiveInteger|)
                                                       (|Boolean|))
                                              #10#)))
                           . #14#))
                    (#16='T
                     (|error| "Guess: internal error - inconsistent options")))
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (PROGN
                             (LETT #9# NIL . #14#)
                             (SEQ (LETT |i| 2 . #14#)
                                  (LETT #8# |maxSomos| . #14#) G190
                                  (COND ((|greater_SI| |i| #8#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #9#
                                          (CONS
                                           (|GUESS;processOptions|
                                            (CONS
                                             (SPADCALL
                                              (CONS 0
                                                    (PROG1
                                                        (LETT #7# |i| . #14#)
                                                      (|check_subtype2|
                                                       (> #7# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #7#)))
                                              (QREFELT $ 496))
                                             |options|)
                                            $)
                                           #9#)
                                          . #14#)))
                                  (LETT |i| (|inc_SI| |i|) . #14#) (GO G190)
                                  G191 (EXIT (NREVERSE #9#))))
                            (QREFELT $ 498))
                           . #14#)
                     (GO #17=#:G1397))))))))))
            (SEQ (LETT |hom?| (SPADCALL |options| (QREFELT $ 59)) . #14#)
                 (EXIT
                  (COND
                   ((QEQCAR |hom?| 1)
                    (COND
                     ((QCDR |hom?|)
                      (SEQ
                       (COND
                        ((QEQCAR (SPADCALL |options| (QREFELT $ 62)) 0)
                         (LETT |minP| 2 . #14#))
                        (#16# (LETT |minP| 1 . #14#)))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #6# NIL . #14#)
                                (SEQ (LETT |i| |minP| . #14#)
                                     (LETT #4#
                                           (PROG2
                                               (LETT #5#
                                                     (SPADCALL |options|
                                                               (QREFELT $ 57))
                                                     . #14#)
                                               (QCDR #5#)
                                             (|check_union2| (QEQCAR #5# 0)
                                                             (|PositiveInteger|)
                                                             (|Union|
                                                              (|PositiveInteger|)
                                                              #15#)
                                                             #5#))
                                           . #14#)
                                     G190 (COND ((> |i| #4#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #6#
                                             (CONS
                                              (SPADCALL
                                               (LIST
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1
                                                           (LETT #3# |i|
                                                                 . #14#)
                                                         (|check_subtype2|
                                                          (> #3# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #3#)))
                                                 (QREFELT $ 499))
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1
                                                           (LETT #2# |i|
                                                                 . #14#)
                                                         (|check_subtype2|
                                                          (> #2# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #2#)))
                                                 (QREFELT $ 500)))
                                               |options| (QREFELT $ 501))
                                              #6#)
                                             . #14#)))
                                     (LETT |i| (+ |i| 1) . #14#) (GO G190) G191
                                     (EXIT (NREVERSE #6#))))
                               . #14#)
                         (GO #17#))))))))))
            (EXIT (LIST |options|))))
          #17# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LLL;98|
        ((|lists| |List| (|List| F)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1418 NIL) (|res| (|List| EXPRR))
          (#2=#:G1420 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))) (#3=#:G1408 NIL)
          (#4=#:G1417 NIL) (#5=#:G1419 NIL) (|li| NIL)
          (|nn| (|NonNegativeInteger|)) (|rl| (|List| (|List| F)))
          (|l| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 502))
                (EXIT
                 (COND
                  ((NULL |lists|)
                   (|error| "guessAlgDep: need at least one list"))
                  ('T
                   (SEQ
                    (LETT |l| (|SPADfirst| |lists|)
                          . #6=(|GUESS;guessAlgDep;LLL;98|))
                    (LETT |rl| (CDR |lists|) . #6#)
                    (LETT |nn| (LENGTH |l|) . #6#)
                    (SEQ
                     (EXIT
                      (SEQ (LETT |li| NIL . #6#) (LETT #5# |rl| . #6#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |li| (CAR #5#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (LENGTH |li|) |nn| (QREFELT $ 155))
                               (PROGN
                                (LETT #4#
                                      (|error|
                                       "guessAlgDep: lists must have equal length")
                                      . #6#)
                                (GO #7=#:G1404))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL)))
                     #7# (EXIT #4#))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (APPEND
                            (LIST (SPADCALL '|displayAsEQ| (QREFELT $ 503))
                                  (SPADCALL
                                   (CONS 0
                                         (PROG1
                                             (LETT #3# (LENGTH |lists|) . #6#)
                                           (|check_subtype2| (> #3# 0)
                                                             '(|PositiveInteger|)
                                                             '(|NonNegativeInteger|)
                                                             #3#)))
                                   (QREFELT $ 504)))
                            |options|)
                           $)
                          . #6#)
                    (LETT |lres| NIL . #6#) (LETT |res| NIL . #6#)
                    (SEQ (LETT |opts| NIL . #6#) (LETT #2# |lopts| . #6#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |opts| (CAR #2#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GUESS;guessHPaux| |lists|
                                 (SPADCALL |lists| |opts| (QREFELT $ 237))
                                 |opts| $)
                                . #6#)
                          (COND
                           ((NULL (NULL |res|))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 494))
                              (PROGN
                               (LETT #1# |res| . #6#)
                               (GO #8=#:G1416))))))
                          (EXIT (LETT |lres| (APPEND |res| |lres|) . #6#)))
                         (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |lres|))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LL;99|
        ((|lists| |List| (|List| F)) ($ |List| EXPRR))
        (SPADCALL |lists| NIL (QREFELT $ 505))) 

(SDEFUN |GUESS;guessADE;LLL;100|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1429 NIL) (|res| (|List| EXPRR))
          (#2=#:G1430 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 502))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 503))
                             |options|)
                       $)
                      . #3=(|GUESS;guessADE;LLL;100|))
                (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
                (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 226)) |opts| $)
                            . #3#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 494))
                          (PROGN (LETT #1# |res| . #3#) (GO #4=#:G1428))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GUESS;guessADE;LL;101| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 507))) 

(SDEFUN |GUESS;guessAlg;LLL;102|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 0) (QREFELT $ 509)) |options|)
                  (QREFELT $ 507))) 

(SDEFUN |GUESS;guessAlg;LL;103| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 510))) 

(SDEFUN |GUESS;guessHolo;LLL;104|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 500)) |options|)
                  (QREFELT $ 507))) 

(SDEFUN |GUESS;guessHolo;LL;105| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 512))) 

(SDEFUN |GUESS;guessPade;LLL;106|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 509))
                              (SPADCALL (CONS 0 1) (QREFELT $ 500)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 514))))
                       (QREFELT $ 515))
                      |GUESS;guessPade;LLL;106|)
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 507)))))) 

(SDEFUN |GUESS;guessPade;LL;107| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 516))) 

(SDEFUN |GUESS;guessFE;LLL;108|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1458 NIL) (|res| (|List| EXPRR))
          (#2=#:G1459 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 502))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 503))
                             |options|)
                       $)
                      . #3=(|GUESS;guessFE;LLL;108|))
                (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
                (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 241)) |opts| $)
                            . #3#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 494))
                          (PROGN (LETT #1# |res| . #3#) (GO #4=#:G1457))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GUESS;guessFE;LL;109| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 518))) 

(SDEFUN |GUESS;guessADE;SM;110|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessADE;SM;110!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessADE;SM;110!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessADE;SM;110|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#2=#:G1468 NIL) (|res| NIL) (#3=#:G1469 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 502))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsGF| (QREFELT $ 503))
                                     |options| (QREFELT $ 520))
                           $)
                          NIL)
                    (LETT |lres| NIL NIL) (LETT |res| NIL NIL)
                    (SEQ (LETT |opts| NIL NIL) (LETT #3# |lopts| NIL) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |opts| (CAR #3#) NIL) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GUESS;guessHPaux| (LIST |list|)
                                 (SPADCALL |opts|
                                           (SPADCALL |q| (QREFELT $ 253)))
                                 |opts| $)
                                NIL)
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 521)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 494))
                              (PROGN (LETT #2# |res| NIL) (GO #4=#:G1467))))))
                          (EXIT
                           (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 522))
                                 NIL)))
                         (LETT #3# (CDR #3#) NIL) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 523)))))
              #4# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessHolo;SM;111|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessHolo;SM;111!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessHolo;SM;111!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessHolo;SM;111|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 74))
                                 (QREFELT $ 500))
                       |z2| (QREFELT $ 520))
                      (SPADCALL |q| (QREFELT $ 524))))))) 

(SDEFUN |GUESS;guessRec;LLL;112|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1483 NIL) (|res| (|List| EXPRR))
          (#2=#:G1484 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 502))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsRec| (QREFELT $ 503))
                             |options|)
                       $)
                      . #3=(|GUESS;guessRec;LLL;112|))
                (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
                (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 279)) |opts| $)
                            . #3#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 494))
                          (PROGN (LETT #1# |res| . #3#) (GO #4=#:G1482))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GUESS;guessRec;LL;113| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 526))) 

(SDEFUN |GUESS;guessPRec;LLL;114|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 500)) |options|)
                  (QREFELT $ 526))) 

(SDEFUN |GUESS;guessPRec;LL;115| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 528))) 

(SDEFUN |GUESS;guessRat;LLL;116|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 530))
                              (SPADCALL (CONS 0 1) (QREFELT $ 500)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 514))))
                       (QREFELT $ 515))
                      |GUESS;guessRat;LLL;116|)
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 526)))))) 

(SDEFUN |GUESS;guessRat;LL;117| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 531))) 

(SDEFUN |GUESS;guessRec;SM;118|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessRec;SM;118!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessRec;SM;118!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessRec;SM;118|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#2=#:G1507 NIL) (|res| NIL) (#3=#:G1508 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 502))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsRec| (QREFELT $ 503))
                                     |options| (QREFELT $ 520))
                           $)
                          NIL)
                    (LETT |lres| NIL NIL) (LETT |res| NIL NIL)
                    (SEQ (LETT |opts| NIL NIL) (LETT #3# |lopts| NIL) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |opts| (CAR #3#) NIL) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GUESS;guessHPaux| (LIST |list|)
                                 (SPADCALL |opts|
                                           (SPADCALL |q| (QREFELT $ 328)))
                                 |opts| $)
                                NIL)
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 521)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 494))
                              (PROGN (LETT #2# |res| NIL) (GO #4=#:G1506))))))
                          (EXIT
                           (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 522))
                                 NIL)))
                         (LETT #3# (CDR #3#) NIL) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 523)))))
              #4# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessPRec;SM;119|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessPRec;SM;119!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessPRec;SM;119!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessPRec;SM;119|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 74))
                                 (QREFELT $ 500))
                       |z2| (QREFELT $ 520))
                      (SPADCALL |q| (QREFELT $ 533))))))) 

(SDEFUN |GUESS;guessRat;SM;120|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessRat;SM;120!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessRat;SM;120!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessRat;SM;120|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (LIST
                        (LIST
                         (SPADCALL (CONS 0 (|spadConstant| $ 95))
                                   (QREFELT $ 530))
                         (SPADCALL (CONS 0 (|spadConstant| $ 74))
                                   (QREFELT $ 500)))
                        |z2|
                        (LIST
                         (SPADCALL (|spadConstant| $ 535) (QREFELT $ 514))))
                       (QREFELT $ 515))
                      (SPADCALL |q| (QREFELT $ 533))))))) 

(SDEFUN |GUESS;guess;LLLLL;121|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G1619 NIL) (|guess| NIL)
          (|sumGuess| (|List| EXPRR)) (|summ| (EXPRR)) (|init| (EXPRR))
          (#2=#:G1618 NIL) (|var| (|Symbol|)) (|sumList| (|List| F))
          (#3=#:G1617 NIL) (|i| NIL) (#4=#:G1616 NIL) (#5=#:G1610 NIL)
          (#6=#:G1615 NIL) (|prodGuess| (|List| EXPRR)) (|prod| (EXPRR))
          (#7=#:G1614 NIL) (|prodList| (|List| F)) (#8=#:G1613 NIL)
          (#9=#:G1612 NIL)
          (|newMaxLevel| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#10=#:G1531 NIL) (#11=#:G1611 NIL) (|guesser| NIL)
          (|len| (|PositiveInteger|)) (#12=#:G1527 NIL) (|xx| (EXPRR)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |newMaxLevel| (SPADCALL |options| (QREFELT $ 537))
                  . #13=(|GUESS;guess;LLLLL;121|))
            (LETT |xx|
                  (SPADCALL (SPADCALL |options| (QREFELT $ 469))
                            (QREFELT $ 45))
                  . #13#)
            (COND
             ((SPADCALL |options| (QREFELT $ 367))
              (COND
               ((QEQCAR |newMaxLevel| 0)
                (SPADCALL
                 (SPADCALL "Guess: guessing level "
                           (SPADCALL |newMaxLevel| (QREFELT $ 538))
                           (QREFELT $ 465))
                 (QREFELT $ 485))))))
            (LETT |res| NIL . #13#)
            (LETT |len|
                  (PROG1 (LETT #12# (LENGTH |list|) . #13#)
                    (|check_subtype2| (> #12# 0) '(|PositiveInteger|)
                                      '(|NonNegativeInteger|) #12#))
                  . #13#)
            (COND
             ((SPADCALL |len| 1 (QREFELT $ 539))
              (PROGN (LETT #5# |res| . #13#) (GO #14=#:G1609))))
            (SEQ (LETT |guesser| NIL . #13#) (LETT #11# |guessers| . #13#) G190
                 (COND
                  ((OR (ATOM #11#)
                       (PROGN (LETT |guesser| (CAR #11#) . #13#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |res|
                        (APPEND (SPADCALL |list| |options| |guesser|) |res|)
                        . #13#)
                  (EXIT
                   (COND
                    ((SPADCALL |options| (QREFELT $ 494))
                     (COND
                      ((NULL (NULL |res|))
                       (PROGN (LETT #5# |res| . #13#) (GO #14#))))))))
                 (LETT #11# (CDR #11#) . #13#) (GO G190) G191 (EXIT NIL))
            (COND
             ((QEQCAR |newMaxLevel| 0)
              (COND
               ((ZEROP (QCDR |newMaxLevel|))
                (PROGN (LETT #5# |res| . #13#) (GO #14#)))
               (#15='T
                (LETT |newMaxLevel|
                      (CONS 0
                            (PROG1
                                (LETT #10# (- (QCDR |newMaxLevel|) 1) . #13#)
                              (|check_subtype2| (>= #10# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #10#)))
                      . #13#)))))
            (COND
             ((SPADCALL '|guessProduct| |ops| (QREFELT $ 540))
              (COND
               ((SPADCALL (|spadConstant| $ 143) |list| (QREFELT $ 541))
                (SEQ (|spadConstant| $ 143)
                     (EXIT
                      (COND
                       ((SPADCALL |options| (QREFELT $ 367))
                        (SPADCALL
                         "Guess: cannot use guessProduct because of zeros"
                         (QREFELT $ 369)))))))
               (#15#
                (SEQ
                 (LETT |prodList|
                       (PROGN
                        (LETT #9# NIL . #13#)
                        (SEQ (LETT |i| 1 . #13#) (LETT #8# (- |len| 1) . #13#)
                             G190 (COND ((|greater_SI| |i| #8#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #9#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL |list| (+ |i| 1)
                                                 (QREFELT $ 542))
                                       (SPADCALL |list| |i| (QREFELT $ 542))
                                       (QREFELT $ 543))
                                      #9#)
                                     . #13#)))
                             (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
                       . #13#)
                 (EXIT
                  (COND
                   ((NULL (SPADCALL (ELT $ 552) |prodList| (QREFELT $ 454)))
                    (SEQ
                     (LETT |var|
                           (SPADCALL '|p|
                                     (LIST (SPADCALL |len| (QREFELT $ 553)))
                                     (QREFELT $ 555))
                           . #13#)
                     (LETT |prodGuess| NIL . #13#)
                     (SEQ (LETT |guess| NIL . #13#)
                          (LETT #7#
                                (SPADCALL |prodList| |guessers| |ops|
                                          (APPEND
                                           (LIST
                                            (SPADCALL |var| (QREFELT $ 556))
                                            (SPADCALL |newMaxLevel|
                                                      (QREFELT $ 557)))
                                           |options|)
                                          (QREFELT $ 559))
                                . #13#)
                          G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |guess| (CAR #7#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |init|
                                 (SPADCALL (SPADCALL |list| 1 (QREFELT $ 542))
                                           (QREFELT $ 10))
                                 . #13#)
                           (LETT |prod|
                                 (SPADCALL |guess|
                                           (SPADCALL |var|
                                                     (SPADCALL
                                                      (|spadConstant| $ 145)
                                                      (SPADCALL |xx|
                                                                (|spadConstant|
                                                                 $ 149)
                                                                (QREFELT $
                                                                         257))
                                                      (QREFELT $ 561))
                                                     (QREFELT $ 563))
                                           (QREFELT $ 565))
                                 . #13#)
                           (EXIT
                            (LETT |prodGuess|
                                  (CONS
                                   (SPADCALL |init| |prod| (QREFELT $ 104))
                                   |prodGuess|)
                                  . #13#)))
                          (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT
                      (SEQ (LETT |guess| NIL . #13#)
                           (LETT #6# |prodGuess| . #13#) G190
                           (COND
                            ((OR (ATOM #6#)
                                 (PROGN (LETT |guess| (CAR #6#) . #13#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((COND
                                ((SPADCALL |guess| |res| (QREFELT $ 493)) 'NIL)
                                (#15# 'T))
                               (LETT |res| (CONS |guess| |res|) . #13#)))))
                           (LETT #6# (CDR #6#) . #13#) (GO G190) G191
                           (EXIT NIL))))))))))))
            (COND
             ((SPADCALL |options| (QREFELT $ 494))
              (COND
               ((NULL (NULL |res|))
                (PROGN (LETT #5# |res| . #13#) (GO #14#))))))
            (COND
             ((SPADCALL '|guessSum| |ops| (QREFELT $ 540))
              (SEQ
               (LETT |sumList|
                     (PROGN
                      (LETT #4# NIL . #13#)
                      (SEQ (LETT |i| 1 . #13#) (LETT #3# (- |len| 1) . #13#)
                           G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (SPADCALL
                                     (SPADCALL |list| (+ |i| 1)
                                               (QREFELT $ 542))
                                     (SPADCALL |list| |i| (QREFELT $ 542))
                                     (QREFELT $ 571))
                                    #4#)
                                   . #13#)))
                           (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     . #13#)
               (EXIT
                (COND
                 ((NULL
                   (SPADCALL
                    (CONS #'|GUESS;guess;LLLLL;121!0| (VECTOR $ |sumList|))
                    |sumList| (QREFELT $ 454)))
                  (SEQ
                   (LETT |var|
                         (SPADCALL '|s| (LIST (SPADCALL |len| (QREFELT $ 553)))
                                   (QREFELT $ 555))
                         . #13#)
                   (LETT |sumGuess| NIL . #13#)
                   (SEQ (LETT |guess| NIL . #13#)
                        (LETT #2#
                              (SPADCALL |sumList| |guessers| |ops|
                                        (APPEND
                                         (LIST (SPADCALL |var| (QREFELT $ 556))
                                               (SPADCALL |newMaxLevel|
                                                         (QREFELT $ 557)))
                                         |options|)
                                        (QREFELT $ 559))
                              . #13#)
                        G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |guess| (CAR #2#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |init|
                               (SPADCALL (SPADCALL |list| 1 (QREFELT $ 542))
                                         (QREFELT $ 10))
                               . #13#)
                         (LETT |summ|
                               (SPADCALL |guess|
                                         (SPADCALL |var|
                                                   (SPADCALL
                                                    (|spadConstant| $ 145)
                                                    (SPADCALL |xx|
                                                              (|spadConstant| $
                                                                              149)
                                                              (QREFELT $ 257))
                                                    (QREFELT $ 561))
                                                   (QREFELT $ 563))
                                         (QREFELT $ 573))
                               . #13#)
                         (EXIT
                          (LETT |sumGuess|
                                (CONS (SPADCALL |init| |summ| (QREFELT $ 93))
                                      |sumGuess|)
                                . #13#)))
                        (LETT #2# (CDR #2#) . #13#) (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SEQ (LETT |guess| NIL . #13#) (LETT #1# |sumGuess| . #13#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |guess| (CAR #1#) . #13#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((COND
                              ((SPADCALL |guess| |res| (QREFELT $ 493)) 'NIL)
                              (#15# 'T))
                             (LETT |res| (CONS |guess| |res|) . #13#)))))
                         (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                         (EXIT NIL))))))))))
            (EXIT |res|)))
          #14# (EXIT #5#)))) 

(SDEFUN |GUESS;guess;LLLLL;121!0| ((|z1| NIL) ($$ NIL))
        (PROG (|sumList| $)
          (LETT |sumList| (QREFELT $$ 1) . #1=(|GUESS;guess;LLLLL;121|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL |sumList| (|spadConstant| $ 74)
                                (QREFELT $ 542))
                      (QREFELT $ 572)))))) 

(SDEFUN |GUESS;guess;LL;122| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 531)) (LIST '|guessProduct| '|guessSum|)
                  NIL (QREFELT $ 559))) 

(SDEFUN |GUESS;guess;LLL;123|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 531)) (LIST '|guessProduct| '|guessSum|)
                  |options| (QREFELT $ 559))) 

(SDEFUN |GUESS;guess;LLLL;124|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) ($ |List| EXPRR))
        (SPADCALL |list| |guessers| |ops| NIL (QREFELT $ 559))) 

(DECLAIM (NOTINLINE |Guess;|)) 

(DEFUN |Guess| (&REST #1=#:G1627)
  (SPROG NIL
         (PROG (#2=#:G1628)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|Guess|)
                                               '|domainEqualList|)
                    . #3=(|Guess|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |Guess;|) #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Guess|)))))))))) 

(DEFUN |Guess;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|Guess|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|Guess| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 577) . #1#)
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
                                                          (|Symbol|))))))
                    . #1#))
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
         (QSETREFV $ 253
                   (CONS (|dispatchFunction| |GUESS;diffHP;SM;58|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 328
                   (CONS (|dispatchFunction| |GUESS;shiftHP;SM;81|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 524 (CONS (|dispatchFunction| |GUESS;guessADE;SM;110|) $))
         (QSETREFV $ 525
                   (CONS (|dispatchFunction| |GUESS;guessHolo;SM;111|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 533 (CONS (|dispatchFunction| |GUESS;guessRec;SM;118|) $))
         (QSETREFV $ 534
                   (CONS (|dispatchFunction| |GUESS;guessPRec;SM;119|) $))
         (QSETREFV $ 536
                   (CONS (|dispatchFunction| |GUESS;guessRat;SM;120|) $)))))))
    $))) 

(MAKEPROP '|Guess| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|List| 8)
              (|List| 6) (|List| 495) (|GuessExpBin| 6 7 8 9 10)
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
              (373 . |Zero|) (377 . |Zero|) (381 . |Zero|) (385 . |Zero|)
              (389 . |Zero|) (393 . |One|) (397 . |One|) (401 . |One|)
              (405 . |One|) (|Vector| 107) (409 . |setelt!|) (416 . ~=)
              (422 . |differentiate|) (428 . *) (|Fraction| 66) (434 . |One|)
              (438 . |One|) (|Vector| 132) (442 . |setelt!|) (449 . <=)
              (|Union| $ '"failed") (455 . |subtractIfCan|) (|List| 100)
              (461 . |position|) (467 . >) (|Reference| 166) (473 . |deref|)
              (478 . |coerce|) (483 . |partition|) (|Reference| 99)
              (488 . |deref|) (493 . |setref|) (499 . |setref|) (505 . |max|)
              (511 . |first|) (|Mapping| 66 85) (|ListFunctions2| 85 66)
              (516 . |map|) (522 . |reduce|) (528 . |ref|) (533 . |ref|)
              (538 . |#|) (543 . |One|) (547 . |first|) (552 . |vector|)
              (557 . |vector|) (|Stream| 8) (|Mapping| 8 85)
              (|StreamFunctions2| 85 8) (562 . |map|) (568 . |empty?|)
              (573 . -) (579 . |max|) (|Stream| 75) (|Mapping| 75 85 75)
              (|StreamFunctions2| 85 75) (585 . |scan|) (592 . D) (599 . D)
              (605 . D) (|FractionFreeFastGaussian| 7 52) (611 . |DiffAction|)
              (|FractionFreeFastGaussian| 129 132) (618 . |DiffAction|)
              (625 . |DiffC|) (630 . |maxMixedDegree|) (635 . |displayKind|)
              (640 . |first|) (646 . |complete|) (651 . |entries|)
              (656 . |elt|) (|Mapping| 139 118) (|Mapping| 153 114 66 66)
              (|Mapping| 216 75) (|Mapping| 161 132) (|Mapping| 218 316)
              (|Mapping| 190 8 22) (|Mapping| 7 75 75 52)
              (|Mapping| 129 75 75 132) (|Mapping| 8 75 22 8) (|Mapping| 31 75)
              (|Record| (|:| |degreeStream| 197) (|:| |guessStream| 215)
                        (|:| |guessModGen| 217) (|:| |testGen| 219)
                        (|:| |exprStream| 220) (|:| |kind| 22) (|:| |qvar| 22)
                        (|:| A 221) (|:| AF 222) (|:| AX 223) (|:| C 224))
              |GUESS;diffHP;LR;43| (662 . |elt|) (668 . |functionNames|)
              (673 . >) (679 . ~=) (685 . |coerce|) (690 . ~=) (|List| 12)
              (696 . |elt|) (|Mapping| 75 85) (702 . |map|)
              |GUESS;algDepHP;LLR;47| (708 . |eval|)
              (715 . |multiplyExponents|) (721 . |multiplyExponents|)
              |GUESS;substHP;LR;51| (727 . |coerce|) (732 . *) (|Mapping| 6 66)
              (738 . |multiplyCoefficients|) (744 . |Zero|) (748 . |coerce|)
              (|Mapping| 129 66) (753 . |multiplyCoefficients|) (759 . |zero?|)
              (764 . =) (|Mapping| 225 13) (770 . |diffHP|) (775 . |coerce|)
              (780 . |factorial|) (785 . /) (791 . -) (797 . |quoByVar|)
              (|Mapping| 118 118) (|MappingPackage1| 118) (802 . ^)
              (808 . |quoByVar|) (|Mapping| 132 132) (|MappingPackage1| 132)
              (813 . ^) (|IntegerCombinatoricFunctions| 66) (819 . |stirling2|)
              (825 . |ShiftAction|) (832 . |ShiftAction|) (839 . |ShiftC|)
              (844 . |monomial|) (850 . -) (856 . -) (861 . ^) (867 . |elt|)
              (873 . |monomial|) (879 . -) (885 . ^) |GUESS;shiftHP;LR;68|
              (891 . *) (897 . ^) (903 . |coerce|) (908 . |qShiftAction|)
              (916 . |qShiftAction|) (924 . |qShiftC|) (930 . *) (936 . |elt|)
              (|Mapping| 122 118) (|StreamTensor| 118) (942 . |tensorMap|)
              (948 . |#|) (953 . |new|) (|SingleInteger|) (959 . |One|)
              (963 . ^) (969 . |rem|) (975 . |setelt!|) (982 . /)
              (988 . |ceiling|) (993 . |rest|) (998 . |copy|) (1003 . |elt|)
              (1009 . |cons|) (1015 . |reverse!|) (|List| 153) (1020 . |cons|)
              (1026 . |rem|) (1032 . -) (1037 . |reverse!|) (|List| $)
              (1042 . |concat|) (1047 . |Zero|) (|Mapping| 322 75)
              (|StreamTensor| 75) (1051 . |tensorMap|) (|List| 73)
              (1057 . |first|) (1062 . >) (1068 . *) (1074 . |elt|)
              (1080 . |concat|) (|List| 75) (1086 . |cons|) (1092 . |reverse!|)
              (|Mapping| 11 8) (|StreamTensor| 8) (1097 . |tensorMap|)
              (1103 . |shiftHP|) (1108 . |zero?|) (1113 . |leadingCoefficient|)
              (1118 . |degree|) (1123 . |reductum|) (|Stream| 6)
              (1128 . |coerce|) (1133 . |series|) (|List| 129) (|Stream| 129)
              (1138 . |coerce|) (|IndexedExponents| 75) (1143 . |monomial|)
              (1149 . |monomial|) (|StreamFunctions2| 66 129) (1155 . |map|)
              (1161 . |concat|) (1167 . |series|)
              (|SparseUnivariatePolynomial| 129) (|Mapping| 129 6)
              (|SparseUnivariatePolynomialFunctions2| 6 129) (1172 . |map|)
              (|UnivariatePolynomial| (NRTEVAL '|x|) 6)
              (1178 . |univariatePolynomial|) (1184 . |makeSUP|) (|List| 50)
              (|Mapping| 50 118) (|ListFunctions2| 118 50) (1189 . |map|)
              (1195 . |zero?|) (1200 . |allDegrees|) (1205 . |maxDegree|)
              (1210 . <=) (|Union| '"skip" '"MonteCarlo" '"deterministic")
              (1216 . |check|) (|Union| '"good" '"reject" '"no_solution")
              (|Mapping| 363 384) (|ModularHermitePadeSolver| 6 7)
              (1221 . |gen_Monte_Carlo_check|) (1231 . |debug|)
              (|OutputPackage|) (1236 . |output|) (|Union| 387 89)
              (1241 . |HP_solve|) (1252 . |elt|) (1258 . |setelt!|) (1265 . +)
              (1271 . +) (1277 . +) (1283 . +) (1289 . +) (|Mapping| 75 75 75)
              (1295 . |reduce|) (1301 . |first|) (1307 . |complete|)
              (1312 . |entries|) (|List| 52) (|Vector| 52) (1317 . |vector|)
              (|Matrix| 52) (1322 . |generalInterpolation|) (|Vector| 50)
              (1330 . |vector|) (|FractionFreeFastGaussianFractions| 7 52 50)
              (1335 . |generalInterpolation|) (1343 . |column|)
              (1349 . |entries|) (1354 . |Zero|) (1358 . |zero?|)
              (1363 . |elt|) (1370 . |leadingCoefficient|) (1375 . |content|)
              (1380 . |gcd|) (1385 . |exquo|) (1391 . |setelt!|)
              (1399 . |explicitlyEmpty?|) (|Stream| 387) (1404 . |empty|)
              (1408 . |empty?|) (1413 . |frst|) (1418 . |Zero|) (1422 . |Zero|)
              (1426 . >=) (|Mapping| 89 66) (1432 . |every?|) (1438 . |rst|)
              (1443 . |concat|) (|Mapping| $) (1449 . |delay|)
              (|Mapping| 66 75) (|ListFunctions2| 75 66) (1454 . |map|)
              (|Stream| 322) (1460 . |genVectorStream|) (|Mapping| 85 322)
              (|StreamFunctions2| 322 85) (1467 . |map|) (1473 . |empty|)
              (1477 . |concat|) (|Vector| 6) (1483 . |vector|)
              (1488 . |checkExtraValues|) (|SingletonAsOrderedSet|)
              (1493 . |create|) (1497 . |coerce|) (1502 . |elt|)
              (1508 . |eval|) (1515 . |retract|) (1520 . |elt|) (1526 . |gcd|)
              (1532 . |exquo|) (1538 . *) (1544 . ~=) (1550 . *) (1556 . +)
              (1562 . ~=) (|Vector| 7) (1568 . |elt|) (1574 . |elt|)
              (1580 . |zero?|) (1585 . |zero?|) (1590 . |zero?|)
              (1595 . |zero?|) (1600 . |zero?|) (1605 . |zero?|)
              (|Mapping| 89 6) (1610 . |every?|) (1616 . *) (|List| 346)
              (|Vector| 346) (1622 . |vector|) (1627 . |generalCoefficient|)
              (1635 . |zero?|) (|OutputForm|) (1640 . |print|)
              (1645 . |coerce|) (1650 . |coerce|) (1655 . |hconcat|)
              (1661 . |ground?|) (1666 . |variableName|) (1671 . |numerator|)
              (1676 . |indexName|) (|Mapping| 8 6) (|StreamFunctions2| 6 8)
              (1681 . |map|) (|BasicOperator|) (|RecurrenceOperator| 66 8)
              (1687 . |makeFEq|) (1697 . |makeRec|) (1706 . |safety|)
              (1711 . |functionName|) (1716 . |operator|) (1721 . |elt|)
              (1727 . |rest|) (1733 . |empty?|) (1738 . |coerce|)
              (1743 . |hconcat|) (1748 . |output|) (1753 . |first|)
              (1759 . |complete|) (1764 . |entries|) (1769 . |coerce|)
              (1774 . |empty?|) (1779 . |first|) (1784 . |rst|)
              (1789 . |member?|) (1795 . |one|) (|GuessOption|)
              (1800 . |Somos|) (|List| 13) (1805 . |concat|)
              (1810 . |homogeneous|) (1815 . |maxPower|) (1820 . |concat|)
              (1826 . |checkOptions|) (1831 . |displayKind|)
              (1836 . |maxSubst|) |GUESS;guessAlgDep;LLL;98|
              |GUESS;guessAlgDep;LL;99| |GUESS;guessADE;LLL;100|
              |GUESS;guessADE;LL;101| (1841 . |maxDerivative|)
              |GUESS;guessAlg;LLL;102| |GUESS;guessAlg;LL;103|
              |GUESS;guessHolo;LLL;104| |GUESS;guessHolo;LL;105|
              (1846 . |allDegrees|) (1851 . |concat|) |GUESS;guessPade;LLL;106|
              |GUESS;guessPade;LL;107| |GUESS;guessFE;LLL;108|
              |GUESS;guessFE;LL;109| (1856 . |cons|) (1862 . |empty?|)
              (1867 . |append|) (1873 . |reverse!|) (1878 . |guessADE|)
              (1883 . |guessHolo|) |GUESS;guessRec;LLL;112|
              |GUESS;guessRec;LL;113| |GUESS;guessPRec;LLL;114|
              |GUESS;guessPRec;LL;115| (1888 . |maxShift|)
              |GUESS;guessRat;LLL;116| |GUESS;guessRat;LL;117|
              (1893 . |guessRec|) (1898 . |guessPRec|) (1903 . |true|)
              (1907 . |guessRat|) (1912 . |maxLevel|) (1917 . |coerce|)
              (1922 . <=) (1928 . |member?|) (1934 . |member?|) (1940 . |elt|)
              (1946 . /) (1952 . |one?|) (1957 . |one?|) (1962 . |one?|)
              (1967 . |one?|) (1972 . |one?|) (1977 . |one?|) (1982 . |one?|)
              (1987 . |one?|) (1992 . |one?|) (1997 . |coerce|) (|List| 461)
              (2002 . |subscript|) (2008 . |indexName|) (2013 . |maxLevel|)
              (|List| 21) |GUESS;guess;LLLLL;121| (|Segment| 8)
              (2018 . SEGMENT) (|SegmentBinding| 8) (2024 . |equation|)
              (|SegmentBinding| $) (2030 . |product|) (2036 . |init|)
              (2040 . |init|) (2044 . |init|) (|Fraction| 50) (2048 . |init|)
              (2052 . -) (2058 . =) (2064 . |summation|) |GUESS;guess;LL;122|
              |GUESS;guess;LLL;123| |GUESS;guess;LLLL;124|)
           '#(|substHP| 2070 |shiftHP| 2075 |guessRec| 2085 |guessRat| 2101
              |guessPade| 2117 |guessPRec| 2128 |guessHolo| 2144 |guessFE| 2160
              |guessExpRat| 2171 |guessBinRat| 2187 |guessAlgDep| 2203
              |guessAlg| 2214 |guessADE| 2225 |guess| 2241 |diffHP| 2267
              |algDepHP| 2277)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 576
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
                                                   0 143 0 7 0 144 0 8 0 145 0
                                                   50 0 146 0 118 0 147 0 132 0
                                                   148 0 8 0 149 0 50 0 150 0
                                                   118 0 151 0 132 0 152 3 153
                                                   107 0 66 107 154 2 75 89 0 0
                                                   155 2 109 107 107 66 156 2
                                                   132 0 0 0 157 0 158 0 159 0
                                                   129 0 160 3 161 132 0 66 132
                                                   162 2 66 89 0 0 163 2 100
                                                   164 0 0 165 2 166 66 100 0
                                                   167 2 66 89 0 0 168 1 169
                                                   166 0 170 1 100 85 0 171 1
                                                   100 0 85 172 1 173 99 0 174
                                                   2 173 99 0 99 175 2 169 166
                                                   0 166 176 2 66 0 0 0 177 1
                                                   85 66 0 178 2 180 85 179 99
                                                   181 2 85 66 96 0 182 1 173 0
                                                   99 183 1 169 0 166 184 1 114
                                                   75 0 185 0 75 0 186 1 114
                                                   107 0 187 1 153 0 114 188 1
                                                   161 0 137 189 2 192 190 191
                                                   65 193 1 85 89 0 194 2 66 0
                                                   0 0 195 2 75 0 0 0 196 3 199
                                                   197 75 198 65 200 3 8 0 0 22
                                                   75 201 2 118 0 0 75 202 2
                                                   132 0 0 75 203 3 204 7 75 75
                                                   52 205 3 206 129 75 75 132
                                                   207 1 204 31 75 208 1 56 75
                                                   13 209 1 56 22 13 210 2 65 0
                                                   0 75 211 1 65 0 0 212 1 65
                                                   99 0 213 2 65 85 0 66 214 2
                                                   11 8 0 66 227 1 56 27 13 228
                                                   2 75 89 0 0 229 2 66 89 0 0
                                                   230 1 22 0 41 231 2 22 89 0
                                                   0 232 2 233 12 0 66 234 2
                                                   199 197 235 65 236 3 8 0 0 0
                                                   0 238 2 118 0 0 73 239 2 132
                                                   0 0 73 240 1 6 0 22 242 2 66
                                                   0 75 0 243 2 118 0 244 0 245
                                                   0 129 0 246 1 129 0 6 247 2
                                                   132 0 248 0 249 1 66 89 0
                                                   250 2 22 89 0 0 251 1 0 252
                                                   22 253 1 8 0 66 254 1 66 0 0
                                                   255 2 8 0 0 0 256 2 8 0 0 0
                                                   257 1 118 0 0 258 2 260 259
                                                   259 75 261 1 132 0 0 262 2
                                                   264 263 263 75 265 2 266 66
                                                   66 66 267 3 204 7 75 75 52
                                                   268 3 206 129 75 75 132 269
                                                   1 204 31 75 270 2 118 0 6 75
                                                   271 2 118 0 0 0 272 1 158 0
                                                   0 273 2 118 0 0 158 274 2
                                                   197 75 0 66 275 2 132 0 129
                                                   75 276 2 132 0 0 0 277 2 132
                                                   0 0 158 278 2 8 0 75 0 280 2
                                                   8 0 0 0 281 1 7 0 22 282 4
                                                   204 7 7 75 75 52 283 4 206
                                                   129 129 75 75 132 284 2 204
                                                   31 7 75 285 2 118 0 6 0 286
                                                   2 118 0 0 0 287 2 289 139
                                                   139 288 290 1 107 75 0 291 2
                                                   107 0 75 66 292 0 293 0 294
                                                   2 66 0 0 75 295 2 66 0 0 0
                                                   296 3 107 66 0 66 66 297 2
                                                   158 0 66 66 298 1 158 66 0
                                                   299 1 114 0 0 300 1 107 0 0
                                                   301 2 107 66 0 66 302 2 114
                                                   0 107 0 303 1 114 0 0 304 2
                                                   305 0 153 0 306 2 75 0 0 0
                                                   307 1 293 0 0 308 1 305 0 0
                                                   309 1 153 0 310 311 0 293 0
                                                   312 2 314 197 197 313 315 1
                                                   316 73 0 317 2 73 89 0 0 318
                                                   2 132 0 129 0 319 2 132 0 0
                                                   0 320 2 137 0 0 0 321 2 322
                                                   0 75 0 323 1 137 0 0 324 2
                                                   326 190 190 325 327 1 0 252
                                                   22 328 1 50 89 0 329 1 50 6
                                                   0 330 1 50 75 0 331 1 50 0 0
                                                   332 1 333 0 12 334 1 118 0
                                                   333 335 1 337 0 336 338 2
                                                   339 0 75 75 340 2 129 0 6
                                                   339 341 2 342 337 248 71 343
                                                   2 337 0 0 0 344 1 132 0 337
                                                   345 2 348 346 347 50 349 2
                                                   118 350 0 75 351 1 350 50 0
                                                   352 2 355 353 354 122 356 1
                                                   6 89 0 357 1 56 89 13 358 1
                                                   56 60 13 359 2 75 89 0 0 360
                                                   1 56 361 13 362 6 365 364
                                                   364 233 22 22 75 216 366 1
                                                   56 89 13 367 1 368 116 41
                                                   369 7 365 370 233 85 22 22
                                                   75 216 364 371 2 322 75 0 66
                                                   372 3 322 75 0 66 75 373 2
                                                   118 0 0 0 374 2 132 0 0 0
                                                   375 2 7 0 0 0 376 2 50 0 0 0
                                                   377 2 6 0 0 0 378 2 322 75
                                                   379 0 380 2 139 0 0 75 381 1
                                                   139 0 0 382 1 139 122 0 383
                                                   1 385 0 384 386 4 204 387 31
                                                   221 385 322 388 1 389 0 353
                                                   390 4 391 387 31 221 389 322
                                                   392 2 387 385 0 66 393 1 385
                                                   384 0 394 0 52 0 395 1 7 89
                                                   0 396 3 387 52 0 66 66 397 1
                                                   52 7 0 398 1 52 7 0 399 1 7
                                                   0 310 400 2 52 164 0 7 401 4
                                                   387 52 0 66 66 52 402 1 65
                                                   89 0 403 0 404 0 405 1 65 89
                                                   0 406 1 65 85 0 407 0 66 0
                                                   408 0 346 0 409 2 66 89 0 0
                                                   410 2 85 89 411 0 412 1 65 0
                                                   0 413 2 404 0 387 0 414 1
                                                   404 0 415 416 2 418 85 417
                                                   322 419 3 204 420 75 75 75
                                                   421 2 423 65 422 420 424 0
                                                   65 0 425 2 65 0 85 0 426 1
                                                   427 0 12 428 1 56 89 13 429
                                                   0 430 0 431 1 7 0 66 432 2
                                                   385 52 0 66 433 3 52 0 0 430
                                                   7 434 1 52 7 0 435 2 427 6 0
                                                   66 436 2 7 0 0 0 437 2 7 164
                                                   0 0 438 2 7 0 0 0 439 2 7 89
                                                   0 0 440 2 34 0 7 0 441 2 34
                                                   0 0 0 442 2 34 89 0 0 443 2
                                                   444 7 0 66 445 2 384 52 0 66
                                                   446 1 52 89 0 447 1 8 89 0
                                                   448 1 118 89 0 449 1 132 89
                                                   0 450 1 75 89 0 451 1 387 89
                                                   0 452 2 12 89 453 0 454 2 75
                                                   0 73 0 455 1 457 0 456 458 4
                                                   206 129 222 161 75 457 459 1
                                                   129 89 0 460 1 461 116 0 462
                                                   1 41 461 0 463 1 66 461 0
                                                   464 2 461 0 0 0 465 1 129 89
                                                   0 466 1 56 22 13 467 1 8 0 0
                                                   468 1 56 22 13 469 2 471 190
                                                   470 333 472 6 474 8 473 22
                                                   22 8 11 190 475 5 474 8 473
                                                   22 8 11 190 476 1 56 75 13
                                                   477 1 56 22 13 478 1 473 0
                                                   22 479 2 8 0 473 0 480 2 197
                                                   0 0 75 481 1 197 89 0 482 1
                                                   75 461 0 483 1 461 0 310 484
                                                   1 368 116 461 485 2 190 0 0
                                                   75 486 1 190 0 0 487 1 190
                                                   11 0 488 1 11 461 0 489 1
                                                   404 89 0 490 1 404 387 0 491
                                                   1 404 0 0 492 2 11 89 8 0
                                                   493 1 56 89 13 494 1 495 0
                                                   58 496 1 497 0 310 498 1 495
                                                   0 58 499 1 495 0 55 500 2 13
                                                   0 0 0 501 1 56 116 13 502 1
                                                   495 0 22 503 1 495 0 55 504
                                                   1 495 0 60 509 1 495 0 89
                                                   514 1 13 0 310 515 2 13 0
                                                   495 0 520 1 11 89 0 521 2 11
                                                   0 0 0 522 1 11 0 0 523 1 0
                                                   21 22 524 1 0 21 22 525 1
                                                   495 0 60 530 1 0 21 22 533 1
                                                   0 21 22 534 0 89 0 535 1 0
                                                   21 22 536 1 56 60 13 537 1
                                                   60 461 0 538 2 73 89 0 0 539
                                                   2 27 89 22 0 540 2 12 89 6 0
                                                   541 2 12 6 0 66 542 2 6 0 0
                                                   0 543 1 8 89 0 544 1 118 89
                                                   0 545 1 66 89 0 546 1 132 89
                                                   0 547 1 75 89 0 548 1 7 89 0
                                                   549 1 50 89 0 550 1 52 89 0
                                                   551 1 6 89 0 552 1 73 461 0
                                                   553 2 22 0 0 554 555 1 495 0
                                                   22 556 1 495 0 60 557 2 560
                                                   0 8 8 561 2 562 0 22 560 563
                                                   2 8 0 0 564 565 0 50 0 566 0
                                                   346 0 567 0 52 0 568 0 569 0
                                                   570 2 6 0 0 0 571 2 6 89 0 0
                                                   572 2 8 0 0 564 573 1 0 225
                                                   13 241 1 1 252 22 328 1 0
                                                   225 13 279 1 1 21 22 533 2 0
                                                   11 12 13 526 1 0 11 12 527 1
                                                   1 21 22 536 2 0 11 12 13 531
                                                   1 0 11 12 532 2 0 11 12 13
                                                   516 1 0 11 12 517 1 1 21 22
                                                   534 1 0 11 12 529 2 0 11 12
                                                   13 528 1 1 21 22 525 1 0 11
                                                   12 513 2 0 11 12 13 512 2 0
                                                   11 12 13 518 1 0 11 12 519 1
                                                   1 21 22 24 2 0 11 12 13 17 1
                                                   0 11 12 16 1 1 21 22 26 1 0
                                                   11 12 19 2 0 11 12 13 20 1 0
                                                   11 233 506 2 0 11 233 13 505
                                                   1 0 11 12 511 2 0 11 12 13
                                                   510 1 1 21 22 524 2 0 11 12
                                                   13 507 1 0 11 12 508 2 0 11
                                                   12 13 575 1 0 11 12 574 4 0
                                                   11 12 558 27 13 559 3 0 11
                                                   12 558 27 576 1 1 252 22 253
                                                   1 0 225 13 226 2 0 225 233
                                                   13 237)))))
           '|lookupComplete|)) 
