
(/VERSIONCHECK 2) 

(DEFUN |INTHEORY;harmonic;IF;1| (|n| $)
  (PROG (|h| |k| |s| |#G3|)
    (RETURN
     (SEQ
      (COND ((< |n| 0) (|error| "harmonic not defined for negative integers"))
            (#1='T
             (SEQ
              (COND
               ((>= |n| (QCAR (QREFELT $ 16)))
                (PROGN
                 (LETT |#G3| (QREFELT $ 16) . #2=(|INTHEORY;harmonic;IF;1|))
                 (LETT |s| (QCAR |#G3|) . #2#)
                 (LETT |h| (QCDR |#G3|) . #2#)
                 |#G3|))
               (#1#
                (SEQ (LETT |s| 0 . #2#)
                     (EXIT (LETT |h| (|spadConstant| $ 17) . #2#)))))
              (SEQ (LETT |k| (+ |s| 1) . #2#) G190
                   (COND ((> |k| |n|) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |h|
                           (SPADCALL |h| (SPADCALL 1 |k| (QREFELT $ 18))
                                     (QREFELT $ 19))
                           . #2#)))
                   (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (PROGN (RPLACA (QREFELT $ 16) |n|) (QCAR (QREFELT $ 16)))
              (PROGN (RPLACD (QREFELT $ 16) |h|) (QCDR (QREFELT $ 16)))
              (EXIT |h|)))))))) 

(DEFUN |INTHEORY;fibonacci;2I;2| (|n| $)
  (PROG (|f2| |f1| |#G14| |#G13| |#G12| |#G11| |t| |k| |#G9| |#G8|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) 0)
            ((< |n| 0)
             (* (COND ((ODDP |n|) 1) (#1='T -1))
                (SPADCALL (- |n|) (QREFELT $ 21))))
            (#1#
             (SEQ
              (PROGN
               (LETT |#G8| 0 . #2=(|INTHEORY;fibonacci;2I;2|))
               (LETT |#G9| 1 . #2#)
               (LETT |f1| |#G8| . #2#)
               (LETT |f2| |#G9| . #2#))
              (SEQ (LETT |k| (- (INTEGER-LENGTH |n|) 2) . #2#) G190
                   (COND ((< |k| 0) (GO G191)))
                   (SEQ (LETT |t| (SPADCALL |f2| 2 (QREFELT $ 23)) . #2#)
                        (PROGN
                         (LETT |#G11| (+ |t| (SPADCALL |f1| 2 (QREFELT $ 23)))
                               . #2#)
                         (LETT |#G12|
                               (+ |t|
                                  (* (SPADCALL 2 |f1| (QREFELT $ 24)) |f2|))
                               . #2#)
                         (LETT |f1| |#G11| . #2#)
                         (LETT |f2| |#G12| . #2#))
                        (EXIT
                         (COND
                          ((SPADCALL |n| |k| (QREFELT $ 26))
                           (PROGN
                            (LETT |#G13| |f2| . #2#)
                            (LETT |#G14| (+ |f1| |f2|) . #2#)
                            (LETT |f1| |#G13| . #2#)
                            (LETT |f2| |#G14| . #2#))))))
                   (LETT |k| (+ |k| -1) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |f2|)))))))) 

(DEFUN |INTHEORY;carmichaelLambda;2I;3| (|n| $)
  (PROG (#1=#:G143 |pk| #2=#:G142)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |n| 0 (QREFELT $ 27))
        (|error| "carmichaelLambda defined only for positive integers"))
       ('T
        (SPADCALL
         (PROGN
          (LETT #2# NIL . #3=(|INTHEORY;carmichaelLambda;2I;3|))
          (SEQ (LETT |pk| NIL . #3#)
               (LETT #1#
                     (SPADCALL (SPADCALL |n| (QREFELT $ 29)) (QREFELT $ 33))
                     . #3#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |pk| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT #2#
                       (CONS
                        (COND
                         ((OR (>= (QCAR |pk|) 3)
                              (SPADCALL (QCDR |pk|) 2 (QREFELT $ 27)))
                          (* (EXPT (QCAR |pk|) (- (QCDR |pk|) 1))
                             (- (QCAR |pk|) 1)))
                         ('T (EXPT 2 (- (QCDR |pk|) 2))))
                        #2#)
                       . #3#)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#))))
         (QREFELT $ 35)))))))) 

(DEFUN |INTHEORY;euler;2I;4| (|n| $)
  (PROG (|e| |t| #1=#:G155 |j| |i| #2=#:G145 |l|)
    (RETURN
     (SEQ
      (COND ((< |n| 0) (|error| "euler not defined for negative integers"))
            ((ODDP |n|) 0)
            (#3='T
             (SEQ
              (LETT |l| (SPADCALL (QREFELT $ 10) (QREFELT $ 37))
                    . #4=(|INTHEORY;euler;2I;4|))
              (EXIT
               (COND ((< |n| |l|) (SPADCALL (QREFELT $ 10) |n| (QREFELT $ 38)))
                     (#3#
                      (SEQ
                       (SPADCALL (QREFELT $ 10)
                                 (SPADCALL
                                  (PROG1 (LETT #2# (- (+ |n| 1) |l|) . #4#)
                                    (|check_subtype| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     #2#))
                                  0 (QREFELT $ 9))
                                 (QREFELT $ 39))
                       (SEQ (LETT |i| 1 . #4#) G190
                            (COND ((> |i| |l|) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL (QREFELT $ 10) |i| 0 (QREFELT $ 40))))
                            (LETT |i| (+ |i| 2) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (SEQ (LETT |i| (+ |l| 1) . #4#) G190
                            (COND ((> |i| |n|) (GO G191)))
                            (SEQ (LETT |t| (LETT |e| 1 . #4#) . #4#)
                                 (SEQ (LETT |j| 2 . #4#)
                                      (LETT #1# (- |i| 2) . #4#) G190
                                      (COND ((> |j| #1#) (GO G191)))
                                      (SEQ
                                       (LETT |t|
                                             (QUOTIENT2
                                              (* (* |t| (+ (- |i| |j|) 1))
                                                 (+ (- |i| |j|) 2))
                                              (SPADCALL |j| (- |j| 1)
                                                        (QREFELT $ 41)))
                                             . #4#)
                                       (EXIT
                                        (LETT |e|
                                              (+ |e|
                                                 (* |t|
                                                    (SPADCALL (QREFELT $ 10)
                                                              |j|
                                                              (QREFELT $ 38))))
                                              . #4#)))
                                      (LETT |j| (+ |j| 2) . #4#) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT
                                  (SPADCALL (QREFELT $ 10) |i| (- |e|)
                                            (QREFELT $ 40))))
                            (LETT |i| (+ |i| 2) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SPADCALL (QREFELT $ 10) |n| (QREFELT $ 38)))))))))))))) 

(DEFUN |INTHEORY;bernoulli;IF;5| (|n| $)
  (PROG (|b| |t| #1=#:G167 |j| |i| #2=#:G157 |l|)
    (RETURN
     (SEQ
      (COND ((< |n| 0) (|error| "bernoulli not defined for negative integers"))
            ((ODDP |n|)
             (COND
              ((EQL |n| 1)
               (SPADCALL (SPADCALL 1 2 (QREFELT $ 18)) (QREFELT $ 43)))
              (#3='T (|spadConstant| $ 17))))
            (#3#
             (SEQ
              (LETT |l| (SPADCALL (QREFELT $ 15) (QREFELT $ 44))
                    . #4=(|INTHEORY;bernoulli;IF;5|))
              (EXIT
               (COND ((< |n| |l|) (SPADCALL (QREFELT $ 15) |n| (QREFELT $ 45)))
                     (#3#
                      (SEQ
                       (SPADCALL (QREFELT $ 15)
                                 (SPADCALL
                                  (PROG1 (LETT #2# (- (+ |n| 1) |l|) . #4#)
                                    (|check_subtype| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     #2#))
                                  (|spadConstant| $ 17) (QREFELT $ 14))
                                 (QREFELT $ 46))
                       (SEQ (LETT |i| 1 . #4#) G190
                            (COND ((> |i| |l|) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL (QREFELT $ 15) |i|
                                        (|spadConstant| $ 17) (QREFELT $ 47))))
                            (LETT |i| (+ |i| 2) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (SEQ (LETT |i| (+ |l| 1) . #4#) G190
                            (COND ((> |i| |n|) (GO G191)))
                            (SEQ (LETT |t| 1 . #4#)
                                 (LETT |b|
                                       (SPADCALL (- 1 |i|) 2 (QREFELT $ 18))
                                       . #4#)
                                 (SEQ (LETT |j| 2 . #4#)
                                      (LETT #1# (- |i| 2) . #4#) G190
                                      (COND ((> |j| #1#) (GO G191)))
                                      (SEQ
                                       (LETT |t|
                                             (QUOTIENT2
                                              (* (* |t| (+ (- |i| |j|) 2))
                                                 (+ (- |i| |j|) 3))
                                              (SPADCALL |j| (- |j| 1)
                                                        (QREFELT $ 41)))
                                             . #4#)
                                       (EXIT
                                        (LETT |b|
                                              (SPADCALL |b|
                                                        (SPADCALL
                                                         (SPADCALL |t|
                                                                   (QREFELT $
                                                                            48))
                                                         (SPADCALL
                                                          (QREFELT $ 15) |j|
                                                          (QREFELT $ 45))
                                                         (QREFELT $ 49))
                                                        (QREFELT $ 19))
                                              . #4#)))
                                      (LETT |j| (+ |j| 2) . #4#) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT
                                  (SPADCALL (QREFELT $ 15) |i|
                                            (SPADCALL
                                             (SPADCALL |b|
                                                       (SPADCALL (+ |i| 1)
                                                                 (QREFELT $
                                                                          48))
                                                       (QREFELT $ 50))
                                             (QREFELT $ 43))
                                            (QREFELT $ 47))))
                            (LETT |i| (+ |i| 2) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SPADCALL (QREFELT $ 15) |n| (QREFELT $ 45)))))))))))))) 

(DEFUN |INTHEORY;inverse| (|a| |b| $)
  (PROG (|d1| |c1| |#G30| |#G29| |#G28| |#G27| |r| |q| |borg|)
    (RETURN
     (SEQ (LETT |borg| |b| . #1=(|INTHEORY;inverse|)) (LETT |c1| 1 . #1#)
          (LETT |d1| 0 . #1#)
          (SEQ G190 (COND ((NULL (SPADCALL |b| 0 (QREFELT $ 52))) (GO G191)))
               (SEQ (LETT |q| (QUOTIENT2 |a| |b|) . #1#)
                    (LETT |r| (- |a| (* |q| |b|)) . #1#)
                    (PROGN
                     (LETT |#G27| |b| . #1#)
                     (LETT |#G28| |r| . #1#)
                     (LETT |a| |#G27| . #1#)
                     (LETT |b| |#G28| . #1#))
                    (EXIT
                     (PROGN
                      (LETT |#G29| |d1| . #1#)
                      (LETT |#G30| (- |c1| (* |q| |d1|)) . #1#)
                      (LETT |c1| |#G29| . #1#)
                      (LETT |d1| |#G30| . #1#))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |a| 1 (QREFELT $ 52))
             (|error| "moduli are not relatively prime"))
            ('T (SPADCALL |c1| |borg| (QREFELT $ 53))))))))) 

(DEFUN |INTHEORY;chineseRemainder;5I;7| (|x1| |m1| |x2| |m2| $)
  (SEQ
   (COND ((OR (< |m1| 0) (< |m2| 0)) (|error| "moduli must be positive"))
         ('T
          (SEQ
           (LETT |x1| (SPADCALL |x1| |m1| (QREFELT $ 53))
                 . #1=(|INTHEORY;chineseRemainder;5I;7|))
           (LETT |x2| (SPADCALL |x2| |m2| (QREFELT $ 53)) . #1#)
           (EXIT
            (+ |x1|
               (* |m1|
                  (SPADCALL (* (- |x2| |x1|) (|INTHEORY;inverse| |m1| |m2| $))
                            |m2| (QREFELT $ 53)))))))))) 

(DEFUN |INTHEORY;jacobi;3I;8| (|a| |b| $)
  (PROG (|j| |k| #1=#:G194 |#G40| |#G39|)
    (RETURN
     (SEQ (COND ((< |b| 0) (LETT |b| (- |b|) . #2=(|INTHEORY;jacobi;3I;8|))))
          (EXIT
           (COND
            ((EQL |b| 0) (|error| "second argument of jacobi may not be 0"))
            ((EQL |b| 1) 1)
            (#3='T
             (SEQ
              (COND
               ((SPADCALL |b| (QREFELT $ 55))
                (COND
                 ((SPADCALL (SPADCALL |a| 4 (QREFELT $ 53)) 1 (QREFELT $ 56))
                  (EXIT
                   (|error|
                    "J(a/b) not defined for b even and a = 2 or 3 (mod 4)"))))))
              (COND
               ((SPADCALL |b| (QREFELT $ 55))
                (COND ((SPADCALL |a| (QREFELT $ 55)) (EXIT 0)))))
              (SEQ (LETT |k| 0 . #2#) G190
                   (COND ((NULL (SPADCALL |b| (QREFELT $ 55))) (GO G191)))
                   (SEQ (EXIT (LETT |b| (QUOTIENT2 |b| 2) . #2#)))
                   (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |j|
                    (SEQ
                     (COND
                      ((ODDP |k|)
                       (COND
                        ((EQL (SPADCALL |a| 8 (QREFELT $ 53)) 5) (EXIT -1)))))
                     (EXIT 1))
                    . #2#)
              (EXIT
               (COND ((EQL |b| 1) |j|)
                     (#3#
                      (SEQ (LETT |a| (SPADCALL |a| |b| (QREFELT $ 53)) . #2#)
                           (SEQ G190
                                (COND
                                 ((NULL (SPADCALL |a| 1 (QREFELT $ 56)))
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
                                                    (QREFELT $ 56))
                                          (LETT |j| (- |j|) . #2#)))))))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (COND ((EQL |a| 0) 0) (#3# |j|))))))))))))))) 

(DEFUN |INTHEORY;legendre;3I;9| (|a| |p| $)
  (COND
   ((< |p| 0) (|error| "legendre not defined for negative characteristic"))
   ((SPADCALL |p| (QREFELT $ 59)) (SPADCALL |a| |p| (QREFELT $ 57)))
   ('T (|error| "characteristic of legendre must be prime")))) 

(DEFUN |INTHEORY;eulerPhi;2I;10| (|n| $)
  (PROG (|r| #1=#:G201 |entry|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) 0)
            ('T
             (SEQ
              (LETT |r| (|spadConstant| $ 12) . #2=(|INTHEORY;eulerPhi;2I;10|))
              (SEQ (LETT |entry| NIL . #2#)
                   (LETT #1#
                         (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                   (QREFELT $ 33))
                         . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |entry| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL (- (QCAR |entry|) 1) (QCAR |entry|)
                                      (QREFELT $ 18))
                            |r| (QREFELT $ 49))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |n| |r| (QREFELT $ 61))
                         (QREFELT $ 62)))))))))) 

(DEFUN |INTHEORY;divisors;IL;11| (|n| $)
  (PROG (|oldList| |newList| #1=#:G212 |m| |pow| #2=#:G211 |k| #3=#:G210 |f|)
    (RETURN
     (SEQ (LETT |oldList| (LIST 1) . #4=(|INTHEORY;divisors;IL;11|))
          (SEQ (LETT |f| NIL . #4#)
               (LETT #3#
                     (SPADCALL (SPADCALL |n| (QREFELT $ 29)) (QREFELT $ 33))
                     . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |newList| |oldList| . #4#)
                    (SEQ (LETT |k| 1 . #4#) (LETT #2# (QCDR |f|) . #4#) G190
                         (COND ((|greater_SI| |k| #2#) (GO G191)))
                         (SEQ (LETT |pow| (EXPT (QCAR |f|) |k|) . #4#)
                              (EXIT
                               (SEQ (LETT |m| NIL . #4#)
                                    (LETT #1# |oldList| . #4#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |m| (CAR #1#) . #4#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |newList|
                                            (CONS (* |pow| |m|) |newList|)
                                            . #4#)))
                                    (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                    (EXIT NIL))))
                         (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (LETT |oldList| |newList| . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (ELT $ 64) |oldList| (QREFELT $ 67))))))) 

(DEFUN |INTHEORY;numberOfDivisors;2I;12| (|n| $)
  (PROG (#1=#:G215 #2=#:G214 #3=#:G216 #4=#:G218 |entry|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) 0)
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|INTHEORY;numberOfDivisors;2I;12|))
              (SEQ (LETT |entry| NIL . #6#)
                   (LETT #4#
                         (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                   (QREFELT $ 33))
                         . #6#)
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |entry| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (+ 1 (QCDR |entry|)) . #6#)
                      (COND (#1# (LETT #2# (* #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# 1))))))))) 

(DEFUN |INTHEORY;sumOfDivisors;2I;13| (|n| $)
  (PROG (|r| #1=#:G221 #2=#:G220 #3=#:G222 #4=#:G223 #5=#:G226 |entry|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) 0)
            (#6='T
             (SEQ
              (LETT |r|
                    (PROGN
                     (LETT #1# NIL . #7=(|INTHEORY;sumOfDivisors;2I;13|))
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
                             (LETT #3#
                                   (SPADCALL
                                    (-
                                     (EXPT (QCAR |entry|)
                                           (+
                                            (PROG1
                                                (LETT #4# (QCDR |entry|) . #7#)
                                              (|check_subtype| (>= #4# 0)
                                                               '(|NonNegativeInteger|)
                                                               #4#))
                                            1))
                                     1)
                                    (- (QCAR |entry|) 1) (QREFELT $ 18))
                                   . #7#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 49))
                                     . #7#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #7#)
                                (LETT #1# 'T . #7#)))))))
                          (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) (#6# (|spadConstant| $ 12))))
                    . #7#)
              (EXIT (SPADCALL |r| (QREFELT $ 62)))))))))) 

(DEFUN |INTHEORY;sumOfKthPowerDivisors;INniI;14| (|n| |k| $)
  (PROG (|r| #1=#:G229 #2=#:G228 #3=#:G230 #4=#:G231 #5=#:G234 |entry|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) 0)
            (#6='T
             (SEQ
              (LETT |r|
                    (PROGN
                     (LETT #1# NIL
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
                             (LETT #3#
                                   (SPADCALL
                                    (-
                                     (EXPT (QCAR |entry|)
                                           (+
                                            (* |k|
                                               (PROG1
                                                   (LETT #4# (QCDR |entry|)
                                                         . #7#)
                                                 (|check_subtype| (>= #4# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #4#)))
                                            |k|))
                                     1)
                                    (- (EXPT (QCAR |entry|) |k|) 1)
                                    (QREFELT $ 18))
                                   . #7#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 49))
                                     . #7#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #7#)
                                (LETT #1# 'T . #7#)))))))
                          (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) (#6# (|spadConstant| $ 12))))
                    . #7#)
              (EXIT (SPADCALL |r| (QREFELT $ 62)))))))))) 

(DEFUN |INTHEORY;moebiusMu;2I;15| (|n| $)
  (PROG (#1=#:G237 #2=#:G239 #3=#:G240 |k| |t|)
    (RETURN
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
                       ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QCDR |k|) 1 (QREFELT $ 56))
                          (PROGN
                           (LETT #1# (PROGN (LETT #2# 0 . #5#) (GO #2#)) . #5#)
                           (GO #1#))))))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT
                (COND ((ODDP (SPADCALL |t| (QREFELT $ 72))) -1) (#4# 1)))))))
      #2# (EXIT #2#))))) 

(DECLAIM (NOTINLINE |IntegerNumberTheoryFunctions;|)) 

(DEFUN |IntegerNumberTheoryFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G242)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|IntegerNumberTheoryFunctions|)
                . #2=(|IntegerNumberTheoryFunctions|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|IntegerNumberTheoryFunctions|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|IntegerNumberTheoryFunctions;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|IntegerNumberTheoryFunctions|))))))))))) 

(DEFUN |IntegerNumberTheoryFunctions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|IntegerNumberTheoryFunctions|)
            . #1=(|IntegerNumberTheoryFunctions|))
      (LETT $ (GETREFV 74) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|IntegerNumberTheoryFunctions| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL 1 1 (QREFELT $ 9)))
      (QSETREFV $ 15 (SPADCALL 1 (|spadConstant| $ 12) (QREFELT $ 14)))
      (QSETREFV $ 16 (CONS 1 (|spadConstant| $ 12)))
      $)))) 

(MAKEPROP '|IntegerNumberTheoryFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) (|Integer|)
              (|IndexedFlexibleArray| 7 (NRTEVAL 0)) (0 . |new|) 'E
              (|Fraction| 7) (6 . |One|)
              (|IndexedFlexibleArray| 11 (NRTEVAL 0)) (10 . |new|) 'B 'H
              (16 . |Zero|) (20 . /) (26 . +) |INTHEORY;harmonic;IF;1|
              |INTHEORY;fibonacci;2I;2| (|PositiveInteger|) (32 . ^) (38 . *)
              (|Boolean|) (44 . |bit?|) (50 . <=) (|Factored| $)
              (56 . |factor|) (|Record| (|:| |factor| 7) (|:| |exponent| 7))
              (|List| 30) (|Factored| 7) (61 . |factors|) (|List| $)
              (66 . |lcm|) |INTHEORY;carmichaelLambda;2I;3| (71 . |#|)
              (76 . |elt|) (82 . |concat!|) (88 . |setelt|) (95 . *)
              |INTHEORY;euler;2I;4| (101 . -) (106 . |#|) (111 . |elt|)
              (117 . |concat!|) (123 . |setelt|) (130 . |coerce|) (135 . *)
              (141 . /) |INTHEORY;bernoulli;IF;5| (147 . ~=)
              (153 . |positiveRemainder|) |INTHEORY;chineseRemainder;5I;7|
              (159 . |even?|) (164 . >) |INTHEORY;jacobi;3I;8|
              (|IntegerPrimesPackage| 7) (170 . |prime?|)
              |INTHEORY;legendre;3I;9| (175 . *) (181 . |numer|)
              |INTHEORY;eulerPhi;2I;10| (186 . <) (|Mapping| 25 7 7) (|List| 7)
              (192 . |sort|) |INTHEORY;divisors;IL;11|
              |INTHEORY;numberOfDivisors;2I;12| |INTHEORY;sumOfDivisors;2I;13|
              |INTHEORY;sumOfKthPowerDivisors;INniI;14|
              (198 . |numberOfFactors|) |INTHEORY;moebiusMu;2I;15|)
           '#(|sumOfKthPowerDivisors| 203 |sumOfDivisors| 209
              |numberOfDivisors| 214 |moebiusMu| 219 |legendre| 224 |jacobi|
              230 |harmonic| 236 |fibonacci| 241 |eulerPhi| 246 |euler| 251
              |divisors| 256 |chineseRemainder| 261 |carmichaelLambda| 269
              |bernoulli| 274)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 73
                                                 '(2 8 0 6 7 9 0 11 0 12 2 13 0
                                                   6 11 14 0 11 0 17 2 11 0 7 7
                                                   18 2 11 0 0 0 19 2 7 0 0 22
                                                   23 2 7 0 22 0 24 2 7 25 0 0
                                                   26 2 7 25 0 0 27 1 7 28 0 29
                                                   1 32 31 0 33 1 7 0 34 35 1 8
                                                   6 0 37 2 8 7 0 7 38 2 8 0 0
                                                   0 39 3 8 7 0 7 7 40 2 7 0 6
                                                   0 41 1 11 0 0 43 1 13 6 0 44
                                                   2 13 11 0 7 45 2 13 0 0 0 46
                                                   3 13 11 0 7 11 47 1 11 0 7
                                                   48 2 11 0 0 0 49 2 11 0 0 0
                                                   50 2 7 25 0 0 52 2 7 0 0 0
                                                   53 1 7 25 0 55 2 7 25 0 0 56
                                                   1 58 25 7 59 2 11 0 7 0 61 1
                                                   11 7 0 62 2 7 25 0 0 64 2 66
                                                   0 65 0 67 1 32 6 0 72 2 0 7
                                                   7 6 71 1 0 7 7 70 1 0 7 7 69
                                                   1 0 7 7 73 2 0 7 7 7 60 2 0
                                                   7 7 7 57 1 0 11 7 20 1 0 7 7
                                                   21 1 0 7 7 63 1 0 7 7 42 1 0
                                                   66 7 68 4 0 7 7 7 7 7 54 1 0
                                                   7 7 36 1 0 11 7 51)))))
           '|lookupComplete|)) 

(MAKEPROP '|IntegerNumberTheoryFunctions| 'NILADIC T) 
