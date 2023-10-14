
(SDEFUN |ACF-;zeroOf;SupS;1| ((|p| |SparseUnivariatePolynomial| S) ($ S))
        (SPROG ((|x| (|Symbol|)))
               (|ACF-;assign|
                (LETT |x| (SPADCALL (QREFELT $ 8)) |ACF-;zeroOf;SupS;1|)
                (SPADCALL |p| |x| (QREFELT $ 10)) $))) 

(SDEFUN |ACF-;rootOf;SupS;2| ((|p| |SparseUnivariatePolynomial| S) ($ S))
        (SPROG ((|x| (|Symbol|)))
               (|ACF-;assign|
                (LETT |x| (SPADCALL (QREFELT $ 8)) |ACF-;rootOf;SupS;2|)
                (SPADCALL |p| |x| (QREFELT $ 12)) $))) 

(SDEFUN |ACF-;zerosOf;SupL;3|
        ((|p| |SparseUnivariatePolynomial| S) ($ |List| S))
        (SPADCALL |p| (SPADCALL (QREFELT $ 8)) (QREFELT $ 15))) 

(SDEFUN |ACF-;rootsOf;SupL;4|
        ((|p| |SparseUnivariatePolynomial| S) ($ |List| S))
        (SPADCALL |p| (SPADCALL (QREFELT $ 8)) (QREFELT $ 17))) 

(SDEFUN |ACF-;rootsOf;SupSL;5|
        ((|p| |SparseUnivariatePolynomial| S) (|y| |Symbol|) ($ |List| S))
        (|ACF-;allroots| |p| |y| (ELT $ 12) $)) 

(SDEFUN |ACF-;zerosOf;SupSL;6|
        ((|p| |SparseUnivariatePolynomial| S) (|y| |Symbol|) ($ |List| S))
        (|ACF-;allroots| |p| |y| (ELT $ 10) $)) 

(SDEFUN |ACF-;assign| ((|x| |Symbol|) (|f| S) ($ S))
        (SEQ (|assignSymbol| |x| |f| (QREFELT $ 6)) (EXIT |f|))) 

(SDEFUN |ACF-;zeroOf;PS;8| ((|p| |Polynomial| S) ($ S))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |p| (QREFELT $ 23)) |ACF-;zeroOf;PS;8|))
                 (|error| "zeroOf: constant polynomial"))
                ('T
                 (SPADCALL (SPADCALL |p| (QREFELT $ 25)) (|SPADfirst| |l|)
                           (QREFELT $ 10)))))) 

(SDEFUN |ACF-;rootOf;PS;9| ((|p| |Polynomial| S) ($ S))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |p| (QREFELT $ 23)) |ACF-;rootOf;PS;9|))
                 (|error| "rootOf: constant polynomial"))
                ('T
                 (SPADCALL (SPADCALL |p| (QREFELT $ 25)) (|SPADfirst| |l|)
                           (QREFELT $ 12)))))) 

(SDEFUN |ACF-;zerosOf;PL;10| ((|p| |Polynomial| S) ($ |List| S))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |p| (QREFELT $ 23))
                        |ACF-;zerosOf;PL;10|))
                 (|error| "zerosOf: constant polynomial"))
                ('T
                 (SPADCALL (SPADCALL |p| (QREFELT $ 25)) (|SPADfirst| |l|)
                           (QREFELT $ 15)))))) 

(SDEFUN |ACF-;rootsOf;PL;11| ((|p| |Polynomial| S) ($ |List| S))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |p| (QREFELT $ 23))
                        |ACF-;rootsOf;PL;11|))
                 (|error| "rootsOf: constant polynomial"))
                ('T
                 (SPADCALL (SPADCALL |p| (QREFELT $ 25)) (|SPADfirst| |l|)
                           (QREFELT $ 17)))))) 

(SDEFUN |ACF-;zeroOf;SupSS;12|
        ((|p| |SparseUnivariatePolynomial| S) (|y| |Symbol|) ($ S))
        (SPROG
         ((|r| (|Union| S "failed")) (|b| (S)) (|a| (S))
          (|d| (|NonNegativeInteger|)))
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
                                       (SPADCALL
                                        (SPADCALL 4 |a| (QREFELT $ 43))
                                        (SPADCALL |p| 0 (QREFELT $ 35))
                                        (QREFELT $ 44))
                                       (QREFELT $ 45))
                             (QREFELT $ 46))
                            |b| (QREFELT $ 45))
                           (SPADCALL 2 |a| (QREFELT $ 43)) (QREFELT $ 47)))))
                   (#2#
                    (SEQ
                     (LETT |r|
                           (SPADCALL (SPADCALL |p| (QREFELT $ 48))
                                     (QREFELT $ 50))
                           . #1#)
                     (EXIT
                      (COND ((QEQCAR |r| 1) (SPADCALL |p| |y| (QREFELT $ 12)))
                            (#2#
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QCDR |r|) |a| (QREFELT $ 47))
                               (QREFELT $ 51))
                              |d| (QREFELT $ 53))))))))))))))) 

