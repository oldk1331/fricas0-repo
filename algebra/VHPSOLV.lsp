
(SDEFUN |VHPSOLV;power_action|
        ((|m| |NonNegativeInteger|)
         ($ |Mapping| (|Expression| (|Integer|)) (|NonNegativeInteger|)
          (|NonNegativeInteger|)
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
        (SPROG NIL (CONS #'|VHPSOLV;power_action!0| (VECTOR $ |m|)))) 

(SDEFUN |VHPSOLV;power_action!0| ((|k| NIL) (|l| NIL) (|g| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1) . #1=(|VHPSOLV;power_action|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |k| (SPADCALL |m| |l| (QREFELT $ 7)) |g|
                      (QREFELT $ 11)))))) 

(SDEFUN |VHPSOLV;hp_solve;LLNniM;2|
        ((|lv| |List|
          (|Vector| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (|eta| |List| (|NonNegativeInteger|)) (K |NonNegativeInteger|)
         ($ |Matrix|
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
        (SPROG
         ((#1=#:G138 NIL) (|j| NIL) (|i1| #2=(|NonNegativeInteger|))
          (#3=#:G137 NIL) (|i| NIL)
          (|res|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|n1| #2#) (#4=#:G136 NIL) (|n| (|NonNegativeInteger|))
          (|res1|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (C (|List| (|Expression| (|Integer|)))) (#5=#:G135 NIL)
          (#6=#:G134 NIL) (|vd| (|Vector| (|Integer|))) (#7=#:G133 NIL)
          (|ei| NIL) (#8=#:G132 NIL)
          (|lpp|
           (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|pp| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (#9=#:G113 NIL)
          (|pp1| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (#10=#:G131 NIL) (#11=#:G130 NIL) (|v| NIL)
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (LETT |m| (QVSIZE (|SPADfirst| |lv|))
                . #12=(|VHPSOLV;hp_solve;LLNniM;2|))
          (LETT |lpp| NIL . #12#)
          (SEQ (LETT |v| NIL . #12#) (LETT #11# |lv| . #12#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |v| (CAR #11#) . #12#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QVSIZE |v|) |m| (QREFELT $ 13))
                   (|error| "hp_solve: vectors must be of the same length"))
                  ('T
                   (SEQ (LETT |pp| (|spadConstant| $ 14) . #12#)
                        (SEQ (LETT |i| 1 . #12#) (LETT #10# |m| . #12#) G190
                             (COND ((|greater_SI| |i| #10#) (GO G191)))
                             (SEQ
                              (LETT |pp1|
                                    (SPADCALL (SPADCALL |v| |i| (QREFELT $ 17))
                                              |m| (QREFELT $ 18))
                                    . #12#)
                              (EXIT
                               (LETT |pp|
                                     (SPADCALL |pp|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 20)
                                                          (PROG1
                                                              (LETT #9#
                                                                    (- |i| 1)
                                                                    . #12#)
                                                            (|check_subtype2|
                                                             (>= #9# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #9#))
                                                          (QREFELT $ 21))
                                                |pp1| (QREFELT $ 22))
                                               (QREFELT $ 23))
                                     . #12#)))
                             (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |lpp| (CONS |pp| |lpp|) . #12#)))))))
               (LETT #11# (CDR #11#) . #12#) (GO G190) G191 (EXIT NIL))
          (LETT |lpp| (NREVERSE |lpp|) . #12#)
          (LETT |vd|
                (SPADCALL
                 (PROGN
                  (LETT #8# NIL . #12#)
                  (SEQ (LETT |ei| NIL . #12#) (LETT #7# |eta| . #12#) G190
                       (COND
                        ((OR (ATOM #7#)
                             (PROGN (LETT |ei| (CAR #7#) . #12#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #8# (CONS |ei| #8#) . #12#)))
                       (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                       (EXIT (NREVERSE #8#))))
                 (QREFELT $ 26))
                . #12#)
          (LETT C
                (PROGN
                 (LETT #6# NIL . #12#)
                 (SEQ (LETT |i| 1 . #12#) (LETT #5# K . #12#) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (|spadConstant| $ 27) #6#) . #12#)))
                      (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #12#)
          (LETT |res1|
                (SPADCALL C (|VHPSOLV;power_action| |m| $)
                          (SPADCALL |lpp| (QREFELT $ 29)) |vd| K
                          (QREFELT $ 33))
                . #12#)
          (LETT |n| (QVSIZE |vd|) . #12#) (LETT |n1| 0 . #12#)
          (SEQ (LETT |i| 1 . #12#) (LETT #4# |n| . #12#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((>= (SPADCALL |vd| |i| (QREFELT $ 34)) 0)
                   (LETT |n1| (+ |n1| 1) . #12#)))))
               (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191 (EXIT NIL))
          (LETT |res| (MAKE_MATRIX1 |n| |n1| (|spadConstant| $ 14)) . #12#)
          (LETT |i1| 0 . #12#)
          (SEQ (LETT |i| 1 . #12#) (LETT #3# |n| . #12#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((>= (SPADCALL |vd| |i| (QREFELT $ 34)) 0)
                   (SEQ (LETT |i1| (+ |i1| 1) . #12#)
                        (EXIT
                         (SEQ (LETT |j| 1 . #12#) (LETT #1# |n| . #12#) G190
                              (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |res| |j| |i1|
                                          (SPADCALL |res1| |j| |i|
                                                    (QREFELT $ 35))
                                          (QREFELT $ 36))))
                              (LETT |j| (|inc_SI| |j|) . #12#) (GO G190) G191
                              (EXIT NIL))))))))
               (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |VectorHermitePadeSolver;|)) 

(DEFUN |VectorHermitePadeSolver| ()
  (SPROG NIL
         (PROG (#1=#:G140)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|VectorHermitePadeSolver|)
                    . #2=(|VectorHermitePadeSolver|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|VectorHermitePadeSolver|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|VectorHermitePadeSolver;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|VectorHermitePadeSolver|)))))))))) 

(DEFUN |VectorHermitePadeSolver;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|VectorHermitePadeSolver|)
                . #1=(|VectorHermitePadeSolver|))
          (LETT $ (GETREFV 40) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|VectorHermitePadeSolver| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|VectorHermitePadeSolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) (0 . *)
              (|Expression| 15) (|SparseUnivariatePolynomial| 8)
              (|FractionFreeFastGaussian| 8 9) (6 . |DiffAction|) (|Boolean|)
              (13 . ~=) (19 . |Zero|) (|Integer|) (|Vector| 9) (23 . |elt|)
              (29 . |multiplyExponents|) (35 . |One|) (39 . |One|)
              (43 . |monomial|) (49 . *) (55 . +) (|List| 15) (|Vector| 15)
              (61 . |vector|) (66 . |Zero|) (|List| 9) (70 . |vector|)
              (|Matrix| 9) (|List| 8) (|Mapping| 8 6 6 9)
              (75 . |generalInterpolation|) (84 . |elt|) (90 . |elt|)
              (97 . |setelt!|) (|List| 16) (|List| 6)
              |VHPSOLV;hp_solve;LLNniM;2|)
           '#(|hp_solve| 105) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 39
                                                 '(2 6 0 0 0 7 3 10 8 6 6 9 11
                                                   2 6 12 0 0 13 0 9 0 14 2 16
                                                   9 0 15 17 2 9 0 0 6 18 0 9 0
                                                   19 0 8 0 20 2 9 0 8 6 21 2 9
                                                   0 0 0 22 2 9 0 0 0 23 1 25 0
                                                   24 26 0 8 0 27 1 16 0 28 29
                                                   5 10 30 31 32 16 25 6 33 2
                                                   25 15 0 15 34 3 30 9 0 15 15
                                                   35 4 30 9 0 15 15 9 36 3 0
                                                   30 37 38 6 39)))))
           '|lookupComplete|)) 

(MAKEPROP '|VectorHermitePadeSolver| 'NILADIC T) 
