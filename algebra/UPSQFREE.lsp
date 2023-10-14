
(/VERSIONCHECK 2) 

(DEFUN |UPSQFREE;squareFreePart;2P;1| (|p| $)
  (PROG (#1=#:G133)
    (RETURN
     (PROG2
         (LETT #1#
               (SPADCALL |p|
                         (SPADCALL |p| (SPADCALL |p| (QREFELT $ 8))
                                   (QREFELT $ 9))
                         (QREFELT $ 11))
               |UPSQFREE;squareFreePart;2P;1|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))))) 

(DEFUN |UPSQFREE;squareFreePart;2P;2| (|p| $)
  (PROG (#1=#:G138 #2=#:G137 #3=#:G139 #4=#:G141 |f| |s|)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL
        (LETT |s| (SPADCALL |p| (QREFELT $ 14))
              . #5=(|UPSQFREE;squareFreePart;2P;2|))
        (QREFELT $ 15))
       (PROGN
        (LETT #1# NIL . #5#)
        (SEQ (LETT |f| NIL . #5#)
             (LETT #4# (SPADCALL |s| (QREFELT $ 18)) . #5#) G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3# (QCAR |f|) . #5#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 19)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
             (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|spadConstant| $ 20))))
       (QREFELT $ 19)))))) 

(DEFUN |UPSQFREE;BumInSepFFE;2R;3| (|ffe| $)
  (VECTOR (CONS 1 "sqfr") (SPADCALL (ELT $ 21) (QVELT |ffe| 1) (QREFELT $ 23))
          (SPADCALL (SPADCALL (QREFELT $ 25)) (QVELT |ffe| 2) (QREFELT $ 27)))) 

(DEFUN |UPSQFREE;BumInSepFFE;2R;4| (|ffe| $)
  (PROG (|nthrp| |np|)
    (RETURN
     (SEQ
      (LETT |np|
            (SPADCALL (QVELT |ffe| 1) (SPADCALL (QREFELT $ 25)) (QREFELT $ 31))
            . #1=(|UPSQFREE;BumInSepFFE;2R;4|))
      (LETT |nthrp| (SPADCALL |np| (QREFELT $ 32)) . #1#)
      (EXIT
       (COND ((QEQCAR |nthrp| 1) (VECTOR (CONS 0 "nil") |np| (QVELT |ffe| 2)))
             ('T
              (VECTOR (CONS 1 "sqfr") (QCDR |nthrp|)
                      (SPADCALL (SPADCALL (QREFELT $ 25)) (QVELT |ffe| 2)
                                (QREFELT $ 27)))))))))) 

(DEFUN |UPSQFREE;BumInSepFFE;2R;5| (|ffe| $)
  (VECTOR (CONS 0 "nil")
          (SPADCALL (QVELT |ffe| 1) (SPADCALL (QREFELT $ 25)) (QREFELT $ 31))
          (QVELT |ffe| 2))) 

(DEFUN |UPSQFREE;squareFree;PF;6| (|p| $)
  (PROG (#1=#:G189 |lffe| |lcp| #2=#:G186 |i| |pi| |di| #3=#:G183 |ci| |a| |c|
         |u| |#G11|)
    (RETURN
     (SEQ (LETT |ci| |p| . #4=(|UPSQFREE;squareFree;PF;6|))
          (LETT |di| (SPADCALL |p| (QREFELT $ 8)) . #4#)
          (LETT |pi| (SPADCALL |ci| |di| (QREFELT $ 9)) . #4#)
          (EXIT
           (COND
            ((EQL (SPADCALL |pi| (QREFELT $ 33)) 0)
             (SEQ
              (PROGN
               (LETT |#G11| (SPADCALL |p| (QREFELT $ 36)) . #4#)
               (LETT |u| (QVELT |#G11| 0) . #4#)
               (LETT |c| (QVELT |#G11| 1) . #4#)
               (LETT |a| (QVELT |#G11| 2) . #4#)
               |#G11|)
              (EXIT
               (SPADCALL |u| (LIST (VECTOR (CONS 1 "sqfr") |c| 1))
                         (QREFELT $ 39)))))
            ('T
             (SEQ (LETT |i| 0 . #4#) (LETT |lffe| NIL . #4#)
                  (LETT |lcp| (SPADCALL |p| (QREFELT $ 40)) . #4#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |ci| (QREFELT $ 33)) 0
                                    (QREFELT $ 42)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ
                          (LETT |ci|
                                (PROG2
                                    (LETT #3#
                                          (SPADCALL |ci| |pi| (QREFELT $ 11))
                                          . #4#)
                                    (QCDR #3#)
                                  (|check_union| (QEQCAR #3# 0) (QREFELT $ 7)
                                                 #3#))
                                . #4#)
                          (LETT |di|
                                (SPADCALL
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL |di| |pi| (QREFELT $ 11))
                                           . #4#)
                                     (QCDR #3#)
                                   (|check_union| (QEQCAR #3# 0) (QREFELT $ 7)
                                                  #3#))
                                 (SPADCALL |ci| (QREFELT $ 8)) (QREFELT $ 43))
                                . #4#)
                          (LETT |pi| (SPADCALL |ci| |di| (QREFELT $ 9)) . #4#)
                          (LETT |i| (+ |i| 1) . #4#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |pi| (QREFELT $ 33)) 0
                                       (QREFELT $ 44))
                             (PROGN
                              (LETT #1#
                                    (SEQ
                                     (LETT |lcp|
                                           (PROG2
                                               (LETT #2#
                                                     (SPADCALL |lcp|
                                                               (SPADCALL
                                                                (SPADCALL |pi|
                                                                          (QREFELT
                                                                           $
                                                                           40))
                                                                |i|
                                                                (QREFELT $ 45))
                                                               (QREFELT $ 46))
                                                     . #4#)
                                               (QCDR #2#)
                                             (|check_union| (QEQCAR #2# 0)
                                                            (QREFELT $ 6) #2#))
                                           . #4#)
                                     (EXIT
                                      (LETT |lffe|
                                            (CONS
                                             (VECTOR (CONS 1 "sqfr") |pi| |i|)
                                             |lffe|)
                                            . #4#)))
                                    . #4#)
                              (GO #1#)))))))
                        #1# (EXIT #1#))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL (SPADCALL |lcp| (QREFELT $ 47)) |lffe|
                             (QREFELT $ 39))))))))))) 

(DEFUN |UPSQFREE;squareFree;PF;7| (|p| $)
  (PROG (|lffe| |lsnil| #1=#:G218 |ffe| #2=#:G217 |redSqfr| #3=#:G203 |dunit|
         |pi| |lc| #4=#:G206 |i| |ci| |di| |diprev| |a| |c| |u| |#G13|)
    (RETURN
     (SEQ
      (LETT |ci| (SPADCALL |p| (SPADCALL |p| (QREFELT $ 8)) (QREFELT $ 9))
            . #5=(|UPSQFREE;squareFree;PF;7|))
      (EXIT
       (COND
        ((EQL (SPADCALL |ci| (QREFELT $ 33)) 0)
         (SEQ
          (PROGN
           (LETT |#G13| (SPADCALL |p| (QREFELT $ 36)) . #5#)
           (LETT |u| (QVELT |#G13| 0) . #5#)
           (LETT |c| (QVELT |#G13| 1) . #5#)
           (LETT |a| (QVELT |#G13| 2) . #5#)
           |#G13|)
          (EXIT
           (SPADCALL |u| (LIST (VECTOR (CONS 1 "sqfr") |c| 1))
                     (QREFELT $ 39)))))
        (#6='T
         (SEQ
          (LETT |di|
                (PROG2 (LETT #3# (SPADCALL |p| |ci| (QREFELT $ 11)) . #5#)
                    (QCDR #3#)
                  (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                . #5#)
          (LETT |i| 0 . #5#) (LETT |lffe| NIL . #5#)
          (LETT |dunit| (|spadConstant| $ 20) . #5#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |di| (QREFELT $ 33)) 0 (QREFELT $ 42)))
                 (GO G191)))
               (SEQ (LETT |diprev| |di| . #5#)
                    (LETT |di| (SPADCALL |ci| |di| (QREFELT $ 9)) . #5#)
                    (LETT |ci|
                          (PROG2
                              (LETT #3# (SPADCALL |ci| |di| (QREFELT $ 11))
                                    . #5#)
                              (QCDR #3#)
                            (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                          . #5#)
                    (LETT |i| (+ |i| 1) . #5#)
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |diprev| (QREFELT $ 33))
                            (SPADCALL |di| (QREFELT $ 33)))
                       (SEQ
                        (LETT |lc|
                              (PROG2
                                  (LETT #4#
                                        (SPADCALL
                                         (SPADCALL |diprev| (QREFELT $ 40))
                                         (SPADCALL |di| (QREFELT $ 40))
                                         (QREFELT $ 46))
                                        . #5#)
                                  (QCDR #4#)
                                (|check_union| (QEQCAR #4# 0) (QREFELT $ 6)
                                               #4#))
                              . #5#)
                        (EXIT
                         (LETT |dunit|
                               (SPADCALL (SPADCALL |lc| |i| (QREFELT $ 45))
                                         |dunit| (QREFELT $ 48))
                               . #5#))))
                      ('T
                       (SEQ
                        (LETT |pi|
                              (PROG2
                                  (LETT #3#
                                        (SPADCALL |diprev| |di| (QREFELT $ 11))
                                        . #5#)
                                  (QCDR #3#)
                                (|check_union| (QEQCAR #3# 0) (QREFELT $ 7)
                                               #3#))
                              . #5#)
                        (EXIT
                         (LETT |lffe|
                               (CONS (VECTOR (CONS 1 "sqfr") |pi| |i|) |lffe|)
                               . #5#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |dunit|
                (SPADCALL |dunit| (SPADCALL |di| (+ |i| 1) (QREFELT $ 49))
                          (QREFELT $ 19))
                . #5#)
          (EXIT
           (COND
            ((EQL (SPADCALL |ci| (QREFELT $ 33)) 0)
             (SPADCALL (SPADCALL |dunit| |ci| (QREFELT $ 19)) |lffe|
                       (QREFELT $ 39)))
            (#6#
             (SEQ
              (LETT |redSqfr|
                    (SPADCALL
                     (PROG2
                         (LETT #3#
                               (SPADCALL |ci| (SPADCALL (QREFELT $ 25))
                                         (QREFELT $ 50))
                               . #5#)
                         (QCDR #3#)
                       (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                     (QREFELT $ 14))
                    . #5#)
              (LETT |lsnil|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |ffe| NIL . #5#)
                          (LETT #1# (SPADCALL |redSqfr| (QREFELT $ 51)) . #5#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |ffe| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |ffe| (QREFELT $ 30)) #2#)
                                  . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (LETT |lffe| (APPEND |lsnil| |lffe|) . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL |dunit| (SPADCALL |redSqfr| (QREFELT $ 15))
                          (QREFELT $ 19))
                |lffe| (QREFELT $ 39))))))))))))))) 

(DECLAIM (NOTINLINE |UnivariatePolynomialSquareFree;|)) 

(DEFUN |UnivariatePolynomialSquareFree| (&REST #1=#:G219)
  (PROG ()
    (RETURN
     (PROG (#2=#:G220)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|UnivariatePolynomialSquareFree|)
                                           '|domainEqualList|)
                . #3=(|UnivariatePolynomialSquareFree|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |UnivariatePolynomialSquareFree;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|UnivariatePolynomialSquareFree|))))))))))) 

(DEFUN |UnivariatePolynomialSquareFree;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UnivariatePolynomialSquareFree|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|UnivariatePolynomialSquareFree| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 52) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|UnivariatePolynomialSquareFree|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|CharacteristicZero|))
        (QSETREFV $ 12
                  (CONS (|dispatchFunction| |UPSQFREE;squareFreePart;2P;1|)
                        $)))
       ('T
        (QSETREFV $ 12
                  (CONS (|dispatchFunction| |UPSQFREE;squareFreePart;2P;2|)
                        $))))
      (COND
       ((|HasCategory| |#1| '(|FiniteFieldCategory|))
        (QSETREFV $ 30
                  (CONS (|dispatchFunction| |UPSQFREE;BumInSepFFE;2R;3|) $)))
       ((|HasCategory| |#1| '(|CharacteristicNonZero|))
        (QSETREFV $ 30
                  (CONS (|dispatchFunction| |UPSQFREE;BumInSepFFE;2R;4|) $)))
       ('T
        (QSETREFV $ 30
                  (CONS (|dispatchFunction| |UPSQFREE;BumInSepFFE;2R;5|) $))))
      (COND
       ((|HasCategory| |#1| '(|CharacteristicZero|))
        (QSETREFV $ 14
                  (CONS (|dispatchFunction| |UPSQFREE;squareFree;PF;6|) $)))
       ('T
        (QSETREFV $ 14
                  (CONS (|dispatchFunction| |UPSQFREE;squareFree;PF;7|) $))))
      $)))) 

(MAKEPROP '|UnivariatePolynomialSquareFree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |differentiate|) (5 . |gcd|) (|Union| $ '"failed")
              (11 . |exquo|) (17 . |squareFreePart|) (|Factored| 7)
              (22 . |squareFree|) (27 . |unit|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 26)) (|List| 16)
              (32 . |factors|) (37 . *) (43 . |One|) (47 . |charthRoot|)
              (|Mapping| 6 6) (52 . |map|) (|NonNegativeInteger|)
              (58 . |characteristic|) (|Integer|) (62 . *)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 28) (|:| |fctr| 7) (|:| |xpnt| 26))
              (68 . |BumInSepFFE|) (73 . |multiplyExponents|)
              (79 . |charthRoot|) (84 . |degree|) (89 . |Zero|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (93 . |unitNormal|) (98 . |One|) (|List| 29) (102 . |makeFR|)
              (108 . |leadingCoefficient|) (|Boolean|) (113 . ~=) (119 . -)
              (125 . >) (131 . ^) (137 . |exquo|) (143 . |coerce|) (148 . *)
              (154 . ^) (160 . |divideExponents|) (166 . |factorList|))
           '#(|squareFreePart| 171 |squareFree| 176 |BumInSepFFE| 181) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(1 7 0 0 8 2 7 0 0 0 9 2 7 10
                                                   0 0 11 1 0 7 7 12 1 0 13 7
                                                   14 1 13 7 0 15 1 13 17 0 18
                                                   2 7 0 0 0 19 0 7 0 20 1 6 0
                                                   0 21 2 7 0 22 0 23 0 7 24 25
                                                   2 26 0 24 0 27 1 0 29 29 30
                                                   2 7 0 0 24 31 1 7 10 0 32 1
                                                   7 24 0 33 0 6 0 34 1 7 35 0
                                                   36 0 6 0 37 2 13 0 7 38 39 1
                                                   7 6 0 40 2 24 41 0 0 42 2 7
                                                   0 0 0 43 2 24 41 0 0 44 2 6
                                                   0 0 24 45 2 6 10 0 0 46 1 7
                                                   0 6 47 2 7 0 6 0 48 2 7 0 0
                                                   24 49 2 7 10 0 24 50 1 13 38
                                                   0 51 1 0 7 7 12 1 0 13 7 14
                                                   1 0 29 29 30)))))
           '|lookupComplete|)) 
