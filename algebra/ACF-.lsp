
(/VERSIONCHECK 2) 

(DEFUN |ACF-;zeroOf;SupS;1| (|p| $)
  (PROG (|x|)
    (RETURN
     (|ACF-;assign| (LETT |x| (SPADCALL (QREFELT $ 8)) |ACF-;zeroOf;SupS;1|)
      (SPADCALL |p| |x| (QREFELT $ 10)) $)))) 

(DEFUN |ACF-;rootOf;SupS;2| (|p| $)
  (PROG (|x|)
    (RETURN
     (|ACF-;assign| (LETT |x| (SPADCALL (QREFELT $ 8)) |ACF-;rootOf;SupS;2|)
      (SPADCALL |p| |x| (QREFELT $ 12)) $)))) 

(DEFUN |ACF-;zerosOf;SupL;3| (|p| $)
  (SPADCALL |p| (SPADCALL (QREFELT $ 8)) (QREFELT $ 15))) 

(DEFUN |ACF-;rootsOf;SupL;4| (|p| $)
  (SPADCALL |p| (SPADCALL (QREFELT $ 8)) (QREFELT $ 17))) 

(DEFUN |ACF-;rootsOf;SupSL;5| (|p| |y| $)
  (|ACF-;allroots| |p| |y| (ELT $ 12) $)) 

(DEFUN |ACF-;zerosOf;SupSL;6| (|p| |y| $)
  (|ACF-;allroots| |p| |y| (ELT $ 10) $)) 

(DEFUN |ACF-;assign| (|x| |f| $)
  (SEQ (|assignSymbol| |x| |f| (QREFELT $ 6)) (EXIT |f|))) 

(DEFUN |ACF-;zeroOf;PS;8| (|p| $)
  (PROG (|l|)
    (RETURN
     (COND
      ((NULL (LETT |l| (SPADCALL |p| (QREFELT $ 23)) |ACF-;zeroOf;PS;8|))
       (|error| "zeroOf: constant polynomial"))
      ('T
       (SPADCALL (SPADCALL |p| (QREFELT $ 25)) (|SPADfirst| |l|)
                 (QREFELT $ 10))))))) 

(DEFUN |ACF-;rootOf;PS;9| (|p| $)
  (PROG (|l|)
    (RETURN
     (COND
      ((NULL (LETT |l| (SPADCALL |p| (QREFELT $ 23)) |ACF-;rootOf;PS;9|))
       (|error| "rootOf: constant polynomial"))
      ('T
       (SPADCALL (SPADCALL |p| (QREFELT $ 25)) (|SPADfirst| |l|)
                 (QREFELT $ 12))))))) 

(DEFUN |ACF-;zerosOf;PL;10| (|p| $)
  (PROG (|l|)
    (RETURN
     (COND
      ((NULL (LETT |l| (SPADCALL |p| (QREFELT $ 23)) |ACF-;zerosOf;PL;10|))
       (|error| "zerosOf: constant polynomial"))
      ('T
       (SPADCALL (SPADCALL |p| (QREFELT $ 25)) (|SPADfirst| |l|)
                 (QREFELT $ 15))))))) 

(DEFUN |ACF-;rootsOf;PL;11| (|p| $)
  (PROG (|l|)
    (RETURN
     (COND
      ((NULL (LETT |l| (SPADCALL |p| (QREFELT $ 23)) |ACF-;rootsOf;PL;11|))
       (|error| "rootsOf: constant polynomial"))
      ('T
       (SPADCALL (SPADCALL |p| (QREFELT $ 25)) (|SPADfirst| |l|)
                 (QREFELT $ 17))))))) 

