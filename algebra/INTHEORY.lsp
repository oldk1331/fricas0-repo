
(SDEFUN |INTHEORY;harmonic;IF;1| ((|n| |Integer|) ($ |Fraction| (|Integer|)))
        (SPROG
         ((|h| #1=(|Fraction| (|Integer|))) (#2=#:G133 NIL) (|k| NIL)
          (|s| #3=(|Integer|))
          (|#G3| (|Record| (|:| |Hn| #3#) (|:| |Hv| #1#))))
         (SEQ
          (COND
           ((< |n| 0) (|error| "harmonic not defined for negative integers"))
           (#4='T
            (SEQ
             (COND
              ((>= |n| (QCAR (QREFELT $ 16)))
               (PROGN
                (LETT |#G3| (QREFELT $ 16) . #5=(|INTHEORY;harmonic;IF;1|))
                (LETT |s| (QCAR |#G3|) . #5#)
                (LETT |h| (QCDR |#G3|) . #5#)
                |#G3|))
              (#4#
               (SEQ (LETT |s| 0 . #5#)
                    (EXIT (LETT |h| (|spadConstant| $ 17) . #5#)))))
             (SEQ (LETT |k| (+ |s| 1) . #5#) (LETT #2# |n| . #5#) G190
                  (COND ((> |k| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT |h|
                          (SPADCALL |h| (SPADCALL 1 |k| (QREFELT $ 18))
                                    (QREFELT $ 19))
                          . #5#)))
                  (LETT |k| (+ |k| 1) . #5#) (GO G190) G191 (EXIT NIL))
             (PROGN (RPLACA (QREFELT $ 16) |n|) (QCAR (QREFELT $ 16)))
             (PROGN (RPLACD (QREFELT $ 16) |h|) (QCDR (QREFELT $ 16)))
             (EXIT |h|))))))) 

(SDEFUN |INTHEORY;fibonacci;2I;2| ((|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|f2| #1=(|Integer|)) (|f1| #1#) (|#G14| #2=(|Integer|)) (|#G13| #2#)
          (|#G12| #2#) (|#G11| #2#) (|t| (|Integer|)) (|k| NIL)
          (|#G9| (|PositiveInteger|)) (|#G8| (|NonNegativeInteger|)))
         (SEQ
          (COND ((EQL |n| 0) 0)
                ((< |n| 0)
                 (* (COND ((ODDP |n|) 1) (#3='T -1))
                    (SPADCALL (- |n|) (QREFELT $ 21))))
                (#3#
                 (SEQ
                  (PROGN
                   (LETT |#G8| 0 . #4=(|INTHEORY;fibonacci;2I;2|))
                   (LETT |#G9| 1 . #4#)
                   (LETT |f1| |#G8| . #4#)
                   (LETT |f2| |#G9| . #4#))
                  (SEQ (LETT |k| (- (INTEGER-LENGTH |n|) 2) . #4#) G190
                       (COND ((< |k| 0) (GO G191)))
                       (SEQ (LETT |t| (SPADCALL |f2| 2 (QREFELT $ 23)) . #4#)
                            (PROGN
                             (LETT |#G11|
                                   (+ |t| (SPADCALL |f1| 2 (QREFELT $ 23)))
                                   . #4#)
                             (LETT |#G12|
                                   (+ |t|
                                      (* (SPADCALL 2 |f1| (QREFELT $ 24))
                                         |f2|))
                                   . #4#)
                             (LETT |f1| |#G11| . #4#)
                             (LETT |f2| |#G12| . #4#))
                            (EXIT
                             (COND
                              ((SPADCALL |n| |k| (QREFELT $ 26))
                               (PROGN
                                (LETT |#G13| |f2| . #4#)
                                (LETT |#G14| (+ |f1| |f2|) . #4#)
                                (LETT |f1| |#G13| . #4#)
                                (LETT |f2| |#G14| . #4#))))))
                       (LETT |k| (+ |k| -1) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT |f2|))))))) 

(SDEFUN |INTHEORY;carmichaelLambda;2I;3| ((|n| |Integer|) ($ |Integer|))
        (SPROG ((#1=#:G146 NIL) (|pk| NIL) (#2=#:G145 NIL))
               (SEQ
                (COND
                 ((SPADCALL |n| 0 (QREFELT $ 27))
                  (|error|
                   "carmichaelLambda defined only for positive integers"))
                 ('T
                  (SPADCALL
                   (PROGN
                    (LETT #2# NIL . #3=(|INTHEORY;carmichaelLambda;2I;3|))
                    (SEQ (LETT |pk| NIL . #3#)
                         (LETT #1#
                               (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                         (QREFELT $ 33))
                               . #3#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |pk| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (COND
                                   ((OR (>= (QCAR |pk|) 3)
                                        (SPADCALL (QCDR |pk|) 2
                                                  (QREFELT $ 34)))
                                    (* (EXPT (QCAR |pk|) (- (QCDR |pk|) 1))
                                       (- (QCAR |pk|) 1)))
                                   ('T (EXPT 2 (- (QCDR |pk|) 2))))
                                  #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT $ 36))))))) 

(SDEFUN |INTHEORY;euler;2I;4| ((|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|e| #1=(|Integer|)) (|t| #1#) (#2=#:G160 NIL) (|j| NIL)
          (#3=#:G159 NIL) (|i| NIL) (#4=#:G158 NIL) (#5=#:G148 NIL)
          (|l| (|Integer|)))
         (SEQ
          (COND ((< |n| 0) (|error| "euler not defined for negative integers"))
                ((ODDP |n|) 0)
                (#6='T
                 (SEQ
                  (LETT |l| (SPADCALL (QREFELT $ 10) (QREFELT $ 38))
                        . #7=(|INTHEORY;euler;2I;4|))
                  (EXIT
                   (COND
                    ((< |n| |l|) (SPADCALL (QREFELT $ 10) |n| (QREFELT $ 39)))
                    (#6#
                     (SEQ
                      (SPADCALL (QREFELT $ 10)
                                (SPADCALL
                                 (PROG1 (LETT #5# (- (+ |n| 1) |l|) . #7#)
                                   (|check_subtype2| (>= #5# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #5#))
                                 0 (QREFELT $ 9))
                                (QREFELT $ 40))
                      (SEQ (LETT |i| 1 . #7#) (LETT #4# |l| . #7#) G190
                           (COND ((> |i| #4#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL (QREFELT $ 10) |i| 0 (QREFELT $ 41))))
                           (LETT |i| (+ |i| 2) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (SEQ (LETT |i| (+ |l| 1) . #7#) (LETT #3# |n| . #7#) G190
                           (COND ((> |i| #3#) (GO G191)))
                           (SEQ (LETT |t| (LETT |e| 1 . #7#) . #7#)
                                (SEQ (LETT |j| 2 . #7#)
                                     (LETT #2# (- |i| 2) . #7#) G190
                                     (COND ((> |j| #2#) (GO G191)))
                                     (SEQ
                                      (LETT |t|
                                            (QUOTIENT2
                                             (* (* |t| (+ (- |i| |j|) 1))
                                                (+ (- |i| |j|) 2))
                                             (SPADCALL |j| (- |j| 1)
                                                       (QREFELT $ 42)))
                                            . #7#)
                                      (EXIT
                                       (LETT |e|
                                             (+ |e|
                                                (* |t|
                                                   (SPADCALL (QREFELT $ 10) |j|
                                                             (QREFELT $ 39))))
                                             . #7#)))
                                     (LETT |j| (+ |j| 2) . #7#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (SPADCALL (QREFELT $ 10) |i| (- |e|)
                                           (QREFELT $ 41))))
                           (LETT |i| (+ |i| 2) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (SPADCALL (QREFELT $ 10) |n| (QREFELT $ 39))))))))))))) 

(SDEFUN |INTHEORY;bernoulli;IF;5| ((|n| |Integer|) ($ |Fraction| (|Integer|)))
        (SPROG
         ((|b| (|Fraction| (|Integer|))) (|t| (|Integer|)) (#1=#:G174 NIL)
          (|j| NIL) (#2=#:G173 NIL) (|i| NIL) (#3=#:G172 NIL) (#4=#:G162 NIL)
          (|l| (|Integer|)))
         (SEQ
          (COND
           ((< |n| 0) (|error| "bernoulli not defined for negative integers"))
           ((ODDP |n|)
            (COND
             ((EQL |n| 1)
              (SPADCALL (SPADCALL 1 2 (QREFELT $ 18)) (QREFELT $ 44)))
             (#5='T (|spadConstant| $ 17))))
           (#5#
            (SEQ
             (LETT |l| (SPADCALL (QREFELT $ 15) (QREFELT $ 45))
                   . #6=(|INTHEORY;bernoulli;IF;5|))
             (EXIT
              (COND ((< |n| |l|) (SPADCALL (QREFELT $ 15) |n| (QREFELT $ 46)))
                    (#5#
                     (SEQ
                      (SPADCALL (QREFELT $ 15)
                                (SPADCALL
                                 (PROG1 (LETT #4# (- (+ |n| 1) |l|) . #6#)
                                   (|check_subtype2| (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #4#))
                                 (|spadConstant| $ 17) (QREFELT $ 14))
                                (QREFELT $ 47))
                      (SEQ (LETT |i| 1 . #6#) (LETT #3# |l| . #6#) G190
                           (COND ((> |i| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL (QREFELT $ 15) |i| (|spadConstant| $ 17)
                                       (QREFELT $ 48))))
                           (LETT |i| (+ |i| 2) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (SEQ (LETT |i| (+ |l| 1) . #6#) (LETT #2# |n| . #6#) G190
                           (COND ((> |i| #2#) (GO G191)))
                           (SEQ (LETT |t| 1 . #6#)
                                (LETT |b| (SPADCALL (- 1 |i|) 2 (QREFELT $ 18))
                                      . #6#)
                                (SEQ (LETT |j| 2 . #6#)
                                     (LETT #1# (- |i| 2) . #6#) G190
                                     (COND ((> |j| #1#) (GO G191)))
                                     (SEQ
                                      (LETT |t|
                                            (QUOTIENT2
                                             (* (* |t| (+ (- |i| |j|) 2))
                                                (+ (- |i| |j|) 3))
                                             (SPADCALL |j| (- |j| 1)
                                                       (QREFELT $ 42)))
                                            . #6#)
                                      (EXIT
                                       (LETT |b|
                                             (SPADCALL |b|
                                                       (SPADCALL
                                                        (SPADCALL |t|
                                                                  (QREFELT $
                                                                           49))
                                                        (SPADCALL
                                                         (QREFELT $ 15) |j|
                                                         (QREFELT $ 46))
                                                        (QREFELT $ 50))
                                                       (QREFELT $ 19))
                                             . #6#)))
                                     (LETT |j| (+ |j| 2) . #6#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (SPADCALL (QREFELT $ 15) |i|
                                           (SPADCALL
                                            (SPADCALL |b|
                                                      (SPADCALL (+ |i| 1)
                                                                (QREFELT $ 49))
                                                      (QREFELT $ 51))
                                            (QREFELT $ 44))
                                           (QREFELT $ 48))))
                           (LETT |i| (+ |i| 2) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (SPADCALL (QREFELT $ 15) |n| (QREFELT $ 46))))))))))))) 

(SDEFUN |INTHEORY;inverse|
        ((|a| |Integer|) (|b| . #1=(|Integer|)) ($ |Integer|))
        (SPROG
         ((|d1| #2=(|Integer|)) (|c1| (|Integer|)) (|#G30| #3=(|Integer|))
          (|#G29| #2#) (|#G28| #3#) (|#G27| #1#) (|r| #3#) (|q| (|Integer|))
          (|borg| #1#))
         (SEQ (LETT |borg| |b| . #4=(|INTHEORY;inverse|)) (LETT |c1| 1 . #4#)
              (LETT |d1| 0 . #4#)
              (SEQ G190
                   (COND ((NULL (SPADCALL |b| 0 (QREFELT $ 53))) (GO G191)))
                   (SEQ (LETT |q| (QUOTIENT2 |a| |b|) . #4#)
                        (LETT |r| (- |a| (* |q| |b|)) . #4#)
                        (PROGN
                         (LETT |#G27| |b| . #4#)
                         (LETT |#G28| |r| . #4#)
                         (LETT |a| |#G27| . #4#)
                         (LETT |b| |#G28| . #4#))
                        (EXIT
                         (PROGN
                          (LETT |#G29| |d1| . #4#)
                          (LETT |#G30| (- |c1| (* |q| |d1|)) . #4#)
                          (LETT |c1| |#G29| . #4#)
                          (LETT |d1| |#G30| . #4#))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((SPADCALL |a| 1 (QREFELT $ 53))
                 (|error| "moduli are not relatively prime"))
                ('T (SPADCALL |c1| |borg| (QREFELT $ 54)))))))) 

(SDEFUN |INTHEORY;chineseRemainder;5I;7|
        ((|x1| |Integer|) (|m1| |Integer|) (|x2| |Integer|) (|m2| |Integer|)
         ($ |Integer|))
        (SEQ
         (COND ((OR (< |m1| 0) (< |m2| 0)) (|error| "moduli must be positive"))
               ('T
                (SEQ
                 (LETT |x1| (SPADCALL |x1| |m1| (QREFELT $ 54))
                       . #1=(|INTHEORY;chineseRemainder;5I;7|))
                 (LETT |x2| (SPADCALL |x2| |m2| (QREFELT $ 54)) . #1#)
                 (EXIT
                  (+ |x1|
                     (* |m1|
                        (SPADCALL
                         (* (- |x2| |x1|) (|INTHEORY;inverse| |m1| |m2| $))
                         |m2| (QREFELT $ 54)))))))))) 

(SDEFUN |INTHEORY;jacobi;3I;8| ((|a| |Integer|) (|b| |Integer|) ($ |Integer|))
        (SPROG
         ((|j| (|Integer|)) (|k| NIL) (#1=#:G201 NIL) (|#G40| (|Integer|))
          (|#G39| (|Integer|)))
         (SEQ
          (COND ((< |b| 0) (LETT |b| (- |b|) . #2=(|INTHEORY;jacobi;3I;8|))))
          (EXIT
           (COND
            ((EQL |b| 0) (|error| "second argument of jacobi may not be 0"))
            ((EQL |b| 1) 1)
            (#3='T
             (SEQ
              (COND
               ((SPADCALL |b| (QREFELT $ 56))
                (COND
                 ((SPADCALL (SPADCALL |a| 4 (QREFELT $ 54)) 1 (QREFELT $ 57))
                  (EXIT
                   (|error|
                    "J(a/b) not defined for b even and a = 2 or 3 (mod 4)"))))))
              (COND
               ((SPADCALL |b| (QREFELT $ 56))
                (COND ((SPADCALL |a| (QREFELT $ 56)) (EXIT 0)))))
              (SEQ (LETT |k| 0 . #2#) G190
                   (COND ((NULL (SPADCALL |b| (QREFELT $ 56))) (GO G191)))
                   (SEQ (EXIT (LETT |b| (QUOTIENT2 |b| 2) . #2#)))
                   (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |j|
                    (SEQ
                     (COND
                      ((ODDP |k|)
                       (COND
                        ((EQL (SPADCALL |a| 8 (QREFELT $ 54)) 5) (EXIT -1)))))
                     (EXIT 1))
                    . #2#)
              (EXIT
               (COND ((EQL |b| 1) |j|)
                     (#3#
                      (SEQ (LETT |a| (SPADCALL |a| |b| (QREFELT $ 54)) . #2#)
                           (SEQ G190
                                (COND
                                 ((NULL (SPADCALL |a| 1 (QREFELT $ 57)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((ODDP |a|)
                                    (SEQ
                                     (COND
                                      ((EQL (REM |a| 4) 3)
                                       (COND
                                        ((EQL (REM |b| 4) 3)
                                         (LETT |j| (- |j|) . #2#)))))
                                     (EXIT
                                      (PROGN
                                       (LETT |#G39| (REM |b| |a|) . #2#)
                                       (LETT |#G40| |a| . #2#)
                                       (LETT |a| |#G39| . #2#)
                                       (LETT |b| |#G40| . #2#)))))
                                   ('T
                                    (SEQ
                                     (SEQ (LETT #1# NIL . #2#)
                                          (LETT |k| 0 . #2#) G190
                                          (COND (#1# (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |a| (QUOTIENT2 |a| 2)
                                                  . #2#)))
                                          (LETT |k|
                                                (PROG1 (|inc_SI| |k|)
                                                  (LETT #1# (ODDP |a|) . #2#))
                                                . #2#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((ODDP |k|)
                                        (COND
                                         ((SPADCALL (REM (+ |b| 2) 8) 4
                                                    (QREFELT $ 57))
                                          (LETT |j| (- |j|) . #2#)))))))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (COND ((EQL |a| 0) 0) (#3# |j|)))))))))))))) 

(SDEFUN |INTHEORY;legendre;3I;9|
        ((|a| |Integer|) (|p| |Integer|) ($ |Integer|))
        (COND
         ((< |p| 0)
          (|error| "legendre not defined for negative characteristic"))
         ((SPADCALL |p| (QREFELT $ 60)) (SPADCALL |a| |p| (QREFELT $ 58)))
         ('T (|error| "characteristic of legendre must be prime")))) 

(SDEFUN |INTHEORY;eulerPhi;2I;10| ((|n| |Integer|) ($ |Integer|))
        (SPROG ((|r| (|Fraction| (|Integer|))) (#1=#:G208 NIL) (|entry| NIL))
               (SEQ
                (COND ((EQL |n| 0) 0)
                      ('T
                       (SEQ
                        (LETT |r| (|spadConstant| $ 12)
                              . #2=(|INTHEORY;eulerPhi;2I;10|))
                        (SEQ (LETT |entry| NIL . #2#)
                             (LETT #1#
                                   (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                             (QREFELT $ 33))
                                   . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |entry| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |r|
                                     (SPADCALL
                                      (SPADCALL (- (QCAR |entry|) 1)
                                                (QCAR |entry|) (QREFELT $ 18))
                                      |r| (QREFELT $ 50))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL (SPADCALL |n| |r| (QREFELT $ 62))
                                   (QREFELT $ 63))))))))) 

(SDEFUN |INTHEORY;divisors;IL;11| ((|n| |Integer|) ($ |List| (|Integer|)))
        (SPROG
         ((|oldList| #1=(|List| (|Integer|))) (|newList| #1#) (#2=#:G219 NIL)
          (|m| NIL) (|pow| (|Integer|)) (#3=#:G218 NIL) (|k| NIL)
          (#4=#:G217 NIL) (|f| NIL))
         (SEQ (LETT |oldList| (LIST 1) . #5=(|INTHEORY;divisors;IL;11|))
              (SEQ (LETT |f| NIL . #5#)
                   (LETT #4#
                         (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                   (QREFELT $ 33))
                         . #5#)
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |newList| |oldList| . #5#)
                        (SEQ (LETT |k| 1 . #5#) (LETT #3# (QCDR |f|) . #5#)
                             G190 (COND ((|greater_SI| |k| #3#) (GO G191)))
                             (SEQ (LETT |pow| (EXPT (QCAR |f|) |k|) . #5#)
                                  (EXIT
                                   (SEQ (LETT |m| NIL . #5#)
                                        (LETT #2# |oldList| . #5#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |m| (CAR #2#) . #5#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |newList|
                                                (CONS (* |pow| |m|) |newList|)
                                                . #5#)))
                                        (LETT #2# (CDR #2#) . #5#) (GO G190)
                                        G191 (EXIT NIL))))
                             (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |oldList| |newList| . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (ELT $ 65) |oldList| (QREFELT $ 68)))))) 

(SDEFUN |INTHEORY;numberOfDivisors;2I;12|
        ((|n| |Integer|) ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G222 NIL) (#3=#:G221 #1#) (#4=#:G223 #1#) (#5=#:G225 NIL)
          (|entry| NIL))
         (SEQ
          (COND ((EQL |n| 0) 0)
                (#6='T
                 (PROGN
                  (LETT #2# NIL . #7=(|INTHEORY;numberOfDivisors;2I;12|))
                  (SEQ (LETT |entry| NIL . #7#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                       (QREFELT $ 33))
                             . #7#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |entry| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (+ 1 (QCDR |entry|)) . #7#)
                          (COND (#2# (LETT #3# (* #3# #4#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #3# #4# . #7#)
                                  (LETT #2# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) (#6# 1)))))))) 

(SDEFUN |INTHEORY;sumOfDivisors;2I;13| ((|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|r| #1=(|Fraction| (|Integer|))) (#2=#:G228 NIL) (#3=#:G227 #1#)
          (#4=#:G229 #1#) (#5=#:G232 NIL) (|entry| NIL))
         (SEQ
          (COND ((EQL |n| 0) 0)
                (#6='T
                 (SEQ
                  (LETT |r|
                        (PROGN
                         (LETT #2# NIL . #7=(|INTHEORY;sumOfDivisors;2I;13|))
                         (SEQ (LETT |entry| NIL . #7#)
                              (LETT #5#
                                    (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                              (QREFELT $ 33))
                                    . #7#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |entry| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4#
                                       (SPADCALL
                                        (-
                                         (EXPT (QCAR |entry|)
                                               (+ (QCDR |entry|) 1))
                                         1)
                                        (- (QCAR |entry|) 1) (QREFELT $ 18))
                                       . #7#)
                                 (COND
                                  (#2#
                                   (LETT #3# (SPADCALL #3# #4# (QREFELT $ 50))
                                         . #7#))
                                  ('T
                                   (PROGN
                                    (LETT #3# #4# . #7#)
                                    (LETT #2# 'T . #7#)))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#6# (|spadConstant| $ 12))))
                        . #7#)
                  (EXIT (SPADCALL |r| (QREFELT $ 63))))))))) 

(SDEFUN |INTHEORY;sumOfKthPowerDivisors;INniI;14|
        ((|n| |Integer|) (|k| |NonNegativeInteger|) ($ |Integer|))
        (SPROG
         ((|r| #1=(|Fraction| (|Integer|))) (#2=#:G235 NIL) (#3=#:G234 #1#)
          (#4=#:G236 #1#) (#5=#:G239 NIL) (|entry| NIL))
         (SEQ
          (COND ((EQL |n| 0) 0)
                (#6='T
                 (SEQ
                  (LETT |r|
                        (PROGN
                         (LETT #2# NIL
                               . #7=(|INTHEORY;sumOfKthPowerDivisors;INniI;14|))
                         (SEQ (LETT |entry| NIL . #7#)
                              (LETT #5#
                                    (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                              (QREFELT $ 33))
                                    . #7#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |entry| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4#
                                       (SPADCALL
                                        (-
                                         (EXPT (QCAR |entry|)
                                               (+ (* |k| (QCDR |entry|)) |k|))
                                         1)
                                        (- (EXPT (QCAR |entry|) |k|) 1)
                                        (QREFELT $ 18))
                                       . #7#)
                                 (COND
                                  (#2#
                                   (LETT #3# (SPADCALL #3# #4# (QREFELT $ 50))
                                         . #7#))
                                  ('T
                                   (PROGN
                                    (LETT #3# #4# . #7#)
                                    (LETT #2# 'T . #7#)))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#6# (|spadConstant| $ 12))))
                        . #7#)
                  (EXIT (SPADCALL |r| (QREFELT $ 63))))))))) 

(SDEFUN |INTHEORY;moebiusMu;2I;15| ((|n| |Integer|) ($ |Integer|))
        (SPROG
         ((#1=#:G245 NIL) (#2=#:G246 NIL) (#3=#:G247 NIL) (|k| NIL)
          (|t| (|Factored| (|Integer|))))
         (SEQ
          (EXIT
           (COND ((EQL |n| 1) 1)
                 (#4='T
                  (SEQ
                   (LETT |t| (SPADCALL |n| (QREFELT $ 29))
                         . #5=(|INTHEORY;moebiusMu;2I;15|))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| NIL . #5#)
                          (LETT #3# (SPADCALL |t| (QREFELT $ 33)) . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (QCDR |k|) 1 (QREFELT $ 73))
                              (PROGN
                               (LETT #1#
                                     (PROGN (LETT #2# 0 . #5#) (GO #6=#:G244))
                                     . #5#)
                               (GO #7=#:G242))))))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT NIL)))
                    #7# (EXIT #1#))
                   (EXIT
                    (COND ((ODDP (SPADCALL |t| (QREFELT $ 74))) -1)
                          (#4# 1)))))))
          #6# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |IntegerNumberTheoryFunctions;|)) 

(DEFUN |IntegerNumberTheoryFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G249)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|IntegerNumberTheoryFunctions|)
                    . #2=(|IntegerNumberTheoryFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|IntegerNumberTheoryFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|IntegerNumberTheoryFunctions;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|IntegerNumberTheoryFunctions|)))))))))) 

(DEFUN |IntegerNumberTheoryFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IntegerNumberTheoryFunctions|)
                . #1=(|IntegerNumberTheoryFunctions|))
          (LETT $ (GETREFV 76) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IntegerNumberTheoryFunctions| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (SPADCALL 1 1 (QREFELT $ 9)))
          (QSETREFV $ 15 (SPADCALL 1 (|spadConstant| $ 12) (QREFELT $ 14)))
          (QSETREFV $ 16 (CONS 1 (|spadConstant| $ 12)))
          $))) 

(MAKEPROP '|IntegerNumberTheoryFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) (|Integer|)
              (|IndexedFlexibleArray| 7 (NRTEVAL 0)) (0 . |new|) 'E
              (|Fraction| 7) (6 . |One|)
              (|IndexedFlexibleArray| 11 (NRTEVAL 0)) (10 . |new|) 'B 'H
              (16 . |Zero|) (20 . /) (26 . +) |INTHEORY;harmonic;IF;1|
              |INTHEORY;fibonacci;2I;2| (|PositiveInteger|) (32 . ^) (38 . *)
              (|Boolean|) (44 . |bit?|) (50 . <=) (|Factored| $)
              (56 . |factor|) (|Record| (|:| |factor| 7) (|:| |exponent| 6))
              (|List| 30) (|Factored| 7) (61 . |factors|) (66 . <=) (|List| $)
              (72 . |lcm|) |INTHEORY;carmichaelLambda;2I;3| (77 . |#|)
              (82 . |elt|) (88 . |concat!|) (94 . |setelt!|) (101 . *)
              |INTHEORY;euler;2I;4| (107 . -) (112 . |#|) (117 . |elt|)
              (123 . |concat!|) (129 . |setelt!|) (136 . |coerce|) (141 . *)
              (147 . /) |INTHEORY;bernoulli;IF;5| (153 . ~=)
              (159 . |positiveRemainder|) |INTHEORY;chineseRemainder;5I;7|
              (165 . |even?|) (170 . >) |INTHEORY;jacobi;3I;8|
              (|IntegerPrimesPackage| 7) (176 . |prime?|)
              |INTHEORY;legendre;3I;9| (181 . *) (187 . |numer|)
              |INTHEORY;eulerPhi;2I;10| (192 . <) (|Mapping| 25 7 7) (|List| 7)
              (198 . |sort|) |INTHEORY;divisors;IL;11|
              |INTHEORY;numberOfDivisors;2I;12| |INTHEORY;sumOfDivisors;2I;13|
              |INTHEORY;sumOfKthPowerDivisors;INniI;14| (204 . >)
              (210 . |numberOfFactors|) |INTHEORY;moebiusMu;2I;15|)
           '#(|sumOfKthPowerDivisors| 215 |sumOfDivisors| 221
              |numberOfDivisors| 226 |moebiusMu| 231 |legendre| 236 |jacobi|
              242 |harmonic| 248 |fibonacci| 253 |eulerPhi| 258 |euler| 263
              |divisors| 268 |chineseRemainder| 273 |carmichaelLambda| 281
              |bernoulli| 286)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 75
                                                 '(2 8 0 6 7 9 0 11 0 12 2 13 0
                                                   6 11 14 0 11 0 17 2 11 0 7 7
                                                   18 2 11 0 0 0 19 2 7 0 0 22
                                                   23 2 7 0 22 0 24 2 7 25 0 0
                                                   26 2 7 25 0 0 27 1 7 28 0 29
                                                   1 32 31 0 33 2 6 25 0 0 34 1
                                                   7 0 35 36 1 8 6 0 38 2 8 7 0
                                                   7 39 2 8 0 0 0 40 3 8 7 0 7
                                                   7 41 2 7 0 6 0 42 1 11 0 0
                                                   44 1 13 6 0 45 2 13 11 0 7
                                                   46 2 13 0 0 0 47 3 13 11 0 7
                                                   11 48 1 11 0 7 49 2 11 0 0
                                                   11 50 2 11 0 0 0 51 2 7 25 0
                                                   0 53 2 7 0 0 0 54 1 7 25 0
                                                   56 2 7 25 0 0 57 1 59 25 7
                                                   60 2 11 0 7 0 62 1 11 7 0 63
                                                   2 7 25 0 0 65 2 67 0 66 0 68
                                                   2 6 25 0 0 73 1 32 6 0 74 2
                                                   0 7 7 6 72 1 0 7 7 71 1 0 7
                                                   7 70 1 0 7 7 75 2 0 7 7 7 61
                                                   2 0 7 7 7 58 1 0 11 7 20 1 0
                                                   7 7 21 1 0 7 7 64 1 0 7 7 43
                                                   1 0 67 7 69 4 0 7 7 7 7 7 55
                                                   1 0 7 7 37 1 0 11 7 52)))))
           '|lookupComplete|)) 

(MAKEPROP '|IntegerNumberTheoryFunctions| 'NILADIC T) 
