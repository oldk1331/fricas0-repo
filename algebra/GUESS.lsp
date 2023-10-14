
(SDEFUN |GUESS;ord1| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG
         ((#1=#:G271 NIL) (|k| NIL) (#2=#:G270 NIL) (|j| NIL) (#3=#:G269 NIL)
          (#4=#:G268 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (- (- (LENGTH |x|) 3) |i|) . #5=(|GUESS;ord1|))
              (EXIT
               (+
                (* (SPADCALL |x| (+ |n| 1) (QREFELT $ 15))
                   (SPADCALL (ELT $ 16)
                             (PROGN
                              (LETT #4# NIL . #5#)
                              (SEQ (LETT |j| 1 . #5#) G190
                                   (COND ((|greater_SI| |j| |n|) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL |x| |j| (QREFELT $ 15))
                                            #4#)
                                           . #5#)))
                                   (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                   G191 (EXIT (NREVERSE #4#))))
                             0 (QREFELT $ 18)))
                (SPADCALL 2
                          (SPADCALL (ELT $ 16)
                                    (PROGN
                                     (LETT #3# NIL . #5#)
                                     (SEQ (LETT |j| 1 . #5#) G190
                                          (COND
                                           ((|greater_SI| |j| |n|) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #3#
                                                  (CONS
                                                   (SPADCALL (ELT $ 16)
                                                             (PROGN
                                                              (LETT #2# NIL
                                                                    . #5#)
                                                              (SEQ
                                                               (LETT |k| 1
                                                                     . #5#)
                                                               (LETT #1#
                                                                     (- |j| 1)
                                                                     . #5#)
                                                               G190
                                                               (COND
                                                                ((|greater_SI|
                                                                  |k| #1#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #2#
                                                                       (CONS
                                                                        (*
                                                                         (SPADCALL
                                                                          |x|
                                                                          |k|
                                                                          (QREFELT
                                                                           $
                                                                           15))
                                                                         (SPADCALL
                                                                          |x|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           15)))
                                                                        #2#)
                                                                       . #5#)))
                                                               (LETT |k|
                                                                     (|inc_SI|
                                                                      |k|)
                                                                     . #5#)
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #2#))))
                                                             0 (QREFELT $ 18))
                                                   #3#)
                                                  . #5#)))
                                          (LETT |j| (|inc_SI| |j|) . #5#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #3#))))
                                    0 (QREFELT $ 18))
                          (QREFELT $ 20))))))) 

(SDEFUN |GUESS;ord2| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG ((|j| NIL) (#1=#:G278 NIL) (|n| (|Integer|)))
               (SEQ
                (COND
                 ((ZEROP |i|)
                  (SEQ
                   (LETT |n| (- (- (LENGTH |x|) 3) |i|) . #2=(|GUESS;ord2|))
                   (EXIT
                    (+ (|GUESS;ord1| |x| |i| $)
                       (*
                        (SPADCALL (ELT $ 16)
                                  (PROGN
                                   (LETT #1# NIL . #2#)
                                   (SEQ (LETT |j| 1 . #2#) G190
                                        (COND
                                         ((|greater_SI| |j| |n|) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #1#
                                                (CONS
                                                 (SPADCALL |x| |j|
                                                           (QREFELT $ 15))
                                                 #1#)
                                                . #2#)))
                                        (LETT |j| (|inc_SI| |j|) . #2#)
                                        (GO G190) G191 (EXIT (NREVERSE #1#))))
                                  0 (QREFELT $ 18))
                        (- (SPADCALL |x| (+ |n| 2) (QREFELT $ 15))
                           (SPADCALL |x| (+ |n| 1) (QREFELT $ 15))))))))
                 ('T (|GUESS;ord1| |x| |i| $)))))) 

(SDEFUN |GUESS;deg1| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG
         ((#1=#:G293 NIL) (|k| NIL) (#2=#:G292 NIL) (|j| NIL) (#3=#:G291 NIL)
          (#4=#:G290 NIL) (|m| (|Integer|)))
         (SEQ (LETT |m| (- (LENGTH |x|) 3) . #5=(|GUESS;deg1|))
              (EXIT
               (+
                (+
                 (*
                  (+
                   (+ (SPADCALL |x| (+ |m| 3) (QREFELT $ 15))
                      (SPADCALL |x| (+ |m| 1) (QREFELT $ 15)))
                   (SPADCALL |x| (+ 1 |i|) (QREFELT $ 15)))
                  (SPADCALL (ELT $ 16)
                            (PROGN
                             (LETT #4# NIL . #5#)
                             (SEQ (LETT |j| (+ 2 |i|) . #5#) G190
                                  (COND ((> |j| |m|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL |x| |j| (QREFELT $ 15))
                                           #4#)
                                          . #5#)))
                                  (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #4#))))
                            0 (QREFELT $ 18)))
                 (* (SPADCALL |x| (+ |m| 3) (QREFELT $ 15))
                    (SPADCALL |x| (+ |m| 1) (QREFELT $ 15))))
                (SPADCALL 2
                          (SPADCALL (ELT $ 16)
                                    (PROGN
                                     (LETT #3# NIL . #5#)
                                     (SEQ (LETT |j| (+ 2 |i|) . #5#) G190
                                          (COND ((> |j| |m|) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #3#
                                                  (CONS
                                                   (SPADCALL (ELT $ 16)
                                                             (PROGN
                                                              (LETT #2# NIL
                                                                    . #5#)
                                                              (SEQ
                                                               (LETT |k|
                                                                     (+ 2 |i|)
                                                                     . #5#)
                                                               (LETT #1#
                                                                     (- |j| 1)
                                                                     . #5#)
                                                               G190
                                                               (COND
                                                                ((> |k| #1#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #2#
                                                                       (CONS
                                                                        (*
                                                                         (SPADCALL
                                                                          |x|
                                                                          |k|
                                                                          (QREFELT
                                                                           $
                                                                           15))
                                                                         (SPADCALL
                                                                          |x|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           15)))
                                                                        #2#)
                                                                       . #5#)))
                                                               (LETT |k|
                                                                     (+ |k| 1)
                                                                     . #5#)
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #2#))))
                                                             0 (QREFELT $ 18))
                                                   #3#)
                                                  . #5#)))
                                          (LETT |j| (+ |j| 1) . #5#) (GO G190)
                                          G191 (EXIT (NREVERSE #3#))))
                                    0 (QREFELT $ 18))
                          (QREFELT $ 20))))))) 

(SDEFUN |GUESS;deg2| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG ((|j| NIL) (#1=#:G299 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (- (LENGTH |x|) 3) . #2=(|GUESS;deg2|))
                    (EXIT
                     (+ (|GUESS;deg1| |x| |i| $)
                        (*
                         (+ (SPADCALL |x| (+ |m| 3) (QREFELT $ 15))
                            (SPADCALL (ELT $ 16)
                                      (PROGN
                                       (LETT #1# NIL . #2#)
                                       (SEQ (LETT |j| (+ 2 |i|) . #2#) G190
                                            (COND ((> |j| |m|) (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #1#
                                                    (CONS
                                                     (SPADCALL |x| |j|
                                                               (QREFELT $ 15))
                                                     #1#)
                                                    . #2#)))
                                            (LETT |j| (+ |j| 1) . #2#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #1#))))
                                      0 (QREFELT $ 18)))
                         (- (SPADCALL |x| (+ |m| 2) (QREFELT $ 15))
                            (SPADCALL |x| (+ |m| 1) (QREFELT $ 15))))))))) 

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
                   (LETT |ll| (SPADCALL (ELT $ 22) |lF| (QREFELT $ 27)) . #1#))
                  ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
                   (LETT |ll|
                         (SPADCALL (CONS #'|GUESS;getVariables!0| $) |lF|
                                   (QREFELT $ 35))
                         . #1#))
                  (#2='T
                   (|error|
                    "Guess: type parameter F should be either equal to S or equal                             to Fraction S")))
                 (EXIT
                  (LETT |lvar| (SPADCALL (ELT $ 31) |ll| (QREFELT $ 37))
                        . #1#))))
               (#2# (LETT |lvar| NIL . #1#)))
              (EXIT (SPADCALL (ELT $ 39) |lvar| (QREFELT $ 43)))))) 

(SDEFUN |GUESS;getVariables!0| ((|g| NIL) ($ NIL))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 29)) (QREFELT $ 22))
                  (SPADCALL (SPADCALL |g| (QREFELT $ 30)) (QREFELT $ 22))
                  (QREFELT $ 31))) 

(SDEFUN |GUESS;checkResult|
        ((|res| EXPRR) (|n| |Symbol|) (|l| |Integer|) (|list| |List| F)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G309 NIL) (#2=#:G305 NIL) (|num| (EXPRR)) (#3=#:G304 NIL)
          (|den| (EXPRR)) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| |l| . #4=(|GUESS;checkResult|)) G190
                 (COND ((< |i| 1) (GO G191)))
                 (SEQ
                  (LETT |den|
                        (SPADCALL (SPADCALL |res| (QREFELT $ 44))
                                  (SPADCALL |n| (QREFELT $ 39))
                                  (SPADCALL (- |i| 1) (QREFELT $ 45))
                                  (QREFELT $ 46))
                        . #4#)
                  (COND
                   ((SPADCALL |den| (|spadConstant| $ 49) (QREFELT $ 51))
                    (PROGN
                     (LETT #1#
                           (PROG1 (LETT #3# |i| . #4#)
                             (|check_subtype| (>= #3# 0)
                                              '(|NonNegativeInteger|) #3#))
                           . #4#)
                     (GO #1#))))
                  (LETT |num|
                        (SPADCALL (SPADCALL |res| (QREFELT $ 52))
                                  (SPADCALL |n| (QREFELT $ 39))
                                  (SPADCALL (- |i| 1) (QREFELT $ 45))
                                  (QREFELT $ 46))
                        . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |list| |i| (QREFELT $ 53))
                               (SPADCALL (SPADCALL |num| |den| (QREFELT $ 54))
                                         (QREFELT $ 9))
                               (QREFELT $ 55))
                     (PROGN
                      (LETT #1#
                            (PROG1 (LETT #2# |i| . #4#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#))
                            . #4#)
                      (GO #1#))))))
                 (LETT |i| (+ |i| -1) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #1# (EXIT #1#)))) 

(SDEFUN |GUESS;SUPS2SUPF|
        ((|p| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| F))
        (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SPADCALL (ELT $ 56) |p| (QREFELT $ 61)))
              ('T
               (|error|
                "Guess: type parameter F should be either equal to S or equal                       to Fraction S")))) 

(SDEFUN |GUESS;guess;LLLLL;8|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G365 NIL) (|guess| NIL)
          (|sumGuess| (|List| EXPRR)) (|summ| (EXPRR)) (|init| (EXPRR))
          (#2=#:G364 NIL) (|var| (|Symbol|)) (|sumList| (|List| F))
          (#3=#:G363 NIL) (|i| NIL) (#4=#:G362 NIL) (#5=#:G356 NIL)
          (#6=#:G361 NIL) (|prodGuess| (|List| EXPRR)) (|prod| (EXPRR))
          (#7=#:G360 NIL) (|prodList| (|List| F)) (#8=#:G359 NIL)
          (#9=#:G358 NIL)
          (|newMaxLevel| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#10=#:G319 NIL) (#11=#:G357 NIL) (|guesser| NIL)
          (|len| (|PositiveInteger|)) (#12=#:G315 NIL) (|xx| (EXPRR)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |newMaxLevel| (SPADCALL |options| (QREFELT $ 65))
                  . #13=(|GUESS;guess;LLLLL;8|))
            (LETT |xx|
                  (SPADCALL (SPADCALL |options| (QREFELT $ 66)) (QREFELT $ 39))
                  . #13#)
            (COND
             ((SPADCALL |options| (QREFELT $ 67))
              (COND
               ((QEQCAR |newMaxLevel| 0)
                (SPADCALL
                 (SPADCALL "Guess: guessing level "
                           (SPADCALL |newMaxLevel| (QREFELT $ 69))
                           (QREFELT $ 70))
                 (QREFELT $ 73))))))
            (LETT |res| NIL . #13#)
            (LETT |len|
                  (PROG1 (LETT #12# (LENGTH |list|) . #13#)
                    (|check_subtype| (> #12# 0) '(|PositiveInteger|) #12#))
                  . #13#)
            (COND
             ((SPADCALL |len| 1 (QREFELT $ 74))
              (PROGN (LETT #5# |res| . #13#) (GO #5#))))
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
                    ((SPADCALL |options| (QREFELT $ 75))
                     (COND
                      ((NULL (NULL |res|))
                       (PROGN (LETT #5# |res| . #13#) (GO #5#))))))))
                 (LETT #11# (CDR #11#) . #13#) (GO G190) G191 (EXIT NIL))
            (COND
             ((QEQCAR |newMaxLevel| 0)
              (COND
               ((ZEROP (QCDR |newMaxLevel|))
                (PROGN (LETT #5# |res| . #13#) (GO #5#)))
               (#14='T
                (LETT |newMaxLevel|
                      (CONS 0
                            (PROG1
                                (LETT #10# (- (QCDR |newMaxLevel|) 1) . #13#)
                              (|check_subtype| (>= #10# 0)
                                               '(|NonNegativeInteger|) #10#)))
                      . #13#)))))
            (COND
             ((SPADCALL '|guessProduct| |ops| (QREFELT $ 76))
              (COND
               ((SPADCALL (|spadConstant| $ 47) |list| (QREFELT $ 77))
                (SEQ (|spadConstant| $ 47)
                     (EXIT
                      (COND
                       ((SPADCALL |options| (QREFELT $ 67))
                        (SPADCALL
                         "Guess: cannot use guessProduct because of zeros"
                         (QREFELT $ 79)))))))
               (#14#
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
                                                 (QREFELT $ 53))
                                       (SPADCALL |list| |i| (QREFELT $ 53))
                                       (QREFELT $ 80))
                                      #9#)
                                     . #13#)))
                             (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
                       . #13#)
                 (EXIT
                  (COND
                   ((NULL (SPADCALL (ELT $ 82) |prodList| (QREFELT $ 84)))
                    (SEQ
                     (LETT |var|
                           (SPADCALL '|p|
                                     (LIST (SPADCALL |len| (QREFELT $ 85)))
                                     (QREFELT $ 87))
                           . #13#)
                     (LETT |prodGuess| NIL . #13#)
                     (SEQ (LETT |guess| NIL . #13#)
                          (LETT #7#
                                (SPADCALL |prodList| |guessers| |ops|
                                          (APPEND
                                           (LIST
                                            (SPADCALL |var| (QREFELT $ 89))
                                            (SPADCALL |newMaxLevel|
                                                      (QREFELT $ 90)))
                                           |options|)
                                          (QREFELT $ 93))
                                . #13#)
                          G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |guess| (CAR #7#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |init|
                                 (SPADCALL (SPADCALL |list| 1 (QREFELT $ 53))
                                           (QREFELT $ 10))
                                 . #13#)
                           (LETT |prod|
                                 (SPADCALL |guess|
                                           (SPADCALL |var|
                                                     (SPADCALL
                                                      (|spadConstant| $ 49)
                                                      (SPADCALL |xx|
                                                                (|spadConstant|
                                                                 $ 94)
                                                                (QREFELT $ 95))
                                                      (QREFELT $ 97))
                                                     (QREFELT $ 99))
                                           (QREFELT $ 101))
                                 . #13#)
                           (EXIT
                            (LETT |prodGuess|
                                  (CONS
                                   (SPADCALL |init| |prod| (QREFELT $ 105))
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
                                ((SPADCALL |guess| |res| (QREFELT $ 106)) 'NIL)
                                (#14# 'T))
                               (LETT |res| (CONS |guess| |res|) . #13#)))))
                           (LETT #6# (CDR #6#) . #13#) (GO G190) G191
                           (EXIT NIL))))))))))))
            (COND
             ((SPADCALL |options| (QREFELT $ 75))
              (COND
               ((NULL (NULL |res|))
                (PROGN (LETT #5# |res| . #13#) (GO #5#))))))
            (COND
             ((SPADCALL '|guessSum| |ops| (QREFELT $ 76))
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
                                     (SPADCALL |list| (+ |i| 1) (QREFELT $ 53))
                                     (SPADCALL |list| |i| (QREFELT $ 53))
                                     (QREFELT $ 107))
                                    #4#)
                                   . #13#)))
                           (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     . #13#)
               (EXIT
                (COND
                 ((NULL
                   (SPADCALL
                    (CONS #'|GUESS;guess;LLLLL;8!0| (VECTOR $ |sumList|))
                    |sumList| (QREFELT $ 84)))
                  (SEQ
                   (LETT |var|
                         (SPADCALL '|s| (LIST (SPADCALL |len| (QREFELT $ 85)))
                                   (QREFELT $ 87))
                         . #13#)
                   (LETT |sumGuess| NIL . #13#)
                   (SEQ (LETT |guess| NIL . #13#)
                        (LETT #2#
                              (SPADCALL |sumList| |guessers| |ops|
                                        (APPEND
                                         (LIST (SPADCALL |var| (QREFELT $ 89))
                                               (SPADCALL |newMaxLevel|
                                                         (QREFELT $ 90)))
                                         |options|)
                                        (QREFELT $ 93))
                              . #13#)
                        G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |guess| (CAR #2#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |init|
                               (SPADCALL (SPADCALL |list| 1 (QREFELT $ 53))
                                         (QREFELT $ 10))
                               . #13#)
                         (LETT |summ|
                               (SPADCALL |guess|
                                         (SPADCALL |var|
                                                   (SPADCALL
                                                    (|spadConstant| $ 49)
                                                    (SPADCALL |xx|
                                                              (|spadConstant| $
                                                                              94)
                                                              (QREFELT $ 95))
                                                    (QREFELT $ 97))
                                                   (QREFELT $ 99))
                                         (QREFELT $ 110))
                               . #13#)
                         (EXIT
                          (LETT |sumGuess|
                                (CONS (SPADCALL |init| |summ| (QREFELT $ 111))
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
                              ((SPADCALL |guess| |res| (QREFELT $ 106)) 'NIL)
                              (#14# 'T))
                             (LETT |res| (CONS |guess| |res|) . #13#)))))
                         (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                         (EXIT NIL))))))))))
            (EXIT |res|)))
          #5# (EXIT #5#)))) 

(SDEFUN |GUESS;guess;LLLLL;8!0| ((|z1| NIL) ($$ NIL))
        (PROG (|sumList| $)
          (LETT |sumList| (QREFELT $$ 1) . #1=(|GUESS;guess;LLLLL;8|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL |sumList| (|spadConstant| $ 108)
                                (QREFELT $ 53))
                      (QREFELT $ 109)))))) 

(SDEFUN |GUESS;guess;LL;9| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 112)) (LIST '|guessProduct| '|guessSum|)
                  NIL (QREFELT $ 93))) 

(SDEFUN |GUESS;guess;LLL;10|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 112)) (LIST '|guessProduct| '|guessSum|)
                  |options| (QREFELT $ 93))) 

(SDEFUN |GUESS;guess;LLLL;11|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) ($ |List| EXPRR))
        (SPADCALL |list| |guessers| |ops| NIL (QREFELT $ 93))) 

(SDEFUN |GUESS;F2FPOLYS|
        ((|p| F)
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (COND
         ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
          (SPADCALL (SPADCALL |p| (QREFELT $ 117)) (QREFELT $ 119)))
         ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
          (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 29)) (QREFELT $ 121))
                    (SPADCALL (SPADCALL |p| (QREFELT $ 30)) (QREFELT $ 121))
                    (QREFELT $ 123)))
         ('T
          (|error|
           "Guess: type parameter F should be either equal to S or equal                        to Fraction S")))) 

(SDEFUN |GUESS;SUPF2EXPRR|
        ((|xx| |Symbol|) (|p| |SparseUnivariatePolynomial| F) ($ EXPRR))
        (COND ((SPADCALL |p| (QREFELT $ 124)) (|spadConstant| $ 49))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 125)) (QREFELT $ 10))
                 (SPADCALL (SPADCALL |xx| (QREFELT $ 39))
                           (SPADCALL |p| (QREFELT $ 127)) (QREFELT $ 128))
                 (QREFELT $ 105))
                (|GUESS;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 129)) $)
                (QREFELT $ 111))))) 

(SDEFUN |GUESS;FSUPF2EXPRR|
        ((|xx| |Symbol|) (|p| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ EXPRR))
        (SPADCALL (|GUESS;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 130)) $)
                  (|GUESS;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 131)) $)
                  (QREFELT $ 54))) 

(SDEFUN |GUESS;POLYS2POLYF|
        ((|p| |SparseMultivariatePolynomial| S
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         ($ |SparseMultivariatePolynomial| F
          (|OrderedVariableList| (|construct| '|a1| 'A))))
        (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SPADCALL (ELT $ 56) |p| (QREFELT $ 133)))
              ('T
               (|error|
                "Guess: type parameter F should be either equal to S or equal                       to Fraction S")))) 

(SDEFUN |GUESS;SUPPOLYS2SUPF|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A))))
         (|a1v| F) (|Av| F) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((|lc|
           (|SparseMultivariatePolynomial| F
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A)))))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 135)) (|spadConstant| $ 136))
                ('T
                 (SEQ
                  (LETT |lc|
                        (|GUESS;POLYS2POLYF| (SPADCALL |p| (QREFELT $ 137)) $)
                        |GUESS;SUPPOLYS2SUPF|)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |lc|
                                (LIST (SPADCALL 1 (QREFELT $ 139))
                                      (SPADCALL 2 (QREFELT $ 139)))
                                (LIST |a1v| |Av|) (QREFELT $ 141))
                      (QREFELT $ 142))
                     (SPADCALL |p| (QREFELT $ 143)) (QREFELT $ 144))
                    (|GUESS;SUPPOLYS2SUPF| (SPADCALL |p| (QREFELT $ 145)) |a1v|
                     |Av| $)
                    (QREFELT $ 146))))))))) 

(SDEFUN |GUESS;SUPFPOLYS2FSUPPOLYS|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A)))))
         ($ |Fraction|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))))
        (SPROG
         ((|pden|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| S
                                            (|OrderedVariableList|
                                             (|construct| '|a1| 'A)))))
          (|pnum|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| S
                                            (|OrderedVariableList|
                                             (|construct| '|a1| 'A)))))
          (|cden|
           (|Record|
            (|:| |num|
                 (|SparseUnivariatePolynomial|
                  (|Fraction|
                   (|SparseMultivariatePolynomial| S
                                                   (|OrderedVariableList|
                                                    (|construct| '|a1| 'A))))))
            (|:| |den|
                 (|SparseMultivariatePolynomial| S
                                                 (|OrderedVariableList|
                                                  (|construct| '|a1| 'A)))))))
         (SEQ
          (LETT |cden| (SPADCALL |p| (QREFELT $ 150))
                . #1=(|GUESS;SUPFPOLYS2FSUPPOLYS|))
          (LETT |pnum|
                (SPADCALL
                 (CONS #'|GUESS;SUPFPOLYS2FSUPPOLYS!0| (VECTOR $ |cden|)) |p|
                 (QREFELT $ 155))
                . #1#)
          (LETT |pden| (SPADCALL (QCDR |cden|) (QREFELT $ 156)) . #1#)
          (EXIT (SPADCALL |pnum| |pden| (QREFELT $ 158)))))) 

(SDEFUN |GUESS;SUPFPOLYS2FSUPPOLYS!0| ((|z1| NIL) ($$ NIL))
        (PROG (|cden| $)
          (LETT |cden| (QREFELT $$ 1) . #1=(|GUESS;SUPFPOLYS2FSUPPOLYS|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QCDR |cden|) (QREFELT $ 151))
                      (QREFELT $ 152)))))) 

(PUT '|GUESS;defaultD| '|SPADreplace| '(XLAM (|expr|) |expr|)) 

(SDEFUN |GUESS;defaultD| ((|expr| EXPRR) ($ EXPRR)) |expr|) 

(SDEFUN |GUESS;DN2DL| ((DN |Mapping| EXPRR EXPRR) (|i| |Integer|) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |i| (QREFELT $ 45)) DN) (QREFELT $ 9))) 

(SDEFUN |GUESS;evalResultant|
        ((|p1| |SparseMultivariatePolynomial| S
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|p2| |SparseMultivariatePolynomial| S
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|o| |Integer|) (|d| |Integer|)
         (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A)) ($ |List| S))
        (SPROG
         ((|res| (|List| S)) (#1=#:G394 NIL) (#2=#:G392 NIL) (|lead| (S))
          (#3=#:G390 NIL) (#4=#:G388 NIL) (|d2atk| #5=(|NonNegativeInteger|))
          (|d1atk| #5#) (|p2atk| #6=(|SparseUnivariatePolynomial| S))
          (|p1atk| #6#) (#7=#:G400 NIL) (|k| NIL)
          (|d2| #8=(|NonNegativeInteger|)) (|d1| #8#))
         (SEQ (LETT |res| NIL . #9=(|GUESS;evalResultant|))
              (LETT |d1| (SPADCALL |p1| |va1| (QREFELT $ 159)) . #9#)
              (LETT |d2| (SPADCALL |p2| |va1| (QREFELT $ 159)) . #9#)
              (SEQ (LETT |k| 1 . #9#) (LETT #7# (+ (- |d| |o|) 1) . #9#) G190
                   (COND ((|greater_SI| |k| #7#) (GO G191)))
                   (SEQ
                    (LETT |p1atk|
                          (SPADCALL
                           (SPADCALL |p1| |vA| (SPADCALL |k| (QREFELT $ 160))
                                     (QREFELT $ 161))
                           (QREFELT $ 162))
                          . #9#)
                    (LETT |p2atk|
                          (SPADCALL
                           (SPADCALL |p2| |vA| (SPADCALL |k| (QREFELT $ 160))
                                     (QREFELT $ 161))
                           (QREFELT $ 162))
                          . #9#)
                    (LETT |d1atk| (SPADCALL |p1atk| (QREFELT $ 163)) . #9#)
                    (LETT |d2atk| (SPADCALL |p2atk| (QREFELT $ 163)) . #9#)
                    (COND
                     ((< |d2atk| |d2|)
                      (COND
                       ((< |d1atk| |d1|)
                        (LETT |lead| (|spadConstant| $ 48) . #9#))
                       ('T
                        (LETT |lead|
                              (SPADCALL (SPADCALL |p1atk| (QREFELT $ 164))
                                        (PROG1
                                            (LETT #4# (- |d2| |d2atk|) . #9#)
                                          (|check_subtype| (>= #4# 0)
                                                           '(|NonNegativeInteger|)
                                                           #4#))
                                        (QREFELT $ 165))
                              . #9#))))
                     ((< |d1atk| |d1|)
                      (LETT |lead|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) (QREFELT $ 166))
                              |d2| (QREFELT $ 165))
                             (SPADCALL (SPADCALL |p2atk| (QREFELT $ 164))
                                       (PROG1 (LETT #3# (- |d1| |d1atk|) . #9#)
                                         (|check_subtype| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          #3#))
                                       (QREFELT $ 165))
                             (QREFELT $ 167))
                            . #9#))
                     ('T (LETT |lead| (|spadConstant| $ 12) . #9#)))
                    (EXIT
                     (COND
                      ((SPADCALL |lead| (QREFELT $ 168))
                       (LETT |res| (CONS (|spadConstant| $ 48) |res|) . #9#))
                      ('T
                       (LETT |res|
                             (CONS
                              (SPADCALL |lead|
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL
                                                   (SPADCALL |p1atk| |p2atk|
                                                             (QREFELT $ 169))
                                                   (SPADCALL
                                                    (SPADCALL |k|
                                                              (QREFELT $ 160))
                                                    (PROG1 (LETT #2# |o| . #9#)
                                                      (|check_subtype|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                                    (QREFELT $ 165))
                                                   (QREFELT $ 171))
                                                  . #9#)
                                            (QCDR #1#)
                                          (|check_union| (QEQCAR #1# 0)
                                                         (QREFELT $ 7) #1#))
                                        (QREFELT $ 167))
                              |res|)
                             . #9#)))))
                   (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |res|))))) 

(SDEFUN |GUESS;p|
        ((|xm| |Integer|) (|i| |Integer|)
         (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A))
         (|basis| |Mapping| EXPRR EXPRR)
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (SPADCALL (SPADCALL (SPADCALL |vA| (QREFELT $ 172)) (QREFELT $ 173))
                  (SPADCALL
                   (SPADCALL (SPADCALL |va1| (QREFELT $ 172)) (QREFELT $ 173))
                   (|GUESS;F2FPOLYS|
                    (SPADCALL (|GUESS;DN2DL| |basis| |i| $)
                              (|GUESS;DN2DL| |basis| |xm| $) (QREFELT $ 107))
                    $)
                   (QREFELT $ 174))
                  (QREFELT $ 175))) 

(SDEFUN |GUESS;p2|
        ((|xm| |Integer|) (|i| |Symbol|) (|a1v| F) (|Av| F)
         (|basis| |Mapping| EXPRR EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL |Av| (QREFELT $ 10))
                  (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                            (SPADCALL
                             (SPADCALL (SPADCALL |i| (QREFELT $ 39)) |basis|)
                             (SPADCALL (SPADCALL |xm| (QREFELT $ 45)) |basis|)
                             (QREFELT $ 95))
                            (QREFELT $ 105))
                  (QREFELT $ 111))) 

(SDEFUN |GUESS;guessExpRatAux|
        ((|xx| |Symbol|) (|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|xValues| |List| (|Integer|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((#1=#:G460 NIL) (|res| (|List| EXPRR)) (|res4| (EXPRR))
          (|denr| #2=(|SparseUnivariatePolynomial| F)) (|numr| #2#)
          (|ri1|
           (|Fraction|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (|t2|
           #3=(|SparseMultivariatePolynomial| F
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A))))
          (|t1| #3#) (|a1v| (F)) (#4=#:G464 NIL) (|g| NIL)
          (|evalPoly|
           (|SparseMultivariatePolynomial| F
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Av| (F)) (#5=#:G463 NIL) (|f| NIL)
          (|res3| (|SparseUnivariatePolynomial| F))
          (|res2| #6=(|SparseUnivariatePolynomial| S)) (|res1| #6#)
          (|d2| (|Integer|)) (|o2| (|Integer|)) (|d1| (|Integer|))
          (|o1| (|Integer|)) (|n| (|Integer|))
          (|poly3|
           #7=(|SparseMultivariatePolynomial| S
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A))))
          (|poly2| #7#) (|poly1| #7#)
          (|ri|
           (|Fraction|
            (|SparseUnivariatePolynomial|
             (|Fraction|
              (|SparseMultivariatePolynomial| S
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A)))))))
          (#8=#:G439 NIL) (|i| NIL) (|maxDeg| (|Integer|))
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|y3|
           #9=(|Fraction|
               (|SparseMultivariatePolynomial| S
                                               (|OrderedVariableList|
                                                (|construct| '|a1| 'A)))))
          (|y2| #9#) (|y1| #9#)
          (|ylist|
           (|List|
            (|Fraction|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (#10=#:G462 NIL) (|y| (|Mapping| #9# (|NonNegativeInteger|)))
          (|x3|
           #11=(|Fraction|
                (|SparseMultivariatePolynomial| S
                                                (|OrderedVariableList|
                                                 (|construct| '|a1| 'A)))))
          (|x2| #11#) (|x1| #11#) (|xlist| (|List| #11#)) (#12=#:G461 NIL)
          (|len| (|NonNegativeInteger|)) (#13=#:G413 NIL)
          (A #14=(|OrderedVariableList| (|construct| '|a1| 'A))) (|a1| #14#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a1| (SPADCALL 1 (QREFELT $ 139))
                  . #15=(|GUESS;guessExpRatAux|))
            (LETT A (SPADCALL 2 (QREFELT $ 139)) . #15#)
            (LETT |len| (LENGTH |list|) . #15#)
            (COND ((< |len| 4) (PROGN (LETT #1# NIL . #15#) (GO #1#)))
                  (#16='T
                   (LETT |len|
                         (PROG1 (LETT #13# (- |len| 3) . #15#)
                           (|check_subtype| (>= #13# 0) '(|NonNegativeInteger|)
                                            #13#))
                         . #15#)))
            (LETT |xlist|
                  (PROGN
                   (LETT #12# NIL . #15#)
                   (SEQ (LETT |i| 1 . #15#) G190
                        (COND ((|greater_SI| |i| |len|) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #12#
                                (CONS
                                 (|GUESS;F2FPOLYS|
                                  (|GUESS;DN2DL| |basis|
                                   (SPADCALL |xValues| |i| (QREFELT $ 15)) $)
                                  $)
                                 #12#)
                                . #15#)))
                        (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  . #15#)
            (LETT |x1|
                  (|GUESS;F2FPOLYS|
                   (|GUESS;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 1) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |x2|
                  (|GUESS;F2FPOLYS|
                   (|GUESS;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 2) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |x3|
                  (|GUESS;F2FPOLYS|
                   (|GUESS;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 3) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |y|
                  (CONS #'|GUESS;guessExpRatAux!0|
                        (VECTOR |basis| A |a1| |xValues| $ |list|))
                  . #15#)
            (LETT |ylist|
                  (PROGN
                   (LETT #10# NIL . #15#)
                   (SEQ (LETT |i| 1 . #15#) G190
                        (COND ((|greater_SI| |i| |len|) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #10# (CONS (SPADCALL |i| |y|) #10#) . #15#)))
                        (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #10#))))
                  . #15#)
            (LETT |y1| (SPADCALL (+ |len| 1) |y|) . #15#)
            (LETT |y2| (SPADCALL (+ |len| 2) |y|) . #15#)
            (LETT |y3| (SPADCALL (+ |len| 3) |y|) . #15#)
            (LETT |res| NIL . #15#)
            (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 179)) . #15#)
                 (EXIT
                  (COND
                   ((QEQCAR |maxD| 0)
                    (LETT |maxDeg| (MIN (QCDR |maxD|) (- |len| 1)) . #15#))
                   (#16# (LETT |maxDeg| (- |len| 1) . #15#)))))
            (SEQ (LETT |i| 0 . #15#) G190
                 (COND ((|greater_SI| |i| |maxDeg|) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL |options| (QREFELT $ 67))
                    (SPADCALL
                     (SPADCALL "Guess: degree ExpRat "
                               (SPADCALL |i| (QREFELT $ 180)) (QREFELT $ 70))
                     (QREFELT $ 73))))
                  (COND
                   ((SPADCALL |options| (QREFELT $ 67))
                    (SEQ (SPADCALL "sys date +%s" (QREFELT $ 182))
                         (EXIT
                          (SPADCALL "Guess: interpolating..."
                                    (QREFELT $ 73))))))
                  (LETT |ri|
                        (SPADCALL |xlist| |ylist|
                                  (PROG1 (LETT #8# (- (- |len| 1) |i|) . #15#)
                                    (|check_subtype| (>= #8# 0)
                                                     '(|NonNegativeInteger|)
                                                     #8#))
                                  (QREFELT $ 186))
                        . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 67))
                    (SPADCALL "Guess: polynomials..." (QREFELT $ 73))))
                  (LETT |poly1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x1| (QREFELT $ 188)) |y1|
                                   (QREFELT $ 189))
                         (QREFELT $ 190))
                        . #15#)
                  (LETT |poly2|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x2| (QREFELT $ 188)) |y2|
                                   (QREFELT $ 189))
                         (QREFELT $ 190))
                        . #15#)
                  (LETT |poly3|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x3| (QREFELT $ 188)) |y3|
                                   (QREFELT $ 189))
                         (QREFELT $ 190))
                        . #15#)
                  (LETT |n| (- |len| |i|) . #15#)
                  (LETT |o1| (|GUESS;ord1| |xValues| |i| $) . #15#)
                  (LETT |d1| (|GUESS;deg1| |xValues| |i| $) . #15#)
                  (LETT |o2| (|GUESS;ord2| |xValues| |i| $) . #15#)
                  (LETT |d2| (|GUESS;deg2| |xValues| |i| $) . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 67))
                    (SPADCALL "Guess: interpolating resultants..."
                              (QREFELT $ 73))))
                  (LETT |res1|
                        (SPADCALL
                         (|GUESS;evalResultant| |poly1| |poly3| |o1| |d1| |a1|
                          A $)
                         (QREFELT $ 192))
                        . #15#)
                  (LETT |res2|
                        (SPADCALL
                         (|GUESS;evalResultant| |poly2| |poly3| |o2| |d2| |a1|
                          A $)
                         (QREFELT $ 192))
                        . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 67))
                    (SPADCALL "Guess: computing gcd..." (QREFELT $ 73))))
                  (LETT |res3|
                        (|GUESS;SUPS2SUPF|
                         (SPADCALL (SPADCALL |res1| |res2| (QREFELT $ 193))
                                   (QREFELT $ 194))
                         $)
                        . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 67))
                    (SPADCALL "Guess: solving..." (QREFELT $ 73))))
                  (SEQ (LETT |f| NIL . #15#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |res3| (QREFELT $ 197))
                                       (QREFELT $ 200))
                             . #15#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |f| (CAR #5#) . #15#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 127)) 1)
                           (SEQ
                            (LETT |Av|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (QCAR |f|) 0 (QREFELT $ 201))
                                    (SPADCALL (QCAR |f|) (QREFELT $ 125))
                                    (QREFELT $ 80))
                                   (QREFELT $ 202))
                                  . #15#)
                            (LETT |evalPoly|
                                  (SPADCALL (|GUESS;POLYS2POLYF| |poly3| $) A
                                            |Av| (QREFELT $ 203))
                                  . #15#)
                            (COND
                             ((SPADCALL |evalPoly| (QREFELT $ 204))
                              (LETT |evalPoly|
                                    (SPADCALL (|GUESS;POLYS2POLYF| |poly1| $) A
                                              |Av| (QREFELT $ 203))
                                    . #15#)))
                            (EXIT
                             (SEQ (LETT |g| NIL . #15#)
                                  (LETT #4#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |evalPoly| (QREFELT $ 205))
                                          (QREFELT $ 197))
                                         (QREFELT $ 200))
                                        . #15#)
                                  G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |g| (CAR #4#) . #15#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL (QCAR |g|) (QREFELT $ 127)) 1)
                                      (SEQ
                                       (LETT |a1v|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QCAR |g|) 0
                                                         (QREFELT $ 201))
                                               (SPADCALL (QCAR |g|)
                                                         (QREFELT $ 125))
                                               (QREFELT $ 80))
                                              (QREFELT $ 202))
                                             . #15#)
                                       (LETT |t1|
                                             (SPADCALL
                                              (|GUESS;POLYS2POLYF| |poly1| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 141))
                                             . #15#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t1| (QREFELT $ 204))
                                          (SEQ
                                           (LETT |t2|
                                                 (SPADCALL
                                                  (|GUESS;POLYS2POLYF| |poly2|
                                                   $)
                                                  (LIST |a1| A)
                                                  (LIST |a1v| |Av|)
                                                  (QREFELT $ 141))
                                                 . #15#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |t2| (QREFELT $ 204))
                                              (SEQ
                                               (LETT |ri1|
                                                     (SPADCALL
                                                      (|GUESS;SUPFPOLYS2FSUPPOLYS|
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          206))
                                                       $)
                                                      (|GUESS;SUPFPOLYS2FSUPPOLYS|
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          207))
                                                       $)
                                                      (QREFELT $ 208))
                                                     . #15#)
                                               (LETT |numr|
                                                     (|GUESS;SUPPOLYS2SUPF|
                                                      (SPADCALL |ri1|
                                                                (QREFELT $
                                                                         209))
                                                      |a1v| |Av| $)
                                                     . #15#)
                                               (LETT |denr|
                                                     (|GUESS;SUPPOLYS2SUPF|
                                                      (SPADCALL |ri1|
                                                                (QREFELT $
                                                                         210))
                                                      |a1v| |Av| $)
                                                     . #15#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |denr|
                                                            (QREFELT $ 124))
                                                  (COND
                                                   ((SPADCALL |numr|
                                                              (QREFELT $ 124))
                                                    (COND
                                                     ((SPADCALL |options|
                                                                (QREFELT $ 67))
                                                      (SPADCALL
                                                       "Guess: numerator and denominator vanish!"
                                                       (QREFELT $ 79)))))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |res4|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|GUESS;FSUPF2EXPRR|
                                                            |xx|
                                                            (SPADCALL |numr|
                                                                      |denr|
                                                                      (QREFELT
                                                                       $ 211))
                                                            $)
                                                           (SPADCALL |xx|
                                                                     (QREFELT $
                                                                              213))
                                                           (SPADCALL
                                                            (SPADCALL |xx|
                                                                      (QREFELT
                                                                       $ 39))
                                                            |basis|)
                                                           (QREFELT $ 215))
                                                          (SPADCALL
                                                           (|GUESS;p2|
                                                            (SPADCALL |xValues|
                                                                      (QREFELT
                                                                       $ 176))
                                                            |xx| |a1v| |Av|
                                                            |basis| $)
                                                           (SPADCALL |xx|
                                                                     (QREFELT $
                                                                              39))
                                                           (QREFELT $ 216))
                                                          (QREFELT $ 105))
                                                         . #15#)
                                                   (EXIT
                                                    (LETT |res|
                                                          (CONS |res4| |res|)
                                                          . #15#)))))))))))))))))))
                                  (LETT #4# (CDR #4#) . #15#) (GO G190) G191
                                  (EXIT NIL))))))))
                       (LETT #5# (CDR #5#) . #15#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL (NULL |res|))
                     (COND
                      ((SPADCALL |options| (QREFELT $ 75))
                       (PROGN (LETT #1# |res| . #15#) (GO #1#))))))))
                 (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #1# (EXIT #1#)))) 

(SDEFUN |GUESS;guessExpRatAux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|list| $ |xValues| |a1| A |basis|)
          (LETT |list| (QREFELT $$ 5) . #1=(|GUESS;guessExpRatAux|))
          (LETT $ (QREFELT $$ 4) . #1#)
          (LETT |xValues| (QREFELT $$ 3) . #1#)
          (LETT |a1| (QREFELT $$ 2) . #1#)
          (LETT A (QREFELT $$ 1) . #1#)
          (LETT |basis| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (|GUESS;F2FPOLYS| (SPADCALL |list| |z1| (QREFELT $ 53)) $)
             (SPADCALL
              (|GUESS;p| (SPADCALL |xValues| (QREFELT $ 176))
               (SPADCALL |xValues| |z1| (QREFELT $ 15)) |a1| A |basis| $)
              (SPADCALL (SPADCALL |xValues| |z1| (QREFELT $ 15))
                        (QREFELT $ 177))
              (QREFELT $ 178))
             (QREFELT $ 174)))))) 

(SDEFUN |GUESS;guessExpRatAux0|
        ((|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G481 NIL) (|f| NIL) (#2=#:G480 NIL)
          (|xValues| (|List| (|Integer|))) (|newlist| (|List| F))
          (|i| (|Integer|)) (#3=#:G479 NIL) (|x| NIL) (|zeros| (EXPRR))
          (#4=#:G478 NIL) (|shortlist| (|List| F)) (#5=#:G467 NIL)
          (#6=#:G477 NIL) (|len| (|Integer|)) (|xx| (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((ZEROP (SPADCALL |options| (QREFELT $ 217)))
              (|error| "Guess: guessExpRat does not support zero safety")))
            (LETT |xx| (SPADCALL |options| (QREFELT $ 66))
                  . #7=(|GUESS;guessExpRatAux0|))
            (LETT |len| (LENGTH |list|) . #7#)
            (COND
             ((< (+ (- |len| (SPADCALL |options| (QREFELT $ 217))) 1) 0)
              (PROGN (LETT #6# NIL . #7#) (GO #6#))))
            (LETT |shortlist|
                  (SPADCALL |list|
                            (PROG1
                                (LETT #5#
                                      (+
                                       (- |len|
                                          (SPADCALL |options| (QREFELT $ 217)))
                                       1)
                                      . #7#)
                              (|check_subtype| (>= #5# 0)
                                               '(|NonNegativeInteger|) #5#))
                            (QREFELT $ 218))
                  . #7#)
            (LETT |zeros| (|spadConstant| $ 94) . #7#) (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #4# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 47) (QREFELT $ 109))
                         (LETT |zeros|
                               (SPADCALL |zeros|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |xx| (QREFELT $ 39))
                                           |basis|)
                                          (SPADCALL
                                           (SPADCALL |i| (QREFELT $ 45))
                                           |basis|)
                                          (QREFELT $ 95))
                                         (QREFELT $ 105))
                               . #7#)))))
                 (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #3# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 47) (QREFELT $ 55))
                         (SEQ
                          (LETT |newlist|
                                (CONS
                                 (SPADCALL |x|
                                           (SPADCALL
                                            (SPADCALL |zeros|
                                                      (SPADCALL |xx|
                                                                (QREFELT $ 39))
                                                      (SPADCALL |i|
                                                                (QREFELT $ 45))
                                                      (QREFELT $ 46))
                                            (QREFELT $ 9))
                                           (QREFELT $ 80))
                                 |newlist|)
                                . #7#)
                          (EXIT
                           (LETT |xValues| (CONS |i| |xValues|) . #7#)))))))
                 (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |newlist| (REVERSE |newlist|) . #7#)
            (LETT |xValues| (REVERSE |xValues|) . #7#)
            (LETT |res|
                  (PROGN
                   (LETT #2# NIL . #7#)
                   (SEQ (LETT |f| NIL . #7#)
                        (LETT #1#
                              (|GUESS;guessExpRatAux| |xx| |newlist| |basis|
                               |xValues| |options| $)
                              . #7#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |f| (CAR #1#) . #7#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL |zeros| |f| (QREFELT $ 105))
                                  (SPADCALL |xx| (QREFELT $ 39))
                                  (SPADCALL |xx| (QREFELT $ 39))
                                  (QREFELT $ 46))
                                 #2#)
                                . #7#)))
                        (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #7#)
            (EXIT
             (SPADCALL
              (CONS #'|GUESS;guessExpRatAux0!0|
                    (VECTOR |options| $ |list| |len| |xx|))
              |res| (QREFELT $ 222)))))
          #6# (EXIT #6#)))) 

(SDEFUN |GUESS;guessExpRatAux0!0| ((|z1| NIL) ($$ NIL))
        (PROG (|xx| |len| |list| $ |options|)
          (LETT |xx| (QREFELT $$ 4) . #1=(|GUESS;guessExpRatAux0|))
          (LETT |len| (QREFELT $$ 3) . #1#)
          (LETT |list| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |options| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|GUESS;checkResult| |z1| |xx| |len| |list| $)
                      (SPADCALL |len| (SPADCALL |options| (QREFELT $ 217))
                                (QREFELT $ 219))
                      (QREFELT $ 220)))))) 

(SDEFUN |GUESS;guessExpRat;LL;25| ((|list| |List| F) ($ |List| EXPRR))
        (|GUESS;guessExpRatAux0| |list| (CONS (|function| |GUESS;defaultD|) $)
         NIL $)) 

(SDEFUN |GUESS;guessExpRat;LLL;26|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (|GUESS;guessExpRatAux0| |list| (CONS (|function| |GUESS;defaultD|) $)
         |options| $)) 

(SDEFUN |GUESS;guessExpRat;SM;27|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessExpRat;SM;27!1| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessExpRat;SM;27!1| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessExpRat;SM;27|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;guessExpRatAux0| |z1|
                    (CONS #'|GUESS;guessExpRat;SM;27!0| (VECTOR $ |q|)) |z2|
                    $)))))) 

(SDEFUN |GUESS;guessExpRat;SM;27!0| ((|i1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |q| (QREFELT $ 39)) |i1| (QREFELT $ 216)))))) 

(SDEFUN |GUESS;binExt|
        ((|i| |Integer|) (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A))
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (SPROG
         ((|num|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|numl|
           (|List|
            (|SparseMultivariatePolynomial| S
                                            (|OrderedVariableList|
                                             (|construct| '|a1| 'A)))))
          (#1=#:G495 NIL) (|l| NIL) (#2=#:G494 NIL))
         (SEQ
          (LETT |numl|
                (PROGN
                 (LETT #2# NIL . #3=(|GUESS;binExt|))
                 (SEQ (LETT |l| 0 . #3#) (LETT #1# (- |i| 1) . #3#) G190
                      (COND ((|greater_SI| |l| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |vA| (QREFELT $ 172))
                                          (SPADCALL |i|
                                                    (SPADCALL |va1|
                                                              (QREFELT $ 172))
                                                    (QREFELT $ 226))
                                          (QREFELT $ 227))
                                (SPADCALL |l| (QREFELT $ 228)) (QREFELT $ 229))
                               #2#)
                              . #3#)))
                      (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |num|
                (SPADCALL (ELT $ 230) |numl| (|spadConstant| $ 231)
                          (QREFELT $ 234))
                . #3#)
          (EXIT
           (SPADCALL |num|
                     (SPADCALL (SPADCALL |i| (QREFELT $ 235)) (QREFELT $ 228))
                     (QREFELT $ 123)))))) 

(SDEFUN |GUESS;binExtEXPR| ((|i| |Symbol|) (|a1v| F) (|Av| F) ($ EXPRR))
        (SPADCALL
         (SPADCALL (SPADCALL |Av| (QREFELT $ 10))
                   (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                             (SPADCALL |i| (QREFELT $ 39)) (QREFELT $ 105))
                   (QREFELT $ 111))
         (SPADCALL |i| (QREFELT $ 39)) (QREFELT $ 236))) 

(SDEFUN |GUESS;guessBinRatAux|
        ((|xx| |Symbol|) (|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|ext| |Mapping|
          (|Fraction|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Integer|) (|OrderedVariableList| (|construct| '|a1| 'A))
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|extEXPR| |Mapping| EXPRR (|Symbol|) F F)
         (|xValues| |List| (|Integer|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((#1=#:G526 NIL) (|res| (|List| EXPRR)) (|res4| (EXPRR))
          (|denr| #2=(|SparseUnivariatePolynomial| F)) (|numr| #2#)
          (|ri1|
           (|Fraction|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (|t2|
           #3=(|SparseMultivariatePolynomial| F
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A))))
          (|t1| #3#) (|a1v| (F)) (#4=#:G530 NIL) (|g| NIL)
          (|evalPoly|
           (|SparseMultivariatePolynomial| F
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Av| (F)) (#5=#:G529 NIL) (|f| NIL)
          (|res3| (|SparseUnivariatePolynomial| F))
          (|res2| #6=(|SparseUnivariatePolynomial| S)) (|res1| #6#)
          (|n| (|Integer|))
          (|poly3|
           #7=(|SparseMultivariatePolynomial| S
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A))))
          (|poly2| #7#) (|poly1| #7#)
          (|ri|
           (|Fraction|
            (|SparseUnivariatePolynomial|
             (|Fraction|
              (|SparseMultivariatePolynomial| S
                                              (|OrderedVariableList|
                                               (|construct| '|a1| 'A)))))))
          (#8=#:G509 NIL) (|i| NIL) (|maxDeg| (|Integer|))
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|y3|
           #9=(|Fraction|
               (|SparseMultivariatePolynomial| S
                                               (|OrderedVariableList|
                                                (|construct| '|a1| 'A)))))
          (|y2| #9#) (|y1| #9#)
          (|ylist|
           (|List|
            (|Fraction|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (#10=#:G528 NIL) (|y| (|Mapping| #9# (|NonNegativeInteger|)))
          (|x3|
           #11=(|Fraction|
                (|SparseMultivariatePolynomial| S
                                                (|OrderedVariableList|
                                                 (|construct| '|a1| 'A)))))
          (|x2| #11#) (|x1| #11#) (|xlist| (|List| #11#)) (#12=#:G527 NIL)
          (|len| (|NonNegativeInteger|)) (#13=#:G497 NIL)
          (A #14=(|OrderedVariableList| (|construct| '|a1| 'A))) (|a1| #14#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a1| (SPADCALL 1 (QREFELT $ 139))
                  . #15=(|GUESS;guessBinRatAux|))
            (LETT A (SPADCALL 2 (QREFELT $ 139)) . #15#)
            (LETT |len| (LENGTH |list|) . #15#)
            (COND ((< |len| 4) (PROGN (LETT #1# NIL . #15#) (GO #1#)))
                  (#16='T
                   (LETT |len|
                         (PROG1 (LETT #13# (- |len| 3) . #15#)
                           (|check_subtype| (>= #13# 0) '(|NonNegativeInteger|)
                                            #13#))
                         . #15#)))
            (LETT |xlist|
                  (PROGN
                   (LETT #12# NIL . #15#)
                   (SEQ (LETT |i| 1 . #15#) G190
                        (COND ((|greater_SI| |i| |len|) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #12#
                                (CONS
                                 (|GUESS;F2FPOLYS|
                                  (|GUESS;DN2DL| |basis|
                                   (SPADCALL |xValues| |i| (QREFELT $ 15)) $)
                                  $)
                                 #12#)
                                . #15#)))
                        (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  . #15#)
            (LETT |x1|
                  (|GUESS;F2FPOLYS|
                   (|GUESS;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 1) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |x2|
                  (|GUESS;F2FPOLYS|
                   (|GUESS;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 2) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |x3|
                  (|GUESS;F2FPOLYS|
                   (|GUESS;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 3) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |y|
                  (CONS #'|GUESS;guessBinRatAux!0|
                        (VECTOR |ext| A |a1| |xValues| $ |list|))
                  . #15#)
            (LETT |ylist|
                  (PROGN
                   (LETT #10# NIL . #15#)
                   (SEQ (LETT |i| 1 . #15#) G190
                        (COND ((|greater_SI| |i| |len|) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #10# (CONS (SPADCALL |i| |y|) #10#) . #15#)))
                        (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #10#))))
                  . #15#)
            (LETT |y1| (SPADCALL (+ |len| 1) |y|) . #15#)
            (LETT |y2| (SPADCALL (+ |len| 2) |y|) . #15#)
            (LETT |y3| (SPADCALL (+ |len| 3) |y|) . #15#)
            (LETT |res| NIL . #15#)
            (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 179)) . #15#)
                 (EXIT
                  (COND
                   ((QEQCAR |maxD| 0)
                    (LETT |maxDeg| (MIN (QCDR |maxD|) (- |len| 1)) . #15#))
                   (#16# (LETT |maxDeg| (- |len| 1) . #15#)))))
            (SEQ (LETT |i| 0 . #15#) G190
                 (COND ((|greater_SI| |i| |maxDeg|) (GO G191)))
                 (SEQ
                  (LETT |ri|
                        (SPADCALL |xlist| |ylist|
                                  (PROG1 (LETT #8# (- (- |len| 1) |i|) . #15#)
                                    (|check_subtype| (>= #8# 0)
                                                     '(|NonNegativeInteger|)
                                                     #8#))
                                  (QREFELT $ 186))
                        . #15#)
                  (LETT |poly1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x1| (QREFELT $ 188)) |y1|
                                   (QREFELT $ 189))
                         (QREFELT $ 190))
                        . #15#)
                  (LETT |poly2|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x2| (QREFELT $ 188)) |y2|
                                   (QREFELT $ 189))
                         (QREFELT $ 190))
                        . #15#)
                  (LETT |poly3|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x3| (QREFELT $ 188)) |y3|
                                   (QREFELT $ 189))
                         (QREFELT $ 190))
                        . #15#)
                  (LETT |n| (- |len| |i|) . #15#)
                  (LETT |res1|
                        (SPADCALL
                         (SPADCALL |poly1| |poly3| |a1| (QREFELT $ 238))
                         (QREFELT $ 162))
                        . #15#)
                  (LETT |res2|
                        (SPADCALL
                         (SPADCALL |poly2| |poly3| |a1| (QREFELT $ 238))
                         (QREFELT $ 162))
                        . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 67))
                    (SPADCALL "Guess: computing gcd..." (QREFELT $ 73))))
                  (LETT |res3|
                        (|GUESS;SUPS2SUPF|
                         (SPADCALL (SPADCALL |res1| |res2| (QREFELT $ 193))
                                   (QREFELT $ 194))
                         $)
                        . #15#)
                  (SEQ (LETT |f| NIL . #15#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |res3| (QREFELT $ 197))
                                       (QREFELT $ 200))
                             . #15#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |f| (CAR #5#) . #15#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 127)) 1)
                           (SEQ
                            (LETT |Av|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (QCAR |f|) 0 (QREFELT $ 201))
                                    (SPADCALL (QCAR |f|) (QREFELT $ 125))
                                    (QREFELT $ 80))
                                   (QREFELT $ 202))
                                  . #15#)
                            (LETT |evalPoly|
                                  (SPADCALL (|GUESS;POLYS2POLYF| |poly3| $) A
                                            |Av| (QREFELT $ 203))
                                  . #15#)
                            (COND
                             ((SPADCALL |evalPoly| (QREFELT $ 204))
                              (LETT |evalPoly|
                                    (SPADCALL (|GUESS;POLYS2POLYF| |poly1| $) A
                                              |Av| (QREFELT $ 203))
                                    . #15#)))
                            (EXIT
                             (SEQ (LETT |g| NIL . #15#)
                                  (LETT #4#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |evalPoly| (QREFELT $ 205))
                                          (QREFELT $ 197))
                                         (QREFELT $ 200))
                                        . #15#)
                                  G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |g| (CAR #4#) . #15#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL (QCAR |g|) (QREFELT $ 127)) 1)
                                      (SEQ
                                       (LETT |a1v|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QCAR |g|) 0
                                                         (QREFELT $ 201))
                                               (SPADCALL (QCAR |g|)
                                                         (QREFELT $ 125))
                                               (QREFELT $ 80))
                                              (QREFELT $ 202))
                                             . #15#)
                                       (LETT |t1|
                                             (SPADCALL
                                              (|GUESS;POLYS2POLYF| |poly1| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 141))
                                             . #15#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t1| (QREFELT $ 204))
                                          (SEQ
                                           (LETT |t2|
                                                 (SPADCALL
                                                  (|GUESS;POLYS2POLYF| |poly2|
                                                   $)
                                                  (LIST |a1| A)
                                                  (LIST |a1v| |Av|)
                                                  (QREFELT $ 141))
                                                 . #15#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |t2| (QREFELT $ 204))
                                              (SEQ
                                               (LETT |ri1|
                                                     (SPADCALL
                                                      (|GUESS;SUPFPOLYS2FSUPPOLYS|
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          206))
                                                       $)
                                                      (|GUESS;SUPFPOLYS2FSUPPOLYS|
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          207))
                                                       $)
                                                      (QREFELT $ 208))
                                                     . #15#)
                                               (LETT |numr|
                                                     (|GUESS;SUPPOLYS2SUPF|
                                                      (SPADCALL |ri1|
                                                                (QREFELT $
                                                                         209))
                                                      |a1v| |Av| $)
                                                     . #15#)
                                               (LETT |denr|
                                                     (|GUESS;SUPPOLYS2SUPF|
                                                      (SPADCALL |ri1|
                                                                (QREFELT $
                                                                         210))
                                                      |a1v| |Av| $)
                                                     . #15#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |denr|
                                                            (QREFELT $ 124))
                                                  (COND
                                                   ((SPADCALL |numr|
                                                              (QREFELT $ 124))
                                                    (COND
                                                     ((SPADCALL |options|
                                                                (QREFELT $ 67))
                                                      (SPADCALL
                                                       "Guess: numerator and denominator vanish!"
                                                       (QREFELT $ 79)))))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |res4|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|GUESS;FSUPF2EXPRR|
                                                            |xx|
                                                            (SPADCALL |numr|
                                                                      |denr|
                                                                      (QREFELT
                                                                       $ 211))
                                                            $)
                                                           (SPADCALL |xx|
                                                                     (QREFELT $
                                                                              213))
                                                           (SPADCALL
                                                            (SPADCALL |xx|
                                                                      (QREFELT
                                                                       $ 39))
                                                            |basis|)
                                                           (QREFELT $ 215))
                                                          (SPADCALL |xx| |a1v|
                                                                    |Av|
                                                                    |extEXPR|)
                                                          (QREFELT $ 105))
                                                         . #15#)
                                                   (EXIT
                                                    (LETT |res|
                                                          (CONS |res4| |res|)
                                                          . #15#)))))))))))))))))))
                                  (LETT #4# (CDR #4#) . #15#) (GO G190) G191
                                  (EXIT NIL))))))))
                       (LETT #5# (CDR #5#) . #15#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL (NULL |res|))
                     (COND
                      ((SPADCALL |options| (QREFELT $ 75))
                       (PROGN (LETT #1# |res| . #15#) (GO #1#))))))))
                 (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #1# (EXIT #1#)))) 

(SDEFUN |GUESS;guessBinRatAux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|list| $ |xValues| |a1| A |ext|)
          (LETT |list| (QREFELT $$ 5) . #1=(|GUESS;guessBinRatAux|))
          (LETT $ (QREFELT $$ 4) . #1#)
          (LETT |xValues| (QREFELT $$ 3) . #1#)
          (LETT |a1| (QREFELT $$ 2) . #1#)
          (LETT A (QREFELT $$ 1) . #1#)
          (LETT |ext| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (|GUESS;F2FPOLYS| (SPADCALL |list| |z1| (QREFELT $ 53)) $)
             (SPADCALL (SPADCALL |xValues| |z1| (QREFELT $ 15)) |a1| A |ext|)
             (QREFELT $ 237)))))) 

(SDEFUN |GUESS;guessBinRatAux0|
        ((|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|ext| |Mapping|
          (|Fraction|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Integer|) (|OrderedVariableList| (|construct| '|a1| 'A))
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|extEXPR| |Mapping| EXPRR (|Symbol|) F F)
         (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G553 NIL) (|f| NIL) (#2=#:G552 NIL)
          (|xValues| (|List| (|Integer|))) (|newlist| (|List| F))
          (|i| (|Integer|)) (#3=#:G551 NIL) (|x| NIL) (|zeros| (EXPRR))
          (#4=#:G550 NIL) (|shortlist| (|List| F)) (#5=#:G533 NIL)
          (#6=#:G549 NIL) (|len| (|Integer|)) (|xx| (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((ZEROP (SPADCALL |options| (QREFELT $ 217)))
              (|error| "Guess: guessBinRat does not support zero safety")))
            (LETT |xx| (SPADCALL |options| (QREFELT $ 66))
                  . #7=(|GUESS;guessBinRatAux0|))
            (LETT |len| (LENGTH |list|) . #7#)
            (COND
             ((< (+ (- |len| (SPADCALL |options| (QREFELT $ 217))) 1) 0)
              (PROGN (LETT #6# NIL . #7#) (GO #6#))))
            (LETT |shortlist|
                  (SPADCALL |list|
                            (PROG1
                                (LETT #5#
                                      (+
                                       (- |len|
                                          (SPADCALL |options| (QREFELT $ 217)))
                                       1)
                                      . #7#)
                              (|check_subtype| (>= #5# 0)
                                               '(|NonNegativeInteger|) #5#))
                            (QREFELT $ 218))
                  . #7#)
            (LETT |zeros| (|spadConstant| $ 94) . #7#) (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #4# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 47) (QREFELT $ 109))
                         (LETT |zeros|
                               (SPADCALL |zeros|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |xx| (QREFELT $ 39))
                                           |basis|)
                                          (SPADCALL
                                           (SPADCALL |i| (QREFELT $ 45))
                                           |basis|)
                                          (QREFELT $ 95))
                                         (QREFELT $ 105))
                               . #7#)))))
                 (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #3# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 47) (QREFELT $ 55))
                         (SEQ
                          (LETT |newlist|
                                (CONS
                                 (SPADCALL |x|
                                           (SPADCALL
                                            (SPADCALL |zeros|
                                                      (SPADCALL |xx|
                                                                (QREFELT $ 39))
                                                      (SPADCALL |i|
                                                                (QREFELT $ 45))
                                                      (QREFELT $ 46))
                                            (QREFELT $ 9))
                                           (QREFELT $ 80))
                                 |newlist|)
                                . #7#)
                          (EXIT
                           (LETT |xValues| (CONS |i| |xValues|) . #7#)))))))
                 (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |newlist| (REVERSE |newlist|) . #7#)
            (LETT |xValues| (REVERSE |xValues|) . #7#)
            (LETT |res|
                  (PROGN
                   (LETT #2# NIL . #7#)
                   (SEQ (LETT |f| NIL . #7#)
                        (LETT #1#
                              (|GUESS;guessBinRatAux| |xx| |newlist| |basis|
                               |ext| |extEXPR| |xValues| |options| $)
                              . #7#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |f| (CAR #1#) . #7#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL |zeros| |f| (QREFELT $ 105))
                                  (SPADCALL |xx| (QREFELT $ 39))
                                  (SPADCALL |xx| (QREFELT $ 39))
                                  (QREFELT $ 46))
                                 #2#)
                                . #7#)))
                        (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #7#)
            (EXIT
             (SPADCALL
              (CONS #'|GUESS;guessBinRatAux0!0|
                    (VECTOR |options| $ |list| |len| |xx|))
              |res| (QREFELT $ 222)))))
          #6# (EXIT #6#)))) 

(SDEFUN |GUESS;guessBinRatAux0!0| ((|z1| NIL) ($$ NIL))
        (PROG (|xx| |len| |list| $ |options|)
          (LETT |xx| (QREFELT $$ 4) . #1=(|GUESS;guessBinRatAux0|))
          (LETT |len| (QREFELT $$ 3) . #1#)
          (LETT |list| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |options| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|GUESS;checkResult| |z1| |xx| |len| |list| $)
                      (SPADCALL |len| (SPADCALL |options| (QREFELT $ 217))
                                (QREFELT $ 219))
                      (QREFELT $ 220)))))) 

(SDEFUN |GUESS;guessBinRat;LL;32| ((|list| |List| F) ($ |List| EXPRR))
        (|GUESS;guessBinRatAux0| |list| (CONS (|function| |GUESS;defaultD|) $)
         (CONS (|function| |GUESS;binExt|) $)
         (CONS (|function| |GUESS;binExtEXPR|) $) NIL $)) 

(SDEFUN |GUESS;guessBinRat;LLL;33|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (|GUESS;guessBinRatAux0| |list| (CONS (|function| |GUESS;defaultD|) $)
         (CONS (|function| |GUESS;binExt|) $)
         (CONS (|function| |GUESS;binExtEXPR|) $) |options| $)) 

(SDEFUN |GUESS;qD| ((|q| |Symbol|) ($ |Mapping| EXPRR EXPRR))
        (SPROG NIL (CONS #'|GUESS;qD!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESS;qD!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;qD|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |q| (QREFELT $ 39)) |z1| (QREFELT $ 216)))))) 

(SDEFUN |GUESS;qBinExtAux|
        ((|q| |Symbol|) (|i| |Integer|)
         (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A))
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (SPROG
         ((|fl|
           (|List|
            (|Fraction|
             (|SparseMultivariatePolynomial| S
                                             (|OrderedVariableList|
                                              (|construct| '|a1| 'A))))))
          (|l| NIL) (#1=#:G577 NIL))
         (SEQ
          (LETT |fl|
                (PROGN
                 (LETT #1# NIL . #2=(|GUESS;qBinExtAux|))
                 (SEQ (LETT |l| 1 . #2#) G190
                      (COND ((|greater_SI| |l| |i|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 241)
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |va1| (QREFELT $ 172))
                                             (QREFELT $ 173))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |vA| (QREFELT $ 172))
                                              (QREFELT $ 173))
                                             (- |i| 1) (QREFELT $ 178))
                                            (QREFELT $ 174))
                                           (SPADCALL
                                            (|GUESS;F2FPOLYS|
                                             (SPADCALL |q| (QREFELT $ 242)) $)
                                            |l| (QREFELT $ 178))
                                           (QREFELT $ 174))
                                          (QREFELT $ 189))
                                (SPADCALL (|spadConstant| $ 241)
                                          (SPADCALL
                                           (|GUESS;F2FPOLYS|
                                            (SPADCALL |q| (QREFELT $ 242)) $)
                                           |l| (QREFELT $ 178))
                                          (QREFELT $ 189))
                                (QREFELT $ 237))
                               #1#)
                              . #2#)))
                      (LETT |l| (|inc_SI| |l|) . #2#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                . #2#)
          (EXIT
           (SPADCALL (ELT $ 174) |fl| (|spadConstant| $ 241)
                     (QREFELT $ 244)))))) 

(SDEFUN |GUESS;qBinExt|
        ((|q| |Symbol|)
         ($ |Mapping|
          (|Fraction|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Integer|) (|OrderedVariableList| (|construct| '|a1| 'A))
          (|OrderedVariableList| (|construct| '|a1| 'A))))
        (SPROG NIL (CONS #'|GUESS;qBinExt!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESS;qBinExt!0| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;qBinExt|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;qBinExtAux| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;qBinExtEXPRaux|
        ((|q| |Symbol|) (|i| |Symbol|) (|a1v| F) (|Av| F) ($ EXPRR))
        (SPROG ((|l| (|Symbol|)))
               (SEQ (LETT |l| '|l| |GUESS;qBinExtEXPRaux|)
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 94)
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                                            (SPADCALL
                                             (SPADCALL |Av| (QREFELT $ 10))
                                             (SPADCALL
                                              (SPADCALL |i| (QREFELT $ 39))
                                              (|spadConstant| $ 94)
                                              (QREFELT $ 95))
                                             (QREFELT $ 216))
                                            (QREFELT $ 105))
                                  (SPADCALL (SPADCALL |q| (QREFELT $ 39))
                                            (SPADCALL |l| (QREFELT $ 39))
                                            (QREFELT $ 216))
                                  (QREFELT $ 105))
                                 (QREFELT $ 95))
                       (SPADCALL (|spadConstant| $ 94)
                                 (SPADCALL (SPADCALL |q| (QREFELT $ 39))
                                           (SPADCALL |l| (QREFELT $ 39))
                                           (QREFELT $ 216))
                                 (QREFELT $ 95))
                       (QREFELT $ 54))
                      (SPADCALL |l|
                                (SPADCALL (|spadConstant| $ 94)
                                          (SPADCALL |i| (QREFELT $ 39))
                                          (QREFELT $ 97))
                                (QREFELT $ 99))
                      (QREFELT $ 101)))))) 

(SDEFUN |GUESS;qBinExtEXPR| ((|q| |Symbol|) ($ |Mapping| EXPRR (|Symbol|) F F))
        (SPROG NIL (CONS #'|GUESS;qBinExtEXPR!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESS;qBinExtEXPR!0| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;qBinExtEXPR|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;qBinExtEXPRaux| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;guessBinRat;SM;39|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessBinRat;SM;39!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESS;guessBinRat;SM;39!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;guessBinRat;SM;39|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;guessBinRatAux0| |z1| (|GUESS;qD| |q| $)
             (|GUESS;qBinExt| |q| $) (|GUESS;qBinExtEXPR| |q| $) |z2| $))))) 

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
          (LETT |maxP| (SPADCALL |options| (QREFELT $ 247))
                . #1=(|GUESS;FilteredPartitionStream|))
          (LETT |homo| (SPADCALL |options| (QREFELT $ 249)) . #1#)
          (COND
           ((QEQCAR |homo| 1)
            (COND
             ((QCDR |homo|)
              (EXIT
               (|error|
                "Guess: internal error - homogeneous should not be true in FilteredPartitionStream")))))
           (#2='T (LETT |maxP| (CONS 0 (QCDR |homo|)) . #1#)))
          (LETT |maxD| (SPADCALL |options| (QREFELT $ 250)) . #1#)
          (LETT |Somo| (SPADCALL |options| (QREFELT $ 251)) . #1#)
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
                              (QREFELT $ 254))
                    . #1#))
             (#2#
              (SEQ (LETT |s1| (SPADCALL (ELT $ 255) 1 (QREFELT $ 258)) . #1#)
                   (LETT |s2|
                         (COND
                          ((QEQCAR |maxD| 0)
                           (SPADCALL
                            (CONS #'|GUESS;FilteredPartitionStream!0|
                                  (VECTOR $ |maxD|))
                            |s1| (QREFELT $ 264)))
                          ((QEQCAR |maxP| 0)
                           (SPADCALL
                            (CONS #'|GUESS;FilteredPartitionStream!1|
                                  (VECTOR $ |maxP|))
                            |s1| (QREFELT $ 264)))
                          (#2# (SPADCALL (ELT $ 265) |s1| (QREFELT $ 264))))
                         . #1#)
                   (LETT |s3| (SPADCALL |s2| (QREFELT $ 267)) . #1#)
                   (EXIT
                    (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 268)) . #1#))))))
           (#2#
            (SEQ (LETT |s1| (SPADCALL (ELT $ 255) 1 (QREFELT $ 258)) . #1#)
                 (LETT |s2|
                       (COND
                        ((QEQCAR |maxD| 0)
                         (SPADCALL
                          (CONS #'|GUESS;FilteredPartitionStream!2|
                                (VECTOR $ |maxD|))
                          |s1| (QREFELT $ 264)))
                        ((QEQCAR |maxP| 0)
                         (SPADCALL
                          (CONS #'|GUESS;FilteredPartitionStream!3|
                                (VECTOR $ |maxP|))
                          |s1| (QREFELT $ 264)))
                        (#2# (SPADCALL (ELT $ 265) |s1| (QREFELT $ 264))))
                       . #1#)
                 (LETT |s3| (SPADCALL |s2| (QREFELT $ 267)) . #1#)
                 (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 268)) . #1#)))))
          (LETT |s| (SPADCALL |s| (QREFELT $ 269)) . #1#)
          (COND
           ((QEQCAR |homo| 0)
            (LETT |s|
                  (SPADCALL
                   (CONS #'|GUESS;FilteredPartitionStream!4| (VECTOR |maxP| $))
                   |s| (QREFELT $ 273))
                  . #1#)))
          (COND
           ((QEQCAR |Somo| 0)
            (LETT |s|
                  (SPADCALL
                   (CONS #'|GUESS;FilteredPartitionStream!5| (VECTOR |Somo| $))
                   |s| (QREFELT $ 273))
                  . #1#)))
          (EXIT |s|)))) 

(SDEFUN |GUESS;FilteredPartitionStream!5| ((|z1| NIL) ($$ NIL))
        (PROG ($ |Somo|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT |Somo| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (ELT $ 16) |z1| (|spadConstant| $ 275) (QREFELT $ 18))
             (SPADCALL (QCDR |Somo|) (SPADCALL |z1| (QREFELT $ 270))
                       (QREFELT $ 259))
             (QREFELT $ 276)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!4| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxP|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT |maxP| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G594 NIL))
                   (SPADCALL (SPADCALL |z1| (QREFELT $ 270))
                             (PROG2 (LETT #2# |maxP| NIL)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 0)
                                              (|PositiveInteger|) #2#))
                             (QREFELT $ 271))))))) 

(SDEFUN |GUESS;FilteredPartitionStream!3| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 260)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!2| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| $ 108) (QREFELT $ 259))
             |z1| |z1| (QREFELT $ 260)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!1| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 260)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| $ 108) (QREFELT $ 259))
             |z1| |z1| (QREFELT $ 260)))))) 

(SDEFUN |GUESS;termAsEXPRR|
        ((|f| EXPRR) (|xx| |Symbol|) (|partition| |List| (|Integer|))
         (DX |Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|))
         (D1X |Mapping| EXPRR (|Symbol|)) ($ EXPRR))
        (SPROG
         ((|fl| (|List| EXPRR)) (#1=#:G632 NIL) (#2=#:G631 NIL) (#3=#:G640 NIL)
          (|part| NIL) (#4=#:G639 NIL) (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) (SPADCALL |xx| D1X))
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
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
                                                            (QREFELT $ 280))
                                                  . #5#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 128))
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (EXIT (SPADCALL (ELT $ 105) |fl| (QREFELT $ 282))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|degreeLoss| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|fl| (|List| (|U32Vector|))) (#1=#:G644 NIL) (#2=#:G643 NIL)
          (#3=#:G653 NIL) (|part| NIL) (#4=#:G652 NIL)
          (|ll| (|List| (|List| (|Integer|)))) (|d| (|NonNegativeInteger|))
          (#5=#:G642 NIL) (#6=#:G651 NIL) (|i| NIL) (#7=#:G650 NIL))
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
             (QREFELT $ 284)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1
                       (LETT #5# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1) . #8#)
                     (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                   . #8#)
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 279)) . #8#)
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
                                             |prime| (QREFELT $ 286))
                                   (PROG1
                                       (LETT #1#
                                             (SPADCALL |part| (QREFELT $ 280))
                                             . #8#)
                                     (|check_subtype| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      #1#))
                                   |d| |prime| (QREFELT $ 287))
                                  #4#)
                                 . #8#)))
                         (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   . #8#)
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 291))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2) . #1=(|GUESS;termAsU32VectorDiff|))
          (LETT |prime| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 288)))))) 

(SDEFUN |GUESS;termAsU32VectorShift|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|degreeLoss| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G670 NIL) (|e| NIL) (|i| NIL) (|r| (|U32Vector|))
          (|fl| (|List| (|U32Vector|))) (#2=#:G656 NIL) (#3=#:G669 NIL)
          (|j| NIL) (#4=#:G668 NIL) (#5=#:G667 NIL) (|part| NIL)
          (#6=#:G666 NIL) (|ll| (|List| (|List| (|Integer|))))
          (|d| (|NonNegativeInteger|)) (#7=#:G655 NIL) (#8=#:G665 NIL)
          (#9=#:G664 NIL))
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
             (QREFELT $ 284)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1
                       (LETT #7# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1)
                             . #10#)
                     (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|) #7#))
                   . #10#)
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 279)) . #10#)
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
                                                                          280))
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
                                   (QREFELT $ 284))
                                  #6#)
                                 . #10#)))
                         (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   . #10#)
             (LETT |r| (GETREFV_U32 (+ |d| 1) 0) . #10#)
             (SPADCALL |r| (|SPADfirst| |fl|) (+ |d| 1) (QREFELT $ 292))
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
         ((|fl| (|List| (|UnivariateFormalPowerSeries| F))) (#1=#:G679 NIL)
          (#2=#:G678 NIL) (#3=#:G687 NIL) (|part| NIL) (#4=#:G686 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
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
                                                            (QREFELT $ 280))
                                                  . #5#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 294))
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (EXIT (SPADCALL (ELT $ 295) |fl| (QREFELT $ 298))))))))) 

(SDEFUN |GUESS;termAsUFPSF2|
        ((|f| |UnivariateFormalPowerSeries| F) (|partition| |List| (|Integer|))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG
         ((|fl| (|List| (|UnivariateFormalPowerSeries| F))) (#1=#:G691 NIL)
          (#2=#:G699 NIL) (|part| NIL) (#3=#:G698 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
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
                                        (QREFELT $ 301))
                                       #3#)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT (SPADCALL (ELT $ 303) |fl| (QREFELT $ 298))))))))) 

(SDEFUN |GUESS;termAsUFPSF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1) . #1=(|GUESS;termAsUFPSF2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G689 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #2# (SPADCALL |part| (QREFELT $ 280))
                                       NIL)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 299))))))) 

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
          (#1=#:G702 NIL) (#2=#:G710 NIL) (|part| NIL) (#3=#:G709 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1F)
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
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
                                        (QREFELT $ 308))
                                       #3#)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT (SPADCALL (ELT $ 310) |fl| (QREFELT $ 313))))))))) 

(SDEFUN |GUESS;termAsUFPSSUPF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1) . #1=(|GUESS;termAsUFPSSUPF2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G700 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #2# (SPADCALL |part| (QREFELT $ 280))
                                       NIL)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 305))))))) 

(SDEFUN |GUESS;ADEguessStream|
        ((|f| |UnivariateFormalPowerSeries| F)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |Stream| (|UnivariateFormalPowerSeries| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;ADEguessStream!0| (VECTOR $ D1 DS |f|))
                         |partitions| (QREFELT $ 317)))) 

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
                |partitions| (QREFELT $ 317)))) 

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
         ((|i| NIL) (#1=#:G732 NIL) (|r| NIL) (|res| (|Vector| (|U32Vector|)))
          (#2=#:G730 NIL) (#3=#:G731 NIL) (|res1| (|U32Vector|))
          (#4=#:G721 NIL) (|nt| (|NonNegativeInteger|)) (#5=#:G728 NIL)
          (#6=#:G729 NIL) (|pp| NIL))
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
                                              (SPADCALL |pp| (QREFELT $ 280)))
                                      (- |sigma| 1) |prime| (QREFELT $ 288)))))
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
                 (SPADCALL |res| 1 |res1| (QREFELT $ 329))
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
                                   (QREFELT $ 329))))
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
                                   (QREFELT $ 329))))
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
         ((|i| NIL) (#1=#:G737 NIL) (|f| (|U32Vector|))
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
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 330))
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
                                         (QREFELT $ 331)))))
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
         ((|i| NIL) (#1=#:G754 NIL) (|r| NIL)
          (|res|
           (|Vector|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#2=#:G752 NIL) (#3=#:G753 NIL) (|nt| (|NonNegativeInteger|))
          (#4=#:G750 NIL) (#5=#:G751 NIL) (|pp| NIL)
          (|cache|
           (|PrimitiveArray|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|np| (|NonNegativeInteger|)))
         (SEQ (LETT |np| (LENGTH |prodl|) . #6=(|GUESS;ADEtestGenCached|))
              (LETT |cache|
                    (MAKEARR1 (+ (+ |maxD| 1) |np|) (|spadConstant| $ 322))
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
                                                            (QREFELT $ 280)))
                                          (QREFELT $ 332)))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |nt| (LENGTH |terml|) . #6#)
              (COND
               (|addOne|
                (SEQ
                 (LETT |res| (MAKEARR1 (+ |nt| 1) (|spadConstant| $ 322))
                       . #6#)
                 (SPADCALL |res| 1 D1F (QREFELT $ 337))
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
                                   (QREFELT $ 337))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL)))))
               ('T
                (SEQ (LETT |res| (MAKEARR1 |nt| (|spadConstant| $ 322)) . #6#)
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
                                       (QREFELT $ 337))))
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
                         (NULL (SPADCALL (* |n| |i|) |deg| (QREFELT $ 338))))
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
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 330))
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
         ((#1=#:G779 NIL) (|j| (|Integer|))
          (|r| (|Union| (|Partition|) "failed")) (#2=#:G780 NIL) (|p| NIL)
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
                      (LETT |r| (SPADCALL |partition| |p| (QREFELT $ 339))
                            . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |r| 0)
                         (SEQ
                          (LETT |j|
                                (SPADCALL (QCDR |r|) |partitions|
                                          (QREFELT $ 341))
                                . #3#)
                          (EXIT
                           (COND
                            ((SPADCALL |j| 0 (QREFELT $ 342))
                             (PROGN
                              (LETT #1# (CONS 0 (LIST |i| |j|)) . #3#)
                              (GO #1#))))))))))
                     (LETT #2#
                           (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #3#))
                           . #3#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 1 "failed"))))
          #1# (EXIT #1#)))) 

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
                  (SPADCALL |parts0| (QREFELT $ 344)) $)
                 . #1=(|GUESS;optimiseProducts1|))
           (EXIT
            (COND
             ((QEQCAR |r| 1)
              (SEQ
               (|GUESS;optimiseProducts1|
                (SPADCALL (CDR (SPADCALL |p| (QREFELT $ 345))) (QREFELT $ 346))
                |prods0| |parts0| $)
               (EXIT
                (LETT |r|
                      (|GUESS;optimiseFactor| |p|
                       (SPADCALL |parts0| (QREFELT $ 344)) $)
                      . #1#)))))))
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (|error| "Internal error: failed adding intermediate partition"))
            ('T
             (SEQ
              (LETT |lp0| (LENGTH (SPADCALL |parts0| (QREFELT $ 344))) . #1#)
              (SPADCALL |prods0|
                        (CONS
                         (LIST (- |lp0| (|SPADfirst| (QCDR |r|)))
                               (- |lp0| (SPADCALL (QCDR |r|) (QREFELT $ 280))))
                         (SPADCALL |prods0| (QREFELT $ 348)))
                        (QREFELT $ 349))
              (EXIT
               (SPADCALL |parts0|
                         (CONS |p| (SPADCALL |parts0| (QREFELT $ 344)))
                         (QREFELT $ 350)))))))))) 

(SDEFUN |GUESS;optimiseProducts|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Record| (|:| |addOne| (|Boolean|))
          (|:| |maxDiff| (|NonNegativeInteger|))
          (|:| |prods| (|List| (|List| (|Integer|))))
          (|:| |terms| (|List| (|Integer|)))))
        (SPROG
         ((#1=#:G796 NIL) (|terms0| (|List| (|Integer|))) (#2=#:G800 NIL)
          (|p| NIL) (|parts0| (|Reference| (|List| (|Partition|)))) (|i| NIL)
          (#3=#:G799 NIL)
          (|prods0| (|Reference| (|List| (|List| (|Integer|)))))
          (|maxD0| (|Integer|)) (#4=#:G798 NIL) (|addOne0| (|Boolean|)))
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
                       (GO #4#))))))))
            (LETT |maxD0|
                  (SPADCALL (ELT $ 351)
                            (SPADCALL (ELT $ 352) |partitions| (QREFELT $ 355))
                            (QREFELT $ 356))
                  . #5#)
            (LETT |prods0| (SPADCALL NIL (QREFELT $ 357)) . #5#)
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
                                 (CONS (SPADCALL (LIST |i|) (QREFELT $ 346))
                                       #3#)
                                 . #5#)))
                         (LETT |i| (+ |i| -1) . #5#) (GO G190) G191
                         (EXIT (NREVERSE #3#))))
                   (QREFELT $ 358))
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
                      (|GUESS;optimiseProducts1| (SPADCALL |p| (QREFELT $ 346))
                       |prods0| |parts0| $)
                      (EXIT
                       (LETT |terms0|
                             (CONS
                              (- (LENGTH (SPADCALL |parts0| (QREFELT $ 344)))
                                 1)
                              |terms0|)
                             . #5#)))))))
                 (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (VECTOR |addOne0|
                     (PROG1 (LETT #1# (- |maxD0| 1) . #5#)
                       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                        #1#))
                     (NREVERSE (SPADCALL |prods0| (QREFELT $ 348)))
                     (NREVERSE |terms0|)))))
          #4# (EXIT #4#)))) 

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
            (SPROG ((#2=#:G824 NIL) (|p| NIL) (#3=#:G823 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 359))
                                (|spadConstant| $ 360) (QREFELT $ 330))
                      (|error| "ADEguessModGen2, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 361)) NIL)
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
                             (QREFELT $ 362)))))))))))) 

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
            (SPROG ((#2=#:G837 NIL) (|p| NIL) (#3=#:G836 NIL))
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
                     (QREFELT $ 363)))))))) 

(SDEFUN |GUESS;ADEEXPRRStream|
        ((|f| EXPRR) (|xx| |Symbol|)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DX |Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|))
         (D1X |Mapping| EXPRR (|Symbol|)) ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GUESS;ADEEXPRRStream!0| (VECTOR $ D1X DX |xx| |f|))
                |partitions| (QREFELT $ 367)))) 

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
                  (QREFELT $ 373))) 

(SDEFUN |GUESS;ADEdegreeStream!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPROG ((#1=#:G845 NIL))
               (SPADCALL
                (COND ((SPADCALL |z1| (QREFELT $ 368)) (|spadConstant| $ 275))
                      ('T
                       (PROG1
                           (LETT #1#
                                 (SPADCALL (SPADCALL |z1| (QREFELT $ 352))
                                           (|spadConstant| $ 360)
                                           (QREFELT $ 219))
                                 NIL)
                         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                          #1#))))
                |z2| (QREFELT $ 369)))) 

(SDEFUN |GUESS;diffDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| |x| |n| (QREFELT $ 374))) 

(SDEFUN |GUESS;diffDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| |n| (QREFELT $ 375))) 

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
          (SPADCALL |s| |n| (QREFELT $ 376))))) 

(SDEFUN |GUESS;diffAX|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 39)) |l| (QREFELT $ 128))
                  |f| (QREFELT $ 105))) 

(SDEFUN |GUESS;diffA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 378))) 

(SDEFUN |GUESS;diffAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 380))) 

(SDEFUN |GUESS;diffC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 381))) 

(SDEFUN |GUESS;diff1X| ((|x| |Symbol|) ($ EXPRR)) (|spadConstant| $ 94)) 

(SDEFUN |GUESS;diffHP;LR;74|
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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 382))))
            (|error|
             "Guess: no support for mixed shifts in differential equations")))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 383))
                . #1=(|GUESS;diffHP;LR;74|))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                    . #1#)
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
              (EXIT
               (VECTOR |degrees|
                       (CONS #'|GUESS;diffHP;LR;74!0| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;74!1| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;74!2| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;74!3| (VECTOR $ |partitions|))
                       '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                       (CONS (|function| |GUESS;diffAF|) $)
                       (CONS (|function| |GUESS;diffAX|) $)
                       (CONS (|function| |GUESS;diffC|) $)))))
            ('T (|error| "Guess: guessADE supports only displayAsGF"))))))) 

(SDEFUN |GUESS;diffHP;LR;74!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;74|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;diffDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;diffHP;LR;74!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;74|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G872 NIL) (|i| NIL) (#3=#:G871 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 387))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;diffDSF|) $)
                     (|spadConstant| $ 327) $))))))) 

(SDEFUN |GUESS;diffHP;LR;74!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;74|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384))
                        (QREFELT $ 385))
              (QREFELT $ 386))
             $))))) 

(SDEFUN |GUESS;diffHP;LR;74!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;74|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;diffDS|) $) (|spadConstant| $ 326) $))))) 

(SDEFUN |GUESS;monomialAsEXPRR|
        ((|fl0| |List| EXPRR) (|partition| |List| (|Integer|)) ($ EXPRR))
        (SPROG
         ((|fl| (|List| EXPRR)) (#1=#:G908 NIL) (#2=#:G907 NIL) (#3=#:G916 NIL)
          (|part| NIL) (#4=#:G915 NIL) (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) (|spadConstant| $ 94))
                ('T
                 (SEQ
                  (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
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
                                                  (QREFELT $ 400))
                                        (PROG1
                                            (LETT #1#
                                                  (SPADCALL |part|
                                                            (QREFELT $ 280))
                                                  . #5#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 128))
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (EXIT (SPADCALL (ELT $ 105) |fl| (QREFELT $ 282))))))))) 

(SDEFUN |GUESS;DEPEXPRRStream|
        ((|fl| |List| EXPRR) (|partitions| |Stream| (|List| (|Integer|)))
         ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;DEPEXPRRStream!0| (VECTOR $ |fl|))
                         |partitions| (QREFELT $ 367)))) 

(SDEFUN |GUESS;DEPEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|fl| $)
          (LETT |fl| (QREFELT $$ 1) . #1=(|GUESS;DEPEXPRRStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;monomialAsEXPRR| |fl| |z1| $))))) 

(SDEFUN |GUESS;get_fnames|
        ((|n| |Integer|) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((#1=#:G930 NIL) (|sym| NIL) (#2=#:G929 NIL)
          (|syms| (|List| (|Symbol|))) (#3=#:G928 NIL) (|i| NIL)
          (#4=#:G927 NIL) (|snums| (|List| (|String|))) (|q| NIL)
          (#5=#:G926 NIL) (|n1| (|NonNegativeInteger|)))
         (SEQ
          (LETT |syms| (SPADCALL |options| (QREFELT $ 401))
                . #6=(|GUESS;get_fnames|))
          (LETT |n1| (LENGTH |syms|) . #6#)
          (COND
           ((SPADCALL |n1| 0 (QREFELT $ 402))
            (COND
             ((SPADCALL |n1| |n| (QREFELT $ 403))
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
                                             (QREFELT $ 404))
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
                   (LETT #2# (CONS (SPADCALL |sym| (QREFELT $ 39)) #2#)
                         . #6#)))
                 (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |GUESS;algDepHP;LLR;78|
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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 382))))
            (|error|
             "Guess: no support for mixed shifts in algebraic dependencies")))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 383))
                . #1=(|GUESS;algDepHP;LLR;78|))
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsEQ| (QREFELT $ 405))
             (|error| "Guess: guessAlgDep supports only displayAsEQ"))
            ('T
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                    . #1#)
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
              (LETT |fl| (|GUESS;get_fnames| (LENGTH |lists|) |options| $)
                    . #1#)
              (LETT |fakeDS|
                    (CONS #'|GUESS;algDepHP;LLR;78!0| (VECTOR $ |lists|))
                    . #1#)
              (LETT |fakeDSF|
                    (CONS #'|GUESS;algDepHP;LLR;78!1| (VECTOR $ |lists|))
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;algDepHP;LLR;78!2| $) |partitions|
                          (QREFELT $ 409))
                (CONS #'|GUESS;algDepHP;LLR;78!3|
                      (VECTOR $ |fakeDS| |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;78!4| (VECTOR $ |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;78!5|
                      (VECTOR |fakeDSF| $ |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;78!6| (VECTOR $ |partitions| |fl|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                (CONS (|function| |GUESS;diffAF|) $)
                (CONS (|function| |GUESS;diffAX|) $)
                (CONS (|function| |GUESS;diffC|) $)))))))))) 

(SDEFUN |GUESS;algDepHP;LLR;78!6| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|fl| |partitions| $)
          (LETT |fl| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;78|))
          (LETT |partitions| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;DEPEXPRRStream| |fl| |partitions| $))))) 

(SDEFUN |GUESS;algDepHP;LLR;78!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |fakeDSF|)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;78|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |fakeDSF| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G949 NIL) (|i| NIL) (#3=#:G948 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 387))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     |fakeDSF| (|spadConstant| $ 327) $))))))) 

(SDEFUN |GUESS;algDepHP;LLR;78!4| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;78|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;DEPguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384))
                        (QREFELT $ 385))
              (QREFELT $ 386))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;78!3| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| |fakeDS| $)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;78|))
          (LETT |fakeDS| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions| |fakeDS|
             (|spadConstant| $ 326) $))))) 

(SDEFUN |GUESS;algDepHP;LLR;78!2| ((|c| NIL) ($ NIL)) (|spadConstant| $ 275)) 

(SDEFUN |GUESS;algDepHP;LLR;78!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;78|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;list2UFPSSUPF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 360) (QREFELT $ 259))
                       (QREFELT $ 407))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;78!0| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;78|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;list2UFPSF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 360) (QREFELT $ 259))
                       (QREFELT $ 407))
             $))))) 

(SDEFUN |GUESS;substDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 39))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 39)) (+ |n| 1)
                            (QREFELT $ 128))
                  (QREFELT $ 46))) 

(SDEFUN |GUESS;substDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG ((#1=#:G965 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1) |GUESS;substDS|)
                           (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                            #1#))
                         (QREFELT $ 411)))) 

(SDEFUN |GUESS;substDSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG ((#1=#:G967 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1) |GUESS;substDSF|)
                           (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                            #1#))
                         (QREFELT $ 412)))) 

(SDEFUN |GUESS;substHP;LR;82|
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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 382))))
            (|error|
             "Guess: no support for mixed shifts in functional equations")))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 383))
                . #1=(|GUESS;substHP;LR;82|))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;substHP;LR;82!0| $) |partitions|
                          (QREFELT $ 409))
                (CONS #'|GUESS;substHP;LR;82!1| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;82!2| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;82!3| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;82!4| (VECTOR $ |partitions|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                (CONS (|function| |GUESS;diffAF|) $)
                (CONS (|function| |GUESS;diffAX|) $)
                (CONS (|function| |GUESS;diffC|) $)))))
            ('T (|error| "Guess: guessSubst supports only displayAsGF"))))))) 

(SDEFUN |GUESS;substHP;LR;82!4| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;82|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;substDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;substHP;LR;82!3| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;82|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G985 NIL) (|i| NIL) (#3=#:G984 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 387))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;substDSF|) $)
                     (|spadConstant| $ 327) $))))))) 

(SDEFUN |GUESS;substHP;LR;82!2| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;82|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;FEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384))
                        (QREFELT $ 385))
              (QREFELT $ 386))
             $))))) 

(SDEFUN |GUESS;substHP;LR;82!1| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;82|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;substDS|) $) (|spadConstant| $ 326) $))))) 

(SDEFUN |GUESS;substHP;LR;82!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 275)) 

(SDEFUN |GUESS;qDiffDX|
        ((|q| |Symbol|) (|expr| EXPRR) (|x| |Symbol|)
         (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 39))
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT $ 39)) |n| (QREFELT $ 128))
                   (SPADCALL |x| (QREFELT $ 39)) (QREFELT $ 105))
                  (QREFELT $ 46))) 

(SDEFUN |GUESS;qDiffDS|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|n| |NonNegativeInteger|) ($ |UnivariateFormalPowerSeries| F))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;qDiffDS!0| (VECTOR |n| $ |q|)) |s|
                         (QREFELT $ 416)))) 

(SDEFUN |GUESS;qDiffDS!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;qDiffDS|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1006 NIL))
                   (SPADCALL (SPADCALL |q| (QREFELT $ 242))
                             (PROG1
                                 (LETT #2# (SPADCALL |n| |z1| (QREFELT $ 414))
                                       NIL)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 299))))))) 

(SDEFUN |GUESS;qDiffDSV|
        ((|f| |U32Vector|) (|n| |NonNegativeInteger|) (|prime| |Integer|)
         (|q| |Integer|) ($ |U32Vector|))
        (SPROG
         ((Q (|Integer|)) (|i| NIL) (|qn| (|Integer|)) (|r| (|U32Vector|))
          (#1=#:G1010 NIL) (|d| (|Integer|)))
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
                       ((SPADCALL |d| 0 (QREFELT $ 342))
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
                         (QREFELT $ 420)))) 

(SDEFUN |GUESS;qDiffDSF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;qDiffDSF|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1017 NIL))
                   (SPADCALL
                    (SPADCALL (SPADCALL |q| (QREFELT $ 242)) (QREFELT $ 418))
                    (PROG1 (LETT #2# (SPADCALL |n| |z1| (QREFELT $ 414)) NIL)
                      (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                    (QREFELT $ 305))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|q| |Integer|) (|dl| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|fl| (|List| (|U32Vector|))) (#1=#:G1023 NIL) (#2=#:G1022 NIL)
          (#3=#:G1033 NIL) (|part| NIL) (#4=#:G1032 NIL)
          (|ll| (|List| (|List| (|Integer|)))) (|d| (|NonNegativeInteger|))
          (#5=#:G1021 NIL) (#6=#:G1031 NIL) (|i| NIL) (#7=#:G1030 NIL))
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
             (QREFELT $ 284)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #5# (- (- (QV_LEN_U32 |f|) |dl|) 1) . #8#)
                     (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                   . #8#)
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 279)) . #8#)
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
                                             (SPADCALL |part| (QREFELT $ 280))
                                             . #8#)
                                     (|check_subtype| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      #1#))
                                   |d| |prime| (QREFELT $ 287))
                                  #4#)
                                 . #8#)))
                         (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   . #8#)
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorqDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 291))))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2) . #1=(|GUESS;termAsU32VectorqDiff|))
          (LETT |prime| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 288)))))) 

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
            (SPROG ((#2=#:G1039 NIL) (|p| NIL) (#3=#:G1038 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 359))
                                (|spadConstant| $ 360) (QREFELT $ 330))
                      (|error| "ADEguessModGenq, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 361)) NIL)
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
                             (QREFELT $ 362)))))))))))) 

(SDEFUN |GUESS;diffHP;SM;89|
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
        (SPROG NIL (SEQ (CONS #'|GUESS;diffHP;SM;89!8| (VECTOR |q| $))))) 

(SDEFUN |GUESS;diffHP;SM;89!8| ((|l1| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;diffHP;SM;89|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|partitions| NIL))
                   (SEQ
                    (COND
                     ((NULL
                       (SPADCALL (SPADCALL |l1| (QREFELT $ 382))
                                 (QREFELT $ 421)))
                      (|error|
                       "Guess: no support for mixed shifts in differential equations")))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |l1| (QREFELT $ 383)) '|displayAsGF|
                                 (QREFELT $ 422))
                       (SEQ
                        (LETT |partitions|
                              (|GUESS;FilteredPartitionStream| |l1| $) NIL)
                        (EXIT
                         (VECTOR
                          (SPADCALL (CONS #'|GUESS;diffHP;SM;89!0| $)
                                    |partitions| (QREFELT $ 409))
                          (CONS #'|GUESS;diffHP;SM;89!2|
                                (VECTOR |q| $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;89!3|
                                (VECTOR $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;89!5|
                                (VECTOR |q| $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;89!7|
                                (VECTOR |q| $ |partitions|))
                          '|qdiffHP| |q| (CONS (|function| |GUESS;diffA|) $)
                          (CONS (|function| |GUESS;diffAF|) $)
                          (CONS (|function| |GUESS;diffAX|) $)
                          (CONS (|function| |GUESS;diffC|) $)))))
                      ('T
                       (|error|
                        "Guess: guessADE supports only displayAsGF")))))))))) 

(SDEFUN |GUESS;diffHP;SM;89!7| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |q| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
                    (CONS #'|GUESS;diffHP;SM;89!6| (VECTOR $ |q|))
                    (CONS (|function| |GUESS;diff1X|) $) $)))))) 

(SDEFUN |GUESS;diffHP;SM;89!6| ((|w1| NIL) (|w2| NIL) (|w3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qDiffDX| |q| |w1| |w2| |w3| $))))) 

(SDEFUN |GUESS;diffHP;SM;89!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |q| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG ((#1=#:G1055 NIL) (|i| NIL) (#2=#:G1054 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 387))
                                    #2#)
                                   NIL)))
                           (LETT #1# (CDR #1#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS #'|GUESS;diffHP;SM;89!4| (VECTOR $ |q|))
                     (|spadConstant| $ 327) $))))))) 

(SDEFUN |GUESS;diffHP;SM;89!4| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qDiffDSF| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;89!3| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGenq|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384))
                        (QREFELT $ 385))
              (QREFELT $ 386))
             (|spadConstant| $ 275) $))))) 

(SDEFUN |GUESS;diffHP;SM;89!2| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |q| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEguessStream| |z1| |partitions|
                    (CONS #'|GUESS;diffHP;SM;89!1| (VECTOR $ |q|))
                    (|spadConstant| $ 326) $)))))) 

(SDEFUN |GUESS;diffHP;SM;89!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qDiffDS| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;89!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 275)) 

(SDEFUN |GUESS;ShiftSX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 39))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 39))
                            (SPADCALL |n| (QREFELT $ 45)) (QREFELT $ 111))
                  (QREFELT $ 46))) 

(SDEFUN |GUESS;ShiftSXGF|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPROG
         ((|l| (|List| EXPRR)) (#1=#:G1082 NIL) (|i| NIL) (#2=#:G1081 NIL))
         (SEQ
          (COND ((ZEROP |n|) |expr|)
                ('T
                 (SEQ
                  (LETT |l|
                        (PROGN
                         (LETT #2# NIL . #3=(|GUESS;ShiftSXGF|))
                         (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#)
                              G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |expr| |x| |i|
                                                    (QREFELT $ 374))
                                          (SPADCALL
                                           (SPADCALL |i| (QREFELT $ 235))
                                           (QREFELT $ 45))
                                          (QREFELT $ 54))
                                         (SPADCALL |x| (QREFELT $ 39))
                                         (|spadConstant| $ 49) (QREFELT $ 46))
                                        (SPADCALL (SPADCALL |x| (QREFELT $ 39))
                                                  |i| (QREFELT $ 128))
                                        (QREFELT $ 105))
                                       #2#)
                                      . #3#)))
                              (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #3#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL |expr| (SPADCALL (ELT $ 111) |l| (QREFELT $ 282))
                              (QREFELT $ 95))
                    (SPADCALL (SPADCALL |x| (QREFELT $ 39)) |n|
                              (QREFELT $ 128))
                    (QREFELT $ 54))))))))) 

(SDEFUN |GUESS;ShiftSS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| (SPADCALL (ELT $ 425) |n| (QREFELT $ 428)))) 

(SDEFUN |GUESS;ShiftSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL |s| (SPADCALL (ELT $ 429) |n| (QREFELT $ 432)))) 

(SDEFUN |GUESS;ShiftAX|
        ((|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT $ 39)) |l| (QREFELT $ 128))
                  |f| (QREFELT $ 105))) 

(SDEFUN |GUESS;ShiftAXGF|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPROG ((|s| (|List| EXPRR)) (|i| NIL) (#1=#:G1092 NIL))
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
                                                          (QREFELT $ 434))
                                                (QREFELT $ 45))
                                               (SPADCALL
                                                (SPADCALL |x| (QREFELT $ 39))
                                                |i| (QREFELT $ 128))
                                               (QREFELT $ 105))
                                              (SPADCALL |f| |x| |i|
                                                        (QREFELT $ 374))
                                              (QREFELT $ 105))
                                             #1#)
                                            . #2#)))
                                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190)
                                    G191 (EXIT (NREVERSE #1#))))
                              . #2#)
                        (EXIT (SPADCALL (ELT $ 111) |s| (QREFELT $ 282))))))))) 

(SDEFUN |GUESS;ShiftA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 435))) 

(SDEFUN |GUESS;ShiftAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 436))) 

(SDEFUN |GUESS;ShiftC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 437))) 

(SDEFUN |GUESS;shiftHP;LR;99|
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
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 382))))
            (|error| "Guess: need a symbol for mixed Shifting")))
          (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $)
                . #1=(|GUESS;shiftHP;LR;99|))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 383)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsRec| (QREFELT $ 405))
             (|error|
              "Guess: no support for the Shift operator with displayAsGF"))
            ('T
             (SEQ
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
              (EXIT
               (VECTOR |degrees|
                       (CONS #'|GUESS;shiftHP;LR;99!0| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;shiftHP;LR;99!1|
                             (VECTOR |degrees| $ |partitions|))
                       (CONS #'|GUESS;shiftHP;LR;99!2| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;shiftHP;LR;99!3| (VECTOR $ |partitions|))
                       '|shiftHP| '|dummy| (CONS (|function| |GUESS;ShiftA|) $)
                       (CONS (|function| |GUESS;ShiftAF|) $)
                       (CONS (|function| |GUESS;ShiftAX|) $)
                       (CONS (|function| |GUESS;ShiftC|) $)))))))))) 

(SDEFUN |GUESS;shiftHP;LR;99!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;99|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;shiftHP;LR;99!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;99|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1111 NIL) (|i| NIL) (#3=#:G1110 NIL))
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 387))
                                    #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 327)
                                (SPADCALL (|spadConstant| $ 335)
                                          (|spadConstant| $ 108)
                                          (QREFELT $ 443))
                                (QREFELT $ 444))
                      (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440))
                      (QREFELT $ 445))
                     $))))))) 

(SDEFUN |GUESS;shiftHP;LR;99!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $ |degrees|)
          (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;shiftHP;LR;99|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |degrees| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384))
                        (QREFELT $ 385))
              (QREFELT $ 386))
             (SPADCALL |degrees| |o| (QREFELT $ 442)) $))))) 

(SDEFUN |GUESS;shiftHP;LR;99!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;99|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 326)
                        (SPADCALL (|spadConstant| $ 11) (|spadConstant| $ 360)
                                  (QREFELT $ 438))
                        (QREFELT $ 439))
              (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440))
              (QREFELT $ 441))
             $))))) 

(SDEFUN |GUESS;qShiftAX|
        ((|q| |Symbol|) (|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR)
         ($ EXPRR))
        (SPADCALL
         (SPADCALL (SPADCALL |q| (QREFELT $ 39))
                   (SPADCALL |l| (SPADCALL |n| (QREFELT $ 39)) (QREFELT $ 447))
                   (QREFELT $ 216))
         |f| (QREFELT $ 105))) 

(SDEFUN |GUESS;qShiftA|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 448)) |k| |l| |f| (QREFELT $ 449))) 

(SDEFUN |GUESS;qShiftAF|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 242)) (QREFELT $ 418)) |k|
                  |l| |f| (QREFELT $ 450))) 

(SDEFUN |GUESS;qShiftC|
        ((|q| |Symbol|) (|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 448)) |total| (QREFELT $ 451))) 

(SDEFUN |GUESS;qSubstUFPSF|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|maxMD| |NonNegativeInteger|)
         ($ |List| (|UnivariateFormalPowerSeries| F)))
        (SPROG ((|i| NIL) (#1=#:G1136 NIL))
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
                                           (SPADCALL |q| (QREFELT $ 242)) |i|
                                           (QREFELT $ 299))
                                          (SPADCALL (|spadConstant| $ 11) 1
                                                    (QREFELT $ 438))
                                          (QREFELT $ 452))
                                         (QREFELT $ 453))
                               #1#)
                              . #2#)))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |GUESS;qSubstEXPRR|
        ((|q| |Symbol|) (|xx| |Symbol|) (|s| EXPRR)
         (|maxMD| |NonNegativeInteger|) ($ |List| EXPRR))
        (SPROG ((|i| NIL) (#1=#:G1139 NIL))
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
                                (SPADCALL (SPADCALL |q| (QREFELT $ 39))
                                          (SPADCALL |i|
                                                    (SPADCALL |xx|
                                                              (QREFELT $ 39))
                                                    (QREFELT $ 447))
                                          (QREFELT $ 216))
                                |s| (QREFELT $ 105))
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
                        (SPADCALL (|spadConstant| $ 326)
                                  (SPADCALL (|spadConstant| $ 11) 1
                                            (QREFELT $ 438))
                                  (QREFELT $ 439))
                        (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440))
                        (QREFELT $ 441))
                       $)
                      |GUESS;ADEguessStreamMixShift|)
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEguessStreamMixShift!0|
                                 (VECTOR $ |maxMD| |q|))
                           (QREFELT $ 456)))))) 

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
              (|lastv| NIL) (#2=#:G1163 NIL) (|v| NIL) (#3=#:G1164 NIL)
              (|w| NIL) (|vv1| NIL) (#4=#:G1162 NIL) (|p| NIL) (#5=#:G1161 NIL)
              (O NIL) (#6=#:G1147 NIL) (|qv| NIL) (|d| NIL) (#7=#:G1145 NIL)
              (|f| NIL))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |fl| (QREFELT $ 359))
                          (|spadConstant| $ 360) (QREFELT $ 330))
                (|error| "ADEguessModGen2Mixed: #fl ~= 1"))
               ('T
                (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 361)) NIL)
                     (LETT |d|
                           (PROG1
                               (LETT #7#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |f| (QREFELT $ 457))
                                                |dl| (QREFELT $ 219))
                                      (|spadConstant| $ 360) (QREFELT $ 219))
                                     NIL)
                             (|check_subtype| (>= #7# 0)
                                              '(|NonNegativeInteger|) #7#))
                           NIL)
                     (LETT |qv|
                           (SPADCALL
                            (SPADCALL |d| (|spadConstant| $ 360)
                                      (QREFELT $ 259))
                            (|spadConstant| $ 360) (QREFELT $ 458))
                           NIL)
                     (SEQ (LETT |i| (|spadConstant| $ 360) NIL) G190
                          (COND ((> |i| |d|) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |qv| |i|
                                      (SPADCALL
                                       (SPADCALL |q| |i| (QREFELT $ 461))
                                       |prime| (QREFELT $ 462))
                                      (QREFELT $ 463))))
                          (LETT |i| (+ |i| 1) NIL) (GO G190) G191 (EXIT NIL))
                     (LETT O
                           (PROG1
                               (LETT #6#
                                     (SPADCALL
                                      (SPADCALL |o|
                                                (SPADCALL |maxMD|
                                                          (|spadConstant| $
                                                                          360)
                                                          (QREFELT $ 259))
                                                (QREFELT $ 464))
                                      (QREFELT $ 465))
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
                                                   (QREFELT $ 384))
                                         (QREFELT $ 385))
                                        (QREFELT $ 386))
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
                     (LETT |lastv| (SPADCALL |vv1| (QREFELT $ 361)) NIL)
                     (SEQ (LETT |w| NIL NIL)
                          (LETT #3# (SPADCALL |vv1| (QREFELT $ 466)) NIL)
                          (LETT |v| NIL NIL) (LETT #2# |vv1| NIL) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) NIL) NIL)
                                (ATOM #3#)
                                (PROGN (LETT |w| (CAR #3#) NIL) NIL))
                            (GO G191)))
                          (SEQ (LETT |lastv| |w| NIL)
                               (LETT |vv| (LIST |v|) NIL) (LETT |vn| |v| NIL)
                               (SEQ (LETT |i| (|spadConstant| $ 360) NIL) G190
                                    (COND ((> |i| |maxMD|) (GO G191)))
                                    (SEQ
                                     (LETT |vn| (SPADCALL |vn| (QREFELT $ 467))
                                           NIL)
                                     (SEQ (LETT |e| (|spadConstant| $ 360) NIL)
                                          G190 (COND ((> |e| |d|) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |vn| |e|
                                                      (QSMULMOD32
                                                       (SPADCALL |vn| |e|
                                                                 (QREFELT $
                                                                          468))
                                                       (SPADCALL |qv| |e|
                                                                 (QREFELT $
                                                                          468))
                                                       |prime|)
                                                      (QREFELT $ 463))))
                                          (LETT |e| (+ |e| 1) NIL) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (LETT |vv|
                                            (SPADCALL |vn| |vv|
                                                      (QREFELT $ 469))
                                            NIL)))
                                    (LETT |i| (+ |i| 1) NIL) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |l|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |vv| (QREFELT $ 470))
                                        (QREFELT $ 362))
                                       |l| (QREFELT $ 472))
                                      NIL)))
                          (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) NIL))
                                NIL)
                          (GO G190) G191 (EXIT NIL))
                     (LETT |vv| (LIST |lastv|) NIL) (LETT |vn| |lastv| NIL)
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL |o|
                                      (SPADCALL |maxMD| (|spadConstant| $ 360)
                                                (QREFELT $ 259))
                                      (QREFELT $ 473))
                            (|spadConstant| $ 360) (QREFELT $ 219))
                           NIL)
                     (COND
                      ((SPADCALL |r|
                                 (SPADCALL (|spadConstant| $ 460)
                                           (QREFELT $ 474))
                                 (QREFELT $ 276))
                       (LETT |r| |maxMD| NIL)))
                     (SEQ (LETT |i| (|spadConstant| $ 360) NIL) G190
                          (COND ((> |i| |r|) (GO G191)))
                          (SEQ (LETT |vn| (SPADCALL |vn| (QREFELT $ 467)) NIL)
                               (SEQ (LETT |e| (|spadConstant| $ 360) NIL) G190
                                    (COND ((> |e| |d|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |vn| |e|
                                                (QSMULMOD32
                                                 (SPADCALL |vn| |e|
                                                           (QREFELT $ 468))
                                                 (SPADCALL |qv| |e|
                                                           (QREFELT $ 468))
                                                 |prime|)
                                                (QREFELT $ 463))))
                                    (LETT |e| (+ |e| 1) NIL) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |vv| (SPADCALL |vn| |vv| (QREFELT $ 469))
                                      NIL)))
                          (LETT |i| (+ |i| 1) NIL) (GO G190) G191 (EXIT NIL))
                     (LETT |l|
                           (SPADCALL
                            (SPADCALL (SPADCALL |vv| (QREFELT $ 470))
                                      (QREFELT $ 362))
                            |l| (QREFELT $ 472))
                           NIL)
                     (EXIT
                      (SPADCALL (SPADCALL |l| (QREFELT $ 475))
                                (QREFELT $ 477)))))))))))) 

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
                           (QREFELT $ 481)))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxMD|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;ADEdegreeStreamMixShift|))
          (LETT |maxMD| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|i| NIL) (#2=#:G1168 NIL))
                   (SEQ
                    (PROGN
                     (LETT #2# NIL NIL)
                     (SEQ (LETT |i| (|spadConstant| $ 275) NIL) G190
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
             ((|res| NIL) (#2=#:G1191 NIL) (|i| NIL) (#3=#:G1190 NIL)
              (|f0| NIL) (|exponents| NIL) (#4=#:G1178 NIL)
              (|oldPartition| NIL) (#5=#:G1189 NIL) (#6=#:G1188 NIL)
              (|newPartition| NIL) (#7=#:G1172 NIL) (#8=#:G1187 NIL) (|p| NIL)
              (#9=#:G1171 NIL))
             (SEQ (LETT |res| NIL NIL) (LETT |exponents| NIL NIL)
                  (LETT |oldPartition|
                        (PROG1
                            (LETT #9#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |l| (QREFELT $ 483))
                                             (SPADCALL |maxMD|
                                                       (|spadConstant| $ 108)
                                                       (QREFELT $ 259))
                                             (QREFELT $ 464))
                                   (QREFELT $ 465))
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
                                                                             108)
                                                             (QREFELT $ 259))
                                                   (QREFELT $ 464))
                                         (QREFELT $ 465))
                                        NIL)
                                (|check_subtype| (> #7# 0) '(|PositiveInteger|)
                                                 #7#))
                              NIL)
                        (COND
                         ((SPADCALL |newPartition| |oldPartition|
                                    (QREFELT $ 484))
                          (SEQ
                           (LETT |f0|
                                 (|GUESS;termAsUFPSSUPF2| |f|
                                  (SPADCALL |partitions| |oldPartition|
                                            (QREFELT $ 387))
                                  (CONS (|function| |GUESS;ShiftSF|) $)
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 327)
                                             (SPADCALL (|spadConstant| $ 335)
                                                       (|spadConstant| $ 108)
                                                       (QREFELT $ 443))
                                             (QREFELT $ 444))
                                   (SPADCALL (|spadConstant| $ 334)
                                             (QREFELT $ 440))
                                   (QREFELT $ 445))
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
                                                              (QREFELT $ 299))
                                                             (QREFELT $ 418))
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             335)
                                                             (|spadConstant| $
                                                                             108)
                                                             (QREFELT $ 443))
                                                            (QREFELT $ 485))
                                                           (QREFELT $ 486))
                                                 #6#)
                                                NIL)))
                                        (LETT #5# (CDR #5#) NIL) (GO G190) G191
                                        (EXIT (NREVERSE #6#))))
                                  |res| (QREFELT $ 487))
                                 NIL)
                           (LETT |exponents| NIL NIL)
                           (EXIT (LETT |oldPartition| |newPartition| NIL)))))
                        (EXIT
                         (LETT |exponents|
                               (SPADCALL
                                (PROG1
                                    (LETT #4#
                                          (SPADCALL
                                           (SPADCALL |p| (|spadConstant| $ 108)
                                                     (QREFELT $ 219))
                                           (SPADCALL |maxMD|
                                                     (|spadConstant| $ 108)
                                                     (QREFELT $ 259))
                                           (QREFELT $ 462))
                                          NIL)
                                  (|check_subtype| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   #4#))
                                |exponents| (QREFELT $ 489))
                               NIL)))
                       (LETT #8# (CDR #8#) NIL) (GO G190) G191 (EXIT NIL))
                  (LETT |f0|
                        (|GUESS;termAsUFPSSUPF2| |f|
                         (SPADCALL |partitions| |oldPartition| (QREFELT $ 387))
                         (CONS (|function| |GUESS;ShiftSF|) $)
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 327)
                                    (SPADCALL (|spadConstant| $ 335)
                                              (|spadConstant| $ 108)
                                              (QREFELT $ 443))
                                    (QREFELT $ 444))
                          (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440))
                          (QREFELT $ 445))
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
                                                     |i| (QREFELT $ 299))
                                                    (QREFELT $ 418))
                                                   (SPADCALL
                                                    (|spadConstant| $ 335)
                                                    (|spadConstant| $ 108)
                                                    (QREFELT $ 443))
                                                   (QREFELT $ 485))
                                                  (QREFELT $ 486))
                                        #3#)
                                       NIL)))
                               (LETT #2# (CDR #2#) NIL) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         |res| (QREFELT $ 487))
                        NIL)
                  (EXIT
                   (SPADCALL (SPADCALL |res| (QREFELT $ 490))
                             (QREFELT $ 363))))))))) 

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
                           (QREFELT $ 493)))))) 

(SDEFUN |GUESS;ADEEXPRRStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |xx| |maxMD| $)
          (LETT |q| (QREFELT $$ 3) . #1=(|GUESS;ADEEXPRRStreamMixShift|))
          (LETT |xx| (QREFELT $$ 2) . #1#)
          (LETT |maxMD| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESS;qSubstEXPRR| |q| |xx| |z1| |maxMD| $))))) 

(SDEFUN |GUESS;shiftHP;SM;111|
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
        (SPROG NIL (SEQ (CONS #'|GUESS;shiftHP;SM;111!12| (VECTOR |q| $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!12| ((|l1| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;shiftHP;SM;111|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|degrees| NIL) (|maxMD| NIL) (|partitions| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |l1| (QREFELT $ 383)) '|displayAsRec|
                                (QREFELT $ 405))
                      (|error|
                       "Guess: no support for the qShift operator with displayAsGF"))
                     ('T
                      (SEQ
                       (LETT |partitions|
                             (|GUESS;FilteredPartitionStream| |l1| $) NIL)
                       (EXIT
                        (COND
                         ((SPADCALL
                           (LETT |maxMD| (SPADCALL |l1| (QREFELT $ 382)) NIL)
                           (QREFELT $ 421))
                          (SEQ
                           (LETT |degrees|
                                 (|GUESS;ADEdegreeStream| |partitions| $) NIL)
                           (EXIT
                            (VECTOR |degrees|
                                    (CONS #'|GUESS;shiftHP;SM;111!0|
                                          (VECTOR $ |partitions|))
                                    (CONS #'|GUESS;shiftHP;SM;111!1|
                                          (VECTOR |degrees| $ |partitions|))
                                    (CONS #'|GUESS;shiftHP;SM;111!2|
                                          (VECTOR $ |partitions|))
                                    (CONS #'|GUESS;shiftHP;SM;111!3|
                                          (VECTOR $ |partitions|))
                                    '|qshiftHP| |q|
                                    (CONS #'|GUESS;shiftHP;SM;111!4|
                                          (VECTOR $ |q|))
                                    (CONS #'|GUESS;shiftHP;SM;111!5|
                                          (VECTOR $ |q|))
                                    (CONS #'|GUESS;shiftHP;SM;111!6|
                                          (VECTOR $ |q|))
                                    (CONS #'|GUESS;shiftHP;SM;111!7|
                                          (VECTOR $ |q|))))))
                         ('T
                          (SEQ
                           (LETT |degrees|
                                 (|GUESS;ADEdegreeStreamMixShift| |partitions|
                                  |maxMD| $)
                                 NIL)
                           (EXIT
                            (VECTOR |degrees|
                                    (CONS #'|GUESS;shiftHP;SM;111!8|
                                          (VECTOR $ |maxMD| |partitions| |q|))
                                    (CONS #'|GUESS;shiftHP;SM;111!9|
                                          (VECTOR |maxMD| $ |degrees|
                                                  |partitions|))
                                    (CONS #'|GUESS;shiftHP;SM;111!10|
                                          (VECTOR $ |maxMD| |partitions| |q|))
                                    (CONS #'|GUESS;shiftHP;SM;111!11|
                                          (VECTOR $ |maxMD| |partitions| |q|))
                                    '|qmixed| |q|
                                    (CONS (|function| |GUESS;ShiftA|) $)
                                    (CONS (|function| |GUESS;ShiftAF|) $)
                                    (CONS (|function| |GUESS;ShiftAX|) $)
                                    (CONS (|function| |GUESS;ShiftC|)
                                          $)))))))))))))))) 

(SDEFUN |GUESS;shiftHP;SM;111!11| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3) NIL)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT |maxMD| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStreamMixShift| |q| |z1| |z2| |partitions| |maxMD|
             $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!10| ((|l| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3) NIL)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT |maxMD| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEtestMixShiftGen| |q| |partitions| |maxMD| |l| $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!9| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| |degrees| $ |maxMD|)
          (LETT |partitions| (QREFELT $$ 3) NIL)
          (LETT |degrees| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |maxMD| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2Mixed| |partitions|
             (SPADCALL |degrees| |o| (QREFELT $ 442)) |maxMD| |o| $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!8| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3) NIL)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT |maxMD| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStreamMixShift| |q| |z1| |partitions| |maxMD| $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!7| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qShiftC| |q| |z1| $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!6| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qShiftAX| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!5| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qShiftAF| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!4| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|GUESS;qShiftA| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG ((#1=#:G1214 NIL) (|i| NIL) (#2=#:G1213 NIL))
                   (SEQ
                    (|GUESS;ADEtestGen2|
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
                                    (SPADCALL |partitions| |i| (QREFELT $ 387))
                                    #2#)
                                   NIL)))
                           (LETT #1# (CDR #1#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 327)
                                (SPADCALL (|spadConstant| $ 335)
                                          (|spadConstant| $ 108)
                                          (QREFELT $ 443))
                                (QREFELT $ 444))
                      (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440))
                      (QREFELT $ 445))
                     $))))))) 

(SDEFUN |GUESS;shiftHP;SM;111!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $ |degrees|)
          (LETT |partitions| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |degrees| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384))
                        (QREFELT $ 385))
              (QREFELT $ 386))
             (SPADCALL |degrees| |o| (QREFELT $ 442)) $))))) 

(SDEFUN |GUESS;shiftHP;SM;111!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 326)
                        (SPADCALL (|spadConstant| $ 11) (|spadConstant| $ 360)
                                  (QREFELT $ 438))
                        (QREFELT $ 439))
              (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440))
              (QREFELT $ 441))
             $))))) 

(SDEFUN |GUESS;makeEXPRR|
        ((DAX |Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR)
         (|x| |Symbol|) (|p| |SparseUnivariatePolynomial| F) (|expr| EXPRR)
         ($ EXPRR))
        (COND ((SPADCALL |p| (QREFELT $ 124)) (|spadConstant| $ 49))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 125)) (QREFELT $ 10))
                 (SPADCALL (SPADCALL |p| (QREFELT $ 127)) |x| |expr| DAX)
                 (QREFELT $ 105))
                (|GUESS;makeEXPRR| DAX |x| (SPADCALL |p| (QREFELT $ 129))
                 |expr| $)
                (QREFELT $ 111))))) 

