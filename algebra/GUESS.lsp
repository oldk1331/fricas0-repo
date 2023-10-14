
(/VERSIONCHECK 2) 

(DEFUN |GUESS;ord1| (|x| |i| $)
  (PROG (#1=#:G295 |k| #2=#:G294 |j| #3=#:G293 #4=#:G292 |n|)
    (RETURN
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
                                       (CONS (SPADCALL |x| |j| (QREFELT $ 15))
                                             #4#)
                                       . #5#)))
                               (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                               (EXIT (NREVERSE #4#))))
                         0 (QREFELT $ 18)))
            (SPADCALL 2
                      (SPADCALL (ELT $ 16)
                                (PROGN
                                 (LETT #3# NIL . #5#)
                                 (SEQ (LETT |j| 1 . #5#) G190
                                      (COND ((|greater_SI| |j| |n|) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (SPADCALL (ELT $ 16)
                                                         (PROGN
                                                          (LETT #2# NIL . #5#)
                                                          (SEQ
                                                           (LETT |k| 1 . #5#)
                                                           (LETT #1# (- |j| 1)
                                                                 . #5#)
                                                           G190
                                                           (COND
                                                            ((|greater_SI| |k|
                                                                           #1#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #2#
                                                                   (CONS
                                                                    (*
                                                                     (SPADCALL
                                                                      |x| |k|
                                                                      (QREFELT
                                                                       $ 15))
                                                                     (SPADCALL
                                                                      |x| |j|
                                                                      (QREFELT
                                                                       $ 15)))
                                                                    #2#)
                                                                   . #5#)))
                                                           (LETT |k|
                                                                 (|inc_SI| |k|)
                                                                 . #5#)
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #2#))))
                                                         0 (QREFELT $ 18))
                                               #3#)
                                              . #5#)))
                                      (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                      G191 (EXIT (NREVERSE #3#))))
                                0 (QREFELT $ 18))
                      (QREFELT $ 20)))))))) 

(DEFUN |GUESS;ord2| (|x| |i| $)
  (PROG (|j| #1=#:G302 |n|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP |i|)
        (SEQ (LETT |n| (- (- (LENGTH |x|) 3) |i|) . #2=(|GUESS;ord2|))
             (EXIT
              (+ (|GUESS;ord1| |x| |i| $)
                 (*
                  (SPADCALL (ELT $ 16)
                            (PROGN
                             (LETT #1# NIL . #2#)
                             (SEQ (LETT |j| 1 . #2#) G190
                                  (COND ((|greater_SI| |j| |n|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS
                                           (SPADCALL |x| |j| (QREFELT $ 15))
                                           #1#)
                                          . #2#)))
                                  (LETT |j| (|inc_SI| |j|) . #2#) (GO G190)
                                  G191 (EXIT (NREVERSE #1#))))
                            0 (QREFELT $ 18))
                  (- (SPADCALL |x| (+ |n| 2) (QREFELT $ 15))
                     (SPADCALL |x| (+ |n| 1) (QREFELT $ 15))))))))
       ('T (|GUESS;ord1| |x| |i| $))))))) 

(DEFUN |GUESS;deg1| (|x| |i| $)
  (PROG (#1=#:G317 |k| #2=#:G316 |j| #3=#:G315 #4=#:G314 |m|)
    (RETURN
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
                                      (CONS (SPADCALL |x| |j| (QREFELT $ 15))
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
                                                          (LETT #2# NIL . #5#)
                                                          (SEQ
                                                           (LETT |k| (+ 2 |i|)
                                                                 . #5#)
                                                           (LETT #1# (- |j| 1)
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
                                                                      |x| |k|
                                                                      (QREFELT
                                                                       $ 15))
                                                                     (SPADCALL
                                                                      |x| |j|
                                                                      (QREFELT
                                                                       $ 15)))
                                                                    #2#)
                                                                   . #5#)))
                                                           (LETT |k| (+ |k| 1)
                                                                 . #5#)
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #2#))))
                                                         0 (QREFELT $ 18))
                                               #3#)
                                              . #5#)))
                                      (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                      (EXIT (NREVERSE #3#))))
                                0 (QREFELT $ 18))
                      (QREFELT $ 20)))))))) 

(DEFUN |GUESS;deg2| (|x| |i| $)
  (PROG (|j| #1=#:G323 |m|)
    (RETURN
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
                                           (SPADCALL |x| |j| (QREFELT $ 15))
                                           #1#)
                                          . #2#)))
                                  (LETT |j| (+ |j| 1) . #2#) (GO G190) G191
                                  (EXIT (NREVERSE #1#))))
                            0 (QREFELT $ 18)))
               (- (SPADCALL |x| (+ |m| 2) (QREFELT $ 15))
                  (SPADCALL |x| (+ |m| 1) (QREFELT $ 15)))))))))) 

(DEFUN |GUESS;getVariables| (|lF| $)
  (PROG (|lvar| |ll|)
    (RETURN
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
              (LETT |lvar| (SPADCALL (ELT $ 31) |ll| (QREFELT $ 37)) . #1#))))
           (#2# (LETT |lvar| NIL . #1#)))
          (EXIT (SPADCALL (ELT $ 39) |lvar| (QREFELT $ 43))))))) 

(DEFUN |GUESS;getVariables!0| (|g| $)
  (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 29)) (QREFELT $ 22))
            (SPADCALL (SPADCALL |g| (QREFELT $ 30)) (QREFELT $ 22))
            (QREFELT $ 31))) 

(DEFUN |GUESS;checkResult| (|res| |n| |l| |list| $)
  (PROG (#1=#:G333 #2=#:G329 |num| #3=#:G328 |den| |i|)
    (RETURN
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
                         (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                          #3#))
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
                          (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                           #2#))
                        . #4#)
                  (GO #1#))))))
             (LETT |i| (+ |i| -1) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 0)))
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;SUPS2SUPF| (|p| $)
  (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
        ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
         (SPADCALL (ELT $ 56) |p| (QREFELT $ 61)))
        ('T
         (|error|
          "Guess: type parameter F should be either equal to S or equal                       to Fraction S")))) 

(DEFUN |GUESS;guess;LLLLL;8| (|list| |guessers| |ops| |options| $)
  (PROG (|res| #1=#:G389 |guess| |sumGuess| |summ| |init| #2=#:G388 |var|
         |sumList| #3=#:G387 |i| #4=#:G386 #5=#:G380 #6=#:G385 |prodGuess|
         |prod| #7=#:G384 |prodList| #8=#:G383 #9=#:G382 |newMaxLevel|
         #10=#:G343 #11=#:G381 |guesser| |len| #12=#:G339 |xx|)
    (RETURN
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
                       (SPADCALL |newMaxLevel| (QREFELT $ 69)) (QREFELT $ 70))
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
              ((OR (ATOM #11#) (PROGN (LETT |guesser| (CAR #11#) . #13#) NIL))
               (GO G191)))
             (SEQ
              (LETT |res| (APPEND (SPADCALL |list| |options| |guesser|) |res|)
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
                        (PROG1 (LETT #10# (- (QCDR |newMaxLevel|) 1) . #13#)
                          (|check_subtype| (>= #10# 0) '(|NonNegativeInteger|)
                                           #10#)))
                  . #13#)))))
        (COND
         ((SPADCALL '|guessProduct| |ops| (QREFELT $ 76))
          (COND
           ((SPADCALL (|spadConstant| $ 47) |list| (QREFELT $ 77))
            (SEQ (|spadConstant| $ 47)
                 (EXIT
                  (COND
                   ((SPADCALL |options| (QREFELT $ 67))
                    (SPADCALL "Guess: cannot use guessProduct because of zeros"
                              (QREFELT $ 79)))))))
           (#14#
            (SEQ
             (LETT |prodList|
                   (PROGN
                    (LETT #9# NIL . #13#)
                    (SEQ (LETT |i| 1 . #13#) (LETT #8# (- |len| 1) . #13#) G190
                         (COND ((|greater_SI| |i| #8#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #9#
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL |list| (+ |i| 1) (QREFELT $ 53))
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
                       (SPADCALL '|p| (LIST (SPADCALL |len| (QREFELT $ 85)))
                                 (QREFELT $ 87))
                       . #13#)
                 (LETT |prodGuess| NIL . #13#)
                 (SEQ (LETT |guess| NIL . #13#)
                      (LETT #7#
                            (SPADCALL |prodList| |guessers| |ops|
                                      (APPEND
                                       (LIST (SPADCALL |var| (QREFELT $ 89))
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
                                                            (|spadConstant| $
                                                                            94)
                                                            (QREFELT $ 95))
                                                  (QREFELT $ 97))
                                                 (QREFELT $ 99))
                                       (QREFELT $ 101))
                             . #13#)
                       (EXIT
                        (LETT |prodGuess|
                              (CONS (SPADCALL |init| |prod| (QREFELT $ 105))
                                    |prodGuess|)
                              . #13#)))
                      (LETT #7# (CDR #7#) . #13#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SEQ (LETT |guess| NIL . #13#) (LETT #6# |prodGuess| . #13#)
                       G190
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
           ((NULL (NULL |res|)) (PROGN (LETT #5# |res| . #13#) (GO #5#))))))
        (COND
         ((SPADCALL '|guessSum| |ops| (QREFELT $ 76))
          (SEQ
           (LETT |sumList|
                 (PROGN
                  (LETT #4# NIL . #13#)
                  (SEQ (LETT |i| 1 . #13#) (LETT #3# (- |len| 1) . #13#) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
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
               (SPADCALL (CONS #'|GUESS;guess;LLLLL;8!0| (VECTOR $ |sumList|))
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
                                               (SPADCALL (|spadConstant| $ 49)
                                                         (SPADCALL |xx|
                                                                   (|spadConstant|
                                                                    $ 94)
                                                                   (QREFELT $
                                                                            95))
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
                        ((COND ((SPADCALL |guess| |res| (QREFELT $ 106)) 'NIL)
                               (#14# 'T))
                         (LETT |res| (CONS |guess| |res|) . #13#)))))
                     (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                     (EXIT NIL))))))))))
        (EXIT |res|)))
      #5# (EXIT #5#))))) 

(DEFUN |GUESS;guess;LLLLL;8!0| (|z1| $$)
  (PROG (|sumList| $)
    (LETT |sumList| (QREFELT $$ 1) . #1=(|GUESS;guess;LLLLL;8|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL |sumList| (|spadConstant| $ 108) (QREFELT $ 53))
                (QREFELT $ 109)))))) 

(DEFUN |GUESS;guess;LL;9| (|list| $)
  (SPADCALL |list| (LIST (ELT $ 112)) (LIST '|guessProduct| '|guessSum|) NIL
            (QREFELT $ 93))) 

(DEFUN |GUESS;guess;LLL;10| (|list| |options| $)
  (SPADCALL |list| (LIST (ELT $ 112)) (LIST '|guessProduct| '|guessSum|)
            |options| (QREFELT $ 93))) 

(DEFUN |GUESS;guess;LLLL;11| (|list| |guessers| |ops| $)
  (SPADCALL |list| |guessers| |ops| NIL (QREFELT $ 93))) 

(DEFUN |GUESS;F2FPOLYS| (|p| $)
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

(DEFUN |GUESS;SUPF2EXPRR| (|xx| |p| $)
  (COND ((SPADCALL |p| (QREFELT $ 124)) (|spadConstant| $ 49))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 125)) (QREFELT $ 10))
                    (SPADCALL (SPADCALL |xx| (QREFELT $ 39))
                              (SPADCALL |p| (QREFELT $ 127)) (QREFELT $ 128))
                    (QREFELT $ 105))
          (|GUESS;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 129)) $)
          (QREFELT $ 111))))) 

(DEFUN |GUESS;FSUPF2EXPRR| (|xx| |p| $)
  (SPADCALL (|GUESS;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 130)) $)
            (|GUESS;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 131)) $)
            (QREFELT $ 54))) 

(DEFUN |GUESS;POLYS2POLYF| (|p| $)
  (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
        ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
         (SPADCALL (ELT $ 56) |p| (QREFELT $ 133)))
        ('T
         (|error|
          "Guess: type parameter F should be either equal to S or equal                       to Fraction S")))) 

(DEFUN |GUESS;SUPPOLYS2SUPF| (|p| |a1v| |Av| $)
  (PROG (|lc|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 135)) (|spadConstant| $ 136))
            ('T
             (SEQ
              (LETT |lc| (|GUESS;POLYS2POLYF| (SPADCALL |p| (QREFELT $ 137)) $)
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
                (QREFELT $ 146)))))))))) 

(DEFUN |GUESS;SUPFPOLYS2FSUPPOLYS| (|p| $)
  (PROG (|pden| |pnum| |cden|)
    (RETURN
     (SEQ
      (LETT |cden| (SPADCALL |p| (QREFELT $ 150))
            . #1=(|GUESS;SUPFPOLYS2FSUPPOLYS|))
      (LETT |pnum|
            (SPADCALL (CONS #'|GUESS;SUPFPOLYS2FSUPPOLYS!0| (VECTOR $ |cden|))
                      |p| (QREFELT $ 155))
            . #1#)
      (LETT |pden| (SPADCALL (QCDR |cden|) (QREFELT $ 156)) . #1#)
      (EXIT (SPADCALL |pnum| |pden| (QREFELT $ 158))))))) 

(DEFUN |GUESS;SUPFPOLYS2FSUPPOLYS!0| (|z1| $$)
  (PROG (|cden| $)
    (LETT |cden| (QREFELT $$ 1) . #1=(|GUESS;SUPFPOLYS2FSUPPOLYS|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |z1| (QCDR |cden|) (QREFELT $ 151))
                (QREFELT $ 152)))))) 

(PUT '|GUESS;defaultD| '|SPADreplace| '(XLAM (|expr|) |expr|)) 

(DEFUN |GUESS;defaultD| (|expr| $) |expr|) 

(DEFUN |GUESS;DN2DL| (DN |i| $)
  (SPADCALL (SPADCALL (SPADCALL |i| (QREFELT $ 45)) DN) (QREFELT $ 9))) 

(DEFUN |GUESS;evalResultant| (|p1| |p2| |o| |d| |va1| |vA| $)
  (PROG (|res| #1=#:G418 #2=#:G416 |lead| #3=#:G414 #4=#:G412 |d2atk| |d1atk|
         |p2atk| |p1atk| #5=#:G424 |k| |d2| |d1|)
    (RETURN
     (SEQ (LETT |res| NIL . #6=(|GUESS;evalResultant|))
          (LETT |d1| (SPADCALL |p1| |va1| (QREFELT $ 159)) . #6#)
          (LETT |d2| (SPADCALL |p2| |va1| (QREFELT $ 159)) . #6#)
          (SEQ (LETT |k| 1 . #6#) (LETT #5# (+ (- |d| |o|) 1) . #6#) G190
               (COND ((|greater_SI| |k| #5#) (GO G191)))
               (SEQ
                (LETT |p1atk|
                      (SPADCALL
                       (SPADCALL |p1| |vA| (SPADCALL |k| (QREFELT $ 160))
                                 (QREFELT $ 161))
                       (QREFELT $ 162))
                      . #6#)
                (LETT |p2atk|
                      (SPADCALL
                       (SPADCALL |p2| |vA| (SPADCALL |k| (QREFELT $ 160))
                                 (QREFELT $ 161))
                       (QREFELT $ 162))
                      . #6#)
                (LETT |d1atk| (SPADCALL |p1atk| (QREFELT $ 163)) . #6#)
                (LETT |d2atk| (SPADCALL |p2atk| (QREFELT $ 163)) . #6#)
                (COND
                 ((< |d2atk| |d2|)
                  (COND
                   ((< |d1atk| |d1|) (LETT |lead| (|spadConstant| $ 48) . #6#))
                   ('T
                    (LETT |lead|
                          (SPADCALL (SPADCALL |p1atk| (QREFELT $ 164))
                                    (PROG1 (LETT #4# (- |d2| |d2atk|) . #6#)
                                      (|check_subtype| (>= #4# 0)
                                                       '(|NonNegativeInteger|)
                                                       #4#))
                                    (QREFELT $ 165))
                          . #6#))))
                 ((< |d1atk| |d1|)
                  (LETT |lead|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 12) (QREFELT $ 166)) |d2|
                          (QREFELT $ 165))
                         (SPADCALL (SPADCALL |p2atk| (QREFELT $ 164))
                                   (PROG1 (LETT #3# (- |d1| |d1atk|) . #6#)
                                     (|check_subtype| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      #3#))
                                   (QREFELT $ 165))
                         (QREFELT $ 167))
                        . #6#))
                 ('T (LETT |lead| (|spadConstant| $ 12) . #6#)))
                (EXIT
                 (COND
                  ((SPADCALL |lead| (QREFELT $ 168))
                   (LETT |res| (CONS (|spadConstant| $ 48) |res|) . #6#))
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
                                                (SPADCALL |k| (QREFELT $ 160))
                                                (PROG1 (LETT #2# |o| . #6#)
                                                  (|check_subtype| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   #2#))
                                                (QREFELT $ 165))
                                               (QREFELT $ 171))
                                              . #6#)
                                        (QCDR #1#)
                                      (|check_union| (QEQCAR #1# 0)
                                                     (QREFELT $ 7) #1#))
                                    (QREFELT $ 167))
                          |res|)
                         . #6#)))))
               (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (REVERSE |res|)))))) 

(DEFUN |GUESS;p| (|xm| |i| |va1| |vA| |basis| $)
  (SPADCALL (SPADCALL (SPADCALL |vA| (QREFELT $ 172)) (QREFELT $ 173))
            (SPADCALL
             (SPADCALL (SPADCALL |va1| (QREFELT $ 172)) (QREFELT $ 173))
             (|GUESS;F2FPOLYS|
              (SPADCALL (|GUESS;DN2DL| |basis| |i| $)
                        (|GUESS;DN2DL| |basis| |xm| $) (QREFELT $ 107))
              $)
             (QREFELT $ 174))
            (QREFELT $ 175))) 

(DEFUN |GUESS;p2| (|xm| |i| |a1v| |Av| |basis| $)
  (SPADCALL (SPADCALL |Av| (QREFELT $ 10))
            (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                      (SPADCALL
                       (SPADCALL (SPADCALL |i| (QREFELT $ 39)) |basis|)
                       (SPADCALL (SPADCALL |xm| (QREFELT $ 45)) |basis|)
                       (QREFELT $ 95))
                      (QREFELT $ 105))
            (QREFELT $ 111))) 

(DEFUN |GUESS;guessExpRatAux| (|xx| |list| |basis| |xValues| |options| $)
  (PROG (#1=#:G484 |res| |res4| |denr| |numr| |ri1| |t2| |t1| |a1v| #2=#:G488
         |g| |evalPoly| |Av| #3=#:G487 |f| |res3| |res2| |res1| |d2| |o2| |d1|
         |o1| |n| |poly3| |poly2| |poly1| |ri| #4=#:G463 |i| |maxDeg| |maxD|
         |y3| |y2| |y1| |ylist| #5=#:G486 |y| |x3| |x2| |x1| |xlist| #6=#:G485
         |len| #7=#:G437 A |a1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |a1| (SPADCALL 1 (QREFELT $ 139)) . #8=(|GUESS;guessExpRatAux|))
        (LETT A (SPADCALL 2 (QREFELT $ 139)) . #8#)
        (LETT |len| (LENGTH |list|) . #8#)
        (COND ((< |len| 4) (PROGN (LETT #1# NIL . #8#) (GO #1#)))
              (#9='T
               (LETT |len|
                     (PROG1 (LETT #7# (- |len| 3) . #8#)
                       (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                        #7#))
                     . #8#)))
        (LETT |xlist|
              (PROGN
               (LETT #6# NIL . #8#)
               (SEQ (LETT |i| 1 . #8#) G190
                    (COND ((|greater_SI| |i| |len|) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #6#
                            (CONS
                             (|GUESS;F2FPOLYS|
                              (|GUESS;DN2DL| |basis|
                               (SPADCALL |xValues| |i| (QREFELT $ 15)) $)
                              $)
                             #6#)
                            . #8#)))
                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #6#))))
              . #8#)
        (LETT |x1|
              (|GUESS;F2FPOLYS|
               (|GUESS;DN2DL| |basis|
                (SPADCALL |xValues| (+ |len| 1) (QREFELT $ 15)) $)
               $)
              . #8#)
        (LETT |x2|
              (|GUESS;F2FPOLYS|
               (|GUESS;DN2DL| |basis|
                (SPADCALL |xValues| (+ |len| 2) (QREFELT $ 15)) $)
               $)
              . #8#)
        (LETT |x3|
              (|GUESS;F2FPOLYS|
               (|GUESS;DN2DL| |basis|
                (SPADCALL |xValues| (+ |len| 3) (QREFELT $ 15)) $)
               $)
              . #8#)
        (LETT |y|
              (CONS #'|GUESS;guessExpRatAux!0|
                    (VECTOR |basis| A |a1| |xValues| $ |list|))
              . #8#)
        (LETT |ylist|
              (PROGN
               (LETT #5# NIL . #8#)
               (SEQ (LETT |i| 1 . #8#) G190
                    (COND ((|greater_SI| |i| |len|) (GO G191)))
                    (SEQ (EXIT (LETT #5# (CONS (SPADCALL |i| |y|) #5#) . #8#)))
                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #5#))))
              . #8#)
        (LETT |y1| (SPADCALL (+ |len| 1) |y|) . #8#)
        (LETT |y2| (SPADCALL (+ |len| 2) |y|) . #8#)
        (LETT |y3| (SPADCALL (+ |len| 3) |y|) . #8#) (LETT |res| NIL . #8#)
        (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 179)) . #8#)
             (EXIT
              (COND
               ((QEQCAR |maxD| 0)
                (LETT |maxDeg| (MIN (QCDR |maxD|) (- |len| 1)) . #8#))
               (#9# (LETT |maxDeg| (- |len| 1) . #8#)))))
        (SEQ (LETT |i| 0 . #8#) G190
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
                      (SPADCALL "Guess: interpolating..." (QREFELT $ 73))))))
              (LETT |ri|
                    (SPADCALL |xlist| |ylist|
                              (PROG1 (LETT #4# (- (- |len| 1) |i|) . #8#)
                                (|check_subtype| (>= #4# 0)
                                                 '(|NonNegativeInteger|) #4#))
                              (QREFELT $ 186))
                    . #8#)
              (COND
               ((SPADCALL |options| (QREFELT $ 67))
                (SPADCALL "Guess: polynomials..." (QREFELT $ 73))))
              (LETT |poly1|
                    (SPADCALL
                     (SPADCALL (SPADCALL |ri| |x1| (QREFELT $ 188)) |y1|
                               (QREFELT $ 189))
                     (QREFELT $ 190))
                    . #8#)
              (LETT |poly2|
                    (SPADCALL
                     (SPADCALL (SPADCALL |ri| |x2| (QREFELT $ 188)) |y2|
                               (QREFELT $ 189))
                     (QREFELT $ 190))
                    . #8#)
              (LETT |poly3|
                    (SPADCALL
                     (SPADCALL (SPADCALL |ri| |x3| (QREFELT $ 188)) |y3|
                               (QREFELT $ 189))
                     (QREFELT $ 190))
                    . #8#)
              (LETT |n| (- |len| |i|) . #8#)
              (LETT |o1| (|GUESS;ord1| |xValues| |i| $) . #8#)
              (LETT |d1| (|GUESS;deg1| |xValues| |i| $) . #8#)
              (LETT |o2| (|GUESS;ord2| |xValues| |i| $) . #8#)
              (LETT |d2| (|GUESS;deg2| |xValues| |i| $) . #8#)
              (COND
               ((SPADCALL |options| (QREFELT $ 67))
                (SPADCALL "Guess: interpolating resultants..."
                          (QREFELT $ 73))))
              (LETT |res1|
                    (SPADCALL
                     (|GUESS;evalResultant| |poly1| |poly3| |o1| |d1| |a1| A $)
                     (QREFELT $ 192))
                    . #8#)
              (LETT |res2|
                    (SPADCALL
                     (|GUESS;evalResultant| |poly2| |poly3| |o2| |d2| |a1| A $)
                     (QREFELT $ 192))
                    . #8#)
              (COND
               ((SPADCALL |options| (QREFELT $ 67))
                (SPADCALL "Guess: computing gcd..." (QREFELT $ 73))))
              (LETT |res3|
                    (|GUESS;SUPS2SUPF|
                     (SPADCALL (SPADCALL |res1| |res2| (QREFELT $ 193))
                               (QREFELT $ 194))
                     $)
                    . #8#)
              (COND
               ((SPADCALL |options| (QREFELT $ 67))
                (SPADCALL "Guess: solving..." (QREFELT $ 73))))
              (SEQ (LETT |f| NIL . #8#)
                   (LETT #3#
                         (SPADCALL (SPADCALL |res3| (QREFELT $ 197))
                                   (QREFELT $ 200))
                         . #8#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #8#) NIL))
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
                              . #8#)
                        (LETT |evalPoly|
                              (SPADCALL (|GUESS;POLYS2POLYF| |poly3| $) A |Av|
                                        (QREFELT $ 203))
                              . #8#)
                        (COND
                         ((SPADCALL |evalPoly| (QREFELT $ 204))
                          (LETT |evalPoly|
                                (SPADCALL (|GUESS;POLYS2POLYF| |poly1| $) A
                                          |Av| (QREFELT $ 203))
                                . #8#)))
                        (EXIT
                         (SEQ (LETT |g| NIL . #8#)
                              (LETT #2#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |evalPoly| (QREFELT $ 205))
                                      (QREFELT $ 197))
                                     (QREFELT $ 200))
                                    . #8#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |g| (CAR #2#) . #8#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQL (SPADCALL (QCAR |g|) (QREFELT $ 127)) 1)
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
                                         . #8#)
                                   (LETT |t1|
                                         (SPADCALL
                                          (|GUESS;POLYS2POLYF| |poly1| $)
                                          (LIST |a1| A) (LIST |a1v| |Av|)
                                          (QREFELT $ 141))
                                         . #8#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |t1| (QREFELT $ 204))
                                      (SEQ
                                       (LETT |t2|
                                             (SPADCALL
                                              (|GUESS;POLYS2POLYF| |poly2| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 141))
                                             . #8#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t2| (QREFELT $ 204))
                                          (SEQ
                                           (LETT |ri1|
                                                 (SPADCALL
                                                  (|GUESS;SUPFPOLYS2FSUPPOLYS|
                                                   (SPADCALL |ri|
                                                             (QREFELT $ 206))
                                                   $)
                                                  (|GUESS;SUPFPOLYS2FSUPPOLYS|
                                                   (SPADCALL |ri|
                                                             (QREFELT $ 207))
                                                   $)
                                                  (QREFELT $ 208))
                                                 . #8#)
                                           (LETT |numr|
                                                 (|GUESS;SUPPOLYS2SUPF|
                                                  (SPADCALL |ri1|
                                                            (QREFELT $ 209))
                                                  |a1v| |Av| $)
                                                 . #8#)
                                           (LETT |denr|
                                                 (|GUESS;SUPPOLYS2SUPF|
                                                  (SPADCALL |ri1|
                                                            (QREFELT $ 210))
                                                  |a1v| |Av| $)
                                                 . #8#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |denr| (QREFELT $ 124))
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
                                                        (SPADCALL |numr| |denr|
                                                                  (QREFELT $
                                                                           211))
                                                        $)
                                                       (SPADCALL |xx|
                                                                 (QREFELT $
                                                                          213))
                                                       (SPADCALL
                                                        (SPADCALL |xx|
                                                                  (QREFELT $
                                                                           39))
                                                        |basis|)
                                                       (QREFELT $ 215))
                                                      (SPADCALL
                                                       (|GUESS;p2|
                                                        (SPADCALL |xValues|
                                                                  (QREFELT $
                                                                           176))
                                                        |xx| |a1v| |Av| |basis|
                                                        $)
                                                       (SPADCALL |xx|
                                                                 (QREFELT $
                                                                          39))
                                                       (QREFELT $ 216))
                                                      (QREFELT $ 105))
                                                     . #8#)
                                               (EXIT
                                                (LETT |res| (CONS |res4| |res|)
                                                      . #8#)))))))))))))))))))
                              (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                              (EXIT NIL))))))))
                   (LETT #3# (CDR #3#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL (NULL |res|))
                 (COND
                  ((SPADCALL |options| (QREFELT $ 75))
                   (PROGN (LETT #1# |res| . #8#) (GO #1#))))))))
             (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
        (EXIT |res|)))
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;guessExpRatAux!0| (|z1| $$)
  (PROG (|list| $ |xValues| |a1| A |basis|)
    (LETT |list| (QREFELT $$ 5) . #1=(|GUESS;guessExpRatAux|))
    (LETT $ (QREFELT $$ 4) . #1#)
    (LETT |xValues| (QREFELT $$ 3) . #1#)
    (LETT |a1| (QREFELT $$ 2) . #1#)
    (LETT A (QREFELT $$ 1) . #1#)
    (LETT |basis| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|GUESS;F2FPOLYS| (SPADCALL |list| |z1| (QREFELT $ 53)) $)
                (SPADCALL
                 (|GUESS;p| (SPADCALL |xValues| (QREFELT $ 176))
                  (SPADCALL |xValues| |z1| (QREFELT $ 15)) |a1| A |basis| $)
                 (SPADCALL (SPADCALL |xValues| |z1| (QREFELT $ 15))
                           (QREFELT $ 177))
                 (QREFELT $ 178))
                (QREFELT $ 174)))))) 

(DEFUN |GUESS;guessExpRatAux0| (|list| |basis| |options| $)
  (PROG (|res| #1=#:G505 |f| #2=#:G504 |xValues| |newlist| |i| #3=#:G503 |x|
         |zeros| #4=#:G502 |shortlist| #5=#:G491 #6=#:G501 |len| |xx|)
    (RETURN
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
                          (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|)
                                           #5#))
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
                                      (SPADCALL (SPADCALL |xx| (QREFELT $ 39))
                                                |basis|)
                                      (SPADCALL (SPADCALL |i| (QREFELT $ 45))
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
                                                  (SPADCALL |i| (QREFELT $ 45))
                                                  (QREFELT $ 46))
                                        (QREFELT $ 9))
                                       (QREFELT $ 80))
                             |newlist|)
                            . #7#)
                      (EXIT (LETT |xValues| (CONS |i| |xValues|) . #7#)))))))
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
                     ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #7#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL (SPADCALL |zeros| |f| (QREFELT $ 105))
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
      #6# (EXIT #6#))))) 

(DEFUN |GUESS;guessExpRatAux0!0| (|z1| $$)
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

(DEFUN |GUESS;guessExpRat;LL;25| (|list| $)
  (|GUESS;guessExpRatAux0| |list| (CONS (|function| |GUESS;defaultD|) $) NIL $)) 

(DEFUN |GUESS;guessExpRat;LLL;26| (|list| |options| $)
  (|GUESS;guessExpRatAux0| |list| (CONS (|function| |GUESS;defaultD|) $)
   |options| $)) 

(DEFUN |GUESS;guessExpRat;SM;27| (|q| $)
  (PROG () (RETURN (CONS #'|GUESS;guessExpRat;SM;27!1| (VECTOR |q| $))))) 

(DEFUN |GUESS;guessExpRat;SM;27!1| (|z1| |z2| $$)
  (PROG ($ |q|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessExpRat;SM;27|))
    (LETT |q| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (|GUESS;guessExpRatAux0| |z1|
          (CONS #'|GUESS;guessExpRat;SM;27!0| (VECTOR $ |q|)) |z2| $))))))) 

(DEFUN |GUESS;guessExpRat;SM;27!0| (|i1| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |q| (QREFELT $ 39)) |i1| (QREFELT $ 216)))))) 

(DEFUN |GUESS;binExt| (|i| |va1| |vA| $)
  (PROG (|num| |numl| #1=#:G519 |l| #2=#:G518)
    (RETURN
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
                 (QREFELT $ 123))))))) 

(DEFUN |GUESS;binExtEXPR| (|i| |a1v| |Av| $)
  (SPADCALL
   (SPADCALL (SPADCALL |Av| (QREFELT $ 10))
             (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                       (SPADCALL |i| (QREFELT $ 39)) (QREFELT $ 105))
             (QREFELT $ 111))
   (SPADCALL |i| (QREFELT $ 39)) (QREFELT $ 236))) 

(DEFUN |GUESS;guessBinRatAux|
       (|xx| |list| |basis| |ext| |extEXPR| |xValues| |options| $)
  (PROG (#1=#:G550 |res| |res4| |denr| |numr| |ri1| |t2| |t1| |a1v| #2=#:G554
         |g| |evalPoly| |Av| #3=#:G553 |f| |res3| |res2| |res1| |n| |poly3|
         |poly2| |poly1| |ri| #4=#:G533 |i| |maxDeg| |maxD| |y3| |y2| |y1|
         |ylist| #5=#:G552 |y| |x3| |x2| |x1| |xlist| #6=#:G551 |len| #7=#:G521
         A |a1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |a1| (SPADCALL 1 (QREFELT $ 139)) . #8=(|GUESS;guessBinRatAux|))
        (LETT A (SPADCALL 2 (QREFELT $ 139)) . #8#)
        (LETT |len| (LENGTH |list|) . #8#)
        (COND ((< |len| 4) (PROGN (LETT #1# NIL . #8#) (GO #1#)))
              (#9='T
               (LETT |len|
                     (PROG1 (LETT #7# (- |len| 3) . #8#)
                       (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                        #7#))
                     . #8#)))
        (LETT |xlist|
              (PROGN
               (LETT #6# NIL . #8#)
               (SEQ (LETT |i| 1 . #8#) G190
                    (COND ((|greater_SI| |i| |len|) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #6#
                            (CONS
                             (|GUESS;F2FPOLYS|
                              (|GUESS;DN2DL| |basis|
                               (SPADCALL |xValues| |i| (QREFELT $ 15)) $)
                              $)
                             #6#)
                            . #8#)))
                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #6#))))
              . #8#)
        (LETT |x1|
              (|GUESS;F2FPOLYS|
               (|GUESS;DN2DL| |basis|
                (SPADCALL |xValues| (+ |len| 1) (QREFELT $ 15)) $)
               $)
              . #8#)
        (LETT |x2|
              (|GUESS;F2FPOLYS|
               (|GUESS;DN2DL| |basis|
                (SPADCALL |xValues| (+ |len| 2) (QREFELT $ 15)) $)
               $)
              . #8#)
        (LETT |x3|
              (|GUESS;F2FPOLYS|
               (|GUESS;DN2DL| |basis|
                (SPADCALL |xValues| (+ |len| 3) (QREFELT $ 15)) $)
               $)
              . #8#)
        (LETT |y|
              (CONS #'|GUESS;guessBinRatAux!0|
                    (VECTOR |ext| A |a1| |xValues| $ |list|))
              . #8#)
        (LETT |ylist|
              (PROGN
               (LETT #5# NIL . #8#)
               (SEQ (LETT |i| 1 . #8#) G190
                    (COND ((|greater_SI| |i| |len|) (GO G191)))
                    (SEQ (EXIT (LETT #5# (CONS (SPADCALL |i| |y|) #5#) . #8#)))
                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #5#))))
              . #8#)
        (LETT |y1| (SPADCALL (+ |len| 1) |y|) . #8#)
        (LETT |y2| (SPADCALL (+ |len| 2) |y|) . #8#)
        (LETT |y3| (SPADCALL (+ |len| 3) |y|) . #8#) (LETT |res| NIL . #8#)
        (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 179)) . #8#)
             (EXIT
              (COND
               ((QEQCAR |maxD| 0)
                (LETT |maxDeg| (MIN (QCDR |maxD|) (- |len| 1)) . #8#))
               (#9# (LETT |maxDeg| (- |len| 1) . #8#)))))
        (SEQ (LETT |i| 0 . #8#) G190
             (COND ((|greater_SI| |i| |maxDeg|) (GO G191)))
             (SEQ
              (LETT |ri|
                    (SPADCALL |xlist| |ylist|
                              (PROG1 (LETT #4# (- (- |len| 1) |i|) . #8#)
                                (|check_subtype| (>= #4# 0)
                                                 '(|NonNegativeInteger|) #4#))
                              (QREFELT $ 186))
                    . #8#)
              (LETT |poly1|
                    (SPADCALL
                     (SPADCALL (SPADCALL |ri| |x1| (QREFELT $ 188)) |y1|
                               (QREFELT $ 189))
                     (QREFELT $ 190))
                    . #8#)
              (LETT |poly2|
                    (SPADCALL
                     (SPADCALL (SPADCALL |ri| |x2| (QREFELT $ 188)) |y2|
                               (QREFELT $ 189))
                     (QREFELT $ 190))
                    . #8#)
              (LETT |poly3|
                    (SPADCALL
                     (SPADCALL (SPADCALL |ri| |x3| (QREFELT $ 188)) |y3|
                               (QREFELT $ 189))
                     (QREFELT $ 190))
                    . #8#)
              (LETT |n| (- |len| |i|) . #8#)
              (LETT |res1|
                    (SPADCALL (SPADCALL |poly1| |poly3| |a1| (QREFELT $ 238))
                              (QREFELT $ 162))
                    . #8#)
              (LETT |res2|
                    (SPADCALL (SPADCALL |poly2| |poly3| |a1| (QREFELT $ 238))
                              (QREFELT $ 162))
                    . #8#)
              (COND
               ((SPADCALL |options| (QREFELT $ 67))
                (SPADCALL "Guess: computing gcd..." (QREFELT $ 73))))
              (LETT |res3|
                    (|GUESS;SUPS2SUPF|
                     (SPADCALL (SPADCALL |res1| |res2| (QREFELT $ 193))
                               (QREFELT $ 194))
                     $)
                    . #8#)
              (SEQ (LETT |f| NIL . #8#)
                   (LETT #3#
                         (SPADCALL (SPADCALL |res3| (QREFELT $ 197))
                                   (QREFELT $ 200))
                         . #8#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #8#) NIL))
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
                              . #8#)
                        (LETT |evalPoly|
                              (SPADCALL (|GUESS;POLYS2POLYF| |poly3| $) A |Av|
                                        (QREFELT $ 203))
                              . #8#)
                        (COND
                         ((SPADCALL |evalPoly| (QREFELT $ 204))
                          (LETT |evalPoly|
                                (SPADCALL (|GUESS;POLYS2POLYF| |poly1| $) A
                                          |Av| (QREFELT $ 203))
                                . #8#)))
                        (EXIT
                         (SEQ (LETT |g| NIL . #8#)
                              (LETT #2#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |evalPoly| (QREFELT $ 205))
                                      (QREFELT $ 197))
                                     (QREFELT $ 200))
                                    . #8#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |g| (CAR #2#) . #8#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQL (SPADCALL (QCAR |g|) (QREFELT $ 127)) 1)
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
                                         . #8#)
                                   (LETT |t1|
                                         (SPADCALL
                                          (|GUESS;POLYS2POLYF| |poly1| $)
                                          (LIST |a1| A) (LIST |a1v| |Av|)
                                          (QREFELT $ 141))
                                         . #8#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |t1| (QREFELT $ 204))
                                      (SEQ
                                       (LETT |t2|
                                             (SPADCALL
                                              (|GUESS;POLYS2POLYF| |poly2| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 141))
                                             . #8#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t2| (QREFELT $ 204))
                                          (SEQ
                                           (LETT |ri1|
                                                 (SPADCALL
                                                  (|GUESS;SUPFPOLYS2FSUPPOLYS|
                                                   (SPADCALL |ri|
                                                             (QREFELT $ 206))
                                                   $)
                                                  (|GUESS;SUPFPOLYS2FSUPPOLYS|
                                                   (SPADCALL |ri|
                                                             (QREFELT $ 207))
                                                   $)
                                                  (QREFELT $ 208))
                                                 . #8#)
                                           (LETT |numr|
                                                 (|GUESS;SUPPOLYS2SUPF|
                                                  (SPADCALL |ri1|
                                                            (QREFELT $ 209))
                                                  |a1v| |Av| $)
                                                 . #8#)
                                           (LETT |denr|
                                                 (|GUESS;SUPPOLYS2SUPF|
                                                  (SPADCALL |ri1|
                                                            (QREFELT $ 210))
                                                  |a1v| |Av| $)
                                                 . #8#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |denr| (QREFELT $ 124))
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
                                                        (SPADCALL |numr| |denr|
                                                                  (QREFELT $
                                                                           211))
                                                        $)
                                                       (SPADCALL |xx|
                                                                 (QREFELT $
                                                                          213))
                                                       (SPADCALL
                                                        (SPADCALL |xx|
                                                                  (QREFELT $
                                                                           39))
                                                        |basis|)
                                                       (QREFELT $ 215))
                                                      (SPADCALL |xx| |a1v| |Av|
                                                                |extEXPR|)
                                                      (QREFELT $ 105))
                                                     . #8#)
                                               (EXIT
                                                (LETT |res| (CONS |res4| |res|)
                                                      . #8#)))))))))))))))))))
                              (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                              (EXIT NIL))))))))
                   (LETT #3# (CDR #3#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL (NULL |res|))
                 (COND
                  ((SPADCALL |options| (QREFELT $ 75))
                   (PROGN (LETT #1# |res| . #8#) (GO #1#))))))))
             (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
        (EXIT |res|)))
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;guessBinRatAux!0| (|z1| $$)
  (PROG (|list| $ |xValues| |a1| A |ext|)
    (LETT |list| (QREFELT $$ 5) . #1=(|GUESS;guessBinRatAux|))
    (LETT $ (QREFELT $$ 4) . #1#)
    (LETT |xValues| (QREFELT $$ 3) . #1#)
    (LETT |a1| (QREFELT $$ 2) . #1#)
    (LETT A (QREFELT $$ 1) . #1#)
    (LETT |ext| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|GUESS;F2FPOLYS| (SPADCALL |list| |z1| (QREFELT $ 53)) $)
                (SPADCALL (SPADCALL |xValues| |z1| (QREFELT $ 15)) |a1| A
                          |ext|)
                (QREFELT $ 237)))))) 

(DEFUN |GUESS;guessBinRatAux0| (|list| |basis| |ext| |extEXPR| |options| $)
  (PROG (|res| #1=#:G577 |f| #2=#:G576 |xValues| |newlist| |i| #3=#:G575 |x|
         |zeros| #4=#:G574 |shortlist| #5=#:G557 #6=#:G573 |len| |xx|)
    (RETURN
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
                          (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|)
                                           #5#))
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
                                      (SPADCALL (SPADCALL |xx| (QREFELT $ 39))
                                                |basis|)
                                      (SPADCALL (SPADCALL |i| (QREFELT $ 45))
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
                                                  (SPADCALL |i| (QREFELT $ 45))
                                                  (QREFELT $ 46))
                                        (QREFELT $ 9))
                                       (QREFELT $ 80))
                             |newlist|)
                            . #7#)
                      (EXIT (LETT |xValues| (CONS |i| |xValues|) . #7#)))))))
             (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
        (LETT |newlist| (REVERSE |newlist|) . #7#)
        (LETT |xValues| (REVERSE |xValues|) . #7#)
        (LETT |res|
              (PROGN
               (LETT #2# NIL . #7#)
               (SEQ (LETT |f| NIL . #7#)
                    (LETT #1#
                          (|GUESS;guessBinRatAux| |xx| |newlist| |basis| |ext|
                           |extEXPR| |xValues| |options| $)
                          . #7#)
                    G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #7#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL (SPADCALL |zeros| |f| (QREFELT $ 105))
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
      #6# (EXIT #6#))))) 

(DEFUN |GUESS;guessBinRatAux0!0| (|z1| $$)
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

(DEFUN |GUESS;guessBinRat;LL;32| (|list| $)
  (|GUESS;guessBinRatAux0| |list| (CONS (|function| |GUESS;defaultD|) $)
   (CONS (|function| |GUESS;binExt|) $)
   (CONS (|function| |GUESS;binExtEXPR|) $) NIL $)) 

(DEFUN |GUESS;guessBinRat;LLL;33| (|list| |options| $)
  (|GUESS;guessBinRatAux0| |list| (CONS (|function| |GUESS;defaultD|) $)
   (CONS (|function| |GUESS;binExt|) $)
   (CONS (|function| |GUESS;binExtEXPR|) $) |options| $)) 

(DEFUN |GUESS;qD| (|q| $)
  (PROG () (RETURN (CONS #'|GUESS;qD!0| (VECTOR $ |q|))))) 

(DEFUN |GUESS;qD!0| (|z1| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;qD|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |q| (QREFELT $ 39)) |z1| (QREFELT $ 216)))))) 

(DEFUN |GUESS;qBinExtAux| (|q| |i| |va1| |vA| $)
  (PROG (|fl| |l| #1=#:G601)
    (RETURN
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
       (SPADCALL (ELT $ 174) |fl| (|spadConstant| $ 241) (QREFELT $ 244))))))) 

(DEFUN |GUESS;qBinExt| (|q| $)
  (PROG () (RETURN (CONS #'|GUESS;qBinExt!0| (VECTOR $ |q|))))) 

(DEFUN |GUESS;qBinExt!0| (|z1| |z2| |z3| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;qBinExt|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;qBinExtAux| |q| |z1| |z2| |z3| $))))) 

(DEFUN |GUESS;qBinExtEXPRaux| (|q| |i| |a1v| |Av| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| '|l| |GUESS;qBinExtEXPRaux|)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (|spadConstant| $ 94)
                       (SPADCALL
                        (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                                  (SPADCALL (SPADCALL |Av| (QREFELT $ 10))
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
                                 (SPADCALL |l| (QREFELT $ 39)) (QREFELT $ 216))
                       (QREFELT $ 95))
             (QREFELT $ 54))
            (SPADCALL |l|
                      (SPADCALL (|spadConstant| $ 94)
                                (SPADCALL |i| (QREFELT $ 39)) (QREFELT $ 97))
                      (QREFELT $ 99))
            (QREFELT $ 101))))))) 

(DEFUN |GUESS;qBinExtEXPR| (|q| $)
  (PROG () (RETURN (CONS #'|GUESS;qBinExtEXPR!0| (VECTOR $ |q|))))) 

(DEFUN |GUESS;qBinExtEXPR!0| (|z1| |z2| |z3| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;qBinExtEXPR|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;qBinExtEXPRaux| |q| |z1| |z2| |z3| $))))) 

(DEFUN |GUESS;guessBinRat;SM;39| (|q| $)
  (PROG () (RETURN (CONS #'|GUESS;guessBinRat;SM;39!0| (VECTOR $ |q|))))) 

(DEFUN |GUESS;guessBinRat;SM;39!0| (|z1| |z2| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) . #1=(|GUESS;guessBinRat;SM;39|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;guessBinRatAux0| |z1| (|GUESS;qD| |q| $) (|GUESS;qBinExt| |q| $)
       (|GUESS;qBinExtEXPR| |q| $) |z2| $))))) 

(DEFUN |GUESS;FilteredPartitionStream| (|options| $)
  (PROG (|s| |s3| |s2| |s1| |maxD| |Somo| |maxP| |homo|)
    (RETURN
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
                (SPADCALL (+ (QCDR |maxD|) 1) (QCDR |maxP|) (QREFELT $ 254))
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
               (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 268)) . #1#))))))
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
               (CONS #'|GUESS;FilteredPartitionStream!4| (VECTOR |maxP| $)) |s|
               (QREFELT $ 273))
              . #1#)))
      (COND
       ((QEQCAR |Somo| 0)
        (LETT |s|
              (SPADCALL
               (CONS #'|GUESS;FilteredPartitionStream!5| (VECTOR |Somo| $)) |s|
               (QREFELT $ 273))
              . #1#)))
      (EXIT |s|))))) 

(DEFUN |GUESS;FilteredPartitionStream!5| (|z1| $$)
  (PROG ($ |Somo|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
    (LETT |Somo| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL (ELT $ 16) |z1| (|spadConstant| $ 275) (QREFELT $ 18))
       (SPADCALL (QCDR |Somo|) (SPADCALL |z1| (QREFELT $ 270)) (QREFELT $ 259))
       (QREFELT $ 276)))))) 

(DEFUN |GUESS;FilteredPartitionStream!4| (|z1| $$)
  (PROG ($ |maxP|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
    (LETT |maxP| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G618)
        (RETURN
         (SPADCALL (SPADCALL |z1| (QREFELT $ 270))
                   (PROG2 (LETT #2# |maxP| NIL)
                       (QCDR #2#)
                     (|check_union| (QEQCAR #2# 0) (|PositiveInteger|) #2#))
                   (QREFELT $ 271)))))))) 

(DEFUN |GUESS;FilteredPartitionStream!3| (|z1| $$)
  (PROG (|maxP| $)
    (LETT |maxP| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 260)))))) 

(DEFUN |GUESS;FilteredPartitionStream!2| (|z1| $$)
  (PROG (|maxD| $)
    (LETT |maxD| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (QCDR |maxD|) (|spadConstant| $ 108) (QREFELT $ 259))
                |z1| |z1| (QREFELT $ 260)))))) 

(DEFUN |GUESS;FilteredPartitionStream!1| (|z1| $$)
  (PROG (|maxP| $)
    (LETT |maxP| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 260)))))) 

(DEFUN |GUESS;FilteredPartitionStream!0| (|z1| $$)
  (PROG (|maxD| $)
    (LETT |maxD| (QREFELT $$ 1) . #1=(|GUESS;FilteredPartitionStream|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (QCDR |maxD|) (|spadConstant| $ 108) (QREFELT $ 259))
                |z1| |z1| (QREFELT $ 260)))))) 

(DEFUN |GUESS;termAsEXPRR| (|f| |xx| |partition| DX D1X $)
  (PROG (|fl| #1=#:G656 #2=#:G655 #3=#:G664 |part| #4=#:G663 |ll|)
    (RETURN
     (SEQ
      (COND ((NULL |partition|) (SPADCALL |xx| D1X))
            ('T
             (SEQ
              (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
                    . #5=(|GUESS;termAsEXPRR|))
              (LETT |fl|
                    (PROGN
                     (LETT #4# NIL . #5#)
                     (SEQ (LETT |part| NIL . #5#) (LETT #3# |ll| . #5#) G190
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
                                                        (- (|SPADfirst| |part|)
                                                           1)
                                                        . #5#)
                                                (|check_subtype| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                              DX)
                                    (PROG1
                                        (LETT #1#
                                              (SPADCALL |part| (QREFELT $ 280))
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
              (EXIT (SPADCALL (ELT $ 105) |fl| (QREFELT $ 282)))))))))) 

(DEFUN |GUESS;termAsU32VectorDiff| (|f| |partition| |prime| |degreeLoss| $)
  (PROG (|fl| #1=#:G668 #2=#:G667 #3=#:G677 |part| #4=#:G676 |ll| |d| #5=#:G666
         #6=#:G675 |i| #7=#:G674)
    (RETURN
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
               (PROG1 (LETT #5# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1) . #8#)
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
                                                   (- (|SPADfirst| |part|) 1)
                                                   . #8#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         |prime| (QREFELT $ 286))
                               (PROG1
                                   (LETT #1# (SPADCALL |part| (QREFELT $ 280))
                                         . #8#)
                                 (|check_subtype| (> #1# 0)
                                                  '(|PositiveInteger|) #1#))
                               |d| |prime| (QREFELT $ 287))
                              #4#)
                             . #8#)))
                     (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                     (EXIT (NREVERSE #4#))))
               . #8#)
         (EXIT
          (SPADCALL
           (CONS #'|GUESS;termAsU32VectorDiff!0| (VECTOR $ |prime| |d|)) |fl|
           (QREFELT $ 291)))))))))) 

(DEFUN |GUESS;termAsU32VectorDiff!0| (|f1| |f2| $$)
  (PROG (|d| |prime| $)
    (LETT |d| (QREFELT $$ 2) . #1=(|GUESS;termAsU32VectorDiff|))
    (LETT |prime| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 288)))))) 

(DEFUN |GUESS;termAsU32VectorShift| (|f| |partition| |prime| |degreeLoss| $)
  (PROG (#1=#:G694 |e| |i| |r| |fl| #2=#:G680 #3=#:G693 |j| #4=#:G692 #5=#:G691
         |part| #6=#:G690 |ll| |d| #7=#:G679 #8=#:G689 #9=#:G688)
    (RETURN
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
               (PROG1 (LETT #7# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1) . #10#)
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
                                 (LETT |j| (- (|SPADfirst| |part|) 1) . #10#)
                                 (LETT #3# (+ (- (|SPADfirst| |part|) 1) |d|)
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
                                                                     (QREFELT $
                                                                              280))
                                                           . #10#)
                                                   (|check_subtype| (> #2# 0)
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
                (SEQ (LETT |e| NIL . #10#) (LETT #1# (CDR |fl|) . #10#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #10#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT_U32 |r| |i|
                                   (QSMULMOD32 (ELT_U32 |r| |i|)
                                               (ELT_U32 |e| |i|) |prime|))))
                     (LETT #1# (CDR #1#) . #10#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
         (EXIT |r|)))))))) 

(DEFUN |GUESS;termAsUFPSF| (|f| |partition| DS D1 $)
  (PROG (|fl| #1=#:G703 #2=#:G702 #3=#:G711 |part| #4=#:G710 |ll|)
    (RETURN
     (SEQ
      (COND ((NULL |partition|) D1)
            ('T
             (SEQ
              (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
                    . #5=(|GUESS;termAsUFPSF|))
              (LETT |fl|
                    (PROGN
                     (LETT #4# NIL . #5#)
                     (SEQ (LETT |part| NIL . #5#) (LETT #3# |ll| . #5#) G190
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
                                                        (- (|SPADfirst| |part|)
                                                           1)
                                                        . #5#)
                                                (|check_subtype| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                              DS)
                                    (PROG1
                                        (LETT #1#
                                              (SPADCALL |part| (QREFELT $ 280))
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
              (EXIT (SPADCALL (ELT $ 295) |fl| (QREFELT $ 298)))))))))) 

(DEFUN |GUESS;termAsUFPSF2| (|f| |partition| DS D1 $)
  (PROG (|fl| #1=#:G715 #2=#:G723 |part| #3=#:G722 |ll|)
    (RETURN
     (SEQ
      (COND ((NULL |partition|) D1)
            ('T
             (SEQ
              (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
                    . #4=(|GUESS;termAsUFPSF2|))
              (LETT |fl|
                    (PROGN
                     (LETT #3# NIL . #4#)
                     (SEQ (LETT |part| NIL . #4#) (LETT #2# |ll| . #4#) G190
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
                                                        (- (|SPADfirst| |part|)
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
              (EXIT (SPADCALL (ELT $ 303) |fl| (QREFELT $ 298)))))))))) 

(DEFUN |GUESS;termAsUFPSF2!0| (|z1| $$)
  (PROG (|part| $)
    (LETT |part| (QREFELT $$ 1) . #1=(|GUESS;termAsUFPSF2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G713)
        (RETURN
         (SPADCALL |z1|
                   (PROG1 (LETT #2# (SPADCALL |part| (QREFELT $ 280)) NIL)
                     (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                   (QREFELT $ 299)))))))) 

(DEFUN |GUESS;termAsUFPSSUPF2| (|f| |partition| DSF D1F $)
  (PROG (|fl| #1=#:G726 #2=#:G734 |part| #3=#:G733 |ll|)
    (RETURN
     (SEQ
      (COND ((NULL |partition|) D1F)
            ('T
             (SEQ
              (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
                    . #4=(|GUESS;termAsUFPSSUPF2|))
              (LETT |fl|
                    (PROGN
                     (LETT #3# NIL . #4#)
                     (SEQ (LETT |part| NIL . #4#) (LETT #2# |ll| . #4#) G190
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
                                                        (- (|SPADfirst| |part|)
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
              (EXIT (SPADCALL (ELT $ 310) |fl| (QREFELT $ 313)))))))))) 

(DEFUN |GUESS;termAsUFPSSUPF2!0| (|z1| $$)
  (PROG (|part| $)
    (LETT |part| (QREFELT $$ 1) . #1=(|GUESS;termAsUFPSSUPF2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G724)
        (RETURN
         (SPADCALL |z1|
                   (PROG1 (LETT #2# (SPADCALL |part| (QREFELT $ 280)) NIL)
                     (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                   (QREFELT $ 305)))))))) 

(DEFUN |GUESS;ADEguessStream| (|f| |partitions| DS D1 $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|GUESS;ADEguessStream!0| (VECTOR $ D1 DS |f|))
               |partitions| (QREFELT $ 317))))) 

(DEFUN |GUESS;ADEguessStream!0| (|z1| $$)
  (PROG (|f| DS D1 $)
    (LETT |f| (QREFELT $$ 3) . #1=(|GUESS;ADEguessStream|))
    (LETT DS (QREFELT $$ 2) . #1#)
    (LETT D1 (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;termAsUFPSF| |f| |z1| DS D1 $))))) 

(DEFUN |GUESS;ADEguessStream2| (|f| |partitions| DS D1 $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|GUESS;ADEguessStream2!0| (VECTOR $ D1 DS |f|))
               |partitions| (QREFELT $ 317))))) 

(DEFUN |GUESS;ADEguessStream2!0| (|z1| $$)
  (PROG (|f| DS D1 $)
    (LETT |f| (QREFELT $$ 3) . #1=(|GUESS;ADEguessStream2|))
    (LETT DS (QREFELT $$ 2) . #1#)
    (LETT D1 (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;termAsUFPSF2| |f| |z1| DS D1 $))))) 

(DEFUN |GUESS;guessModGenCached|
       (|cache| |np| |sigma| |addOne| |maxD| |prodl| |terml| |prime| $)
  (PROG (|i| #1=#:G756 |r| |res| #2=#:G754 #3=#:G755 |res1| #4=#:G745 |nt|
         #5=#:G752 #6=#:G753 |pp|)
    (RETURN
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
                      (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
                    0)
                   . #7#)
             (SETELT_U32 |res1| 0 1) (SPADCALL |res| 1 |res1| (QREFELT $ 329))
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
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #7#))
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
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))))))
      (EXIT |res|))))) 

(DEFUN |GUESS;DEPguessModGenCached|
       (|fl| |addOne| |maxD| |prodl| |terml| |prime| $)
  (PROG (|i| #1=#:G761 |f| |cache| |np| |sigma|)
    (RETURN
     (SEQ
      (COND
       ((< (LENGTH |fl|) (+ |maxD| 1))
        (|error| "DEPguessModGenCached: #fl < maxD + 1"))
       ('T
        (SEQ (LETT |f| (|SPADfirst| |fl|) . #2=(|GUESS;DEPguessModGenCached|))
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
               |prodl| |terml| |prime| $))))))))) 

(DEFUN |GUESS;ADEguessModGenCached|
       (|fl| |addOne| |maxD| |prodl| |terml| |prime| $)
  (PROG (|i| |cache| |np| |sigma| |f|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 330))
        (|error| "ADEguessModGenCached: #fl ~= 1"))
       ('T
        (SEQ (LETT |f| (|SPADfirst| |fl|) . #1=(|GUESS;ADEguessModGenCached|))
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
               |prodl| |terml| |prime| $))))))))) 

(DEFUN |GUESS;ADEtestGenCached| (|f| |addOne| |maxD| |prodl| |terml| DSF D1F $)
  (PROG (|i| #1=#:G778 |r| |res| #2=#:G776 #3=#:G777 |nt| #4=#:G774 #5=#:G775
         |pp| |cache| |np|)
    (RETURN
     (SEQ (LETT |np| (LENGTH |prodl|) . #6=(|GUESS;ADEtestGenCached|))
          (LETT |cache| (MAKEARR1 (+ (+ |maxD| 1) |np|) (|spadConstant| $ 322))
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
               (LETT |i| (+ |maxD| 1) . #6#) (LETT #4# (+ |maxD| |np|) . #6#)
               G190
               (COND
                ((OR (> |i| #4#) (ATOM #5#)
                     (PROGN (LETT |pp| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |cache| |i|
                            (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                      (QAREF1 |cache|
                                              (SPADCALL |pp| (QREFELT $ 280)))
                                      (QREFELT $ 332)))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (LETT |nt| (LENGTH |terml|) . #6#)
          (COND
           (|addOne|
            (SEQ
             (LETT |res| (MAKEARR1 (+ |nt| 1) (|spadConstant| $ 322)) . #6#)
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
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #6#))
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
                             (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT |res|))))) 

(DEFUN |GUESS;multiplyExponents| (|f| |n| $)
  (PROG (|i| |deg| |f0| |nn|)
    (RETURN
     (SEQ (LETT |nn| (QV_LEN_U32 |f|) . #1=(|GUESS;multiplyExponents|))
          (LETT |f0| (GETREFV_U32 |nn| 0) . #1#) (LETT |deg| (- |nn| 1) . #1#)
          (SEQ (LETT |i| 0 . #1#) G190
               (COND
                ((OR (|greater_SI| |i| |deg|)
                     (NULL (SPADCALL (* |n| |i|) |deg| (QREFELT $ 338))))
                 (GO G191)))
               (SEQ (EXIT (SETELT_U32 |f0| (* |n| |i|) (ELT_U32 |f| |i|))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |f0|))))) 

(DEFUN |GUESS;FEguessModGenCached|
       (|fl| |addOne| |maxD| |prodl| |terml| |prime| $)
  (PROG (|i| |cache| |np| |sigma| |f|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 330))
        (|error| "FEguessModGenCached: #fl ~= 1"))
       ('T
        (SEQ (LETT |f| (|SPADfirst| |fl|) . #1=(|GUESS;FEguessModGenCached|))
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
               |prodl| |terml| |prime| $))))))))) 

(DEFUN |GUESS;optimiseFactor| (|partition| |partitions| $)
  (PROG (#1=#:G803 |j| |r| #2=#:G804 |p| |i| |n|)
    (RETURN
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
                  (LETT |r| (SPADCALL |partition| |p| (QREFELT $ 339)) . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |r| 0)
                     (SEQ
                      (LETT |j|
                            (SPADCALL (QCDR |r|) |partitions| (QREFELT $ 341))
                            . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |j| 0 (QREFELT $ 342))
                         (PROGN
                          (LETT #1# (CONS 0 (LIST |i| |j|)) . #3#)
                          (GO #1#))))))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #3#))
                       . #3#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;optimiseProducts1| (|p| |prods0| |parts0| $)
  (PROG (|lp0| |r|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |r|
             (|GUESS;optimiseFactor| |p| (SPADCALL |parts0| (QREFELT $ 344)) $)
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
         (SEQ (LETT |lp0| (LENGTH (SPADCALL |parts0| (QREFELT $ 344))) . #1#)
              (SPADCALL |prods0|
                        (CONS
                         (LIST (- |lp0| (|SPADfirst| (QCDR |r|)))
                               (- |lp0| (SPADCALL (QCDR |r|) (QREFELT $ 280))))
                         (SPADCALL |prods0| (QREFELT $ 348)))
                        (QREFELT $ 349))
              (EXIT
               (SPADCALL |parts0|
                         (CONS |p| (SPADCALL |parts0| (QREFELT $ 344)))
                         (QREFELT $ 350))))))))))) 

(DEFUN |GUESS;optimiseProducts| (|partitions| $)
  (PROG (#1=#:G820 |terms0| #2=#:G824 |p| |parts0| |i| #3=#:G823 |prods0|
         |maxD0| #4=#:G822 |addOne0|)
    (RETURN
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
                (SEQ (LETT |i| |maxD0| . #5#) G190 (COND ((< |i| 1) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #3#
                             (CONS (SPADCALL (LIST |i|) (QREFELT $ 346)) #3#)
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
                 (LETT |terms0| (CONS (- (|SPADfirst| |p|) 1) |terms0|) . #5#))
                ('T
                 (SEQ
                  (|GUESS;optimiseProducts1| (SPADCALL |p| (QREFELT $ 346))
                   |prods0| |parts0| $)
                  (EXIT
                   (LETT |terms0|
                         (CONS
                          (- (LENGTH (SPADCALL |parts0| (QREFELT $ 344))) 1)
                          |terms0|)
                         . #5#)))))))
             (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (VECTOR |addOne0|
                 (PROG1 (LETT #1# (- |maxD0| 1) . #5#)
                   (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                 (NREVERSE (SPADCALL |prods0| (QREFELT $ 348)))
                 (NREVERSE |terms0|)))))
      #4# (EXIT #4#))))) 

(DEFUN |GUESS;ADEguessModOptimisedGen| (|partitions| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (|GUESS;optimiseProducts| |partitions| $)
            |GUESS;ADEguessModOptimisedGen|)
      (EXIT (CONS #'|GUESS;ADEguessModOptimisedGen!0| (VECTOR $ |r|))))))) 

(DEFUN |GUESS;ADEguessModOptimisedGen!0| (|fl| |prime| |q| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|GUESS;ADEguessModOptimisedGen|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
       (QVELT |r| 2) (QVELT |r| 3) |prime| $))))) 

(DEFUN |GUESS;FEguessModOptimisedGen| (|partitions| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (|GUESS;optimiseProducts| |partitions| $)
            |GUESS;FEguessModOptimisedGen|)
      (EXIT (CONS #'|GUESS;FEguessModOptimisedGen!0| (VECTOR $ |r|))))))) 

(DEFUN |GUESS;FEguessModOptimisedGen!0| (|fl| |prime| |q| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|GUESS;FEguessModOptimisedGen|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;FEguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
       (QVELT |r| 2) (QVELT |r| 3) |prime| $))))) 

(DEFUN |GUESS;DEPguessModOptimisedGen| (|partitions| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (|GUESS;optimiseProducts| |partitions| $)
            |GUESS;DEPguessModOptimisedGen|)
      (EXIT (CONS #'|GUESS;DEPguessModOptimisedGen!0| (VECTOR $ |r|))))))) 

(DEFUN |GUESS;DEPguessModOptimisedGen!0| (|fl| |prime| |q| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|GUESS;DEPguessModOptimisedGen|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;DEPguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
       (QVELT |r| 2) (QVELT |r| 3) |prime| $))))) 

(DEFUN |GUESS;ADEguessModGen2| (|partitions| |d| $)
  (PROG ()
    (RETURN
     (SEQ (CONS #'|GUESS;ADEguessModGen2!0| (VECTOR |d| |partitions| $)))))) 

(DEFUN |GUESS;ADEguessModGen2!0| (|fl| |prime| |q| $$)
  (PROG ($ |partitions| |d|)
    (LETT $ (QREFELT $$ 2) . #1=(|GUESS;ADEguessModGen2|))
    (LETT |partitions| (QREFELT $$ 1) . #1#)
    (LETT |d| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G848 |p| #3=#:G847 |f|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |fl| (QREFELT $ 359)) (|spadConstant| $ 360)
                      (QREFELT $ 330))
            (|error| "ADEguessModGen2, lambda: #fl ~= 1"))
           ('T
            (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 361)) NIL)
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #3# NIL NIL)
                    (SEQ (LETT |p| NIL NIL) (LETT #2# |partitions| NIL) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) NIL) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS
                                  (|GUESS;termAsU32VectorShift| |f| |p| |prime|
                                   |d| $)
                                  #3#)
                                 NIL)))
                         (LETT #2# (CDR #2#) NIL) (GO G190) G191
                         (EXIT (NREVERSE #3#))))
                   (QREFELT $ 362))))))))))))) 

(DEFUN |GUESS;ADEtestOptimisedGen| (|partitions| DSF D1F $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (|GUESS;optimiseProducts| |partitions| $)
            |GUESS;ADEtestOptimisedGen|)
      (EXIT (CONS #'|GUESS;ADEtestOptimisedGen!0| (VECTOR $ D1F DSF |r|))))))) 

(DEFUN |GUESS;ADEtestOptimisedGen!0| (|f| $$)
  (PROG (|r| DSF D1F $)
    (LETT |r| (QREFELT $$ 3) . #1=(|GUESS;ADEtestOptimisedGen|))
    (LETT DSF (QREFELT $$ 2) . #1#)
    (LETT D1F (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEtestGenCached| |f| (QVELT |r| 0) (QVELT |r| 1) (QVELT |r| 2)
       (QVELT |r| 3) DSF D1F $))))) 

(DEFUN |GUESS;ADEtestGen2| (|partitions| DSF D1F $)
  (PROG ()
    (RETURN
     (SEQ (CONS #'|GUESS;ADEtestGen2!0| (VECTOR $ D1F DSF |partitions|)))))) 

(DEFUN |GUESS;ADEtestGen2!0| (|f| $$)
  (PROG (|partitions| DSF D1F $)
    (LETT |partitions| (QREFELT $$ 3) . #1=(|GUESS;ADEtestGen2|))
    (LETT DSF (QREFELT $$ 2) . #1#)
    (LETT D1F (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G861 |p| #3=#:G860)
        (RETURN
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #3# NIL NIL)
            (SEQ (LETT |p| NIL NIL) (LETT #2# |partitions| NIL) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) NIL) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS (|GUESS;termAsUFPSSUPF2| |f| |p| DSF D1F $) #3#)
                         NIL)))
                 (LETT #2# (CDR #2#) NIL) (GO G190) G191
                 (EXIT (NREVERSE #3#))))
           (QREFELT $ 363))))))))) 

(DEFUN |GUESS;ADEEXPRRStream| (|f| |xx| |partitions| DX D1X $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|GUESS;ADEEXPRRStream!0| (VECTOR $ D1X DX |xx| |f|))
               |partitions| (QREFELT $ 367))))) 

(DEFUN |GUESS;ADEEXPRRStream!0| (|z1| $$)
  (PROG (|f| |xx| DX D1X $)
    (LETT |f| (QREFELT $$ 4) . #1=(|GUESS;ADEEXPRRStream|))
    (LETT |xx| (QREFELT $$ 3) . #1#)
    (LETT DX (QREFELT $$ 2) . #1#)
    (LETT D1X (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;termAsEXPRR| |f| |xx| |z1| DX D1X $))))) 

(DEFUN |GUESS;ADEdegreeStream| (|partitions| $)
  (PROG ()
    (RETURN
     (SPADCALL 0 (CONS #'|GUESS;ADEdegreeStream!0| $) |partitions|
               (QREFELT $ 373))))) 

(DEFUN |GUESS;ADEdegreeStream!0| (|z1| |z2| $)
  (PROG (#1=#:G869)
    (RETURN
     (SPADCALL
      (COND ((SPADCALL |z1| (QREFELT $ 368)) (|spadConstant| $ 275))
            ('T
             (PROG1
                 (LETT #1#
                       (SPADCALL (SPADCALL |z1| (QREFELT $ 352))
                                 (|spadConstant| $ 360) (QREFELT $ 219))
                       NIL)
               (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))
      |z2| (QREFELT $ 369))))) 

(DEFUN |GUESS;diffDX| (|expr| |x| |n| $)
  (SPADCALL |expr| |x| |n| (QREFELT $ 374))) 

(DEFUN |GUESS;diffDS| (|s| |n| $) (SPADCALL |s| |n| (QREFELT $ 375))) 

(DEFUN |GUESS;diffDSF| (|s| |n| $)
  (COND
   ((|HasSignature|
     (|SparseMultivariatePolynomial| (QREFELT $ 6) (|NonNegativeInteger|))
     (LIST '*
           (LIST
            (LIST '|SparseMultivariatePolynomial| (|devaluate| (QREFELT $ 6))
                  '(|NonNegativeInteger|))
            '(|NonNegativeInteger|)
            (LIST '|SparseMultivariatePolynomial| (|devaluate| (QREFELT $ 6))
                  '(|NonNegativeInteger|)))))
    (SPADCALL |s| |n| (QREFELT $ 376))))) 

(DEFUN |GUESS;diffAX| (|l| |x| |f| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 39)) |l| (QREFELT $ 128)) |f|
            (QREFELT $ 105))) 

(DEFUN |GUESS;diffA| (|k| |l| |f| $) (SPADCALL |k| |l| |f| (QREFELT $ 378))) 

(DEFUN |GUESS;diffAF| (|k| |l| |f| $) (SPADCALL |k| |l| |f| (QREFELT $ 380))) 

(DEFUN |GUESS;diffC| (|total| $) (SPADCALL |total| (QREFELT $ 381))) 

(DEFUN |GUESS;diff1X| (|x| $) (|spadConstant| $ 94)) 

(DEFUN |GUESS;diffHP;LR;74| (|options| $)
  (PROG (|degrees| |partitions| |dk|)
    (RETURN
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
        ('T (|error| "Guess: guessADE supports only displayAsGF")))))))) 

(DEFUN |GUESS;diffHP;LR;74!3| (|z1| |z2| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;74|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
       (CONS (|function| |GUESS;diffDX|) $)
       (CONS (|function| |GUESS;diff1X|) $) $))))) 

(DEFUN |GUESS;diffHP;LR;74!2| (|l| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;74|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G896 |i| #3=#:G895)
        (RETURN
         (SEQ
          (|GUESS;ADEtestOptimisedGen|
           (PROGN
            (LETT #3# NIL NIL)
            (SEQ (LETT |i| NIL NIL) (LETT #2# |l| NIL) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS (SPADCALL |partitions| |i| (QREFELT $ 387)) #3#)
                         NIL)))
                 (LETT #2# (CDR #2#) NIL) (GO G190) G191
                 (EXIT (NREVERSE #3#))))
           (CONS (|function| |GUESS;diffDSF|) $) (|spadConstant| $ 327)
           $)))))))) 

(DEFUN |GUESS;diffHP;LR;74!1| (|o| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;74|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEguessModOptimisedGen|
       (SPADCALL
        (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384)) (QREFELT $ 385))
        (QREFELT $ 386))
       $))))) 

(DEFUN |GUESS;diffHP;LR;74!0| (|z1| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;diffHP;LR;74|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEguessStream| |z1| |partitions|
       (CONS (|function| |GUESS;diffDS|) $) (|spadConstant| $ 326) $))))) 

(DEFUN |GUESS;monomialAsEXPRR| (|fl0| |partition| $)
  (PROG (|fl| #1=#:G932 #2=#:G931 #3=#:G940 |part| #4=#:G939 |ll|)
    (RETURN
     (SEQ
      (COND ((NULL |partition|) (|spadConstant| $ 94))
            ('T
             (SEQ
              (LETT |ll| (SPADCALL |partition| (QREFELT $ 279))
                    . #5=(|GUESS;monomialAsEXPRR|))
              (LETT |fl|
                    (PROGN
                     (LETT #4# NIL . #5#)
                     (SEQ (LETT |part| NIL . #5#) (LETT #3# |ll| . #5#) G190
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
                                                        (|SPADfirst| |part|)
                                                        . #5#)
                                                (|check_subtype| (> #2# 0)
                                                                 '(|PositiveInteger|)
                                                                 #2#))
                                              (QREFELT $ 400))
                                    (PROG1
                                        (LETT #1#
                                              (SPADCALL |part| (QREFELT $ 280))
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
              (EXIT (SPADCALL (ELT $ 105) |fl| (QREFELT $ 282)))))))))) 

(DEFUN |GUESS;DEPEXPRRStream| (|fl| |partitions| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|GUESS;DEPEXPRRStream!0| (VECTOR $ |fl|)) |partitions|
               (QREFELT $ 367))))) 

(DEFUN |GUESS;DEPEXPRRStream!0| (|z1| $$)
  (PROG (|fl| $)
    (LETT |fl| (QREFELT $$ 1) . #1=(|GUESS;DEPEXPRRStream|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;monomialAsEXPRR| |fl| |z1| $))))) 

(DEFUN |GUESS;get_fnames| (|n| |options| $)
  (PROG (#1=#:G954 |sym| #2=#:G953 |syms| #3=#:G952 |i| #4=#:G951 |snums| |q|
         #5=#:G950 |n1|)
    (RETURN
     (SEQ
      (LETT |syms| (SPADCALL |options| (QREFELT $ 401))
            . #6=(|GUESS;get_fnames|))
      (LETT |n1| (LENGTH |syms|) . #6#)
      (COND
       ((SPADCALL |n1| 0 (QREFELT $ 402))
        (COND
         ((SPADCALL |n1| |n| (QREFELT $ 403))
          (EXIT (|error| "numbers of sequences and names are different"))))))
      (COND
       ((EQL |n1| 0)
        (SEQ
         (LETT |snums|
               (PROGN
                (LETT #5# NIL . #6#)
                (SEQ (LETT |q| 1 . #6#) G190
                     (COND ((|greater_SI| |q| |n|) (GO G191)))
                     (SEQ (EXIT (LETT #5# (CONS (STRINGIMAGE |q|) #5#) . #6#)))
                     (LETT |q| (|inc_SI| |q|) . #6#) (GO G190) G191
                     (EXIT (NREVERSE #5#))))
               . #6#)
         (EXIT
          (LETT |syms|
                (PROGN
                 (LETT #4# NIL . #6#)
                 (SEQ (LETT |i| NIL . #6#) (LETT #3# |snums| . #6#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #6#) NIL))
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
               (LETT #2# (CONS (SPADCALL |sym| (QREFELT $ 39)) #2#) . #6#)))
             (LETT #1# (CDR #1#) . #6#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |GUESS;algDepHP;LLR;78| (|lists| |options| $)
  (PROG (|fakeDSF| |fakeDS| |fl| |degrees| |partitions| |dk|)
    (RETURN
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
          (LETT |fl| (|GUESS;get_fnames| (LENGTH |lists|) |options| $) . #1#)
          (LETT |fakeDS| (CONS #'|GUESS;algDepHP;LLR;78!0| (VECTOR $ |lists|))
                . #1#)
          (LETT |fakeDSF| (CONS #'|GUESS;algDepHP;LLR;78!1| (VECTOR $ |lists|))
                . #1#)
          (EXIT
           (VECTOR
            (SPADCALL (CONS #'|GUESS;algDepHP;LLR;78!2| $) |partitions|
                      (QREFELT $ 409))
            (CONS #'|GUESS;algDepHP;LLR;78!3| (VECTOR $ |fakeDS| |partitions|))
            (CONS #'|GUESS;algDepHP;LLR;78!4| (VECTOR $ |partitions|))
            (CONS #'|GUESS;algDepHP;LLR;78!5|
                  (VECTOR |fakeDSF| $ |partitions|))
            (CONS #'|GUESS;algDepHP;LLR;78!6| (VECTOR $ |partitions| |fl|))
            '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
            (CONS (|function| |GUESS;diffAF|) $)
            (CONS (|function| |GUESS;diffAX|) $)
            (CONS (|function| |GUESS;diffC|) $))))))))))) 

(DEFUN |GUESS;algDepHP;LLR;78!6| (|z1| |z2| $$)
  (PROG (|fl| |partitions| $)
    (LETT |fl| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;78|))
    (LETT |partitions| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;DEPEXPRRStream| |fl| |partitions| $))))) 

(DEFUN |GUESS;algDepHP;LLR;78!5| (|l| $$)
  (PROG (|partitions| $ |fakeDSF|)
    (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;78|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |fakeDSF| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G973 |i| #3=#:G972)
        (RETURN
         (SEQ
          (|GUESS;ADEtestOptimisedGen|
           (PROGN
            (LETT #3# NIL NIL)
            (SEQ (LETT |i| NIL NIL) (LETT #2# |l| NIL) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS (SPADCALL |partitions| |i| (QREFELT $ 387)) #3#)
                         NIL)))
                 (LETT #2# (CDR #2#) NIL) (GO G190) G191
                 (EXIT (NREVERSE #3#))))
           |fakeDSF| (|spadConstant| $ 327) $)))))))) 

(DEFUN |GUESS;algDepHP;LLR;78!4| (|o| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;78|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;DEPguessModOptimisedGen|
       (SPADCALL
        (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384)) (QREFELT $ 385))
        (QREFELT $ 386))
       $))))) 

(DEFUN |GUESS;algDepHP;LLR;78!3| (|z1| $$)
  (PROG (|partitions| |fakeDS| $)
    (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;algDepHP;LLR;78|))
    (LETT |fakeDS| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEguessStream| |z1| |partitions| |fakeDS| (|spadConstant| $ 326)
       $))))) 

(DEFUN |GUESS;algDepHP;LLR;78!2| (|c| $) (|spadConstant| $ 275)) 

(DEFUN |GUESS;algDepHP;LLR;78!1| (|w1| |w2| $$)
  (PROG (|lists| $)
    (LETT |lists| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;78|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;list2UFPSSUPF|
       (SPADCALL |lists| (SPADCALL |w2| (|spadConstant| $ 360) (QREFELT $ 259))
                 (QREFELT $ 407))
       $))))) 

(DEFUN |GUESS;algDepHP;LLR;78!0| (|w1| |w2| $$)
  (PROG (|lists| $)
    (LETT |lists| (QREFELT $$ 1) . #1=(|GUESS;algDepHP;LLR;78|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;list2UFPSF|
       (SPADCALL |lists| (SPADCALL |w2| (|spadConstant| $ 360) (QREFELT $ 259))
                 (QREFELT $ 407))
       $))))) 

(DEFUN |GUESS;substDX| (|expr| |x| |n| $)
  (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 39))
            (SPADCALL (SPADCALL |x| (QREFELT $ 39)) (+ |n| 1) (QREFELT $ 128))
            (QREFELT $ 46))) 

(DEFUN |GUESS;substDS| (|s| |n| $)
  (PROG (#1=#:G989)
    (RETURN
     (SPADCALL |s|
               (PROG1 (LETT #1# (+ |n| 1) |GUESS;substDS|)
                 (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
               (QREFELT $ 411))))) 

(DEFUN |GUESS;substDSF| (|s| |n| $)
  (PROG (#1=#:G991)
    (RETURN
     (SPADCALL |s|
               (PROG1 (LETT #1# (+ |n| 1) |GUESS;substDSF|)
                 (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
               (QREFELT $ 412))))) 

(DEFUN |GUESS;substHP;LR;82| (|options| $)
  (PROG (|partitions| |dk|)
    (RETURN
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
            (CONS #'|GUESS;substHP;LR;82!4| (VECTOR $ |partitions|)) '|diffHP|
            '|dummy| (CONS (|function| |GUESS;diffA|) $)
            (CONS (|function| |GUESS;diffAF|) $)
            (CONS (|function| |GUESS;diffAX|) $)
            (CONS (|function| |GUESS;diffC|) $)))))
        ('T (|error| "Guess: guessSubst supports only displayAsGF")))))))) 

(DEFUN |GUESS;substHP;LR;82!4| (|z1| |z2| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;82|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
       (CONS (|function| |GUESS;substDX|) $)
       (CONS (|function| |GUESS;diff1X|) $) $))))) 

(DEFUN |GUESS;substHP;LR;82!3| (|l| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;82|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G1009 |i| #3=#:G1008)
        (RETURN
         (SEQ
          (|GUESS;ADEtestOptimisedGen|
           (PROGN
            (LETT #3# NIL NIL)
            (SEQ (LETT |i| NIL NIL) (LETT #2# |l| NIL) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS (SPADCALL |partitions| |i| (QREFELT $ 387)) #3#)
                         NIL)))
                 (LETT #2# (CDR #2#) NIL) (GO G190) G191
                 (EXIT (NREVERSE #3#))))
           (CONS (|function| |GUESS;substDSF|) $) (|spadConstant| $ 327)
           $)))))))) 

(DEFUN |GUESS;substHP;LR;82!2| (|o| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;82|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;FEguessModOptimisedGen|
       (SPADCALL
        (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384)) (QREFELT $ 385))
        (QREFELT $ 386))
       $))))) 

(DEFUN |GUESS;substHP;LR;82!1| (|z1| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;substHP;LR;82|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEguessStream| |z1| |partitions|
       (CONS (|function| |GUESS;substDS|) $) (|spadConstant| $ 326) $))))) 

(DEFUN |GUESS;substHP;LR;82!0| (|c| $) (|spadConstant| $ 275)) 

(DEFUN |GUESS;qDiffDX| (|q| |expr| |x| |n| $)
  (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 39))
            (SPADCALL
             (SPADCALL (SPADCALL |q| (QREFELT $ 39)) |n| (QREFELT $ 128))
             (SPADCALL |x| (QREFELT $ 39)) (QREFELT $ 105))
            (QREFELT $ 46))) 

(DEFUN |GUESS;qDiffDS| (|q| |s| |n| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|GUESS;qDiffDS!0| (VECTOR |n| $ |q|)) |s|
               (QREFELT $ 416))))) 

(DEFUN |GUESS;qDiffDS!0| (|z1| $$)
  (PROG (|q| $ |n|)
    (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;qDiffDS|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G1030)
        (RETURN
         (SPADCALL (SPADCALL |q| (QREFELT $ 242))
                   (PROG1 (LETT #2# (SPADCALL |n| |z1| (QREFELT $ 414)) NIL)
                     (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                   (QREFELT $ 299)))))))) 

(DEFUN |GUESS;qDiffDSV| (|f| |n| |prime| |q| $)
  (PROG (Q |i| |qn| |r| #1=#:G1034 |d|)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) |f|)
            ('T
             (SEQ (LETT |d| (- (QV_LEN_U32 |f|) 1) . #2=(|GUESS;qDiffDSV|))
                  (LETT |r|
                        (GETREFV_U32
                         (+
                          (PROG1 (LETT #1# |d| . #2#)
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
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
                               (SEQ (LETT Q (QSMULMOD32 |qn| Q |prime|) . #2#)
                                    (EXIT
                                     (SETELT_U32 |r| |i|
                                                 (QSMULMOD32 (ELT_U32 |f| |i|)
                                                             Q |prime|))))
                               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                               (EXIT NIL))))))
                  (EXIT |r|)))))))) 

(DEFUN |GUESS;qDiffDSF| (|q| |s| |n| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|GUESS;qDiffDSF!0| (VECTOR |n| $ |q|)) |s|
               (QREFELT $ 420))))) 

(DEFUN |GUESS;qDiffDSF!0| (|z1| $$)
  (PROG (|q| $ |n|)
    (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;qDiffDSF|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G1041)
        (RETURN
         (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 242)) (QREFELT $ 418))
                   (PROG1 (LETT #2# (SPADCALL |n| |z1| (QREFELT $ 414)) NIL)
                     (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                   (QREFELT $ 305)))))))) 

(DEFUN |GUESS;termAsU32VectorqDiff| (|f| |partition| |prime| |q| |dl| $)
  (PROG (|fl| #1=#:G1047 #2=#:G1046 #3=#:G1057 |part| #4=#:G1056 |ll| |d|
         #5=#:G1045 #6=#:G1055 |i| #7=#:G1054)
    (RETURN
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
                                    (LETT #2# (- (|SPADfirst| |part|) 1) . #8#)
                                  (|check_subtype| (>= #2# 0)
                                                   '(|NonNegativeInteger|)
                                                   #2#))
                                |prime| |q| $)
                               (PROG1
                                   (LETT #1# (SPADCALL |part| (QREFELT $ 280))
                                         . #8#)
                                 (|check_subtype| (> #1# 0)
                                                  '(|PositiveInteger|) #1#))
                               |d| |prime| (QREFELT $ 287))
                              #4#)
                             . #8#)))
                     (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                     (EXIT (NREVERSE #4#))))
               . #8#)
         (EXIT
          (SPADCALL
           (CONS #'|GUESS;termAsU32VectorqDiff!0| (VECTOR $ |prime| |d|)) |fl|
           (QREFELT $ 291)))))))))) 

(DEFUN |GUESS;termAsU32VectorqDiff!0| (|f1| |f2| $$)
  (PROG (|d| |prime| $)
    (LETT |d| (QREFELT $$ 2) . #1=(|GUESS;termAsU32VectorqDiff|))
    (LETT |prime| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 288)))))) 

(DEFUN |GUESS;ADEguessModGenq| (|partitions| |d| $)
  (PROG ()
    (RETURN
     (SEQ (CONS #'|GUESS;ADEguessModGenq!0| (VECTOR |d| |partitions| $)))))) 

(DEFUN |GUESS;ADEguessModGenq!0| (|fl| |prime| |q| $$)
  (PROG ($ |partitions| |d|)
    (LETT $ (QREFELT $$ 2) . #1=(|GUESS;ADEguessModGenq|))
    (LETT |partitions| (QREFELT $$ 1) . #1#)
    (LETT |d| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G1063 |p| #3=#:G1062 |f|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |fl| (QREFELT $ 359)) (|spadConstant| $ 360)
                      (QREFELT $ 330))
            (|error| "ADEguessModGenq, lambda: #fl ~= 1"))
           ('T
            (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 361)) NIL)
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #3# NIL NIL)
                    (SEQ (LETT |p| NIL NIL) (LETT #2# |partitions| NIL) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) NIL) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS
                                  (|GUESS;termAsU32VectorqDiff| |f| |p| |prime|
                                   |q| |d| $)
                                  #3#)
                                 NIL)))
                         (LETT #2# (CDR #2#) NIL) (GO G190) G191
                         (EXIT (NREVERSE #3#))))
                   (QREFELT $ 362))))))))))))) 

(DEFUN |GUESS;diffHP;SM;89| (|q| $)
  (PROG () (RETURN (SEQ (CONS #'|GUESS;diffHP;SM;89!8| (VECTOR |q| $)))))) 

(DEFUN |GUESS;diffHP;SM;89!8| (|l1| $$)
  (PROG ($ |q|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;diffHP;SM;89|))
    (LETT |q| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|partitions|)
        (RETURN
         (SEQ
          (COND
           ((NULL (SPADCALL (SPADCALL |l1| (QREFELT $ 382)) (QREFELT $ 421)))
            (|error|
             "Guess: no support for mixed shifts in differential equations")))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |l1| (QREFELT $ 383)) '|displayAsGF|
                       (QREFELT $ 422))
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |l1| $) NIL)
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;diffHP;SM;89!0| $) |partitions|
                          (QREFELT $ 409))
                (CONS #'|GUESS;diffHP;SM;89!2| (VECTOR |q| $ |partitions|))
                (CONS #'|GUESS;diffHP;SM;89!3| (VECTOR $ |partitions|))
                (CONS #'|GUESS;diffHP;SM;89!5| (VECTOR |q| $ |partitions|))
                (CONS #'|GUESS;diffHP;SM;89!7| (VECTOR |q| $ |partitions|))
                '|qdiffHP| |q| (CONS (|function| |GUESS;diffA|) $)
                (CONS (|function| |GUESS;diffAF|) $)
                (CONS (|function| |GUESS;diffAX|) $)
                (CONS (|function| |GUESS;diffC|) $)))))
            ('T (|error| "Guess: guessADE supports only displayAsGF"))))))))))) 

(DEFUN |GUESS;diffHP;SM;89!7| (|z1| |z2| $$)
  (PROG (|partitions| $ |q|)
    (LETT |partitions| (QREFELT $$ 2) NIL)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |q| (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
          (CONS #'|GUESS;diffHP;SM;89!6| (VECTOR $ |q|))
          (CONS (|function| |GUESS;diff1X|) $) $))))))) 

(DEFUN |GUESS;diffHP;SM;89!6| (|w1| |w2| |w3| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (|GUESS;qDiffDX| |q| |w1| |w2| |w3| $))))) 

(DEFUN |GUESS;diffHP;SM;89!5| (|l| $$)
  (PROG (|partitions| $ |q|)
    (LETT |partitions| (QREFELT $$ 2) NIL)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |q| (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (PROG (#1=#:G1079 |i| #2=#:G1078)
        (RETURN
         (SEQ
          (|GUESS;ADEtestOptimisedGen|
           (PROGN
            (LETT #2# NIL NIL)
            (SEQ (LETT |i| NIL NIL) (LETT #1# |l| NIL) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) NIL) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS (SPADCALL |partitions| |i| (QREFELT $ 387)) #2#)
                         NIL)))
                 (LETT #1# (CDR #1#) NIL) (GO G190) G191
                 (EXIT (NREVERSE #2#))))
           (CONS #'|GUESS;diffHP;SM;89!4| (VECTOR $ |q|))
           (|spadConstant| $ 327) $)))))))) 

(DEFUN |GUESS;diffHP;SM;89!4| (|w1| |w2| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (|GUESS;qDiffDSF| |q| |w1| |w2| $))))) 

(DEFUN |GUESS;diffHP;SM;89!3| (|o| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (|GUESS;ADEguessModGenq|
       (SPADCALL
        (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384)) (QREFELT $ 385))
        (QREFELT $ 386))
       (|spadConstant| $ 275) $))))) 

(DEFUN |GUESS;diffHP;SM;89!2| (|z1| $$)
  (PROG (|partitions| $ |q|)
    (LETT |partitions| (QREFELT $$ 2) NIL)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |q| (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (|GUESS;ADEguessStream| |z1| |partitions|
          (CONS #'|GUESS;diffHP;SM;89!1| (VECTOR $ |q|)) (|spadConstant| $ 326)
          $))))))) 

(DEFUN |GUESS;diffHP;SM;89!1| (|w1| |w2| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (|GUESS;qDiffDS| |q| |w1| |w2| $))))) 

(DEFUN |GUESS;diffHP;SM;89!0| (|c| $) (|spadConstant| $ 275)) 

(DEFUN |GUESS;ShiftSX| (|expr| |x| |n| $)
  (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 39))
            (SPADCALL (SPADCALL |x| (QREFELT $ 39))
                      (SPADCALL |n| (QREFELT $ 45)) (QREFELT $ 111))
            (QREFELT $ 46))) 

(DEFUN |GUESS;ShiftSXGF| (|expr| |x| |n| $)
  (PROG (|l| #1=#:G1106 |i| #2=#:G1105)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) |expr|)
            ('T
             (SEQ
              (LETT |l|
                    (PROGN
                     (LETT #2# NIL . #3=(|GUESS;ShiftSXGF|))
                     (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |expr| |x| |i| (QREFELT $ 374))
                                      (SPADCALL (SPADCALL |i| (QREFELT $ 235))
                                                (QREFELT $ 45))
                                      (QREFELT $ 54))
                                     (SPADCALL |x| (QREFELT $ 39))
                                     (|spadConstant| $ 49) (QREFELT $ 46))
                                    (SPADCALL (SPADCALL |x| (QREFELT $ 39)) |i|
                                              (QREFELT $ 128))
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
                (SPADCALL (SPADCALL |x| (QREFELT $ 39)) |n| (QREFELT $ 128))
                (QREFELT $ 54)))))))))) 

(DEFUN |GUESS;ShiftSS| (|s| |n| $)
  (SPADCALL |s| (SPADCALL (ELT $ 425) |n| (QREFELT $ 428)))) 

(DEFUN |GUESS;ShiftSF| (|s| |n| $)
  (SPADCALL |s| (SPADCALL (ELT $ 429) |n| (QREFELT $ 432)))) 

(DEFUN |GUESS;ShiftAX| (|l| |n| |f| $)
  (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT $ 39)) |l| (QREFELT $ 128)) |f|
            (QREFELT $ 105))) 

(DEFUN |GUESS;ShiftAXGF| (|l| |x| |f| $)
  (PROG (|s| |i| #1=#:G1116)
    (RETURN
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
                                      (SPADCALL |l| |i| (QREFELT $ 434))
                                      (QREFELT $ 45))
                                     (SPADCALL (SPADCALL |x| (QREFELT $ 39))
                                               |i| (QREFELT $ 128))
                                     (QREFELT $ 105))
                                    (SPADCALL |f| |x| |i| (QREFELT $ 374))
                                    (QREFELT $ 105))
                                   #1#)
                                  . #2#)))
                          (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    . #2#)
              (EXIT (SPADCALL (ELT $ 111) |s| (QREFELT $ 282)))))))))) 

(DEFUN |GUESS;ShiftA| (|k| |l| |f| $) (SPADCALL |k| |l| |f| (QREFELT $ 435))) 

(DEFUN |GUESS;ShiftAF| (|k| |l| |f| $) (SPADCALL |k| |l| |f| (QREFELT $ 436))) 

(DEFUN |GUESS;ShiftC| (|total| $) (SPADCALL |total| (QREFELT $ 437))) 

(DEFUN |GUESS;shiftHP;LR;99| (|options| $)
  (PROG (|degrees| |dk| |partitions|)
    (RETURN
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
         (|error| "Guess: no support for the Shift operator with displayAsGF"))
        ('T
         (SEQ (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) . #1#)
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
                       (CONS (|function| |GUESS;ShiftC|) $))))))))))) 

(DEFUN |GUESS;shiftHP;LR;99!3| (|z1| |z2| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;99|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
       (CONS (|function| |GUESS;ShiftSX|) $)
       (CONS (|function| |GUESS;diff1X|) $) $))))) 

(DEFUN |GUESS;shiftHP;LR;99!2| (|l| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) . #1=(|GUESS;shiftHP;LR;99|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G1135 |i| #3=#:G1134)
        (RETURN
         (SEQ
          (|GUESS;ADEtestGen2|
           (PROGN
            (LETT #3# NIL NIL)
            (SEQ (LETT |i| NIL NIL) (LETT #2# |l| NIL) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) NIL) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS (SPADCALL |partitions| |i| (QREFELT $ 387)) #3#)
                         NIL)))
                 (LETT #2# (CDR #2#) NIL) (GO G190) G191
                 (EXIT (NREVERSE #3#))))
           (CONS (|function| |GUESS;ShiftSF|) $)
           (SPADCALL
            (SPADCALL (|spadConstant| $ 327)
                      (SPADCALL (|spadConstant| $ 335) (|spadConstant| $ 108)
                                (QREFELT $ 443))
                      (QREFELT $ 444))
            (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440)) (QREFELT $ 445))
           $)))))))) 

(DEFUN |GUESS;shiftHP;LR;99!1| (|o| $$)
  (PROG (|partitions| $ |degrees|)
    (LETT |partitions| (QREFELT $$ 2) . #1=(|GUESS;shiftHP;LR;99|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |degrees| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|GUESS;ADEguessModGen2|
       (SPADCALL
        (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384)) (QREFELT $ 385))
        (QREFELT $ 386))
       (SPADCALL |degrees| |o| (QREFELT $ 442)) $))))) 

(DEFUN |GUESS;shiftHP;LR;99!0| (|z1| $$)
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
        (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440)) (QREFELT $ 441))
       $))))) 

(DEFUN |GUESS;qShiftAX| (|q| |l| |n| |f| $)
  (SPADCALL
   (SPADCALL (SPADCALL |q| (QREFELT $ 39))
             (SPADCALL |l| (SPADCALL |n| (QREFELT $ 39)) (QREFELT $ 447))
             (QREFELT $ 216))
   |f| (QREFELT $ 105))) 

(DEFUN |GUESS;qShiftA| (|q| |k| |l| |f| $)
  (SPADCALL (SPADCALL |q| (QREFELT $ 448)) |k| |l| |f| (QREFELT $ 449))) 

(DEFUN |GUESS;qShiftAF| (|q| |k| |l| |f| $)
  (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 242)) (QREFELT $ 418)) |k| |l|
            |f| (QREFELT $ 450))) 

(DEFUN |GUESS;qShiftC| (|q| |total| $)
  (SPADCALL (SPADCALL |q| (QREFELT $ 448)) |total| (QREFELT $ 451))) 

(DEFUN |GUESS;qSubstUFPSF| (|q| |s| |maxMD| $)
  (PROG (|i| #1=#:G1160)
    (RETURN
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
                                (SPADCALL (SPADCALL |q| (QREFELT $ 242)) |i|
                                          (QREFELT $ 299))
                                (SPADCALL (|spadConstant| $ 11) 1
                                          (QREFELT $ 438))
                                (QREFELT $ 452))
                               (QREFELT $ 453))
                     #1#)
                    . #2#)))
            (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
            (EXIT (NREVERSE #1#)))))))) 

(DEFUN |GUESS;qSubstEXPRR| (|q| |xx| |s| |maxMD| $)
  (PROG (|i| #1=#:G1163)
    (RETURN
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
                                (SPADCALL |i| (SPADCALL |xx| (QREFELT $ 39))
                                          (QREFELT $ 447))
                                (QREFELT $ 216))
                      |s| (QREFELT $ 105))
                     #1#)
                    . #2#)))
            (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
            (EXIT (NREVERSE #1#)))))))) 

(DEFUN |GUESS;ADEguessStreamMixShift| (|q| |f| |partitions| |maxMD| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (LETT |s|
            (|GUESS;ADEguessStream2| |f| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 326)
                        (SPADCALL (|spadConstant| $ 11) 1 (QREFELT $ 438))
                        (QREFELT $ 439))
              (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440))
              (QREFELT $ 441))
             $)
            |GUESS;ADEguessStreamMixShift|)
      (EXIT
       (SPADCALL |s|
                 (CONS #'|GUESS;ADEguessStreamMixShift!0|
                       (VECTOR $ |maxMD| |q|))
                 (QREFELT $ 456))))))) 

(DEFUN |GUESS;ADEguessStreamMixShift!0| (|z1| $$)
  (PROG (|q| |maxMD| $)
    (LETT |q| (QREFELT $$ 2) . #1=(|GUESS;ADEguessStreamMixShift|))
    (LETT |maxMD| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;qSubstUFPSF| |q| |z1| |maxMD| $))))) 

(DEFUN |GUESS;ADEguessModGen2Mixed| (|partitions| |dl| |maxMD| |o| $)
  (PROG ()
    (RETURN
     (SEQ
      (CONS #'|GUESS;ADEguessModGen2Mixed!0|
            (VECTOR |partitions| |maxMD| |o| |dl| $)))))) 

(DEFUN |GUESS;ADEguessModGen2Mixed!0| (|fl| |prime| |q| $$)
  (PROG ($ |dl| |o| |maxMD| |partitions|)
    (LETT $ (QREFELT $$ 4) . #1=(|GUESS;ADEguessModGen2Mixed|))
    (LETT |dl| (QREFELT $$ 3) . #1#)
    (LETT |o| (QREFELT $$ 2) . #1#)
    (LETT |maxMD| (QREFELT $$ 1) . #1#)
    (LETT |partitions| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|l| |vv| |e| |vn| |i| |r| |lastv| #2=#:G1187 |v| #3=#:G1188 |w|
             |vv1| #4=#:G1186 |p| #5=#:G1185 O #6=#:G1171 |qv| |d| #7=#:G1169
             |f|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |fl| (QREFELT $ 359)) (|spadConstant| $ 360)
                      (QREFELT $ 330))
            (|error| "ADEguessModGen2Mixed: #fl ~= 1"))
           ('T
            (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 361)) NIL)
                 (LETT |d|
                       (PROG1
                           (LETT #7#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |f| (QREFELT $ 457)) |dl|
                                            (QREFELT $ 219))
                                  (|spadConstant| $ 360) (QREFELT $ 219))
                                 NIL)
                         (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                          #7#))
                       NIL)
                 (LETT |qv|
                       (SPADCALL
                        (SPADCALL |d| (|spadConstant| $ 360) (QREFELT $ 259))
                        (|spadConstant| $ 360) (QREFELT $ 458))
                       NIL)
                 (SEQ (LETT |i| (|spadConstant| $ 360) NIL) G190
                      (COND ((> |i| |d|) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |qv| |i|
                                  (SPADCALL (SPADCALL |q| |i| (QREFELT $ 461))
                                            |prime| (QREFELT $ 462))
                                  (QREFELT $ 463))))
                      (LETT |i| (+ |i| 1) NIL) (GO G190) G191 (EXIT NIL))
                 (LETT O
                       (PROG1
                           (LETT #6#
                                 (SPADCALL
                                  (SPADCALL |o|
                                            (SPADCALL |maxMD|
                                                      (|spadConstant| $ 360)
                                                      (QREFELT $ 259))
                                            (QREFELT $ 464))
                                  (QREFELT $ 465))
                                 NIL)
                         (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                          #6#))
                       NIL)
                 (LETT |vv1|
                       (PROGN
                        (LETT #5# NIL NIL)
                        (SEQ (LETT |p| NIL NIL)
                             (LETT #4#
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |partitions| O (QREFELT $ 384))
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
                            (ATOM #3#) (PROGN (LETT |w| (CAR #3#) NIL) NIL))
                        (GO G191)))
                      (SEQ (LETT |lastv| |w| NIL) (LETT |vv| (LIST |v|) NIL)
                           (LETT |vn| |v| NIL)
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
                                                             (QREFELT $ 468))
                                                   (SPADCALL |qv| |e|
                                                             (QREFELT $ 468))
                                                   |prime|)
                                                  (QREFELT $ 463))))
                                      (LETT |e| (+ |e| 1) NIL) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT
                                  (LETT |vv|
                                        (SPADCALL |vn| |vv| (QREFELT $ 469))
                                        NIL)))
                                (LETT |i| (+ |i| 1) NIL) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (LETT |l|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |vv| (QREFELT $ 470))
                                             (QREFELT $ 362))
                                   |l| (QREFELT $ 472))
                                  NIL)))
                      (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) NIL)) NIL)
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
                             (SPADCALL (|spadConstant| $ 460) (QREFELT $ 474))
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
                            (QREFELT $ 477))))))))))))) 

(DEFUN |GUESS;ADEdegreeStreamMixShift| (|partitions| |maxMD| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (LETT |s| (|GUESS;ADEdegreeStream| |partitions| $)
            |GUESS;ADEdegreeStreamMixShift|)
      (EXIT
       (SPADCALL |s|
                 (CONS #'|GUESS;ADEdegreeStreamMixShift!0| (VECTOR |maxMD| $))
                 (QREFELT $ 481))))))) 

(DEFUN |GUESS;ADEdegreeStreamMixShift!0| (|z1| $$)
  (PROG ($ |maxMD|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;ADEdegreeStreamMixShift|))
    (LETT |maxMD| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|i| #2=#:G1192)
        (RETURN
         (SEQ
          (PROGN
           (LETT #2# NIL NIL)
           (SEQ (LETT |i| (|spadConstant| $ 275) NIL) G190
                (COND ((> |i| |maxMD|) (GO G191)))
                (SEQ (EXIT (LETT #2# (CONS |z1| #2#) NIL)))
                (LETT |i| (+ |i| 1) NIL) (GO G190) G191
                (EXIT (NREVERSE #2#))))))))))) 

(DEFUN |GUESS;ADEtestMixShiftGen| (|q| |partitions| |maxMD| |l| $)
  (PROG ()
    (RETURN
     (SEQ
      (CONS #'|GUESS;ADEtestMixShiftGen!0|
            (VECTOR |q| |partitions| |maxMD| $ |l|)))))) 

(DEFUN |GUESS;ADEtestMixShiftGen!0| (|f| $$)
  (PROG (|l| $ |maxMD| |partitions| |q|)
    (LETT |l| (QREFELT $$ 4) . #1=(|GUESS;ADEtestMixShiftGen|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |maxMD| (QREFELT $$ 2) . #1#)
    (LETT |partitions| (QREFELT $$ 1) . #1#)
    (LETT |q| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|res| #2=#:G1215 |i| #3=#:G1214 |f0| |exponents| #4=#:G1202
             |oldPartition| #5=#:G1213 #6=#:G1212 |newPartition| #7=#:G1196
             #8=#:G1211 |p| #9=#:G1195)
        (RETURN
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
                                                         (|spadConstant| $ 108)
                                                         (QREFELT $ 259))
                                               (QREFELT $ 464))
                                     (QREFELT $ 465))
                                    NIL)
                            (|check_subtype| (> #7# 0) '(|PositiveInteger|)
                                             #7#))
                          NIL)
                    (COND
                     ((SPADCALL |newPartition| |oldPartition| (QREFELT $ 484))
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
                                          (PROGN (LETT |i| (CAR #5#) NIL) NIL))
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
                                                                    (QREFELT $
                                                                             242))
                                                          |i| (QREFELT $ 299))
                                                         (QREFELT $ 418))
                                                        (SPADCALL
                                                         (|spadConstant| $ 335)
                                                         (|spadConstant| $ 108)
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
                                       (SPADCALL |maxMD| (|spadConstant| $ 108)
                                                 (QREFELT $ 259))
                                       (QREFELT $ 462))
                                      NIL)
                              (|check_subtype| (>= #4# 0)
                                               '(|NonNegativeInteger|) #4#))
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
                      (SEQ (LETT |i| NIL NIL) (LETT #2# |exponents| NIL) G190
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
                                                 (SPADCALL |q| (QREFELT $ 242))
                                                 |i| (QREFELT $ 299))
                                                (QREFELT $ 418))
                                               (SPADCALL (|spadConstant| $ 335)
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
                         (QREFELT $ 363)))))))))) 

(DEFUN |GUESS;ADEEXPRRStreamMixShift| (|q| |f| |xx| |partitions| |maxMD| $)
  (PROG (|s|)
    (RETURN
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
                 (QREFELT $ 493))))))) 

(DEFUN |GUESS;ADEEXPRRStreamMixShift!0| (|z1| $$)
  (PROG (|q| |xx| |maxMD| $)
    (LETT |q| (QREFELT $$ 3) . #1=(|GUESS;ADEEXPRRStreamMixShift|))
    (LETT |xx| (QREFELT $$ 2) . #1#)
    (LETT |maxMD| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;qSubstEXPRR| |q| |xx| |z1| |maxMD| $))))) 

(DEFUN |GUESS;shiftHP;SM;111| (|q| $)
  (PROG () (RETURN (SEQ (CONS #'|GUESS;shiftHP;SM;111!12| (VECTOR |q| $)))))) 

(DEFUN |GUESS;shiftHP;SM;111!12| (|l1| $$)
  (PROG ($ |q|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;shiftHP;SM;111|))
    (LETT |q| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|degrees| |maxMD| |partitions|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |l1| (QREFELT $ 383)) '|displayAsRec|
                      (QREFELT $ 405))
            (|error|
             "Guess: no support for the qShift operator with displayAsGF"))
           ('T
            (SEQ
             (LETT |partitions| (|GUESS;FilteredPartitionStream| |l1| $) NIL)
             (EXIT
              (COND
               ((SPADCALL (LETT |maxMD| (SPADCALL |l1| (QREFELT $ 382)) NIL)
                          (QREFELT $ 421))
                (SEQ
                 (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $) NIL)
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
                          (CONS #'|GUESS;shiftHP;SM;111!4| (VECTOR $ |q|))
                          (CONS #'|GUESS;shiftHP;SM;111!5| (VECTOR $ |q|))
                          (CONS #'|GUESS;shiftHP;SM;111!6| (VECTOR $ |q|))
                          (CONS #'|GUESS;shiftHP;SM;111!7| (VECTOR $ |q|))))))
               ('T
                (SEQ
                 (LETT |degrees|
                       (|GUESS;ADEdegreeStreamMixShift| |partitions| |maxMD| $)
                       NIL)
                 (EXIT
                  (VECTOR |degrees|
                          (CONS #'|GUESS;shiftHP;SM;111!8|
                                (VECTOR $ |maxMD| |partitions| |q|))
                          (CONS #'|GUESS;shiftHP;SM;111!9|
                                (VECTOR |maxMD| $ |degrees| |partitions|))
                          (CONS #'|GUESS;shiftHP;SM;111!10|
                                (VECTOR $ |maxMD| |partitions| |q|))
                          (CONS #'|GUESS;shiftHP;SM;111!11|
                                (VECTOR $ |maxMD| |partitions| |q|))
                          '|qmixed| |q| (CONS (|function| |GUESS;ShiftA|) $)
                          (CONS (|function| |GUESS;ShiftAF|) $)
                          (CONS (|function| |GUESS;ShiftAX|) $)
                          (CONS (|function| |GUESS;ShiftC|) $))))))))))))))))) 

(DEFUN |GUESS;shiftHP;SM;111!11| (|z1| |z2| $$)
  (PROG (|q| |partitions| |maxMD| $)
    (LETT |q| (QREFELT $$ 3) NIL)
    (LETT |partitions| (QREFELT $$ 2) NIL)
    (LETT |maxMD| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (|GUESS;ADEEXPRRStreamMixShift| |q| |z1| |z2| |partitions| |maxMD| $))))) 

(DEFUN |GUESS;shiftHP;SM;111!10| (|l| $$)
  (PROG (|q| |partitions| |maxMD| $)
    (LETT |q| (QREFELT $$ 3) NIL)
    (LETT |partitions| (QREFELT $$ 2) NIL)
    (LETT |maxMD| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN (|GUESS;ADEtestMixShiftGen| |q| |partitions| |maxMD| |l| $))))) 

(DEFUN |GUESS;shiftHP;SM;111!9| (|o| $$)
  (PROG (|partitions| |degrees| $ |maxMD|)
    (LETT |partitions| (QREFELT $$ 3) NIL)
    (LETT |degrees| (QREFELT $$ 2) NIL)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |maxMD| (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (|GUESS;ADEguessModGen2Mixed| |partitions|
       (SPADCALL |degrees| |o| (QREFELT $ 442)) |maxMD| |o| $))))) 

(DEFUN |GUESS;shiftHP;SM;111!8| (|z1| $$)
  (PROG (|q| |partitions| |maxMD| $)
    (LETT |q| (QREFELT $$ 3) NIL)
    (LETT |partitions| (QREFELT $$ 2) NIL)
    (LETT |maxMD| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN (|GUESS;ADEguessStreamMixShift| |q| |z1| |partitions| |maxMD| $))))) 

(DEFUN |GUESS;shiftHP;SM;111!7| (|z1| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (|GUESS;qShiftC| |q| |z1| $))))) 

(DEFUN |GUESS;shiftHP;SM;111!6| (|z1| |z2| |z3| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (|GUESS;qShiftAX| |q| |z1| |z2| |z3| $))))) 

(DEFUN |GUESS;shiftHP;SM;111!5| (|z1| |z2| |z3| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (|GUESS;qShiftAF| |q| |z1| |z2| |z3| $))))) 

(DEFUN |GUESS;shiftHP;SM;111!4| (|z1| |z2| |z3| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (|GUESS;qShiftA| |q| |z1| |z2| |z3| $))))) 

(DEFUN |GUESS;shiftHP;SM;111!3| (|z1| |z2| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
       (CONS (|function| |GUESS;ShiftSX|) $)
       (CONS (|function| |GUESS;diff1X|) $) $))))) 

(DEFUN |GUESS;shiftHP;SM;111!2| (|l| $$)
  (PROG (|partitions| $)
    (LETT |partitions| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (PROG (#1=#:G1238 |i| #2=#:G1237)
        (RETURN
         (SEQ
          (|GUESS;ADEtestGen2|
           (PROGN
            (LETT #2# NIL NIL)
            (SEQ (LETT |i| NIL NIL) (LETT #1# |l| NIL) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) NIL) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS (SPADCALL |partitions| |i| (QREFELT $ 387)) #2#)
                         NIL)))
                 (LETT #1# (CDR #1#) NIL) (GO G190) G191
                 (EXIT (NREVERSE #2#))))
           (CONS (|function| |GUESS;ShiftSF|) $)
           (SPADCALL
            (SPADCALL (|spadConstant| $ 327)
                      (SPADCALL (|spadConstant| $ 335) (|spadConstant| $ 108)
                                (QREFELT $ 443))
                      (QREFELT $ 444))
            (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440)) (QREFELT $ 445))
           $)))))))) 

(DEFUN |GUESS;shiftHP;SM;111!1| (|o| $$)
  (PROG (|partitions| $ |degrees|)
    (LETT |partitions| (QREFELT $$ 2) NIL)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |degrees| (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (|GUESS;ADEguessModGen2|
       (SPADCALL
        (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 384)) (QREFELT $ 385))
        (QREFELT $ 386))
       (SPADCALL |degrees| |o| (QREFELT $ 442)) $))))) 

(DEFUN |GUESS;shiftHP;SM;111!0| (|z1| $$)
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
        (SPADCALL (|spadConstant| $ 334) (QREFELT $ 440)) (QREFELT $ 441))
       $))))) 

(DEFUN |GUESS;makeEXPRR| (DAX |x| |p| |expr| $)
  (COND ((SPADCALL |p| (QREFELT $ 124)) (|spadConstant| $ 49))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 125)) (QREFELT $ 10))
                    (SPADCALL (SPADCALL |p| (QREFELT $ 127)) |x| |expr| DAX)
                    (QREFELT $ 105))
          (|GUESS;makeEXPRR| DAX |x| (SPADCALL |p| (QREFELT $ 129)) |expr| $)
          (QREFELT $ 111))))) 

(DEFUN |GUESS;list2UFPSF| (|list| $)
  (SPADCALL (SPADCALL |list| (QREFELT $ 496)) (QREFELT $ 497))) 

(DEFUN |GUESS;list2UFPSSUPF| (|list| $)
  (PROG (|l2| |s1| |l1| #1=#:G1285 |e| #2=#:G1284)
    (RETURN
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
            (SPADCALL (CONS #'|GUESS;list2UFPSSUPF!0| $) |s1| (QREFELT $ 505))
            . #3#)
      (EXIT (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 506)) (QREFELT $ 507))))))) 

(DEFUN |GUESS;list2UFPSSUPF!0| (|i| $)
  (PROG (#1=#:G1280)
    (RETURN
     (SPADCALL (|spadConstant| $ 11)
               (SPADCALL (|spadConstant| $ 360)
                         (PROG1 (LETT #1# |i| NIL)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         (QREFELT $ 502))
               (QREFELT $ 503))))) 

(DEFUN |GUESS;SUPF2SUPSUPF| (|p| $) (SPADCALL (ELT $ 418) |p| (QREFELT $ 511))) 

(DEFUN |GUESS;UFPSF2SUPF| (|f| |deg| $)
  (SPADCALL (SPADCALL |f| |deg| (QREFELT $ 513)) (QREFELT $ 514))) 

(DEFUN |GUESS;getListSUPF| (|s| |deg| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|GUESS;getListSUPF!0| (VECTOR $ |deg|)) |s|
               (QREFELT $ 518))))) 

(DEFUN |GUESS;getListSUPF!0| (|z1| $$)
  (PROG (|deg| $)
    (LETT |deg| (QREFELT $$ 1) . #1=(|GUESS;getListSUPF|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GUESS;UFPSF2SUPF| |z1| |deg| $))))) 

(DEFUN |GUESS;precCheck| (|list| |resi| |options| |sigma| |bad| $)
  (PROG (#1=#:G1329 #2=#:G1324 |res2| |p2val| |p2| #3=#:G1331 |j| #4=#:G1320
         |si| |i| #5=#:G1317 |res1| |gl| #6=#:G1311 #7=#:G1330 #8=#:G1307
         #9=#:G1304 |cden| |c2| #10=#:G1300 |c1| |pp| |vd| |vi| |order| |j0|
         |svar| |max_ind| |degree_loss| |gl0| |m| |resv| |homo| |homp|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |homp| (SPADCALL |options| (QREFELT $ 249))
              . #11=(|GUESS;precCheck|))
        (LETT |homo| (COND ((QEQCAR |homp| 1) (QCDR |homp|)) (#12='T 'T))
              . #11#)
        (LETT |resv| (SPADCALL |resi| (QREFELT $ 521)) . #11#)
        (LETT |m| (QVSIZE |resv|) . #11#)
        (LETT |gl0| (SPADCALL |list| (QREFELT $ 523)) . #11#)
        (LETT |degree_loss| (COND (|homo| (- |m| 1)) (#12# (- |m| 2))) . #11#)
        (COND
         ((SPADCALL |options| (QREFELT $ 524))
          (LETT |max_ind| (- (- (QVSIZE |gl0|) |degree_loss|) 1) . #11#))
         (#12# (LETT |max_ind| (- |sigma| 1) . #11#)))
        (LETT |svar| (SPADCALL (QREFELT $ 526)) . #11#)
        (LETT |j0| (COND (|homo| 1) (#12# 2)) . #11#) (LETT |order| 0 . #11#)
        (EXIT
         (COND
          ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
           (SEQ (LETT |gl| |gl0| . #11#)
                (SEQ (LETT |i| 0 . #11#) G190
                     (COND ((|greater_SI| |i| |max_ind|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |res1| (|spadConstant| $ 48) . #11#)
                            (LETT |cden| (|spadConstant| $ 12) . #11#)
                            (LETT |si| (SPADCALL |i| (QREFELT $ 160)) . #11#)
                            (COND
                             ((NULL |homo|)
                              (LETT |res1|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |resv| 1 (QREFELT $ 527))
                                      |svar| |si| (QREFELT $ 528))
                                     (QREFELT $ 529))
                                    . #11#)))
                            (SEQ (LETT |j| |j0| . #11#) G190
                                 (COND ((> |j| |m|) (GO G191)))
                                 (SEQ
                                  (LETT |p2|
                                        (SPADCALL |resv| |j| (QREFELT $ 527))
                                        . #11#)
                                  (LETT |p2val|
                                        (SPADCALL
                                         (SPADCALL |p2| |svar| |si|
                                                   (QREFELT $ 528))
                                         (QREFELT $ 529))
                                        . #11#)
                                  (LETT |vi|
                                        (SPADCALL |gl|
                                                  (+ (- (+ |i| |j|) |j0|) 1)
                                                  (QREFELT $ 530))
                                        . #11#)
                                  (LETT |vd| (SPADCALL |vi| (QREFELT $ 30))
                                        . #11#)
                                  (LETT |pp|
                                        (SPADCALL |cden| |vd| (QREFELT $ 531))
                                        . #11#)
                                  (LETT |c1|
                                        (PROG2
                                            (LETT #10#
                                                  (SPADCALL |cden| |pp|
                                                            (QREFELT $ 171))
                                                  . #11#)
                                            (QCDR #10#)
                                          (|check_union| (QEQCAR #10# 0)
                                                         (QREFELT $ 7) #10#))
                                        . #11#)
                                  (LETT |c2|
                                        (PROG2
                                            (LETT #10#
                                                  (SPADCALL |vd| |pp|
                                                            (QREFELT $ 171))
                                                  . #11#)
                                            (QCDR #10#)
                                          (|check_union| (QEQCAR #10# 0)
                                                         (QREFELT $ 7) #10#))
                                        . #11#)
                                  (LETT |res1|
                                        (SPADCALL
                                         (SPADCALL |c2| |res1| (QREFELT $ 167))
                                         (SPADCALL
                                          (SPADCALL |p2val| |c1|
                                                    (QREFELT $ 167))
                                          (SPADCALL |vi| (QREFELT $ 29))
                                          (QREFELT $ 167))
                                         (QREFELT $ 274))
                                        . #11#)
                                  (EXIT
                                   (LETT |cden|
                                         (SPADCALL |cden| |c2| (QREFELT $ 167))
                                         . #11#)))
                                 (LETT |j| (+ |j| 1) . #11#) (GO G190) G191
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
                                               . #11#)
                                         (GO #1#)))
                                       ('T
                                        (PROGN
                                         (LETT #1# (CONS 1 "reject") . #11#)
                                         (GO #1#))))
                                      . #11#)
                                (GO #9#)))))))
                      #9# (EXIT #9#))
                     (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                     (EXIT NIL))
                (COND
                 ((NULL (SPADCALL |options| (QREFELT $ 524)))
                  (PROGN (LETT #1# (CONS 0 "good") . #11#) (GO #1#))))
                (EXIT
                 (COND
                  (|bad| (PROGN (LETT #1# (CONS 1 "reject") . #11#) (GO #1#)))
                  (#12#
                   (SEQ
                    (SEQ (LETT |i| 1 . #11#) G190
                         (COND ((|greater_SI| |i| |degree_loss|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ
                            (LETT |si|
                                  (SPADCALL (+ |i| |max_ind|) (QREFELT $ 160))
                                  . #11#)
                            (SEQ (LETT |j| (- |m| |i|) . #11#) G190
                                 (COND ((> |j| |m|) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |p2|
                                          (SPADCALL |resv| |j| (QREFELT $ 527))
                                          . #11#)
                                    (LETT |p2val|
                                          (SPADCALL
                                           (SPADCALL |p2| |svar| |si|
                                                     (QREFELT $ 528))
                                           (QREFELT $ 529))
                                          . #11#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |p2val| (|spadConstant| $ 48)
                                                 (QREFELT $ 532))
                                       (PROGN
                                        (LETT #8#
                                              (PROGN
                                               (LETT #1# (CONS 0 "good")
                                                     . #11#)
                                               (GO #1#))
                                              . #11#)
                                        (GO #8#)))))))
                                  #8# (EXIT #8#))
                                 (LETT |j| (+ |j| 1) . #11#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |res2| (|spadConstant| $ 47) . #11#)
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
                                    . #11#)))
                            (SEQ (LETT |j| |j0| . #11#)
                                 (LETT #7# (- |m| |i|) . #11#) G190
                                 (COND ((> |j| #7#) (GO G191)))
                                 (SEQ
                                  (LETT |p2|
                                        (SPADCALL |resv| |j| (QREFELT $ 527))
                                        . #11#)
                                  (LETT |p2val|
                                        (SPADCALL
                                         (SPADCALL |p2| |svar| |si|
                                                   (QREFELT $ 528))
                                         (QREFELT $ 529))
                                        . #11#)
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
                                                                        $ 530))
                                                             (QREFELT $ 533))
                                                   (QREFELT $ 534))
                                         . #11#)))
                                 (LETT |j| (+ |j| 1) . #11#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (COND
                              ((SPADCALL |res2| (|spadConstant| $ 47)
                                         (QREFELT $ 535))
                               (PROGN
                                (LETT #6#
                                      (PROGN
                                       (LETT #1# (CONS 1 "reject") . #11#)
                                       (GO #1#))
                                      . #11#)
                                (GO #6#)))))))
                          #6# (EXIT #6#))
                         (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS 0 "good") . #11#) (GO #1#)))))))))
          ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
           (SEQ (LETT |gl| |gl0| . #11#)
                (SEQ (LETT |i| 0 . #11#) G190
                     (COND ((|greater_SI| |i| |max_ind|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |res1| (|spadConstant| $ 48) . #11#)
                            (LETT |si| (SPADCALL |i| (QREFELT $ 160)) . #11#)
                            (COND
                             ((NULL |homo|)
                              (LETT |res1|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |resv| 1 (QREFELT $ 527))
                                      |svar| |si| (QREFELT $ 528))
                                     (QREFELT $ 529))
                                    . #11#)))
                            (SEQ (LETT |j| |j0| . #11#) G190
                                 (COND ((> |j| |m|) (GO G191)))
                                 (SEQ
                                  (LETT |p2|
                                        (SPADCALL |resv| |j| (QREFELT $ 527))
                                        . #11#)
                                  (LETT |p2val|
                                        (SPADCALL
                                         (SPADCALL |p2| |svar| |si|
                                                   (QREFELT $ 528))
                                         (QREFELT $ 529))
                                        . #11#)
                                  (EXIT
                                   (LETT |res1|
                                         (SPADCALL |res1|
                                                   (SPADCALL |p2val|
                                                             (SPADCALL |gl|
                                                                       (+
                                                                        (-
                                                                         (+ |i|
                                                                            |j|)
                                                                         |j0|)
                                                                        1)
                                                                       (QREFELT
                                                                        $ 537))
                                                             (QREFELT $ 167))
                                                   (QREFELT $ 274))
                                         . #11#)))
                                 (LETT |j| (+ |j| 1) . #11#) (GO G190) G191
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
                                               . #11#)
                                         (GO #1#)))
                                       ('T
                                        (PROGN
                                         (LETT #1# (CONS 1 "reject") . #11#)
                                         (GO #1#))))
                                      . #11#)
                                (GO #5#)))))))
                      #5# (EXIT #5#))
                     (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                     (EXIT NIL))
                (COND
                 ((NULL (SPADCALL |options| (QREFELT $ 524)))
                  (PROGN (LETT #1# (CONS 0 "good") . #11#) (GO #1#))))
                (EXIT
                 (COND
                  (|bad| (PROGN (LETT #1# (CONS 1 "reject") . #11#) (GO #1#)))
                  (#12#
                   (SEQ
                    (SEQ (LETT |i| 1 . #11#) G190
                         (COND ((|greater_SI| |i| |degree_loss|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ
                            (LETT |si|
                                  (SPADCALL (+ |i| |max_ind|) (QREFELT $ 160))
                                  . #11#)
                            (SEQ (LETT |j| (- |m| |i|) . #11#) G190
                                 (COND ((> |j| |m|) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |p2|
                                          (SPADCALL |resv| |j| (QREFELT $ 527))
                                          . #11#)
                                    (LETT |p2val|
                                          (SPADCALL
                                           (SPADCALL |p2| |svar| |si|
                                                     (QREFELT $ 528))
                                           (QREFELT $ 529))
                                          . #11#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |p2val| (|spadConstant| $ 48)
                                                 (QREFELT $ 532))
                                       (PROGN
                                        (LETT #4#
                                              (PROGN
                                               (LETT #1# (CONS 0 "good")
                                                     . #11#)
                                               (GO #1#))
                                              . #11#)
                                        (GO #4#)))))))
                                  #4# (EXIT #4#))
                                 (LETT |j| (+ |j| 1) . #11#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |res2| (|spadConstant| $ 48) . #11#)
                            (COND
                             (|homo|
                              (LETT |res2|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |resv| 1 (QREFELT $ 527))
                                      |svar| |si| (QREFELT $ 528))
                                     (QREFELT $ 529))
                                    . #11#)))
                            (SEQ (LETT |j| |j0| . #11#)
                                 (LETT #3# (- |m| |i|) . #11#) G190
                                 (COND ((> |j| #3#) (GO G191)))
                                 (SEQ
                                  (LETT |p2|
                                        (SPADCALL |resv| |j| (QREFELT $ 527))
                                        . #11#)
                                  (LETT |p2val|
                                        (SPADCALL
                                         (SPADCALL |p2| |svar| |si|
                                                   (QREFELT $ 528))
                                         (QREFELT $ 529))
                                        . #11#)
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
                                                                        $ 537))
                                                             (QREFELT $ 167))
                                                   (QREFELT $ 274))
                                         . #11#)))
                                 (LETT |j| (+ |j| 1) . #11#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (COND
                              ((SPADCALL |res2| (|spadConstant| $ 48)
                                         (QREFELT $ 532))
                               (PROGN
                                (LETT #2#
                                      (PROGN
                                       (LETT #1# (CONS 1 "reject") . #11#)
                                       (GO #1#))
                                      . #11#)
                                (GO #2#)))))))
                          #2# (EXIT #2#))
                         (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS 0 "good") . #11#) (GO #1#)))))))))
          (#12# (|error| "F must be S or Fraction(S)"))))))
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;checkInterpolant| (|list| |o| |resi| D |options| |sigma| $)
  (PROG (#1=#:G1379 #2=#:G1372 |order| |c| |d| |dmax| |resiSUPF| #3=#:G1383 |i|
         #4=#:G1382 |testList| |flist| #5=#:G1361 #6=#:G1381 |maxPow| |maxP|
         |len| |reject_one_term| #7=#:G1340 |nonZeroCoefficients| #8=#:G1380)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |options| (QREFELT $ 67))
          (SPADCALL "Guess: checking solution" (QREFELT $ 79))))
        (LETT |nonZeroCoefficients| (CONS 2 "none")
              . #9=(|GUESS;checkInterpolant|))
        (LETT |reject_one_term| 'NIL . #9#)
        (SEQ
         (EXIT
          (SEQ (LETT |i| 1 . #9#) (LETT #8# (LENGTH |resi|) . #9#) G190
               (COND ((|greater_SI| |i| #8#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL (SPADCALL |resi| |i| (QREFELT $ 538))
                              (QREFELT $ 539)))
                   (COND
                    ((QEQCAR |nonZeroCoefficients| 2)
                     (LETT |nonZeroCoefficients| (CONS 0 "one") . #9#))
                    ('T
                     (SEQ (LETT |nonZeroCoefficients| (CONS 1 "several") . #9#)
                          (EXIT
                           (PROGN (LETT #7# |$NoValue| . #9#) (GO #7#))))))))))
               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL)))
         #7# (EXIT #7#))
        (COND
         ((NULL (QEQCAR |nonZeroCoefficients| 1))
          (COND
           ((NULL (SPADCALL (ELT $ 544) |list| (QREFELT $ 84)))
            (SEQ (LETT |reject_one_term| 'T . #9#)
                 (EXIT
                  (COND
                   ((SPADCALL |options| (QREFELT $ 67))
                    (SPADCALL "Guess: encountered single-term solution"
                              (QREFELT $ 79))))))))))
        (LETT |len| (LENGTH |list|) . #9#)
        (LETT |maxP| (SPADCALL |options| (QREFELT $ 247)) . #9#)
        (COND ((QEQCAR |maxP| 0) (LETT |maxPow| (QCDR |maxP|) . #9#))
              (#10='T (LETT |maxPow| (+ |len| 2) . #9#)))
        (COND
         ((EQL |maxPow| 1)
          (COND
           ((EQUAL (QVELT D 5) '|shiftHP|)
            (EXIT
             (|GUESS;precCheck| |list| |resi| |options| |sigma|
              |reject_one_term| $))))))
        (LETT |flist|
              (PROGN
               (LETT #6# NIL . #9#)
               (SEQ (LETT |i| 1 . #9#) G190
                    (COND ((|greater_SI| |i| |o|) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((COND
                         ((SPADCALL (SPADCALL |resi| |i| (QREFELT $ 538))
                                    (QREFELT $ 539))
                          'NIL)
                         (#10# 'T))
                        (LETT #6#
                              (CONS
                               (PROG1 (LETT #5# |i| . #9#)
                                 (|check_subtype| (> #5# 0)
                                                  '(|PositiveInteger|) #5#))
                               #6#)
                              . #9#)))))
                    (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                    (EXIT (NREVERSE #6#))))
              . #9#)
        (LETT |testList|
              (SPADCALL (|GUESS;list2UFPSSUPF| |list| $)
                        (SPADCALL |flist| (QVELT D 3)))
              . #9#)
        (LETT |resiSUPF|
              (PROGN
               (LETT #4# NIL . #9#)
               (SEQ (LETT |i| NIL . #9#) (LETT #3# |flist| . #9#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #9#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #4#
                            (CONS
                             (|GUESS;SUPF2SUPSUPF|
                              (|GUESS;SUPS2SUPF|
                               (SPADCALL |resi| |i| (QREFELT $ 538)) $)
                              $)
                             #4#)
                            . #9#)))
                    (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              . #9#)
        (LETT |order| 0 . #9#)
        (LETT |dmax| (SPADCALL 10 (LENGTH |list|) (QREFELT $ 545)) . #9#)
        (SEQ
         (EXIT
          (SEQ (LETT |d| 0 . #9#) G190 NIL
               (SEQ
                (COND
                 ((NULL (SPADCALL |options| (QREFELT $ 524)))
                  (COND
                   ((EQL |d| |sigma|)
                    (PROGN (LETT #1# (CONS 0 "good") . #9#) (GO #1#))))))
                (COND
                 (|reject_one_term|
                  (COND
                   ((EQL |d| |sigma|)
                    (PROGN (LETT #1# (CONS 1 "reject") . #9#) (GO #1#))))))
                (LETT |c|
                      (SPADCALL (QVELT D 8) |testList| |d|
                                (SPADCALL |resiSUPF| (QREFELT $ 548))
                                (QREFELT $ 549))
                      . #9#)
                (COND
                 ((NULL (SPADCALL |c| (QREFELT $ 550)))
                  (SEQ (LETT |order| |d| . #9#)
                       (EXIT (PROGN (LETT #2# |$NoValue| . #9#) (GO #2#))))))
                (EXIT
                 (COND
                  ((SPADCALL |d| |dmax| (QREFELT $ 402))
                   (SEQ
                    (SPADCALL "bailing out from checkInterpolant"
                              (QREFELT $ 551))
                    (SPADCALL
                     "please report the input to fricas-devel@googlegroups.com"
                     (QREFELT $ 551))
                    (LETT |order| |d| . #9#)
                    (EXIT (PROGN (LETT #2# |$NoValue| . #9#) (GO #2#))))))))
               (LETT |d| (|inc_SI| |d|) . #9#) (GO G190) G191 (EXIT NIL)))
         #2# (EXIT #2#))
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
            (EXIT (PROGN (LETT #1# (CONS 2 "no_solution") . #9#) (GO #1#)))))
          ((SPADCALL |c| (QREFELT $ 553))
           (SEQ
            (COND
             ((SPADCALL |options| (QREFELT $ 67))
              (SEQ
               (SPADCALL
                (SPADCALL "Proposed solution does not fit coefficient "
                          (SPADCALL |order| (QREFELT $ 552)) (QREFELT $ 70))
                (QREFELT $ 551))
               (EXIT
                (SPADCALL
                 (SPADCALL "sigma: " (SPADCALL |sigma| (QREFELT $ 552))
                           (QREFELT $ 70))
                 (QREFELT $ 551))))))
            (EXIT (PROGN (LETT #1# (CONS 1 "reject") . #9#) (GO #1#)))))
          (#10# (CONS 0 "good"))))))
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;wrapInterpolant|
       (|resi| |exprList| |initials| D |op| |options| $)
  (PROG (|ex| #1=#:G1414 |p| #2=#:G1415 |e| #3=#:G1413 |eq| #4=#:G1411
         #5=#:G1412 #6=#:G1410 |dk|)
    (RETURN
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
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #7#) NIL)
                            (ATOM #5#) (PROGN (LETT |e| (CAR #5#) . #7#) NIL))
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
                      (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #7#))
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
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #7#) NIL)
                            (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #7#) NIL))
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
                      (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #7#))
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
        (#8# (|error| "wrapInterpolant: unsupported display kind")))))))) 

(DEFUN |GUESS;guessInterpolateModular|
       (|lists| |degs| |o| |degreeLoss| |guessDegree| D |options| $)
  (PROG (|check| |i| #1=#:G1464 |deg| #2=#:G1463 #3=#:G1462 |maxD| #4=#:G1422
         #5=#:G1460 |del| |leadingZeros| #6=#:G1461 |el| |sigma| #7=#:G1420
         |list|)
    (RETURN
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
                          (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|)
                                           #4#))
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
                                  (LETT #3# (CONS (QCDR |maxD|) #3#) . #8#)))
                                (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          . #8#))
                   (#9#
                    (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|) . #8#)
                         (EXIT
                          (LETT |degs|
                                (PROGN
                                 (LETT #2# NIL . #8#)
                                 (SEQ (LETT |i| 1 . #8#) G190
                                      (COND ((|greater_SI| |i| |o|) (GO G191)))
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
                                      (LETT |i| (|inc_SI| |i|) . #8#) (GO G190)
                                      G191 (EXIT (NREVERSE #2#))))
                                . #8#))))))
                 (#9#
                  (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|) . #8#)
                       (EXIT
                        (LETT |degs|
                              (PROGN
                               (LETT #1# NIL . #8#)
                               (SEQ (LETT |i| 1 . #8#) G190
                                    (COND ((|greater_SI| |i| |o|) (GO G191)))
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
                                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190)
                                    G191 (EXIT (NREVERSE #1#))))
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
            (LETT |check| (LIST #'|GUESS;guessInterpolateModular!1|) . #8#))))
         (#9#
          (LETT |check|
                (CONS #'|GUESS;guessInterpolateModular!2|
                      (VECTOR $ |sigma| |options| D |o| |list|))
                . #8#)))
        (EXIT
         (SPADCALL |lists| |degs| (QVELT D 5) (QVELT D 6) |sigma|
                   (SPADCALL |o| (QVELT D 2)) |check| (QREFELT $ 571)))))
      #5# (EXIT #5#))))) 

(DEFUN |GUESS;guessInterpolateModular!2| (|x| $$)
  (PROG (|list| |o| D |options| |sigma| $)
    (LETT |list| (QREFELT $$ 5) . #1=(|GUESS;guessInterpolateModular|))
    (LETT |o| (QREFELT $$ 4) . #1#)
    (LETT D (QREFELT $$ 3) . #1#)
    (LETT |options| (QREFELT $$ 2) . #1#)
    (LETT |sigma| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|GUESS;checkInterpolant| |list| |o| |x| D |options| |sigma| $))))) 

(DEFUN |GUESS;guessInterpolateModular!1| (|x| $$) (CONS 0 "good")) 

(DEFUN |GUESS;guessInterpolateModular!0| (|x| $$)
  (PROG (|list| |o| D |options| |sigma| $)
    (LETT |list| (QREFELT $$ 5) . #1=(|GUESS;guessInterpolateModular|))
    (LETT |o| (QREFELT $$ 4) . #1#)
    (LETT D (QREFELT $$ 3) . #1#)
    (LETT |options| (QREFELT $$ 2) . #1#)
    (LETT |sigma| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|GUESS;checkInterpolant| |list| |o| |x| D |options| |sigma| $))))) 

(DEFUN |GUESS;guessInterpolateFFFG|
       (|lists| |degs| |o| |guessDegree| D |options| $)
  (PROG (#1=#:G1542 |j| |c| |cl| #2=#:G1558 #3=#:G1556 |i1| #4=#:G1557 |i2|
         |Mr| |m| |rl| |ce| #5=#:G1555 |i| M |vguessListF| |vguessList|
         |guessPolys| #6=#:G1526 |guessList| |guessS| |sumEta| |eta| #7=#:G1554
         |deg| #8=#:G1488 #9=#:G1553 #10=#:G1478 #11=#:G1552 |maxD| #12=#:G1467
         #13=#:G1551 |d| #14=#:G1550 |list|)
    (RETURN
     (SEQ
      (LETT |list| (|SPADfirst| |lists|) . #15=(|GUESS;guessInterpolateFFFG|))
      (COND
       ((SPADCALL |options| (QREFELT $ 67))
        (SPADCALL "Guess: using FFFG" (QREFELT $ 79))))
      (COND
       ((SPADCALL |options| (QREFELT $ 562))
        (SEQ
         (LETT |eta|
               (PROGN
                (LETT #14# NIL . #15#)
                (SEQ (LETT |d| NIL . #15#) (LETT #13# |degs| . #15#) G190
                     (COND
                      ((OR (ATOM #13#)
                           (PROGN (LETT |d| (CAR #13#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #14#
                             (CONS
                              (PROG1 (LETT #12# |d| . #15#)
                                (|check_subtype| (>= #12# 0)
                                                 '(|NonNegativeInteger|) #12#))
                              #14#)
                             . #15#)))
                     (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                     (EXIT (NREVERSE #14#))))
               . #15#)
         (EXIT
          (SPADCALL |eta| 1 (+ (SPADCALL |eta| 1 (QREFELT $ 572)) 1)
                    (QREFELT $ 573)))))
       (#16='T
        (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 179)) . #15#)
             (EXIT
              (COND
               ((QEQCAR |maxD| 0)
                (COND
                 ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                  (LETT |eta|
                        (PROGN
                         (LETT #11# NIL . #15#)
                         (SEQ (LETT |i| 1 . #15#) G190
                              (COND ((|greater_SI| |i| |o|) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #11#
                                      (CONS
                                       (COND ((< |i| |o|) (+ (QCDR |maxD|) 1))
                                             ('T (QCDR |maxD|)))
                                       #11#)
                                      . #15#)))
                              (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                              (EXIT (NREVERSE #11#))))
                        . #15#))
                 (#16#
                  (SEQ
                   (LETT |deg|
                         (DIVIDE2
                          (PROG1 (LETT #10# (- (+ |guessDegree| |o|) 1) . #15#)
                            (|check_subtype| (>= #10# 0)
                                             '(|NonNegativeInteger|) #10#))
                          |o|)
                         . #15#)
                   (EXIT
                    (LETT |eta|
                          (PROGN
                           (LETT #9# NIL . #15#)
                           (SEQ (LETT |i| 1 . #15#) G190
                                (COND ((|greater_SI| |i| |o|) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #9#
                                        (CONS
                                         (COND
                                          ((SPADCALL |i| (QCDR |deg|)
                                                     (QREFELT $ 563))
                                           (+ (QCAR |deg|) 1))
                                          ('T (QCAR |deg|)))
                                         #9#)
                                        . #15#)))
                                (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                                (EXIT (NREVERSE #9#))))
                          . #15#))))))
               (#16#
                (SEQ
                 (LETT |deg|
                       (DIVIDE2
                        (PROG1 (LETT #8# (- (+ |guessDegree| |o|) 1) . #15#)
                          (|check_subtype| (>= #8# 0) '(|NonNegativeInteger|)
                                           #8#))
                        |o|)
                       . #15#)
                 (EXIT
                  (LETT |eta|
                        (PROGN
                         (LETT #7# NIL . #15#)
                         (SEQ (LETT |i| 1 . #15#) G190
                              (COND ((|greater_SI| |i| |o|) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #7#
                                      (CONS
                                       (COND
                                        ((SPADCALL |i| (QCDR |deg|)
                                                   (QREFELT $ 563))
                                         (+ (QCAR |deg|) 1))
                                        ('T (QCAR |deg|)))
                                       #7#)
                                      . #15#)))
                              (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                              (EXIT (NREVERSE #7#))))
                        . #15#)))))))))
      (LETT |sumEta| (SPADCALL (ELT $ 259) |eta| (QREFELT $ 578)) . #15#)
      (LETT |guessS| (SPADCALL (|GUESS;list2UFPSF| |list| $) (QVELT D 1))
            . #15#)
      (LETT |guessList|
            (SPADCALL
             (SPADCALL (SPADCALL |guessS| |o| (QREFELT $ 579)) (QREFELT $ 580))
             (QREFELT $ 581))
            . #15#)
      (LETT |guessPolys|
            (|GUESS;getListSUPF| |guessList|
             (PROG1 (LETT #6# (- |sumEta| 1) . #15#)
               (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|) #6#))
             $)
            . #15#)
      (COND
       ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
        (SEQ (LETT |vguessList| (SPADCALL |guessPolys| (QREFELT $ 521)) . #15#)
             (EXIT
              (LETT M
                    (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                              |vguessList| |eta| (QREFELT $ 583))
                    . #15#))))
       ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
        (SEQ
         (LETT |vguessListF| (SPADCALL |guessPolys| (QREFELT $ 585)) . #15#)
         (EXIT
          (LETT M
                (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                          |vguessListF| |eta| (QREFELT $ 587))
                . #15#))))
       (#16#
        (|error|
         "Guess: type parameter F should be either equal to S or equal                         to Fraction S")))
      (LETT |rl| NIL . #15#)
      (SEQ (LETT |i| 1 . #15#) (LETT #5# (SPADCALL M (QREFELT $ 588)) . #15#)
           G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
           (SEQ
            (LETT |ce|
                  (SPADCALL (SPADCALL M |i| (QREFELT $ 589)) (QREFELT $ 590))
                  . #15#)
            (EXIT
             (COND
              ((QEQCAR
                (|GUESS;checkInterpolant| |list| |o|
                 (SPADCALL (SPADCALL M |i| (QREFELT $ 589)) (QREFELT $ 590)) D
                 |options| |guessDegree| $)
                0)
               (LETT |rl| (CONS |i| |rl|) . #15#)))))
           (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND ((NULL |rl|) (MAKE-ARRAY 0))
             (#16#
              (SEQ (LETT |rl| (NREVERSE |rl|) . #15#)
                   (LETT |m| (QVSIZE M) . #15#)
                   (LETT |Mr|
                         (SPADCALL |m| (LENGTH |rl|) (|spadConstant| $ 591)
                                   (QREFELT $ 592))
                         . #15#)
                   (SEQ (LETT |i2| NIL . #15#) (LETT #4# |rl| . #15#)
                        (LETT |i1| 1 . #15#) (LETT #3# (LENGTH |rl|) . #15#)
                        G190
                        (COND
                         ((OR (|greater_SI| |i1| #3#) (ATOM #4#)
                              (PROGN (LETT |i2| (CAR #4#) . #15#) NIL))
                          (GO G191)))
                        (SEQ
                         (COND
                          ((|HasCategory| (QREFELT $ 7) '(|Field|))
                           (SEQ (LETT |c| (|spadConstant| $ 48) . #15#)
                                (EXIT
                                 (SEQ (LETT |j| 1 . #15#) G190
                                      (COND
                                       ((OR (|greater_SI| |j| |m|)
                                            (NULL
                                             (SPADCALL |c| (QREFELT $ 168))))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |c|
                                              (SPADCALL
                                               (SPADCALL M |j| |i2|
                                                         (QREFELT $ 593))
                                               (QREFELT $ 164))
                                              . #15#)))
                                      (LETT |j| (|inc_SI| |j|) . #15#)
                                      (GO G190) G191 (EXIT NIL)))))
                          ('T
                           (SEQ
                            (LETT |cl|
                                  (PROGN
                                   (LETT #2# NIL . #15#)
                                   (SEQ (LETT |j| 1 . #15#) G190
                                        (COND
                                         ((|greater_SI| |j| |m|) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL M |j| |i2|
                                                            (QREFELT $ 593))
                                                  (QREFELT $ 594))
                                                 #2#)
                                                . #15#)))
                                        (LETT |j| (|inc_SI| |j|) . #15#)
                                        (GO G190) G191 (EXIT (NREVERSE #2#))))
                                  . #15#)
                            (EXIT
                             (LETT |c| (SPADCALL |cl| (QREFELT $ 595))
                                   . #15#)))))
                         (EXIT
                          (SEQ (LETT |j| 1 . #15#) G190
                               (COND ((|greater_SI| |j| |m|) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SPADCALL |Mr| |j| |i1|
                                           (PROG2
                                               (LETT #1#
                                                     (SPADCALL
                                                      (SPADCALL M |j| |i2|
                                                                (QREFELT $
                                                                         593))
                                                      |c| (QREFELT $ 596))
                                                     . #15#)
                                               (QCDR #1#)
                                             (|check_union| (QEQCAR #1# 0)
                                                            (|SparseUnivariatePolynomial|
                                                             (QREFELT $ 7))
                                                            #1#))
                                           (QREFELT $ 597))))
                               (LETT |j| (|inc_SI| |j|) . #15#) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |i1|
                              (PROG1 (|inc_SI| |i1|)
                                (LETT #4# (CDR #4#) . #15#))
                              . #15#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |Mr|))))))))) 

(DEFUN |GUESS;guessInterpolate3|
       (|lists| |o| |degreeLoss| |guessDegree| D |options| |vs| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|GUESS;guessInterpolate3!1|
             (VECTOR |options| D |guessDegree| |degreeLoss| |o| |lists| $
                     |vs|))
       (QREFELT $ 611)))))) 

(DEFUN |GUESS;guessInterpolate3!1| ($$)
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
      (PROG (|degs| M0 #2=#:G1574 M)
        (RETURN
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL |vs| (QREFELT $ 598))
                 (SPADCALL |vs| (QREFELT $ 601)))
             (SPADCALL (QREFELT $ 600)))
            ('T
             (SEQ (LETT |degs| (SPADCALL |vs| (QREFELT $ 602)) NIL)
                  (LETT M0
                        (|GUESS;guessInterpolateModular| |lists| |degs| |o|
                         |degreeLoss| |guessDegree| D |options| $)
                        NIL)
                  (LETT M
                        (COND
                         ((QEQCAR M0 1)
                          (SEQ
                           (COND
                            ((QCDR M0)
                             (COND
                              ((SPADCALL (CONS #'|GUESS;guessInterpolate3!0| $)
                                         |degs| (QREFELT $ 607))
                               (EXIT
                                (|GUESS;guessInterpolateFFFG| |lists| |degs|
                                 |o| |guessDegree| D |options| $))))))
                           (EXIT
                            (PROGN
                             (LETT #2#
                                   (|GUESS;guessInterpolate3| |lists| |o|
                                    |degreeLoss| |guessDegree| D |options|
                                    (SPADCALL |vs| (QREFELT $ 608)) $)
                                   NIL)
                             (GO #2#)))))
                         ('T (QCDR M0)))
                        NIL)
                  (EXIT
                   (SPADCALL M
                             (|GUESS;guessInterpolate3| |lists| |o|
                              |degreeLoss| |guessDegree| D |options|
                              (SPADCALL |vs| (QREFELT $ 608)) $)
                             (QREFELT $ 609)))))))
          #2# (EXIT #2#)))))))) 

(DEFUN |GUESS;guessInterpolate3!0| (|x| $)
  (SPADCALL |x| (|spadConstant| $ 275) (QREFELT $ 605))) 

(DEFUN |GUESS;listDecr| (|l| $)
  (SPADCALL (CONS #'|GUESS;listDecr!0| $) |l| (QREFELT $ 614))) 

(DEFUN |GUESS;listDecr!0| (|x| $)
  (SPADCALL |x| (|spadConstant| $ 360) (QREFELT $ 219))) 

(DEFUN |GUESS;guessInterpolate2|
       (|lists| |o| |degreeLoss| |guessDegree| D |options| $)
  (PROG (|vs| |vs0| |maxD| |maxD0|)
    (RETURN
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
                               (QREFELT $ 616))
                     . #1#)
               (EXIT
                (SPADCALL (CONS (|function| |GUESS;listDecr|) $) |vs0|
                          (QREFELT $ 619)))))
             (#2# (SPADCALL NIL (SPADCALL (QREFELT $ 620)) (QREFELT $ 621))))
            . #1#)
      (EXIT
       (|GUESS;guessInterpolate3| |lists| |o| |degreeLoss| |guessDegree| D
        |options| |vs| $)))))) 

(DEFUN |GUESS;guessHPaux| (|lists| D |options| $)
  (PROG (#1=#:G1650 |reslist| |res| #2=#:G1652 |i| |exprList| MS M #3=#:G1644
         #4=#:G1637 #5=#:G1651 #6=#:G1607 #7=#:G1600 |maxD| |guessDegree|
         |degreeLoss| #8=#:G1648 #9=#:G1591 |o| |exprS| #10=#:G1590 |dk|
         |degreeS| |op| |listDegree| |list|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |reslist| NIL . #11=(|GUESS;guessHPaux|))
            (LETT |list| (|SPADfirst| |lists|) . #11#)
            (LETT |listDegree|
                  (- (- (LENGTH |list|) 1)
                     (SPADCALL |options| (QREFELT $ 217)))
                  . #11#)
            (COND
             ((< |listDegree| 0) (PROGN (LETT #1# |reslist| . #11#) (GO #1#))))
            (LETT |op|
                  (SPADCALL (SPADCALL |options| (QREFELT $ 622))
                            (QREFELT $ 623))
                  . #11#)
            (LETT |degreeS| (QVELT D 0) . #11#)
            (LETT |dk| (SPADCALL |options| (QREFELT $ 383)) . #11#)
            (LETT |exprS|
                  (SEQ
                   (EXIT
                    (COND
                     ((OR (EQUAL |dk| '|displayAsGF|)
                          (EQUAL |dk| '|displayAsEQ|))
                      (SPADCALL
                       (SPADCALL |op|
                                 (SPADCALL (SPADCALL |options| (QREFELT $ 554))
                                           (QREFELT $ 39))
                                 (QREFELT $ 624))
                       (SPADCALL |options| (QREFELT $ 554)) (QVELT D 4)))
                     ((EQUAL |dk| '|displayAsRec|)
                      (PROGN
                       (LETT #10#
                             (SPADCALL
                              (SPADCALL |op|
                                        (SPADCALL
                                         (SPADCALL |options| (QREFELT $ 66))
                                         (QREFELT $ 39))
                                        (QREFELT $ 624))
                              (SPADCALL |options| (QREFELT $ 66)) (QVELT D 4))
                             . #11#)
                       (GO #10#)))))
                   #10# (EXIT #10#))
                  . #11#)
            (SEQ
             (EXIT
              (SEQ (LETT |o| 2 . #11#) G190 NIL
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL |degreeS|
                                  (PROG1 (LETT #9# (- |o| 1) . #11#)
                                    (|check_subtype| (>= #9# 0)
                                                     '(|NonNegativeInteger|)
                                                     #9#))
                                  (QREFELT $ 625))
                        (QREFELT $ 626))
                       (PROGN (LETT #8# |$NoValue| . #11#) (GO #8#)))
                      ('T
                       (SEQ
                        (LETT |degreeLoss|
                              (SPADCALL |degreeS| |o| (QREFELT $ 442)) . #11#)
                        (LETT |guessDegree|
                              (- (- (+ |listDegree| 2) |degreeLoss|) |o|)
                              . #11#)
                        (COND
                         ((< |guessDegree| 0)
                          (SEQ
                           (COND
                            ((SPADCALL |options| (QREFELT $ 67))
                             (SPADCALL "Guess: not enough values for guessing"
                                       (QREFELT $ 79))))
                           (EXIT
                            (PROGN (LETT #1# |reslist| . #11#) (GO #1#))))))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 67))
                          (SPADCALL
                           (SPADCALL
                            (LIST "Guess: trying order "
                                  (SPADCALL |o| (QREFELT $ 180))
                                  ", guessDegree is "
                                  (SPADCALL |guessDegree| (QREFELT $ 552)))
                            (QREFELT $ 627))
                           (QREFELT $ 73))))
                        (LETT |maxD| (SPADCALL |options| (QREFELT $ 179))
                              . #11#)
                        (EXIT
                         (COND
                          ((QEQCAR |maxD| 0)
                           (COND
                            ((OR
                              (OR
                               (SPADCALL
                                (SPADCALL |degreeS| |o| (QREFELT $ 625))
                                (QREFELT $ 626))
                               (NULL (< (* (QCDR |maxD|) |o|) |guessDegree|)))
                              (NULL
                               (SPADCALL (* (QCDR |maxD|) (+ |o| 1))
                                         (-
                                          (- (+ |listDegree| 2)
                                             (SPADCALL |degreeS| (+ |o| 1)
                                                       (QREFELT $ 442)))
                                          (+ |o| 1))
                                         (QREFELT $ 338))))
                             (SEQ (LETT |exprList| NIL . #11#)
                                  (COND
                                   ((SPADCALL |options| (QREFELT $ 67))
                                    (SEQ
                                     (LETT |exprList|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |exprS| |o|
                                                       (QREFELT $ 628))
                                             (QREFELT $ 629))
                                            (QREFELT $ 630))
                                           . #11#)
                                     (SPADCALL
                                      #12="Guess: The list of expressions is"
                                      (QREFELT $ 79))
                                     (EXIT
                                      (SPADCALL
                                       (SPADCALL |exprList| (QREFELT $ 631))
                                       (QREFELT $ 73))))))
                                  (LETT MS
                                        (|GUESS;guessInterpolate2| |lists| |o|
                                         |degreeLoss|
                                         (PROG1 (LETT #7# |guessDegree| . #11#)
                                           (|check_subtype| (>= #7# 0)
                                                            '(|NonNegativeInteger|)
                                                            #7#))
                                         D |options| $)
                                        . #11#)
                                  (EXIT
                                   (SEQ
                                    (EXIT
                                     (SEQ G190 NIL
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL MS (QREFELT $ 632))
                                              (PROGN
                                               (LETT #6# |$NoValue| . #11#)
                                               (GO #6#)))
                                             ('T
                                              (SEQ
                                               (LETT M
                                                     (SPADCALL MS
                                                               (QREFELT $ 633))
                                                     . #11#)
                                               (LETT MS
                                                     (SPADCALL MS
                                                               (QREFELT $ 634))
                                                     . #11#)
                                               (COND
                                                ((NULL |exprList|)
                                                 (LETT |exprList|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |exprS| |o|
                                                                   (QREFELT $
                                                                            628))
                                                         (QREFELT $ 629))
                                                        (QREFELT $ 630))
                                                       . #11#)))
                                               (SEQ (LETT |i| 1 . #11#)
                                                    (LETT #5#
                                                          (SPADCALL M
                                                                    (QREFELT $
                                                                             588))
                                                          . #11#)
                                                    G190
                                                    (COND
                                                     ((|greater_SI| |i| #5#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |res|
                                                           (|GUESS;wrapInterpolant|
                                                            (SPADCALL
                                                             (SPADCALL M |i|
                                                                       (QREFELT
                                                                        $ 589))
                                                             (QREFELT $ 590))
                                                            |exprList| |list| D
                                                            |op| |options| $)
                                                           . #11#)
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
                                                              . #11#)))))
                                                    (LETT |i| (|inc_SI| |i|)
                                                          . #11#)
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (COND
                                                 ((NULL (NULL |reslist|))
                                                  (COND
                                                   ((SPADCALL |options|
                                                              (QREFELT $ 75))
                                                    (PROGN
                                                     (LETT #1# |reslist|
                                                           . #11#)
                                                     (GO #1#))))))))))))
                                          NIL (GO G190) G191 (EXIT NIL)))
                                    #6# (EXIT #6#)))))
                            ('T
                             (SEQ (|spadConstant| $ 11)
                                  (EXIT
                                   (COND
                                    ((SPADCALL |options| (QREFELT $ 67))
                                     (SPADCALL "Guess: iterating"
                                               (QREFELT $ 79)))))))))
                          ('T
                           (SEQ (LETT |exprList| NIL . #11#)
                                (COND
                                 ((SPADCALL |options| (QREFELT $ 67))
                                  (SEQ
                                   (LETT |exprList|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |exprS| |o|
                                                     (QREFELT $ 628))
                                           (QREFELT $ 629))
                                          (QREFELT $ 630))
                                         . #11#)
                                   (SPADCALL #12# (QREFELT $ 79))
                                   (EXIT
                                    (SPADCALL
                                     (SPADCALL |exprList| (QREFELT $ 631))
                                     (QREFELT $ 73))))))
                                (LETT MS
                                      (|GUESS;guessInterpolate2| |lists| |o|
                                       |degreeLoss|
                                       (PROG1 (LETT #4# |guessDegree| . #11#)
                                         (|check_subtype| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          #4#))
                                       D |options| $)
                                      . #11#)
                                (EXIT
                                 (SEQ
                                  (EXIT
                                   (SEQ G190 NIL
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL MS (QREFELT $ 632))
                                            (PROGN
                                             (LETT #3# |$NoValue| . #11#)
                                             (GO #3#)))
                                           ('T
                                            (SEQ
                                             (LETT M
                                                   (SPADCALL MS
                                                             (QREFELT $ 633))
                                                   . #11#)
                                             (LETT MS
                                                   (SPADCALL MS
                                                             (QREFELT $ 634))
                                                   . #11#)
                                             (COND
                                              ((NULL |exprList|)
                                               (LETT |exprList|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |exprS| |o|
                                                                 (QREFELT $
                                                                          628))
                                                       (QREFELT $ 629))
                                                      (QREFELT $ 630))
                                                     . #11#)))
                                             (SEQ (LETT |i| 1 . #11#)
                                                  (LETT #2#
                                                        (SPADCALL M
                                                                  (QREFELT $
                                                                           588))
                                                        . #11#)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |i| #2#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |res|
                                                         (|GUESS;wrapInterpolant|
                                                          (SPADCALL
                                                           (SPADCALL M |i|
                                                                     (QREFELT $
                                                                              589))
                                                           (QREFELT $ 590))
                                                          |exprList| |list| D
                                                          |op| |options| $)
                                                         . #11#)
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
                                                            . #11#)))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #11#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL (NULL |reslist|))
                                                (COND
                                                 ((SPADCALL |options|
                                                            (QREFELT $ 75))
                                                  (PROGN
                                                   (LETT #1# |reslist| . #11#)
                                                   (GO #1#))))))))))))
                                        NIL (GO G190) G191 (EXIT NIL)))
                                  #3# (EXIT #3#))))))))))))
                   (LETT |o| (|inc_SI| |o|) . #11#) (GO G190) G191 (EXIT NIL)))
             #8# (EXIT #8#))
            (EXIT |reslist|)))
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;processOptions| (|options| $)
  (PROG (#1=#:G1701 #2=#:G1696 #3=#:G1694 #4=#:G1704 #5=#:G1660 |i| #6=#:G1703
         |minP| |hom?| #7=#:G1669 #8=#:G1702 |maxSomos| #9=#:G1654 #10=#:G1665
         #11=#:G1663 |maxD| #12=#:G1657 |Som?|)
    (RETURN
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
                       (|check_union| (QEQCAR #12# 0) (|NonNegativeInteger|)
                                      #12#))
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
                              (COND ((|greater_SI| |i| |maxSomos|) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS
                                       (|GUESS;processOptions|
                                        (CONS
                                         (SPADCALL
                                          (CONS 0
                                                (PROG1 (LETT #7# |i| . #13#)
                                                  (|check_subtype| (> #7# 0)
                                                                   '(|PositiveInteger|)
                                                                   #7#)))
                                          (QREFELT $ 635))
                                         |options|)
                                        $)
                                       #8#)
                                      . #13#)))
                              (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        (QREFELT $ 637))
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
                                                   (PROG1 (LETT #3# |i| . #13#)
                                                     (|check_subtype| (> #3# 0)
                                                                      '(|PositiveInteger|)
                                                                      #3#)))
                                             (QREFELT $ 638))
                                            (SPADCALL
                                             (CONS 0
                                                   (PROG1 (LETT #2# |i| . #13#)
                                                     (|check_subtype| (> #2# 0)
                                                                      '(|PositiveInteger|)
                                                                      #2#)))
                                             (QREFELT $ 639)))
                                           |options| (QREFELT $ 640))
                                          #6#)
                                         . #13#)))
                                 (LETT |i| (+ |i| 1) . #13#) (GO G190) G191
                                 (EXIT (NREVERSE #6#))))
                           . #13#)
                     (GO #1#))))))))))
        (EXIT (LIST |options|))))
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;guessAlgDep;LLL;128| (|lists| |options| $)
  (PROG (|lres| #1=#:G1718 |res| #2=#:G1720 |opts| |lopts| #3=#:G1710
         #4=#:G1706 #5=#:G1719 |li| |nn| |rl| |l|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (SPADCALL |options| (QREFELT $ 641))
            (EXIT
             (COND
              ((NULL |lists|) (|error| "guessAlgDep: need at least one list"))
              ('T
               (SEQ
                (LETT |l| (|SPADfirst| |lists|)
                      . #6=(|GUESS;guessAlgDep;LLL;128|))
                (LETT |rl| (CDR |lists|) . #6#) (LETT |nn| (LENGTH |l|) . #6#)
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
                       (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL)))
                 #4# (EXIT #4#))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (APPEND
                        (LIST (SPADCALL '|displayAsEQ| (QREFELT $ 642))
                              (SPADCALL
                               (CONS 0
                                     (PROG1 (LETT #3# (LENGTH |lists|) . #6#)
                                       (|check_subtype| (> #3# 0)
                                                        '(|PositiveInteger|)
                                                        #3#)))
                               (QREFELT $ 643)))
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
                             (SPADCALL |lists| |opts| (QREFELT $ 410)) |opts|
                             $)
                            . #6#)
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 75))
                          (PROGN (LETT #1# |res| . #6#) (GO #1#))))))
                      (EXIT (LETT |lres| (APPEND |res| |lres|) . #6#)))
                     (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;guessAlgDep;LL;129| (|lists| $)
  (SPADCALL |lists| NIL (QREFELT $ 644))) 

(DEFUN |GUESS;guessADE;LLL;130| (|list| |options| $)
  (PROG (|lres| #1=#:G1728 |res| #2=#:G1729 |opts| |lopts|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (SPADCALL |options| (QREFELT $ 641))
            (LETT |lopts|
                  (|GUESS;processOptions|
                   (CONS (SPADCALL '|displayAsGF| (QREFELT $ 642)) |options|)
                   $)
                  . #3=(|GUESS;guessADE;LLL;130|))
            (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
            (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
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
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;guessADE;LL;131| (|list| $) (SPADCALL |list| NIL (QREFELT $ 646))) 

(DEFUN |GUESS;guessAlg;LLL;132| (|list| |options| $)
  (SPADCALL |list| (CONS (SPADCALL (CONS 0 0) (QREFELT $ 648)) |options|)
            (QREFELT $ 646))) 

(DEFUN |GUESS;guessAlg;LL;133| (|list| $) (SPADCALL |list| NIL (QREFELT $ 649))) 

(DEFUN |GUESS;guessHolo;LLL;134| (|list| |options| $)
  (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 639)) |options|)
            (QREFELT $ 646))) 

(DEFUN |GUESS;guessHolo;LL;135| (|list| $)
  (SPADCALL |list| NIL (QREFELT $ 651))) 

(DEFUN |GUESS;guessPade;LLL;136| (|list| |options| $)
  (PROG (|opts|)
    (RETURN
     (SEQ
      (LETT |opts|
            (SPADCALL
             (LIST
              (LIST (SPADCALL (CONS 0 0) (QREFELT $ 648))
                    (SPADCALL (CONS 0 1) (QREFELT $ 639)))
              |options| (LIST (SPADCALL 'T (QREFELT $ 653))))
             (QREFELT $ 654))
            |GUESS;guessPade;LLL;136|)
      (EXIT (SPADCALL |list| |opts| (QREFELT $ 646))))))) 

(DEFUN |GUESS;guessPade;LL;137| (|list| $)
  (SPADCALL |list| NIL (QREFELT $ 655))) 

(DEFUN |GUESS;guessFE;LLL;138| (|list| |options| $)
  (PROG (|lres| #1=#:G1756 |res| #2=#:G1757 |opts| |lopts|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (SPADCALL |options| (QREFELT $ 641))
            (LETT |lopts|
                  (|GUESS;processOptions|
                   (CONS (SPADCALL '|displayAsGF| (QREFELT $ 642)) |options|)
                   $)
                  . #3=(|GUESS;guessFE;LLL;138|))
            (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
            (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
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
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;guessFE;LL;139| (|list| $) (SPADCALL |list| NIL (QREFELT $ 657))) 

(DEFUN |GUESS;guessADE;SM;140| (|q| $)
  (PROG () (RETURN (SEQ (CONS #'|GUESS;guessADE;SM;140!0| (VECTOR |q| $)))))) 

(DEFUN |GUESS;guessADE;SM;140!0| (|list| |options| $$)
  (PROG ($ |q|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessADE;SM;140|))
    (LETT |q| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|lres| #2=#:G1765 |res| #3=#:G1766 |opts| |lopts|)
        (RETURN
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 641))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (SPADCALL (SPADCALL '|displayAsGF| (QREFELT $ 642))
                                 |options| (QREFELT $ 659))
                       $)
                      NIL)
                (LETT |lres| NIL NIL) (LETT |res| NIL NIL)
                (SEQ (LETT |opts| NIL NIL) (LETT #3# |lopts| NIL) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |opts| (CAR #3#) NIL) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (SPADCALL |q| (QREFELT $ 424)))
                             |opts| $)
                            NIL)
                      (COND
                       ((NULL (SPADCALL |res| (QREFELT $ 660)))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 75))
                          (PROGN (LETT #2# |res| NIL) (GO #2#))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 661))
                             NIL)))
                     (LETT #3# (CDR #3#) NIL) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |lres| (QREFELT $ 662)))))
          #2# (EXIT #2#)))))))) 

(DEFUN |GUESS;guessHolo;SM;141| (|q| $)
  (PROG () (RETURN (CONS #'|GUESS;guessHolo;SM;141!0| (VECTOR |q| $))))) 

(DEFUN |GUESS;guessHolo;SM;141!0| (|z1| |z2| $$)
  (PROG ($ |q|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessHolo;SM;141|))
    (LETT |q| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1|
                (SPADCALL
                 (SPADCALL (CONS 0 (|spadConstant| $ 108)) (QREFELT $ 639))
                 |z2| (QREFELT $ 659))
                (SPADCALL |q| (QREFELT $ 663))))))) 

(DEFUN |GUESS;guessRec;LLL;142| (|list| |options| $)
  (PROG (|lres| #1=#:G1779 |res| #2=#:G1780 |opts| |lopts|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (SPADCALL |options| (QREFELT $ 641))
            (LETT |lopts|
                  (|GUESS;processOptions|
                   (CONS (SPADCALL '|displayAsRec| (QREFELT $ 642)) |options|)
                   $)
                  . #3=(|GUESS;guessRec;LLL;142|))
            (LETT |lres| NIL . #3#) (LETT |res| NIL . #3#)
            (SEQ (LETT |opts| NIL . #3#) (LETT #2# |lopts| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#) . #3#) NIL))
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
      #1# (EXIT #1#))))) 

(DEFUN |GUESS;guessRec;LL;143| (|list| $) (SPADCALL |list| NIL (QREFELT $ 665))) 

(DEFUN |GUESS;guessPRec;LLL;144| (|list| |options| $)
  (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 639)) |options|)
            (QREFELT $ 665))) 

(DEFUN |GUESS;guessPRec;LL;145| (|list| $)
  (SPADCALL |list| NIL (QREFELT $ 667))) 

(DEFUN |GUESS;guessRat;LLL;146| (|list| |options| $)
  (PROG (|opts|)
    (RETURN
     (SEQ
      (LETT |opts|
            (SPADCALL
             (LIST
              (LIST (SPADCALL (CONS 0 0) (QREFELT $ 669))
                    (SPADCALL (CONS 0 1) (QREFELT $ 639)))
              |options| (LIST (SPADCALL 'T (QREFELT $ 653))))
             (QREFELT $ 654))
            |GUESS;guessRat;LLL;146|)
      (EXIT (SPADCALL |list| |opts| (QREFELT $ 665))))))) 

(DEFUN |GUESS;guessRat;LL;147| (|list| $) (SPADCALL |list| NIL (QREFELT $ 112))) 

(DEFUN |GUESS;guessRec;SM;148| (|q| $)
  (PROG () (RETURN (SEQ (CONS #'|GUESS;guessRec;SM;148!0| (VECTOR |q| $)))))) 

(DEFUN |GUESS;guessRec;SM;148!0| (|list| |options| $$)
  (PROG ($ |q|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessRec;SM;148|))
    (LETT |q| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|lres| #2=#:G1802 |res| #3=#:G1803 |opts| |lopts|)
        (RETURN
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 641))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (SPADCALL (SPADCALL '|displayAsRec| (QREFELT $ 642))
                                 |options| (QREFELT $ 659))
                       $)
                      NIL)
                (LETT |lres| NIL NIL) (LETT |res| NIL NIL)
                (SEQ (LETT |opts| NIL NIL) (LETT #3# |lopts| NIL) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |opts| (CAR #3#) NIL) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (SPADCALL |q| (QREFELT $ 494)))
                             |opts| $)
                            NIL)
                      (COND
                       ((NULL (SPADCALL |res| (QREFELT $ 660)))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 75))
                          (PROGN (LETT #2# |res| NIL) (GO #2#))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 661))
                             NIL)))
                     (LETT #3# (CDR #3#) NIL) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |lres| (QREFELT $ 662)))))
          #2# (EXIT #2#)))))))) 

(DEFUN |GUESS;guessPRec;SM;149| (|q| $)
  (PROG () (RETURN (CONS #'|GUESS;guessPRec;SM;149!0| (VECTOR |q| $))))) 

(DEFUN |GUESS;guessPRec;SM;149!0| (|z1| |z2| $$)
  (PROG ($ |q|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessPRec;SM;149|))
    (LETT |q| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1|
                (SPADCALL
                 (SPADCALL (CONS 0 (|spadConstant| $ 108)) (QREFELT $ 639))
                 |z2| (QREFELT $ 659))
                (SPADCALL |q| (QREFELT $ 671))))))) 

(DEFUN |GUESS;guessRat;SM;150| (|q| $)
  (PROG () (RETURN (CONS #'|GUESS;guessRat;SM;150!0| (VECTOR |q| $))))) 

(DEFUN |GUESS;guessRat;SM;150!0| (|z1| |z2| $$)
  (PROG ($ |q|)
    (LETT $ (QREFELT $$ 1) . #1=(|GUESS;guessRat;SM;150|))
    (LETT |q| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1|
                (SPADCALL
                 (LIST
                  (LIST
                   (SPADCALL (CONS 0 (|spadConstant| $ 275)) (QREFELT $ 669))
                   (SPADCALL (CONS 0 (|spadConstant| $ 108)) (QREFELT $ 639)))
                  |z2|
                  (LIST (SPADCALL (|spadConstant| $ 673) (QREFELT $ 653))))
                 (QREFELT $ 654))
                (SPADCALL |q| (QREFELT $ 671))))))) 

(DECLAIM (NOTINLINE |Guess;|)) 

(DEFUN |Guess| (&REST #1=#:G1818)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1819)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache| '|Guess|)
                                           '|domainEqualList|)
                . #3=(|Guess|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |Guess;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Guess|))))))))))) 

(DEFUN |Guess;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Guess|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|Guess| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
      (LETT $ (GETREFV 675) . #1#)
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
                    (CONS (|dispatchFunction| |GUESS;guessExpRat;SM;27|)
                          $))))))
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
           (QSETREFV $ 663
                     (CONS (|dispatchFunction| |GUESS;guessADE;SM;140|) $))
           (QSETREFV $ 664
                     (CONS (|dispatchFunction| |GUESS;guessHolo;SM;141|)
                           $)))))))
      (COND
       ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
        (COND
         ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
          (PROGN
           (QSETREFV $ 671
                     (CONS (|dispatchFunction| |GUESS;guessRec;SM;148|) $))
           (QSETREFV $ 672
                     (CONS (|dispatchFunction| |GUESS;guessPRec;SM;149|) $))
           (QSETREFV $ 674
                     (CONS (|dispatchFunction| |GUESS;guessRat;SM;150|)
                           $)))))))
      $)))) 

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
              (872 . |inc|) (|Mapping| 13 13) (|Stream| 13) (877 . |generate|)
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
              (2126 . |generalInterpolation|) (2134 . |ncols|)
              (2139 . |column|) (2145 . |entries|) (2150 . |Zero|)
              (2154 . |new|) (2161 . |elt|) (2168 . |content|) (2173 . |gcd|)
              (2178 . |exquo|) (2184 . |setelt|) (2192 . |explicitlyEmpty?|)
              (|Stream| 582) (2197 . |empty|) (2201 . |empty?|) (2206 . |frst|)
              (2211 . |Zero|) (2215 . |Zero|) (2219 . >=) (|Mapping| 50 13)
              (2225 . |every?|) (2231 . |rst|) (2236 . |concat|) (|Mapping| $)
              (2242 . |delay|) (|Mapping| 13 126) (|ListFunctions2| 126 13)
              (2247 . |map|) (|Stream| 488) (2253 . |genVectorStream|)
              (|Mapping| 14 488) (|StreamFunctions2| 488 14) (2260 . |map|)
              (2266 . |empty|) (2270 . |concat|) (2276 . |functionName|)
              (2281 . |operator|) (2286 . |elt|) (2292 . |rest|)
              (2298 . |empty?|) (2303 . |hconcat|) (2308 . |first|)
              (2314 . |complete|) (2319 . |entries|) (2324 . |coerce|)
              (2329 . |empty?|) (2334 . |first|) (2339 . |rst|)
              (2344 . |Somos|) (|List| 63) (2349 . |concat|)
              (2354 . |homogeneous|) (2359 . |maxPower|) (2364 . |concat|)
              (2370 . |checkOptions|) (2375 . |displayKind|)
              (2380 . |maxSubst|) |GUESS;guessAlgDep;LLL;128|
              |GUESS;guessAlgDep;LL;129| |GUESS;guessADE;LLL;130|
              |GUESS;guessADE;LL;131| (2385 . |maxDerivative|)
              |GUESS;guessAlg;LLL;132| |GUESS;guessAlg;LL;133|
              |GUESS;guessHolo;LLL;134| |GUESS;guessHolo;LL;135|
              (2390 . |allDegrees|) (2395 . |concat|) |GUESS;guessPade;LLL;136|
              |GUESS;guessPade;LL;137| |GUESS;guessFE;LLL;138|
              |GUESS;guessFE;LL;139| (2400 . |cons|) (2406 . |empty?|)
              (2411 . |append|) (2417 . |reverse!|) (2422 . |guessADE|)
              (2427 . |guessHolo|) |GUESS;guessRec;LLL;142|
              |GUESS;guessRec;LL;143| |GUESS;guessPRec;LLL;144|
              |GUESS;guessPRec;LL;145| (2432 . |maxShift|)
              |GUESS;guessRat;LL;147| (2437 . |guessRec|) (2442 . |guessPRec|)
              (2447 . |true|) (2451 . |guessRat|))
           '#(|substHP| 2456 |shiftHP| 2461 |guessRec| 2471 |guessRat| 2487
              |guessPade| 2503 |guessPRec| 2514 |guessHolo| 2530 |guessFE| 2546
              |guessExpRat| 2557 |guessBinRat| 2573 |guessAlgDep| 2589
              |guessAlg| 2600 |guessADE| 2611 |guess| 2627 |diffHP| 2653
              |algDepHP| 2663)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 674
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
                                                   584 488 587 1 582 126 0 588
                                                   2 582 520 0 13 589 1 520 519
                                                   0 590 0 59 0 591 3 582 0 126
                                                   126 59 592 3 582 59 0 13 13
                                                   593 1 59 7 0 594 1 7 0 476
                                                   595 2 59 170 0 7 596 4 582
                                                   59 0 13 13 59 597 1 252 50 0
                                                   598 0 599 0 600 1 252 50 0
                                                   601 1 252 14 0 602 0 13 0
                                                   603 0 508 0 604 2 13 50 0 0
                                                   605 2 14 50 606 0 607 1 252
                                                   0 0 608 2 599 0 582 0 609 1
                                                   599 0 610 611 2 613 14 612
                                                   488 614 3 377 615 126 126
                                                   126 616 2 618 252 617 615
                                                   619 0 252 0 620 2 252 0 14 0
                                                   621 1 64 38 63 622 1 558 0
                                                   38 623 2 8 0 558 0 624 2 370
                                                   0 0 126 625 1 370 50 0 626 1
                                                   68 0 476 627 2 364 0 0 126
                                                   628 1 364 0 0 629 1 364 40 0
                                                   630 1 40 68 0 631 1 599 50 0
                                                   632 1 599 582 0 633 1 599 0
                                                   0 634 1 88 0 248 635 1 636 0
                                                   476 637 1 88 0 248 638 1 88
                                                   0 246 639 2 63 0 0 0 640 1
                                                   64 71 63 641 1 88 0 38 642 1
                                                   88 0 246 643 1 88 0 62 648 1
                                                   88 0 50 653 1 63 0 476 654 2
                                                   63 0 88 0 659 1 40 50 0 660
                                                   2 40 0 0 0 661 1 40 0 0 662
                                                   1 0 91 38 663 1 0 91 38 664
                                                   1 88 0 62 669 1 0 91 38 671
                                                   1 0 91 38 672 0 50 0 673 1 0
                                                   91 38 674 1 0 398 63 413 1 1
                                                   423 38 494 1 0 398 63 446 1
                                                   1 91 38 671 2 0 40 33 63 665
                                                   1 0 40 33 666 1 1 91 38 674
                                                   2 0 40 33 63 112 1 0 40 33
                                                   670 2 0 40 33 63 655 1 0 40
                                                   33 656 1 1 91 38 672 1 0 40
                                                   33 668 2 0 40 33 63 667 1 1
                                                   91 38 664 1 0 40 33 652 2 0
                                                   40 33 63 651 2 0 40 33 63
                                                   657 1 0 40 33 658 1 1 91 38
                                                   225 2 0 40 33 63 224 1 0 40
                                                   33 223 1 1 91 38 245 1 0 40
                                                   33 239 2 0 40 33 63 240 1 0
                                                   40 406 645 2 0 40 406 63 644
                                                   1 0 40 33 650 2 0 40 33 63
                                                   649 1 1 91 38 663 2 0 40 33
                                                   63 646 1 0 40 33 647 2 0 40
                                                   33 63 114 1 0 40 33 113 4 0
                                                   40 33 92 21 63 93 3 0 40 33
                                                   92 21 115 1 1 423 38 424 1 0
                                                   398 63 399 2 0 398 406 63
                                                   410)))))
           '|lookupComplete|)) 