(DEFUN |ACF-;zeroOf;SupSS;12| (|p| |y| $)
  (PROG (|r| |b| |a| |d|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP
         (LETT |d| (SPADCALL |p| (QREFELT $ 32))
               . #1=(|ACF-;zeroOf;SupSS;12|)))
        (|error| "zeroOf: constant polynomial"))
       ((SPADCALL (SPADCALL |p| 0 (QREFELT $ 35)) (QREFELT $ 37))
        (|spadConstant| $ 33))
       (#2='T
        (SEQ (LETT |a| (SPADCALL |p| (QREFELT $ 38)) . #1#)
             (EXIT
              (COND
               ((EQL |d| 2)
                (SEQ (LETT |b| (SPADCALL |p| 1 (QREFELT $ 35)) . #1#)
                     (EXIT
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |b| 2 (QREFELT $ 42))
                                   (SPADCALL (SPADCALL 4 |a| (QREFELT $ 43))
                                             (SPADCALL |p| 0 (QREFELT $ 35))
                                             (QREFELT $ 44))
                                   (QREFELT $ 45))
                         (QREFELT $ 46))
                        |b| (QREFELT $ 45))
                       (SPADCALL 2 |a| (QREFELT $ 43)) (QREFELT $ 47)))))
               (#2#
                (SEQ
                 (LETT |r|
                       (SPADCALL (SPADCALL |p| (QREFELT $ 48)) (QREFELT $ 50))
                       . #1#)
                 (EXIT
                  (COND ((QEQCAR |r| 1) (SPADCALL |p| |y| (QREFELT $ 12)))
                        (#2#
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCDR |r|) |a| (QREFELT $ 47))
                                    (QREFELT $ 51))
                          |d| (QREFELT $ 53)))))))))))))))) 

