
(/VERSIONCHECK 2) 

(DEFUN |GCDDOM-;lcm;3S;1| (|x| |y| $)
  (PROG (LCM)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |y| (|spadConstant| $ 7) (QREFELT $ 9))
            (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 9)))
        (|spadConstant| $ 7))
       ('T
        (SEQ
         (LETT LCM
               (SPADCALL |y| (SPADCALL |x| |y| (QREFELT $ 10)) (QREFELT $ 12))
               |GCDDOM-;lcm;3S;1|)
         (EXIT
          (COND ((QEQCAR LCM 0) (SPADCALL |x| (QCDR LCM) (QREFELT $ 13)))
                ('T (|error| "bad gcd in lcm computation"))))))))))) 

(DEFUN |GCDDOM-;lcm;LS;2| (|l| $)
  (SPADCALL (ELT $ 15) |l| (|spadConstant| $ 16) (|spadConstant| $ 7)
            (QREFELT $ 19))) 

(DEFUN |GCDDOM-;gcd;LS;3| (|l| $)
  (SPADCALL (ELT $ 10) |l| (|spadConstant| $ 7) (|spadConstant| $ 16)
            (QREFELT $ 19))) 

(DEFUN |GCDDOM-;gcdPolynomial;3Sup;4| (|p1| |p2| $)
  (PROG (#1=#:G156 |c2| |p| |c1| |e1| |e2|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p1| (QREFELT $ 24)) (SPADCALL |p2| (QREFELT $ 25)))
            ((SPADCALL |p2| (QREFELT $ 24)) (SPADCALL |p1| (QREFELT $ 25)))
            (#2='T
             (SEQ
              (LETT |c1| (SPADCALL |p1| (QREFELT $ 26))
                    . #3=(|GCDDOM-;gcdPolynomial;3Sup;4|))
              (LETT |c2| (SPADCALL |p2| (QREFELT $ 26)) . #3#)
              (LETT |p1|
                    (PROG2 (LETT #1# (SPADCALL |p1| |c1| (QREFELT $ 27)) . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 6))
                                     #1#))
                    . #3#)
              (LETT |p2|
                    (PROG2 (LETT #1# (SPADCALL |p2| |c2| (QREFELT $ 27)) . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 6))
                                     #1#))
                    . #3#)
              (SEQ (LETT |e1| (SPADCALL |p1| (QREFELT $ 29)) . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL |e1| 0 (QREFELT $ 31))
                      (LETT |p1|
                            (PROG2
                                (LETT #1#
                                      (SPADCALL |p1|
                                                (SPADCALL (|spadConstant| $ 16)
                                                          |e1| (QREFELT $ 33))
                                                (QREFELT $ 34))
                                      . #3#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 6))
                                             #1#))
                            . #3#)))))
              (SEQ (LETT |e2| (SPADCALL |p2| (QREFELT $ 29)) . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL |e2| 0 (QREFELT $ 31))
                      (LETT |p2|
                            (PROG2
                                (LETT #1#
                                      (SPADCALL |p2|
                                                (SPADCALL (|spadConstant| $ 16)
                                                          |e2| (QREFELT $ 33))
                                                (QREFELT $ 34))
                                      . #3#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 6))
                                             #1#))
                            . #3#)))))
              (LETT |e1| (MIN |e1| |e2|) . #3#)
              (LETT |c1| (SPADCALL |c1| |c2| (QREFELT $ 10)) . #3#)
              (LETT |p1|
                    (COND
                     ((OR (EQL (SPADCALL |p1| (QREFELT $ 35)) 0)
                          (EQL (SPADCALL |p2| (QREFELT $ 35)) 0))
                      (SPADCALL |c1| 0 (QREFELT $ 33)))
                     ('T
                      (SEQ (LETT |p| (SPADCALL |p1| |p2| (QREFELT $ 36)) . #3#)
                           (EXIT
                            (COND
                             ((EQL (SPADCALL |p| (QREFELT $ 35)) 0)
                              (SPADCALL |c1| 0 (QREFELT $ 33)))
                             (#2#
                              (SEQ
                               (LETT |c2|
                                     (SPADCALL (SPADCALL |p1| (QREFELT $ 37))
                                               (SPADCALL |p2| (QREFELT $ 37))
                                               (QREFELT $ 10))
                                     . #3#)
                               (EXIT
                                (SPADCALL
                                 (SPADCALL |c1|
                                           (SPADCALL
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL
                                                       (SPADCALL |c2| |p|
                                                                 (QREFELT $
                                                                          38))
                                                       (SPADCALL |p|
                                                                 (QREFELT $
                                                                          37))
                                                       (QREFELT $ 27))
                                                      . #3#)
                                                (QCDR #1#)
                                              (|check_union| (QEQCAR #1# 0)
                                                             (|SparseUnivariatePolynomial|
                                                              (QREFELT $ 6))
                                                             #1#))
                                            (QREFELT $ 39))
                                           (QREFELT $ 38))
                                 (QREFELT $ 25))))))))))
                    . #3#)
              (EXIT
               (COND ((ZEROP |e1|) |p1|)
                     (#2#
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 16) |e1| (QREFELT $ 33))
                       |p1| (QREFELT $ 40)))))))))))) 

(DEFUN |GcdDomain&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GcdDomain&|))
      (LETT |dv$| (LIST '|GcdDomain&| DV$1) . #1#)
      (LETT $ (GETREFV 43) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|GcdDomain&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (|Boolean|)
              (4 . =) (10 . |gcd|) (|Union| $ '"failed") (16 . |exquo|)
              (22 . *) |GCDDOM-;lcm;3S;1| (28 . |lcm|) (34 . |One|)
              (|Mapping| 6 6 6) (|List| 6) (38 . |reduce|) (|List| $)
              |GCDDOM-;lcm;LS;2| |GCDDOM-;gcd;LS;3|
              (|SparseUnivariatePolynomial| 6) (46 . |zero?|)
              (51 . |unitCanonical|) (56 . |content|) (61 . |exquo|)
              (|NonNegativeInteger|) (67 . |minimumDegree|) (72 . |Zero|)
              (76 . >) (82 . |One|) (86 . |monomial|) (92 . |exquo|)
              (98 . |degree|) (103 . |subResultantGcd|)
              (109 . |leadingCoefficient|) (114 . *) (120 . |primitivePart|)
              (125 . *) (|SparseUnivariatePolynomial| $)
              |GCDDOM-;gcdPolynomial;3Sup;4|)
           '#(|lcm| 131 |gcdPolynomial| 142 |gcd| 148) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 42
                                                 '(0 6 0 7 2 6 8 0 0 9 2 6 0 0
                                                   0 10 2 6 11 0 0 12 2 6 0 0 0
                                                   13 2 6 0 0 0 15 0 6 0 16 4
                                                   18 6 17 0 6 6 19 1 23 8 0 24
                                                   1 23 0 0 25 1 23 6 0 26 2 23
                                                   11 0 6 27 1 23 28 0 29 0 23
                                                   0 30 2 28 8 0 0 31 0 23 0 32
                                                   2 23 0 6 28 33 2 23 11 0 0
                                                   34 1 23 28 0 35 2 23 0 0 0
                                                   36 1 23 6 0 37 2 23 0 6 0 38
                                                   1 23 0 0 39 2 23 0 0 0 40 1
                                                   0 0 20 21 2 0 0 0 0 14 2 0
                                                   41 41 41 42 1 0 0 20 22)))))
           '|lookupComplete|)) 
