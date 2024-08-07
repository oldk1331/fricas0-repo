
(SDEFUN |ACF-;zeroOf;SupS;1| ((|p| (|SparseUnivariatePolynomial| S)) (% (S)))
        (SPROG ((|x| (|Symbol|)))
               (|ACF-;assign| (LETT |x| (SPADCALL (QREFELT % 8)))
                (SPADCALL |p| |x| (QREFELT % 10)) %))) 

(SDEFUN |ACF-;rootOf;SupS;2| ((|p| (|SparseUnivariatePolynomial| S)) (% (S)))
        (SPROG ((|x| (|Symbol|)))
               (|ACF-;assign| (LETT |x| (SPADCALL (QREFELT % 8)))
                (SPADCALL |p| |x| (QREFELT % 12)) %))) 

(SDEFUN |ACF-;zerosOf;SupL;3|
        ((|p| (|SparseUnivariatePolynomial| S)) (% (|List| S)))
        (SPADCALL |p| (SPADCALL (QREFELT % 8)) (QREFELT % 15))) 

(SDEFUN |ACF-;rootsOf;SupL;4|
        ((|p| (|SparseUnivariatePolynomial| S)) (% (|List| S)))
        (SPADCALL |p| (SPADCALL (QREFELT % 8)) (QREFELT % 17))) 

(SDEFUN |ACF-;rootsOf;SupSL;5|
        ((|p| (|SparseUnivariatePolynomial| S)) (|y| (|Symbol|))
         (% (|List| S)))
        (|ACF-;allroots| |p| |y| (ELT % 12) %)) 

(SDEFUN |ACF-;zerosOf;SupSL;6|
        ((|p| (|SparseUnivariatePolynomial| S)) (|y| (|Symbol|))
         (% (|List| S)))
        (|ACF-;allroots| |p| |y| (ELT % 10) %)) 

(SDEFUN |ACF-;assign| ((|x| (|Symbol|)) (|f| (S)) (% (S)))
        (SEQ (|assignSymbol| |x| |f| (QREFELT % 6)) (EXIT |f|))) 

(SDEFUN |ACF-;zeroOf;PS;8| ((|p| (|Polynomial| S)) (% (S)))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL (LETT |l| (SPADCALL |p| (QREFELT % 23))))
                 (|error| "zeroOf: constant polynomial"))
                ('T
                 (SPADCALL (SPADCALL |p| (QREFELT % 25)) (|SPADfirst| |l|)
                           (QREFELT % 10)))))) 

(SDEFUN |ACF-;rootOf;PS;9| ((|p| (|Polynomial| S)) (% (S)))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL (LETT |l| (SPADCALL |p| (QREFELT % 23))))
                 (|error| "rootOf: constant polynomial"))
                ('T
                 (SPADCALL (SPADCALL |p| (QREFELT % 25)) (|SPADfirst| |l|)
                           (QREFELT % 12)))))) 

(SDEFUN |ACF-;zerosOf;PL;10| ((|p| (|Polynomial| S)) (% (|List| S)))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL (LETT |l| (SPADCALL |p| (QREFELT % 23))))
                 (|error| "zerosOf: constant polynomial"))
                ('T
                 (SPADCALL (SPADCALL |p| (QREFELT % 25)) (|SPADfirst| |l|)
                           (QREFELT % 15)))))) 

(SDEFUN |ACF-;rootsOf;PL;11| ((|p| (|Polynomial| S)) (% (|List| S)))
        (SPROG ((|l| (|List| (|Symbol|))))
               (COND
                ((NULL (LETT |l| (SPADCALL |p| (QREFELT % 23))))
                 (|error| "rootsOf: constant polynomial"))
                ('T
                 (SPADCALL (SPADCALL |p| (QREFELT % 25)) (|SPADfirst| |l|)
                           (QREFELT % 17)))))) 