(SDEFUN |GUESS;list2UFPSF|
        ((|list| |List| F) ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL (SPADCALL |list| (QREFELT $ 496)) (QREFELT $ 497))) 

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
          (#1=#:G1261 NIL) (|e| NIL) (#2=#:G1260 NIL))
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
                         (LETT #2# (CONS (SPADCALL |e| (QREFELT $ 418)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 500))
                . #3#)
          (LETT |s1| (SPADCALL (ELT $ 255) 0 (QREFELT $ 258)) . #3#)
          (LETT |l2|
                (SPADCALL (CONS #'|GUESS;list2UFPSSUPF!0| $) |s1|
                          (QREFELT $ 505))
                . #3#)
          (EXIT
           (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 506)) (QREFELT $ 507)))))) 

(SDEFUN |GUESS;list2UFPSSUPF!0| ((|i| NIL) ($ NIL))
        (SPROG ((#1=#:G1256 NIL))
               (SPADCALL (|spadConstant| $ 11)
                         (SPADCALL (|spadConstant| $ 360)
                                   (PROG1 (LETT #1# |i| NIL)
                                     (|check_subtype| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      #1#))
                                   (QREFELT $ 502))
                         (QREFELT $ 503)))) 

(SDEFUN |GUESS;SUPF2SUPSUPF|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL (ELT $ 418) |p| (QREFELT $ 511))) 

(SDEFUN |GUESS;UFPSF2SUPF|
        ((|f| |UnivariateFormalPowerSeries| F) (|deg| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (SPADCALL |f| |deg| (QREFELT $ 513)) (QREFELT $ 514))) 

(SDEFUN |GUESS;getListSUPF|
        ((|s| |List| (|UnivariateFormalPowerSeries| F))
         (|deg| |NonNegativeInteger|)
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;getListSUPF!0| (VECTOR $ |deg|)) |s|
                         (QREFELT $ 518)))) 

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
         ((#1=#:G1305 NIL) (#2=#:G1300 NIL) (|res2| (S)) (|p2val| (S))
          (|p2| (|SparseUnivariatePolynomial| S)) (#3=#:G1307 NIL) (|j| NIL)
          (#4=#:G1296 NIL) (|si| (S)) (|i| NIL) (#5=#:G1293 NIL) (|res1| (S))
          (|gl| (|Vector| S)) (#6=#:G1287 NIL) (#7=#:G1306 NIL)
          (#8=#:G1283 NIL) (#9=#:G1280 NIL) (|cden| (S)) (|c2| (S))
          (#10=#:G1276 NIL) (|c1| (S)) (|pp| (S)) (|vd| (S)) (|vi| (F))
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
            (LETT |homp| (SPADCALL |options| (QREFELT $ 249))
                  . #12=(|GUESS;precCheck|))
            (LETT |homo| (COND ((QEQCAR |homp| 1) (QCDR |homp|)) (#13='T 'T))
                  . #12#)
            (LETT |resv| (SPADCALL |resi| (QREFELT $ 521)) . #12#)
            (LETT |m| (QVSIZE |resv|) . #12#)
            (LETT |gl0| (SPADCALL |list| (QREFELT $ 523)) . #12#)
            (LETT |degree_loss| (COND (|homo| (- |m| 1)) (#13# (- |m| 2)))
                  . #12#)
            (COND
             ((SPADCALL |options| (QREFELT $ 524))
              (LETT |max_ind| (- (- (QVSIZE |gl0|) |degree_loss|) 1) . #12#))
             (#13# (LETT |max_ind| (- |sigma| 1) . #12#)))
            (LETT |svar| (SPADCALL (QREFELT $ 526)) . #12#)
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
                           (SEQ (LETT |res1| (|spadConstant| $ 48) . #12#)
                                (LETT |cden| (|spadConstant| $ 12) . #12#)
                                (LETT |si| (SPADCALL |i| (QREFELT $ 160))
                                      . #12#)
                                (COND
                                 ((NULL |homo|)
                                  (LETT |res1|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |resv| 1 (QREFELT $ 527))
                                          |svar| |si| (QREFELT $ 528))
                                         (QREFELT $ 529))
                                        . #12#)))
                                (SEQ (LETT |j| |j0| . #12#) G190
                                     (COND ((> |j| |m|) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 527))
                                            . #12#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 528))
                                             (QREFELT $ 529))
                                            . #12#)
                                      (LETT |vi|
                                            (SPADCALL |gl|
                                                      (+ (- (+ |i| |j|) |j0|)
                                                         1)
                                                      (QREFELT $ 530))
                                            . #12#)
                                      (LETT |vd| (SPADCALL |vi| (QREFELT $ 30))
                                            . #12#)
                                      (LETT |pp|
                                            (SPADCALL |cden| |vd|
                                                      (QREFELT $ 531))
                                            . #12#)
                                      (LETT |c1|
                                            (PROG2
                                                (LETT #10#
                                                      (SPADCALL |cden| |pp|
                                                                (QREFELT $
                                                                         171))
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
                                                                         171))
                                                      . #12#)
                                                (QCDR #10#)
                                              (|check_union| (QEQCAR #10# 0)
                                                             (QREFELT $ 7)
                                                             #10#))
                                            . #12#)
                                      (LETT |res1|
                                            (SPADCALL
                                             (SPADCALL |c2| |res1|
                                                       (QREFELT $ 167))
                                             (SPADCALL
                                              (SPADCALL |p2val| |c1|
                                                        (QREFELT $ 167))
                                              (SPADCALL |vi| (QREFELT $ 29))
                                              (QREFELT $ 167))
                                             (QREFELT $ 274))
                                            . #12#)
                                      (EXIT
                                       (LETT |cden|
                                             (SPADCALL |cden| |c2|
                                                       (QREFELT $ 167))
                                             . #12#)))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res1| (|spadConstant| $ 48)
                                             (QREFELT $ 532))
                                   (PROGN
                                    (LETT #9#
                                          (COND
                                           ((< |i| |sigma|)
                                            (PROGN
                                             (LETT #1# (CONS 2 "no_solution")
                                                   . #12#)
                                             (GO #1#)))
                                           ('T
                                            (PROGN
                                             (LETT #1# (CONS 1 "reject")
                                                   . #12#)
                                             (GO #1#))))
                                          . #12#)
                                    (GO #9#)))))))
                          #9# (EXIT #9#))
                         (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                         (EXIT NIL))
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 524)))
                      (PROGN (LETT #1# (CONS 0 "good") . #12#) (GO #1#))))
                    (EXIT
                     (COND
                      (|bad|
                       (PROGN (LETT #1# (CONS 1 "reject") . #12#) (GO #1#)))
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
                                                (QREFELT $ 160))
                                      . #12#)
                                (SEQ (LETT |j| (- |m| |i|) . #12#) G190
                                     (COND ((> |j| |m|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ
                                        (LETT |p2|
                                              (SPADCALL |resv| |j|
                                                        (QREFELT $ 527))
                                              . #12#)
                                        (LETT |p2val|
                                              (SPADCALL
                                               (SPADCALL |p2| |svar| |si|
                                                         (QREFELT $ 528))
                                               (QREFELT $ 529))
                                              . #12#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |p2val|
                                                     (|spadConstant| $ 48)
                                                     (QREFELT $ 532))
                                           (PROGN
                                            (LETT #8#
                                                  (PROGN
                                                   (LETT #1# (CONS 0 "good")
                                                         . #12#)
                                                   (GO #1#))
                                                  . #12#)
                                            (GO #8#)))))))
                                      #8# (EXIT #8#))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |res2| (|spadConstant| $ 47) . #12#)
                                (COND
                                 (|homo|
                                  (LETT |res2|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |resv| 1 (QREFELT $ 527))
                                           |svar| |si| (QREFELT $ 528))
                                          (QREFELT $ 529))
                                         (QREFELT $ 56))
                                        . #12#)))
                                (SEQ (LETT |j| |j0| . #12#)
                                     (LETT #7# (- |m| |i|) . #12#) G190
                                     (COND ((> |j| #7#) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 527))
                                            . #12#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 528))
                                             (QREFELT $ 529))
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
                                                                            530))
                                                                 (QREFELT $
                                                                          533))
                                                       (QREFELT $ 534))
                                             . #12#)))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res2| (|spadConstant| $ 47)
                                             (QREFELT $ 535))
                                   (PROGN
                                    (LETT #6#
                                          (PROGN
                                           (LETT #1# (CONS 1 "reject") . #12#)
                                           (GO #1#))
                                          . #12#)
                                    (GO #6#)))))))
                              #6# (EXIT #6#))
                             (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN
                          (LETT #1# (CONS 0 "good") . #12#)
                          (GO #1#)))))))))
              ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
               (SEQ (LETT |gl| |gl0| . #12#)
                    (SEQ (LETT |i| 0 . #12#) G190
                         (COND ((|greater_SI| |i| |max_ind|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |res1| (|spadConstant| $ 48) . #12#)
                                (LETT |si| (SPADCALL |i| (QREFELT $ 160))
                                      . #12#)
                                (COND
                                 ((NULL |homo|)
                                  (LETT |res1|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |resv| 1 (QREFELT $ 527))
                                          |svar| |si| (QREFELT $ 528))
                                         (QREFELT $ 529))
                                        . #12#)))
                                (SEQ (LETT |j| |j0| . #12#) G190
                                     (COND ((> |j| |m|) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 527))
                                            . #12#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 528))
                                             (QREFELT $ 529))
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
                                                                            537))
                                                                 (QREFELT $
                                                                          167))
                                                       (QREFELT $ 274))
                                             . #12#)))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res1| (|spadConstant| $ 48)
                                             (QREFELT $ 532))
                                   (PROGN
                                    (LETT #5#
                                          (COND
                                           ((< |i| |sigma|)
                                            (PROGN
                                             (LETT #1# (CONS 2 "no_solution")
                                                   . #12#)
                                             (GO #1#)))
                                           ('T
                                            (PROGN
                                             (LETT #1# (CONS 1 "reject")
                                                   . #12#)
                                             (GO #1#))))
                                          . #12#)
                                    (GO #5#)))))))
                          #5# (EXIT #5#))
                         (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                         (EXIT NIL))
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 524)))
                      (PROGN (LETT #1# (CONS 0 "good") . #12#) (GO #1#))))
                    (EXIT
                     (COND
                      (|bad|
                       (PROGN (LETT #1# (CONS 1 "reject") . #12#) (GO #1#)))
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
                                                (QREFELT $ 160))
                                      . #12#)
                                (SEQ (LETT |j| (- |m| |i|) . #12#) G190
                                     (COND ((> |j| |m|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ
                                        (LETT |p2|
                                              (SPADCALL |resv| |j|
                                                        (QREFELT $ 527))
                                              . #12#)
                                        (LETT |p2val|
                                              (SPADCALL
                                               (SPADCALL |p2| |svar| |si|
                                                         (QREFELT $ 528))
                                               (QREFELT $ 529))
                                              . #12#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |p2val|
                                                     (|spadConstant| $ 48)
                                                     (QREFELT $ 532))
                                           (PROGN
                                            (LETT #4#
                                                  (PROGN
                                                   (LETT #1# (CONS 0 "good")
                                                         . #12#)
                                                   (GO #1#))
                                                  . #12#)
                                            (GO #4#)))))))
                                      #4# (EXIT #4#))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |res2| (|spadConstant| $ 48) . #12#)
                                (COND
                                 (|homo|
                                  (LETT |res2|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |resv| 1 (QREFELT $ 527))
                                          |svar| |si| (QREFELT $ 528))
                                         (QREFELT $ 529))
                                        . #12#)))
                                (SEQ (LETT |j| |j0| . #12#)
                                     (LETT #3# (- |m| |i|) . #12#) G190
                                     (COND ((> |j| #3#) (GO G191)))
                                     (SEQ
                                      (LETT |p2|
                                            (SPADCALL |resv| |j|
                                                      (QREFELT $ 527))
                                            . #12#)
                                      (LETT |p2val|
                                            (SPADCALL
                                             (SPADCALL |p2| |svar| |si|
                                                       (QREFELT $ 528))
                                             (QREFELT $ 529))
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
                                                                            537))
                                                                 (QREFELT $
                                                                          167))
                                                       (QREFELT $ 274))
                                             . #12#)))
                                     (LETT |j| (+ |j| 1) . #12#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((SPADCALL |res2| (|spadConstant| $ 48)
                                             (QREFELT $ 532))
                                   (PROGN
                                    (LETT #2#
                                          (PROGN
                                           (LETT #1# (CONS 1 "reject") . #12#)
                                           (GO #1#))
                                          . #12#)
                                    (GO #2#)))))))
                              #2# (EXIT #2#))
                             (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN
                          (LETT #1# (CONS 0 "good") . #12#)
                          (GO #1#)))))))))
              (#13# (|error| "F must be S or Fraction(S)"))))))
          #1# (EXIT #1#)))) 

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
         ((#2=#:G1355 NIL) (#3=#:G1348 NIL) (|order| (|Integer|))
          (|c| (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|d| NIL) (|dmax| (|NonNegativeInteger|))
          (|resiSUPF|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#4=#:G1359 NIL) (|i| NIL) (#5=#:G1358 NIL) (|testList| #1#)
          (|flist| (|List| (|PositiveInteger|))) (#6=#:G1337 NIL)
          (#7=#:G1357 NIL) (|maxPow| (|Integer|))
          (|maxP| (|Union| (|PositiveInteger|) "arbitrary"))
          (|len| (|NonNegativeInteger|)) (|reject_one_term| (|Boolean|))
          (#8=#:G1316 NIL)
          (|nonZeroCoefficients| (|Union| #9="several" "one" "none"))
          (#10=#:G1356 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |options| (QREFELT $ 67))
              (SPADCALL "Guess: checking solution" (QREFELT $ 79))))
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
                        (SPADCALL (SPADCALL |resi| |i| (QREFELT $ 538))
                                  (QREFELT $ 539)))
                       (COND
                        ((QEQCAR |nonZeroCoefficients| 2)
                         (LETT |nonZeroCoefficients| (CONS 0 "one") . #11#))
                        ('T
                         (SEQ (LETT |nonZeroCoefficients| (CONS 1 #9#) . #11#)
                              (EXIT
                               (PROGN
                                (LETT #8# |$NoValue| . #11#)
                                (GO #8#))))))))))
                   (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL)))
             #8# (EXIT #8#))
            (COND
             ((NULL (QEQCAR |nonZeroCoefficients| 1))
              (COND
               ((NULL (SPADCALL (ELT $ 544) |list| (QREFELT $ 84)))
                (SEQ (LETT |reject_one_term| 'T . #11#)
                     (EXIT
                      (COND
                       ((SPADCALL |options| (QREFELT $ 67))
                        (SPADCALL "Guess: encountered single-term solution"
                                  (QREFELT $ 79))))))))))
            (LETT |len| (LENGTH |list|) . #11#)
            (LETT |maxP| (SPADCALL |options| (QREFELT $ 247)) . #11#)
            (COND ((QEQCAR |maxP| 0) (LETT |maxPow| (QCDR |maxP|) . #11#))
                  (#12='T (LETT |maxPow| (+ |len| 2) . #11#)))
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
                             ((SPADCALL (SPADCALL |resi| |i| (QREFELT $ 538))
                                        (QREFELT $ 539))
                              'NIL)
                             (#12# 'T))
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
                                   (SPADCALL |resi| |i| (QREFELT $ 538)) $)
                                  $)
                                 #5#)
                                . #11#)))
                        (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #11#)
            (LETT |order| 0 . #11#)
            (LETT |dmax| (SPADCALL 10 (LENGTH |list|) (QREFELT $ 545)) . #11#)
            (SEQ
             (EXIT
              (SEQ (LETT |d| 0 . #11#) G190 NIL
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 524)))
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN (LETT #2# (CONS 0 "good") . #11#) (GO #2#))))))
                    (COND
                     (|reject_one_term|
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN
                         (LETT #2# (CONS 1 "reject") . #11#)
                         (GO #2#))))))
                    (LETT |c|
                          (SPADCALL (QVELT D 8) |testList| |d|
                                    (SPADCALL |resiSUPF| (QREFELT $ 548))
                                    (QREFELT $ 549))
                          . #11#)
                    (COND
                     ((NULL (SPADCALL |c| (QREFELT $ 550)))
                      (SEQ (LETT |order| |d| . #11#)
                           (EXIT
                            (PROGN (LETT #3# |$NoValue| . #11#) (GO #3#))))))
                    (EXIT
                     (COND
                      ((SPADCALL |d| |dmax| (QREFELT $ 402))
                       (SEQ
                        (SPADCALL "bailing out from checkInterpolant"
                                  (QREFELT $ 551))
                        (SPADCALL
                         "please report the input to fricas-devel@googlegroups.com"
                         (QREFELT $ 551))
                        (LETT |order| |d| . #11#)
                        (EXIT
                         (PROGN (LETT #3# |$NoValue| . #11#) (GO #3#))))))))
                   (LETT |d| (|inc_SI| |d|) . #11#) (GO G190) G191 (EXIT NIL)))
             #3# (EXIT #3#))
            (EXIT
             (COND
              ((< |order| |sigma|)
               (SEQ
                (SPADCALL
                 (SPADCALL "Order too low: " (SPADCALL |order| (QREFELT $ 552))
                           (QREFELT $ 70))
                 (QREFELT $ 551))
                (SPADCALL
                 (SPADCALL "sigma: " (SPADCALL |sigma| (QREFELT $ 552))
                           (QREFELT $ 70))
                 (QREFELT $ 551))
                (EXIT
                 (PROGN (LETT #2# (CONS 2 "no_solution") . #11#) (GO #2#)))))
              ((SPADCALL |c| (QREFELT $ 553))
               (SEQ
                (COND
                 ((SPADCALL |options| (QREFELT $ 67))
                  (SEQ
                   (SPADCALL
                    (SPADCALL "Proposed solution does not fit coefficient "
                              (SPADCALL |order| (QREFELT $ 552))
                              (QREFELT $ 70))
                    (QREFELT $ 551))
                   (EXIT
                    (SPADCALL
                     (SPADCALL "sigma: " (SPADCALL |sigma| (QREFELT $ 552))
                               (QREFELT $ 70))
                     (QREFELT $ 551))))))
                (EXIT (PROGN (LETT #2# (CONS 1 "reject") . #11#) (GO #2#)))))
              (#12# (CONS 0 "good"))))))
          #2# (EXIT #2#)))) 

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
         ((|ex| (|List| EXPRR)) (#1=#:G1390 NIL) (|p| NIL) (#2=#:G1391 NIL)
          (|e| NIL) (#3=#:G1389 NIL) (|eq| (EXPRR)) (#4=#:G1387 NIL)
          (#5=#:G1388 NIL) (#6=#:G1386 NIL) (|dk| (|Symbol|)))
         (SEQ
          (LETT |dk| (SPADCALL |options| (QREFELT $ 383))
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
                                    (SPADCALL |options| (QREFELT $ 554))
                                    (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                   #6#)
                                  . #7#)))
                          (LETT #4#
                                (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #7#))
                                . #7#)
                          (GO G190) G191 (EXIT (NREVERSE #6#))))
                    . #7#)
              (LETT |eq|
                    (SPADCALL (SPADCALL (ELT $ 111) |ex| (QREFELT $ 282))
                              (QREFELT $ 52))
                    . #7#)
              (EXIT
               (COND ((EQUAL |dk| '|displayAsEQ|) |eq|)
                     (#8='T
                      (SPADCALL |op| (SPADCALL |options| (QREFELT $ 554))
                                (SPADCALL |options| (QREFELT $ 66)) |eq|
                                (|GUESS;getVariables| |initials| $)
                                (SPADCALL (QREFELT $ 10)
                                          (SPADCALL |initials| (QREFELT $ 496))
                                          (QREFELT $ 557))
                                (QREFELT $ 560)))))))))
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
                                    (SPADCALL |options| (QREFELT $ 66))
                                    (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                   #3#)
                                  . #7#)))
                          (LETT #1#
                                (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #7#))
                                . #7#)
                          (GO G190) G191 (EXIT (NREVERSE #3#))))
                    . #7#)
              (EXIT
               (SPADCALL |op| (SPADCALL |options| (QREFELT $ 66))
                         (SPADCALL (SPADCALL (ELT $ 111) |ex| (QREFELT $ 282))
                                   (QREFELT $ 52))
                         (|GUESS;getVariables| |initials| $)
                         (SPADCALL (QREFELT $ 10)
                                   (SPADCALL |initials| (QREFELT $ 496))
                                   (QREFELT $ 557))
                         (QREFELT $ 561)))))
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
          (|i| NIL) (#1=#:G1440 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#2=#:G1439 NIL) (#3=#:G1438 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#4=#:G1398 NIL) (#5=#:G1436 NIL) (|del| (|Integer|))
          (|leadingZeros| (|Integer|)) (#6=#:G1437 NIL) (|el| NIL)
          (|sigma| (|NonNegativeInteger|)) (#7=#:G1396 NIL)
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
                       (NULL (SPADCALL |el| (QREFELT $ 544))))
                   (GO G191)))
                 (SEQ (EXIT (LETT |leadingZeros| (+ |leadingZeros| 1) . #8#)))
                 (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |leadingZeros| |degreeLoss| (QREFELT $ 342))
              (SEQ (LETT |del| (- |leadingZeros| |degreeLoss|) . #8#)
                   (EXIT
                    (COND
                     ((SPADCALL |del| |guessDegree| (QREFELT $ 342))
                      (PROGN (LETT #5# (CONS 1 'NIL) . #8#) (GO #5#)))
                     (#9='T
                      (LETT |guessDegree|
                            (PROG1 (LETT #4# (- |guessDegree| |del|) . #8#)
                              (|check_subtype| (>= #4# 0)
                                               '(|NonNegativeInteger|) #4#))
                            . #8#)))))))
            (COND
             ((NULL (SPADCALL |options| (QREFELT $ 562)))
              (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 179)) . #8#)
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
                       (#9#
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
                                                               (QREFELT $ 563))
                                                     (+ (QCAR |deg|) 1))
                                                    ('T (QCAR |deg|)))
                                                   #2#)
                                                  . #8#)))
                                          (LETT |i| (|inc_SI| |i|) . #8#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #2#))))
                                    . #8#))))))
                     (#9#
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
                                                             (QREFELT $ 563))
                                                   (+ (QCAR |deg|) 1))
                                                  ('T (QCAR |deg|)))
                                                 #1#)
                                                . #8#)))
                                        (LETT |i| (|inc_SI| |i|) . #8#)
                                        (GO G190) G191 (EXIT (NREVERSE #1#))))
                                  . #8#)))))))))
            (COND
             ((QEQCAR (SPADCALL |options| (QREFELT $ 565)) 1)
              (SEQ
               (LETT |check|
                     (CONS #'|GUESS;guessInterpolateModular!0|
                           (VECTOR $ |sigma| |options| D |o| |list|))
                     . #8#)
               (EXIT
                (LETT |check|
                      (SPADCALL |check| |lists| (QVELT D 5) (QVELT D 6) |sigma|
                                (SPADCALL |o| (QVELT D 2)) (QREFELT $ 569))
                      . #8#))))
             ((QEQCAR (SPADCALL |options| (QREFELT $ 565)) 0)
              (SEQ
               (COND
                ((SPADCALL |options| (QREFELT $ 67))
                 (SPADCALL "Guess: skipping checks" (QREFELT $ 79))))
               (EXIT
                (LETT |check| (LIST #'|GUESS;guessInterpolateModular!1|)
                      . #8#))))
             (#9#
              (LETT |check|
                    (CONS #'|GUESS;guessInterpolateModular!2|
                          (VECTOR $ |sigma| |options| D |o| |list|))
                    . #8#)))
            (EXIT
             (SPADCALL |lists| |degs| (QVELT D 5) (QVELT D 6) |sigma|
                       (SPADCALL |o| (QVELT D 2)) |check| (QREFELT $ 571)))))
          #5# (EXIT #5#)))) 

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
         ((#2=#:G1518 NIL) (|j| NIL) (|c| (S)) (|cl| (|List| S))
          (#3=#:G1534 NIL) (#4=#:G1532 NIL) (|i1| NIL) (#5=#:G1533 NIL)
          (|i2| NIL) (|Mr| (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|m| (|NonNegativeInteger|)) (|rl| (|List| (|Integer|)))
          (|ce| (|List| (|SparseUnivariatePolynomial| S))) (#6=#:G1531 NIL)
          (|i| NIL) (M (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|vguessListF| (|Vector| (|SparseUnivariatePolynomial| F)))
          (|vguessList| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|guessPolys| (|List| (|SparseUnivariatePolynomial| F)))
          (#7=#:G1502 NIL)
          (|guessList| (|List| (|UnivariateFormalPowerSeries| F)))
          (|guessS| #1#) (|sumEta| (|NonNegativeInteger|))
          (|eta| (|List| (|NonNegativeInteger|))) (#8=#:G1530 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#9=#:G1464 NIL) (#10=#:G1529 NIL) (#11=#:G1454 NIL)
          (#12=#:G1528 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#13=#:G1443 NIL) (#14=#:G1527 NIL) (|d| NIL) (#15=#:G1526 NIL)
          (|list| (|List| F)))
         (SEQ
          (LETT |list| (|SPADfirst| |lists|)
                . #16=(|GUESS;guessInterpolateFFFG|))
          (COND
           ((SPADCALL |options| (QREFELT $ 67))
            (SPADCALL "Guess: using FFFG" (QREFELT $ 79))))
          (COND
           ((SPADCALL |options| (QREFELT $ 562))
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
              (SPADCALL |eta| 1 (+ (SPADCALL |eta| 1 (QREFELT $ 572)) 1)
                        (QREFELT $ 573)))))
           (#17='T
            (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 179)) . #16#)
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
                                                         (QREFELT $ 563))
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
                                                       (QREFELT $ 563))
                                             (+ (QCAR |deg|) 1))
                                            ('T (QCAR |deg|)))
                                           #8#)
                                          . #16#)))
                                  (LETT |i| (|inc_SI| |i|) . #16#) (GO G190)
                                  G191 (EXIT (NREVERSE #8#))))
                            . #16#)))))))))
          (LETT |sumEta| (SPADCALL (ELT $ 259) |eta| (QREFELT $ 578)) . #16#)
          (LETT |guessS| (SPADCALL (|GUESS;list2UFPSF| |list| $) (QVELT D 1))
                . #16#)
          (LETT |guessList|
                (SPADCALL
                 (SPADCALL (SPADCALL |guessS| |o| (QREFELT $ 579))
                           (QREFELT $ 580))
                 (QREFELT $ 581))
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
             (LETT |vguessList| (SPADCALL |guessPolys| (QREFELT $ 521)) . #16#)
             (EXIT
              (LETT M
                    (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                              |vguessList| |eta| (QREFELT $ 583))
                    . #16#))))
           ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
            (SEQ
             (LETT |vguessListF| (SPADCALL |guessPolys| (QREFELT $ 585))
                   . #16#)
             (EXIT
              (LETT M
                    (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                              |vguessListF| |eta| (QREFELT $ 587))
                    . #16#))))
           (#17#
            (|error|
             "Guess: type parameter F should be either equal to S or equal                         to Fraction S")))
          (LETT |rl| NIL . #16#)
          (SEQ (LETT |i| 1 . #16#) (LETT #6# (ANCOLS M) . #16#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (LETT |ce|
                      (SPADCALL (SPADCALL M |i| (QREFELT $ 588))
                                (QREFELT $ 589))
                      . #16#)
                (EXIT
                 (COND
                  ((QEQCAR
                    (|GUESS;checkInterpolant| |list| |o|
                     (SPADCALL (SPADCALL M |i| (QREFELT $ 588))
                               (QREFELT $ 589))
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
                                           (|spadConstant| $ 590))
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
                               (SEQ (LETT |c| (|spadConstant| $ 48) . #16#)
                                    (EXIT
                                     (SEQ (LETT |j| 1 . #16#) G190
                                          (COND
                                           ((OR (|greater_SI| |j| |m|)
                                                (NULL
                                                 (SPADCALL |c|
                                                           (QREFELT $ 168))))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |c|
                                                  (SPADCALL
                                                   (SPADCALL M |j| |i2|
                                                             (QREFELT $ 591))
                                                   (QREFELT $ 164))
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
                                                                         591))
                                                      (QREFELT $ 592))
                                                     #3#)
                                                    . #16#)))
                                            (LETT |j| (|inc_SI| |j|) . #16#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #3#))))
                                      . #16#)
                                (EXIT
                                 (LETT |c| (SPADCALL |cl| (QREFELT $ 593))
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
                                                                             591))
                                                          |c| (QREFELT $ 594))
                                                         . #16#)
                                                   (QCDR #2#)
                                                 (|check_union| (QEQCAR #2# 0)
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT $ 7))
                                                                #2#))
                                               (QREFELT $ 595))))
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
                 (QREFELT $ 609))))) 

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
            (SPROG ((|degs| NIL) (M0 NIL) (#2=#:G1550 NIL) (M NIL))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |vs| (QREFELT $ 596))
                           (SPADCALL |vs| (QREFELT $ 599)))
                       (SPADCALL (QREFELT $ 598)))
                      ('T
                       (SEQ (LETT |degs| (SPADCALL |vs| (QREFELT $ 600)) NIL)
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
                                          |degs| (QREFELT $ 605))
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
                                              (SPADCALL |vs| (QREFELT $ 606))
                                              $)
                                             NIL)
                                       (GO #2#)))))
                                   ('T (QCDR M0)))
                                  NIL)
                            (EXIT
                             (SPADCALL M
                                       (|GUESS;guessInterpolate3| |lists| |o|
                                        |degreeLoss| |guessDegree| D |options|
                                        (SPADCALL |vs| (QREFELT $ 606)) $)
                                       (QREFELT $ 607)))))))
                    #2# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessInterpolate3!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 275) (QREFELT $ 603))) 

(SDEFUN |GUESS;listDecr|
        ((|l| |List| (|NonNegativeInteger|)) ($ |List| (|Integer|)))
        (SPADCALL (CONS #'|GUESS;listDecr!0| $) |l| (QREFELT $ 612))) 

(SDEFUN |GUESS;listDecr!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 360) (QREFELT $ 219))) 

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
                 ((SPADCALL |options| (QREFELT $ 562))
                  (SEQ
                   (LETT |maxD0| (SPADCALL |options| (QREFELT $ 179))
                         . #1=(|GUESS;guessInterpolate2|))
                   (LETT |maxD|
                         (COND ((QEQCAR |maxD0| 0) (QCDR |maxD0|))
                               (#2='T (- (+ |guessDegree| |o|) 2)))
                         . #1#)
                   (LETT |vs0|
                         (SPADCALL (+ |guessDegree| |o|) (+ |maxD| 1) |o|
                                   (QREFELT $ 614))
                         . #1#)
                   (EXIT
                    (SPADCALL (CONS (|function| |GUESS;listDecr|) $) |vs0|
                              (QREFELT $ 617)))))
                 (#2#
                  (SPADCALL NIL (SPADCALL (QREFELT $ 618)) (QREFELT $ 619))))
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
         ((#3=#:G1626 NIL) (|reslist| (|List| EXPRR)) (|res| (EXPRR))
          (#4=#:G1628 NIL) (|i| NIL) (|exprList| (|List| EXPRR))
          (MS (|Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
          (M (|Matrix| (|SparseUnivariatePolynomial| S))) (#5=#:G1620 NIL)
          (#6=#:G1613 NIL) (#7=#:G1627 NIL) (#8=#:G1583 NIL) (#9=#:G1576 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|guessDegree| #10=(|Integer|)) (|degreeLoss| (|Integer|))
          (#11=#:G1624 NIL) (#12=#:G1567 NIL) (|o| NIL) (|exprS| #2#)
          (#13=#:G1566 NIL) (|dk| (|Symbol|)) (|degreeS| #1#)
          (|op| (|BasicOperator|)) (|listDegree| #10#) (|list| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |reslist| NIL . #14=(|GUESS;guessHPaux|))
                (LETT |list| (|SPADfirst| |lists|) . #14#)
                (LETT |listDegree|
                      (- (- (LENGTH |list|) 1)
                         (SPADCALL |options| (QREFELT $ 217)))
                      . #14#)
                (COND
                 ((< |listDegree| 0)
                  (PROGN (LETT #3# |reslist| . #14#) (GO #3#))))
                (LETT |op|
                      (SPADCALL (SPADCALL |options| (QREFELT $ 620))
                                (QREFELT $ 621))
                      . #14#)
                (LETT |degreeS| (QVELT D 0) . #14#)
                (LETT |dk| (SPADCALL |options| (QREFELT $ 383)) . #14#)
                (LETT |exprS|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |dk| '|displayAsGF|)
                              (EQUAL |dk| '|displayAsEQ|))
                          (SPADCALL
                           (SPADCALL |op|
                                     (SPADCALL
                                      (SPADCALL |options| (QREFELT $ 554))
                                      (QREFELT $ 39))
                                     (QREFELT $ 622))
                           (SPADCALL |options| (QREFELT $ 554)) (QVELT D 4)))
                         ((EQUAL |dk| '|displayAsRec|)
                          (PROGN
                           (LETT #13#
                                 (SPADCALL
                                  (SPADCALL |op|
                                            (SPADCALL
                                             (SPADCALL |options|
                                                       (QREFELT $ 66))
                                             (QREFELT $ 39))
                                            (QREFELT $ 622))
                                  (SPADCALL |options| (QREFELT $ 66))
                                  (QVELT D 4))
                                 . #14#)
                           (GO #13#)))))
                       #13# (EXIT #13#))
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
                                      (QREFELT $ 623))
                            (QREFELT $ 624))
                           (PROGN (LETT #11# |$NoValue| . #14#) (GO #11#)))
                          ('T
                           (SEQ
                            (LETT |degreeLoss|
                                  (SPADCALL |degreeS| |o| (QREFELT $ 442))
                                  . #14#)
                            (LETT |guessDegree|
                                  (- (- (+ |listDegree| 2) |degreeLoss|) |o|)
                                  . #14#)
                            (COND
                             ((< |guessDegree| 0)
                              (SEQ
                               (COND
                                ((SPADCALL |options| (QREFELT $ 67))
                                 (SPADCALL
                                  "Guess: not enough values for guessing"
                                  (QREFELT $ 79))))
                               (EXIT
                                (PROGN
                                 (LETT #3# |reslist| . #14#)
                                 (GO #3#))))))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 67))
                              (SPADCALL
                               (SPADCALL
                                (LIST "Guess: trying order "
                                      (SPADCALL |o| (QREFELT $ 180))
                                      ", guessDegree is "
                                      (SPADCALL |guessDegree| (QREFELT $ 552)))
                                (QREFELT $ 625))
                               (QREFELT $ 73))))
                            (LETT |maxD| (SPADCALL |options| (QREFELT $ 179))
                                  . #14#)
                            (EXIT
                             (COND
                              ((QEQCAR |maxD| 0)
                               (COND
                                ((OR
                                  (OR
                                   (SPADCALL
                                    (SPADCALL |degreeS| |o| (QREFELT $ 623))
                                    (QREFELT $ 624))
                                   (NULL
                                    (< (* (QCDR |maxD|) |o|) |guessDegree|)))
                                  (NULL
                                   (SPADCALL (* (QCDR |maxD|) (+ |o| 1))
                                             (-
                                              (- (+ |listDegree| 2)
                                                 (SPADCALL |degreeS| (+ |o| 1)
                                                           (QREFELT $ 442)))
                                              (+ |o| 1))
                                             (QREFELT $ 338))))
                                 (SEQ (LETT |exprList| NIL . #14#)
                                      (COND
                                       ((SPADCALL |options| (QREFELT $ 67))
                                        (SEQ
                                         (LETT |exprList|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |exprS| |o|
                                                           (QREFELT $ 626))
                                                 (QREFELT $ 627))
                                                (QREFELT $ 628))
                                               . #14#)
                                         (SPADCALL
                                          #15="Guess: The list of expressions is"
                                          (QREFELT $ 79))
                                         (EXIT
                                          (SPADCALL
                                           (SPADCALL |exprList|
                                                     (QREFELT $ 629))
                                           (QREFELT $ 73))))))
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
                                                 ((SPADCALL MS (QREFELT $ 630))
                                                  (PROGN
                                                   (LETT #8# |$NoValue| . #14#)
                                                   (GO #8#)))
                                                 ('T
                                                  (SEQ
                                                   (LETT M
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            631))
                                                         . #14#)
                                                   (LETT MS
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            632))
                                                         . #14#)
                                                   (COND
                                                    ((NULL |exprList|)
                                                     (LETT |exprList|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |exprS|
                                                                       |o|
                                                                       (QREFELT
                                                                        $ 626))
                                                             (QREFELT $ 627))
                                                            (QREFELT $ 628))
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
                                                                            588))
                                                                 (QREFELT $
                                                                          589))
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
                                                                        106)))
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
                                                                           75))
                                                        (PROGN
                                                         (LETT #3# |reslist|
                                                               . #14#)
                                                         (GO #3#))))))))))))
                                              NIL (GO G190) G191 (EXIT NIL)))
                                        #8# (EXIT #8#)))))
                                ('T
                                 (SEQ (|spadConstant| $ 11)
                                      (EXIT
                                       (COND
                                        ((SPADCALL |options| (QREFELT $ 67))
                                         (SPADCALL "Guess: iterating"
                                                   (QREFELT $ 79)))))))))
                              ('T
                               (SEQ (LETT |exprList| NIL . #14#)
                                    (COND
                                     ((SPADCALL |options| (QREFELT $ 67))
                                      (SEQ
                                       (LETT |exprList|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |exprS| |o|
                                                         (QREFELT $ 626))
                                               (QREFELT $ 627))
                                              (QREFELT $ 628))
                                             . #14#)
                                       (SPADCALL #15# (QREFELT $ 79))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |exprList| (QREFELT $ 629))
                                         (QREFELT $ 73))))))
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
                                               ((SPADCALL MS (QREFELT $ 630))
                                                (PROGN
                                                 (LETT #5# |$NoValue| . #14#)
                                                 (GO #5#)))
                                               ('T
                                                (SEQ
                                                 (LETT M
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          631))
                                                       . #14#)
                                                 (LETT MS
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          632))
                                                       . #14#)
                                                 (COND
                                                  ((NULL |exprList|)
                                                   (LETT |exprList|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |exprS|
                                                                     |o|
                                                                     (QREFELT $
                                                                              626))
                                                           (QREFELT $ 627))
                                                          (QREFELT $ 628))
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
                                                                          588))
                                                               (QREFELT $ 589))
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
                                                                              106)))
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
                                                                (QREFELT $ 75))
                                                      (PROGN
                                                       (LETT #3# |reslist|
                                                             . #14#)
                                                       (GO #3#))))))))))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #5# (EXIT #5#))))))))))))
                       (LETT |o| (|inc_SI| |o|) . #14#) (GO G190) G191
                       (EXIT NIL)))
                 #11# (EXIT #11#))
                (EXIT |reslist|)))
          #3# (EXIT #3#)))) 

(SDEFUN |GUESS;processOptions|
        ((|options| |List| (|GuessOption|))
         ($ |List| (|List| (|GuessOption|))))
        (SPROG
         ((#1=#:G1677 NIL) (#2=#:G1672 NIL) (#3=#:G1670 NIL) (#4=#:G1680 NIL)
          (#5=#:G1636 NIL) (|i| NIL) (#6=#:G1679 NIL)
          (|minP| (|PositiveInteger|))
          (|hom?| (|Union| (|PositiveInteger|) (|Boolean|))) (#7=#:G1645 NIL)
          (#8=#:G1678 NIL) (|maxSomos| (|PositiveInteger|)) (#9=#:G1630 NIL)
          (#10=#:G1641 NIL) (#11=#:G1639 NIL) (|maxD| (|NonNegativeInteger|))
          (#12=#:G1633 NIL) (|Som?| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |Som?| (SPADCALL |options| (QREFELT $ 251))
                   . #13=(|GUESS;processOptions|))
             (EXIT
              (COND
               ((QEQCAR |Som?| 1)
                (COND
                 ((QCDR |Som?|)
                  (SEQ
                   (LETT |maxD|
                         (PROG2
                             (LETT #12# (SPADCALL |options| (QREFELT $ 250))
                                   . #13#)
                             (QCDR #12#)
                           (|check_union| (QEQCAR #12# 0)
                                          (|NonNegativeInteger|) #12#))
                         . #13#)
                   (COND
                    ((QEQCAR (SPADCALL |options| (QREFELT $ 247)) 0)
                     (LETT |maxSomos|
                           (*
                            (PROG1 (LETT #11# |maxD| . #13#)
                              (|check_subtype| (> #11# 0) '(|PositiveInteger|)
                                               #11#))
                            (PROG2
                                (LETT #5# (SPADCALL |options| (QREFELT $ 247))
                                      . #13#)
                                (QCDR #5#)
                              (|check_union| (QEQCAR #5# 0) (|PositiveInteger|)
                                             #5#)))
                           . #13#))
                    ((QEQCAR (SPADCALL |options| (QREFELT $ 249)) 0)
                     (LETT |maxSomos|
                           (*
                            (PROG1 (LETT #10# |maxD| . #13#)
                              (|check_subtype| (> #10# 0) '(|PositiveInteger|)
                                               #10#))
                            (PROG2
                                (LETT #9# (SPADCALL |options| (QREFELT $ 249))
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
                                              (QREFELT $ 633))
                                             |options|)
                                            $)
                                           #8#)
                                          . #13#)))
                                  (LETT |i| (|inc_SI| |i|) . #13#) (GO G190)
                                  G191 (EXIT (NREVERSE #8#))))
                            (QREFELT $ 635))
                           . #13#)
                     (GO #1#))))))))))
            (SEQ (LETT |hom?| (SPADCALL |options| (QREFELT $ 249)) . #13#)
                 (EXIT
                  (COND
                   ((QEQCAR |hom?| 1)
                    (COND
                     ((QCDR |hom?|)
                      (SEQ
                       (COND
                        ((QEQCAR (SPADCALL |options| (QREFELT $ 251)) 0)
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
                                                               (QREFELT $ 247))
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
                                                 (QREFELT $ 636))
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1
                                                           (LETT #2# |i|
                                                                 . #13#)
                                                         (|check_subtype|
                                                          (> #2# 0)
                                                          '(|PositiveInteger|)
                                                          #2#)))
                                                 (QREFELT $ 637)))
                                               |options| (QREFELT $ 638))
                                              #6#)
                                             . #13#)))
                                     (LETT |i| (+ |i| 1) . #13#) (GO G190) G191
                                     (EXIT (NREVERSE #6#))))
                               . #13#)
                         (GO #1#))))))))))
            (EXIT (LIST |options|))))
          #1# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LLL;128|
        ((|lists| |List| (|List| F)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1694 NIL) (|res| (|List| EXPRR))
          (#2=#:G1696 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))) (#3=#:G1686 NIL)
          (#4=#:G1682 NIL) (#5=#:G1695 NIL) (|li| NIL)
          (|nn| (|NonNegativeInteger|)) (|rl| (|List| (|List| F)))
          (|l| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 639))
                (EXIT
                 (COND
                  ((NULL |lists|)
                   (|error| "guessAlgDep: need at least one list"))
                  ('T
                   (SEQ
                    (LETT |l| (|SPADfirst| |lists|)
                          . #6=(|GUESS;guessAlgDep;LLL;128|))
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
                              ((SPADCALL (LENGTH |li|) |nn| (QREFELT $ 330))
                               (PROGN
                                (LETT #4#
                                      (|error|
                                       "guessAlgDep: lists must have equal length")
                                      . #6#)
                                (GO #4#))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL)))
                     #4# (EXIT #4#))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (APPEND
                            (LIST (SPADCALL '|displayAsEQ| (QREFELT $ 640))
                                  (SPADCALL
                                   (CONS 0
                                         (PROG1
                                             (LETT #3# (LENGTH |lists|) . #6#)
                                           (|check_subtype| (> #3# 0)
                                                            '(|PositiveInteger|)
                                                            #3#)))
                                   (QREFELT $ 641)))
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
                                 (SPADCALL |lists| |opts| (QREFELT $ 410))
                                 |opts| $)
                                . #6#)
                          (COND
                           ((NULL (NULL |res|))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 75))
                              (PROGN (LETT #1# |res| . #6#) (GO #1#))))))
                          (EXIT (LETT |lres| (APPEND |res| |lres|) . #6#)))
                         (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |lres|))))))))
          #1# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LL;129|
        ((|lists| |List| (|List| F)) ($ |List| EXPRR))
        (SPADCALL |lists| NIL (QREFELT $ 642))) 

(SDEFUN |GUESS;guessADE;LLL;130|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1704 NIL) (|res| (|List| EXPRR))
          (#2=#:G1705 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 639))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 640))
                             |options|)
                       $)
                      . #3=(|GUESS;guessADE;LLL;130|))
                (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
                (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 399)) |opts| $)
                            . #3#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 75))
                          (PROGN (LETT #1# |res| . #3#) (GO #1#))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #1# (EXIT #1#)))) 

(SDEFUN |GUESS;guessADE;LL;131| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 644))) 

(SDEFUN |GUESS;guessAlg;LLL;132|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 0) (QREFELT $ 646)) |options|)
                  (QREFELT $ 644))) 

(SDEFUN |GUESS;guessAlg;LL;133| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 647))) 

(SDEFUN |GUESS;guessHolo;LLL;134|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 637)) |options|)
                  (QREFELT $ 644))) 

(SDEFUN |GUESS;guessHolo;LL;135| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 649))) 

(SDEFUN |GUESS;guessPade;LLL;136|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 646))
                              (SPADCALL (CONS 0 1) (QREFELT $ 637)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 651))))
                       (QREFELT $ 652))
                      |GUESS;guessPade;LLL;136|)
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 644)))))) 

(SDEFUN |GUESS;guessPade;LL;137| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 653))) 

(SDEFUN |GUESS;guessFE;LLL;138|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1732 NIL) (|res| (|List| EXPRR))
          (#2=#:G1733 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 639))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 640))
                             |options|)
                       $)
                      . #3=(|GUESS;guessFE;LLL;138|))
                (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
                (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 413)) |opts| $)
                            . #3#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 75))
                          (PROGN (LETT #1# |res| . #3#) (GO #1#))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #1# (EXIT #1#)))) 

(SDEFUN |GUESS;guessFE;LL;139| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 655))) 

(SDEFUN |GUESS;guessADE;SM;140|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessADE;SM;140!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessADE;SM;140!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessADE;SM;140|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#2=#:G1741 NIL) (|res| NIL) (#3=#:G1742 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 639))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsGF| (QREFELT $ 640))
                                     |options| (QREFELT $ 657))
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
                                           (SPADCALL |q| (QREFELT $ 424)))
                                 |opts| $)
                                NIL)
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 658)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 75))
                              (PROGN (LETT #2# |res| NIL) (GO #2#))))))
                          (EXIT
                           (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 659))
                                 NIL)))
                         (LETT #3# (CDR #3#) NIL) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 660)))))
              #2# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessHolo;SM;141|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessHolo;SM;141!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessHolo;SM;141!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessHolo;SM;141|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 108))
                                 (QREFELT $ 637))
                       |z2| (QREFELT $ 657))
                      (SPADCALL |q| (QREFELT $ 661))))))) 

(SDEFUN |GUESS;guessRec;LLL;142|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1755 NIL) (|res| (|List| EXPRR))
          (#2=#:G1756 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 639))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsRec| (QREFELT $ 640))
                             |options|)
                       $)
                      . #3=(|GUESS;guessRec;LLL;142|))
                (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
                (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 446)) |opts| $)
                            . #3#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 75))
                          (PROGN (LETT #1# |res| . #3#) (GO #1#))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #1# (EXIT #1#)))) 

(SDEFUN |GUESS;guessRec;LL;143| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 663))) 

(SDEFUN |GUESS;guessPRec;LLL;144|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 637)) |options|)
                  (QREFELT $ 663))) 

(SDEFUN |GUESS;guessPRec;LL;145| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 665))) 

(SDEFUN |GUESS;guessRat;LLL;146|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 667))
                              (SPADCALL (CONS 0 1) (QREFELT $ 637)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 651))))
                       (QREFELT $ 652))
                      |GUESS;guessRat;LLL;146|)
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 663)))))) 

(SDEFUN |GUESS;guessRat;LL;147| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 112))) 

(SDEFUN |GUESS;guessRec;SM;148|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessRec;SM;148!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessRec;SM;148!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessRec;SM;148|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#2=#:G1778 NIL) (|res| NIL) (#3=#:G1779 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 639))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsRec| (QREFELT $ 640))
                                     |options| (QREFELT $ 657))
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
                                           (SPADCALL |q| (QREFELT $ 494)))
                                 |opts| $)
                                NIL)
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 658)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 75))
                              (PROGN (LETT #2# |res| NIL) (GO #2#))))))
                          (EXIT
                           (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 659))
                                 NIL)))
                         (LETT #3# (CDR #3#) NIL) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 660)))))
              #2# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessPRec;SM;149|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessPRec;SM;149!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessPRec;SM;149!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessPRec;SM;149|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 108))
                                 (QREFELT $ 637))
                       |z2| (QREFELT $ 657))
                      (SPADCALL |q| (QREFELT $ 669))))))) 

(SDEFUN |GUESS;guessRat;SM;150|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessRat;SM;150!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessRat;SM;150!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessRat;SM;150|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (LIST
                        (LIST
                         (SPADCALL (CONS 0 (|spadConstant| $ 275))
                                   (QREFELT $ 667))
                         (SPADCALL (CONS 0 (|spadConstant| $ 108))
                                   (QREFELT $ 637)))
                        |z2|
                        (LIST
                         (SPADCALL (|spadConstant| $ 671) (QREFELT $ 651))))
                       (QREFELT $ 652))
                      (SPADCALL |q| (QREFELT $ 669))))))) 

(DECLAIM (NOTINLINE |Guess;|)) 

(DEFUN |Guess| (&REST #1=#:G1794)
  (SPROG NIL
         (PROG (#2=#:G1795)
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
    (LETT $ (GETREFV 673) . #1#)
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
        (QSETREFV $ 225
                  (CONS (|dispatchFunction| |GUESS;guessExpRat;SM;27|) $))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 245
                   (CONS (|dispatchFunction| |GUESS;guessBinRat;SM;39|)
                         $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 424
                   (CONS (|dispatchFunction| |GUESS;diffHP;SM;89|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 494
                   (CONS (|dispatchFunction| |GUESS;shiftHP;SM;111|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 661 (CONS (|dispatchFunction| |GUESS;guessADE;SM;140|) $))
         (QSETREFV $ 662
                   (CONS (|dispatchFunction| |GUESS;guessHolo;SM;141|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 669 (CONS (|dispatchFunction| |GUESS;guessRec;SM;148|) $))
         (QSETREFV $ 670
                   (CONS (|dispatchFunction| |GUESS;guessPRec;SM;149|) $))
         (QSETREFV $ 672
                   (CONS (|dispatchFunction| |GUESS;guessRat;SM;150|) $)))))))
    $))) 

(MAKEPROP '|Guess| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |One|)
              (4 . |One|) (|Integer|) (|List| 13) (8 . |elt|) (14 . +)
              (|Mapping| 13 13 13) (20 . |reduce|) (|PositiveInteger|) (27 . *)
              (|List| 38) (33 . |variables|) (|List| 21) (|Mapping| 21 7)
              (|List| 7) (|ListFunctions2| 7 21) (38 . |map|) (|Fraction| 7)
              (44 . |numer|) (49 . |denom|) (54 . |setUnion|) (|Mapping| 21 6)
              (|List| 6) (|ListFunctions2| 6 21) (60 . |map|)
              (|Mapping| 21 21 21) (66 . |reduce|) (|Symbol|) (72 . |coerce|)
              (|List| 8) (|Mapping| 8 38) (|ListFunctions2| 38 8) (77 . |map|)
              (83 . |denominator|) (88 . |coerce|) (93 . |eval|) (100 . |Zero|)
              (104 . |Zero|) (108 . |Zero|) (|Boolean|) (112 . =)
              (118 . |numerator|) (123 . |elt|) (129 . /) (135 . ~=)
              (141 . |coerce|) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 7)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomialFunctions2| 7 6) (146 . |map|)
              (|Union| 126 '"arbitrary") (|List| 88) (|GuessOptionFunctions0|)
              (152 . |maxLevel|) (157 . |indexName|) (162 . |debug|)
              (|OutputForm|) (167 . |coerce|) (172 . |hconcat|) (|Void|)
              (|OutputPackage|) (178 . |output|) (183 . <=) (189 . |one|)
              (194 . |member?|) (200 . |member?|) (|String|) (206 . |output|)
              (211 . /) (217 . |one?|) (222 . |one?|) (|Mapping| 50 6)
              (227 . |every?|) (233 . |coerce|) (|List| 68) (238 . |subscript|)
              (|GuessOption|) (244 . |indexName|) (249 . |maxLevel|)
              (|Mapping| 40 33 63) (|List| 91) |GUESS;guess;LLLLL;8|
              (254 . |One|) (258 . -) (|Segment| 8) (264 . SEGMENT)
              (|SegmentBinding| 8) (270 . |equation|) (|SegmentBinding| $)
              (276 . |product|) (282 . |init|) (|Fraction| 57) (286 . |init|)
              (290 . *) (296 . |member?|) (302 . -) (308 . |One|) (312 . =)
              (318 . |summation|) (324 . +) |GUESS;guessRat;LLL;146|
              |GUESS;guess;LL;9| |GUESS;guess;LLL;10| |GUESS;guess;LLLL;11|
              (|SparseMultivariatePolynomial| 6 138) (330 . |coerce|)
              (|Fraction| 116) (335 . |coerce|)
              (|SparseMultivariatePolynomial| 7 138) (340 . |coerce|)
              (|Fraction| 120) (345 . /) (351 . |zero?|)
              (356 . |leadingCoefficient|) (|NonNegativeInteger|)
              (361 . |degree|) (366 . ^) (372 . |reductum|) (377 . |numer|)
              (382 . |denom|)
              (|MPolyCatFunctions2| 138 (|IndexedExponents| 138)
                                    (|IndexedExponents| 138) 7 6 120 116)
              (387 . |map|) (|SparseUnivariatePolynomial| 120) (393 . |zero?|)
              (398 . |Zero|) (402 . |leadingCoefficient|)
              (|OrderedVariableList| (NRTEVAL (LIST '|a1| 'A))) (407 . |index|)
              (|List| 138) (412 . |eval|) (419 . |retract|) (424 . |degree|)
              (429 . |monomial|) (435 . |reductum|) (440 . +)
              (|Record| (|:| |num| 148) (|:| |den| 120))
              (|SparseUnivariatePolynomial| 122)
              (|UnivariatePolynomialCommonDenominator| 120 122 148)
              (446 . |splitDenominator|) (451 . *) (457 . |retract|)
              (|Mapping| 120 122)
              (|SparseUnivariatePolynomialFunctions2| 122 120) (462 . |map|)
              (468 . |coerce|) (|Fraction| 134) (473 . /) (479 . |degree|)
              (485 . |coerce|) (490 . |eval|) (497 . |univariate|)
              (502 . |degree|) (507 . |leadingCoefficient|) (512 . ^) (518 . -)
              (523 . *) (529 . |zero?|) (534 . |resultant|)
              (|Union| $ '"failed") (540 . |exquo|) (546 . |coerce|)
              (551 . |coerce|) (556 . *) (562 . +) (568 . |last|) (573 . -)
              (578 . ^) (584 . |maxDegree|) (589 . |coerce|)
              (|MoreSystemCommands|) (594 . |systemCommand|) (|Fraction| 148)
              (|List| 122) (|FractionFreeFastGaussian| 122 148)
              (599 . |interpolate|) (|Fraction| $) (606 . |elt|) (612 . -)
              (618 . |numer|) (|NewtonInterpolation| 7) (623 . |newton|)
              (628 . |gcd|) (634 . |primitivePart|) (|Factored| 57)
              (|GeneralizedMultivariateFactorize| 525 126 6 6 57)
              (639 . |factor|) (|Record| (|:| |factor| 57) (|:| |exponent| 13))
              (|List| 198) (644 . |factors|) (649 . |coefficient|) (655 . -)
              (660 . |eval|) (667 . |zero?|) (672 . |univariate|)
              (677 . |numer|) (682 . |denom|) (687 . /) (693 . |numer|)
              (698 . |denom|) (703 . /) (|Kernel| 8) (709 . |kernel|)
              (|Kernel| $) (714 . |eval|) (721 . ^) (727 . |safety|)
              (732 . |first|) (738 . -) (744 . <) (|Mapping| 50 8)
              (750 . |select|) |GUESS;guessExpRat;LL;25|
              |GUESS;guessExpRat;LLL;26| (756 . |guessExpRat|) (761 . *)
              (767 . +) (773 . |coerce|) (778 . -) (784 . *) (790 . |One|)
              (|Mapping| 120 120 120) (|List| 120) (794 . |reduce|)
              (801 . |factorial|) (806 . |binomial|) (812 . /)
              (818 . |resultant|) |GUESS;guessBinRat;LL;32|
              |GUESS;guessBinRat;LLL;33| (825 . |One|) (829 . |coerce|)
              (|Mapping| 122 122 122) (834 . |reduce|) (841 . |guessBinRat|)
              (|Union| 19 '"arbitrary") (846 . |maxPower|) (|Union| 19 50)
              (851 . |homogeneous|) (856 . |maxDerivative|) (861 . |Somos|)
              (|Stream| 14) (|PartitionsAndPermutations|) (866 . |partitions|)
              (872 . |inc|) (|Mapping| 13 13) (|Stream| 13) (877 . |stream|)
              (883 . +) (889 . |partitions|) (|Stream| 252) (|Mapping| 252 13)
              (|StreamFunctions2| 13 252) (896 . |map|) (902 . |partitions|)
              (|StreamFunctions1| 14) (907 . |concat|) (912 . |cons|)
              (918 . |conjugates|) (923 . |#|) (928 . =) (|Mapping| 50 14)
              (934 . |select|) (940 . +) (946 . |Zero|) (950 . =) (|List| 14)
              (|Partition|) (956 . |powers|) (961 . |second|) (|Mapping| 8 8 8)
              (966 . |reduce|) (|U32Vector|) (972 . |construct|)
              (|U32VectorPolynomialOperations|) (977 . |differentiate|)
              (984 . |pow|) (992 . |truncated_multiplication|)
              (|Mapping| 283 283 283) (|List| 283) (1000 . |reduce|)
              (1006 . |copy_first|) (|UnivariateFormalPowerSeries| 6)
              (1013 . ^) (1019 . *) (|Mapping| 293 293 293) (|List| 293)
              (1025 . |reduce|) (1031 . ^) (|Mapping| 6 6) (1037 . |map|)
              (|UnivariateFormalPowerSeriesFunctions| 6) (1043 . |hadamard|)
              (|SparseMultivariatePolynomial| 6 126) (1049 . ^)
              (|Mapping| 304 304) (|UnivariateFormalPowerSeries| 304)
              (1055 . |map|) (|UnivariateFormalPowerSeriesFunctions| 304)
              (1061 . |hadamard|) (|Mapping| 307 307 307) (|List| 307)
              (1067 . |reduce|) (|Stream| 293) (|Mapping| 293 14)
              (|StreamFunctions2| 14 293) (1073 . |map|) (1079 . |Zero|)
              (1083 . |Zero|) (1087 . |Zero|) (1091 . |Zero|) (1095 . |Zero|)
              (1099 . |One|) (1103 . |One|) (1107 . |One|) (1111 . |One|)
              (1115 . |One|) (|Vector| 283) (1119 . |setelt|) (1126 . ~=)
              (1132 . |differentiate|) (1138 . *) (|Fraction| 13)
              (1144 . |One|) (1148 . |One|) (|Vector| 307) (1152 . |setelt|)
              (1159 . <=) (1165 . |subtractIfCan|) (|List| 278)
              (1171 . |position|) (1177 . >) (|Reference| 340) (1183 . |deref|)
              (1188 . |coerce|) (1193 . |partition|) (|Reference| 277)
              (1198 . |deref|) (1203 . |setref|) (1209 . |setref|)
              (1215 . |max|) (1221 . |first|) (|Mapping| 13 14)
              (|ListFunctions2| 14 13) (1226 . |map|) (1232 . |reduce|)
              (1238 . |ref|) (1243 . |ref|) (1248 . |#|) (1253 . |One|)
              (1257 . |first|) (1262 . |vector|) (1267 . |vector|) (|Stream| 8)
              (|Mapping| 8 14) (|StreamFunctions2| 14 8) (1272 . |map|)
              (1278 . |empty?|) (1283 . |max|) (|Stream| 126)
              (|Mapping| 126 14 126) (|StreamFunctions2| 14 126)
              (1289 . |scan|) (1296 . D) (1303 . D) (1309 . D)
              (|FractionFreeFastGaussian| 7 59) (1315 . |DiffAction|)
              (|FractionFreeFastGaussian| 304 307) (1322 . |DiffAction|)
              (1329 . |DiffC|) (1334 . |maxMixedDegree|) (1339 . |displayKind|)
              (1344 . |first|) (1350 . |complete|) (1355 . |entries|)
              (1360 . |elt|) (|Mapping| 314 293) (|Mapping| 328 290 13 13)
              (|Mapping| 389 126) (|Mapping| 336 307) (|Mapping| 391 482)
              (|Mapping| 364 8 38) (|Mapping| 7 126 126 59)
              (|Mapping| 304 126 126 307) (|Mapping| 8 126 38 8)
              (|Mapping| 25 126)
              (|Record| (|:| |degreeStream| 370) (|:| |guessStream| 388)
                        (|:| |guessModGen| 390) (|:| |testGen| 392)
                        (|:| |exprStream| 393) (|:| |kind| 38) (|:| |qvar| 38)
                        (|:| A 394) (|:| AF 395) (|:| AX 396) (|:| C 397))
              |GUESS;diffHP;LR;74| (1366 . |elt|) (1372 . |functionNames|)
              (1377 . >) (1383 . ~=) (1389 . |coerce|) (1394 . ~=) (|List| 33)
              (1400 . |elt|) (|Mapping| 126 14) (1406 . |map|)
              |GUESS;algDepHP;LLR;78| (1412 . |multiplyExponents|)
              (1418 . |multiplyExponents|) |GUESS;substHP;LR;82| (1424 . *)
              (|Mapping| 6 13) (1430 . |multiplyCoefficients|) (1436 . |Zero|)
              (1440 . |coerce|) (|Mapping| 304 13)
              (1445 . |multiplyCoefficients|) (1451 . |zero?|) (1456 . =)
              (|Mapping| 398 63) (1462 . |diffHP|) (1467 . |quoByVar|)
              (|Mapping| 293 293) (|MappingPackage1| 293) (1472 . ^)
              (1478 . |quoByVar|) (|Mapping| 307 307) (|MappingPackage1| 307)
              (1483 . ^) (|IntegerCombinatoricFunctions| 13)
              (1489 . |stirling2|) (1495 . |ShiftAction|)
              (1502 . |ShiftAction|) (1509 . |ShiftC|) (1514 . |monomial|)
              (1520 . -) (1526 . -) (1531 . ^) (1537 . |elt|)
              (1543 . |monomial|) (1549 . -) (1555 . ^) |GUESS;shiftHP;LR;99|
              (1561 . *) (1567 . |coerce|) (1572 . |qShiftAction|)
              (1580 . |qShiftAction|) (1588 . |qShiftC|) (1594 . *)
              (1600 . |elt|) (|Mapping| 297 293) (|StreamTensor| 293)
              (1606 . |tensorMap|) (1612 . |#|) (1617 . |new|)
              (|SingleInteger|) (1623 . |One|) (1627 . ^) (1633 . |rem|)
              (1639 . |setelt|) (1646 . /) (1652 . |ceiling|) (1657 . |rest|)
              (1662 . |copy|) (1667 . |elt|) (1673 . |cons|)
              (1679 . |reverse!|) (|List| 328) (1684 . |cons|) (1690 . |rem|)
              (1696 . -) (1701 . |reverse!|) (|List| $) (1706 . |concat|)
              (1711 . |Zero|) (|Mapping| 488 126) (|StreamTensor| 126)
              (1715 . |tensorMap|) (|List| 19) (1721 . |first|) (1726 . >)
              (1732 . *) (1738 . |elt|) (1744 . |concat|) (|List| 126)
              (1750 . |cons|) (1756 . |reverse!|) (|Mapping| 40 8)
              (|StreamTensor| 8) (1761 . |tensorMap|) (1767 . |shiftHP|)
              (|Stream| 6) (1772 . |coerce|) (1777 . |series|) (|List| 304)
              (|Stream| 304) (1782 . |coerce|) (|IndexedExponents| 126)
              (1787 . |monomial|) (1793 . |monomial|)
              (|StreamFunctions2| 13 304) (1799 . |map|) (1805 . |concat|)
              (1811 . |series|) (|SparseUnivariatePolynomial| 304)
              (|Mapping| 304 6) (|SparseUnivariatePolynomialFunctions2| 6 304)
              (1816 . |map|) (|UnivariatePolynomial| (NRTEVAL '|x|) 6)
              (1822 . |univariatePolynomial|) (1828 . |makeSUP|) (|List| 57)
              (|Mapping| 57 293) (|ListFunctions2| 293 57) (1833 . |map|)
              (|List| 59) (|Vector| 59) (1839 . |vector|) (|Vector| 6)
              (1844 . |vector|) (1849 . |checkExtraValues|)
              (|SingletonAsOrderedSet|) (1854 . |create|) (1858 . |elt|)
              (1864 . |eval|) (1871 . |retract|) (1876 . |elt|) (1882 . |gcd|)
              (1888 . ~=) (1894 . *) (1900 . +) (1906 . ~=) (|Vector| 7)
              (1912 . |elt|) (1918 . |elt|) (1924 . |zero?|) (1929 . |zero?|)
              (1934 . |zero?|) (1939 . |zero?|) (1944 . |zero?|)
              (1949 . |zero?|) (1954 . *) (|List| 508) (|Vector| 508)
              (1960 . |vector|) (1965 . |generalCoefficient|) (1973 . |zero?|)
              (1978 . |print|) (1983 . |coerce|) (1988 . |ground?|)
              (1993 . |variableName|) (|Mapping| 8 6) (|StreamFunctions2| 6 8)
              (1998 . |map|) (|BasicOperator|) (|RecurrenceOperator| 13 8)
              (2004 . |makeFEq|) (2014 . |makeRec|) (2023 . |allDegrees|)
              (2028 . <=) (|Union| '"skip" '"MonteCarlo" '"deterministic")
              (2034 . |check|) (|Union| '"good" '"reject" '"no_solution")
              (|Mapping| 566 519) (|ModularHermitePadeSolver| 6 7)
              (2039 . |gen_Monte_Carlo_check|) (|Union| 582 50)
              (2049 . |HP_solve|) (2060 . |elt|) (2066 . |setelt|) (2073 . +)
              (2079 . +) (2085 . +) (|Mapping| 126 126 126) (2091 . |reduce|)
              (2097 . |first|) (2103 . |complete|) (2108 . |entries|)
              (|Matrix| 59) (2113 . |generalInterpolation|) (|Vector| 57)
              (2121 . |vector|) (|FractionFreeFastGaussianFractions| 7 59 57)
              (2126 . |generalInterpolation|) (2134 . |column|)
              (2140 . |entries|) (2145 . |Zero|) (2149 . |elt|)
              (2156 . |content|) (2161 . |gcd|) (2166 . |exquo|)
              (2172 . |setelt|) (2180 . |explicitlyEmpty?|) (|Stream| 582)
              (2185 . |empty|) (2189 . |empty?|) (2194 . |frst|)
              (2199 . |Zero|) (2203 . |Zero|) (2207 . >=) (|Mapping| 50 13)
              (2213 . |every?|) (2219 . |rst|) (2224 . |concat|) (|Mapping| $)
              (2230 . |delay|) (|Mapping| 13 126) (|ListFunctions2| 126 13)
              (2235 . |map|) (|Stream| 488) (2241 . |genVectorStream|)
              (|Mapping| 14 488) (|StreamFunctions2| 488 14) (2248 . |map|)
              (2254 . |empty|) (2258 . |concat|) (2264 . |functionName|)
              (2269 . |operator|) (2274 . |elt|) (2280 . |rest|)
              (2286 . |empty?|) (2291 . |hconcat|) (2296 . |first|)
              (2302 . |complete|) (2307 . |entries|) (2312 . |coerce|)
              (2317 . |empty?|) (2322 . |first|) (2327 . |rst|)
              (2332 . |Somos|) (|List| 63) (2337 . |concat|)
              (2342 . |homogeneous|) (2347 . |maxPower|) (2352 . |concat|)
              (2358 . |checkOptions|) (2363 . |displayKind|)
              (2368 . |maxSubst|) |GUESS;guessAlgDep;LLL;128|
              |GUESS;guessAlgDep;LL;129| |GUESS;guessADE;LLL;130|
              |GUESS;guessADE;LL;131| (2373 . |maxDerivative|)
              |GUESS;guessAlg;LLL;132| |GUESS;guessAlg;LL;133|
              |GUESS;guessHolo;LLL;134| |GUESS;guessHolo;LL;135|
              (2378 . |allDegrees|) (2383 . |concat|) |GUESS;guessPade;LLL;136|
              |GUESS;guessPade;LL;137| |GUESS;guessFE;LLL;138|
              |GUESS;guessFE;LL;139| (2388 . |cons|) (2394 . |empty?|)
              (2399 . |append|) (2405 . |reverse!|) (2410 . |guessADE|)
              (2415 . |guessHolo|) |GUESS;guessRec;LLL;142|
              |GUESS;guessRec;LL;143| |GUESS;guessPRec;LLL;144|
              |GUESS;guessPRec;LL;145| (2420 . |maxShift|)
              |GUESS;guessRat;LL;147| (2425 . |guessRec|) (2430 . |guessPRec|)
              (2435 . |true|) (2439 . |guessRat|))
           '#(|substHP| 2444 |shiftHP| 2449 |guessRec| 2459 |guessRat| 2475
              |guessPade| 2491 |guessPRec| 2502 |guessHolo| 2518 |guessFE| 2534
              |guessExpRat| 2545 |guessBinRat| 2561 |guessAlgDep| 2577
              |guessAlg| 2588 |guessADE| 2599 |guess| 2615 |diffHP| 2641
              |algDepHP| 2651)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 672
                                                 '(0 6 0 11 0 7 0 12 2 14 13 0
                                                   13 15 2 13 0 0 0 16 3 14 13
                                                   17 0 13 18 2 13 0 19 0 20 1
                                                   7 21 0 22 2 26 23 24 25 27 1
                                                   28 7 0 29 1 28 7 0 30 2 21 0
                                                   0 0 31 2 34 23 32 33 35 2 23
                                                   21 36 0 37 1 8 0 38 39 2 42
                                                   40 41 21 43 1 8 0 0 44 1 8 0
                                                   13 45 3 8 0 0 0 0 46 0 6 0
                                                   47 0 7 0 48 0 8 0 49 2 8 50
                                                   0 0 51 1 8 0 0 52 2 33 6 0
                                                   13 53 2 8 0 0 0 54 2 6 50 0
                                                   0 55 1 28 0 7 56 2 60 57 58
                                                   59 61 1 64 62 63 65 1 64 38
                                                   63 66 1 64 50 63 67 1 62 68
                                                   0 69 2 68 0 0 0 70 1 72 71
                                                   68 73 2 19 50 0 0 74 1 64 50
                                                   63 75 2 21 50 38 0 76 2 33
                                                   50 6 0 77 1 72 71 78 79 2 6
                                                   0 0 0 80 1 8 50 0 81 1 6 50
                                                   0 82 2 33 50 83 0 84 1 19 68
                                                   0 85 2 38 0 0 86 87 1 88 0
                                                   38 89 1 88 0 62 90 0 8 0 94
                                                   2 8 0 0 0 95 2 96 0 8 8 97 2
                                                   98 0 38 96 99 2 8 0 0 100
                                                   101 0 57 0 102 0 103 0 104 2
                                                   8 0 0 0 105 2 40 50 8 0 106
                                                   2 6 0 0 0 107 0 19 0 108 2 6
                                                   50 0 0 109 2 8 0 0 100 110 2
                                                   8 0 0 0 111 1 116 0 6 117 1
                                                   118 0 116 119 1 120 0 7 121
                                                   2 122 0 120 120 123 1 57 50
                                                   0 124 1 57 6 0 125 1 57 126
                                                   0 127 2 8 0 0 126 128 1 57 0
                                                   0 129 1 103 57 0 130 1 103
                                                   57 0 131 2 132 116 58 120
                                                   133 1 134 50 0 135 0 57 0
                                                   136 1 134 120 0 137 1 138 0
                                                   19 139 3 116 0 0 140 33 141
                                                   1 116 6 0 142 1 134 126 0
                                                   143 2 57 0 6 126 144 1 134 0
                                                   0 145 2 57 0 0 0 146 1 149
                                                   147 148 150 2 122 0 0 120
                                                   151 1 122 120 0 152 2 154
                                                   134 153 148 155 1 134 0 120
                                                   156 2 157 0 134 134 158 2
                                                   120 126 0 138 159 1 7 0 13
                                                   160 3 120 0 0 138 7 161 1
                                                   120 59 0 162 1 59 126 0 163
                                                   1 59 7 0 164 2 7 0 0 126 165
                                                   1 7 0 0 166 2 7 0 0 0 167 1
                                                   7 50 0 168 2 59 7 0 0 169 2
                                                   7 170 0 0 171 1 120 0 138
                                                   172 1 122 0 120 173 2 122 0
                                                   0 0 174 2 122 0 0 0 175 1 14
                                                   13 0 176 1 13 0 0 177 2 122
                                                   0 0 13 178 1 64 62 63 179 1
                                                   126 68 0 180 1 181 71 78 182
                                                   3 185 183 184 184 126 186 2
                                                   148 122 187 122 188 2 122 0
                                                   0 0 189 1 122 120 0 190 1
                                                   191 59 25 192 2 59 0 0 0 193
                                                   1 59 0 0 194 1 196 195 57
                                                   197 1 195 199 0 200 2 57 6 0
                                                   126 201 1 6 0 0 202 3 116 0
                                                   0 138 6 203 1 116 50 0 204 1
                                                   116 57 0 205 1 183 148 0 206
                                                   1 183 148 0 207 2 157 0 0 0
                                                   208 1 157 134 0 209 1 157
                                                   134 0 210 2 103 0 57 57 211
                                                   1 212 0 38 213 3 8 0 0 214 0
                                                   215 2 8 0 0 0 216 1 64 126
                                                   63 217 2 33 0 0 126 218 2 13
                                                   0 0 0 219 2 13 50 0 0 220 2
                                                   40 0 221 0 222 1 0 91 38 225
                                                   2 120 0 13 0 226 2 120 0 0 0
                                                   227 1 120 0 13 228 2 120 0 0
                                                   0 229 2 120 0 0 0 230 0 120
                                                   0 231 3 233 120 232 0 120
                                                   234 1 13 0 0 235 2 8 0 0 0
                                                   236 2 122 0 0 0 237 3 120 0
                                                   0 0 138 238 0 122 0 241 1 6
                                                   0 38 242 3 184 122 243 0 122
                                                   244 1 0 91 38 245 1 64 246
                                                   63 247 1 64 248 63 249 1 64
                                                   62 63 250 1 64 248 63 251 2
                                                   253 252 13 13 254 1 13 0 0
                                                   255 2 257 0 256 13 258 2 126
                                                   0 0 0 259 3 253 252 13 13 13
                                                   260 2 263 261 262 257 264 1
                                                   253 252 13 265 1 266 252 261
                                                   267 2 252 0 14 0 268 1 253
                                                   252 252 269 1 14 126 0 270 2
                                                   126 50 0 0 271 2 252 0 272 0
                                                   273 2 7 0 0 0 274 0 126 0
                                                   275 2 13 50 0 0 276 1 278
                                                   277 14 279 1 14 13 0 280 2
                                                   40 8 281 0 282 1 283 0 14
                                                   284 3 285 283 283 126 13 286
                                                   4 285 283 283 19 126 13 287
                                                   4 285 283 283 283 13 13 288
                                                   2 290 283 289 0 291 3 285 71
                                                   283 283 13 292 2 293 0 0 126
                                                   294 2 293 0 0 0 295 2 297
                                                   293 296 0 298 2 6 0 0 126
                                                   299 2 293 0 300 0 301 2 302
                                                   293 293 293 303 2 304 0 0
                                                   126 305 2 307 0 306 0 308 2
                                                   309 307 307 307 310 2 312
                                                   307 311 0 313 2 316 314 315
                                                   252 317 0 122 0 318 0 116 0
                                                   319 0 157 0 320 0 293 0 321
                                                   0 307 0 322 0 57 0 323 0 116
                                                   0 324 0 157 0 325 0 293 0
                                                   326 0 307 0 327 3 328 283 0
                                                   13 283 329 2 126 50 0 0 330
                                                   2 285 283 283 13 331 2 307 0
                                                   0 0 332 0 333 0 334 0 304 0
                                                   335 3 336 307 0 13 307 337 2
                                                   13 50 0 0 338 2 278 170 0 0
                                                   339 2 340 13 278 0 341 2 13
                                                   50 0 0 342 1 343 340 0 344 1
                                                   278 14 0 345 1 278 0 14 346
                                                   1 347 277 0 348 2 347 277 0
                                                   277 349 2 343 340 0 340 350
                                                   2 13 0 0 0 351 1 14 13 0 352
                                                   2 354 14 353 277 355 2 14 13
                                                   17 0 356 1 347 0 277 357 1
                                                   343 0 340 358 1 290 126 0
                                                   359 0 126 0 360 1 290 283 0
                                                   361 1 328 0 290 362 1 336 0
                                                   312 363 2 366 364 365 252
                                                   367 1 14 50 0 368 2 126 0 0
                                                   0 369 3 372 370 126 371 252
                                                   373 3 8 0 0 38 126 374 2 293
                                                   0 0 126 375 2 307 0 0 126
                                                   376 3 377 7 126 126 59 378 3
                                                   379 304 126 126 307 380 1
                                                   377 25 126 381 1 64 126 63
                                                   382 1 64 38 63 383 2 252 0 0
                                                   126 384 1 252 0 0 385 1 252
                                                   277 0 386 2 252 14 0 13 387
                                                   2 40 8 0 13 400 1 64 21 63
                                                   401 2 126 50 0 0 402 2 13 50
                                                   0 0 403 1 38 0 78 404 2 38
                                                   50 0 0 405 2 406 33 0 13 407
                                                   2 372 370 408 252 409 2 293
                                                   0 0 19 411 2 307 0 0 19 412
                                                   2 13 0 126 0 414 2 293 0 415
                                                   0 416 0 304 0 417 1 304 0 6
                                                   418 2 307 0 419 0 420 1 126
                                                   50 0 421 2 38 50 0 0 422 1 0
                                                   423 38 424 1 293 0 0 425 2
                                                   427 426 426 126 428 1 307 0
                                                   0 429 2 431 430 430 126 432
                                                   2 433 13 13 13 434 3 377 7
                                                   126 126 59 435 3 379 304 126
                                                   126 307 436 1 377 25 126 437
                                                   2 293 0 6 126 438 2 293 0 0
                                                   0 439 1 333 0 0 440 2 293 0
                                                   0 333 441 2 370 126 0 13 442
                                                   2 307 0 304 126 443 2 307 0
                                                   0 0 444 2 307 0 0 333 445 2
                                                   8 0 126 0 447 1 7 0 38 448 4
                                                   377 7 7 126 126 59 449 4 379
                                                   304 304 126 126 307 450 2
                                                   377 25 7 126 451 2 293 0 6 0
                                                   452 2 293 0 0 0 453 2 455
                                                   314 314 454 456 1 283 126 0
                                                   457 2 283 0 126 13 458 0 459
                                                   0 460 2 13 0 0 126 461 2 13
                                                   0 0 0 462 3 283 13 0 13 13
                                                   463 2 333 0 13 13 464 1 333
                                                   13 0 465 1 290 0 0 466 1 283
                                                   0 0 467 2 283 13 0 13 468 2
                                                   290 0 283 0 469 1 290 0 0
                                                   470 2 471 0 328 0 472 2 126
                                                   0 0 0 473 1 459 0 0 474 1
                                                   471 0 0 475 1 328 0 476 477
                                                   0 459 0 478 2 480 370 370
                                                   479 481 1 482 19 0 483 2 19
                                                   50 0 0 484 2 307 0 304 0 485
                                                   2 307 0 0 0 486 2 312 0 0 0
                                                   487 2 488 0 126 0 489 1 312
                                                   0 0 490 2 492 364 364 491
                                                   493 1 0 423 38 494 1 495 0
                                                   33 496 1 293 0 495 497 1 499
                                                   0 498 500 2 501 0 126 126
                                                   502 2 304 0 6 501 503 2 504
                                                   499 419 257 505 2 499 0 0 0
                                                   506 1 307 0 499 507 2 510
                                                   508 509 57 511 2 293 512 0
                                                   126 513 1 512 57 0 514 2 517
                                                   515 516 297 518 1 520 0 519
                                                   521 1 522 0 33 523 1 64 50
                                                   63 524 0 525 0 526 2 520 59
                                                   0 13 527 3 59 0 0 525 7 528
                                                   1 59 7 0 529 2 522 6 0 13
                                                   530 2 7 0 0 0 531 2 7 50 0 0
                                                   532 2 28 0 7 0 533 2 28 0 0
                                                   0 534 2 28 50 0 0 535 2 536
                                                   7 0 13 537 2 519 59 0 13 538
                                                   1 59 50 0 539 1 8 50 0 540 1
                                                   293 50 0 541 1 13 50 0 542 1
                                                   307 50 0 543 1 6 50 0 544 2
                                                   126 0 19 0 545 1 547 0 546
                                                   548 4 379 304 395 336 126
                                                   547 549 1 304 50 0 550 1 68
                                                   71 0 551 1 13 68 0 552 1 304
                                                   50 0 553 1 64 38 63 554 2
                                                   556 364 555 495 557 6 559 8
                                                   558 38 38 8 40 364 560 5 559
                                                   8 558 38 8 40 364 561 1 64
                                                   50 63 562 2 126 50 0 0 563 1
                                                   64 564 63 565 6 568 567 567
                                                   406 38 38 126 389 569 7 568
                                                   570 406 14 38 38 126 389 567
                                                   571 2 488 126 0 13 572 3 488
                                                   126 0 13 126 573 2 293 0 0 0
                                                   574 2 307 0 0 0 575 2 6 0 0
                                                   0 576 2 488 126 577 0 578 2
                                                   314 0 0 126 579 1 314 0 0
                                                   580 1 314 297 0 581 4 377
                                                   582 25 394 520 488 583 1 584
                                                   0 515 585 4 586 582 25 394
                                                   584 488 587 2 582 520 0 13
                                                   588 1 520 519 0 589 0 59 0
                                                   590 3 582 59 0 13 13 591 1
                                                   59 7 0 592 1 7 0 476 593 2
                                                   59 170 0 7 594 4 582 59 0 13
                                                   13 59 595 1 252 50 0 596 0
                                                   597 0 598 1 252 50 0 599 1
                                                   252 14 0 600 0 13 0 601 0
                                                   508 0 602 2 13 50 0 0 603 2
                                                   14 50 604 0 605 1 252 0 0
                                                   606 2 597 0 582 0 607 1 597
                                                   0 608 609 2 611 14 610 488
                                                   612 3 377 613 126 126 126
                                                   614 2 616 252 615 613 617 0
                                                   252 0 618 2 252 0 14 0 619 1
                                                   64 38 63 620 1 558 0 38 621
                                                   2 8 0 558 0 622 2 370 0 0
                                                   126 623 1 370 50 0 624 1 68
                                                   0 476 625 2 364 0 0 126 626
                                                   1 364 0 0 627 1 364 40 0 628
                                                   1 40 68 0 629 1 597 50 0 630
                                                   1 597 582 0 631 1 597 0 0
                                                   632 1 88 0 248 633 1 634 0
                                                   476 635 1 88 0 248 636 1 88
                                                   0 246 637 2 63 0 0 0 638 1
                                                   64 71 63 639 1 88 0 38 640 1
                                                   88 0 246 641 1 88 0 62 646 1
                                                   88 0 50 651 1 63 0 476 652 2
                                                   63 0 88 0 657 1 40 50 0 658
                                                   2 40 0 0 0 659 1 40 0 0 660
                                                   1 0 91 38 661 1 0 91 38 662
                                                   1 88 0 62 667 1 0 91 38 669
                                                   1 0 91 38 670 0 50 0 671 1 0
                                                   91 38 672 1 0 398 63 413 1 1
                                                   423 38 494 1 0 398 63 446 1
                                                   1 91 38 669 2 0 40 33 63 663
                                                   1 0 40 33 664 1 1 91 38 672
                                                   2 0 40 33 63 112 1 0 40 33
                                                   668 2 0 40 33 63 653 1 0 40
                                                   33 654 1 1 91 38 670 1 0 40
                                                   33 666 2 0 40 33 63 665 1 1
                                                   91 38 662 1 0 40 33 650 2 0
                                                   40 33 63 649 2 0 40 33 63
                                                   655 1 0 40 33 656 1 1 91 38
                                                   225 2 0 40 33 63 224 1 0 40
                                                   33 223 1 1 91 38 245 1 0 40
                                                   33 239 2 0 40 33 63 240 1 0
                                                   40 406 643 2 0 40 406 63 642
                                                   1 0 40 33 648 2 0 40 33 63
                                                   647 1 1 91 38 661 2 0 40 33
                                                   63 644 1 0 40 33 645 2 0 40
                                                   33 63 114 1 0 40 33 113 4 0
                                                   40 33 92 21 63 93 3 0 40 33
                                                   92 21 115 1 1 423 38 424 1 0
                                                   398 63 399 2 0 398 406 63
                                                   410)))))
           '|lookupComplete|)) 