(DEFUN |ACF-;binomialRoots| (|p| |y| |fn| $)
  (PROG (#1=#:G161 #2=#:G155 |i| #3=#:G160 |beta| |x| |cyclo| |n| |alpha|)
    (RETURN
     (SEQ
      (LETT |alpha|
            (|ACF-;assign|
             (LETT |x| (SPADCALL |y| (QREFELT $ 55))
                   . #4=(|ACF-;binomialRoots|))
             (SPADCALL |p| |x| |fn|) $)
            . #4#)
      (LETT |n| (SPADCALL |p| (QREFELT $ 32)) . #4#)
      (EXIT
       (COND ((EQL |n| 1) (LIST |alpha|))
             ('T
              (SEQ
               (LETT |cyclo|
                     (SPADCALL |n|
                               (SPADCALL (|spadConstant| $ 39) 1
                                         (QREFELT $ 56))
                               (QREFELT $ 58))
                     . #4#)
               (LETT |beta|
                     (|ACF-;assign|
                      (LETT |x| (SPADCALL |y| (QREFELT $ 55)) . #4#)
                      (SPADCALL |cyclo| |x| |fn|) $)
                     . #4#)
               (EXIT
                (PROGN
                 (LETT #3# NIL . #4#)
                 (SEQ (LETT |i| 0 . #4#)
                      (LETT #1#
                            (PROG1 (LETT #2# (- |n| 1) . #4#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#))
                            . #4#)
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL |alpha|
                                         (SPADCALL |beta| |i| (QREFELT $ 59))
                                         (QREFELT $ 44))
                               #3#)
                              . #4#)))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))))))))))) 

(DEFUN |ACF-;allroots| (|p| |y| |fn| $)
  (PROG (|ans| #1=#:G171 |q| |alpha| |x| #2=#:G176 #3=#:G175 #4=#:G177
         #5=#:G197 |r| |groots| |g| |h| |decompList| |p1|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 60))
        (|error| "allroots: polynomial must be nonzero"))
       ((SPADCALL (SPADCALL |p| 0 (QREFELT $ 35)) (QREFELT $ 37))
        (CONS (|spadConstant| $ 33)
              (|ACF-;allroots|
               (SPADCALL |p| (SPADCALL (|spadConstant| $ 39) 1 (QREFELT $ 56))
                         (QREFELT $ 61))
               |y| |fn| $)))
       ((SPADCALL
         (LETT |p1| (SPADCALL |p| (QREFELT $ 48)) . #6=(|ACF-;allroots|))
         (QREFELT $ 60))
        NIL)
       ((SPADCALL (SPADCALL |p1| (QREFELT $ 48)) (QREFELT $ 60))
        (|ACF-;binomialRoots| |p| |y| |fn| $))
       (#7='T
        (SEQ (LETT |decompList| (SPADCALL |p| (QREFELT $ 64)) . #6#)
             (EXIT
              (COND
               ((SPADCALL (LENGTH |decompList|) 1 (QREFELT $ 65))
                (SEQ (LETT |h| (SPADCALL |decompList| (QREFELT $ 66)) . #6#)
                     (LETT |g|
                           (PROG2
                               (LETT #1# (SPADCALL |p| |h| (QREFELT $ 68))
                                     . #6#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 6))
                                            #1#))
                           . #6#)
                     (LETT |groots| (|ACF-;allroots| |g| |y| |fn| $) . #6#)
                     (EXIT
                      (PROGN
                       (LETT #2# NIL . #6#)
                       (SEQ (LETT |r| NIL . #6#) (LETT #5# |groots| . #6#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |r| (CAR #5#) . #6#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #4#
                                     (|ACF-;allroots|
                                      (SPADCALL |h|
                                                (SPADCALL |r| (QREFELT $ 69))
                                                (QREFELT $ 70))
                                      |y| |fn| $)
                                     . #6#)
                               (COND (#2# (LETT #3# (APPEND #3# #4#) . #6#))
                                     ('T
                                      (PROGN
                                       (LETT #3# #4# . #6#)
                                       (LETT #2# 'T . #6#)))))))
                            (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#2# #3#) (#7# NIL))))))
               (#7#
                (SEQ (LETT |ans| NIL . #6#)
                     (SEQ G190
                          (COND
                           ((NULL
                             (COND ((SPADCALL |p| (QREFELT $ 71)) 'NIL)
                                   ('T 'T)))
                            (GO G191)))
                          (SEQ
                           (LETT |alpha|
                                 (|ACF-;assign|
                                  (LETT |x| (SPADCALL |y| (QREFELT $ 55))
                                        . #6#)
                                  (SPADCALL |p| |x| |fn|) $)
                                 . #6#)
                           (LETT |q|
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 39) 1
                                            (QREFELT $ 56))
                                  (SPADCALL |alpha| (QREFELT $ 69))
                                  (QREFELT $ 70))
                                 . #6#)
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |p| |alpha| (QREFELT $ 72))
                                        (QREFELT $ 37))
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (SPADCALL
                                       (SPADCALL |p| |alpha| (QREFELT $ 72))
                                       (QREFELT $ 37)))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |p|
                                          (PROG2
                                              (LETT #1#
                                                    (SPADCALL |p| |q|
                                                              (QREFELT $ 74))
                                                    . #6#)
                                              (QCDR #1#)
                                            (|check_union| (QEQCAR #1# 0)
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 6))
                                                           #1#))
                                          . #6#)
                                    (EXIT
                                     (LETT |ans| (CONS |alpha| |ans|) . #6#)))
                                   NIL (GO G190) G191 (EXIT NIL)))
                             ('T
                              (SEQ
                               (LETT |p| (SPADCALL |p| |q| (QREFELT $ 61))
                                     . #6#)
                               (EXIT
                                (LETT |ans| (CONS |alpha| |ans|) . #6#)))))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT (NREVERSE |ans|))))))))))))) 

(DECLAIM (NOTINLINE |AlgebraicallyClosedField&;|)) 

(DEFUN |AlgebraicallyClosedField&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicallyClosedField&|))
      (LETT |dv$| (LIST '|AlgebraicallyClosedField&| DV$1) . #1#)
      (LETT $ (GETREFV 75) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|AlgebraicallyClosedField&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|) (0 . |new|)
              (|SparseUnivariatePolynomial| $) (4 . |zeroOf|)
              |ACF-;zeroOf;SupS;1| (10 . |rootOf|) |ACF-;rootOf;SupS;2|
              (|List| $) (16 . |zerosOf|) |ACF-;zerosOf;SupL;3|
              (22 . |rootsOf|) |ACF-;rootsOf;SupL;4| |ACF-;rootsOf;SupSL;5|
              |ACF-;zerosOf;SupSL;6| (|List| 7) (|Polynomial| 6)
              (28 . |variables|) (|SparseUnivariatePolynomial| 6)
              (33 . |univariate|) (|Polynomial| $) |ACF-;zeroOf;PS;8|
              |ACF-;rootOf;PS;9| |ACF-;zerosOf;PL;10| |ACF-;rootsOf;PL;11|
              (|NonNegativeInteger|) (38 . |degree|) (43 . |Zero|)
              (47 . |Zero|) (51 . |coefficient|) (|Boolean|) (57 . |zero?|)
              (62 . |leadingCoefficient|) (67 . |One|) (71 . |One|)
              (|PositiveInteger|) (75 . ^) (81 . *) (87 . *) (93 . -)
              (99 . |sqrt|) (104 . /) (110 . |reductum|) (|Union| 6 '"failed")
              (115 . |retractIfCan|) (120 . -) (|Integer|) (125 . |nthRoot|)
              |ACF-;zeroOf;SupSS;12| (131 . |new|) (136 . |monomial|)
              (|NumberTheoreticPolynomialFunctions| 24) (142 . |cyclotomic|)
              (148 . ^) (154 . |zero?|) (159 . |quo|) (|List| 24)
              (|PolynomialDecomposition| 24 6) (165 . |decompose|) (170 . >)
              (176 . |last|) (|Union| 24 '"failed") (181 . |leftFactor|)
              (187 . |coerce|) (192 . -) (198 . |ground?|) (203 . |elt|)
              (|Union| $ '"failed") (209 . |exquo|))
           '#(|zerosOf| 215 |zeroOf| 231 |rootsOf| 247 |rootOf| 263) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 74
                                                 '(0 7 0 8 2 6 0 9 7 10 2 6 0 9
                                                   7 12 2 6 14 9 7 15 2 6 14 9
                                                   7 17 1 22 21 0 23 1 22 24 0
                                                   25 1 24 31 0 32 0 6 0 33 0
                                                   24 0 34 2 24 6 0 31 35 1 6
                                                   36 0 37 1 24 6 0 38 0 6 0 39
                                                   0 24 0 40 2 6 0 0 41 42 2 6
                                                   0 41 0 43 2 6 0 0 0 44 2 6 0
                                                   0 0 45 1 6 0 0 46 2 6 0 0 0
                                                   47 1 24 0 0 48 1 24 49 0 50
                                                   1 6 0 0 51 2 6 0 0 52 53 1 7
                                                   0 0 55 2 24 0 6 31 56 2 57
                                                   24 31 24 58 2 6 0 0 31 59 1
                                                   24 36 0 60 2 24 0 0 0 61 1
                                                   63 62 24 64 2 31 36 0 0 65 1
                                                   62 24 0 66 2 63 67 24 24 68
                                                   1 24 0 6 69 2 24 0 0 0 70 1
                                                   24 36 0 71 2 24 6 0 6 72 2
                                                   24 73 0 0 74 2 0 14 9 7 20 1
                                                   0 14 26 29 1 0 14 9 16 2 0 0
                                                   9 7 54 1 0 0 26 27 1 0 0 9
                                                   11 2 0 14 9 7 19 1 0 14 26
                                                   30 1 0 14 9 18 1 0 0 26 28 1
                                                   0 0 9 13)))))
           '|lookupComplete|)) 