(SDEFUN |ACF-;zeroOf;SupSS;12|
        ((|p| (|SparseUnivariatePolynomial| S)) (|y| (|Symbol|)) (% (S)))
        (SPROG
         ((|r| (|Union| S "failed")) (|b| (S)) (|a| (S))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((ZEROP (LETT |d| (SPADCALL |p| (QREFELT % 32))))
            (|error| "zeroOf: constant polynomial"))
           ((SPADCALL (SPADCALL |p| 0 (QREFELT % 35)) (QREFELT % 37))
            (|spadConstant| % 33))
           (#1='T
            (SEQ (LETT |a| (SPADCALL |p| (QREFELT % 38)))
                 (EXIT
                  (COND
                   ((EQL |d| 2)
                    (SEQ (LETT |b| (SPADCALL |p| 1 (QREFELT % 35)))
                         (EXIT
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL |b| 2 (QREFELT % 42))
                                       (SPADCALL
                                        (SPADCALL 4 |a| (QREFELT % 43))
                                        (SPADCALL |p| 0 (QREFELT % 35))
                                        (QREFELT % 44))
                                       (QREFELT % 45))
                             (QREFELT % 46))
                            |b| (QREFELT % 45))
                           (SPADCALL 2 |a| (QREFELT % 43)) (QREFELT % 47)))))
                   (#1#
                    (SEQ
                     (LETT |r|
                           (SPADCALL (SPADCALL |p| (QREFELT % 48))
                                     (QREFELT % 50)))
                     (EXIT
                      (COND ((QEQCAR |r| 1) (SPADCALL |p| |y| (QREFELT % 12)))
                            (#1#
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QCDR |r|) |a| (QREFELT % 47))
                               (QREFELT % 51))
                              |d| (QREFELT % 53))))))))))))))) 

