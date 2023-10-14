
(SDEFUN |GUESSEB;ord1| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG
         ((#1=#:G149 NIL) (|k| NIL) (#2=#:G148 NIL) (|j| NIL) (#3=#:G147 NIL)
          (#4=#:G146 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (- (- (LENGTH |x|) 3) |i|) . #5=(|GUESSEB;ord1|))
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

(SDEFUN |GUESSEB;ord2| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG ((|j| NIL) (#1=#:G156 NIL) (|n| (|Integer|)))
               (SEQ
                (COND
                 ((ZEROP |i|)
                  (SEQ
                   (LETT |n| (- (- (LENGTH |x|) 3) |i|) . #2=(|GUESSEB;ord2|))
                   (EXIT
                    (+ (|GUESSEB;ord1| |x| |i| $)
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
                 ('T (|GUESSEB;ord1| |x| |i| $)))))) 

(SDEFUN |GUESSEB;deg1| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG
         ((#1=#:G171 NIL) (|k| NIL) (#2=#:G170 NIL) (|j| NIL) (#3=#:G169 NIL)
          (#4=#:G168 NIL) (|m| (|Integer|)))
         (SEQ (LETT |m| (- (LENGTH |x|) 3) . #5=(|GUESSEB;deg1|))
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

(SDEFUN |GUESSEB;deg2| ((|x| |List| (|Integer|)) (|i| |Integer|) ($ |Integer|))
        (SPROG ((|j| NIL) (#1=#:G177 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (- (LENGTH |x|) 3) . #2=(|GUESSEB;deg2|))
                    (EXIT
                     (+ (|GUESSEB;deg1| |x| |i| $)
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

(SDEFUN |GUESSEB;checkResult|
        ((|res| EXPRR) (|n| |Symbol|) (|l| |Integer|) (|list| |List| F)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G184 NIL) (#2=#:G179 NIL) (|num| (EXPRR)) (#3=#:G178 NIL)
          (|den| (EXPRR)) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| |l| . #4=(|GUESSEB;checkResult|)) G190
                 (COND ((< |i| 1) (GO G191)))
                 (SEQ
                  (LETT |den|
                        (SPADCALL (SPADCALL |res| (QREFELT $ 21))
                                  (SPADCALL |n| (QREFELT $ 23))
                                  (SPADCALL (- |i| 1) (QREFELT $ 24))
                                  (QREFELT $ 25))
                        . #4#)
                  (COND
                   ((SPADCALL |den| (|spadConstant| $ 28) (QREFELT $ 30))
                    (PROGN
                     (LETT #1#
                           (PROG1 (LETT #3# |i| . #4#)
                             (|check_subtype| (>= #3# 0)
                                              '(|NonNegativeInteger|) #3#))
                           . #4#)
                     (GO #5=#:G183))))
                  (LETT |num|
                        (SPADCALL (SPADCALL |res| (QREFELT $ 31))
                                  (SPADCALL |n| (QREFELT $ 23))
                                  (SPADCALL (- |i| 1) (QREFELT $ 24))
                                  (QREFELT $ 25))
                        . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |list| |i| (QREFELT $ 33))
                               (SPADCALL (SPADCALL |num| |den| (QREFELT $ 34))
                                         (QREFELT $ 9))
                               (QREFELT $ 35))
                     (PROGN
                      (LETT #1#
                            (PROG1 (LETT #2# |i| . #4#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#))
                            . #4#)
                      (GO #5#))))))
                 (LETT |i| (+ |i| -1) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |GUESSEB;SUPS2SUPF|
        ((|p| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| F))
        (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SPADCALL (ELT $ 37) |p| (QREFELT $ 42)))
              ('T
               (|error|
                "Guess: type parameter F should be either equal to S or equal                   to Fraction S")))) 

(SDEFUN |GUESSEB;F2FPOLYS|
        ((|p| F)
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (COND
         ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
          (SPADCALL (SPADCALL |p| (QREFELT $ 44)) (QREFELT $ 46)))
         ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
          (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 47)) (QREFELT $ 49))
                    (SPADCALL (SPADCALL |p| (QREFELT $ 50)) (QREFELT $ 49))
                    (QREFELT $ 52)))
         ('T
          (|error|
           "Guess: type parameter F should be either equal to S or equal                    to Fraction S")))) 

(SDEFUN |GUESSEB;SUPF2EXPRR|
        ((|xx| |Symbol|) (|p| |SparseUnivariatePolynomial| F) ($ EXPRR))
        (COND ((SPADCALL |p| (QREFELT $ 53)) (|spadConstant| $ 28))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 54)) (QREFELT $ 10))
                 (SPADCALL (SPADCALL |xx| (QREFELT $ 23))
                           (SPADCALL |p| (QREFELT $ 56)) (QREFELT $ 57))
                 (QREFELT $ 58))
                (|GUESSEB;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 59)) $)
                (QREFELT $ 60))))) 

(SDEFUN |GUESSEB;FSUPF2EXPRR|
        ((|xx| |Symbol|) (|p| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ EXPRR))
        (SPADCALL (|GUESSEB;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 62)) $)
                  (|GUESSEB;SUPF2EXPRR| |xx| (SPADCALL |p| (QREFELT $ 63)) $)
                  (QREFELT $ 34))) 

(SDEFUN |GUESSEB;POLYS2POLYF|
        ((|p| |SparseMultivariatePolynomial| S
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         ($ |SparseMultivariatePolynomial| F
          (|OrderedVariableList| (|construct| '|a1| 'A))))
        (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SPADCALL (ELT $ 37) |p| (QREFELT $ 65)))
              ('T
               (|error|
                "Guess: type parameter F should be either equal to S or equal                   to Fraction S")))) 

(SDEFUN |GUESSEB;SUPPOLYS2SUPF|
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
          (COND ((SPADCALL |p| (QREFELT $ 67)) (|spadConstant| $ 68))
                ('T
                 (SEQ
                  (LETT |lc|
                        (|GUESSEB;POLYS2POLYF| (SPADCALL |p| (QREFELT $ 69)) $)
                        |GUESSEB;SUPPOLYS2SUPF|)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |lc|
                                (LIST (SPADCALL 1 (QREFELT $ 71))
                                      (SPADCALL 2 (QREFELT $ 71)))
                                (LIST |a1v| |Av|) (QREFELT $ 73))
                      (QREFELT $ 74))
                     (SPADCALL |p| (QREFELT $ 75)) (QREFELT $ 76))
                    (|GUESSEB;SUPPOLYS2SUPF| (SPADCALL |p| (QREFELT $ 77))
                     |a1v| |Av| $)
                    (QREFELT $ 78))))))))) 

(SDEFUN |GUESSEB;SUPFPOLYS2FSUPPOLYS|
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
          (LETT |cden| (SPADCALL |p| (QREFELT $ 82))
                . #1=(|GUESSEB;SUPFPOLYS2FSUPPOLYS|))
          (LETT |pnum|
                (SPADCALL
                 (CONS #'|GUESSEB;SUPFPOLYS2FSUPPOLYS!0| (VECTOR $ |cden|)) |p|
                 (QREFELT $ 87))
                . #1#)
          (LETT |pden| (SPADCALL (QCDR |cden|) (QREFELT $ 88)) . #1#)
          (EXIT (SPADCALL |pnum| |pden| (QREFELT $ 90)))))) 

(SDEFUN |GUESSEB;SUPFPOLYS2FSUPPOLYS!0| ((|z1| NIL) ($$ NIL))
        (PROG (|cden| $)
          (LETT |cden| (QREFELT $$ 1) . #1=(|GUESSEB;SUPFPOLYS2FSUPPOLYS|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QCDR |cden|) (QREFELT $ 83))
                      (QREFELT $ 84)))))) 

(PUT '|GUESSEB;defaultD| '|SPADreplace| '(XLAM (|expr|) |expr|)) 

(SDEFUN |GUESSEB;defaultD| ((|expr| EXPRR) ($ EXPRR)) |expr|) 

(SDEFUN |GUESSEB;DN2DL| ((DN |Mapping| EXPRR EXPRR) (|i| |Integer|) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |i| (QREFELT $ 24)) DN) (QREFELT $ 9))) 

(SDEFUN |GUESSEB;evalResultant|
        ((|p1| |SparseMultivariatePolynomial| S
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|p2| |SparseMultivariatePolynomial| S
          (|OrderedVariableList| (|construct| '|a1| 'A)))
         (|o| |Integer|) (|d| |Integer|)
         (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A)) ($ |List| S))
        (SPROG
         ((|res| (|List| S)) (#1=#:G207 NIL) (#2=#:G205 NIL) (|lead| (S))
          (#3=#:G203 NIL) (#4=#:G201 NIL) (|d2atk| #5=(|NonNegativeInteger|))
          (|d1atk| #5#) (|p2atk| #6=(|SparseUnivariatePolynomial| S))
          (|p1atk| #6#) (#7=#:G213 NIL) (|k| NIL)
          (|d2| #8=(|NonNegativeInteger|)) (|d1| #8#))
         (SEQ (LETT |res| NIL . #9=(|GUESSEB;evalResultant|))
              (LETT |d1| (SPADCALL |p1| |va1| (QREFELT $ 91)) . #9#)
              (LETT |d2| (SPADCALL |p2| |va1| (QREFELT $ 91)) . #9#)
              (SEQ (LETT |k| 1 . #9#) (LETT #7# (+ (- |d| |o|) 1) . #9#) G190
                   (COND ((|greater_SI| |k| #7#) (GO G191)))
                   (SEQ
                    (LETT |p1atk|
                          (SPADCALL
                           (SPADCALL |p1| |vA| (SPADCALL |k| (QREFELT $ 92))
                                     (QREFELT $ 93))
                           (QREFELT $ 94))
                          . #9#)
                    (LETT |p2atk|
                          (SPADCALL
                           (SPADCALL |p2| |vA| (SPADCALL |k| (QREFELT $ 92))
                                     (QREFELT $ 93))
                           (QREFELT $ 94))
                          . #9#)
                    (LETT |d1atk| (SPADCALL |p1atk| (QREFELT $ 95)) . #9#)
                    (LETT |d2atk| (SPADCALL |p2atk| (QREFELT $ 95)) . #9#)
                    (COND
                     ((< |d2atk| |d2|)
                      (COND
                       ((< |d1atk| |d1|)
                        (LETT |lead| (|spadConstant| $ 27) . #9#))
                       ('T
                        (LETT |lead|
                              (SPADCALL (SPADCALL |p1atk| (QREFELT $ 96))
                                        (PROG1
                                            (LETT #4# (- |d2| |d2atk|) . #9#)
                                          (|check_subtype| (>= #4# 0)
                                                           '(|NonNegativeInteger|)
                                                           #4#))
                                        (QREFELT $ 97))
                              . #9#))))
                     ((< |d1atk| |d1|)
                      (LETT |lead|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) (QREFELT $ 98))
                              |d2| (QREFELT $ 97))
                             (SPADCALL (SPADCALL |p2atk| (QREFELT $ 96))
                                       (PROG1 (LETT #3# (- |d1| |d1atk|) . #9#)
                                         (|check_subtype| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          #3#))
                                       (QREFELT $ 97))
                             (QREFELT $ 99))
                            . #9#))
                     ('T (LETT |lead| (|spadConstant| $ 12) . #9#)))
                    (EXIT
                     (COND
                      ((SPADCALL |lead| (QREFELT $ 100))
                       (LETT |res| (CONS (|spadConstant| $ 27) |res|) . #9#))
                      ('T
                       (LETT |res|
                             (CONS
                              (SPADCALL |lead|
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL
                                                   (SPADCALL |p1atk| |p2atk|
                                                             (QREFELT $ 101))
                                                   (SPADCALL
                                                    (SPADCALL |k|
                                                              (QREFELT $ 92))
                                                    (PROG1 (LETT #2# |o| . #9#)
                                                      (|check_subtype|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                                    (QREFELT $ 97))
                                                   (QREFELT $ 103))
                                                  . #9#)
                                            (QCDR #1#)
                                          (|check_union| (QEQCAR #1# 0)
                                                         (QREFELT $ 7) #1#))
                                        (QREFELT $ 99))
                              |res|)
                             . #9#)))))
                   (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |res|))))) 

(SDEFUN |GUESSEB;p_subst|
        ((|xm| |Integer|) (|i| |Integer|)
         (|va1| |OrderedVariableList| (|construct| '|a1| 'A))
         (|vA| |OrderedVariableList| (|construct| '|a1| 'A))
         (|basis| |Mapping| EXPRR EXPRR)
         ($ |Fraction|
          (|SparseMultivariatePolynomial| S
                                          (|OrderedVariableList|
                                           (|construct| '|a1| 'A)))))
        (SPADCALL (SPADCALL (SPADCALL |vA| (QREFELT $ 104)) (QREFELT $ 105))
                  (SPADCALL
                   (SPADCALL (SPADCALL |va1| (QREFELT $ 104)) (QREFELT $ 105))
                   (|GUESSEB;F2FPOLYS|
                    (SPADCALL (|GUESSEB;DN2DL| |basis| |i| $)
                              (|GUESSEB;DN2DL| |basis| |xm| $) (QREFELT $ 106))
                    $)
                   (QREFELT $ 107))
                  (QREFELT $ 108))) 

(SDEFUN |GUESSEB;p2_subst|
        ((|xm| |Integer|) (|i| |Symbol|) (|a1v| F) (|Av| F)
         (|basis| |Mapping| EXPRR EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL |Av| (QREFELT $ 10))
                  (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                            (SPADCALL
                             (SPADCALL (SPADCALL |i| (QREFELT $ 23)) |basis|)
                             (SPADCALL (SPADCALL |xm| (QREFELT $ 24)) |basis|)
                             (QREFELT $ 109))
                            (QREFELT $ 58))
                  (QREFELT $ 60))) 

(SDEFUN |GUESSEB;guessExpRatAux|
        ((|xx| |Symbol|) (|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|xValues| |List| (|Integer|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((#1=#:G274 NIL) (|res| (|List| EXPRR)) (|res4| (EXPRR))
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
          (|t1| #3#) (|a1v| (F)) (#4=#:G278 NIL) (|g| NIL)
          (|evalPoly|
           (|SparseMultivariatePolynomial| F
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Av| (F)) (#5=#:G277 NIL) (|f| NIL)
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
          (#8=#:G252 NIL) (|i| NIL) (|maxDeg| (|Integer|))
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
          (#10=#:G276 NIL) (|y| (|Mapping| #9# (|NonNegativeInteger|)))
          (|x3|
           #11=(|Fraction|
                (|SparseMultivariatePolynomial| S
                                                (|OrderedVariableList|
                                                 (|construct| '|a1| 'A)))))
          (|x2| #11#) (|x1| #11#) (|xlist| (|List| #11#)) (#12=#:G275 NIL)
          (|len| (|NonNegativeInteger|)) (#13=#:G226 NIL)
          (A #14=(|OrderedVariableList| (|construct| '|a1| 'A))) (|a1| #14#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a1| (SPADCALL 1 (QREFELT $ 71))
                  . #15=(|GUESSEB;guessExpRatAux|))
            (LETT A (SPADCALL 2 (QREFELT $ 71)) . #15#)
            (LETT |len| (LENGTH |list|) . #15#)
            (COND ((< |len| 4) (PROGN (LETT #1# NIL . #15#) (GO #16=#:G273)))
                  (#17='T
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
                                 (|GUESSEB;F2FPOLYS|
                                  (|GUESSEB;DN2DL| |basis|
                                   (SPADCALL |xValues| |i| (QREFELT $ 15)) $)
                                  $)
                                 #12#)
                                . #15#)))
                        (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  . #15#)
            (LETT |x1|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 1) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |x2|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 2) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |x3|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 3) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |y|
                  (CONS #'|GUESSEB;guessExpRatAux!0|
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
            (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 116)) . #15#)
                 (EXIT
                  (COND
                   ((QEQCAR |maxD| 0)
                    (LETT |maxDeg| (MIN (QCDR |maxD|) (- |len| 1)) . #15#))
                   (#17# (LETT |maxDeg| (- |len| 1) . #15#)))))
            (SEQ (LETT |i| 0 . #15#) G190
                 (COND ((|greater_SI| |i| |maxDeg|) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL |options| (QREFELT $ 117))
                    (SPADCALL
                     (SPADCALL "Guess: degree ExpRat "
                               (SPADCALL |i| (QREFELT $ 119)) (QREFELT $ 120))
                     (QREFELT $ 123))))
                  (COND
                   ((SPADCALL |options| (QREFELT $ 117))
                    (SEQ (SPADCALL "sys date +%s" (QREFELT $ 126))
                         (EXIT
                          (SPADCALL "Guess: interpolating..."
                                    (QREFELT $ 123))))))
                  (LETT |ri|
                        (SPADCALL |xlist| |ylist|
                                  (PROG1 (LETT #8# (- (- |len| 1) |i|) . #15#)
                                    (|check_subtype| (>= #8# 0)
                                                     '(|NonNegativeInteger|)
                                                     #8#))
                                  (QREFELT $ 130))
                        . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 117))
                    (SPADCALL "Guess: polynomials..." (QREFELT $ 123))))
                  (LETT |poly1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x1| (QREFELT $ 132)) |y1|
                                   (QREFELT $ 133))
                         (QREFELT $ 134))
                        . #15#)
                  (LETT |poly2|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x2| (QREFELT $ 132)) |y2|
                                   (QREFELT $ 133))
                         (QREFELT $ 134))
                        . #15#)
                  (LETT |poly3|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x3| (QREFELT $ 132)) |y3|
                                   (QREFELT $ 133))
                         (QREFELT $ 134))
                        . #15#)
                  (LETT |n| (- |len| |i|) . #15#)
                  (LETT |o1| (|GUESSEB;ord1| |xValues| |i| $) . #15#)
                  (LETT |d1| (|GUESSEB;deg1| |xValues| |i| $) . #15#)
                  (LETT |o2| (|GUESSEB;ord2| |xValues| |i| $) . #15#)
                  (LETT |d2| (|GUESSEB;deg2| |xValues| |i| $) . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 117))
                    (SPADCALL "Guess: interpolating resultants..."
                              (QREFELT $ 123))))
                  (LETT |res1|
                        (SPADCALL
                         (|GUESSEB;evalResultant| |poly1| |poly3| |o1| |d1|
                          |a1| A $)
                         (QREFELT $ 137))
                        . #15#)
                  (LETT |res2|
                        (SPADCALL
                         (|GUESSEB;evalResultant| |poly2| |poly3| |o2| |d2|
                          |a1| A $)
                         (QREFELT $ 137))
                        . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 117))
                    (SPADCALL "Guess: computing gcd..." (QREFELT $ 123))))
                  (LETT |res3|
                        (|GUESSEB;SUPS2SUPF|
                         (SPADCALL (SPADCALL |res1| |res2| (QREFELT $ 138))
                                   (QREFELT $ 139))
                         $)
                        . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 117))
                    (SPADCALL "Guess: solving..." (QREFELT $ 123))))
                  (SEQ (LETT |f| NIL . #15#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |res3| (QREFELT $ 142))
                                       (QREFELT $ 145))
                             . #15#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |f| (CAR #5#) . #15#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 56)) 1)
                           (SEQ
                            (LETT |Av|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (QCAR |f|) 0 (QREFELT $ 146))
                                    (SPADCALL (QCAR |f|) (QREFELT $ 54))
                                    (QREFELT $ 147))
                                   (QREFELT $ 148))
                                  . #15#)
                            (LETT |evalPoly|
                                  (SPADCALL (|GUESSEB;POLYS2POLYF| |poly3| $) A
                                            |Av| (QREFELT $ 149))
                                  . #15#)
                            (COND
                             ((SPADCALL |evalPoly| (QREFELT $ 150))
                              (LETT |evalPoly|
                                    (SPADCALL (|GUESSEB;POLYS2POLYF| |poly1| $)
                                              A |Av| (QREFELT $ 149))
                                    . #15#)))
                            (EXIT
                             (SEQ (LETT |g| NIL . #15#)
                                  (LETT #4#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |evalPoly| (QREFELT $ 151))
                                          (QREFELT $ 142))
                                         (QREFELT $ 145))
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
                                     ((EQL (SPADCALL (QCAR |g|) (QREFELT $ 56))
                                           1)
                                      (SEQ
                                       (LETT |a1v|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QCAR |g|) 0
                                                         (QREFELT $ 146))
                                               (SPADCALL (QCAR |g|)
                                                         (QREFELT $ 54))
                                               (QREFELT $ 147))
                                              (QREFELT $ 148))
                                             . #15#)
                                       (LETT |t1|
                                             (SPADCALL
                                              (|GUESSEB;POLYS2POLYF| |poly1| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 73))
                                             . #15#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t1| (QREFELT $ 150))
                                          (SEQ
                                           (LETT |t2|
                                                 (SPADCALL
                                                  (|GUESSEB;POLYS2POLYF|
                                                   |poly2| $)
                                                  (LIST |a1| A)
                                                  (LIST |a1v| |Av|)
                                                  (QREFELT $ 73))
                                                 . #15#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |t2| (QREFELT $ 150))
                                              (SEQ
                                               (LETT |ri1|
                                                     (SPADCALL
                                                      (|GUESSEB;SUPFPOLYS2FSUPPOLYS|
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          152))
                                                       $)
                                                      (|GUESSEB;SUPFPOLYS2FSUPPOLYS|
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          153))
                                                       $)
                                                      (QREFELT $ 154))
                                                     . #15#)
                                               (LETT |numr|
                                                     (|GUESSEB;SUPPOLYS2SUPF|
                                                      (SPADCALL |ri1|
                                                                (QREFELT $
                                                                         155))
                                                      |a1v| |Av| $)
                                                     . #15#)
                                               (LETT |denr|
                                                     (|GUESSEB;SUPPOLYS2SUPF|
                                                      (SPADCALL |ri1|
                                                                (QREFELT $
                                                                         156))
                                                      |a1v| |Av| $)
                                                     . #15#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |denr|
                                                            (QREFELT $ 53))
                                                  (COND
                                                   ((SPADCALL |numr|
                                                              (QREFELT $ 53))
                                                    (COND
                                                     ((SPADCALL |options|
                                                                (QREFELT $
                                                                         117))
                                                      (SPADCALL
                                                       "Guess: numerator and denominator vanish!"
                                                       (QREFELT $ 157)))))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |res4|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|GUESSEB;FSUPF2EXPRR|
                                                            |xx|
                                                            (SPADCALL |numr|
                                                                      |denr|
                                                                      (QREFELT
                                                                       $ 158))
                                                            $)
                                                           (SPADCALL |xx|
                                                                     (QREFELT $
                                                                              160))
                                                           (SPADCALL
                                                            (SPADCALL |xx|
                                                                      (QREFELT
                                                                       $ 23))
                                                            |basis|)
                                                           (QREFELT $ 162))
                                                          (SPADCALL
                                                           (|GUESSEB;p2_subst|
                                                            (SPADCALL |xValues|
                                                                      (QREFELT
                                                                       $ 110))
                                                            |xx| |a1v| |Av|
                                                            |basis| $)
                                                           (SPADCALL |xx|
                                                                     (QREFELT $
                                                                              23))
                                                           (QREFELT $ 163))
                                                          (QREFELT $ 58))
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
                      ((SPADCALL |options| (QREFELT $ 164))
                       (PROGN (LETT #1# |res| . #15#) (GO #16#))))))))
                 (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #16# (EXIT #1#)))) 

(SDEFUN |GUESSEB;guessExpRatAux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|list| $ |xValues| |a1| A |basis|)
          (LETT |list| (QREFELT $$ 5) . #1=(|GUESSEB;guessExpRatAux|))
          (LETT $ (QREFELT $$ 4) . #1#)
          (LETT |xValues| (QREFELT $$ 3) . #1#)
          (LETT |a1| (QREFELT $$ 2) . #1#)
          (LETT A (QREFELT $$ 1) . #1#)
          (LETT |basis| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (|GUESSEB;F2FPOLYS| (SPADCALL |list| |z1| (QREFELT $ 33)) $)
             (SPADCALL
              (|GUESSEB;p_subst| (SPADCALL |xValues| (QREFELT $ 110))
               (SPADCALL |xValues| |z1| (QREFELT $ 15)) |a1| A |basis| $)
              (SPADCALL (SPADCALL |xValues| |z1| (QREFELT $ 15))
                        (QREFELT $ 111))
              (QREFELT $ 112))
             (QREFELT $ 107)))))) 

(SDEFUN |GUESSEB;guessExpRatAux0|
        ((|list| |List| F) (|basis| |Mapping| EXPRR EXPRR)
         (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G296 NIL) (|f| NIL) (#2=#:G295 NIL)
          (|xValues| (|List| (|Integer|))) (|newlist| (|List| F))
          (|i| (|Integer|)) (#3=#:G294 NIL) (|x| NIL) (|zeros| (EXPRR))
          (#4=#:G293 NIL) (|shortlist| (|List| F)) (#5=#:G281 NIL)
          (#6=#:G292 NIL) (|len| (|Integer|)) (|xx| (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((ZEROP (SPADCALL |options| (QREFELT $ 165)))
              (|error| "Guess: guessExpRat does not support zero safety")))
            (LETT |xx| (SPADCALL |options| (QREFELT $ 166))
                  . #7=(|GUESSEB;guessExpRatAux0|))
            (LETT |len| (LENGTH |list|) . #7#)
            (COND
             ((< (+ (- |len| (SPADCALL |options| (QREFELT $ 165))) 1) 0)
              (PROGN (LETT #6# NIL . #7#) (GO #8=#:G291))))
            (LETT |shortlist|
                  (SPADCALL |list|
                            (PROG1
                                (LETT #5#
                                      (+
                                       (- |len|
                                          (SPADCALL |options| (QREFELT $ 165)))
                                       1)
                                      . #7#)
                              (|check_subtype| (>= #5# 0)
                                               '(|NonNegativeInteger|) #5#))
                            (QREFELT $ 167))
                  . #7#)
            (LETT |zeros| (|spadConstant| $ 168) . #7#) (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #4# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 169))
                         (LETT |zeros|
                               (SPADCALL |zeros|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |xx| (QREFELT $ 23))
                                           |basis|)
                                          (SPADCALL
                                           (SPADCALL |i| (QREFELT $ 24))
                                           |basis|)
                                          (QREFELT $ 109))
                                         (QREFELT $ 58))
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
                        ((SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 35))
                         (SEQ
                          (LETT |newlist|
                                (CONS
                                 (SPADCALL |x|
                                           (SPADCALL
                                            (SPADCALL |zeros|
                                                      (SPADCALL |xx|
                                                                (QREFELT $ 23))
                                                      (SPADCALL |i|
                                                                (QREFELT $ 24))
                                                      (QREFELT $ 25))
                                            (QREFELT $ 9))
                                           (QREFELT $ 147))
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
                              (|GUESSEB;guessExpRatAux| |xx| |newlist| |basis|
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
                                  (SPADCALL |zeros| |f| (QREFELT $ 58))
                                  (SPADCALL |xx| (QREFELT $ 23))
                                  (SPADCALL |xx| (QREFELT $ 23))
                                  (QREFELT $ 25))
                                 #2#)
                                . #7#)))
                        (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #7#)
            (EXIT
             (SPADCALL
              (CONS #'|GUESSEB;guessExpRatAux0!0|
                    (VECTOR |options| $ |list| |len| |xx|))
              |res| (QREFELT $ 174)))))
          #8# (EXIT #6#)))) 

(SDEFUN |GUESSEB;guessExpRatAux0!0| ((|z1| NIL) ($$ NIL))
        (PROG (|xx| |len| |list| $ |options|)
          (LETT |xx| (QREFELT $$ 4) . #1=(|GUESSEB;guessExpRatAux0|))
          (LETT |len| (QREFELT $$ 3) . #1#)
          (LETT |list| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |options| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|GUESSEB;checkResult| |z1| |xx| |len| |list| $)
                      (SPADCALL |len| (SPADCALL |options| (QREFELT $ 165))
                                (QREFELT $ 170))
                      (QREFELT $ 171)))))) 

(SDEFUN |GUESSEB;guessExpRat;LLL;20|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (|GUESSEB;guessExpRatAux0| |list|
         (CONS (|function| |GUESSEB;defaultD|) $) |options| $)) 

(SDEFUN |GUESSEB;guessExpRat;SM;21|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESSEB;guessExpRat;SM;21!1| (VECTOR |q| $)))) 

(SDEFUN |GUESSEB;guessExpRat;SM;21!1| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1) . #1=(|GUESSEB;guessExpRat;SM;21|))
          (LETT |q| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESSEB;guessExpRatAux0| |z1|
                    (CONS #'|GUESSEB;guessExpRat;SM;21!0| (VECTOR $ |q|)) |z2|
                    $)))))) 

(SDEFUN |GUESSEB;guessExpRat;SM;21!0| ((|i1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |q| (QREFELT $ 23)) |i1| (QREFELT $ 163)))))) 

(SDEFUN |GUESSEB;binExt|
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
          (#1=#:G309 NIL) (|l| NIL) (#2=#:G308 NIL))
         (SEQ
          (LETT |numl|
                (PROGN
                 (LETT #2# NIL . #3=(|GUESSEB;binExt|))
                 (SEQ (LETT |l| 0 . #3#) (LETT #1# (- |i| 1) . #3#) G190
                      (COND ((|greater_SI| |l| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |vA| (QREFELT $ 104))
                                          (SPADCALL |i|
                                                    (SPADCALL |va1|
                                                              (QREFELT $ 104))
                                                    (QREFELT $ 178))
                                          (QREFELT $ 179))
                                (SPADCALL |l| (QREFELT $ 180)) (QREFELT $ 181))
                               #2#)
                              . #3#)))
                      (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |num|
                (SPADCALL (ELT $ 182) |numl| (|spadConstant| $ 183)
                          (QREFELT $ 186))
                . #3#)
          (EXIT
           (SPADCALL |num|
                     (SPADCALL (SPADCALL |i| (QREFELT $ 187)) (QREFELT $ 180))
                     (QREFELT $ 52)))))) 

(SDEFUN |GUESSEB;binExtEXPR| ((|i| |Symbol|) (|a1v| F) (|Av| F) ($ EXPRR))
        (SPADCALL
         (SPADCALL (SPADCALL |Av| (QREFELT $ 10))
                   (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                             (SPADCALL |i| (QREFELT $ 23)) (QREFELT $ 58))
                   (QREFELT $ 60))
         (SPADCALL |i| (QREFELT $ 23)) (QREFELT $ 188))) 

(SDEFUN |GUESSEB;guessBinRatAux|
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
         ((#1=#:G341 NIL) (|res| (|List| EXPRR)) (|res4| (EXPRR))
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
          (|t1| #3#) (|a1v| (F)) (#4=#:G345 NIL) (|g| NIL)
          (|evalPoly|
           (|SparseMultivariatePolynomial| F
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Av| (F)) (#5=#:G344 NIL) (|f| NIL)
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
          (#8=#:G323 NIL) (|i| NIL) (|maxDeg| (|Integer|))
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
          (#10=#:G343 NIL) (|y| (|Mapping| #9# (|NonNegativeInteger|)))
          (|x3|
           #11=(|Fraction|
                (|SparseMultivariatePolynomial| S
                                                (|OrderedVariableList|
                                                 (|construct| '|a1| 'A)))))
          (|x2| #11#) (|x1| #11#) (|xlist| (|List| #11#)) (#12=#:G342 NIL)
          (|len| (|NonNegativeInteger|)) (#13=#:G311 NIL)
          (A #14=(|OrderedVariableList| (|construct| '|a1| 'A))) (|a1| #14#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a1| (SPADCALL 1 (QREFELT $ 71))
                  . #15=(|GUESSEB;guessBinRatAux|))
            (LETT A (SPADCALL 2 (QREFELT $ 71)) . #15#)
            (LETT |len| (LENGTH |list|) . #15#)
            (COND ((< |len| 4) (PROGN (LETT #1# NIL . #15#) (GO #16=#:G340)))
                  (#17='T
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
                                 (|GUESSEB;F2FPOLYS|
                                  (|GUESSEB;DN2DL| |basis|
                                   (SPADCALL |xValues| |i| (QREFELT $ 15)) $)
                                  $)
                                 #12#)
                                . #15#)))
                        (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  . #15#)
            (LETT |x1|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 1) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |x2|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 2) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |x3|
                  (|GUESSEB;F2FPOLYS|
                   (|GUESSEB;DN2DL| |basis|
                    (SPADCALL |xValues| (+ |len| 3) (QREFELT $ 15)) $)
                   $)
                  . #15#)
            (LETT |y|
                  (CONS #'|GUESSEB;guessBinRatAux!0|
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
            (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 116)) . #15#)
                 (EXIT
                  (COND
                   ((QEQCAR |maxD| 0)
                    (LETT |maxDeg| (MIN (QCDR |maxD|) (- |len| 1)) . #15#))
                   (#17# (LETT |maxDeg| (- |len| 1) . #15#)))))
            (SEQ (LETT |i| 0 . #15#) G190
                 (COND ((|greater_SI| |i| |maxDeg|) (GO G191)))
                 (SEQ
                  (LETT |ri|
                        (SPADCALL |xlist| |ylist|
                                  (PROG1 (LETT #8# (- (- |len| 1) |i|) . #15#)
                                    (|check_subtype| (>= #8# 0)
                                                     '(|NonNegativeInteger|)
                                                     #8#))
                                  (QREFELT $ 130))
                        . #15#)
                  (LETT |poly1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x1| (QREFELT $ 132)) |y1|
                                   (QREFELT $ 133))
                         (QREFELT $ 134))
                        . #15#)
                  (LETT |poly2|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x2| (QREFELT $ 132)) |y2|
                                   (QREFELT $ 133))
                         (QREFELT $ 134))
                        . #15#)
                  (LETT |poly3|
                        (SPADCALL
                         (SPADCALL (SPADCALL |ri| |x3| (QREFELT $ 132)) |y3|
                                   (QREFELT $ 133))
                         (QREFELT $ 134))
                        . #15#)
                  (LETT |n| (- |len| |i|) . #15#)
                  (LETT |res1|
                        (SPADCALL
                         (SPADCALL |poly1| |poly3| |a1| (QREFELT $ 190))
                         (QREFELT $ 94))
                        . #15#)
                  (LETT |res2|
                        (SPADCALL
                         (SPADCALL |poly2| |poly3| |a1| (QREFELT $ 190))
                         (QREFELT $ 94))
                        . #15#)
                  (COND
                   ((SPADCALL |options| (QREFELT $ 117))
                    (SPADCALL "Guess: computing gcd..." (QREFELT $ 123))))
                  (LETT |res3|
                        (|GUESSEB;SUPS2SUPF|
                         (SPADCALL (SPADCALL |res1| |res2| (QREFELT $ 138))
                                   (QREFELT $ 139))
                         $)
                        . #15#)
                  (SEQ (LETT |f| NIL . #15#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |res3| (QREFELT $ 142))
                                       (QREFELT $ 145))
                             . #15#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |f| (CAR #5#) . #15#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 56)) 1)
                           (SEQ
                            (LETT |Av|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (QCAR |f|) 0 (QREFELT $ 146))
                                    (SPADCALL (QCAR |f|) (QREFELT $ 54))
                                    (QREFELT $ 147))
                                   (QREFELT $ 148))
                                  . #15#)
                            (LETT |evalPoly|
                                  (SPADCALL (|GUESSEB;POLYS2POLYF| |poly3| $) A
                                            |Av| (QREFELT $ 149))
                                  . #15#)
                            (COND
                             ((SPADCALL |evalPoly| (QREFELT $ 150))
                              (LETT |evalPoly|
                                    (SPADCALL (|GUESSEB;POLYS2POLYF| |poly1| $)
                                              A |Av| (QREFELT $ 149))
                                    . #15#)))
                            (EXIT
                             (SEQ (LETT |g| NIL . #15#)
                                  (LETT #4#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |evalPoly| (QREFELT $ 151))
                                          (QREFELT $ 142))
                                         (QREFELT $ 145))
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
                                     ((EQL (SPADCALL (QCAR |g|) (QREFELT $ 56))
                                           1)
                                      (SEQ
                                       (LETT |a1v|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QCAR |g|) 0
                                                         (QREFELT $ 146))
                                               (SPADCALL (QCAR |g|)
                                                         (QREFELT $ 54))
                                               (QREFELT $ 147))
                                              (QREFELT $ 148))
                                             . #15#)
                                       (LETT |t1|
                                             (SPADCALL
                                              (|GUESSEB;POLYS2POLYF| |poly1| $)
                                              (LIST |a1| A) (LIST |a1v| |Av|)
                                              (QREFELT $ 73))
                                             . #15#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |t1| (QREFELT $ 150))
                                          (SEQ
                                           (LETT |t2|
                                                 (SPADCALL
                                                  (|GUESSEB;POLYS2POLYF|
                                                   |poly2| $)
                                                  (LIST |a1| A)
                                                  (LIST |a1v| |Av|)
                                                  (QREFELT $ 73))
                                                 . #15#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |t2| (QREFELT $ 150))
                                              (SEQ
                                               (LETT |ri1|
                                                     (SPADCALL
                                                      (|GUESSEB;SUPFPOLYS2FSUPPOLYS|
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          152))
                                                       $)
                                                      (|GUESSEB;SUPFPOLYS2FSUPPOLYS|
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          153))
                                                       $)
                                                      (QREFELT $ 154))
                                                     . #15#)
                                               (LETT |numr|
                                                     (|GUESSEB;SUPPOLYS2SUPF|
                                                      (SPADCALL |ri1|
                                                                (QREFELT $
                                                                         155))
                                                      |a1v| |Av| $)
                                                     . #15#)
                                               (LETT |denr|
                                                     (|GUESSEB;SUPPOLYS2SUPF|
                                                      (SPADCALL |ri1|
                                                                (QREFELT $
                                                                         156))
                                                      |a1v| |Av| $)
                                                     . #15#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |denr|
                                                            (QREFELT $ 53))
                                                  (COND
                                                   ((SPADCALL |numr|
                                                              (QREFELT $ 53))
                                                    (COND
                                                     ((SPADCALL |options|
                                                                (QREFELT $
                                                                         117))
                                                      (SPADCALL
                                                       "Guess: numerator and denominator vanish!"
                                                       (QREFELT $ 157)))))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |res4|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|GUESSEB;FSUPF2EXPRR|
                                                            |xx|
                                                            (SPADCALL |numr|
                                                                      |denr|
                                                                      (QREFELT
                                                                       $ 158))
                                                            $)
                                                           (SPADCALL |xx|
                                                                     (QREFELT $
                                                                              160))
                                                           (SPADCALL
                                                            (SPADCALL |xx|
                                                                      (QREFELT
                                                                       $ 23))
                                                            |basis|)
                                                           (QREFELT $ 162))
                                                          (SPADCALL |xx| |a1v|
                                                                    |Av|
                                                                    |extEXPR|)
                                                          (QREFELT $ 58))
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
                      ((SPADCALL |options| (QREFELT $ 164))
                       (PROGN (LETT #1# |res| . #15#) (GO #16#))))))))
                 (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #16# (EXIT #1#)))) 

(SDEFUN |GUESSEB;guessBinRatAux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|list| $ |xValues| |a1| A |ext|)
          (LETT |list| (QREFELT $$ 5) . #1=(|GUESSEB;guessBinRatAux|))
          (LETT $ (QREFELT $$ 4) . #1#)
          (LETT |xValues| (QREFELT $$ 3) . #1#)
          (LETT |a1| (QREFELT $$ 2) . #1#)
          (LETT A (QREFELT $$ 1) . #1#)
          (LETT |ext| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (|GUESSEB;F2FPOLYS| (SPADCALL |list| |z1| (QREFELT $ 33)) $)
             (SPADCALL (SPADCALL |xValues| |z1| (QREFELT $ 15)) |a1| A |ext|)
             (QREFELT $ 189)))))) 

(SDEFUN |GUESSEB;guessBinRatAux0|
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
         ((|res| (|List| EXPRR)) (#1=#:G369 NIL) (|f| NIL) (#2=#:G368 NIL)
          (|xValues| (|List| (|Integer|))) (|newlist| (|List| F))
          (|i| (|Integer|)) (#3=#:G367 NIL) (|x| NIL) (|zeros| (EXPRR))
          (#4=#:G366 NIL) (|shortlist| (|List| F)) (#5=#:G348 NIL)
          (#6=#:G365 NIL) (|len| (|Integer|)) (|xx| (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((ZEROP (SPADCALL |options| (QREFELT $ 165)))
              (|error| "Guess: guessBinRat does not support zero safety")))
            (LETT |xx| (SPADCALL |options| (QREFELT $ 166))
                  . #7=(|GUESSEB;guessBinRatAux0|))
            (LETT |len| (LENGTH |list|) . #7#)
            (COND
             ((< (+ (- |len| (SPADCALL |options| (QREFELT $ 165))) 1) 0)
              (PROGN (LETT #6# NIL . #7#) (GO #8=#:G364))))
            (LETT |shortlist|
                  (SPADCALL |list|
                            (PROG1
                                (LETT #5#
                                      (+
                                       (- |len|
                                          (SPADCALL |options| (QREFELT $ 165)))
                                       1)
                                      . #7#)
                              (|check_subtype| (>= #5# 0)
                                               '(|NonNegativeInteger|) #5#))
                            (QREFELT $ 167))
                  . #7#)
            (LETT |zeros| (|spadConstant| $ 168) . #7#) (LETT |i| -1 . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #4# |shortlist| . #7#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #7#)
                      (EXIT
                       (COND
                        ((SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 169))
                         (LETT |zeros|
                               (SPADCALL |zeros|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |xx| (QREFELT $ 23))
                                           |basis|)
                                          (SPADCALL
                                           (SPADCALL |i| (QREFELT $ 24))
                                           |basis|)
                                          (QREFELT $ 109))
                                         (QREFELT $ 58))
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
                        ((SPADCALL |x| (|spadConstant| $ 26) (QREFELT $ 35))
                         (SEQ
                          (LETT |newlist|
                                (CONS
                                 (SPADCALL |x|
                                           (SPADCALL
                                            (SPADCALL |zeros|
                                                      (SPADCALL |xx|
                                                                (QREFELT $ 23))
                                                      (SPADCALL |i|
                                                                (QREFELT $ 24))
                                                      (QREFELT $ 25))
                                            (QREFELT $ 9))
                                           (QREFELT $ 147))
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
                              (|GUESSEB;guessBinRatAux| |xx| |newlist| |basis|
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
                                  (SPADCALL |zeros| |f| (QREFELT $ 58))
                                  (SPADCALL |xx| (QREFELT $ 23))
                                  (SPADCALL |xx| (QREFELT $ 23))
                                  (QREFELT $ 25))
                                 #2#)
                                . #7#)))
                        (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #7#)
            (EXIT
             (SPADCALL
              (CONS #'|GUESSEB;guessBinRatAux0!0|
                    (VECTOR |options| $ |list| |len| |xx|))
              |res| (QREFELT $ 174)))))
          #8# (EXIT #6#)))) 

(SDEFUN |GUESSEB;guessBinRatAux0!0| ((|z1| NIL) ($$ NIL))
        (PROG (|xx| |len| |list| $ |options|)
          (LETT |xx| (QREFELT $$ 4) . #1=(|GUESSEB;guessBinRatAux0|))
          (LETT |len| (QREFELT $$ 3) . #1#)
          (LETT |list| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |options| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|GUESSEB;checkResult| |z1| |xx| |len| |list| $)
                      (SPADCALL |len| (SPADCALL |options| (QREFELT $ 165))
                                (QREFELT $ 170))
                      (QREFELT $ 171)))))) 

(SDEFUN |GUESSEB;guessBinRat;LLL;26|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (|GUESSEB;guessBinRatAux0| |list|
         (CONS (|function| |GUESSEB;defaultD|) $)
         (CONS (|function| |GUESSEB;binExt|) $)
         (CONS (|function| |GUESSEB;binExtEXPR|) $) |options| $)) 

(SDEFUN |GUESSEB;qD| ((|q| |Symbol|) ($ |Mapping| EXPRR EXPRR))
        (SPROG NIL (CONS #'|GUESSEB;qD!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESSEB;qD!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESSEB;qD|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |q| (QREFELT $ 23)) |z1| (QREFELT $ 163)))))) 

(SDEFUN |GUESSEB;qBinExtAux|
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
          (|l| NIL) (#1=#:G385 NIL))
         (SEQ
          (LETT |fl|
                (PROGN
                 (LETT #1# NIL . #2=(|GUESSEB;qBinExtAux|))
                 (SEQ (LETT |l| 1 . #2#) G190
                      (COND ((|greater_SI| |l| |i|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 192)
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |va1| (QREFELT $ 104))
                                             (QREFELT $ 105))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |vA| (QREFELT $ 104))
                                              (QREFELT $ 105))
                                             (- |i| 1) (QREFELT $ 112))
                                            (QREFELT $ 107))
                                           (SPADCALL
                                            (|GUESSEB;F2FPOLYS|
                                             (SPADCALL |q| (QREFELT $ 193)) $)
                                            |l| (QREFELT $ 112))
                                           (QREFELT $ 107))
                                          (QREFELT $ 133))
                                (SPADCALL (|spadConstant| $ 192)
                                          (SPADCALL
                                           (|GUESSEB;F2FPOLYS|
                                            (SPADCALL |q| (QREFELT $ 193)) $)
                                           |l| (QREFELT $ 112))
                                          (QREFELT $ 133))
                                (QREFELT $ 189))
                               #1#)
                              . #2#)))
                      (LETT |l| (|inc_SI| |l|) . #2#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                . #2#)
          (EXIT
           (SPADCALL (ELT $ 107) |fl| (|spadConstant| $ 192)
                     (QREFELT $ 195)))))) 

(SDEFUN |GUESSEB;qBinExt|
        ((|q| |Symbol|)
         ($ |Mapping|
          (|Fraction|
           (|SparseMultivariatePolynomial| S
                                           (|OrderedVariableList|
                                            (|construct| '|a1| 'A))))
          (|Integer|) (|OrderedVariableList| (|construct| '|a1| 'A))
          (|OrderedVariableList| (|construct| '|a1| 'A))))
        (SPROG NIL (CONS #'|GUESSEB;qBinExt!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESSEB;qBinExt!0| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESSEB;qBinExt|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESSEB;qBinExtAux| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESSEB;qBinExtEXPRaux|
        ((|q| |Symbol|) (|i| |Symbol|) (|a1v| F) (|Av| F) ($ EXPRR))
        (SPROG ((|l| (|Symbol|)))
               (SEQ (LETT |l| '|l| |GUESSEB;qBinExtEXPRaux|)
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 168)
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a1v| (QREFELT $ 10))
                                            (SPADCALL
                                             (SPADCALL |Av| (QREFELT $ 10))
                                             (SPADCALL
                                              (SPADCALL |i| (QREFELT $ 23))
                                              (|spadConstant| $ 168)
                                              (QREFELT $ 109))
                                             (QREFELT $ 163))
                                            (QREFELT $ 58))
                                  (SPADCALL (SPADCALL |q| (QREFELT $ 23))
                                            (SPADCALL |l| (QREFELT $ 23))
                                            (QREFELT $ 163))
                                  (QREFELT $ 58))
                                 (QREFELT $ 109))
                       (SPADCALL (|spadConstant| $ 168)
                                 (SPADCALL (SPADCALL |q| (QREFELT $ 23))
                                           (SPADCALL |l| (QREFELT $ 23))
                                           (QREFELT $ 163))
                                 (QREFELT $ 109))
                       (QREFELT $ 34))
                      (SPADCALL |l|
                                (SPADCALL (|spadConstant| $ 168)
                                          (SPADCALL |i| (QREFELT $ 23))
                                          (QREFELT $ 197))
                                (QREFELT $ 199))
                      (QREFELT $ 201)))))) 

(SDEFUN |GUESSEB;qBinExtEXPR|
        ((|q| |Symbol|) ($ |Mapping| EXPRR (|Symbol|) F F))
        (SPROG NIL (CONS #'|GUESSEB;qBinExtEXPR!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESSEB;qBinExtEXPR!0| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESSEB;qBinExtEXPR|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GUESSEB;qBinExtEXPRaux| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESSEB;guessBinRat;SM;32|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESSEB;guessBinRat;SM;32!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESSEB;guessBinRat;SM;32!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|GUESSEB;guessBinRat;SM;32|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|GUESSEB;guessBinRatAux0| |z1| (|GUESSEB;qD| |q| $)
             (|GUESSEB;qBinExt| |q| $) (|GUESSEB;qBinExtEXPR| |q| $) |z2| $))))) 

(DECLAIM (NOTINLINE |GuessExpBin;|)) 

(DEFUN |GuessExpBin| (&REST #1=#:G401)
  (SPROG NIL
         (PROG (#2=#:G402)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GuessExpBin|)
                                               '|domainEqualList|)
                    . #3=(|GuessExpBin|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GuessExpBin;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GuessExpBin|)))))))))) 

(DEFUN |GuessExpBin;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|GuessExpBin|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|GuessExpBin| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 203) . #1#)
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
    (|haddProp| |$ConstructorCache| '|GuessExpBin|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
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
        (QSETREFV $ 177
                  (CONS (|dispatchFunction| |GUESSEB;guessExpRat;SM;21|)
                        $))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 202
                   (CONS (|dispatchFunction| |GUESSEB;guessBinRat;SM;32|)
                         $)))))))
    $))) 

(MAKEPROP '|GuessExpBin| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |One|)
              (4 . |One|) (|Integer|) (|List| 13) (8 . |elt|) (14 . +)
              (|Mapping| 13 13 13) (20 . |reduce|) (|PositiveInteger|) (27 . *)
              (33 . |denominator|) (|Symbol|) (38 . |coerce|) (43 . |coerce|)
              (48 . |eval|) (55 . |Zero|) (59 . |Zero|) (63 . |Zero|)
              (|Boolean|) (67 . =) (73 . |numerator|) (|List| 6) (78 . |elt|)
              (84 . /) (90 . ~=) (|Fraction| 7) (96 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 7)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomialFunctions2| 7 6) (101 . |map|)
              (|SparseMultivariatePolynomial| 6 70) (107 . |coerce|)
              (|Fraction| 43) (112 . |coerce|) (117 . |numer|)
              (|SparseMultivariatePolynomial| 7 70) (122 . |coerce|)
              (127 . |denom|) (|Fraction| 48) (132 . /) (138 . |zero?|)
              (143 . |leadingCoefficient|) (|NonNegativeInteger|)
              (148 . |degree|) (153 . ^) (159 . *) (165 . |reductum|) (170 . +)
              (|Fraction| 38) (176 . |numer|) (181 . |denom|)
              (|MPolyCatFunctions2| 70 (|IndexedExponents| 70)
                                    (|IndexedExponents| 70) 7 6 48 43)
              (186 . |map|) (|SparseUnivariatePolynomial| 48) (192 . |zero?|)
              (197 . |Zero|) (201 . |leadingCoefficient|)
              (|OrderedVariableList| (NRTEVAL (LIST '|a1| 'A))) (206 . |index|)
              (|List| 70) (211 . |eval|) (218 . |retract|) (223 . |degree|)
              (228 . |monomial|) (234 . |reductum|) (239 . +)
              (|Record| (|:| |num| 80) (|:| |den| 48))
              (|SparseUnivariatePolynomial| 51)
              (|UnivariatePolynomialCommonDenominator| 48 51 80)
              (245 . |splitDenominator|) (250 . *) (256 . |retract|)
              (|Mapping| 48 51) (|SparseUnivariatePolynomialFunctions2| 51 48)
              (261 . |map|) (267 . |coerce|) (|Fraction| 66) (272 . /)
              (278 . |degree|) (284 . |coerce|) (289 . |eval|)
              (296 . |univariate|) (301 . |degree|)
              (306 . |leadingCoefficient|) (311 . ^) (317 . -) (322 . *)
              (328 . |zero?|) (333 . |resultant|) (|Union| $ '"failed")
              (339 . |exquo|) (345 . |coerce|) (350 . |coerce|) (355 . -)
              (361 . *) (367 . +) (373 . -) (379 . |last|) (384 . -) (389 . ^)
              (|Union| 55 '"arbitrary") (|List| (|GuessOption|))
              (|GuessOptionFunctions0|) (395 . |maxDegree|) (400 . |debug|)
              (|OutputForm|) (405 . |coerce|) (410 . |hconcat|) (|Void|)
              (|OutputPackage|) (416 . |output|) (|String|)
              (|MoreSystemCommands|) (421 . |systemCommand|) (|Fraction| 80)
              (|List| 51) (|FractionFreeFastGaussian| 51 80)
              (426 . |interpolate|) (|Fraction| $) (433 . |elt|) (439 . -)
              (445 . |numer|) (|List| 7) (|NewtonInterpolation| 7)
              (450 . |newton|) (455 . |gcd|) (461 . |primitivePart|)
              (|Factored| 38)
              (|GeneralizedMultivariateFactorize| (|SingletonAsOrderedSet|) 55
                                                  6 6 38)
              (466 . |factor|) (|Record| (|:| |factor| 38) (|:| |exponent| 13))
              (|List| 143) (471 . |factors|) (476 . |coefficient|) (482 . /)
              (488 . -) (493 . |eval|) (500 . |zero?|) (505 . |univariate|)
              (510 . |numer|) (515 . |denom|) (520 . /) (526 . |numer|)
              (531 . |denom|) (536 . |output|) (541 . /) (|Kernel| 8)
              (547 . |kernel|) (|Kernel| $) (552 . |eval|) (559 . ^)
              (565 . |one|) (570 . |safety|) (575 . |indexName|)
              (580 . |first|) (586 . |One|) (590 . =) (596 . -) (602 . <)
              (|Mapping| 29 8) (|List| 8) (608 . |select|)
              |GUESSEB;guessExpRat;LLL;20| (|Mapping| 173 32 114)
              (614 . |guessExpRat|) (619 . *) (625 . +) (631 . |coerce|)
              (636 . -) (642 . *) (648 . |One|) (|Mapping| 48 48 48)
              (|List| 48) (652 . |reduce|) (659 . |factorial|)
              (664 . |binomial|) (670 . /) (676 . |resultant|)
              |GUESSEB;guessBinRat;LLL;26| (683 . |One|) (687 . |coerce|)
              (|Mapping| 51 51 51) (692 . |reduce|) (|Segment| 8)
              (699 . SEGMENT) (|SegmentBinding| 8) (705 . |equation|)
              (|SegmentBinding| $) (711 . |product|) (717 . |guessBinRat|))
           '#(|guessExpRat| 722 |guessBinRat| 733) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 202
                                                 '(0 6 0 11 0 7 0 12 2 14 13 0
                                                   13 15 2 13 0 0 0 16 3 14 13
                                                   17 0 13 18 2 13 0 19 0 20 1
                                                   8 0 0 21 1 8 0 22 23 1 8 0
                                                   13 24 3 8 0 0 0 0 25 0 6 0
                                                   26 0 7 0 27 0 8 0 28 2 8 29
                                                   0 0 30 1 8 0 0 31 2 32 6 0
                                                   13 33 2 8 0 0 0 34 2 6 29 0
                                                   0 35 1 36 0 7 37 2 41 38 39
                                                   40 42 1 43 0 6 44 1 45 0 43
                                                   46 1 36 7 0 47 1 48 0 7 49 1
                                                   36 7 0 50 2 51 0 48 48 52 1
                                                   38 29 0 53 1 38 6 0 54 1 38
                                                   55 0 56 2 8 0 0 55 57 2 8 0
                                                   0 0 58 1 38 0 0 59 2 8 0 0 0
                                                   60 1 61 38 0 62 1 61 38 0 63
                                                   2 64 43 39 48 65 1 66 29 0
                                                   67 0 38 0 68 1 66 48 0 69 1
                                                   70 0 19 71 3 43 0 0 72 32 73
                                                   1 43 6 0 74 1 66 55 0 75 2
                                                   38 0 6 55 76 1 66 0 0 77 2
                                                   38 0 0 0 78 1 81 79 80 82 2
                                                   51 0 0 48 83 1 51 48 0 84 2
                                                   86 66 85 80 87 1 66 0 48 88
                                                   2 89 0 66 66 90 2 48 55 0 70
                                                   91 1 7 0 13 92 3 48 0 0 70 7
                                                   93 1 48 40 0 94 1 40 55 0 95
                                                   1 40 7 0 96 2 7 0 0 55 97 1
                                                   7 0 0 98 2 7 0 0 0 99 1 7 29
                                                   0 100 2 40 7 0 0 101 2 7 102
                                                   0 0 103 1 48 0 70 104 1 51 0
                                                   48 105 2 6 0 0 0 106 2 51 0
                                                   0 0 107 2 51 0 0 0 108 2 8 0
                                                   0 0 109 1 14 13 0 110 1 13 0
                                                   0 111 2 51 0 0 13 112 1 115
                                                   113 114 116 1 115 29 114 117
                                                   1 55 118 0 119 2 118 0 0 0
                                                   120 1 122 121 118 123 1 125
                                                   121 124 126 3 129 127 128
                                                   128 55 130 2 80 51 131 51
                                                   132 2 51 0 0 0 133 1 51 48 0
                                                   134 1 136 40 135 137 2 40 0
                                                   0 0 138 1 40 0 0 139 1 141
                                                   140 38 142 1 140 144 0 145 2
                                                   38 6 0 55 146 2 6 0 0 0 147
                                                   1 6 0 0 148 3 43 0 0 70 6
                                                   149 1 43 29 0 150 1 43 38 0
                                                   151 1 127 80 0 152 1 127 80
                                                   0 153 2 89 0 0 0 154 1 89 66
                                                   0 155 1 89 66 0 156 1 122
                                                   121 124 157 2 61 0 38 38 158
                                                   1 159 0 22 160 3 8 0 0 161 0
                                                   162 2 8 0 0 0 163 1 115 29
                                                   114 164 1 115 55 114 165 1
                                                   115 22 114 166 2 32 0 0 55
                                                   167 0 8 0 168 2 6 29 0 0 169
                                                   2 13 0 0 0 170 2 13 29 0 0
                                                   171 2 173 0 172 0 174 1 0
                                                   176 22 177 2 48 0 13 0 178 2
                                                   48 0 0 0 179 1 48 0 13 180 2
                                                   48 0 0 0 181 2 48 0 0 0 182
                                                   0 48 0 183 3 185 48 184 0 48
                                                   186 1 13 0 0 187 2 8 0 0 0
                                                   188 2 51 0 0 0 189 3 48 0 0
                                                   0 70 190 0 51 0 192 1 6 0 22
                                                   193 3 128 51 194 0 51 195 2
                                                   196 0 8 8 197 2 198 0 22 196
                                                   199 2 8 0 0 200 201 1 0 176
                                                   22 202 1 1 176 22 177 2 0
                                                   173 32 114 175 1 1 176 22
                                                   202 2 0 173 32 114 191)))))
           '|lookupComplete|)) 
