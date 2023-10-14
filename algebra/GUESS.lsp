
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
                    "Guess: type parameter F should be either equal to S or equal                         to Fraction S")))
                 (EXIT
                  (LETT |lvar| (SPADCALL (ELT $ 37) |ll| (QREFELT $ 42))
                        . #1#))))
               (#2# (LETT |lvar| NIL . #1#)))
              (EXIT (SPADCALL (ELT $ 43) |lvar| (QREFELT $ 46)))))) 

(SDEFUN |GUESS;getVariables!0| ((|g| NIL) ($ NIL))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 35)) (QREFELT $ 28))
                  (SPADCALL (SPADCALL |g| (QREFELT $ 36)) (QREFELT $ 28))
                  (QREFELT $ 37))) 

(SDEFUN |GUESS;SUPS2SUPF|
        ((|p| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| F))
        (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SPADCALL (ELT $ 47) |p| (QREFELT $ 52)))
              ('T
               (|error|
                "Guess: type parameter F should be either equal to S or equal                   to Fraction S")))) 

(SDEFUN |GUESS;guess;LLLLL;9|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G300 NIL) (|guess| NIL)
          (|sumGuess| (|List| EXPRR)) (|summ| (EXPRR)) (|init| (EXPRR))
          (#2=#:G299 NIL) (|var| (|Symbol|)) (|sumList| (|List| F))
          (#3=#:G298 NIL) (|i| NIL) (#4=#:G297 NIL) (#5=#:G291 NIL)
          (#6=#:G296 NIL) (|prodGuess| (|List| EXPRR)) (|prod| (EXPRR))
          (#7=#:G295 NIL) (|prodList| (|List| F)) (#8=#:G294 NIL)
          (#9=#:G293 NIL)
          (|newMaxLevel| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#10=#:G251 NIL) (#11=#:G292 NIL) (|guesser| NIL)
          (|len| (|PositiveInteger|)) (#12=#:G247 NIL) (|xx| (EXPRR)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |newMaxLevel| (SPADCALL |options| (QREFELT $ 55))
                  . #13=(|GUESS;guess;LLLLL;9|))
            (LETT |xx|
                  (SPADCALL (SPADCALL |options| (QREFELT $ 56)) (QREFELT $ 43))
                  . #13#)
            (COND
             ((SPADCALL |options| (QREFELT $ 58))
              (COND
               ((QEQCAR |newMaxLevel| 0)
                (SPADCALL
                 (SPADCALL "Guess: guessing level "
                           (SPADCALL |newMaxLevel| (QREFELT $ 60))
                           (QREFELT $ 61))
                 (QREFELT $ 64))))))
            (LETT |res| NIL . #13#)
            (LETT |len|
                  (PROG1 (LETT #12# (LENGTH |list|) . #13#)
                    (|check_subtype| (> #12# 0) '(|PositiveInteger|) #12#))
                  . #13#)
            (COND
             ((SPADCALL |len| 1 (QREFELT $ 68))
              (PROGN (LETT #5# |res| . #13#) (GO #14=#:G290))))
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
                    ((SPADCALL |options| (QREFELT $ 69))
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
                              (|check_subtype| (>= #10# 0)
                                               '(|NonNegativeInteger|) #10#)))
                      . #13#)))))
            (COND
             ((SPADCALL '|guessProduct| |ops| (QREFELT $ 70))
              (COND
               ((SPADCALL (|spadConstant| $ 71) |list| (QREFELT $ 72))
                (SEQ (|spadConstant| $ 71)
                     (EXIT
                      (COND
                       ((SPADCALL |options| (QREFELT $ 58))
                        (SPADCALL
                         "Guess: cannot use guessProduct because of zeros"
                         (QREFELT $ 74)))))))
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
                                                 (QREFELT $ 76))
                                       (SPADCALL |list| |i| (QREFELT $ 76))
                                       (QREFELT $ 77))
                                      #9#)
                                     . #13#)))
                             (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
                       . #13#)
                 (EXIT
                  (COND
                   ((NULL (SPADCALL (ELT $ 79) |prodList| (QREFELT $ 81)))
                    (SEQ
                     (LETT |var|
                           (SPADCALL '|p|
                                     (LIST (SPADCALL |len| (QREFELT $ 82)))
                                     (QREFELT $ 84))
                           . #13#)
                     (LETT |prodGuess| NIL . #13#)
                     (SEQ (LETT |guess| NIL . #13#)
                          (LETT #7#
                                (SPADCALL |prodList| |guessers| |ops|
                                          (APPEND
                                           (LIST
                                            (SPADCALL |var| (QREFELT $ 86))
                                            (SPADCALL |newMaxLevel|
                                                      (QREFELT $ 87)))
                                           |options|)
                                          (QREFELT $ 89))
                                . #13#)
                          G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |guess| (CAR #7#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |init|
                                 (SPADCALL (SPADCALL |list| 1 (QREFELT $ 76))
                                           (QREFELT $ 10))
                                 . #13#)
                           (LETT |prod|
                                 (SPADCALL |guess|
                                           (SPADCALL |var|
                                                     (SPADCALL
                                                      (|spadConstant| $ 90)
                                                      (SPADCALL |xx|
                                                                (|spadConstant|
                                                                 $ 91)
                                                                (QREFELT $ 92))
                                                      (QREFELT $ 94))
                                                     (QREFELT $ 96))
                                           (QREFELT $ 98))
                                 . #13#)
                           (EXIT
                            (LETT |prodGuess|
                                  (CONS
                                   (SPADCALL |init| |prod| (QREFELT $ 102))
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
                                ((SPADCALL |guess| |res| (QREFELT $ 103)) 'NIL)
                                (#15# 'T))
                               (LETT |res| (CONS |guess| |res|) . #13#)))))
                           (LETT #6# (CDR #6#) . #13#) (GO G190) G191
                           (EXIT NIL))))))))))))
            (COND
             ((SPADCALL |options| (QREFELT $ 69))
              (COND
               ((NULL (NULL |res|))
                (PROGN (LETT #5# |res| . #13#) (GO #14#))))))
            (COND
             ((SPADCALL '|guessSum| |ops| (QREFELT $ 70))
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
                                     (SPADCALL |list| (+ |i| 1) (QREFELT $ 76))
                                     (SPADCALL |list| |i| (QREFELT $ 76))
                                     (QREFELT $ 104))
                                    #4#)
                                   . #13#)))
                           (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     . #13#)
               (EXIT
                (COND
                 ((NULL
                   (SPADCALL
                    (CONS #'|GUESS;guess;LLLLL;9!0| (VECTOR $ |sumList|))
                    |sumList| (QREFELT $ 81)))
                  (SEQ
                   (LETT |var|
                         (SPADCALL '|s| (LIST (SPADCALL |len| (QREFELT $ 82)))
                                   (QREFELT $ 84))
                         . #13#)
                   (LETT |sumGuess| NIL . #13#)
                   (SEQ (LETT |guess| NIL . #13#)
                        (LETT #2#
                              (SPADCALL |sumList| |guessers| |ops|
                                        (APPEND
                                         (LIST (SPADCALL |var| (QREFELT $ 86))
                                               (SPADCALL |newMaxLevel|
                                                         (QREFELT $ 87)))
                                         |options|)
                                        (QREFELT $ 89))
                              . #13#)
                        G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |guess| (CAR #2#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |init|
                               (SPADCALL (SPADCALL |list| 1 (QREFELT $ 76))
                                         (QREFELT $ 10))
                               . #13#)
                         (LETT |summ|
                               (SPADCALL |guess|
                                         (SPADCALL |var|
                                                   (SPADCALL
                                                    (|spadConstant| $ 90)
                                                    (SPADCALL |xx|
                                                              (|spadConstant| $
                                                                              91)
                                                              (QREFELT $ 92))
                                                    (QREFELT $ 94))
                                                   (QREFELT $ 96))
                                         (QREFELT $ 107))
                               . #13#)
                         (EXIT
                          (LETT |sumGuess|
                                (CONS (SPADCALL |init| |summ| (QREFELT $ 108))
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
                              ((SPADCALL |guess| |res| (QREFELT $ 103)) 'NIL)
                              (#15# 'T))
                             (LETT |res| (CONS |guess| |res|) . #13#)))))
                         (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                         (EXIT NIL))))))))))
            (EXIT |res|)))
          #14# (EXIT #5#)))) 

(SDEFUN |GUESS;guess;LLLLL;9!0| ((|z1| NIL) ($$ NIL))
        (PROG (|sumList| $)
          (LETT |sumList| (QREFELT $$ 1) . #1=(|GUESS;guess;LLLLL;9|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL |sumList| (|spadConstant| $ 105)
                                (QREFELT $ 76))
                      (QREFELT $ 106)))))) 

(SDEFUN |GUESS;guess;LL;10| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 109)) (LIST '|guessProduct| '|guessSum|)
                  NIL (QREFELT $ 89))) 

(SDEFUN |GUESS;guess;LLL;11|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 109)) (LIST '|guessProduct| '|guessSum|)
                  |options| (QREFELT $ 89))) 

(SDEFUN |GUESS;guess;LLLL;12|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) ($ |List| EXPRR))
        (SPADCALL |list| |guessers| |ops| NIL (QREFELT $ 89))) 

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
          (LETT |maxP| (SPADCALL |options| (QREFELT $ 114))
                . #1=(|GUESS;FilteredPartitionStream|))
          (LETT |homo| (SPADCALL |options| (QREFELT $ 116)) . #1#)
          (COND
           ((QEQCAR |homo| 1)
            (COND
             ((QCDR |homo|)
              (EXIT
               (|error|
                "Guess: internal error - homogeneous should not be true in FilteredPartitionStream")))))
           (#2='T (LETT |maxP| (CONS 0 (QCDR |homo|)) . #1#)))
          (LETT |maxD| (SPADCALL |options| (QREFELT $ 117)) . #1#)
          (LETT |Somo| (SPADCALL |options| (QREFELT $ 118)) . #1#)
          (COND
           ((QEQCAR |Somo| 1)
            (COND
             ((QCDR |Somo|)
              (EXIT
               (|error|
                "Guess: internal error - Somos should not be true in FilteredPartitionStream")))))
           ((QEQCAR |maxD| 0)
            (LETT |maxD| (CONS 0 (MIN (QCDR |maxD|) (QCDR |Somo|))) . #1#))
           (#2# (LETT |maxD| (CONS 0 (QCDR |Somo|)) . #1#)))
          (COND
           ((QEQCAR |maxD| 0)
            (COND
             ((QEQCAR |maxP| 0)
              (LETT |s|
                    (SPADCALL (+ (QCDR |maxD|) 1) (QCDR |maxP|)
                              (QREFELT $ 121))
                    . #1#))
             (#2#
              (SEQ (LETT |s1| (SPADCALL (ELT $ 122) 1 (QREFELT $ 125)) . #1#)
                   (LETT |s2|
                         (COND
                          ((QEQCAR |maxD| 0)
                           (SPADCALL
                            (CONS #'|GUESS;FilteredPartitionStream!0|
                                  (VECTOR $ |maxD|))
                            |s1| (QREFELT $ 132)))
                          ((QEQCAR |maxP| 0)
                           (SPADCALL
                            (CONS #'|GUESS;FilteredPartitionStream!1|
                                  (VECTOR $ |maxP|))
                            |s1| (QREFELT $ 132)))
                          (#2# (SPADCALL (ELT $ 133) |s1| (QREFELT $ 132))))
                         . #1#)
                   (LETT |s3| (SPADCALL |s2| (QREFELT $ 135)) . #1#)
                   (EXIT
                    (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 137)) . #1#))))))
           (#2#
            (SEQ (LETT |s1| (SPADCALL (ELT $ 122) 1 (QREFELT $ 125)) . #1#)
                 (LETT |s2|
                       (COND
                        ((QEQCAR |maxD| 0)
                         (SPADCALL
                          (CONS #'|GUESS;FilteredPartitionStream!2|
                                (VECTOR $ |maxD|))
                          |s1| (QREFELT $ 132)))
                        ((QEQCAR |maxP| 0)
                         (SPADCALL
                          (CONS #'|GUESS;FilteredPartitionStream!3|
                                (VECTOR $ |maxP|))
                          |s1| (QREFELT $ 132)))
                        (#2# (SPADCALL (ELT $ 133) |s1| (QREFELT $ 132))))
                       . #1#)
                 (LETT |s3| (SPADCALL |s2| (QREFELT $ 135)) . #1#)
                 (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 137)) . #1#)))))
          (LETT |s| (SPADCALL |s| (QREFELT $ 138)) . #1#)
          (COND
           ((QEQCAR |homo| 0)
            (LETT |s|
                  (SPADCALL
                   (CONS #'|GUESS;FilteredPartitionStream!4| (VECTOR |maxP| $))
                   |s| (QREFELT $ 142))
                  . #1#)))
          (COND
           ((QEQCAR |Somo| 0)
            (LETT |s|
                  (SPADCALL
                   (CONS #'|GUESS;FilteredPartitionStream!5| (VECTOR |Somo| $))
                   |s| (QREFELT $ 142))
                  . #1#)))
          (EXIT |s|)))) 

(SDEFUN |GUESS;FilteredPartitionStream!5| ((|z1| NIL) ($$ NIL))
        (PROG ($ |Somo|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT |Somo| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (ELT $ 143) |z1| (|spadConstant| $ 144) (QREFELT $ 146))
             (SPADCALL (QCDR |Somo|) (SPADCALL |z1| (QREFELT $ 139))
                       (QREFELT $ 127))
             (QREFELT $ 147)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!4| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxP|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT |maxP| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G309 NIL))
                   (SPADCALL (SPADCALL |z1| (QREFELT $ 139))
                             (PROG2 (LETT #2# |maxP| NIL)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 0)
                                              (|PositiveInteger|) #2#))
                             (QREFELT $ 140))))))) 

(SDEFUN |GUESS;FilteredPartitionStream!3| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 128)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!2| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| $ 105) (QREFELT $ 127))
             |z1| |z1| (QREFELT $ 128)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!1| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 128)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| $ 105) (QREFELT $ 127))
             |z1| |z1| (QREFELT $ 128)))))) 

(SDEFUN |GUESS;termAsEXPRR|
        ((|f| EXPRR) (|xx| |Symbol|) (|partition| |List| (|Integer|))
         (DX |Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|))
         (D1X |Mapping| EXPRR (|Symbol|)) ($ EXPRR))
        (SPROG
         ((|fl| (|List| EXPRR)) (#1=#:G347 NIL) (#2=#:G346 NIL) (#3=#:G355 NIL)
          (|part| NIL) (#4=#:G354 NIL) (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) (SPADCALL |xx| D1X))
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 150))
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
                                                    (|check_subtype| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #2#))
                                                  DX)
                                        (PROG1
                                            (LETT #1#
                                                  (SPADCALL |part|
                                                            (QREFELT $ 151))
                                                  . #5#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 152))
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (EXIT (SPADCALL (ELT $ 102) |fl| (QREFELT $ 154))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|degreeLoss| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|fl| (|List| (|U32Vector|))) (#1=#:G359 NIL) (#2=#:G358 NIL)
          (#3=#:G368 NIL) (|part| NIL) (#4=#:G367 NIL)
          (|ll| (|List| (|List| (|Integer|)))) (|d| (|NonNegativeInteger|))
          (#5=#:G357 NIL) (#6=#:G366 NIL) (|i| NIL) (#7=#:G365 NIL))
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
             (QREFELT $ 156)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1
                       (LETT #5# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1) . #8#)
                     (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                   . #8#)
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 150)) . #8#)
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
                                               (|check_subtype| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                #2#))
                                             |prime| (QREFELT $ 158))
                                   (PROG1
                                       (LETT #1#
                                             (SPADCALL |part| (QREFELT $ 151))
                                             . #8#)
                                     (|check_subtype| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      #1#))
                                   |d| |prime| (QREFELT $ 159))
                                  #4#)
                                 . #8#)))
                         (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   . #8#)
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 163))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2) . #1=(|GUESS;termAsU32VectorDiff|))
          (LETT |prime| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 160)))))) 

(SDEFUN |GUESS;termAsU32VectorShift|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|degreeLoss| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G385 NIL) (|e| NIL) (|i| NIL) (|r| (|U32Vector|))
          (|fl| (|List| (|U32Vector|))) (#2=#:G371 NIL) (#3=#:G384 NIL)
          (|j| NIL) (#4=#:G383 NIL) (#5=#:G382 NIL) (|part| NIL)
          (#6=#:G381 NIL) (|ll| (|List| (|List| (|Integer|))))
          (|d| (|NonNegativeInteger|)) (#7=#:G370 NIL) (#8=#:G380 NIL)
          (#9=#:G379 NIL))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (PROGN
              (LETT #9# NIL . #10=(|GUESS;termAsU32VectorShift|))
              (SEQ (LETT |i| (+ |degreeLoss| 1) . #10#)
                   (LETT #8# (QV_LEN_U32 |f|) . #10#) G190
                   (COND ((> |i| #8#) (GO G191)))
                   (SEQ (EXIT (LETT #9# (CONS 1 #9#) . #10#)))
                   (LETT |i| (+ |i| 1) . #10#) (GO G190) G191
                   (EXIT (NREVERSE #9#))))
             (QREFELT $ 156)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1
                       (LETT #7# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1)
                             . #10#)
                     (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|) #7#))
                   . #10#)
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 150)) . #10#)
             (LETT |fl|
                   (PROGN
                    (LETT #6# NIL . #10#)
                    (SEQ (LETT |part| NIL . #10#) (LETT #5# |ll| . #10#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |part| (CAR #5#) . #10#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS
                                  (SPADCALL
                                   (PROGN
                                    (LETT #4# NIL . #10#)
                                    (SEQ
                                     (LETT |j| (- (|SPADfirst| |part|) 1)
                                           . #10#)
                                     (LETT #3#
                                           (+ (- (|SPADfirst| |part|) 1) |d|)
                                           . #10#)
                                     G190 (COND ((> |j| #3#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #4#
                                             (CONS
                                              (REM
                                               (EXPT (ELT_U32 |f| |j|)
                                                     (PROG1
                                                         (LETT #2#
                                                               (SPADCALL |part|
                                                                         (QREFELT
                                                                          $
                                                                          151))
                                                               . #10#)
                                                       (|check_subtype|
                                                        (> #2# 0)
                                                        '(|PositiveInteger|)
                                                        #2#)))
                                               |prime|)
                                              #4#)
                                             . #10#)))
                                     (LETT |j| (+ |j| 1) . #10#) (GO G190) G191
                                     (EXIT (NREVERSE #4#))))
                                   (QREFELT $ 156))
                                  #6#)
                                 . #10#)))
                         (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   . #10#)
             (LETT |r| (GETREFV_U32 (+ |d| 1) 0) . #10#)
             (SPADCALL |r| (|SPADfirst| |fl|) (+ |d| 1) (QREFELT $ 164))
             (SEQ (LETT |i| 0 . #10#) G190
                  (COND ((|greater_SI| |i| |d|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |e| NIL . #10#) (LETT #1# (CDR |fl|) . #10#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |e| (CAR #1#) . #10#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT_U32 |r| |i|
                                       (QSMULMOD32 (ELT_U32 |r| |i|)
                                                   (ELT_U32 |e| |i|)
                                                   |prime|))))
                         (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
             (EXIT |r|))))))) 

(SDEFUN |GUESS;termAsUFPSF|
        ((|f| |UnivariateFormalPowerSeries| F) (|partition| |List| (|Integer|))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG
         ((|fl| (|List| (|UnivariateFormalPowerSeries| F))) (#1=#:G394 NIL)
          (#2=#:G393 NIL) (#3=#:G402 NIL) (|part| NIL) (#4=#:G401 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 150))
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
                                                    (|check_subtype| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #2#))
                                                  DS)
                                        (PROG1
                                            (LETT #1#
                                                  (SPADCALL |part|
                                                            (QREFELT $ 151))
                                                  . #5#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 166))
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (EXIT (SPADCALL (ELT $ 167) |fl| (QREFELT $ 170))))))))) 

(SDEFUN |GUESS;termAsUFPSF2|
        ((|f| |UnivariateFormalPowerSeries| F) (|partition| |List| (|Integer|))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG
         ((|fl| (|List| (|UnivariateFormalPowerSeries| F))) (#1=#:G406 NIL)
          (#2=#:G414 NIL) (|part| NIL) (#3=#:G413 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 150))
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
                                                    (|check_subtype| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #1#))
                                                  DS)
                                        (QREFELT $ 173))
                                       #3#)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT (SPADCALL (ELT $ 175) |fl| (QREFELT $ 170))))))))) 

(SDEFUN |GUESS;termAsUFPSF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1) . #1=(|GUESS;termAsUFPSF2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G404 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #2# (SPADCALL |part| (QREFELT $ 151))
                                       NIL)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 171))))))) 

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
          (#1=#:G417 NIL) (#2=#:G425 NIL) (|part| NIL) (#3=#:G424 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1F)
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 150))
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
                                                    (|check_subtype| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #1#))
                                                  DSF)
                                        (QREFELT $ 180))
                                       #3#)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT (SPADCALL (ELT $ 182) |fl| (QREFELT $ 185))))))))) 

(SDEFUN |GUESS;termAsUFPSSUPF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1) . #1=(|GUESS;termAsUFPSSUPF2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G415 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #2# (SPADCALL |part| (QREFELT $ 151))
                                       NIL)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 177))))))) 

(SDEFUN |GUESS;ADEguessStream|
        ((|f| |UnivariateFormalPowerSeries| F)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |Stream| (|UnivariateFormalPowerSeries| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;ADEguessStream!0| (VECTOR $ D1 DS |f|))
                         |partitions| (QREFELT $ 189)))) 

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
                |partitions| (QREFELT $ 189)))) 

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
         ((|i| NIL) (#1=#:G447 NIL) (|r| NIL) (|res| (|Vector| (|U32Vector|)))
          (#2=#:G445 NIL) (#3=#:G446 NIL) (|res1| (|U32Vector|))
          (#4=#:G436 NIL) (|nt| (|NonNegativeInteger|)) (#5=#:G443 NIL)
          (#6=#:G444 NIL) (|pp| NIL))
         (SEQ
          (SEQ (LETT |pp| NIL . #7=(|GUESS;guessModGenCached|))
               (LETT #6# |prodl| . #7#) (LETT |i| (+ |maxD| 1) . #7#)
               (LETT #5# (+ |maxD| |np|) . #7#) G190
               (COND
                ((OR (> |i| #5#) (ATOM #6#)
                     (PROGN (LETT |pp| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |cache| |i|
                            (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                      (QAREF1 |cache|
                                              (SPADCALL |pp| (QREFELT $ 151)))
                                      (- |sigma| 1) |prime| (QREFELT $ 160)))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#) . #7#)) . #7#)
               (GO G190) G191 (EXIT NIL))
          (LETT |nt| (LENGTH |terml|) . #7#)
          (COND
           (|addOne|
            (SEQ (LETT |res| (MAKEARR1 (+ |nt| 1) (GETREFV_U32 0 0)) . #7#)
                 (LETT |res1|
                       (GETREFV_U32
                        (PROG1 (LETT #4# |sigma| . #7#)
                          (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|)
                                           #4#))
                        0)
                       . #7#)
                 (SETELT_U32 |res1| 0 1)
                 (SPADCALL |res| 1 |res1| (QREFELT $ 198))
                 (EXIT
                  (SEQ (LETT |r| NIL . #7#) (LETT #3# |terml| . #7#)
                       (LETT |i| 2 . #7#) (LETT #2# (+ |nt| 1) . #7#) G190
                       (COND
                        ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                             (PROGN (LETT |r| (CAR #3#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 198))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #7#))
                             . #7#)
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (SEQ (LETT |res| (MAKEARR1 |nt| (GETREFV_U32 0 0)) . #7#)
                 (EXIT
                  (SEQ (LETT |r| NIL . #7#) (LETT #1# |terml| . #7#)
                       (LETT |i| 1 . #7#) G190
                       (COND
                        ((OR (|greater_SI| |i| |nt|) (ATOM #1#)
                             (PROGN (LETT |r| (CAR #1#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 198))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #7#))
                             . #7#)
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT |res|)))) 

(SDEFUN |GUESS;DEPguessModGenCached|
        ((|fl| |List| (|U32Vector|)) (|addOne| |Boolean|)
         (|maxD| |NonNegativeInteger|) (|prodl| |List| (|List| (|Integer|)))
         (|terml| |List| (|Integer|)) (|prime| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((|i| NIL) (#1=#:G452 NIL) (|f| (|U32Vector|))
          (|cache| (|PrimitiveArray| (|U32Vector|)))
          (|np| (|NonNegativeInteger|)) (|sigma| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((< (LENGTH |fl|) (+ |maxD| 1))
            (|error| "DEPguessModGenCached: #fl < maxD + 1"))
           ('T
            (SEQ
             (LETT |f| (|SPADfirst| |fl|) . #2=(|GUESS;DEPguessModGenCached|))
             (LETT |sigma| (QV_LEN_U32 |f|) . #2#)
             (LETT |np| (LENGTH |prodl|) . #2#)
             (LETT |cache| (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0))
                   . #2#)
             (SEQ (LETT |f| NIL . #2#) (LETT #1# |fl| . #2#) (LETT |i| 0 . #2#)
                  G190
                  (COND
                   ((OR (|greater_SI| |i| |maxD|) (ATOM #1#)
                        (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (QSETAREF1 |cache| |i| |f|)))
                  (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #2#))
                        . #2#)
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
         ((|i| NIL) (|cache| (|PrimitiveArray| (|U32Vector|)))
          (|np| (|NonNegativeInteger|)) (|sigma| (|Integer|))
          (|f| (|U32Vector|)))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 199))
            (|error| "ADEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ
             (LETT |f| (|SPADfirst| |fl|) . #1=(|GUESS;ADEguessModGenCached|))
             (LETT |sigma| (- (QV_LEN_U32 |f|) |maxD|) . #1#)
             (LETT |np| (LENGTH |prodl|) . #1#)
             (LETT |cache| (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0))
                   . #1#)
             (QSETAREF1 |cache| 0 |f|)
             (SEQ (LETT |i| 1 . #1#) G190
                  (COND ((|greater_SI| |i| |maxD|) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF1 |cache| |i|
                               (SPADCALL (QAREF1 |cache| (- |i| 1)) |prime|
                                         (QREFELT $ 200)))))
                  (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
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
         ((|i| NIL) (#1=#:G469 NIL) (|r| NIL)
          (|res|
           (|Vector|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#2=#:G467 NIL) (#3=#:G468 NIL) (|nt| (|NonNegativeInteger|))
          (#4=#:G465 NIL) (#5=#:G466 NIL) (|pp| NIL)
          (|cache|
           (|PrimitiveArray|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|np| (|NonNegativeInteger|)))
         (SEQ (LETT |np| (LENGTH |prodl|) . #6=(|GUESS;ADEtestGenCached|))
              (LETT |cache|
                    (MAKEARR1 (+ (+ |maxD| 1) |np|) (|spadConstant| $ 193))
                    . #6#)
              (QSETAREF1 |cache| 0 |f|)
              (SEQ (LETT |i| 1 . #6#) G190
                   (COND ((|greater_SI| |i| |maxD|) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| 0) |i| DSF))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |pp| NIL . #6#) (LETT #5# |prodl| . #6#)
                   (LETT |i| (+ |maxD| 1) . #6#)
                   (LETT #4# (+ |maxD| |np|) . #6#) G190
                   (COND
                    ((OR (> |i| #4#) (ATOM #5#)
                         (PROGN (LETT |pp| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                          (QAREF1 |cache|
                                                  (SPADCALL |pp|
                                                            (QREFELT $ 151)))
                                          (QREFELT $ 201)))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |nt| (LENGTH |terml|) . #6#)
              (COND
               (|addOne|
                (SEQ
                 (LETT |res| (MAKEARR1 (+ |nt| 1) (|spadConstant| $ 193))
                       . #6#)
                 (SPADCALL |res| 1 D1F (QREFELT $ 206))
                 (EXIT
                  (SEQ (LETT |r| NIL . #6#) (LETT #3# |terml| . #6#)
                       (LETT |i| 2 . #6#) (LETT #2# (+ |nt| 1) . #6#) G190
                       (COND
                        ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                             (PROGN (LETT |r| (CAR #3#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 206))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL)))))
               ('T
                (SEQ (LETT |res| (MAKEARR1 |nt| (|spadConstant| $ 193)) . #6#)
                     (EXIT
                      (SEQ (LETT |r| NIL . #6#) (LETT #1# |terml| . #6#)
                           (LETT |i| 1 . #6#) G190
                           (COND
                            ((OR (|greater_SI| |i| |nt|) (ATOM #1#)
                                 (PROGN (LETT |r| (CAR #1#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                       (QREFELT $ 206))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #1# (CDR #1#) . #6#))
                                 . #6#)
                           (GO G190) G191 (EXIT NIL))))))
              (EXIT |res|)))) 

(SDEFUN |GUESS;multiplyExponents|
        ((|f| |U32Vector|) (|n| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|i| NIL) (|deg| (|Integer|)) (|f0| (|U32Vector|))
          (|nn| (|NonNegativeInteger|)))
         (SEQ (LETT |nn| (QV_LEN_U32 |f|) . #1=(|GUESS;multiplyExponents|))
              (LETT |f0| (GETREFV_U32 |nn| 0) . #1#)
              (LETT |deg| (- |nn| 1) . #1#)
              (SEQ (LETT |i| 0 . #1#) G190
                   (COND
                    ((OR (|greater_SI| |i| |deg|)
                         (NULL (SPADCALL (* |n| |i|) |deg| (QREFELT $ 207))))
                     (GO G191)))
                   (SEQ (EXIT (SETELT_U32 |f0| (* |n| |i|) (ELT_U32 |f| |i|))))
                   (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
              (EXIT |f0|)))) 

(SDEFUN |GUESS;FEguessModGenCached|
        ((|fl| |List| (|U32Vector|)) (|addOne| |Boolean|)
         (|maxD| |NonNegativeInteger|) (|prodl| |List| (|List| (|Integer|)))
         (|terml| |List| (|Integer|)) (|prime| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((|i| NIL) (|cache| (|PrimitiveArray| (|U32Vector|)))
          (|np| (|NonNegativeInteger|)) (|sigma| (|NonNegativeInteger|))
          (|f| (|U32Vector|)))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 199))
            (|error| "FEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ
             (LETT |f| (|SPADfirst| |fl|) . #1=(|GUESS;FEguessModGenCached|))
             (LETT |sigma| (QV_LEN_U32 |f|) . #1#)
             (LETT |np| (LENGTH |prodl|) . #1#)
             (LETT |cache| (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0))
                   . #1#)
             (QSETAREF1 |cache| 0 |f|)
             (SEQ (LETT |i| 1 . #1#) G190
                  (COND ((|greater_SI| |i| |maxD|) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF1 |cache| |i|
                               (|GUESS;multiplyExponents| (QAREF1 |cache| 0)
                                (+ |i| 1) $))))
                  (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne| |maxD|
               |prodl| |terml| |prime| $)))))))) 

(SDEFUN |GUESS;optimiseFactor|
        ((|partition| |Partition|) (|partitions| |List| (|Partition|))
         ($ |Union| (|List| (|Integer|)) "failed"))
        (SPROG
         ((#1=#:G494 NIL) (|j| (|Integer|))
          (|r| (|Union| (|Partition|) "failed")) (#2=#:G495 NIL) (|p| NIL)
          (|i| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |partitions|) . #3=(|GUESS;optimiseFactor|))
                (SEQ (LETT |i| 1 . #3#) (LETT |p| NIL . #3#)
                     (LETT #2# |partitions| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL)
                           (|greater_SI| |i| |n|))
                       (GO G191)))
                     (SEQ
                      (LETT |r| (SPADCALL |partition| |p| (QREFELT $ 209))
                            . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |r| 0)
                         (SEQ
                          (LETT |j|
                                (SPADCALL (QCDR |r|) |partitions|
                                          (QREFELT $ 211))
                                . #3#)
                          (EXIT
                           (COND
                            ((SPADCALL |j| 0 (QREFELT $ 212))
                             (PROGN
                              (LETT #1# (CONS 0 (LIST |i| |j|)) . #3#)
                              (GO #4=#:G493))))))))))
                     (LETT #2#
                           (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #3#))
                           . #3#)
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
                  (SPADCALL |parts0| (QREFELT $ 214)) $)
                 . #1=(|GUESS;optimiseProducts1|))
           (EXIT
            (COND
             ((QEQCAR |r| 1)
              (SEQ
               (|GUESS;optimiseProducts1|
                (SPADCALL (CDR (SPADCALL |p| (QREFELT $ 215))) (QREFELT $ 216))
                |prods0| |parts0| $)
               (EXIT
                (LETT |r|
                      (|GUESS;optimiseFactor| |p|
                       (SPADCALL |parts0| (QREFELT $ 214)) $)
                      . #1#)))))))
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (|error| "Internal error: failed adding intermediate partition"))
            ('T
             (SEQ
              (LETT |lp0| (LENGTH (SPADCALL |parts0| (QREFELT $ 214))) . #1#)
              (SPADCALL |prods0|
                        (CONS
                         (LIST (- |lp0| (|SPADfirst| (QCDR |r|)))
                               (- |lp0| (SPADCALL (QCDR |r|) (QREFELT $ 151))))
                         (SPADCALL |prods0| (QREFELT $ 218)))
                        (QREFELT $ 219))
              (EXIT
               (SPADCALL |parts0|
                         (CONS |p| (SPADCALL |parts0| (QREFELT $ 214)))
                         (QREFELT $ 220)))))))))) 

(SDEFUN |GUESS;optimiseProducts|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Record| (|:| |addOne| (|Boolean|))
          (|:| |maxDiff| (|NonNegativeInteger|))
          (|:| |prods| (|List| (|List| (|Integer|))))
          (|:| |terms| (|List| (|Integer|)))))
        (SPROG
         ((#1=#:G511 NIL) (|terms0| (|List| (|Integer|))) (#2=#:G516 NIL)
          (|p| NIL) (|parts0| (|Reference| (|List| (|Partition|)))) (|i| NIL)
          (#3=#:G515 NIL)
          (|prods0| (|Reference| (|List| (|List| (|Integer|)))))
          (|maxD0| (|Integer|)) (#4=#:G514 NIL) (|addOne0| (|Boolean|)))
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
                       (GO #6=#:G513))))))))
            (LETT |maxD0|
                  (SPADCALL (ELT $ 221)
                            (SPADCALL (ELT $ 222) |partitions| (QREFELT $ 225))
                            (QREFELT $ 226))
                  . #5#)
            (LETT |prods0| (SPADCALL NIL (QREFELT $ 227)) . #5#)
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
                                 (CONS (SPADCALL (LIST |i|) (QREFELT $ 216))
                                       #3#)
                                 . #5#)))
                         (LETT |i| (+ |i| -1) . #5#) (GO G190) G191
                         (EXIT (NREVERSE #3#))))
                   (QREFELT $ 228))
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
                      (|GUESS;optimiseProducts1| (SPADCALL |p| (QREFELT $ 216))
                       |prods0| |parts0| $)
                      (EXIT
                       (LETT |terms0|
                             (CONS
                              (- (LENGTH (SPADCALL |parts0| (QREFELT $ 214)))
                                 1)
                              |terms0|)
                             . #5#)))))))
                 (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (VECTOR |addOne0|
                     (PROG1 (LETT #1# (- |maxD0| 1) . #5#)
                       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                        #1#))
                     (NREVERSE (SPADCALL |prods0| (QREFELT $ 218)))
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
            (SPROG ((#2=#:G540 NIL) (|p| NIL) (#3=#:G539 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 229))
                                (|spadConstant| $ 230) (QREFELT $ 199))
                      (|error| "ADEguessModGen2, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 231)) NIL)
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
                             (QREFELT $ 232)))))))))))) 

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
            (SPROG ((#2=#:G553 NIL) (|p| NIL) (#3=#:G552 NIL))
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
                     (QREFELT $ 233)))))))) 

(SDEFUN |GUESS;ADEEXPRRStream|
        ((|f| EXPRR) (|xx| |Symbol|)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DX |Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|))
         (D1X |Mapping| EXPRR (|Symbol|)) ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GUESS;ADEEXPRRStream!0| (VECTOR $ D1X DX |xx| |f|))
                |partitions| (QREFELT $ 237)))) 

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
                  (QREFELT $ 244))) 

(SDEFUN |GUESS;ADEdegreeStream!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPROG ((#1=#:G561 NIL))
               (SPADCALL
                (COND ((SPADCALL |z1| (QREFELT $ 238)) (|spadConstant| $ 144))
                      ('T
                       (PROG1
                           (LETT #1#
                                 (SPADCALL (SPADCALL |z1| (QREFELT $ 222))
                                           (|spadConstant| $ 230)
                                           (QREFELT $ 239))
                                 NIL)
                         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                          #1#))))
                |z2| (QREFELT $ 240)))) 

(SDEFUN |GUESS;diffDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| |x| |n| (QREFELT $ 245))) 

(SDEFUN |GUESS;diffDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| |n| (QREFELT $ 246))) 

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
          (SPADCALL |s| |n| (QREFELT $ 247))))) 

(SDEFUN |GUESS;diffAX|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 43)) |l| (QREFELT $ 152))
                  |f| (QREFELT $ 102))) 

(SDEFUN |GUESS;diffA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 249))) 

(SDEFUN |GUESS;diffAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 251))) 

(SDEFUN |GUESS;diffC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 252))) 

(SDEFUN |GUESS;diff1X| ((|x| |Symbol|) ($ EXPRR)) (|spadConstant| $ 91)) 

(SDEFUN |GUESS;diffHP;LR;47|
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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 253))))
            (|error|
             "Guess: no support for mixed shifts in differential equations")))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 254))
                . #1=(|GUESS;diffHP;LR;47|))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                    . #1#)
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
              (EXIT
               (VECTOR |degrees|
                       (CONS #'|GUESS;diffHP;LR;47!0| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;47!1| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;47!2| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;47!3| (VECTOR $ |partitions|))
                       '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                       (CONS (|function| |GUESS;diffAF|) $)
                       (CONS (|function| |GUESS;diffAX|) $)
                       (CONS (|function| |GUESS;diffC|) $)))))
            ('T (|error| "Guess: guessADE supports only displayAsGF"))))))) 

(SDEFUN |GUESS;diffHP;LR;47!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;47|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;diffDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;diffHP;LR;47!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;47|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G588 NIL) (|i| NIL) (#3=#:G587 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 258))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;diffDSF|) $)
                     (|spadConstant| $ 196) $))))))) 

(SDEFUN |GUESS;diffHP;LR;47!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;47|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 255))
                        (QREFELT $ 256))
              (QREFELT $ 257))
             $))))) 

(SDEFUN |GUESS;diffHP;LR;47!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;47|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;diffDS|) $) (|spadConstant| $ 195) $))))) 

(SDEFUN |GUESS;monomialAsEXPRR|
        ((|fl0| |List| EXPRR) (|partition| |List| (|Integer|)) ($ EXPRR))
        (SPROG
         ((|fl| (|List| EXPRR)) (#1=#:G624 NIL) (#2=#:G623 NIL) (#3=#:G632 NIL)
          (|part| NIL) (#4=#:G631 NIL) (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) (|spadConstant| $ 91))
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 150))
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
                                                    (|check_subtype| (> #2# 0)
                                                                     '(|PositiveInteger|)
                                                                     #2#))
                                                  (QREFELT $ 271))
                                        (PROG1
                                            (LETT #1#
                                                  (SPADCALL |part|
                                                            (QREFELT $ 151))
                                                  . #5#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 152))
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (EXIT (SPADCALL (ELT $ 102) |fl| (QREFELT $ 154))))))))) 

(SDEFUN |GUESS;DEPEXPRRStream|
        ((|fl| |List| EXPRR) (|partitions| |Stream| (|List| (|Integer|)))
         ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;DEPEXPRRStream!0| (VECTOR $ |fl|))
                         |partitions| (QREFELT $ 237)))) 

(SDEFUN |GUESS;DEPEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|fl| $)
          (LETT |fl| (QREFELT $$ 1) . #1=(|GUESS;DEPEXPRRStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;monomialAsEXPRR| |fl| |z1| $))))) 

(SDEFUN |GUESS;get_fnames|
        ((|n| |Integer|) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((#1=#:G646 NIL) (|sym| NIL) (#2=#:G645 NIL)
          (|syms| (|List| (|Symbol|))) (#3=#:G644 NIL) (|i| NIL)
          (#4=#:G643 NIL) (|snums| (|List| (|String|))) (|q| NIL)
          (#5=#:G642 NIL) (|n1| (|NonNegativeInteger|)))
         (SEQ
          (LETT |syms| (SPADCALL |options| (QREFELT $ 272))
                . #6=(|GUESS;get_fnames|))
          (LETT |n1| (LENGTH |syms|) . #6#)
          (COND
           ((SPADCALL |n1| 0 (QREFELT $ 273))
            (COND
             ((SPADCALL |n1| |n| (QREFELT $ 274))
              (EXIT
               (|error| "numbers of sequences and names are different"))))))
          (COND
           ((EQL |n1| 0)
            (SEQ
             (LETT |snums|
                   (PROGN
                    (LETT #5# NIL . #6#)
                    (SEQ (LETT |q| 1 . #6#) G190
                         (COND ((|greater_SI| |q| |n|) (GO G191)))
                         (SEQ
                          (EXIT (LETT #5# (CONS (STRINGIMAGE |q|) #5#) . #6#)))
                         (LETT |q| (|inc_SI| |q|) . #6#) (GO G190) G191
                         (EXIT (NREVERSE #5#))))
                   . #6#)
             (EXIT
              (LETT |syms|
                    (PROGN
                     (LETT #4# NIL . #6#)
                     (SEQ (LETT |i| NIL . #6#) (LETT #3# |snums| . #6#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |i| (CAR #3#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL (STRCONC "%" (STRCONC "f" |i|))
                                             (QREFELT $ 275))
                                   #4#)
                                  . #6#)))
                          (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #6#)))))
          (EXIT
           (PROGN
            (LETT #2# NIL . #6#)
            (SEQ (LETT |sym| NIL . #6#) (LETT #1# |syms| . #6#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |sym| (QREFELT $ 43)) #2#)
                         . #6#)))
                 (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |GUESS;algDepHP;LLR;51|
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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 253))))
            (|error|
             "Guess: no support for mixed shifts in algebraic dependencies")))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 254))
                . #1=(|GUESS;algDepHP;LLR;51|))
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsEQ| (QREFELT $ 276))
             (|error| "Guess: guessAlgDep supports only displayAsEQ"))
            ('T
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                    . #1#)
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
              (LETT |fl| (|GUESS;get_fnames| (LENGTH |lists|) |options| $)
                    . #1#)
              (LETT |fakeDS|
                    (CONS #'|GUESS;algDepHP;LLR;51!0| (VECTOR $ |lists|))
                    . #1#)
              (LETT |fakeDSF|
                    (CONS #'|GUESS;algDepHP;LLR;51!1| (VECTOR $ |lists|))
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;algDepHP;LLR;51!2| $) |partitions|
                          (QREFELT $ 280))
                (CONS #'|GUESS;algDepHP;LLR;51!3|
                      (VECTOR $ |fakeDS| |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;51!4| (VECTOR $ |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;51!5|
                      (VECTOR |fakeDSF| $ |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;51!6| (VECTOR $ |partitions| |fl|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                (CONS (|function| |GUESS;diffAF|) $)
                (CONS (|function| |GUESS;diffAX|) $)
                (CONS (|function| |GUESS;diffC|) $)))))))))) 

(SDEFUN |GUESS;algDepHP;LLR;51!6| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|fl| |partitions| $)
          (LETT |fl| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;51|))
          (LETT |partitions| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;DEPEXPRRStream| |fl| |partitions| $))))) 

(SDEFUN |GUESS;algDepHP;LLR;51!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |fakeDSF|)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;51|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |fakeDSF| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G665 NIL) (|i| NIL) (#3=#:G664 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 258))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     |fakeDSF| (|spadConstant| $ 196) $))))))) 

(SDEFUN |GUESS;algDepHP;LLR;51!4| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;DEPguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 255))
                        (QREFELT $ 256))
              (QREFELT $ 257))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;51!3| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| |fakeDS| $)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;51|))
          (LETT |fakeDS| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions| |fakeDS|
             (|spadConstant| $ 195) $))))) 

(SDEFUN |GUESS;algDepHP;LLR;51!2| ((|c| NIL) ($ NIL)) (|spadConstant| $ 144)) 

(SDEFUN |GUESS;algDepHP;LLR;51!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;list2UFPSSUPF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 230) (QREFELT $ 127))
                       (QREFELT $ 278))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;51!0| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;list2UFPSF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 230) (QREFELT $ 127))
                       (QREFELT $ 278))
             $))))) 

(SDEFUN |GUESS;substDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 43))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 43)) (+ |n| 1)
                            (QREFELT $ 152))
                  (QREFELT $ 282))) 

(SDEFUN |GUESS;substDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG ((#1=#:G681 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1) |GUESS;substDS|)
                           (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                            #1#))
                         (QREFELT $ 283)))) 

(SDEFUN |GUESS;substDSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG ((#1=#:G683 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1) |GUESS;substDSF|)
                           (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                            #1#))
                         (QREFELT $ 284)))) 

(SDEFUN |GUESS;substHP;LR;55|
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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 253))))
            (|error|
             "Guess: no support for mixed shifts in functional equations")))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 254))
                . #1=(|GUESS;substHP;LR;55|))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;substHP;LR;55!0| $) |partitions|
                          (QREFELT $ 280))
                (CONS #'|GUESS;substHP;LR;55!1| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;55!2| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;55!3| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;55!4| (VECTOR $ |partitions|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                (CONS (|function| |GUESS;diffAF|) $)
                (CONS (|function| |GUESS;diffAX|) $)
                (CONS (|function| |GUESS;diffC|) $)))))
            ('T (|error| "Guess: guessSubst supports only displayAsGF"))))))) 

(SDEFUN |GUESS;substHP;LR;55!4| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;55|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;substDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;substHP;LR;55!3| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;55|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G701 NIL) (|i| NIL) (#3=#:G700 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 258))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;substDSF|) $)
                     (|spadConstant| $ 196) $))))))) 

(SDEFUN |GUESS;substHP;LR;55!2| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;55|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;FEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 255))
                        (QREFELT $ 256))
              (QREFELT $ 257))
             $))))) 

(SDEFUN |GUESS;substHP;LR;55!1| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;55|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;substDS|) $) (|spadConstant| $ 195) $))))) 

(SDEFUN |GUESS;substHP;LR;55!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 144)) 

(SDEFUN |GUESS;qDiffDX|
        ((|q| |Symbol|) (|expr| EXPRR) (|x| |Symbol|)
         (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 43))
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT $ 43)) |n| (QREFELT $ 152))
                   (SPADCALL |x| (QREFELT $ 43)) (QREFELT $ 102))
                  (QREFELT $ 282))) 

(SDEFUN |GUESS;qDiffDS|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|n| |NonNegativeInteger|) ($ |UnivariateFormalPowerSeries| F))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;qDiffDS!0| (VECTOR |n| $ |q|)) |s|
                         (QREFELT $ 289)))) 

(SDEFUN |GUESS;qDiffDS!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;qDiffDS|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G722 NIL))
                   (SPADCALL (SPADCALL |q| (QREFELT $ 286))
                             (PROG1
                                 (LETT #2# (SPADCALL |n| |z1| (QREFELT $ 287))
                                       NIL)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 171))))))) 

(SDEFUN |GUESS;qDiffDSV|
        ((|f| |U32Vector|) (|n| |NonNegativeInteger|) (|prime| |Integer|)
         (|q| |Integer|) ($ |U32Vector|))
        (SPROG
         ((Q (|Integer|)) (|i| NIL) (|qn| (|Integer|)) (|r| (|U32Vector|))
          (#1=#:G726 NIL) (|d| (|Integer|)))
         (SEQ
          (COND ((ZEROP |n|) |f|)
                ('T
                 (SEQ (LETT |d| (- (QV_LEN_U32 |f|) 1) . #2=(|GUESS;qDiffDSV|))
                      (LETT |r|
                            (GETREFV_U32
                             (+
                              (PROG1 (LETT #1# |d| . #2#)
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              1)
                             0)
                            . #2#)
                      (SETELT_U32 |r| 0 (ELT_U32 |f| 0))
                      (COND
                       ((SPADCALL |d| 0 (QREFELT $ 212))
                        (SEQ (LETT Q 1 . #2#)
                             (LETT |qn| (REM (EXPT |q| |n|) |prime|) . #2#)
                             (EXIT
                              (SEQ (LETT |i| 1 . #2#) G190
                                   (COND ((|greater_SI| |i| |d|) (GO G191)))
                                   (SEQ
                                    (LETT Q (QSMULMOD32 |qn| Q |prime|) . #2#)
                                    (EXIT
                                     (SETELT_U32 |r| |i|
                                                 (QSMULMOD32 (ELT_U32 |f| |i|)
                                                             Q |prime|))))
                                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190)
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
                         (QREFELT $ 293)))) 

(SDEFUN |GUESS;qDiffDSF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;qDiffDSF|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G733 NIL))
                   (SPADCALL
                    (SPADCALL (SPADCALL |q| (QREFELT $ 286)) (QREFELT $ 291))
                    (PROG1 (LETT #2# (SPADCALL |n| |z1| (QREFELT $ 287)) NIL)
                      (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                    (QREFELT $ 177))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|q| |Integer|) (|dl| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|fl| (|List| (|U32Vector|))) (#1=#:G739 NIL) (#2=#:G738 NIL)
          (#3=#:G749 NIL) (|part| NIL) (#4=#:G748 NIL)
          (|ll| (|List| (|List| (|Integer|)))) (|d| (|NonNegativeInteger|))
          (#5=#:G737 NIL) (#6=#:G747 NIL) (|i| NIL) (#7=#:G746 NIL))
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
             (QREFELT $ 156)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #5# (- (- (QV_LEN_U32 |f|) |dl|) 1) . #8#)
                     (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                   . #8#)
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 150)) . #8#)
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
                                      (|check_subtype| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                    |prime| |q| $)
                                   (PROG1
                                       (LETT #1#
                                             (SPADCALL |part| (QREFELT $ 151))
                                             . #8#)
                                     (|check_subtype| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      #1#))
                                   |d| |prime| (QREFELT $ 159))
                                  #4#)
                                 . #8#)))
                         (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   . #8#)
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorqDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 163))))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2) . #1=(|GUESS;termAsU32VectorqDiff|))
          (LETT |prime| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 160)))))) 

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
            (SPROG ((#2=#:G755 NIL) (|p| NIL) (#3=#:G754 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 229))
                                (|spadConstant| $ 230) (QREFELT $ 199))
                      (|error| "ADEguessModGenq, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 231)) NIL)
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
                             (QREFELT $ 232)))))))))))) 

(SDEFUN |GUESS;diffHP;SM;62|
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
        (SPROG NIL (SEQ (CONS #'|GUESS;diffHP;SM;62!8| (VECTOR |q| $))))) 

(SDEFUN |GUESS;diffHP;SM;62!8| ((|l1| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;diffHP;SM;62|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|partitions| NIL))
                   (SEQ
                    (COND
                     ((NULL
                       (SPADCALL (SPADCALL |l1| (QREFELT $ 253))
                                 (QREFELT $ 294)))
                      (|error|
                       "Guess: no support for mixed shifts in differential equations")))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |l1| (QREFELT $ 254)) '|displayAsGF|
                                 (QREFELT $ 295))
                       (SEQ
                        (LETT |partitions|
                              (|GUESS;FilteredPartitionStream| |l1| $) NIL)
                        (EXIT
                         (VECTOR
                          (SPADCALL (CONS #'|GUESS;diffHP;SM;62!0| $)
                                    |partitions| (QREFELT $ 280))
                          (CONS #'|GUESS;diffHP;SM;62!2|
                                (VECTOR |q| $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;62!3|
                                (VECTOR $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;62!5|
                                (VECTOR |q| $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;62!7|
                                (VECTOR |q| $ |partitions|))
                          '|qdiffHP| |q| (CONS (|function| |GUESS;diffA|) $)
                          (CONS (|function| |GUESS;diffAF|) $)
                          (CONS (|function| |GUESS;diffAX|) $)
                          (CONS (|function| |GUESS;diffC|) $)))))
                      ('T
                       (|error|
                        "Guess: guessADE supports only displayAsGF")))))))))) 

(SDEFUN |GUESS;diffHP;SM;62!7| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |q| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
                    (CONS #'|GUESS;diffHP;SM;62!6| (VECTOR $ |q|))
                    (CONS (|function| |GUESS;diff1X|) $) $)))))) 

(SDEFUN |GUESS;diffHP;SM;62!6| ((|w1| NIL) (|w2| NIL) (|w3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qDiffDX| |q| |w1| |w2| |w3| $))))) 

(SDEFUN |GUESS;diffHP;SM;62!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |q| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG ((#1=#:G771 NIL) (|i| NIL) (#2=#:G770 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 258))
                                    #2#)
                                   NIL)))
                           (LETT #1# (CDR #1#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS #'|GUESS;diffHP;SM;62!4| (VECTOR $ |q|))
                     (|spadConstant| $ 196) $))))))) 

(SDEFUN |GUESS;diffHP;SM;62!4| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qDiffDSF| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;62!3| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGenq|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 255))
                        (QREFELT $ 256))
              (QREFELT $ 257))
             (|spadConstant| $ 144) $))))) 

(SDEFUN |GUESS;diffHP;SM;62!2| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |q| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEguessStream| |z1| |partitions|
                    (CONS #'|GUESS;diffHP;SM;62!1| (VECTOR $ |q|))
                    (|spadConstant| $ 195) $)))))) 

(SDEFUN |GUESS;diffHP;SM;62!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qDiffDS| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;62!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 144)) 

(SDEFUN |GUESS;ShiftSX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 43))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 43))
                            (SPADCALL |n| (QREFELT $ 298)) (QREFELT $ 108))
                  (QREFELT $ 282))) 

(SDEFUN |GUESS;ShiftSXGF|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPROG ((|l| (|List| EXPRR)) (#1=#:G798 NIL) (|i| NIL) (#2=#:G797 NIL))
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
                                                          (QREFELT $ 245))
                                                (SPADCALL
                                                 (SPADCALL |i| (QREFELT $ 299))
                                                 (QREFELT $ 298))
                                                (QREFELT $ 300))
                                               (SPADCALL |x| (QREFELT $ 43))
                                               (|spadConstant| $ 90)
                                               (QREFELT $ 282))
                                              (SPADCALL
                                               (SPADCALL |x| (QREFELT $ 43))
                                               |i| (QREFELT $ 152))
                                              (QREFELT $ 102))
                                             #2#)
                                            . #3#)))
                                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                    G191 (EXIT (NREVERSE #2#))))
                              . #3#)
                        (EXIT
                         (SPADCALL
                          (SPADCALL |expr|
                                    (SPADCALL (ELT $ 108) |l| (QREFELT $ 154))
                                    (QREFELT $ 92))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 43)) |n|
                                    (QREFELT $ 152))
                          (QREFELT $ 300))))))))) 

(SDEFUN |GUESS;ShiftSS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| (SPADCALL (ELT $ 301) |n| (QREFELT $ 304)))) 

(SDEFUN |GUESS;ShiftSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL |s| (SPADCALL (ELT $ 305) |n| (QREFELT $ 308)))) 

(SDEFUN |GUESS;ShiftAX|
        ((|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT $ 43)) |l| (QREFELT $ 152))
                  |f| (QREFELT $ 102))) 

(SDEFUN |GUESS;ShiftAXGF|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPROG ((|s| (|List| EXPRR)) (|i| NIL) (#1=#:G808 NIL))
               (SEQ
                (COND ((ZEROP |l|) |f|)
                      ('T
                       (SEQ
                        (LETT |s|
                              (PROGN
                               (LETT #1# NIL . #2=(|GUESS;ShiftAXGF|))
                               (SEQ (LETT |i| 1 . #2#) G190
                                    (COND ((|greater_SI| |i| |l|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #1#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |l| |i|
                                                          (QREFELT $ 310))
                                                (QREFELT $ 298))
                                               (SPADCALL
                                                (SPADCALL |x| (QREFELT $ 43))
                                                |i| (QREFELT $ 152))
                                               (QREFELT $ 102))
                                              (SPADCALL |f| |x| |i|
                                                        (QREFELT $ 245))
                                              (QREFELT $ 102))
                                             #1#)
                                            . #2#)))
                                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190)
                                    G191 (EXIT (NREVERSE #1#))))
                              . #2#)
                        (EXIT (SPADCALL (ELT $ 108) |s| (QREFELT $ 154))))))))) 

(SDEFUN |GUESS;ShiftA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 311))) 

(SDEFUN |GUESS;ShiftAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 312))) 

(SDEFUN |GUESS;ShiftC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 313))) 

(SDEFUN |GUESS;shiftHP;LR;72|
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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 253))))
            (|error| "Guess: need a symbol for mixed Shifting")))
          (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                . #1=(|GUESS;shiftHP;LR;72|))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 254)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsRec| (QREFELT $ 276))
             (|error|
              "Guess: no support for the Shift operator with displayAsGF"))
            ('T
             (SEQ
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
              (EXIT
               (VECTOR |degrees|
                       (CONS #'|GUESS;shiftHP;LR;72!0| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;shiftHP;LR;72!1|
                             (VECTOR |degrees| $ |partitions|))
                       (CONS #'|GUESS;shiftHP;LR;72!2| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;shiftHP;LR;72!3| (VECTOR $ |partitions|))
                       '|shiftHP| '|dummy| (CONS (|function| |GUESS;ShiftA|) $)
                       (CONS (|function| |GUESS;ShiftAF|) $)
                       (CONS (|function| |GUESS;ShiftAX|) $)
                       (CONS (|function| |GUESS;ShiftC|) $)))))))))) 

(SDEFUN |GUESS;shiftHP;LR;72!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;72|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;shiftHP;LR;72!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;72|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G827 NIL) (|i| NIL) (#3=#:G826 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 258))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 196)
                                (SPADCALL (|spadConstant| $ 204)
                                          (|spadConstant| $ 105)
                                          (QREFELT $ 319))
                                (QREFELT $ 320))
                      (SPADCALL (|spadConstant| $ 203) (QREFELT $ 316))
                      (QREFELT $ 321))
                     $))))))) 

(SDEFUN |GUESS;shiftHP;LR;72!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $ |degrees|)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;shiftHP;LR;72|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |degrees| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 255))
                        (QREFELT $ 256))
              (QREFELT $ 257))
             (SPADCALL |degrees| |o| (QREFELT $ 318)) $))))) 

(SDEFUN |GUESS;shiftHP;LR;72!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;72|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 195)
                        (SPADCALL (|spadConstant| $ 65) (|spadConstant| $ 230)
                                  (QREFELT $ 314))
                        (QREFELT $ 315))
              (SPADCALL (|spadConstant| $ 203) (QREFELT $ 316))
              (QREFELT $ 317))
             $))))) 

(SDEFUN |GUESS;qShiftAX|
        ((|q| |Symbol|) (|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR)
         ($ EXPRR))
        (SPADCALL
         (SPADCALL (SPADCALL |q| (QREFELT $ 43))
                   (SPADCALL |l| (SPADCALL |n| (QREFELT $ 43)) (QREFELT $ 323))
                   (QREFELT $ 324))
         |f| (QREFELT $ 102))) 

(SDEFUN |GUESS;qShiftA|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 325)) |k| |l| |f| (QREFELT $ 326))) 

(SDEFUN |GUESS;qShiftAF|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 286)) (QREFELT $ 291)) |k|
                  |l| |f| (QREFELT $ 327))) 

(SDEFUN |GUESS;qShiftC|
        ((|q| |Symbol|) (|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 325)) |total| (QREFELT $ 328))) 

(SDEFUN |GUESS;qSubstUFPSF|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|maxMD| |NonNegativeInteger|)
         ($ |List| (|UnivariateFormalPowerSeries| F)))
        (SPROG ((|i| NIL) (#1=#:G852 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL . #2=(|GUESS;qSubstUFPSF|))
                 (SEQ (LETT |i| 0 . #2#) G190
                      (COND ((|greater_SI| |i| |maxMD|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL |s|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |q| (QREFELT $ 286)) |i|
                                           (QREFELT $ 171))
                                          (SPADCALL (|spadConstant| $ 65) 1
                                                    (QREFELT $ 314))
                                          (QREFELT $ 329))
                                         (QREFELT $ 330))
                               #1#)
                              . #2#)))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |GUESS;qSubstEXPRR|
        ((|q| |Symbol|) (|xx| |Symbol|) (|s| EXPRR)
         (|maxMD| |NonNegativeInteger|) ($ |List| EXPRR))
        (SPROG ((|i| NIL) (#1=#:G855 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL . #2=(|GUESS;qSubstEXPRR|))
                 (SEQ (LETT |i| 0 . #2#) G190
                      (COND ((|greater_SI| |i| |maxMD|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |q| (QREFELT $ 43))
                                          (SPADCALL |i|
                                                    (SPADCALL |xx|
                                                              (QREFELT $ 43))
                                                    (QREFELT $ 323))
                                          (QREFELT $ 324))
                                |s| (QREFELT $ 102))
                               #1#)
                              . #2#)))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

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
                        (SPADCALL (|spadConstant| $ 195)
                                  (SPADCALL (|spadConstant| $ 65) 1
                                            (QREFELT $ 314))
                                  (QREFELT $ 315))
                        (SPADCALL (|spadConstant| $ 203) (QREFELT $ 316))
                        (QREFELT $ 317))
                       $)
                      |GUESS;ADEguessStreamMixShift|)
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEguessStreamMixShift!0|
                                 (VECTOR $ |maxMD| |q|))
                           (QREFELT $ 333)))))) 

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
             ((|l| NIL) (|vv| NIL) (|e| NIL) (|vn| NIL) (|i| NIL) (|r| NIL)
              (|lastv| NIL) (#2=#:G879 NIL) (|v| NIL) (#3=#:G880 NIL) (|w| NIL)
              (|vv1| NIL) (#4=#:G878 NIL) (|p| NIL) (#5=#:G877 NIL) (O NIL)
              (#6=#:G863 NIL) (|qv| NIL) (|d| NIL) (#7=#:G861 NIL) (|f| NIL))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |fl| (QREFELT $ 229))
                          (|spadConstant| $ 230) (QREFELT $ 199))
                (|error| "ADEguessModGen2Mixed: #fl ~= 1"))
               ('T
                (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 231)) NIL)
                     (LETT |d|
                           (PROG1
                               (LETT #7#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |f| (QREFELT $ 334))
                                                |dl| (QREFELT $ 239))
                                      (|spadConstant| $ 230) (QREFELT $ 239))
                                     NIL)
                             (|check_subtype| (>= #7# 0)
                                              '(|NonNegativeInteger|) #7#))
                           NIL)
                     (LETT |qv|
                           (SPADCALL
                            (SPADCALL |d| (|spadConstant| $ 230)
                                      (QREFELT $ 127))
                            (|spadConstant| $ 230) (QREFELT $ 335))
                           NIL)
                     (SEQ (LETT |i| (|spadConstant| $ 230) NIL) G190
                          (COND ((> |i| |d|) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |qv| |i|
                                      (SPADCALL
                                       (SPADCALL |q| |i| (QREFELT $ 338))
                                       |prime| (QREFELT $ 339))
                                      (QREFELT $ 340))))
                          (LETT |i| (+ |i| 1) NIL) (GO G190) G191 (EXIT NIL))
                     (LETT O
                           (PROG1
                               (LETT #6#
                                     (SPADCALL
                                      (SPADCALL |o|
                                                (SPADCALL |maxMD|
                                                          (|spadConstant| $
                                                                          230)
                                                          (QREFELT $ 127))
                                                (QREFELT $ 341))
                                      (QREFELT $ 342))
                                     NIL)
                             (|check_subtype| (>= #6# 0)
                                              '(|NonNegativeInteger|) #6#))
                           NIL)
                     (LETT |vv1|
                           (PROGN
                            (LETT #5# NIL NIL)
                            (SEQ (LETT |p| NIL NIL)
                                 (LETT #4#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |partitions| O
                                                   (QREFELT $ 255))
                                         (QREFELT $ 256))
                                        (QREFELT $ 257))
                                       NIL)
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |p| (CAR #4#) NIL) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #5#
                                         (CONS
                                          (|GUESS;termAsU32VectorShift| |f| |p|
                                           |prime| |dl| $)
                                          #5#)
                                         NIL)))
                                 (LETT #4# (CDR #4#) NIL) (GO G190) G191
                                 (EXIT (NREVERSE #5#))))
                           NIL)
                     (LETT |l| NIL NIL)
                     (LETT |lastv| (SPADCALL |vv1| (QREFELT $ 231)) NIL)
                     (SEQ (LETT |w| NIL NIL)
                          (LETT #3# (SPADCALL |vv1| (QREFELT $ 343)) NIL)
                          (LETT |v| NIL NIL) (LETT #2# |vv1| NIL) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) NIL) NIL)
                                (ATOM #3#)
                                (PROGN (LETT |w| (CAR #3#) NIL) NIL))
                            (GO G191)))
                          (SEQ (LETT |lastv| |w| NIL)
                               (LETT |vv| (LIST |v|) NIL) (LETT |vn| |v| NIL)
                               (SEQ (LETT |i| (|spadConstant| $ 230) NIL) G190
                                    (COND ((> |i| |maxMD|) (GO G191)))
                                    (SEQ
                                     (LETT |vn| (SPADCALL |vn| (QREFELT $ 344))
                                           NIL)
                                     (SEQ (LETT |e| (|spadConstant| $ 230) NIL)
                                          G190 (COND ((> |e| |d|) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |vn| |e|
                                                      (QSMULMOD32
                                                       (SPADCALL |vn| |e|
                                                                 (QREFELT $
                                                                          345))
                                                       (SPADCALL |qv| |e|
                                                                 (QREFELT $
                                                                          345))
                                                       |prime|)
                                                      (QREFELT $ 340))))
                                          (LETT |e| (+ |e| 1) NIL) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (LETT |vv|
                                            (SPADCALL |vn| |vv|
                                                      (QREFELT $ 346))
                                            NIL)))
                                    (LETT |i| (+ |i| 1) NIL) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |l|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |vv| (QREFELT $ 347))
                                        (QREFELT $ 232))
                                       |l| (QREFELT $ 349))
                                      NIL)))
                          (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) NIL))
                                NIL)
                          (GO G190) G191 (EXIT NIL))
                     (LETT |vv| (LIST |lastv|) NIL) (LETT |vn| |lastv| NIL)
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL |o|
                                      (SPADCALL |maxMD| (|spadConstant| $ 230)
                                                (QREFELT $ 127))
                                      (QREFELT $ 350))
                            (|spadConstant| $ 230) (QREFELT $ 239))
                           NIL)
                     (COND
                      ((SPADCALL |r|
                                 (SPADCALL (|spadConstant| $ 337)
                                           (QREFELT $ 351))
                                 (QREFELT $ 147))
                       (LETT |r| |maxMD| NIL)))
                     (SEQ (LETT |i| (|spadConstant| $ 230) NIL) G190
                          (COND ((> |i| |r|) (GO G191)))
                          (SEQ (LETT |vn| (SPADCALL |vn| (QREFELT $ 344)) NIL)
                               (SEQ (LETT |e| (|spadConstant| $ 230) NIL) G190
                                    (COND ((> |e| |d|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |vn| |e|
                                                (QSMULMOD32
                                                 (SPADCALL |vn| |e|
                                                           (QREFELT $ 345))
                                                 (SPADCALL |qv| |e|
                                                           (QREFELT $ 345))
                                                 |prime|)
                                                (QREFELT $ 340))))
                                    (LETT |e| (+ |e| 1) NIL) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |vv| (SPADCALL |vn| |vv| (QREFELT $ 346))
                                      NIL)))
                          (LETT |i| (+ |i| 1) NIL) (GO G190) G191 (EXIT NIL))
                     (LETT |l|
                           (SPADCALL
                            (SPADCALL (SPADCALL |vv| (QREFELT $ 347))
                                      (QREFELT $ 232))
                            |l| (QREFELT $ 349))
                           NIL)
                     (EXIT
                      (SPADCALL (SPADCALL |l| (QREFELT $ 352))
                                (QREFELT $ 354)))))))))))) 

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
                           (QREFELT $ 358)))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxMD|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;ADEdegreeStreamMixShift|))
          (LETT |maxMD| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|i| NIL) (#2=#:G884 NIL))
                   (SEQ
                    (PROGN
                     (LETT #2# NIL NIL)
                     (SEQ (LETT |i| (|spadConstant| $ 144) NIL) G190
                          (COND ((> |i| |maxMD|) (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS |z1| #2#) NIL)))
                          (LETT |i| (+ |i| 1) NIL) (GO G190) G191
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
          (LETT |l| (QREFELT $$ 4) . #1=(|GUESS;ADEtestMixShiftGen|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |maxMD| (QREFELT $$ 2) . #1#)
          (LETT |partitions| (QREFELT $$ 1) . #1#)
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|res| NIL) (#2=#:G907 NIL) (|i| NIL) (#3=#:G906 NIL) (|f0| NIL)
              (|exponents| NIL) (#4=#:G894 NIL) (|oldPartition| NIL)
              (#5=#:G905 NIL) (#6=#:G904 NIL) (|newPartition| NIL)
              (#7=#:G888 NIL) (#8=#:G903 NIL) (|p| NIL) (#9=#:G887 NIL))
             (SEQ (LETT |res| NIL NIL) (LETT |exponents| NIL NIL)
                  (LETT |oldPartition|
                        (PROG1
                            (LETT #9#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |l| (QREFELT $ 360))
                                             (SPADCALL |maxMD|
                                                       (|spadConstant| $ 105)
                                                       (QREFELT $ 127))
                                             (QREFELT $ 341))
                                   (QREFELT $ 342))
                                  NIL)
                          (|check_subtype| (> #9# 0) '(|PositiveInteger|) #9#))
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
                                                                             105)
                                                             (QREFELT $ 127))
                                                   (QREFELT $ 341))
                                         (QREFELT $ 342))
                                        NIL)
                                (|check_subtype| (> #7# 0) '(|PositiveInteger|)
                                                 #7#))
                              NIL)
                        (COND
                         ((SPADCALL |newPartition| |oldPartition|
                                    (QREFELT $ 361))
                          (SEQ
                           (LETT |f0|
                                 (|GUESS;termAsUFPSSUPF2| |f|
                                  (SPADCALL |partitions| |oldPartition|
                                            (QREFELT $ 258))
                                  (CONS (|function| |GUESS;ShiftSF|) $)
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 196)
                                             (SPADCALL (|spadConstant| $ 204)
                                                       (|spadConstant| $ 105)
                                                       (QREFELT $ 319))
                                             (QREFELT $ 320))
                                   (SPADCALL (|spadConstant| $ 203)
                                             (QREFELT $ 316))
                                   (QREFELT $ 321))
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
                                                                         286))
                                                              |i|
                                                              (QREFELT $ 171))
                                                             (QREFELT $ 291))
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             204)
                                                             (|spadConstant| $
                                                                             105)
                                                             (QREFELT $ 319))
                                                            (QREFELT $ 362))
                                                           (QREFELT $ 363))
                                                 #6#)
                                                NIL)))
                                        (LETT #5# (CDR #5#) NIL) (GO G190) G191
                                        (EXIT (NREVERSE #6#))))
                                  |res| (QREFELT $ 364))
                                 NIL)
                           (LETT |exponents| NIL NIL)
                           (EXIT (LETT |oldPartition| |newPartition| NIL)))))
                        (EXIT
                         (LETT |exponents|
                               (SPADCALL
                                (PROG1
                                    (LETT #4#
                                          (SPADCALL
                                           (SPADCALL |p| (|spadConstant| $ 105)
                                                     (QREFELT $ 239))
                                           (SPADCALL |maxMD|
                                                     (|spadConstant| $ 105)
                                                     (QREFELT $ 127))
                                           (QREFELT $ 339))
                                          NIL)
                                  (|check_subtype| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   #4#))
                                |exponents| (QREFELT $ 366))
                               NIL)))
                       (LETT #8# (CDR #8#) NIL) (GO G190) G191 (EXIT NIL))
                  (LETT |f0|
                        (|GUESS;termAsUFPSSUPF2| |f|
                         (SPADCALL |partitions| |oldPartition| (QREFELT $ 258))
                         (CONS (|function| |GUESS;ShiftSF|) $)
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 196)
                                    (SPADCALL (|spadConstant| $ 204)
                                              (|spadConstant| $ 105)
                                              (QREFELT $ 319))
                                    (QREFELT $ 320))
                          (SPADCALL (|spadConstant| $ 203) (QREFELT $ 316))
                          (QREFELT $ 321))
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
                                                               (QREFELT $ 286))
                                                     |i| (QREFELT $ 171))
                                                    (QREFELT $ 291))
                                                   (SPADCALL
                                                    (|spadConstant| $ 204)
                                                    (|spadConstant| $ 105)
                                                    (QREFELT $ 319))
                                                   (QREFELT $ 362))
                                                  (QREFELT $ 363))
                                        #3#)
                                       NIL)))
                               (LETT #2# (CDR #2#) NIL) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         |res| (QREFELT $ 364))
                        NIL)
                  (EXIT
                   (SPADCALL (SPADCALL |res| (QREFELT $ 367))
                             (QREFELT $ 233))))))))) 

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
                           (QREFELT $ 370)))))) 

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
           ((SPADCALL (SPADCALL |l1| (QREFELT $ 254)) '|displayAsRec|
                      (QREFELT $ 276))
            (|error|
             "Guess: no support for the qShift operator with displayAsGF"))
           (#1='T
            (SEQ
             (LETT |partitions| (|GUESS;FilteredPartitionStream| |l1| $)
                   . #2=(|GUESS;shift_hp_aux|))
             (LETT |maxMD| (SPADCALL |l1| (QREFELT $ 253)) . #2#)
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
             (SPADCALL |degrees| |o| (QREFELT $ 318)) |maxMD| |o| $))))) 

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
            (SPROG ((#2=#:G930 NIL) (|i| NIL) (#3=#:G929 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 258))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 196)
                                (SPADCALL (|spadConstant| $ 204)
                                          (|spadConstant| $ 105)
                                          (QREFELT $ 319))
                                (QREFELT $ 320))
                      (SPADCALL (|spadConstant| $ 203) (QREFELT $ 316))
                      (QREFELT $ 321))
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
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 255))
                        (QREFELT $ 256))
              (QREFELT $ 257))
             (SPADCALL |degrees| |o| (QREFELT $ 318)) $))))) 