(SDEFUN |ACF-;binomialRoots|
        ((|p| (|SparseUnivariatePolynomial| S)) (|y| (|Symbol|))
         (|fn| (|Mapping| S (|SparseUnivariatePolynomial| S) (|Symbol|)))
         (% (|List| S)))
        (SPROG
         ((#1=#:G94 NIL) (#2=#:G88 NIL) (|i| NIL) (#3=#:G93 NIL) (|beta| (S))
          (|x| (|Symbol|)) (|cyclo| (|SparseUnivariatePolynomial| S))
          (|n| (|NonNegativeInteger|)) (|alpha| (S)))
         (SEQ
          (LETT |alpha|
                (|ACF-;assign| (LETT |x| (SPADCALL |y| (QREFELT % 55)))
                 (SPADCALL |p| |x| |fn|) %))
          (LETT |n| (SPADCALL |p| (QREFELT % 32)))
          (EXIT
           (COND ((EQL |n| 1) (LIST |alpha|))
                 ('T
                  (SEQ
                   (LETT |cyclo|
                         (SPADCALL (ELT % 56) (SPADCALL |n| (QREFELT % 59))
                                   (QREFELT % 62)))
                   (LETT |beta|
                         (|ACF-;assign|
                          (LETT |x| (SPADCALL |y| (QREFELT % 55)))
                          (SPADCALL |cyclo| |x| |fn|) %))
                   (EXIT
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |i| 0)
                          (LETT #1#
                                (PROG1 (LETT #2# (- |n| 1))
                                  (|check_subtype2| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #2#)))
                          G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |alpha|
                                             (SPADCALL |beta| |i|
                                                       (QREFELT % 63))
                                             (QREFELT % 44))
                                   #3#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))))))))) 

(SDEFUN |ACF-;allroots|
        ((|p| (|SparseUnivariatePolynomial| S)) (|y| (|Symbol|))
         (|fn| (|Mapping| S (|SparseUnivariatePolynomial| S) (|Symbol|)))
         (% (|List| S)))
        (SPROG
         ((|ans| (|List| S)) (#1=#:G135 NIL)
          (|q| (|SparseUnivariatePolynomial| S)) (|alpha| (S)) (|x| (|Symbol|))
          (#2=#:G140 NIL) (#3=#:G139 #4=(|List| S)) (#5=#:G141 #4#)
          (#6=#:G189 NIL) (|r| NIL) (|groots| #4#)
          (|g| (|SparseUnivariatePolynomial| S))
          (|h| (|SparseUnivariatePolynomial| S))
          (|decompList| (|List| (|SparseUnivariatePolynomial| S)))
          (|p1| (|SparseUnivariatePolynomial| S)))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT % 64))
            (|error| "allroots: polynomial must be nonzero"))
           ((SPADCALL (SPADCALL |p| 0 (QREFELT % 35)) (QREFELT % 37))
            (CONS (|spadConstant| % 33)
                  (|ACF-;allroots|
                   (SPADCALL |p|
                             (SPADCALL (|spadConstant| % 39) 1 (QREFELT % 65))
                             (QREFELT % 66))
                   |y| |fn| %)))
           ((SPADCALL (LETT |p1| (SPADCALL |p| (QREFELT % 48))) (QREFELT % 64))
            NIL)
           ((SPADCALL (SPADCALL |p1| (QREFELT % 48)) (QREFELT % 64))
            (|ACF-;binomialRoots| |p| |y| |fn| %))
           (#7='T
            (SEQ (LETT |decompList| (SPADCALL |p| (QREFELT % 69)))
                 (EXIT
                  (COND
                   ((> (LENGTH |decompList|) 1)
                    (SEQ (LETT |h| (SPADCALL |decompList| (QREFELT % 70)))
                         (LETT |g|
                               (PROG2
                                   (LETT #1# (SPADCALL |p| |h| (QREFELT % 72)))
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT % 6))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT % 6))
                                                  #8="failed")
                                                 #1#)))
                         (LETT |groots| (|ACF-;allroots| |g| |y| |fn| %))
                         (EXIT
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |r| NIL) (LETT #6# |groots|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |r| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #5#
                                         (|ACF-;allroots|
                                          (SPADCALL |h|
                                                    (SPADCALL |r|
                                                              (QREFELT % 73))
                                                    (QREFELT % 74))
                                          |y| |fn| %))
                                   (COND
                                    (#2#
                                     (LETT #3#
                                           (SPADCALL #3# #5# (QREFELT % 76))))
                                    ('T
                                     (PROGN (LETT #3# #5#) (LETT #2# 'T)))))))
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (COND (#2# #3#) (#7# NIL))))))
                   (#7#
                    (SEQ (LETT |ans| NIL)
                         (SEQ G190
                              (COND
                               ((NULL (NULL (SPADCALL |p| (QREFELT % 77))))
                                (GO G191)))
                              (SEQ
                               (LETT |alpha|
                                     (|ACF-;assign|
                                      (LETT |x| (SPADCALL |y| (QREFELT % 55)))
                                      (SPADCALL |p| |x| |fn|) %))
                               (LETT |q|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 39) 1
                                                (QREFELT % 65))
                                      (SPADCALL |alpha| (QREFELT % 73))
                                      (QREFELT % 74)))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |p| |alpha| (QREFELT % 78))
                                   (QREFELT % 37))
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (SPADCALL
                                           (SPADCALL |p| |alpha|
                                                     (QREFELT % 78))
                                           (QREFELT % 37)))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |p|
                                              (PROG2
                                                  (LETT #1#
                                                        (SPADCALL |p| |q|
                                                                  (QREFELT %
                                                                           80)))
                                                  (QCDR #1#)
                                                (|check_union2| (QEQCAR #1# 0)
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT % 6))
                                                                (|Union|
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT %
                                                                           6))
                                                                 #8#)
                                                                #1#)))
                                        (EXIT
                                         (LETT |ans| (CONS |alpha| |ans|))))
                                       NIL (GO G190) G191 (EXIT NIL)))
                                 ('T
                                  (SEQ
                                   (LETT |p| (SPADCALL |p| |q| (QREFELT % 66)))
                                   (EXIT
                                    (LETT |ans| (CONS |alpha| |ans|))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (NREVERSE |ans|)))))))))))) 

(DECLAIM (NOTINLINE |AlgebraicallyClosedField&;|)) 

(DEFUN |AlgebraicallyClosedField&| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|AlgebraicallyClosedField&| DV$1))
          (LETT % (GETREFV 81))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|AlgebraicallyClosedField&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|) (0 . |new|)
              (|SparseUnivariatePolynomial| %) (4 . |zeroOf|)
              |ACF-;zeroOf;SupS;1| (10 . |rootOf|) |ACF-;rootOf;SupS;2|
              (|List| %) (16 . |zerosOf|) |ACF-;zerosOf;SupL;3|
              (22 . |rootsOf|) |ACF-;rootsOf;SupL;4| |ACF-;rootsOf;SupSL;5|
              |ACF-;zerosOf;SupSL;6| (|List| 7) (|Polynomial| 6)
              (28 . |variables|) (|SparseUnivariatePolynomial| 6)
              (33 . |univariate|) (|Polynomial| %) |ACF-;zeroOf;PS;8|
              |ACF-;rootOf;PS;9| |ACF-;zerosOf;PL;10| |ACF-;rootsOf;PL;11|
              (|NonNegativeInteger|) (38 . |degree|) (43 . |Zero|)
              (47 . |Zero|) (51 . |coefficient|) (|Boolean|) (57 . |zero?|)
              (62 . |leadingCoefficient|) (67 . |One|) (71 . |One|)
              (|PositiveInteger|) (75 . ^) (81 . *) (87 . *) (93 . -)
              (99 . |sqrt|) (104 . /) (110 . |reductum|) (|Union| 6 '"failed")
              (115 . |retractIfCan|) (120 . -) (|Integer|) (125 . |nthRoot|)
              |ACF-;zeroOf;SupSS;12| (131 . |new|) (136 . |coerce|)
              (|SparseUnivariatePolynomial| 52)
              (|PolynomialNumberTheoryFunctions|) (141 . |cyclotomic|)
              (|Mapping| 6 52)
              (|UnivariatePolynomialCategoryFunctions2| 52 57 6 24)
              (146 . |map|) (152 . ^) (158 . |zero?|) (163 . |monomial|)
              (169 . |quo|) (|List| 24)
              (|UnivariatePolynomialDecompositionPackage| 6 24)
              (175 . |completeDecompose|) (180 . |last|) (|Union| 24 '"failed")
              (185 . |leftFactorIfCan|) (191 . |coerce|) (196 . -) (|List| 6)
              (202 . |append|) (208 . |ground?|) (213 . |elt|)
              (|Union| % '"failed") (219 . |exquo|))
           '#(|zerosOf| 225 |zeroOf| 241 |rootsOf| 257 |rootOf| 273) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|zerosOf|
                                 ((|List| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)
                                  (|Symbol|)))
                                T)
                              '((|zerosOf|
                                 ((|List| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|zerosOf| ((|List| |#1|) (|Polynomial| |#1|)))
                                T)
                              '((|zeroOf|
                                 (|#1| (|SparseUnivariatePolynomial| |#1|)
                                  (|Symbol|)))
                                T)
                              '((|zeroOf|
                                 (|#1| (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|zeroOf| (|#1| (|Polynomial| |#1|))) T)
                              '((|rootsOf|
                                 ((|List| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)
                                  (|Symbol|)))
                                T)
                              '((|rootsOf|
                                 ((|List| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|rootsOf| ((|List| |#1|) (|Polynomial| |#1|)))
                                T)
                              '((|rootOf|
                                 (|#1| (|SparseUnivariatePolynomial| |#1|)
                                  (|Symbol|)))
                                T)
                              '((|rootOf|
                                 (|#1| (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|rootOf| (|#1| (|Polynomial| |#1|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 80
                                            '(0 7 0 8 2 6 0 9 7 10 2 6 0 9 7 12
                                              2 6 14 9 7 15 2 6 14 9 7 17 1 22
                                              21 0 23 1 22 24 0 25 1 24 31 0 32
                                              0 6 0 33 0 24 0 34 2 24 6 0 31 35
                                              1 6 36 0 37 1 24 6 0 38 0 6 0 39
                                              0 24 0 40 2 6 0 0 41 42 2 6 0 41
                                              0 43 2 6 0 0 0 44 2 6 0 0 0 45 1
                                              6 0 0 46 2 6 0 0 0 47 1 24 0 0 48
                                              1 24 49 0 50 1 6 0 0 51 2 6 0 0
                                              52 53 1 7 0 0 55 1 6 0 52 56 1 58
                                              57 52 59 2 61 24 60 57 62 2 6 0 0
                                              31 63 1 24 36 0 64 2 24 0 6 31 65
                                              2 24 0 0 0 66 1 68 67 24 69 1 67
                                              24 0 70 2 68 71 24 24 72 1 24 0 6
                                              73 2 24 0 0 0 74 2 75 0 0 0 76 1
                                              24 36 0 77 2 24 6 0 6 78 2 24 79
                                              0 0 80 1 0 14 9 16 1 0 14 26 29 2
                                              0 14 9 7 20 1 0 0 9 11 1 0 0 26
                                              27 2 0 0 9 7 54 1 0 14 9 18 1 0
                                              14 26 30 2 0 14 9 7 19 1 0 0 9 13
                                              1 0 0 26 28)))))
           '|lookupComplete|)) 