(SDEFUN |ACF-;binomialRoots|
        ((|p| |SparseUnivariatePolynomial| S) (|y| |Symbol|)
         (|fn| |Mapping| S (|SparseUnivariatePolynomial| S) (|Symbol|))
         ($ |List| S))
        (SPROG
         ((#1=#:G162 NIL) (#2=#:G156 NIL) (|i| NIL) (#3=#:G161 NIL)
          (|beta| (S)) (|x| (|Symbol|))
          (|cyclo| (|SparseUnivariatePolynomial| S))
          (|n| (|NonNegativeInteger|)) (|alpha| (S)))
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
                                                   '(|NonNegativeInteger|)
                                                   #2#))
                                . #4#)
                          G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |alpha|
                                             (SPADCALL |beta| |i|
                                                       (QREFELT $ 59))
                                             (QREFELT $ 44))
                                   #3#)
                                  . #4#)))
                          (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))))))))) 

(SDEFUN |ACF-;allroots|
        ((|p| |SparseUnivariatePolynomial| S) (|y| |Symbol|)
         (|fn| |Mapping| S (|SparseUnivariatePolynomial| S) (|Symbol|))
         ($ |List| S))
        (SPROG
         ((|ans| (|List| S)) (#1=#:G172 NIL)
          (|q| (|SparseUnivariatePolynomial| S)) (|alpha| (S)) (|x| (|Symbol|))
          (#2=#:G177 NIL) (#3=#:G176 #4=(|List| S)) (#5=#:G178 #4#)
          (#6=#:G198 NIL) (|r| NIL) (|groots| #4#)
          (|g| (|SparseUnivariatePolynomial| S))
          (|h| (|SparseUnivariatePolynomial| S))
          (|decompList| (|List| (|SparseUnivariatePolynomial| S)))
          (|p1| (|SparseUnivariatePolynomial| S)))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 60))
            (|error| "allroots: polynomial must be nonzero"))
           ((SPADCALL (SPADCALL |p| 0 (QREFELT $ 35)) (QREFELT $ 37))
            (CONS (|spadConstant| $ 33)
                  (|ACF-;allroots|
                   (SPADCALL |p|
                             (SPADCALL (|spadConstant| $ 39) 1 (QREFELT $ 56))
                             (QREFELT $ 61))
                   |y| |fn| $)))
           ((SPADCALL
             (LETT |p1| (SPADCALL |p| (QREFELT $ 48)) . #7=(|ACF-;allroots|))
             (QREFELT $ 60))
            NIL)
           ((SPADCALL (SPADCALL |p1| (QREFELT $ 48)) (QREFELT $ 60))
            (|ACF-;binomialRoots| |p| |y| |fn| $))
           (#8='T
            (SEQ (LETT |decompList| (SPADCALL |p| (QREFELT $ 64)) . #7#)
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |decompList|) 1 (QREFELT $ 65))
                    (SEQ
                     (LETT |h| (SPADCALL |decompList| (QREFELT $ 66)) . #7#)
                     (LETT |g|
                           (PROG2
                               (LETT #1# (SPADCALL |p| |h| (QREFELT $ 68))
                                     . #7#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 6))
                                            #1#))
                           . #7#)
                     (LETT |groots| (|ACF-;allroots| |g| |y| |fn| $) . #7#)
                     (EXIT
                      (PROGN
                       (LETT #2# NIL . #7#)
                       (SEQ (LETT |r| NIL . #7#) (LETT #6# |groots| . #7#) G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |r| (CAR #6#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #5#
                                     (|ACF-;allroots|
                                      (SPADCALL |h|
                                                (SPADCALL |r| (QREFELT $ 69))
                                                (QREFELT $ 70))
                                      |y| |fn| $)
                                     . #7#)
                               (COND (#2# (LETT #3# (APPEND #3# #5#) . #7#))
                                     ('T
                                      (PROGN
                                       (LETT #3# #5# . #7#)
                                       (LETT #2# 'T . #7#)))))))
                            (LETT #6# (CDR #6#) . #7#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#2# #3#) (#8# NIL))))))
                   (#8#
                    (SEQ (LETT |ans| NIL . #7#)
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
                                            . #7#)
                                      (SPADCALL |p| |x| |fn|) $)
                                     . #7#)
                               (LETT |q|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 39) 1
                                                (QREFELT $ 56))
                                      (SPADCALL |alpha| (QREFELT $ 69))
                                      (QREFELT $ 70))
                                     . #7#)
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |p| |alpha| (QREFELT $ 72))
                                   (QREFELT $ 37))
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (SPADCALL
                                           (SPADCALL |p| |alpha|
                                                     (QREFELT $ 72))
                                           (QREFELT $ 37)))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |p|
                                              (PROG2
                                                  (LETT #1#
                                                        (SPADCALL |p| |q|
                                                                  (QREFELT $
                                                                           74))
                                                        . #7#)
                                                  (QCDR #1#)
                                                (|check_union| (QEQCAR #1# 0)
                                                               (|SparseUnivariatePolynomial|
                                                                (QREFELT $ 6))
                                                               #1#))
                                              . #7#)
                                        (EXIT
                                         (LETT |ans| (CONS |alpha| |ans|)
                                               . #7#)))
                                       NIL (GO G190) G191 (EXIT NIL)))
                                 ('T
                                  (SEQ
                                   (LETT |p| (SPADCALL |p| |q| (QREFELT $ 61))
                                         . #7#)
                                   (EXIT
                                    (LETT |ans| (CONS |alpha| |ans|)
                                          . #7#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (NREVERSE |ans|)))))))))))) 

(DECLAIM (NOTINLINE |AlgebraicallyClosedField&;|)) 

(DEFUN |AlgebraicallyClosedField&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicallyClosedField&|))
          (LETT |dv$| (LIST '|AlgebraicallyClosedField&| DV$1) . #1#)
          (LETT $ (GETREFV 75) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

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