(SDEFUN |GUESS;shift_hp_aux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shift_hp_aux|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 195)
                        (SPADCALL (|spadConstant| $ 65) (|spadConstant| $ 230)
                                  (QREFELT $ 314))
                        (QREFELT $ 315))
              (SPADCALL (|spadConstant| $ 203) (QREFELT $ 316))
              (QREFELT $ 317))
             $))))) 

(SDEFUN |GUESS;shiftHP;SM;85|
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
        (SPROG NIL (CONS #'|GUESS;shiftHP;SM;85!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESS;shiftHP;SM;85!0| ((|l1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;SM;85|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;shift_hp_aux| |q| |l1| $))))) 

(SDEFUN |GUESS;makeEXPRR|
        ((DAX |Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR)
         (|x| |Symbol|) (|p| |SparseUnivariatePolynomial| F) (|expr| EXPRR)
         ($ EXPRR))
        (COND ((SPADCALL |p| (QREFELT $ 372)) (|spadConstant| $ 90))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 373)) (QREFELT $ 10))
                 (SPADCALL (SPADCALL |p| (QREFELT $ 374)) |x| |expr| DAX)
                 (QREFELT $ 102))
                (|GUESS;makeEXPRR| DAX |x| (SPADCALL |p| (QREFELT $ 375))
                 |expr| $)
                (QREFELT $ 108))))) 

