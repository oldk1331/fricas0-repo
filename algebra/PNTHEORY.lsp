
(/VERSIONCHECK 2) 

(DEFUN |PNTHEORY;MonicQuotient| (|a| |b| $)
  (PROG (|da| |q| |t| #1=#:G140 |db|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |b| (QREFELT $ 26)) 1 (QREFELT $ 28))
        (|error| "divisor must be monic"))
       ((SPADCALL |b| (|spadConstant| $ 7) (QREFELT $ 29)) |a|)
       ('T
        (SEQ
         (LETT |da| (SPADCALL |a| (QREFELT $ 30))
               . #2=(|PNTHEORY;MonicQuotient|))
         (LETT |db| (SPADCALL |b| (QREFELT $ 30)) . #2#)
         (LETT |q| (|spadConstant| $ 17) . #2#)
         (SEQ G190 (COND ((NULL (>= |da| |db|)) (GO G191)))
              (SEQ
               (LETT |t|
                     (SPADCALL (SPADCALL |a| (QREFELT $ 26))
                               (PROG1 (LETT #1# (- |da| |db|) . #2#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 10))
                     . #2#)
               (LETT |a|
                     (SPADCALL |a| (SPADCALL |b| |t| (QREFELT $ 31))
                               (QREFELT $ 32))
                     . #2#)
               (LETT |q| (SPADCALL |q| |t| (QREFELT $ 33)) . #2#)
               (EXIT (LETT |da| (SPADCALL |a| (QREFELT $ 30)) . #2#)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |q|)))))))) 

(DEFUN |PNTHEORY;cyclotomic;ISup;2| (|n| $)
  (PROG (|m| #1=#:G154 |s| |c| |t| #2=#:G150 |r| |q| |#G6| |k| |#G5| |p|)
    (RETURN
     (SEQ
      (COND
       ((< |n| 0) (|error| "cyclotomic not defined for negative integers"))
       ((EQL |n| 0) (QREFELT $ 11))
       ('T
        (SEQ (LETT |k| |n| . #3=(|PNTHEORY;cyclotomic;ISup;2|))
             (LETT |s| (LETT |p| 1 . #3#) . #3#)
             (LETT |c|
                   (SPADCALL (QREFELT $ 11) (|spadConstant| $ 7)
                             (QREFELT $ 32))
                   . #3#)
             (SEQ G190
                  (COND ((NULL (SPADCALL |k| 1 (QREFELT $ 34))) (GO G191)))
                  (SEQ (LETT |p| (SPADCALL |p| (QREFELT $ 36)) . #3#)
                       (PROGN
                        (LETT |#G5| (DIVIDE2 |k| |p|) . #3#)
                        (LETT |q| (QCAR |#G5|) . #3#)
                        (LETT |r| (QCDR |#G5|) . #3#)
                        |#G5|)
                       (EXIT
                        (COND
                         ((EQL |r| 0)
                          (SEQ
                           (SEQ G190 (COND ((NULL (EQL |r| 0)) (GO G191)))
                                (SEQ (LETT |k| |q| . #3#)
                                     (EXIT
                                      (PROGN
                                       (LETT |#G6| (DIVIDE2 |k| |p|) . #3#)
                                       (LETT |q| (QCAR |#G6|) . #3#)
                                       (LETT |r| (QCDR |#G6|) . #3#)
                                       |#G6|)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |t|
                                 (SPADCALL |c|
                                           (PROG1 (LETT #2# |p| . #3#)
                                             (|check_subtype| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              #2#))
                                           (QREFELT $ 37))
                                 . #3#)
                           (LETT |c| (|PNTHEORY;MonicQuotient| |t| |c| $)
                                 . #3#)
                           (EXIT (LETT |s| (* |s| |p|) . #3#)))))))
                  NIL (GO G190) G191 (EXIT NIL))
             (LETT |m|
                   (PROG1 (LETT #1# (QUOTIENT2 |n| |s|) . #3#)
                     (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                   . #3#)
             (EXIT (SPADCALL |c| |m| (QREFELT $ 37)))))))))) 

(DEFUN |PNTHEORY;euler;ISup;3| (|n| $)
  (PROG (|p| |c| #1=#:G161 |t| |i| |s| |#G10| |#G9| |#G8|)
    (RETURN
     (SEQ
      (COND ((< |n| 0) (|error| "euler not defined for negative integers"))
            (#2='T
             (SEQ
              (COND
               ((< |n| (QCAR (QREFELT $ 19)))
                (PROGN
                 (LETT |#G8| 0 . #3=(|PNTHEORY;euler;ISup;3|))
                 (LETT |#G9| (|spadConstant| $ 18) . #3#)
                 (LETT |s| |#G8| . #3#)
                 (LETT |p| |#G9| . #3#)))
               (#2#
                (PROGN
                 (LETT |#G10| (QREFELT $ 19) . #3#)
                 (LETT |s| (QCAR |#G10|) . #3#)
                 (LETT |p| (QCDR |#G10|) . #3#)
                 |#G10|)))
              (SEQ (LETT |i| (+ |s| 1) . #3#) G190
                   (COND ((> |i| |n|) (GO G191)))
                   (SEQ
                    (LETT |t|
                          (SPADCALL (SPADCALL |i| (QREFELT $ 39))
                                    (SPADCALL |p| (QREFELT $ 40))
                                    (QREFELT $ 41))
                          . #3#)
                    (LETT |c|
                          (SPADCALL
                           (SPADCALL (SPADCALL |i| (QREFELT $ 43))
                                     (EXPT 2
                                           (PROG1 (LETT #1# |i| . #3#)
                                             (|check_subtype| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              #1#)))
                                     (QREFELT $ 44))
                           (SPADCALL |t| (SPADCALL 1 2 (QREFELT $ 44))
                                     (QREFELT $ 45))
                           (QREFELT $ 46))
                          . #3#)
                    (EXIT
                     (LETT |p|
                           (SPADCALL |t| (SPADCALL |c| (QREFELT $ 47))
                                     (QREFELT $ 48))
                           . #3#)))
                   (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
              (PROGN (RPLACA (QREFELT $ 19) |n|) (QCAR (QREFELT $ 19)))
              (PROGN (RPLACD (QREFELT $ 19) |p|) (QCDR (QREFELT $ 19)))
              (EXIT |p|)))))))) 

(DEFUN |PNTHEORY;bernoulli;ISup;4| (|n| $)
  (PROG (|p| |c| |t| |i| |s| |#G17| |#G16| |#G15|)
    (RETURN
     (SEQ
      (COND ((< |n| 0) (|error| "bernoulli not defined for negative integers"))
            (#1='T
             (SEQ
              (COND
               ((< |n| (QCAR (QREFELT $ 20)))
                (PROGN
                 (LETT |#G15| 0 . #2=(|PNTHEORY;bernoulli;ISup;4|))
                 (LETT |#G16| (|spadConstant| $ 18) . #2#)
                 (LETT |s| |#G15| . #2#)
                 (LETT |p| |#G16| . #2#)))
               (#1#
                (PROGN
                 (LETT |#G17| (QREFELT $ 20) . #2#)
                 (LETT |s| (QCAR |#G17|) . #2#)
                 (LETT |p| (QCDR |#G17|) . #2#)
                 |#G17|)))
              (SEQ (LETT |i| (+ |s| 1) . #2#) G190
                   (COND ((> |i| |n|) (GO G191)))
                   (SEQ
                    (LETT |t|
                          (SPADCALL (SPADCALL |i| (QREFELT $ 39))
                                    (SPADCALL |p| (QREFELT $ 40))
                                    (QREFELT $ 41))
                          . #2#)
                    (LETT |c| (SPADCALL |i| (QREFELT $ 50)) . #2#)
                    (EXIT
                     (LETT |p|
                           (SPADCALL |t| (SPADCALL |c| (QREFELT $ 47))
                                     (QREFELT $ 48))
                           . #2#)))
                   (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (PROGN (RPLACA (QREFELT $ 20) |n|) (QCAR (QREFELT $ 20)))
              (PROGN (RPLACD (QREFELT $ 20) |p|) (QCDR (QREFELT $ 20)))
              (EXIT |p|)))))))) 

(DEFUN |PNTHEORY;fixedDivisor;SupI;5| (|a| $)
  (PROG (|g| |k| |d|)
    (RETURN
     (SEQ (|SparseUnivariatePolynomial| (|Integer|))
          (LETT |d| (SPADCALL |a| (QREFELT $ 30))
                . #1=(|PNTHEORY;fixedDivisor;SupI;5|))
          (LETT |g| (SPADCALL |a| (SPADCALL |a| (QREFELT $ 52)) (QREFELT $ 53))
                . #1#)
          (SEQ (LETT |k| 1 . #1#) G190
               (COND
                ((OR (|greater_SI| |k| |d|)
                     (NULL (SPADCALL |g| 1 (QREFELT $ 34))))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |g| (GCD |g| (SPADCALL |a| |k| (QREFELT $ 54))) . #1#)))
               (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |g|))))) 

(DEFUN |PNTHEORY;hermite;ISup;6| (|n| $)
  (PROG (|q| |p| |#G30| |#G29| |k| |s| |#G24|)
    (RETURN
     (SEQ
      (COND ((< |n| 0) (|error| "hermite not defined for negative integers"))
            (#1='T
             (SEQ
              (COND
               ((< |n| (QVELT (QREFELT $ 21) 0))
                (SEQ (LETT |s| 0 . #2=(|PNTHEORY;hermite;ISup;6|))
                     (LETT |p| (|spadConstant| $ 7) . #2#)
                     (EXIT (LETT |q| (QREFELT $ 11) . #2#))))
               (#1#
                (PROGN
                 (LETT |#G24| (QREFELT $ 21) . #2#)
                 (LETT |s| (QVELT |#G24| 0) . #2#)
                 (LETT |p| (QVELT |#G24| 1) . #2#)
                 (LETT |q| (QVELT |#G24| 2) . #2#)
                 |#G24|)))
              (SEQ (LETT |k| (+ |s| 1) . #2#) G190
                   (COND ((> |k| |n|) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT |#G29|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL 2 (QREFELT $ 11) (QREFELT $ 57)) |p|
                              (QREFELT $ 31))
                             (SPADCALL (SPADCALL 2 (- |k| 1) (QREFELT $ 58))
                                       |q| (QREFELT $ 59))
                             (QREFELT $ 32))
                            . #2#)
                      (LETT |#G30| |p| . #2#)
                      (LETT |p| |#G29| . #2#)
                      (LETT |q| |#G30| . #2#))))
                   (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (QSETVELT (QREFELT $ 21) 0 |n|) (QSETVELT (QREFELT $ 21) 1 |p|)
              (QSETVELT (QREFELT $ 21) 2 |q|) (EXIT |p|)))))))) 

(DEFUN |PNTHEORY;legendre;ISup;7| (|n| $)
  (PROG (|q| |p| |#G38| |#G37| |t| |k| |s| |#G32|)
    (RETURN
     (SEQ
      (COND ((< |n| 0) (|error| "legendre not defined for negative integers"))
            (#1='T
             (SEQ
              (COND
               ((< |n| (QVELT (QREFELT $ 23) 0))
                (SEQ (LETT |s| 0 . #2=(|PNTHEORY;legendre;ISup;7|))
                     (LETT |p| (|spadConstant| $ 18) . #2#)
                     (EXIT (LETT |q| (QREFELT $ 16) . #2#))))
               (#1#
                (PROGN
                 (LETT |#G32| (QREFELT $ 23) . #2#)
                 (LETT |s| (QVELT |#G32| 0) . #2#)
                 (LETT |p| (QVELT |#G32| 1) . #2#)
                 (LETT |q| (QVELT |#G32| 2) . #2#)
                 |#G32|)))
              (SEQ (LETT |k| (+ |s| 1) . #2#) G190
                   (COND ((> |k| |n|) (GO G191)))
                   (SEQ (LETT |t| (- |k| 1) . #2#)
                        (EXIT
                         (PROGN
                          (LETT |#G37|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (+ |k| |t|) |k| (QREFELT $ 44))
                                   (QREFELT $ 16) (QREFELT $ 41))
                                  |p| (QREFELT $ 61))
                                 (SPADCALL (SPADCALL |t| |k| (QREFELT $ 44))
                                           |q| (QREFELT $ 41))
                                 (QREFELT $ 62))
                                . #2#)
                          (LETT |#G38| |p| . #2#)
                          (LETT |p| |#G37| . #2#)
                          (LETT |q| |#G38| . #2#))))
                   (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (QSETVELT (QREFELT $ 23) 0 |n|) (QSETVELT (QREFELT $ 23) 1 |p|)
              (QSETVELT (QREFELT $ 23) 2 |q|) (EXIT |p|)))))))) 

(DEFUN |PNTHEORY;laguerre;ISup;8| (|n| $)
  (PROG (|q| |p| |#G46| |#G45| |t| |k| |s| |#G40|)
    (RETURN
     (SEQ
      (COND ((< |n| 0) (|error| "laguerre not defined for negative integers"))
            (#1='T
             (SEQ
              (COND
               ((< |n| (QVELT (QREFELT $ 22) 0))
                (SEQ (LETT |s| 0 . #2=(|PNTHEORY;laguerre;ISup;8|))
                     (LETT |p| (|spadConstant| $ 7) . #2#)
                     (EXIT (LETT |q| (QREFELT $ 11) . #2#))))
               (#1#
                (PROGN
                 (LETT |#G40| (QREFELT $ 22) . #2#)
                 (LETT |s| (QVELT |#G40| 0) . #2#)
                 (LETT |p| (QVELT |#G40| 1) . #2#)
                 (LETT |q| (QVELT |#G40| 2) . #2#)
                 |#G40|)))
              (SEQ (LETT |k| (+ |s| 1) . #2#) G190
                   (COND ((> |k| |n|) (GO G191)))
                   (SEQ (LETT |t| (- |k| 1) . #2#)
                        (EXIT
                         (PROGN
                          (LETT |#G45|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (+ |k| |t|) (QREFELT $ 64))
                                   (QREFELT $ 11) (QREFELT $ 32))
                                  |p| (QREFELT $ 31))
                                 (SPADCALL (SPADCALL |t| 2 (QREFELT $ 65)) |q|
                                           (QREFELT $ 59))
                                 (QREFELT $ 32))
                                . #2#)
                          (LETT |#G46| |p| . #2#)
                          (LETT |p| |#G45| . #2#)
                          (LETT |q| |#G46| . #2#))))
                   (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (QSETVELT (QREFELT $ 22) 0 |n|) (QSETVELT (QREFELT $ 22) 1 |p|)
              (QSETVELT (QREFELT $ 22) 2 |q|) (EXIT |p|)))))))) 

(DEFUN |PNTHEORY;chebyshevT;ISup;9| (|n| $)
  (PROG (|q| |p| |#G54| |#G53| |k| |s| |#G48|)
    (RETURN
     (SEQ
      (COND
       ((< |n| 0) (|error| "chebyshevT not defined for negative integers"))
       (#1='T
        (SEQ
         (COND
          ((< |n| (QVELT (QREFELT $ 24) 0))
           (SEQ (LETT |s| 0 . #2=(|PNTHEORY;chebyshevT;ISup;9|))
                (LETT |p| (|spadConstant| $ 7) . #2#)
                (EXIT (LETT |q| (QREFELT $ 11) . #2#))))
          (#1#
           (PROGN
            (LETT |#G48| (QREFELT $ 24) . #2#)
            (LETT |s| (QVELT |#G48| 0) . #2#)
            (LETT |p| (QVELT |#G48| 1) . #2#)
            (LETT |q| (QVELT |#G48| 2) . #2#)
            |#G48|)))
         (SEQ (LETT |k| (+ |s| 1) . #2#) G190 (COND ((> |k| |n|) (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT |#G53|
                       (SPADCALL
                        (SPADCALL (SPADCALL 2 (QREFELT $ 11) (QREFELT $ 57))
                                  |p| (QREFELT $ 31))
                        |q| (QREFELT $ 32))
                       . #2#)
                 (LETT |#G54| |p| . #2#)
                 (LETT |p| |#G53| . #2#)
                 (LETT |q| |#G54| . #2#))))
              (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
         (QSETVELT (QREFELT $ 24) 0 |n|) (QSETVELT (QREFELT $ 24) 1 |p|)
         (QSETVELT (QREFELT $ 24) 2 |q|) (EXIT |p|)))))))) 

(DEFUN |PNTHEORY;chebyshevU;ISup;10| (|n| $)
  (PROG (|q| |p| |#G62| |#G61| |k| |s| |#G56|)
    (RETURN
     (SEQ
      (COND
       ((< |n| 0) (|error| "chebyshevU not defined for negative integers"))
       (#1='T
        (SEQ
         (COND
          ((< |n| (QVELT (QREFELT $ 25) 0))
           (SEQ (LETT |s| 0 . #2=(|PNTHEORY;chebyshevU;ISup;10|))
                (LETT |p| (|spadConstant| $ 7) . #2#)
                (EXIT (LETT |q| (|spadConstant| $ 17) . #2#))))
          (#1#
           (PROGN
            (LETT |#G56| (QREFELT $ 25) . #2#)
            (LETT |s| (QVELT |#G56| 0) . #2#)
            (LETT |p| (QVELT |#G56| 1) . #2#)
            (LETT |q| (QVELT |#G56| 2) . #2#)
            |#G56|)))
         (SEQ (LETT |k| (+ |s| 1) . #2#) G190 (COND ((> |k| |n|) (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT |#G61|
                       (SPADCALL
                        (SPADCALL (SPADCALL 2 (QREFELT $ 11) (QREFELT $ 57))
                                  |p| (QREFELT $ 31))
                        |q| (QREFELT $ 32))
                       . #2#)
                 (LETT |#G62| |p| . #2#)
                 (LETT |p| |#G61| . #2#)
                 (LETT |q| |#G62| . #2#))))
              (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
         (QSETVELT (QREFELT $ 25) 0 |n|) (QSETVELT (QREFELT $ 25) 1 |p|)
         (QSETVELT (QREFELT $ 25) 2 |q|) (EXIT |p|)))))))) 

(DEFUN |PolynomialNumberTheoryFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G209)
       (RETURN
        (COND
         ((LETT #1#
                (HGET |$ConstructorCache| '|PolynomialNumberTheoryFunctions|)
                . #2=(|PolynomialNumberTheoryFunctions|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|PolynomialNumberTheoryFunctions|
                         (LIST
                          (CONS NIL
                                (CONS 1
                                      (|PolynomialNumberTheoryFunctions;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|PolynomialNumberTheoryFunctions|))))))))))) 

(DEFUN |PolynomialNumberTheoryFunctions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|PolynomialNumberTheoryFunctions|)
            . #1=(|PolynomialNumberTheoryFunctions|))
      (LETT $ (GETREFV 69) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PolynomialNumberTheoryFunctions| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (SPADCALL 1 1 (QREFELT $ 10)))
      (QSETREFV $ 16 (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 15)))
      (QSETREFV $ 19 (CONS 0 (|spadConstant| $ 18)))
      (QSETREFV $ 20 (CONS 0 (|spadConstant| $ 18)))
      (QSETREFV $ 21 (VECTOR 0 (|spadConstant| $ 7) (QREFELT $ 11)))
      (QSETREFV $ 22 (VECTOR 0 (|spadConstant| $ 7) (QREFELT $ 11)))
      (QSETREFV $ 23 (VECTOR 0 (|spadConstant| $ 18) (QREFELT $ 16)))
      (QSETREFV $ 24 (VECTOR 0 (|spadConstant| $ 7) (QREFELT $ 11)))
      (QSETREFV $ 25 (VECTOR 0 (|spadConstant| $ 7) (|spadConstant| $ 17)))
      $)))) 

(MAKEPROP '|PolynomialNumberTheoryFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 8)
              (0 . |One|) (|Integer|) (|NonNegativeInteger|) (4 . |monomial|)
              '|x| (|Fraction| 8) (10 . |One|)
              (|SparseUnivariatePolynomial| 12) (14 . |monomial|) '|y|
              (20 . |Zero|) (24 . |One|) 'E 'B 'H 'L 'P 'CT 'U
              (28 . |leadingCoefficient|) (|Boolean|) (33 . ~=) (39 . =)
              (45 . |degree|) (50 . *) (56 . -) (62 . +) (68 . >)
              (|IntegerPrimesPackage| 8) (74 . |nextPrime|)
              (79 . |multiplyExponents|) |PNTHEORY;cyclotomic;ISup;2|
              (85 . |coerce|) (90 . |integrate|) (95 . *)
              (|IntegerNumberTheoryFunctions|) (101 . |euler|) (106 . /)
              (112 . |elt|) (118 . -) (124 . |coerce|) (129 . +)
              |PNTHEORY;euler;ISup;3| (135 . |bernoulli|)
              |PNTHEORY;bernoulli;ISup;4| (140 . |minimumDegree|)
              (145 . |coefficient|) (151 . |elt|)
              |PNTHEORY;fixedDivisor;SupI;5| (|PositiveInteger|) (157 . *)
              (163 . *) (169 . *) |PNTHEORY;hermite;ISup;6| (175 . *) (181 . -)
              |PNTHEORY;legendre;ISup;7| (187 . |coerce|) (192 . ^)
              |PNTHEORY;laguerre;ISup;8| |PNTHEORY;chebyshevT;ISup;9|
              |PNTHEORY;chebyshevU;ISup;10|)
           '#(|legendre| 198 |laguerre| 203 |hermite| 208 |fixedDivisor| 213
              |euler| 218 |cyclotomic| 223 |chebyshevU| 228 |chebyshevT| 233
              |bernoulli| 238)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 68
                                                 '(0 6 0 7 2 6 0 8 9 10 0 12 0
                                                   13 2 14 0 12 9 15 0 6 0 17 0
                                                   14 0 18 1 6 8 0 26 2 8 27 0
                                                   0 28 2 6 27 0 0 29 1 6 9 0
                                                   30 2 6 0 0 0 31 2 6 0 0 0 32
                                                   2 6 0 0 0 33 2 8 27 0 0 34 1
                                                   35 8 8 36 2 6 0 0 9 37 1 12
                                                   0 8 39 1 14 0 0 40 2 14 0 12
                                                   0 41 1 42 8 8 43 2 12 0 8 8
                                                   44 2 14 12 0 12 45 2 12 0 0
                                                   0 46 1 14 0 12 47 2 14 0 0 0
                                                   48 1 42 12 8 50 1 6 9 0 52 2
                                                   6 8 0 9 53 2 6 8 0 8 54 2 6
                                                   0 56 0 57 2 8 0 56 0 58 2 6
                                                   0 8 0 59 2 14 0 0 0 61 2 14
                                                   0 0 0 62 1 6 0 8 64 2 8 0 0
                                                   56 65 1 0 14 8 63 1 0 6 8 66
                                                   1 0 6 8 60 1 0 8 6 55 1 0 14
                                                   8 49 1 0 6 8 38 1 0 6 8 68 1
                                                   0 6 8 67 1 0 14 8 51)))))
           '|lookupComplete|)) 

(MAKEPROP '|PolynomialNumberTheoryFunctions| 'NILADIC T) 