(SDEFUN |GUESS;list2UFPSF|
        ((|list| |List| F) ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL (SPADCALL |list| (QREFELT $ 377)) (QREFELT $ 378))) 

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
          (#1=#:G978 NIL) (|e| NIL) (#2=#:G977 NIL))
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
                         (LETT #2# (CONS (SPADCALL |e| (QREFELT $ 291)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 381))
                . #3#)
          (LETT |s1| (SPADCALL (ELT $ 122) 0 (QREFELT $ 125)) . #3#)
          (LETT |l2|
                (SPADCALL (CONS #'|GUESS;list2UFPSSUPF!0| $) |s1|
                          (QREFELT $ 386))
                . #3#)
          (EXIT
           (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 387)) (QREFELT $ 388)))))) 

(SDEFUN |GUESS;list2UFPSSUPF!0| ((|i| NIL) ($ NIL))
        (SPROG ((#1=#:G973 NIL))
               (SPADCALL (|spadConstant| $ 65)
                         (SPADCALL (|spadConstant| $ 230)
                                   (PROG1 (LETT #1# |i| NIL)
                                     (|check_subtype| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      #1#))
                                   (QREFELT $ 383))
                         (QREFELT $ 384)))) 

(SDEFUN |GUESS;SUPF2SUPSUPF|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL (ELT $ 291) |p| (QREFELT $ 392))) 

(SDEFUN |GUESS;UFPSF2SUPF|
        ((|f| |UnivariateFormalPowerSeries| F) (|deg| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (SPADCALL |f| |deg| (QREFELT $ 394)) (QREFELT $ 395))) 

(SDEFUN |GUESS;getListSUPF|
        ((|s| |List| (|UnivariateFormalPowerSeries| F))
         (|deg| |NonNegativeInteger|)
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;getListSUPF!0| (VECTOR $ |deg|)) |s|
                         (QREFELT $ 399)))) 

(SDEFUN |GUESS;getListSUPF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|deg| $)
          (LETT |deg| (QREFELT $$ 1) . #1=(|GUESS;getListSUPF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;UFPSF2SUPF| |z1| |deg| $))))) 

(SDEFUN |GUESS;precCheck|
        ((|list| |List| F) (|resi| |List| (|SparseUnivariatePolynomial| S))
         (|options| |List| (|GuessOption|)) (|sigma| |Integer|)
         (|bad| |Boolean|) ($ |Union| "good" "reject" "no_solution"))
        (SPROG
         ((#1=#:G1029 NIL) (#2=#:G1027 NIL) (|res2| (S)) (|p2val| (S))
          (|p2| (|SparseUnivariatePolynomial| S)) (#3=#:G1031 NIL) (|j| NIL)
          (#4=#:G1026 NIL) (|si| (S)) (|i| NIL) (#5=#:G1028 NIL) (|res1| (S))
          (|gl| (|Vector| S)) (#6=#:G1024 NIL) (#7=#:G1030 NIL)
          (#8=#:G1023 NIL) (#9=#:G1025 NIL) (|cden| (S)) (|c2| (S))
          (#10=#:G993 NIL) (|c1| (S)) (|pp| (S)) (|vd| (S)) (|vi| (F))
          (|order| (|Integer|)) (|j0| (|Integer|))
          (|svar| (|SingletonAsOrderedSet|)) (|max_ind| #11=(|Integer|))
          (|degree_loss| #11#) (|gl0| (|Vector| F))
          (|m| (|NonNegativeInteger|))
          (|resv| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|homo| (|Boolean|))
          (|homp| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |homp| (SPADCALL |options| (QREFELT $ 116))
                  . #12=(|GUESS;precCheck|))
            (LETT |homo| (COND ((QEQCAR |homp| 1) (QCDR |homp|)) (#13='T 'T))
                  . #12#)
            (LETT |resv| (SPADCALL |resi| (QREFELT $ 402)) . #12#)
            (LETT |m| (QVSIZE |resv|) . #12#)
            (LETT |gl0| (SPADCALL |list| (QREFELT $ 404)) . #12#)
            (LETT |degree_loss| (COND (|homo| (- |m| 1)) (#13# (- |m| 2)))
                  . #12#)
            (COND
             ((SPADCALL |options| (QREFELT $ 405))
              (LETT |max_ind| (- (- (QVSIZE |gl0|) |degree_loss|) 1) . #12#))
             (#13# (LETT |max_ind| (- |sigma| 1) . #12#)))
            (LETT |svar| (SPADCALL (QREFELT $ 407)) . #12#)
            (LETT |j0| (COND (|homo| 1) (#13# 2)) . #12#)
            (LETT |order| 0 . #12#)
            (EXIT
             (COND
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SEQ (LETT |gl| |gl0| . #12#)
                    (SEQ (LETT |i| 0 . #12#) G190
                         (COND ((|greater_SI| |i| |max_ind|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |res1| (|spadConstant| $ 190) . #12#)
                                (LETT |cden| (|spadConstant| $ 66) . #12#)
                                (LETT |si| (SPADCALL |i| (QREFELT $ 408))
                                      . #12#)
                                (COND
                                 ((NULL |homo|)
                                  (LETT |res1|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |resv| 1 (QREFELT $ 409))
                                          |svar| |si| (QREFELT $ 410))
                                         (QREFELT $ 411))
                                        . #12#)))
                                (SEQ (LETT |j| |j0| . #12#) G190
                                     (COND ((> |j| |m|) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 409))
                                            . #12#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 410))
                                             (QREFELT $ 411))
                                            . #12#)
                                      (LETT |vi|
                                            (SPADCALL |gl|
                                                      (+ (- (+ |i| |j|) |j0|)
                                                         1)
                                                      (QREFELT $ 412))
                                            . #12#)
                                      (LETT |vd| (SPADCALL |vi| (QREFELT $ 36))
                                            . #12#)
                                      (LETT |pp|
                                            (SPADCALL |cden| |vd|
                                                      (QREFELT $ 413))
                                            . #12#)
                                      (LETT |c1|
                                            (PROG2
                                                (LETT #10#
                                                      (SPADCALL |cden| |pp|
                                                                (QREFELT $
                                                                         414))
                                                      . #12#)
                                                (QCDR #10#)
                                              (|check_union| (QEQCAR #10# 0)
                                                             (QREFELT $ 7)
                                                             #10#))
                                            . #12#)
                                      (LETT |c2|
                                            (PROG2
                                                (LETT #10#
                                                      (SPADCALL |vd| |pp|
                                                                (QREFELT $
                                                                         414))
                                                      . #12#)
                                                (QCDR #10#)
                                              (|check_union| (QEQCAR #10# 0)
                                                             (QREFELT $ 7)
                                                             #10#))
                                            . #12#)
                                      (LETT |res1|
                                            (SPADCALL
                                             (SPADCALL |c2| |res1|
                                                       (QREFELT $ 415))
                                             (SPADCALL
                                              (SPADCALL |p2val| |c1|
                                                        (QREFELT $ 415))
                                              (SPADCALL |vi| (QREFELT $ 35))
                                              (QREFELT $ 415))
                                             (QREFELT $ 416))
                                            . #12#)
                                      (EXIT
                                       (LETT |cden|
                                             (SPADCALL |cden| |c2|
                                                       (QREFELT $ 415))
                                             . #12#)))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res1| (|spadConstant| $ 190)
                                             (QREFELT $ 417))
                                   (PROGN
                                    (LETT #9#
                                          (COND
                                           ((< |i| |sigma|)
                                            (PROGN
                                             (LETT #1# (CONS 2 "no_solution")
                                                   . #12#)
                                             (GO #14=#:G1022)))
                                           ('T
                                            (PROGN
                                             (LETT #1# (CONS 1 "reject")
                                                   . #12#)
                                             (GO #14#))))
                                          . #12#)
                                    (GO #15=#:G997)))))))
                          #15# (EXIT #9#))
                         (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                         (EXIT NIL))
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 405)))
                      (PROGN (LETT #1# (CONS 0 "good") . #12#) (GO #14#))))
                    (EXIT
                     (COND
                      (|bad|
                       (PROGN (LETT #1# (CONS 1 "reject") . #12#) (GO #14#)))
                      (#13#
                       (SEQ
                        (SEQ (LETT |i| 1 . #12#) G190
                             (COND
                              ((|greater_SI| |i| |degree_loss|) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ
                                (LETT |si|
                                      (SPADCALL (+ |i| |max_ind|)
                                                (QREFELT $ 408))
                                      . #12#)
                                (SEQ (LETT |j| (- |m| |i|) . #12#) G190
                                     (COND ((> |j| |m|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ
                                        (LETT |p2|
                                              (SPADCALL |resv| |j|
                                                        (QREFELT $ 409))
                                              . #12#)
                                        (LETT |p2val|
                                              (SPADCALL
                                               (SPADCALL |p2| |svar| |si|
                                                         (QREFELT $ 410))
                                               (QREFELT $ 411))
                                              . #12#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |p2val|
                                                     (|spadConstant| $ 190)
                                                     (QREFELT $ 417))
                                           (PROGN
                                            (LETT #8#
                                                  (PROGN
                                                   (LETT #1# (CONS 0 "good")
                                                         . #12#)
                                                   (GO #14#))
                                                  . #12#)
                                            (GO #16=#:G1000)))))))
                                      #16# (EXIT #8#))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |res2| (|spadConstant| $ 71) . #12#)
                                (COND
                                 (|homo|
                                  (LETT |res2|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |resv| 1 (QREFELT $ 409))
                                           |svar| |si| (QREFELT $ 410))
                                          (QREFELT $ 411))
                                         (QREFELT $ 47))
                                        . #12#)))
                                (SEQ (LETT |j| |j0| . #12#)
                                     (LETT #7# (- |m| |i|) . #12#) G190
                                     (COND ((> |j| #7#) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 409))
                                            . #12#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 410))
                                             (QREFELT $ 411))
                                            . #12#)
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
                                                                            412))
                                                                 (QREFELT $
                                                                          418))
                                                       (QREFELT $ 419))
                                             . #12#)))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res2| (|spadConstant| $ 71)
                                             (QREFELT $ 420))
                                   (PROGN
                                    (LETT #6#
                                          (PROGN
                                           (LETT #1# (CONS 1 "reject") . #12#)
                                           (GO #14#))
                                          . #12#)
                                    (GO #17=#:G1004)))))))
                              #17# (EXIT #6#))
                             (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN
                          (LETT #1# (CONS 0 "good") . #12#)
                          (GO #14#)))))))))
              ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
               (SEQ (LETT |gl| |gl0| . #12#)
                    (SEQ (LETT |i| 0 . #12#) G190
                         (COND ((|greater_SI| |i| |max_ind|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |res1| (|spadConstant| $ 190) . #12#)
                                (LETT |si| (SPADCALL |i| (QREFELT $ 408))
                                      . #12#)
                                (COND
                                 ((NULL |homo|)
                                  (LETT |res1|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |resv| 1 (QREFELT $ 409))
                                          |svar| |si| (QREFELT $ 410))
                                         (QREFELT $ 411))
                                        . #12#)))
                                (SEQ (LETT |j| |j0| . #12#) G190
                                     (COND ((> |j| |m|) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 409))
                                            . #12#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 410))
                                             (QREFELT $ 411))
                                            . #12#)
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
                                                                            422))
                                                                 (QREFELT $
                                                                          415))
                                                       (QREFELT $ 416))
                                             . #12#)))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res1| (|spadConstant| $ 190)
                                             (QREFELT $ 417))
                                   (PROGN
                                    (LETT #5#
                                          (COND
                                           ((< |i| |sigma|)
                                            (PROGN
                                             (LETT #1# (CONS 2 "no_solution")
                                                   . #12#)
                                             (GO #14#)))
                                           ('T
                                            (PROGN
                                             (LETT #1# (CONS 1 "reject")
                                                   . #12#)
                                             (GO #14#))))
                                          . #12#)
                                    (GO #18=#:G1010)))))))
                          #18# (EXIT #5#))
                         (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                         (EXIT NIL))
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 405)))
                      (PROGN (LETT #1# (CONS 0 "good") . #12#) (GO #14#))))
                    (EXIT
                     (COND
                      (|bad|
                       (PROGN (LETT #1# (CONS 1 "reject") . #12#) (GO #14#)))
                      (#13#
                       (SEQ
                        (SEQ (LETT |i| 1 . #12#) G190
                             (COND
                              ((|greater_SI| |i| |degree_loss|) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ
                                (LETT |si|
                                      (SPADCALL (+ |i| |max_ind|)
                                                (QREFELT $ 408))
                                      . #12#)
                                (SEQ (LETT |j| (- |m| |i|) . #12#) G190
                                     (COND ((> |j| |m|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ
                                        (LETT |p2|
                                              (SPADCALL |resv| |j|
                                                        (QREFELT $ 409))
                                              . #12#)
                                        (LETT |p2val|
                                              (SPADCALL
                                               (SPADCALL |p2| |svar| |si|
                                                         (QREFELT $ 410))
                                               (QREFELT $ 411))
                                              . #12#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |p2val|
                                                     (|spadConstant| $ 190)
                                                     (QREFELT $ 417))
                                           (PROGN
                                            (LETT #4#
                                                  (PROGN
                                                   (LETT #1# (CONS 0 "good")
                                                         . #12#)
                                                   (GO #14#))
                                                  . #12#)
                                            (GO #19=#:G1013)))))))
                                      #19# (EXIT #4#))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |res2| (|spadConstant| $ 190) . #12#)
                                (COND
                                 (|homo|
                                  (LETT |res2|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |resv| 1 (QREFELT $ 409))
                                          |svar| |si| (QREFELT $ 410))
                                         (QREFELT $ 411))
                                        . #12#)))
                                (SEQ (LETT |j| |j0| . #12#)
                                     (LETT #3# (- |m| |i|) . #12#) G190
                                     (COND ((> |j| #3#) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 409))
                                            . #12#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 410))
                                             (QREFELT $ 411))
                                            . #12#)
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
                                                                            422))
                                                                 (QREFELT $
                                                                          415))
                                                       (QREFELT $ 416))
                                             . #12#)))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res2| (|spadConstant| $ 190)
                                             (QREFELT $ 417))
                                   (PROGN
                                    (LETT #2#
                                          (PROGN
                                           (LETT #1# (CONS 1 "reject") . #12#)
                                           (GO #14#))
                                          . #12#)
                                    (GO #20=#:G1017)))))))
                              #20# (EXIT #2#))
                             (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN
                          (LETT #1# (CONS 0 "good") . #12#)
                          (GO #14#)))))))))
              (#13# (|error| "F must be S or Fraction(S)"))))))
          #14# (EXIT #1#)))) 

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
         ((#2=#:G1082 NIL) (#3=#:G1080 NIL) (|order| (|Integer|))
          (|c| (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|d| NIL) (|dmax| (|NonNegativeInteger|))
          (|resiSUPF|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#4=#:G1086 NIL) (|i| NIL) (#5=#:G1085 NIL) (|testList| #1#)
          (|flist| (|List| (|PositiveInteger|))) (#6=#:G1061 NIL)
          (#7=#:G1084 NIL) (|maxPow| (|Integer|))
          (|maxP| (|Union| (|PositiveInteger|) "arbitrary"))
          (|len| (|NonNegativeInteger|)) (|reject_one_term| (|Boolean|))
          (#8=#:G1081 NIL)
          (|nonZeroCoefficients| (|Union| #9="several" "one" "none"))
          (#10=#:G1083 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |options| (QREFELT $ 58))
              (SPADCALL "Guess: checking solution" (QREFELT $ 74))))
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
                        (SPADCALL (SPADCALL |resi| |i| (QREFELT $ 423))
                                  (QREFELT $ 424)))
                       (COND
                        ((QEQCAR |nonZeroCoefficients| 2)
                         (LETT |nonZeroCoefficients| (CONS 0 "one") . #11#))
                        ('T
                         (SEQ (LETT |nonZeroCoefficients| (CONS 1 #9#) . #11#)
                              (EXIT
                               (PROGN
                                (LETT #8# |$NoValue| . #11#)
                                (GO #12=#:G1040))))))))))
                   (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL)))
             #12# (EXIT #8#))
            (COND
             ((NULL (QEQCAR |nonZeroCoefficients| 1))
              (COND
               ((NULL (SPADCALL (ELT $ 430) |list| (QREFELT $ 81)))
                (SEQ (LETT |reject_one_term| 'T . #11#)
                     (EXIT
                      (COND
                       ((SPADCALL |options| (QREFELT $ 58))
                        (SPADCALL "Guess: encountered single-term solution"
                                  (QREFELT $ 74))))))))))
            (LETT |len| (LENGTH |list|) . #11#)
            (LETT |maxP| (SPADCALL |options| (QREFELT $ 114)) . #11#)
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
                   (LETT #7# NIL . #11#)
                   (SEQ (LETT |i| 1 . #11#) G190
                        (COND ((|greater_SI| |i| |o|) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((COND
                             ((SPADCALL (SPADCALL |resi| |i| (QREFELT $ 423))
                                        (QREFELT $ 424))
                              'NIL)
                             (#13# 'T))
                            (LETT #7#
                                  (CONS
                                   (PROG1 (LETT #6# |i| . #11#)
                                     (|check_subtype| (> #6# 0)
                                                      '(|PositiveInteger|)
                                                      #6#))
                                   #7#)
                                  . #11#)))))
                        (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #7#))))
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
                                   (SPADCALL |resi| |i| (QREFELT $ 423)) $)
                                  $)
                                 #5#)
                                . #11#)))
                        (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #11#)
            (LETT |order| 0 . #11#)
            (LETT |dmax| (SPADCALL 10 (LENGTH |list|) (QREFELT $ 431)) . #11#)
            (SEQ
             (EXIT
              (SEQ (LETT |d| 0 . #11#) G190 NIL
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 405)))
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN
                         (LETT #2# (CONS 0 "good") . #11#)
                         (GO #14=#:G1079))))))
                    (COND
                     (|reject_one_term|
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN
                         (LETT #2# (CONS 1 "reject") . #11#)
                         (GO #14#))))))
                    (LETT |c|
                          (SPADCALL (QVELT D 8) |testList| |d|
                                    (SPADCALL |resiSUPF| (QREFELT $ 434))
                                    (QREFELT $ 435))
                          . #11#)
                    (COND
                     ((NULL (SPADCALL |c| (QREFELT $ 436)))
                      (SEQ (LETT |order| |d| . #11#)
                           (EXIT
                            (PROGN
                             (LETT #3# |$NoValue| . #11#)
                             (GO #15=#:G1072))))))
                    (EXIT
                     (COND
                      ((SPADCALL |d| |dmax| (QREFELT $ 273))
                       (SEQ
                        (SPADCALL "bailing out from checkInterpolant"
                                  (QREFELT $ 437))
                        (SPADCALL
                         "please report the input to fricas-devel@googlegroups.com"
                         (QREFELT $ 437))
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
                 (SPADCALL "Order too low: " (SPADCALL |order| (QREFELT $ 438))
                           (QREFELT $ 61))
                 (QREFELT $ 437))
                (SPADCALL
                 (SPADCALL "sigma: " (SPADCALL |sigma| (QREFELT $ 438))
                           (QREFELT $ 61))
                 (QREFELT $ 437))
                (EXIT
                 (PROGN (LETT #2# (CONS 2 "no_solution") . #11#) (GO #14#)))))
              ((SPADCALL |c| (QREFELT $ 439))
               (SEQ
                (COND
                 ((SPADCALL |options| (QREFELT $ 58))
                  (SEQ
                   (SPADCALL
                    (SPADCALL "Proposed solution does not fit coefficient "
                              (SPADCALL |order| (QREFELT $ 438))
                              (QREFELT $ 61))
                    (QREFELT $ 437))
                   (EXIT
                    (SPADCALL
                     (SPADCALL "sigma: " (SPADCALL |sigma| (QREFELT $ 438))
                               (QREFELT $ 61))
                     (QREFELT $ 437))))))
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
         ((|ex| (|List| EXPRR)) (#1=#:G1117 NIL) (|p| NIL) (#2=#:G1118 NIL)
          (|e| NIL) (#3=#:G1116 NIL) (|eq| (EXPRR)) (#4=#:G1114 NIL)
          (#5=#:G1115 NIL) (#6=#:G1113 NIL) (|dk| (|Symbol|)))
         (SEQ
          (LETT |dk| (SPADCALL |options| (QREFELT $ 254))
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
                                    (SPADCALL |options| (QREFELT $ 440))
                                    (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                   #6#)
                                  . #7#)))
                          (LETT #4#
                                (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #7#))
                                . #7#)
                          (GO G190) G191 (EXIT (NREVERSE #6#))))
                    . #7#)
              (LETT |eq|
                    (SPADCALL (SPADCALL (ELT $ 108) |ex| (QREFELT $ 154))
                              (QREFELT $ 441))
                    . #7#)
              (EXIT
               (COND ((EQUAL |dk| '|displayAsEQ|) |eq|)
                     (#8='T
                      (SPADCALL |op| (SPADCALL |options| (QREFELT $ 440))
                                (SPADCALL |options| (QREFELT $ 56)) |eq|
                                (|GUESS;getVariables| |initials| $)
                                (SPADCALL (QREFELT $ 10)
                                          (SPADCALL |initials| (QREFELT $ 377))
                                          (QREFELT $ 444))
                                (QREFELT $ 447)))))))))
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
                                    (SPADCALL |options| (QREFELT $ 56))
                                    (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                   #3#)
                                  . #7#)))
                          (LETT #1#
                                (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #7#))
                                . #7#)
                          (GO G190) G191 (EXIT (NREVERSE #3#))))
                    . #7#)
              (EXIT
               (SPADCALL |op| (SPADCALL |options| (QREFELT $ 56))
                         (SPADCALL (SPADCALL (ELT $ 108) |ex| (QREFELT $ 154))
                                   (QREFELT $ 441))
                         (|GUESS;getVariables| |initials| $)
                         (SPADCALL (QREFELT $ 10)
                                   (SPADCALL |initials| (QREFELT $ 377))
                                   (QREFELT $ 444))
                         (QREFELT $ 448)))))
            (#8# (|error| "wrapInterpolant: unsupported display kind"))))))) 

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
          (|i| NIL) (#1=#:G1168 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#2=#:G1167 NIL) (#3=#:G1166 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#4=#:G1125 NIL) (#5=#:G1164 NIL) (|del| (|Integer|))
          (|leadingZeros| (|Integer|)) (#6=#:G1165 NIL) (|el| NIL)
          (|sigma| (|NonNegativeInteger|)) (#7=#:G1123 NIL)
          (|list| (|List| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |list| (|SPADfirst| |lists|)
                  . #8=(|GUESS;guessInterpolateModular|))
            (LETT |sigma|
                  (PROG1 (LETT #7# (- (LENGTH |list|) |degreeLoss|) . #8#)
                    (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|) #7#))
                  . #8#)
            (LETT |leadingZeros| 0 . #8#)
            (SEQ (LETT |el| NIL . #8#) (LETT #6# |list| . #8#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |el| (CAR #6#) . #8#) NIL)
                       (NULL (SPADCALL |el| (QREFELT $ 430))))
                   (GO G191)))
                 (SEQ (EXIT (LETT |leadingZeros| (+ |leadingZeros| 1) . #8#)))
                 (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |leadingZeros| |degreeLoss| (QREFELT $ 212))
              (SEQ (LETT |del| (- |leadingZeros| |degreeLoss|) . #8#)
                   (EXIT
                    (COND
                     ((SPADCALL |del| |guessDegree| (QREFELT $ 212))
                      (PROGN (LETT #5# (CONS 1 'NIL) . #8#) (GO #9=#:G1163)))
                     (#10='T
                      (LETT |guessDegree|
                            (PROG1 (LETT #4# (- |guessDegree| |del|) . #8#)
                              (|check_subtype| (>= #4# 0)
                                               '(|NonNegativeInteger|) #4#))
                            . #8#)))))))
            (COND
             ((NULL (SPADCALL |options| (QREFELT $ 449)))
              (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 450)) . #8#)
                   (EXIT
                    (COND
                     ((QEQCAR |maxD| 0)
                      (COND
                       ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                        (LETT |degs|
                              (PROGN
                               (LETT #3# NIL . #8#)
                               (SEQ (LETT |i| 1 . #8#) G190
                                    (COND ((|greater_SI| |i| |o|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3# (CONS (QCDR |maxD|) #3#)
                                            . #8#)))
                                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190)
                                    G191 (EXIT (NREVERSE #3#))))
                              . #8#))
                       (#10#
                        (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|) . #8#)
                             (EXIT
                              (LETT |degs|
                                    (PROGN
                                     (LETT #2# NIL . #8#)
                                     (SEQ (LETT |i| 1 . #8#) G190
                                          (COND
                                           ((|greater_SI| |i| |o|) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2#
                                                  (CONS
                                                   (COND
                                                    ((SPADCALL |i| (QCDR |deg|)
                                                               (QREFELT $ 451))
                                                     (+ (QCAR |deg|) 1))
                                                    ('T (QCAR |deg|)))
                                                   #2#)
                                                  . #8#)))
                                          (LETT |i| (|inc_SI| |i|) . #8#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #2#))))
                                    . #8#))))))
                     (#10#
                      (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|) . #8#)
                           (EXIT
                            (LETT |degs|
                                  (PROGN
                                   (LETT #1# NIL . #8#)
                                   (SEQ (LETT |i| 1 . #8#) G190
                                        (COND
                                         ((|greater_SI| |i| |o|) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #1#
                                                (CONS
                                                 (COND
                                                  ((SPADCALL |i| (QCDR |deg|)
                                                             (QREFELT $ 451))
                                                   (+ (QCAR |deg|) 1))
                                                  ('T (QCAR |deg|)))
                                                 #1#)
                                                . #8#)))
                                        (LETT |i| (|inc_SI| |i|) . #8#)
                                        (GO G190) G191 (EXIT (NREVERSE #1#))))
                                  . #8#)))))))))
            (COND
             ((QEQCAR (SPADCALL |options| (QREFELT $ 453)) 1)
              (SEQ
               (LETT |check|
                     (CONS #'|GUESS;guessInterpolateModular!0|
                           (VECTOR $ |sigma| |options| D |o| |list|))
                     . #8#)
               (EXIT
                (LETT |check|
                      (SPADCALL |check| |lists| (QVELT D 5) (QVELT D 6) |sigma|
                                (SPADCALL |o| (QVELT D 2)) (QREFELT $ 457))
                      . #8#))))
             ((QEQCAR (SPADCALL |options| (QREFELT $ 453)) 0)
              (SEQ
               (COND
                ((SPADCALL |options| (QREFELT $ 58))
                 (SPADCALL "Guess: skipping checks" (QREFELT $ 74))))
               (EXIT
                (LETT |check| (LIST #'|GUESS;guessInterpolateModular!1|)
                      . #8#))))
             (#10#
              (LETT |check|
                    (CONS #'|GUESS;guessInterpolateModular!2|
                          (VECTOR $ |sigma| |options| D |o| |list|))
                    . #8#)))
            (EXIT
             (SPADCALL |lists| |degs| (QVELT D 5) (QVELT D 6) |sigma|
                       (SPADCALL |o| (QVELT D 2)) |check| (QREFELT $ 459)))))
          #9# (EXIT #5#)))) 

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
         ((#2=#:G1248 NIL) (|j| NIL) (|c| (S)) (|cl| (|List| S))
          (#3=#:G1264 NIL) (#4=#:G1262 NIL) (|i1| NIL) (#5=#:G1263 NIL)
          (|i2| NIL) (|Mr| (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|m| (|NonNegativeInteger|)) (|rl| (|List| (|Integer|)))
          (|ce| (|List| (|SparseUnivariatePolynomial| S))) (#6=#:G1261 NIL)
          (|i| NIL) (M (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|vguessListF| (|Vector| (|SparseUnivariatePolynomial| F)))
          (|vguessList| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|guessPolys| (|List| (|SparseUnivariatePolynomial| F)))
          (#7=#:G1232 NIL)
          (|guessList| (|List| (|UnivariateFormalPowerSeries| F)))
          (|guessS| #1#) (|sumEta| (|NonNegativeInteger|))
          (|eta| (|List| (|NonNegativeInteger|))) (#8=#:G1260 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#9=#:G1194 NIL) (#10=#:G1259 NIL) (#11=#:G1183 NIL)
          (#12=#:G1258 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#13=#:G1171 NIL) (#14=#:G1257 NIL) (|d| NIL) (#15=#:G1256 NIL)
          (|list| (|List| F)))
         (SEQ
          (LETT |list| (|SPADfirst| |lists|)
                . #16=(|GUESS;guessInterpolateFFFG|))
          (COND
           ((SPADCALL |options| (QREFELT $ 58))
            (SPADCALL "Guess: using FFFG" (QREFELT $ 74))))
          (COND
           ((SPADCALL |options| (QREFELT $ 449))
            (SEQ
             (LETT |eta|
                   (PROGN
                    (LETT #15# NIL . #16#)
                    (SEQ (LETT |d| NIL . #16#) (LETT #14# |degs| . #16#) G190
                         (COND
                          ((OR (ATOM #14#)
                               (PROGN (LETT |d| (CAR #14#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #15#
                                 (CONS
                                  (PROG1 (LETT #13# |d| . #16#)
                                    (|check_subtype| (>= #13# 0)
                                                     '(|NonNegativeInteger|)
                                                     #13#))
                                  #15#)
                                 . #16#)))
                         (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                         (EXIT (NREVERSE #15#))))
                   . #16#)
             (EXIT
              (SPADCALL |eta| 1 (+ (SPADCALL |eta| 1 (QREFELT $ 460)) 1)
                        (QREFELT $ 461)))))
           (#17='T
            (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 450)) . #16#)
                 (EXIT
                  (COND
                   ((QEQCAR |maxD| 0)
                    (COND
                     ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                      (LETT |eta|
                            (PROGN
                             (LETT #12# NIL . #16#)
                             (SEQ (LETT |i| 1 . #16#) G190
                                  (COND ((|greater_SI| |i| |o|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #12#
                                          (CONS
                                           (COND
                                            ((< |i| |o|) (+ (QCDR |maxD|) 1))
                                            ('T (QCDR |maxD|)))
                                           #12#)
                                          . #16#)))
                                  (LETT |i| (|inc_SI| |i|) . #16#) (GO G190)
                                  G191 (EXIT (NREVERSE #12#))))
                            . #16#))
                     (#17#
                      (SEQ
                       (LETT |deg|
                             (DIVIDE2
                              (PROG1
                                  (LETT #11# (- (+ |guessDegree| |o|) 1)
                                        . #16#)
                                (|check_subtype| (>= #11# 0)
                                                 '(|NonNegativeInteger|) #11#))
                              |o|)
                             . #16#)
                       (EXIT
                        (LETT |eta|
                              (PROGN
                               (LETT #10# NIL . #16#)
                               (SEQ (LETT |i| 1 . #16#) G190
                                    (COND ((|greater_SI| |i| |o|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #10#
                                            (CONS
                                             (COND
                                              ((SPADCALL |i| (QCDR |deg|)
                                                         (QREFELT $ 451))
                                               (+ (QCAR |deg|) 1))
                                              ('T (QCAR |deg|)))
                                             #10#)
                                            . #16#)))
                                    (LETT |i| (|inc_SI| |i|) . #16#) (GO G190)
                                    G191 (EXIT (NREVERSE #10#))))
                              . #16#))))))
                   (#17#
                    (SEQ
                     (LETT |deg|
                           (DIVIDE2
                            (PROG1
                                (LETT #9# (- (+ |guessDegree| |o|) 1) . #16#)
                              (|check_subtype| (>= #9# 0)
                                               '(|NonNegativeInteger|) #9#))
                            |o|)
                           . #16#)
                     (EXIT
                      (LETT |eta|
                            (PROGN
                             (LETT #8# NIL . #16#)
                             (SEQ (LETT |i| 1 . #16#) G190
                                  (COND ((|greater_SI| |i| |o|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8#
                                          (CONS
                                           (COND
                                            ((SPADCALL |i| (QCDR |deg|)
                                                       (QREFELT $ 451))
                                             (+ (QCAR |deg|) 1))
                                            ('T (QCAR |deg|)))
                                           #8#)
                                          . #16#)))
                                  (LETT |i| (|inc_SI| |i|) . #16#) (GO G190)
                                  G191 (EXIT (NREVERSE #8#))))
                            . #16#)))))))))
          (LETT |sumEta| (SPADCALL (ELT $ 127) |eta| (QREFELT $ 467)) . #16#)
          (LETT |guessS| (SPADCALL (|GUESS;list2UFPSF| |list| $) (QVELT D 1))
                . #16#)
          (LETT |guessList|
                (SPADCALL
                 (SPADCALL (SPADCALL |guessS| |o| (QREFELT $ 468))
                           (QREFELT $ 469))
                 (QREFELT $ 470))
                . #16#)
          (LETT |guessPolys|
                (|GUESS;getListSUPF| |guessList|
                 (PROG1 (LETT #7# (- |sumEta| 1) . #16#)
                   (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|) #7#))
                 $)
                . #16#)
          (COND
           ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
            (SEQ
             (LETT |vguessList| (SPADCALL |guessPolys| (QREFELT $ 402)) . #16#)
             (EXIT
              (LETT M
                    (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                              |vguessList| |eta| (QREFELT $ 472))
                    . #16#))))
           ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
            (SEQ
             (LETT |vguessListF| (SPADCALL |guessPolys| (QREFELT $ 474))
                   . #16#)
             (EXIT
              (LETT M
                    (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                              |vguessListF| |eta| (QREFELT $ 476))
                    . #16#))))
           (#17#
            (|error|
             "Guess: type parameter F should be either equal to S or equal                     to Fraction S")))
          (LETT |rl| NIL . #16#)
          (SEQ (LETT |i| 1 . #16#) (LETT #6# (ANCOLS M) . #16#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (LETT |ce|
                      (SPADCALL (SPADCALL M |i| (QREFELT $ 477))
                                (QREFELT $ 478))
                      . #16#)
                (EXIT
                 (COND
                  ((QEQCAR
                    (|GUESS;checkInterpolant| |list| |o|
                     (SPADCALL (SPADCALL M |i| (QREFELT $ 477))
                               (QREFELT $ 478))
                     D |options| |guessDegree| $)
                    0)
                   (LETT |rl| (CONS |i| |rl|) . #16#)))))
               (LETT |i| (|inc_SI| |i|) . #16#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((NULL |rl|) (MAKE_MATRIX 0 0))
                 (#17#
                  (SEQ (LETT |rl| (NREVERSE |rl|) . #16#)
                       (LETT |m| (ANROWS M) . #16#)
                       (LETT |Mr|
                             (MAKE_MATRIX1 |m| (LENGTH |rl|)
                                           (|spadConstant| $ 479))
                             . #16#)
                       (SEQ (LETT |i2| NIL . #16#) (LETT #5# |rl| . #16#)
                            (LETT |i1| 1 . #16#)
                            (LETT #4# (LENGTH |rl|) . #16#) G190
                            (COND
                             ((OR (|greater_SI| |i1| #4#) (ATOM #5#)
                                  (PROGN (LETT |i2| (CAR #5#) . #16#) NIL))
                              (GO G191)))
                            (SEQ
                             (COND
                              ((|HasCategory| (QREFELT $ 7) '(|Field|))
                               (SEQ (LETT |c| (|spadConstant| $ 190) . #16#)
                                    (EXIT
                                     (SEQ (LETT |j| 1 . #16#) G190
                                          (COND
                                           ((OR (|greater_SI| |j| |m|)
                                                (NULL
                                                 (SPADCALL |c|
                                                           (QREFELT $ 429))))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |c|
                                                  (SPADCALL
                                                   (SPADCALL M |j| |i2|
                                                             (QREFELT $ 480))
                                                   (QREFELT $ 481))
                                                  . #16#)))
                                          (LETT |j| (|inc_SI| |j|) . #16#)
                                          (GO G190) G191 (EXIT NIL)))))
                              ('T
                               (SEQ
                                (LETT |cl|
                                      (PROGN
                                       (LETT #3# NIL . #16#)
                                       (SEQ (LETT |j| 1 . #16#) G190
                                            (COND
                                             ((|greater_SI| |j| |m|)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #3#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL M |j| |i2|
                                                                (QREFELT $
                                                                         480))
                                                      (QREFELT $ 482))
                                                     #3#)
                                                    . #16#)))
                                            (LETT |j| (|inc_SI| |j|) . #16#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #3#))))
                                      . #16#)
                                (EXIT
                                 (LETT |c| (SPADCALL |cl| (QREFELT $ 483))
                                       . #16#)))))
                             (EXIT
                              (SEQ (LETT |j| 1 . #16#) G190
                                   (COND ((|greater_SI| |j| |m|) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |Mr| |j| |i1|
                                               (PROG2
                                                   (LETT #2#
                                                         (SPADCALL
                                                          (SPADCALL M |j| |i2|
                                                                    (QREFELT $
                                                                             480))
                                                          |c| (QREFELT $ 484))
                                                         . #16#)
                                                   (QCDR #2#)
                                                 (|check_union| (QEQCAR #2# 0)
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT $ 7))
                                                                #2#))
                                               (QREFELT $ 485))))
                                   (LETT |j| (|inc_SI| |j|) . #16#) (GO G190)
                                   G191 (EXIT NIL))))
                            (LETT |i1|
                                  (PROG1 (|inc_SI| |i1|)
                                    (LETT #5# (CDR #5#) . #16#))
                                  . #16#)
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
                 (QREFELT $ 499))))) 

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
            (SPROG ((|degs| NIL) (M0 NIL) (#2=#:G1281 NIL) (M NIL))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |vs| (QREFELT $ 486))
                           (SPADCALL |vs| (QREFELT $ 489)))
                       (SPADCALL (QREFELT $ 488)))
                      ('T
                       (SEQ (LETT |degs| (SPADCALL |vs| (QREFELT $ 490)) NIL)
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
                                          |degs| (QREFELT $ 495))
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
                                              (SPADCALL |vs| (QREFELT $ 496))
                                              $)
                                             NIL)
                                       (GO #3=#:G1280)))))
                                   ('T (QCDR M0)))
                                  NIL)
                            (EXIT
                             (SPADCALL M
                                       (|GUESS;guessInterpolate3| |lists| |o|
                                        |degreeLoss| |guessDegree| D |options|
                                        (SPADCALL |vs| (QREFELT $ 496)) $)
                                       (QREFELT $ 497)))))))
                    #3# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessInterpolate3!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 144) (QREFELT $ 493))) 

(SDEFUN |GUESS;listDecr|
        ((|l| |List| (|NonNegativeInteger|)) ($ |List| (|Integer|)))
        (SPADCALL (CONS #'|GUESS;listDecr!0| $) |l| (QREFELT $ 502))) 

(SDEFUN |GUESS;listDecr!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 230) (QREFELT $ 239))) 

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
                 ((SPADCALL |options| (QREFELT $ 449))
                  (SEQ
                   (LETT |maxD0| (SPADCALL |options| (QREFELT $ 450))
                         . #1=(|GUESS;guessInterpolate2|))
                   (LETT |maxD|
                         (COND ((QEQCAR |maxD0| 0) (QCDR |maxD0|))
                               (#2='T (- (+ |guessDegree| |o|) 2)))
                         . #1#)
                   (LETT |vs0|
                         (SPADCALL (+ |guessDegree| |o|) (+ |maxD| 1) |o|
                                   (QREFELT $ 504))
                         . #1#)
                   (EXIT
                    (SPADCALL (CONS (|function| |GUESS;listDecr|) $) |vs0|
                              (QREFELT $ 507)))))
                 (#2#
                  (SPADCALL NIL (SPADCALL (QREFELT $ 508)) (QREFELT $ 509))))
                . #1#)
          (EXIT
           (|GUESS;guessInterpolate3| |lists| |o| |degreeLoss| |guessDegree| D
            |options| |vs| $))))) 

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
         ((#3=#:G1364 NIL) (|reslist| (|List| EXPRR)) (|res| (EXPRR))
          (#4=#:G1366 NIL) (|i| NIL) (|exprList| (|List| EXPRR))
          (MS (|Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
          (M (|Matrix| (|SparseUnivariatePolynomial| S))) (#5=#:G1362 NIL)
          (#6=#:G1344 NIL) (#7=#:G1365 NIL) (#8=#:G1359 NIL) (#9=#:G1307 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|guessDegree| #10=(|Integer|)) (|degreeLoss| (|Integer|))
          (#11=#:G1363 NIL) (#12=#:G1298 NIL) (|o| NIL) (|exprS| #2#)
          (#13=#:G1358 NIL) (|dk| (|Symbol|)) (|degreeS| #1#)
          (|op| (|BasicOperator|)) (|listDegree| #10#) (|list| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |reslist| NIL . #14=(|GUESS;guessHPaux|))
                (LETT |list| (|SPADfirst| |lists|) . #14#)
                (LETT |listDegree|
                      (- (- (LENGTH |list|) 1)
                         (SPADCALL |options| (QREFELT $ 510)))
                      . #14#)
                (COND
                 ((< |listDegree| 0)
                  (PROGN (LETT #3# |reslist| . #14#) (GO #15=#:G1357))))
                (LETT |op|
                      (SPADCALL (SPADCALL |options| (QREFELT $ 511))
                                (QREFELT $ 512))
                      . #14#)
                (LETT |degreeS| (QVELT D 0) . #14#)
                (LETT |dk| (SPADCALL |options| (QREFELT $ 254)) . #14#)
                (LETT |exprS|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |dk| '|displayAsGF|)
                              (EQUAL |dk| '|displayAsEQ|))
                          (SPADCALL
                           (SPADCALL |op|
                                     (SPADCALL
                                      (SPADCALL |options| (QREFELT $ 440))
                                      (QREFELT $ 43))
                                     (QREFELT $ 513))
                           (SPADCALL |options| (QREFELT $ 440)) (QVELT D 4)))
                         ((EQUAL |dk| '|displayAsRec|)
                          (PROGN
                           (LETT #13#
                                 (SPADCALL
                                  (SPADCALL |op|
                                            (SPADCALL
                                             (SPADCALL |options|
                                                       (QREFELT $ 56))
                                             (QREFELT $ 43))
                                            (QREFELT $ 513))
                                  (SPADCALL |options| (QREFELT $ 56))
                                  (QVELT D 4))
                                 . #14#)
                           (GO #16=#:G1297)))))
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
                                        (|check_subtype| (>= #12# 0)
                                                         '(|NonNegativeInteger|)
                                                         #12#))
                                      (QREFELT $ 514))
                            (QREFELT $ 515))
                           (PROGN
                            (LETT #11# |$NoValue| . #14#)
                            (GO #17=#:G1355)))
                          ('T
                           (SEQ
                            (LETT |degreeLoss|
                                  (SPADCALL |degreeS| |o| (QREFELT $ 318))
                                  . #14#)
                            (LETT |guessDegree|
                                  (- (- (+ |listDegree| 2) |degreeLoss|) |o|)
                                  . #14#)
                            (COND
                             ((< |guessDegree| 0)
                              (SEQ
                               (COND
                                ((SPADCALL |options| (QREFELT $ 58))
                                 (SPADCALL
                                  "Guess: not enough values for guessing"
                                  (QREFELT $ 74))))
                               (EXIT
                                (PROGN
                                 (LETT #3# |reslist| . #14#)
                                 (GO #15#))))))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 58))
                              (SPADCALL
                               (SPADCALL
                                (LIST "Guess: trying order "
                                      (SPADCALL |o| (QREFELT $ 516))
                                      ", guessDegree is "
                                      (SPADCALL |guessDegree| (QREFELT $ 438)))
                                (QREFELT $ 517))
                               (QREFELT $ 64))))
                            (LETT |maxD| (SPADCALL |options| (QREFELT $ 450))
                                  . #14#)
                            (EXIT
                             (COND
                              ((QEQCAR |maxD| 0)
                               (COND
                                ((OR
                                  (OR
                                   (SPADCALL
                                    (SPADCALL |degreeS| |o| (QREFELT $ 514))
                                    (QREFELT $ 515))
                                   (NULL
                                    (< (* (QCDR |maxD|) |o|) |guessDegree|)))
                                  (NULL
                                   (SPADCALL (* (QCDR |maxD|) (+ |o| 1))
                                             (-
                                              (- (+ |listDegree| 2)
                                                 (SPADCALL |degreeS| (+ |o| 1)
                                                           (QREFELT $ 318)))
                                              (+ |o| 1))
                                             (QREFELT $ 207))))
                                 (SEQ (LETT |exprList| NIL . #14#)
                                      (COND
                                       ((SPADCALL |options| (QREFELT $ 58))
                                        (SEQ
                                         (LETT |exprList|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |exprS| |o|
                                                           (QREFELT $ 518))
                                                 (QREFELT $ 519))
                                                (QREFELT $ 520))
                                               . #14#)
                                         (SPADCALL
                                          #18="Guess: The list of expressions is"
                                          (QREFELT $ 74))
                                         (EXIT
                                          (SPADCALL
                                           (SPADCALL |exprList|
                                                     (QREFELT $ 521))
                                           (QREFELT $ 64))))))
                                      (LETT MS
                                            (|GUESS;guessInterpolate2| |lists|
                                             |o| |degreeLoss|
                                             (PROG1
                                                 (LETT #9# |guessDegree|
                                                       . #14#)
                                               (|check_subtype| (>= #9# 0)
                                                                '(|NonNegativeInteger|)
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
                                                 ((SPADCALL MS (QREFELT $ 522))
                                                  (PROGN
                                                   (LETT #8# |$NoValue| . #14#)
                                                   (GO #19=#:G1314)))
                                                 ('T
                                                  (SEQ
                                                   (LETT M
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            523))
                                                         . #14#)
                                                   (LETT MS
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            524))
                                                         . #14#)
                                                   (COND
                                                    ((NULL |exprList|)
                                                     (LETT |exprList|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |exprS|
                                                                       |o|
                                                                       (QREFELT
                                                                        $ 518))
                                                             (QREFELT $ 519))
                                                            (QREFELT $ 520))
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
                                                                            477))
                                                                 (QREFELT $
                                                                          478))
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
                                                                        103)))
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
                                                                           69))
                                                        (PROGN
                                                         (LETT #3# |reslist|
                                                               . #14#)
                                                         (GO #15#))))))))))))
                                              NIL (GO G190) G191 (EXIT NIL)))
                                        #19# (EXIT #8#)))))
                                ('T
                                 (SEQ (|spadConstant| $ 65)
                                      (EXIT
                                       (COND
                                        ((SPADCALL |options| (QREFELT $ 58))
                                         (SPADCALL "Guess: iterating"
                                                   (QREFELT $ 74)))))))))
                              ('T
                               (SEQ (LETT |exprList| NIL . #14#)
                                    (COND
                                     ((SPADCALL |options| (QREFELT $ 58))
                                      (SEQ
                                       (LETT |exprList|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |exprS| |o|
                                                         (QREFELT $ 518))
                                               (QREFELT $ 519))
                                              (QREFELT $ 520))
                                             . #14#)
                                       (SPADCALL #18# (QREFELT $ 74))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |exprList| (QREFELT $ 521))
                                         (QREFELT $ 64))))))
                                    (LETT MS
                                          (|GUESS;guessInterpolate2| |lists|
                                           |o| |degreeLoss|
                                           (PROG1
                                               (LETT #6# |guessDegree| . #14#)
                                             (|check_subtype| (>= #6# 0)
                                                              '(|NonNegativeInteger|)
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
                                               ((SPADCALL MS (QREFELT $ 522))
                                                (PROGN
                                                 (LETT #5# |$NoValue| . #14#)
                                                 (GO #20=#:G1351)))
                                               ('T
                                                (SEQ
                                                 (LETT M
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          523))
                                                       . #14#)
                                                 (LETT MS
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          524))
                                                       . #14#)
                                                 (COND
                                                  ((NULL |exprList|)
                                                   (LETT |exprList|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |exprS|
                                                                     |o|
                                                                     (QREFELT $
                                                                              518))
                                                           (QREFELT $ 519))
                                                          (QREFELT $ 520))
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
                                                                          477))
                                                               (QREFELT $ 478))
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
                                                                              103)))
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
                                                                (QREFELT $ 69))
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
         ((#1=#:G1416 NIL) (#2=#:G1410 NIL) (#3=#:G1408 NIL) (#4=#:G1419 NIL)
          (#5=#:G1374 NIL) (|i| NIL) (#6=#:G1418 NIL)
          (|minP| (|PositiveInteger|))
          (|hom?| (|Union| (|PositiveInteger|) (|Boolean|))) (#7=#:G1383 NIL)
          (#8=#:G1417 NIL) (|maxSomos| (|PositiveInteger|)) (#9=#:G1368 NIL)
          (#10=#:G1379 NIL) (#11=#:G1377 NIL) (|maxD| (|NonNegativeInteger|))
          (#12=#:G1371 NIL) (|Som?| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |Som?| (SPADCALL |options| (QREFELT $ 118))
                   . #13=(|GUESS;processOptions|))
             (EXIT
              (COND
               ((QEQCAR |Som?| 1)
                (COND
                 ((QCDR |Som?|)
                  (SEQ
                   (LETT |maxD|
                         (PROG2
                             (LETT #12# (SPADCALL |options| (QREFELT $ 117))
                                   . #13#)
                             (QCDR #12#)
                           (|check_union| (QEQCAR #12# 0)
                                          (|NonNegativeInteger|) #12#))
                         . #13#)
                   (COND
                    ((QEQCAR (SPADCALL |options| (QREFELT $ 114)) 0)
                     (LETT |maxSomos|
                           (*
                            (PROG1 (LETT #11# |maxD| . #13#)
                              (|check_subtype| (> #11# 0) '(|PositiveInteger|)
                                               #11#))
                            (PROG2
                                (LETT #5# (SPADCALL |options| (QREFELT $ 114))
                                      . #13#)
                                (QCDR #5#)
                              (|check_union| (QEQCAR #5# 0) (|PositiveInteger|)
                                             #5#)))
                           . #13#))
                    ((QEQCAR (SPADCALL |options| (QREFELT $ 116)) 0)
                     (LETT |maxSomos|
                           (*
                            (PROG1 (LETT #10# |maxD| . #13#)
                              (|check_subtype| (> #10# 0) '(|PositiveInteger|)
                                               #10#))
                            (PROG2
                                (LETT #9# (SPADCALL |options| (QREFELT $ 116))
                                      . #13#)
                                (QCDR #9#)
                              (|check_union| (QEQCAR #9# 0) (|PositiveInteger|)
                                             #9#)))
                           . #13#))
                    (#14='T
                     (|error| "Guess: internal error - inconsistent options")))
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (PROGN
                             (LETT #8# NIL . #13#)
                             (SEQ (LETT |i| 2 . #13#) G190
                                  (COND
                                   ((|greater_SI| |i| |maxSomos|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8#
                                          (CONS
                                           (|GUESS;processOptions|
                                            (CONS
                                             (SPADCALL
                                              (CONS 0
                                                    (PROG1
                                                        (LETT #7# |i| . #13#)
                                                      (|check_subtype|
                                                       (> #7# 0)
                                                       '(|PositiveInteger|)
                                                       #7#)))
                                              (QREFELT $ 525))
                                             |options|)
                                            $)
                                           #8#)
                                          . #13#)))
                                  (LETT |i| (|inc_SI| |i|) . #13#) (GO G190)
                                  G191 (EXIT (NREVERSE #8#))))
                            (QREFELT $ 527))
                           . #13#)
                     (GO #15=#:G1415))))))))))
            (SEQ (LETT |hom?| (SPADCALL |options| (QREFELT $ 116)) . #13#)
                 (EXIT
                  (COND
                   ((QEQCAR |hom?| 1)
                    (COND
                     ((QCDR |hom?|)
                      (SEQ
                       (COND
                        ((QEQCAR (SPADCALL |options| (QREFELT $ 118)) 0)
                         (LETT |minP| 2 . #13#))
                        (#14# (LETT |minP| 1 . #13#)))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #6# NIL . #13#)
                                (SEQ (LETT |i| |minP| . #13#)
                                     (LETT #4#
                                           (PROG2
                                               (LETT #5#
                                                     (SPADCALL |options|
                                                               (QREFELT $ 114))
                                                     . #13#)
                                               (QCDR #5#)
                                             (|check_union| (QEQCAR #5# 0)
                                                            (|PositiveInteger|)
                                                            #5#))
                                           . #13#)
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
                                                                 . #13#)
                                                         (|check_subtype|
                                                          (> #3# 0)
                                                          '(|PositiveInteger|)
                                                          #3#)))
                                                 (QREFELT $ 528))
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1
                                                           (LETT #2# |i|
                                                                 . #13#)
                                                         (|check_subtype|
                                                          (> #2# 0)
                                                          '(|PositiveInteger|)
                                                          #2#)))
                                                 (QREFELT $ 529)))
                                               |options| (QREFELT $ 530))
                                              #6#)
                                             . #13#)))
                                     (LETT |i| (+ |i| 1) . #13#) (GO G190) G191
                                     (EXIT (NREVERSE #6#))))
                               . #13#)
                         (GO #15#))))))))))
            (EXIT (LIST |options|))))
          #15# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LLL;102|
        ((|lists| |List| (|List| F)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1435 NIL) (|res| (|List| EXPRR))
          (#2=#:G1437 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))) (#3=#:G1425 NIL)
          (#4=#:G1434 NIL) (#5=#:G1436 NIL) (|li| NIL)
          (|nn| (|NonNegativeInteger|)) (|rl| (|List| (|List| F)))
          (|l| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 531))
                (EXIT
                 (COND
                  ((NULL |lists|)
                   (|error| "guessAlgDep: need at least one list"))
                  ('T
                   (SEQ
                    (LETT |l| (|SPADfirst| |lists|)
                          . #6=(|GUESS;guessAlgDep;LLL;102|))
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
                              ((SPADCALL (LENGTH |li|) |nn| (QREFELT $ 199))
                               (PROGN
                                (LETT #4#
                                      (|error|
                                       "guessAlgDep: lists must have equal length")
                                      . #6#)
                                (GO #7=#:G1421))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL)))
                     #7# (EXIT #4#))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (APPEND
                            (LIST (SPADCALL '|displayAsEQ| (QREFELT $ 532))
                                  (SPADCALL
                                   (CONS 0
                                         (PROG1
                                             (LETT #3# (LENGTH |lists|) . #6#)
                                           (|check_subtype| (> #3# 0)
                                                            '(|PositiveInteger|)
                                                            #3#)))
                                   (QREFELT $ 533)))
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
                                 (SPADCALL |lists| |opts| (QREFELT $ 281))
                                 |opts| $)
                                . #6#)
                          (COND
                           ((NULL (NULL |res|))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 69))
                              (PROGN
                               (LETT #1# |res| . #6#)
                               (GO #8=#:G1433))))))
                          (EXIT (LETT |lres| (APPEND |res| |lres|) . #6#)))
                         (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |lres|))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LL;103|
        ((|lists| |List| (|List| F)) ($ |List| EXPRR))
        (SPADCALL |lists| NIL (QREFELT $ 534))) 

(SDEFUN |GUESS;guessADE;LLL;104|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1446 NIL) (|res| (|List| EXPRR))
          (#2=#:G1447 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 531))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 532))
                             |options|)
                       $)
                      . #3=(|GUESS;guessADE;LLL;104|))
                (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
                (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 270)) |opts| $)
                            . #3#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 69))
                          (PROGN (LETT #1# |res| . #3#) (GO #4=#:G1445))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GUESS;guessADE;LL;105| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 536))) 

(SDEFUN |GUESS;guessAlg;LLL;106|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 0) (QREFELT $ 538)) |options|)
                  (QREFELT $ 536))) 

(SDEFUN |GUESS;guessAlg;LL;107| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 539))) 

(SDEFUN |GUESS;guessHolo;LLL;108|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 529)) |options|)
                  (QREFELT $ 536))) 

(SDEFUN |GUESS;guessHolo;LL;109| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 541))) 

(SDEFUN |GUESS;guessPade;LLL;110|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 538))
                              (SPADCALL (CONS 0 1) (QREFELT $ 529)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 543))))
                       (QREFELT $ 544))
                      |GUESS;guessPade;LLL;110|)
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 536)))))) 

(SDEFUN |GUESS;guessPade;LL;111| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 545))) 

(SDEFUN |GUESS;guessFE;LLL;112|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1475 NIL) (|res| (|List| EXPRR))
          (#2=#:G1476 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 531))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 532))
                             |options|)
                       $)
                      . #3=(|GUESS;guessFE;LLL;112|))
                (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
                (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 285)) |opts| $)
                            . #3#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 69))
                          (PROGN (LETT #1# |res| . #3#) (GO #4=#:G1474))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GUESS;guessFE;LL;113| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 547))) 

(SDEFUN |GUESS;guessADE;SM;114|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessADE;SM;114!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessADE;SM;114!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessADE;SM;114|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#2=#:G1485 NIL) (|res| NIL) (#3=#:G1486 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 531))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsGF| (QREFELT $ 532))
                                     |options| (QREFELT $ 549))
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
                                           (SPADCALL |q| (QREFELT $ 297)))
                                 |opts| $)
                                NIL)
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 550)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 69))
                              (PROGN (LETT #2# |res| NIL) (GO #4=#:G1484))))))
                          (EXIT
                           (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 551))
                                 NIL)))
                         (LETT #3# (CDR #3#) NIL) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 552)))))
              #4# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessHolo;SM;115|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessHolo;SM;115!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessHolo;SM;115!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessHolo;SM;115|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 105))
                                 (QREFELT $ 529))
                       |z2| (QREFELT $ 549))
                      (SPADCALL |q| (QREFELT $ 553))))))) 

(SDEFUN |GUESS;guessRec;LLL;116|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1500 NIL) (|res| (|List| EXPRR))
          (#2=#:G1501 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 531))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsRec| (QREFELT $ 532))
                             |options|)
                       $)
                      . #3=(|GUESS;guessRec;LLL;116|))
                (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
                (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 322)) |opts| $)
                            . #3#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 69))
                          (PROGN (LETT #1# |res| . #3#) (GO #4=#:G1499))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GUESS;guessRec;LL;117| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 555))) 

(SDEFUN |GUESS;guessPRec;LLL;118|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 529)) |options|)
                  (QREFELT $ 555))) 

(SDEFUN |GUESS;guessPRec;LL;119| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 557))) 

(SDEFUN |GUESS;guessRat;LLL;120|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 559))
                              (SPADCALL (CONS 0 1) (QREFELT $ 529)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 543))))
                       (QREFELT $ 544))
                      |GUESS;guessRat;LLL;120|)
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 555)))))) 

(SDEFUN |GUESS;guessRat;LL;121| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 109))) 

(SDEFUN |GUESS;guessRec;SM;122|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessRec;SM;122!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessRec;SM;122!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessRec;SM;122|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#2=#:G1524 NIL) (|res| NIL) (#3=#:G1525 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 531))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsRec| (QREFELT $ 532))
                                     |options| (QREFELT $ 549))
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
                                           (SPADCALL |q| (QREFELT $ 371)))
                                 |opts| $)
                                NIL)
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 550)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 69))
                              (PROGN (LETT #2# |res| NIL) (GO #4=#:G1523))))))
                          (EXIT
                           (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 551))
                                 NIL)))
                         (LETT #3# (CDR #3#) NIL) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 552)))))
              #4# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessPRec;SM;123|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessPRec;SM;123!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessPRec;SM;123!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessPRec;SM;123|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 105))
                                 (QREFELT $ 529))
                       |z2| (QREFELT $ 549))
                      (SPADCALL |q| (QREFELT $ 561))))))) 

(SDEFUN |GUESS;guessRat;SM;124|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessRat;SM;124!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessRat;SM;124!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessRat;SM;124|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (LIST
                        (LIST
                         (SPADCALL (CONS 0 (|spadConstant| $ 144))
                                   (QREFELT $ 559))
                         (SPADCALL (CONS 0 (|spadConstant| $ 105))
                                   (QREFELT $ 529)))
                        |z2|
                        (LIST
                         (SPADCALL (|spadConstant| $ 563) (QREFELT $ 543))))
                       (QREFELT $ 544))
                      (SPADCALL |q| (QREFELT $ 561))))))) 

(DECLAIM (NOTINLINE |Guess;|)) 

(DEFUN |Guess| (&REST #1=#:G1540)
  (SPROG NIL
         (PROG (#2=#:G1541)
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
    (LETT $ (GETREFV 565) . #1#)
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
         (QSETREFV $ 297
                   (CONS (|dispatchFunction| |GUESS;diffHP;SM;62|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 371
                   (CONS (|dispatchFunction| |GUESS;shiftHP;SM;85|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 553 (CONS (|dispatchFunction| |GUESS;guessADE;SM;114|) $))
         (QSETREFV $ 554
                   (CONS (|dispatchFunction| |GUESS;guessHolo;SM;115|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 561 (CONS (|dispatchFunction| |GUESS;guessRec;SM;122|) $))
         (QSETREFV $ 562
                   (CONS (|dispatchFunction| |GUESS;guessPRec;SM;123|) $))
         (QSETREFV $ 564
                   (CONS (|dispatchFunction| |GUESS;guessRat;SM;124|) $)))))))
    $))) 

(MAKEPROP '|Guess| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|List| 8)
              (|List| 6) (|List| 85) (|GuessExpBin| 6 7 8 9 10)
              (0 . |guessExpRat|) |GUESS;guessExpRat;LL;1|
              |GUESS;guessExpRat;LLL;2| (6 . |guessBinRat|)
              |GUESS;guessBinRat;LL;3| |GUESS;guessBinRat;LLL;4|
              (|Mapping| 11 12 13) (|Symbol|) (12 . |guessExpRat|)
              (17 . |guessExpRat|) (22 . |guessBinRat|) (27 . |guessBinRat|)
              (|List| 22) (32 . |variables|) (|List| 27) (|Mapping| 27 7)
              (|List| 7) (|ListFunctions2| 7 27) (37 . |map|) (|Fraction| 7)
              (43 . |numer|) (48 . |denom|) (53 . |setUnion|) (|Mapping| 27 6)
              (|ListFunctions2| 6 27) (59 . |map|) (|Mapping| 27 27 27)
              (65 . |reduce|) (71 . |coerce|) (|Mapping| 8 22)
              (|ListFunctions2| 22 8) (76 . |map|) (82 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 7)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomialFunctions2| 7 6) (87 . |map|)
              (|Union| 126 '"arbitrary") (|GuessOptionFunctions0|)
              (93 . |maxLevel|) (98 . |indexName|) (|Boolean|) (103 . |debug|)
              (|OutputForm|) (108 . |coerce|) (113 . |hconcat|) (|Void|)
              (|OutputPackage|) (119 . |output|) (124 . |One|) (128 . |One|)
              (|PositiveInteger|) (132 . <=) (138 . |one|) (143 . |member?|)
              (149 . |Zero|) (153 . |member?|) (|String|) (159 . |output|)
              (|Integer|) (164 . |elt|) (170 . /) (176 . |one?|) (181 . |one?|)
              (|Mapping| 57 6) (186 . |every?|) (192 . |coerce|) (|List| 59)
              (197 . |subscript|) (|GuessOption|) (203 . |indexName|)
              (208 . |maxLevel|) (|List| 21) |GUESS;guess;LLLLL;9|
              (213 . |Zero|) (217 . |One|) (221 . -) (|Segment| 8)
              (227 . SEGMENT) (|SegmentBinding| 8) (233 . |equation|)
              (|SegmentBinding| $) (239 . |product|) (245 . |init|)
              (|Fraction| 48) (249 . |init|) (253 . *) (259 . |member?|)
              (265 . -) (271 . |One|) (275 . =) (281 . |summation|) (287 . +)
              |GUESS;guessRat;LLL;120| |GUESS;guess;LL;10| |GUESS;guess;LLL;11|
              |GUESS;guess;LLLL;12| (|Union| 67 '"arbitrary")
              (293 . |maxPower|) (|Union| 67 57) (298 . |homogeneous|)
              (303 . |maxDerivative|) (308 . |Somos|) (|Stream| 136)
              (|PartitionsAndPermutations|) (313 . |partitions|) (319 . |inc|)
              (|Mapping| 75 75) (|Stream| 75) (324 . |stream|)
              (|NonNegativeInteger|) (330 . +) (336 . |partitions|)
              (|Stream| 119) (|Mapping| 119 75) (|StreamFunctions2| 75 119)
              (343 . |map|) (349 . |partitions|) (|StreamFunctions1| 136)
              (354 . |concat|) (|List| 75) (359 . |cons|) (365 . |conjugates|)
              (370 . |#|) (375 . =) (|Mapping| 57 136) (381 . |select|)
              (387 . +) (393 . |Zero|) (|Mapping| 75 75 75) (397 . |reduce|)
              (404 . =) (|List| 136) (|Partition|) (410 . |powers|)
              (415 . |second|) (420 . ^) (|Mapping| 8 8 8) (426 . |reduce|)
              (|U32Vector|) (432 . |construct|)
              (|U32VectorPolynomialOperations|) (437 . |differentiate|)
              (444 . |pow|) (452 . |truncated_multiplication|)
              (|Mapping| 155 155 155) (|List| 155) (460 . |reduce|)
              (466 . |copy_first|) (|UnivariateFormalPowerSeries| 6) (473 . ^)
              (479 . *) (|Mapping| 165 165 165) (|List| 165) (485 . |reduce|)
              (491 . ^) (|Mapping| 6 6) (497 . |map|)
              (|UnivariateFormalPowerSeriesFunctions| 6) (503 . |hadamard|)
              (|SparseMultivariatePolynomial| 6 126) (509 . ^)
              (|Mapping| 176 176) (|UnivariateFormalPowerSeries| 176)
              (515 . |map|) (|UnivariateFormalPowerSeriesFunctions| 176)
              (521 . |hadamard|) (|Mapping| 179 179 179) (|List| 179)
              (527 . |reduce|) (|Stream| 165) (|Mapping| 165 136)
              (|StreamFunctions2| 136 165) (533 . |map|) (539 . |Zero|)
              (543 . |Zero|) (547 . |Zero|) (551 . |Zero|) (555 . |One|)
              (559 . |One|) (563 . |One|) (|Vector| 155) (567 . |setelt!|)
              (574 . ~=) (580 . |differentiate|) (586 . *) (|Fraction| 75)
              (592 . |One|) (596 . |One|) (|Vector| 179) (600 . |setelt!|)
              (607 . <=) (|Union| $ '"failed") (613 . |subtractIfCan|)
              (|List| 149) (619 . |position|) (625 . >) (|Reference| 210)
              (631 . |deref|) (636 . |coerce|) (641 . |partition|)
              (|Reference| 148) (646 . |deref|) (651 . |setref|)
              (657 . |setref|) (663 . |max|) (669 . |first|) (|Mapping| 75 136)
              (|ListFunctions2| 136 75) (674 . |map|) (680 . |reduce|)
              (686 . |ref|) (691 . |ref|) (696 . |#|) (701 . |One|)
              (705 . |first|) (710 . |vector|) (715 . |vector|) (|Stream| 8)
              (|Mapping| 8 136) (|StreamFunctions2| 136 8) (720 . |map|)
              (726 . |empty?|) (731 . -) (737 . |max|) (|Stream| 126)
              (|Mapping| 126 136 126) (|StreamFunctions2| 136 126)
              (743 . |scan|) (750 . D) (757 . D) (763 . D)
              (|FractionFreeFastGaussian| 7 50) (769 . |DiffAction|)
              (|FractionFreeFastGaussian| 176 179) (776 . |DiffAction|)
              (783 . |DiffC|) (788 . |maxMixedDegree|) (793 . |displayKind|)
              (798 . |first|) (804 . |complete|) (809 . |entries|)
              (814 . |elt|) (|Mapping| 186 165) (|Mapping| 197 162 75 75)
              (|Mapping| 260 126) (|Mapping| 205 179) (|Mapping| 262 359)
              (|Mapping| 234 8 22) (|Mapping| 7 126 126 50)
              (|Mapping| 176 126 126 179) (|Mapping| 8 126 22 8)
              (|Mapping| 31 126)
              (|Record| (|:| |degreeStream| 241) (|:| |guessStream| 259)
                        (|:| |guessModGen| 261) (|:| |testGen| 263)
                        (|:| |exprStream| 264) (|:| |kind| 22) (|:| |qvar| 22)
                        (|:| A 265) (|:| AF 266) (|:| AX 267) (|:| C 268))
              |GUESS;diffHP;LR;47| (820 . |elt|) (826 . |functionNames|)
              (831 . >) (837 . ~=) (843 . |coerce|) (848 . ~=) (|List| 12)
              (854 . |elt|) (|Mapping| 126 136) (860 . |map|)
              |GUESS;algDepHP;LLR;51| (866 . |eval|)
              (873 . |multiplyExponents|) (879 . |multiplyExponents|)
              |GUESS;substHP;LR;55| (885 . |coerce|) (890 . *) (|Mapping| 6 75)
              (896 . |multiplyCoefficients|) (902 . |Zero|) (906 . |coerce|)
              (|Mapping| 176 75) (911 . |multiplyCoefficients|) (917 . |zero?|)
              (922 . =) (|Mapping| 269 13) (928 . |diffHP|) (933 . |coerce|)
              (938 . |factorial|) (943 . /) (949 . |quoByVar|)
              (|Mapping| 165 165) (|MappingPackage1| 165) (954 . ^)
              (960 . |quoByVar|) (|Mapping| 179 179) (|MappingPackage1| 179)
              (965 . ^) (|IntegerCombinatoricFunctions| 75) (971 . |stirling2|)
              (977 . |ShiftAction|) (984 . |ShiftAction|) (991 . |ShiftC|)
              (996 . |monomial|) (1002 . -) (1008 . -) (1013 . ^)
              (1019 . |elt|) (1025 . |monomial|) (1031 . -) (1037 . ^)
              |GUESS;shiftHP;LR;72| (1043 . *) (1049 . ^) (1055 . |coerce|)
              (1060 . |qShiftAction|) (1068 . |qShiftAction|)
              (1076 . |qShiftC|) (1082 . *) (1088 . |elt|) (|Mapping| 169 165)
              (|StreamTensor| 165) (1094 . |tensorMap|) (1100 . |#|)
              (1105 . |new|) (|SingleInteger|) (1111 . |One|) (1115 . ^)
              (1121 . |rem|) (1127 . |setelt!|) (1134 . /) (1140 . |ceiling|)
              (1145 . |rest|) (1150 . |copy|) (1155 . |elt|) (1161 . |cons|)
              (1167 . |reverse!|) (|List| 197) (1172 . |cons|) (1178 . |rem|)
              (1184 . -) (1189 . |reverse!|) (|List| $) (1194 . |concat|)
              (1199 . |Zero|) (|Mapping| 365 126) (|StreamTensor| 126)
              (1203 . |tensorMap|) (|List| 67) (1209 . |first|) (1214 . >)
              (1220 . *) (1226 . |elt|) (1232 . |concat|) (|List| 126)
              (1238 . |cons|) (1244 . |reverse!|) (|Mapping| 11 8)
              (|StreamTensor| 8) (1249 . |tensorMap|) (1255 . |shiftHP|)
              (1260 . |zero?|) (1265 . |leadingCoefficient|) (1270 . |degree|)
              (1275 . |reductum|) (|Stream| 6) (1280 . |coerce|)
              (1285 . |series|) (|List| 176) (|Stream| 176) (1290 . |coerce|)
              (|IndexedExponents| 126) (1295 . |monomial|) (1301 . |monomial|)
              (|StreamFunctions2| 75 176) (1307 . |map|) (1313 . |concat|)
              (1319 . |series|) (|SparseUnivariatePolynomial| 176)
              (|Mapping| 176 6) (|SparseUnivariatePolynomialFunctions2| 6 176)
              (1324 . |map|) (|UnivariatePolynomial| (NRTEVAL '|x|) 6)
              (1330 . |univariatePolynomial|) (1336 . |makeSUP|) (|List| 48)
              (|Mapping| 48 165) (|ListFunctions2| 165 48) (1341 . |map|)
              (|List| 50) (|Vector| 50) (1347 . |vector|) (|Vector| 6)
              (1352 . |vector|) (1357 . |checkExtraValues|)
              (|SingletonAsOrderedSet|) (1362 . |create|) (1366 . |coerce|)
              (1371 . |elt|) (1377 . |eval|) (1384 . |retract|) (1389 . |elt|)
              (1395 . |gcd|) (1401 . |exquo|) (1407 . *) (1413 . +) (1419 . ~=)
              (1425 . *) (1431 . +) (1437 . ~=) (|Vector| 7) (1443 . |elt|)
              (1449 . |elt|) (1455 . |zero?|) (1460 . |zero?|) (1465 . |zero?|)
              (1470 . |zero?|) (1475 . |zero?|) (1480 . |zero?|)
              (1485 . |zero?|) (1490 . *) (|List| 389) (|Vector| 389)
              (1496 . |vector|) (1501 . |generalCoefficient|) (1509 . |zero?|)
              (1514 . |print|) (1519 . |coerce|) (1524 . |ground?|)
              (1529 . |variableName|) (1534 . |numerator|) (|Mapping| 8 6)
              (|StreamFunctions2| 6 8) (1539 . |map|) (|BasicOperator|)
              (|RecurrenceOperator| 75 8) (1545 . |makeFEq|) (1555 . |makeRec|)
              (1564 . |allDegrees|) (1569 . |maxDegree|) (1574 . <=)
              (|Union| '"skip" '"MonteCarlo" '"deterministic") (1580 . |check|)
              (|Union| '"good" '"reject" '"no_solution") (|Mapping| 454 400)
              (|ModularHermitePadeSolver| 6 7) (1585 . |gen_Monte_Carlo_check|)
              (|Union| 471 57) (1595 . |HP_solve|) (1606 . |elt|)
              (1612 . |setelt!|) (1619 . +) (1625 . +) (1631 . +) (1637 . +)
              (|Mapping| 126 126 126) (1643 . |reduce|) (1649 . |first|)
              (1655 . |complete|) (1660 . |entries|) (|Matrix| 50)
              (1665 . |generalInterpolation|) (|Vector| 48) (1673 . |vector|)
              (|FractionFreeFastGaussianFractions| 7 50 48)
              (1678 . |generalInterpolation|) (1686 . |column|)
              (1692 . |entries|) (1697 . |Zero|) (1701 . |elt|)
              (1708 . |leadingCoefficient|) (1713 . |content|) (1718 . |gcd|)
              (1723 . |exquo|) (1729 . |setelt!|) (1737 . |explicitlyEmpty?|)
              (|Stream| 471) (1742 . |empty|) (1746 . |empty?|) (1751 . |frst|)
              (1756 . |Zero|) (1760 . |Zero|) (1764 . >=) (|Mapping| 57 75)
              (1770 . |every?|) (1776 . |rst|) (1781 . |concat|) (|Mapping| $)
              (1787 . |delay|) (|Mapping| 75 126) (|ListFunctions2| 126 75)
              (1792 . |map|) (|Stream| 365) (1798 . |genVectorStream|)
              (|Mapping| 136 365) (|StreamFunctions2| 365 136) (1805 . |map|)
              (1811 . |empty|) (1815 . |concat|) (1821 . |safety|)
              (1826 . |functionName|) (1831 . |operator|) (1836 . |elt|)
              (1842 . |rest|) (1848 . |empty?|) (1853 . |coerce|)
              (1858 . |hconcat|) (1863 . |first|) (1869 . |complete|)
              (1874 . |entries|) (1879 . |coerce|) (1884 . |empty?|)
              (1889 . |first|) (1894 . |rst|) (1899 . |Somos|) (|List| 13)
              (1904 . |concat|) (1909 . |homogeneous|) (1914 . |maxPower|)
              (1919 . |concat|) (1925 . |checkOptions|) (1930 . |displayKind|)
              (1935 . |maxSubst|) |GUESS;guessAlgDep;LLL;102|
              |GUESS;guessAlgDep;LL;103| |GUESS;guessADE;LLL;104|
              |GUESS;guessADE;LL;105| (1940 . |maxDerivative|)
              |GUESS;guessAlg;LLL;106| |GUESS;guessAlg;LL;107|
              |GUESS;guessHolo;LLL;108| |GUESS;guessHolo;LL;109|
              (1945 . |allDegrees|) (1950 . |concat|) |GUESS;guessPade;LLL;110|
              |GUESS;guessPade;LL;111| |GUESS;guessFE;LLL;112|
              |GUESS;guessFE;LL;113| (1955 . |cons|) (1961 . |empty?|)
              (1966 . |append|) (1972 . |reverse!|) (1977 . |guessADE|)
              (1982 . |guessHolo|) |GUESS;guessRec;LLL;116|
              |GUESS;guessRec;LL;117| |GUESS;guessPRec;LLL;118|
              |GUESS;guessPRec;LL;119| (1987 . |maxShift|)
              |GUESS;guessRat;LL;121| (1992 . |guessRec|) (1997 . |guessPRec|)
              (2002 . |true|) (2006 . |guessRat|))
           '#(|substHP| 2011 |shiftHP| 2016 |guessRec| 2026 |guessRat| 2042
              |guessPade| 2058 |guessPRec| 2069 |guessHolo| 2085 |guessFE| 2101
              |guessExpRat| 2112 |guessBinRat| 2128 |guessAlgDep| 2144
              |guessAlg| 2155 |guessADE| 2166 |guess| 2182 |diffHP| 2208
              |algDepHP| 2218)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 564
                                                 '(2 14 11 12 13 15 2 14 11 12
                                                   13 18 1 14 21 22 23 1 0 21
                                                   22 24 1 14 21 22 25 1 0 21
                                                   22 26 1 7 27 0 28 2 32 29 30
                                                   31 33 1 34 7 0 35 1 34 7 0
                                                   36 2 27 0 0 0 37 2 39 29 38
                                                   12 40 2 29 27 41 0 42 1 8 0
                                                   22 43 2 45 11 44 27 46 1 34
                                                   0 7 47 2 51 48 49 50 52 1 54
                                                   53 13 55 1 54 22 13 56 1 54
                                                   57 13 58 1 53 59 0 60 2 59 0
                                                   0 0 61 1 63 62 59 64 0 6 0
                                                   65 0 7 0 66 2 67 57 0 0 68 1
                                                   54 57 13 69 2 27 57 22 0 70
                                                   0 6 0 71 2 12 57 6 0 72 1 63
                                                   62 73 74 2 12 6 0 75 76 2 6
                                                   0 0 0 77 1 8 57 0 78 1 6 57
                                                   0 79 2 12 57 80 0 81 1 67 59
                                                   0 82 2 22 0 0 83 84 1 85 0
                                                   22 86 1 85 0 53 87 0 8 0 90
                                                   0 8 0 91 2 8 0 0 0 92 2 93 0
                                                   8 8 94 2 95 0 22 93 96 2 8 0
                                                   0 97 98 0 48 0 99 0 100 0
                                                   101 2 8 0 0 0 102 2 11 57 8
                                                   0 103 2 6 0 0 0 104 0 67 0
                                                   105 2 6 57 0 0 106 2 8 0 0
                                                   97 107 2 8 0 0 0 108 1 54
                                                   113 13 114 1 54 115 13 116 1
                                                   54 53 13 117 1 54 115 13 118
                                                   2 120 119 75 75 121 1 75 0 0
                                                   122 2 124 0 123 75 125 2 126
                                                   0 0 0 127 3 120 119 75 75 75
                                                   128 2 131 129 130 124 132 1
                                                   120 119 75 133 1 134 119 129
                                                   135 2 119 0 136 0 137 1 120
                                                   119 119 138 1 136 126 0 139
                                                   2 126 57 0 0 140 2 119 0 141
                                                   0 142 2 75 0 0 0 143 0 126 0
                                                   144 3 136 75 145 0 75 146 2
                                                   75 57 0 0 147 1 149 148 136
                                                   150 1 136 75 0 151 2 8 0 0
                                                   126 152 2 11 8 153 0 154 1
                                                   155 0 136 156 3 157 155 155
                                                   126 75 158 4 157 155 155 67
                                                   126 75 159 4 157 155 155 155
                                                   75 75 160 2 162 155 161 0
                                                   163 3 157 62 155 155 75 164
                                                   2 165 0 0 126 166 2 165 0 0
                                                   0 167 2 169 165 168 0 170 2
                                                   6 0 0 126 171 2 165 0 172 0
                                                   173 2 174 165 165 165 175 2
                                                   176 0 0 126 177 2 179 0 178
                                                   0 180 2 181 179 179 179 182
                                                   2 184 179 183 0 185 2 188
                                                   186 187 119 189 0 7 0 190 0
                                                   48 0 191 0 165 0 192 0 179 0
                                                   193 0 48 0 194 0 165 0 195 0
                                                   179 0 196 3 197 155 0 75 155
                                                   198 2 126 57 0 0 199 2 157
                                                   155 155 75 200 2 179 0 0 0
                                                   201 0 202 0 203 0 176 0 204
                                                   3 205 179 0 75 179 206 2 75
                                                   57 0 0 207 2 149 208 0 0 209
                                                   2 210 75 149 0 211 2 75 57 0
                                                   0 212 1 213 210 0 214 1 149
                                                   136 0 215 1 149 0 136 216 1
                                                   217 148 0 218 2 217 148 0
                                                   148 219 2 213 210 0 210 220
                                                   2 75 0 0 0 221 1 136 75 0
                                                   222 2 224 136 223 148 225 2
                                                   136 75 145 0 226 1 217 0 148
                                                   227 1 213 0 210 228 1 162
                                                   126 0 229 0 126 0 230 1 162
                                                   155 0 231 1 197 0 162 232 1
                                                   205 0 184 233 2 236 234 235
                                                   119 237 1 136 57 0 238 2 75
                                                   0 0 0 239 2 126 0 0 0 240 3
                                                   243 241 126 242 119 244 3 8
                                                   0 0 22 126 245 2 165 0 0 126
                                                   246 2 179 0 0 126 247 3 248
                                                   7 126 126 50 249 3 250 176
                                                   126 126 179 251 1 248 31 126
                                                   252 1 54 126 13 253 1 54 22
                                                   13 254 2 119 0 0 126 255 1
                                                   119 0 0 256 1 119 148 0 257
                                                   2 119 136 0 75 258 2 11 8 0
                                                   75 271 1 54 27 13 272 2 126
                                                   57 0 0 273 2 75 57 0 0 274 1
                                                   22 0 73 275 2 22 57 0 0 276
                                                   2 277 12 0 75 278 2 243 241
                                                   279 119 280 3 8 0 0 0 0 282
                                                   2 165 0 0 67 283 2 179 0 0
                                                   67 284 1 6 0 22 286 2 75 0
                                                   126 0 287 2 165 0 288 0 289
                                                   0 176 0 290 1 176 0 6 291 2
                                                   179 0 292 0 293 1 75 57 0
                                                   294 2 22 57 0 0 295 1 0 296
                                                   22 297 1 8 0 75 298 1 75 0 0
                                                   299 2 8 0 0 0 300 1 165 0 0
                                                   301 2 303 302 302 126 304 1
                                                   179 0 0 305 2 307 306 306
                                                   126 308 2 309 75 75 75 310 3
                                                   248 7 126 126 50 311 3 250
                                                   176 126 126 179 312 1 248 31
                                                   126 313 2 165 0 6 126 314 2
                                                   165 0 0 0 315 1 202 0 0 316
                                                   2 165 0 0 202 317 2 241 126
                                                   0 75 318 2 179 0 176 126 319
                                                   2 179 0 0 0 320 2 179 0 0
                                                   202 321 2 8 0 126 0 323 2 8
                                                   0 0 0 324 1 7 0 22 325 4 248
                                                   7 7 126 126 50 326 4 250 176
                                                   176 126 126 179 327 2 248 31
                                                   7 126 328 2 165 0 6 0 329 2
                                                   165 0 0 0 330 2 332 186 186
                                                   331 333 1 155 126 0 334 2
                                                   155 0 126 75 335 0 336 0 337
                                                   2 75 0 0 126 338 2 75 0 0 0
                                                   339 3 155 75 0 75 75 340 2
                                                   202 0 75 75 341 1 202 75 0
                                                   342 1 162 0 0 343 1 155 0 0
                                                   344 2 155 75 0 75 345 2 162
                                                   0 155 0 346 1 162 0 0 347 2
                                                   348 0 197 0 349 2 126 0 0 0
                                                   350 1 336 0 0 351 1 348 0 0
                                                   352 1 197 0 353 354 0 336 0
                                                   355 2 357 241 241 356 358 1
                                                   359 67 0 360 2 67 57 0 0 361
                                                   2 179 0 176 0 362 2 179 0 0
                                                   0 363 2 184 0 0 0 364 2 365
                                                   0 126 0 366 1 184 0 0 367 2
                                                   369 234 234 368 370 1 0 296
                                                   22 371 1 48 57 0 372 1 48 6
                                                   0 373 1 48 126 0 374 1 48 0
                                                   0 375 1 376 0 12 377 1 165 0
                                                   376 378 1 380 0 379 381 2
                                                   382 0 126 126 383 2 176 0 6
                                                   382 384 2 385 380 292 124
                                                   386 2 380 0 0 0 387 1 179 0
                                                   380 388 2 391 389 390 48 392
                                                   2 165 393 0 126 394 1 393 48
                                                   0 395 2 398 396 397 169 399
                                                   1 401 0 400 402 1 403 0 12
                                                   404 1 54 57 13 405 0 406 0
                                                   407 1 7 0 75 408 2 401 50 0
                                                   75 409 3 50 0 0 406 7 410 1
                                                   50 7 0 411 2 403 6 0 75 412
                                                   2 7 0 0 0 413 2 7 208 0 0
                                                   414 2 7 0 0 0 415 2 7 0 0 0
                                                   416 2 7 57 0 0 417 2 34 0 7
                                                   0 418 2 34 0 0 0 419 2 34 57
                                                   0 0 420 2 421 7 0 75 422 2
                                                   400 50 0 75 423 1 50 57 0
                                                   424 1 8 57 0 425 1 165 57 0
                                                   426 1 179 57 0 427 1 126 57
                                                   0 428 1 7 57 0 429 1 6 57 0
                                                   430 2 126 0 67 0 431 1 433 0
                                                   432 434 4 250 176 266 205
                                                   126 433 435 1 176 57 0 436 1
                                                   59 62 0 437 1 75 59 0 438 1
                                                   176 57 0 439 1 54 22 13 440
                                                   1 8 0 0 441 2 443 234 442
                                                   376 444 6 446 8 445 22 22 8
                                                   11 234 447 5 446 8 445 22 8
                                                   11 234 448 1 54 57 13 449 1
                                                   54 53 13 450 2 126 57 0 0
                                                   451 1 54 452 13 453 6 456
                                                   455 455 277 22 22 126 260
                                                   457 7 456 458 277 136 22 22
                                                   126 260 455 459 2 365 126 0
                                                   75 460 3 365 126 0 75 126
                                                   461 2 165 0 0 0 462 2 179 0
                                                   0 0 463 2 48 0 0 0 464 2 6 0
                                                   0 0 465 2 365 126 466 0 467
                                                   2 186 0 0 126 468 1 186 0 0
                                                   469 1 186 169 0 470 4 248
                                                   471 31 265 401 365 472 1 473
                                                   0 396 474 4 475 471 31 265
                                                   473 365 476 2 471 401 0 75
                                                   477 1 401 400 0 478 0 50 0
                                                   479 3 471 50 0 75 75 480 1
                                                   50 7 0 481 1 50 7 0 482 1 7
                                                   0 353 483 2 50 208 0 7 484 4
                                                   471 50 0 75 75 50 485 1 119
                                                   57 0 486 0 487 0 488 1 119
                                                   57 0 489 1 119 136 0 490 0
                                                   75 0 491 0 389 0 492 2 75 57
                                                   0 0 493 2 136 57 494 0 495 1
                                                   119 0 0 496 2 487 0 471 0
                                                   497 1 487 0 498 499 2 501
                                                   136 500 365 502 3 248 503
                                                   126 126 126 504 2 506 119
                                                   505 503 507 0 119 0 508 2
                                                   119 0 136 0 509 1 54 126 13
                                                   510 1 54 22 13 511 1 445 0
                                                   22 512 2 8 0 445 0 513 2 241
                                                   0 0 126 514 1 241 57 0 515 1
                                                   126 59 0 516 1 59 0 353 517
                                                   2 234 0 0 126 518 1 234 0 0
                                                   519 1 234 11 0 520 1 11 59 0
                                                   521 1 487 57 0 522 1 487 471
                                                   0 523 1 487 0 0 524 1 85 0
                                                   115 525 1 526 0 353 527 1 85
                                                   0 115 528 1 85 0 113 529 2
                                                   13 0 0 0 530 1 54 62 13 531
                                                   1 85 0 22 532 1 85 0 113 533
                                                   1 85 0 53 538 1 85 0 57 543
                                                   1 13 0 353 544 2 13 0 85 0
                                                   549 1 11 57 0 550 2 11 0 0 0
                                                   551 1 11 0 0 552 1 0 21 22
                                                   553 1 0 21 22 554 1 85 0 53
                                                   559 1 0 21 22 561 1 0 21 22
                                                   562 0 57 0 563 1 0 21 22 564
                                                   1 0 269 13 285 1 1 296 22
                                                   371 1 0 269 13 322 1 1 21 22
                                                   561 2 0 11 12 13 555 1 0 11
                                                   12 556 1 1 21 22 564 2 0 11
                                                   12 13 109 1 0 11 12 560 2 0
                                                   11 12 13 545 1 0 11 12 546 1
                                                   1 21 22 562 1 0 11 12 558 2
                                                   0 11 12 13 557 1 1 21 22 554
                                                   1 0 11 12 542 2 0 11 12 13
                                                   541 2 0 11 12 13 547 1 0 11
                                                   12 548 1 1 21 22 24 2 0 11
                                                   12 13 17 1 0 11 12 16 1 1 21
                                                   22 26 1 0 11 12 19 2 0 11 12
                                                   13 20 1 0 11 277 535 2 0 11
                                                   277 13 534 1 0 11 12 540 2 0
                                                   11 12 13 539 1 1 21 22 553 2
                                                   0 11 12 13 536 1 0 11 12 537
                                                   2 0 11 12 13 111 1 0 11 12
                                                   110 4 0 11 12 88 27 13 89 3
                                                   0 11 12 88 27 112 1 1 296 22
                                                   297 1 0 269 13 270 2 0 269
                                                   277 13 281)))))
           '|lookupComplete|)) 
