
(SDEFUN |MULTSQFR;nsqfree;SupLLR;1|
        ((|oldf| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |unitPart| P)
          (|:| |suPart|
               (|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| P))
                          (|:| |exponent| (|Integer|)))))))
        (SPROG
         ((#1=#:G160 NIL)
          (|sqlead|
           (|List| (|Record| (|:| |factor| P) (|:| |exponent| (|Integer|)))))
          (|nsqlead|
           (|List| (|Record| (|:| |factor| P) (|:| |exponent| (|Integer|)))))
          (|nff| (P)) (|lcr| (P)) (#2=#:G177 NIL) (|hh1| (P))
          (|h1| (|Union| P #3="failed")) (|unitsq| (P)) (#4=#:G179 NIL)
          (|lpfact| NIL) (|f0| #5=(|SparseUnivariatePolynomial| R))
          (|f| (|SparseUnivariatePolynomial| P))
          (|sqdec|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| P))
                      (|:| |exponent| (|Integer|)))))
          (#6=#:G178 NIL)
          (|h| (|Union| (|SparseUnivariatePolynomial| P) #7="failed"))
          (|r1| (|SparseUnivariatePolynomial| P)) (#8=#:G157 NIL)
          (|result0| (|SparseUnivariatePolynomial| P))
          (|result|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (#9=#:G151 NIL) (|ldeg| (|List| (|NonNegativeInteger|)))
          (#10=#:G149 NIL) (|lcoef| (P))
          (|d0| #11=(|SparseUnivariatePolynomial| R))
          (|d| #12=(|SparseUnivariatePolynomial| P)) (|#G12| #11#)
          (|#G11| #12#)
          (|npol| (|Record| (|:| |pol| #12#) (|:| |polval| #11#)))
          (|g0| #13=(|SparseUnivariatePolynomial| R))
          (|gg|
           (|Record| (|:| |unit| P) (|:| |canonical| P) (|:| |associate| P)))
          (#14=#:G142 NIL)
          (|lfact|
           #15=(|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                          (|:| |exponent| (|Integer|)))))
          (|exp0| (|Integer|)) (|#G10| (|Integer|)) (|#G9| #13#)
          (|pfact|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                     (|:| |exponent| (|Integer|))))
          (|sqlc| (|Factored| P)) (|leadpol| (|Boolean|)) (|lcf| (P))
          (|ctf| (R)) (|lval| #16=(|List| R))
          (|univPol|
           (|Record| (|:| |upol| #5#) (|:| |Lval| #16#) (|:| |Lfact| #15#)
                     (|:| |ctpol| R))))
         (SEQ
          (EXIT
           (SEQ (LETT |f| |oldf| . #17=(|MULTSQFR;nsqfree;SupLLR;1|))
                (LETT |univPol| (SPADCALL |f| |lvar| |ltry| (QREFELT $ 22))
                      . #17#)
                (LETT |f0| (QVELT |univPol| 0) . #17#)
                (EXIT
                 (COND
                  ((SPADCALL |f0| (|spadConstant| $ 24) (QREFELT $ 26))
                   (CONS (|spadConstant| $ 27) (LIST (CONS |f| 1))))
                  ('T
                   (SEQ (LETT |lfact| (QVELT |univPol| 2) . #17#)
                        (LETT |lval| (QVELT |univPol| 1) . #17#)
                        (LETT |ctf| (QVELT |univPol| 3) . #17#)
                        (LETT |leadpol| NIL . #17#) (LETT |sqdec| NIL . #17#)
                        (LETT |exp0| 0 . #17#)
                        (LETT |unitsq| (|spadConstant| $ 27) . #17#)
                        (LETT |lcf| (SPADCALL |f| (QREFELT $ 29)) . #17#)
                        (COND
                         ((SPADCALL |ctf| (|spadConstant| $ 28) (QREFELT $ 30))
                          (SEQ
                           (LETT |f0| (SPADCALL |ctf| |f0| (QREFELT $ 31))
                                 . #17#)
                           (LETT |f|
                                 (SPADCALL (SPADCALL |ctf| (QREFELT $ 32)) |f|
                                           (QREFELT $ 33))
                                 . #17#)
                           (EXIT
                            (LETT |lcf| (SPADCALL |ctf| |lcf| (QREFELT $ 34))
                                  . #17#)))))
                        (LETT |sqlead| NIL . #17#)
                        (LETT |sqlc| (|spadConstant| $ 36) . #17#)
                        (COND
                         ((SPADCALL |lcf| (|spadConstant| $ 27) (QREFELT $ 37))
                          (SEQ (LETT |leadpol| 'T . #17#)
                               (LETT |sqlc| (SPADCALL |lcf| (QREFELT $ 38))
                                     . #17#)
                               (LETT |unitsq|
                                     (SPADCALL |unitsq|
                                               (SPADCALL |sqlc| (QREFELT $ 39))
                                               (QREFELT $ 40))
                                     . #17#)
                               (EXIT
                                (LETT |sqlead| (SPADCALL |sqlc| (QREFELT $ 43))
                                      . #17#)))))
                        (LETT |lfact|
                              (SPADCALL
                               (CONS #'|MULTSQFR;nsqfree;SupLLR;1!0| $) |lfact|
                               (QREFELT $ 47))
                              . #17#)
                        (SEQ G190
                             (COND
                              ((NULL (SPADCALL |lfact| NIL (QREFELT $ 48)))
                               (GO G191)))
                             (SEQ (LETT |pfact| (|SPADfirst| |lfact|) . #17#)
                                  (PROGN
                                   (LETT |#G9| (QCAR |pfact|) . #17#)
                                   (LETT |#G10| (QCDR |pfact|) . #17#)
                                   (LETT |g0| |#G9| . #17#)
                                   (LETT |exp0| |#G10| . #17#))
                                  (LETT |lfact| (CDR |lfact|) . #17#)
                                  (COND
                                   ((SPADCALL |lfact| NIL (QREFELT $ 49))
                                    (COND
                                     ((EQL |exp0| 1)
                                      (EXIT
                                       (SEQ
                                        (LETT |f|
                                              (PROG2
                                                  (LETT #14#
                                                        (SPADCALL |f|
                                                                  (SPADCALL
                                                                   |ctf|
                                                                   (QREFELT $
                                                                            32))
                                                                  (QREFELT $
                                                                           51))
                                                        . #17#)
                                                  (QCDR #14#)
                                                (|check_union2| (QEQCAR #14# 0)
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT $ 9))
                                                                (|Union|
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT $
                                                                           9))
                                                                 "failed")
                                                                #14#))
                                              . #17#)
                                        (LETT |gg|
                                              (SPADCALL
                                               (SPADCALL |f| (QREFELT $ 29))
                                               (QREFELT $ 53))
                                              . #17#)
                                        (LETT |sqdec|
                                              (CONS
                                               (CONS
                                                (SPADCALL (QVELT |gg| 2) |f|
                                                          (QREFELT $ 33))
                                                |exp0|)
                                               |sqdec|)
                                              . #17#)
                                        (EXIT
                                         (PROGN
                                          (LETT #6#
                                                (CONS (QVELT |gg| 0) |sqdec|)
                                                . #17#)
                                          (GO #18=#:G176)))))))))
                                  (COND
                                   ((SPADCALL |ctf| (|spadConstant| $ 28)
                                              (QREFELT $ 30))
                                    (LETT |g0|
                                          (SPADCALL |ctf| |g0| (QREFELT $ 31))
                                          . #17#)))
                                  (LETT |npol|
                                        (SPADCALL |f| |f0| |exp0|
                                                  (QREFELT $ 55))
                                        . #17#)
                                  (PROGN
                                   (LETT |#G11| (QCAR |npol|) . #17#)
                                   (LETT |#G12| (QCDR |npol|) . #17#)
                                   (LETT |d| |#G11| . #17#)
                                   (LETT |d0| |#G12| . #17#))
                                  (COND
                                   (|leadpol|
                                    (LETT |lcoef|
                                          (SPADCALL |exp0| |unitsq| |sqlead|
                                                    (QREFELT $ 56))
                                          . #17#))
                                   ('T
                                    (LETT |lcoef| (|spadConstant| $ 27)
                                          . #17#)))
                                  (LETT |ldeg|
                                        (SPADCALL |f| |lvar|
                                                  (PROG1
                                                      (LETT #10# |exp0| . #17#)
                                                    (|check_subtype2|
                                                     (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#))
                                                  (QREFELT $ 59))
                                        . #17#)
                                  (LETT |result|
                                        (SPADCALL |d| |g0|
                                                  (PROG2
                                                      (LETT #9#
                                                            (SPADCALL |d0| |g0|
                                                                      (QREFELT
                                                                       $ 60))
                                                            . #17#)
                                                      (QCDR #9#)
                                                    (|check_union2|
                                                     (QEQCAR #9# 0)
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 8))
                                                     (|Union|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 8))
                                                      #7#)
                                                     #9#))
                                                  |lcoef| |lvar| |ldeg| |lval|
                                                  (QREFELT $ 63))
                                        . #17#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |result| 1)
                                     (PROGN
                                      (LETT #6#
                                            (SPADCALL |oldf| |lvar| |ltry|
                                                      (QREFELT $ 66))
                                            . #17#)
                                      (GO #18#)))
                                    ('T
                                     (SEQ
                                      (LETT |result0|
                                            (SPADCALL (QCDR |result|) 1
                                                      (QREFELT $ 68))
                                            . #17#)
                                      (LETT |r1|
                                            (SPADCALL |result0|
                                                      (PROG1
                                                          (LETT #8# |exp0|
                                                                . #17#)
                                                        (|check_subtype2|
                                                         (>= #8# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #8#))
                                                      (QREFELT $ 69))
                                            . #17#)
                                      (SEQ
                                       (LETT |h|
                                             (SPADCALL |f| |r1| (QREFELT $ 70))
                                             . #17#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |h| 1)
                                          (PROGN
                                           (LETT #6#
                                                 (SPADCALL |oldf| |lvar| NIL
                                                           (QREFELT $ 66))
                                                 . #17#)
                                           (GO #18#))))))
                                      (LETT |sqdec|
                                            (CONS (CONS |result0| |exp0|)
                                                  |sqdec|)
                                            . #17#)
                                      (LETT |f| (QCDR |h|) . #17#)
                                      (LETT |f0|
                                            (SPADCALL (QCDR |h|) |lvar| |lval|
                                                      (QREFELT $ 72))
                                            . #17#)
                                      (LETT |lcr|
                                            (SPADCALL |result0| (QREFELT $ 29))
                                            . #17#)
                                      (LETT |nsqlead| |sqlead| . #17#)
                                      (SEQ (LETT |lpfact| NIL . #17#)
                                           (LETT #4# |sqlead| . #17#) G190
                                           (COND
                                            ((OR (ATOM #4#)
                                                 (PROGN
                                                  (LETT |lpfact| (CAR #4#)
                                                        . #17#)
                                                  NIL)
                                                 (NULL
                                                  (SPADCALL |lcr|
                                                            (|spadConstant| $
                                                                            27)
                                                            (QREFELT $ 37))))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((SPADCALL |lcr| (QREFELT $ 73))
                                               (SEQ
                                                (LETT |unitsq|
                                                      (PROG2
                                                          (LETT #1#
                                                                (SPADCALL
                                                                 |unitsq| |lcr|
                                                                 (QREFELT $
                                                                          74))
                                                                . #17#)
                                                          (QCDR #1#)
                                                        (|check_union2|
                                                         (QEQCAR #1# 0)
                                                         (QREFELT $ 9)
                                                         (|Union| (QREFELT $ 9)
                                                                  #3#)
                                                         #1#))
                                                      . #17#)
                                                (EXIT
                                                 (LETT |lcr|
                                                       (|spadConstant| $ 27)
                                                       . #17#))))
                                              ('T
                                               (SEQ
                                                (EXIT
                                                 (SEQ G190 NIL
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((< (QCDR |lpfact|)
                                                             |exp0|)
                                                          (PROGN
                                                           (LETT #2# |$NoValue|
                                                                 . #17#)
                                                           (GO #19=#:G168)))
                                                         ('T
                                                          (SEQ
                                                           (LETT |h1|
                                                                 (SPADCALL
                                                                  |lcr|
                                                                  (QCAR
                                                                   |lpfact|)
                                                                  (QREFELT $
                                                                           74))
                                                                 . #17#)
                                                           (EXIT
                                                            (COND
                                                             ((QEQCAR |h1| 0)
                                                              (SEQ
                                                               (LETT |lcr|
                                                                     (QCDR
                                                                      |h1|)
                                                                     . #17#)
                                                               (EXIT
                                                                (PROGN
                                                                 (RPLACD
                                                                  |lpfact|
                                                                  (-
                                                                   (QCDR
                                                                    |lpfact|)
                                                                   |exp0|))
                                                                 (QCDR
                                                                  |lpfact|)))))
                                                             ('T
                                                              (SEQ
                                                               (LETT |hh1|
                                                                     (SPADCALL
                                                                      |lcr|
                                                                      (QCAR
                                                                       |lpfact|)
                                                                      (QREFELT
                                                                       $ 75))
                                                                     . #17#)
                                                               (EXIT
                                                                (COND
                                                                 ((SPADCALL
                                                                   |hh1|
                                                                   (|spadConstant|
                                                                    $ 27)
                                                                   (QREFELT $
                                                                            76))
                                                                  (PROGN
                                                                   (LETT #2#
                                                                         |$NoValue|
                                                                         . #17#)
                                                                   (GO #19#)))
                                                                 ('T
                                                                  (SEQ
                                                                   (LETT |lcr|
                                                                         (PROG2
                                                                             (LETT
                                                                              #1#
                                                                              (SPADCALL
                                                                               |lcr|
                                                                               |hh1|
                                                                               (QREFELT
                                                                                $
                                                                                74))
                                                                              . #17#)
                                                                             (QCDR
                                                                              #1#)
                                                                           (|check_union2|
                                                                            (QEQCAR
                                                                             #1#
                                                                             0)
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            (|Union|
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             #3#)
                                                                            #1#))
                                                                         . #17#)
                                                                   (LETT |nff|
                                                                         (PROG2
                                                                             (LETT
                                                                              #1#
                                                                              (SPADCALL
                                                                               (QCAR
                                                                                |lpfact|)
                                                                               |hh1|
                                                                               (QREFELT
                                                                                $
                                                                                74))
                                                                              . #17#)
                                                                             (QCDR
                                                                              #1#)
                                                                           (|check_union2|
                                                                            (QEQCAR
                                                                             #1#
                                                                             0)
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            (|Union|
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             #3#)
                                                                            #1#))
                                                                         . #17#)
                                                                   (LETT
                                                                    |nsqlead|
                                                                    (CONS
                                                                     (CONS
                                                                      |nff|
                                                                      (QCDR
                                                                       |lpfact|))
                                                                     |nsqlead|)
                                                                    . #17#)
                                                                   (PROGN
                                                                    (RPLACA
                                                                     |lpfact|
                                                                     |hh1|)
                                                                    (QCAR
                                                                     |lpfact|))
                                                                   (EXIT
                                                                    (PROGN
                                                                     (RPLACD
                                                                      |lpfact|
                                                                      (-
                                                                       (QCDR
                                                                        |lpfact|)
                                                                       |exp0|))
                                                                     (QCDR
                                                                      |lpfact|))))))))))))))))
                                                      NIL (GO G190) G191
                                                      (EXIT NIL)))
                                                #19# (EXIT #2#))))))
                                           (LETT #4# (CDR #4#) . #17#)
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (LETT |sqlead| |nsqlead| . #17#)))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (CONS
                          (PROG2
                              (LETT #1#
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 79))
                                              |ctf| (QREFELT $ 80))
                                    . #17#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                            (|Union| (QREFELT $ 9) #3#) #1#))
                          |sqdec|))))))))
          #18# (EXIT #6#)))) 

(SDEFUN |MULTSQFR;nsqfree;SupLLR;1!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCDR |z1|) (QCDR |z2|) (QREFELT $ 44))) 

(SDEFUN |MULTSQFR;squareFree;SupF;2|
        ((|f| |SparseUnivariatePolynomial| P)
         ($ |Factored| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|lfs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| P))
                      (|:| |exponent| (|Integer|)))))
          (#1=#:G217 NIL) (|fu| #2=(|Factored| P)) (#3=#:G216 NIL)
          (|partSq|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|Integer|)))))))
          (#4=#:G215 NIL) (|ff| NIL) (#5=#:G214 NIL) (|lcSq| #2#)
          (#6=#:G199 NIL) (|lcf| (P)) (#7=#:G213 NIL) (#8=#:G212 NIL)
          (|usqfr| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|upol| (|SparseUnivariatePolynomial| R)) (|lvar| #9=(|List| OV))
          (#10=#:G190 NIL) (#11=#:G189 #9#) (#12=#:G191 #9#) (#13=#:G211 NIL)
          (|cf| NIL) (#14=#:G210 NIL) (#15=#:G209 NIL))
         (SEQ
          (COND
           ((EQL (SPADCALL |f| (QREFELT $ 81)) 0)
            (SEQ
             (LETT |fu| (SPADCALL (SPADCALL |f| (QREFELT $ 79)) (QREFELT $ 38))
                   . #16=(|MULTSQFR;squareFree;SupF;2|))
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |fu| (QREFELT $ 39)) (QREFELT $ 82))
               (PROGN
                (LETT #15# NIL . #16#)
                (SEQ (LETT |ff| NIL . #16#)
                     (LETT #14# (SPADCALL |fu| (QREFELT $ 86)) . #16#) G190
                     (COND
                      ((OR (ATOM #14#)
                           (PROGN (LETT |ff| (CAR #14#) . #16#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #15#
                             (CONS
                              (VECTOR (CONS 1 "sqfr")
                                      (SPADCALL (QVELT |ff| 1) (QREFELT $ 82))
                                      (QVELT |ff| 2))
                              #15#)
                             . #16#)))
                     (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                     (EXIT (NREVERSE #15#))))
               (QREFELT $ 90)))))
           (#17='T
            (SEQ
             (LETT |lvar|
                   (PROGN
                    (LETT #10# NIL . #16#)
                    (SEQ (LETT |cf| NIL . #16#)
                         (LETT #13# (SPADCALL |f| (QREFELT $ 92)) . #16#) G190
                         (COND
                          ((OR (ATOM #13#)
                               (PROGN (LETT |cf| (CAR #13#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #12# (SPADCALL |cf| (QREFELT $ 93)) . #16#)
                            (COND
                             (#10#
                              (LETT #11# (SPADCALL #11# #12# (QREFELT $ 94))
                                    . #16#))
                             ('T
                              (PROGN
                               (LETT #11# #12# . #16#)
                               (LETT #10# 'T . #16#)))))))
                         (LETT #13# (CDR #13#) . #16#) (GO G190) G191
                         (EXIT NIL))
                    (COND (#10# #11#) (#17# (|IdentityError| '|setUnion|))))
                   . #16#)
             (EXIT
              (COND
               ((NULL |lvar|)
                (SEQ
                 (LETT |upol| (SPADCALL (ELT $ 95) |f| (QREFELT $ 98)) . #16#)
                 (LETT |usqfr| (SPADCALL |upol| (QREFELT $ 100)) . #16#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (ELT $ 32) (SPADCALL |usqfr| (QREFELT $ 102))
                             (QREFELT $ 105))
                   (PROGN
                    (LETT #8# NIL . #16#)
                    (SEQ (LETT |ff| NIL . #16#)
                         (LETT #7# (SPADCALL |usqfr| (QREFELT $ 108)) . #16#)
                         G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |ff| (CAR #7#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #8#
                                 (CONS
                                  (VECTOR (CONS 1 "sqfr")
                                          (SPADCALL (ELT $ 32) (QVELT |ff| 1)
                                                    (QREFELT $ 105))
                                          (QVELT |ff| 2))
                                  #8#)
                                 . #16#)))
                         (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                         (EXIT (NREVERSE #8#))))
                   (QREFELT $ 90)))))
               (#17#
                (SEQ (LETT |lcf| (SPADCALL |f| (QREFELT $ 109)) . #16#)
                     (LETT |f|
                           (PROG2
                               (LETT #6# (SPADCALL |f| |lcf| (QREFELT $ 51))
                                     . #16#)
                               (QCDR #6#)
                             (|check_union2| (QEQCAR #6# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 9))
                                             (|Union|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              "failed")
                                             #6#))
                           . #16#)
                     (LETT |lcSq| (SPADCALL |lcf| (QREFELT $ 38)) . #16#)
                     (LETT |lfs|
                           (PROGN
                            (LETT #5# NIL . #16#)
                            (SEQ (LETT |ff| NIL . #16#)
                                 (LETT #4# (SPADCALL |lcSq| (QREFELT $ 86))
                                       . #16#)
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN
                                        (LETT |ff| (CAR #4#) . #16#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #5#
                                         (CONS
                                          (VECTOR (CONS 1 "sqfr")
                                                  (SPADCALL (QVELT |ff| 1)
                                                            (QREFELT $ 82))
                                                  (QVELT |ff| 2))
                                          #5#)
                                         . #16#)))
                                 (LETT #4# (CDR #4#) . #16#) (GO G190) G191
                                 (EXIT (NREVERSE #5#))))
                           . #16#)
                     (LETT |partSq| (SPADCALL |f| |lvar| NIL (QREFELT $ 66))
                           . #16#)
                     (LETT |lfs|
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL . #16#)
                             (SEQ (LETT |fu| NIL . #16#)
                                  (LETT #1# (QCDR |partSq|) . #16#) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN
                                         (LETT |fu| (CAR #1#) . #16#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (VECTOR (CONS 1 "sqfr") (QCAR |fu|)
                                                   (QCDR |fu|))
                                           #3#)
                                          . #16#)))
                                  (LETT #1# (CDR #1#) . #16#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            |lfs| (QREFELT $ 110))
                           . #16#)
                     (EXIT
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |lcSq| (QREFELT $ 39))
                                  (QCAR |partSq|) (QREFELT $ 40))
                        (QREFELT $ 82))
                       |lfs| (QREFELT $ 90))))))))))))) 

(SDEFUN |MULTSQFR;squareFree;PF;3| ((|f| P) ($ |Factored| P))
        (SPROG
         ((|sqlead| (|Factored| P))
          (|result1|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P) (|:| |exponent| (|Integer|)))))
          (|nsqff|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P) (|:| |exponent| (|Integer|)))))
          (#1=#:G254 NIL) (|fu| NIL) (#2=#:G253 NIL)
          (|nsqfftot|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|Integer|)))))))
          (#3=#:G239 NIL) (|lcont| (P)) (|f0| (|SparseUnivariatePolynomial| P))
          (|lvar| (|List| OV)) (|x| (OV)) (|i| (|Integer|)) (#4=#:G252 NIL)
          (|j| NIL) (|m| #5=(|NonNegativeInteger|)) (#6=#:G235 NIL)
          (#7=#:G234 #5#) (#8=#:G236 #5#) (#9=#:G251 NIL) (|ldeg| (|List| #5#))
          (|result| (|Factored| P)) (#10=#:G249 NIL) (#11=#:G228 NIL) (|p| (P))
          (|y| (OV)) (|n| (|NonNegativeInteger|)) (#12=#:G250 NIL) (|im| NIL)
          (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |f| (QREFELT $ 73)) (SPADCALL |f| NIL (QREFELT $ 112)))
            (#13='T
             (SEQ
              (LETT |lvar| (SPADCALL |f| (QREFELT $ 93))
                    . #14=(|MULTSQFR;squareFree;PF;3|))
              (LETT |result1| NIL . #14#)
              (LETT |lmdeg| (SPADCALL |f| |lvar| (QREFELT $ 113)) . #14#)
              (LETT |p| (|spadConstant| $ 27) . #14#)
              (SEQ (LETT |im| 1 . #14#) (LETT #12# (LENGTH |lvar|) . #14#) G190
                   (COND ((|greater_SI| |im| #12#) (GO G191)))
                   (SEQ
                    (LETT |n| (SPADCALL |lmdeg| |im| (QREFELT $ 114)) . #14#)
                    (EXIT
                     (COND ((EQL |n| 0) "next im")
                           ('T
                            (SEQ
                             (LETT |y| (SPADCALL |lvar| |im| (QREFELT $ 117))
                                   . #14#)
                             (LETT |p|
                                   (SPADCALL |p|
                                             (SPADCALL (|spadConstant| $ 27)
                                                       |y| |n| (QREFELT $ 118))
                                             (QREFELT $ 40))
                                   . #14#)
                             (EXIT
                              (LETT |result1|
                                    (CONS
                                     (VECTOR (CONS 1 "sqfr")
                                             (SPADCALL |y| (QREFELT $ 119))
                                             |n|)
                                     |result1|)
                                    . #14#)))))))
                   (LETT |im| (|inc_SI| |im|) . #14#) (GO G190) G191
                   (EXIT NIL))
              (COND
               ((SPADCALL |p| (|spadConstant| $ 27) (QREFELT $ 37))
                (SEQ
                 (LETT |f|
                       (PROG2
                           (LETT #11# (SPADCALL |f| |p| (QREFELT $ 74)) . #14#)
                           (QCDR #11#)
                         (|check_union2| (QEQCAR #11# 0) (QREFELT $ 9)
                                         (|Union| (QREFELT $ 9) "failed")
                                         #11#))
                       . #14#)
                 (COND
                  ((SPADCALL |f| (QREFELT $ 73))
                   (PROGN
                    (LETT #10# (SPADCALL |f| |result1| (QREFELT $ 112)) . #14#)
                    (GO #15=#:G248))))
                 (EXIT (LETT |lvar| (SPADCALL |f| (QREFELT $ 93)) . #14#)))))
              (EXIT
               (COND
                ((EQL (LENGTH |lvar|) 1)
                 (SEQ
                  (LETT |result|
                        (SPADCALL |f| (|SPADfirst| |lvar|) (QREFELT $ 120))
                        . #14#)
                  (EXIT
                   (SPADCALL (SPADCALL |result| (QREFELT $ 39))
                             (SPADCALL |result1|
                                       (SPADCALL |result| (QREFELT $ 86))
                                       (QREFELT $ 121))
                             (QREFELT $ 112)))))
                (#13#
                 (SEQ
                  (LETT |ldeg| (SPADCALL |f| |lvar| (QREFELT $ 122)) . #14#)
                  (LETT |m|
                        (PROGN
                         (LETT #6# NIL . #14#)
                         (SEQ (LETT |j| NIL . #14#) (LETT #9# |ldeg| . #14#)
                              G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |j| (CAR #9#) . #14#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |j| 0 (QREFELT $ 123))
                                  (PROGN
                                   (LETT #8# |j| . #14#)
                                   (COND (#6# (LETT #7# (MIN #7# #8#) . #14#))
                                         ('T
                                          (PROGN
                                           (LETT #7# #8# . #14#)
                                           (LETT #6# 'T . #14#)))))))))
                              (LETT #9# (CDR #9#) . #14#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#6# #7#) (#13# (|IdentityError| '|min|))))
                        . #14#)
                  (LETT |i| 1 . #14#)
                  (SEQ (LETT |j| NIL . #14#) (LETT #4# |ldeg| . #14#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #14#) NIL)
                             (NULL (SPADCALL |j| |m| (QREFELT $ 124))))
                         (GO G191)))
                       (SEQ (EXIT (LETT |i| (+ |i| 1) . #14#)))
                       (LETT #4# (CDR #4#) . #14#) (GO G190) G191 (EXIT NIL))
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 117)) . #14#)
                  (LETT |lvar| (SPADCALL |lvar| |i| (QREFELT $ 125)) . #14#)
                  (LETT |f0| (SPADCALL |f| |x| (QREFELT $ 127)) . #14#)
                  (LETT |lcont| (SPADCALL |f0| (QREFELT $ 109)) . #14#)
                  (LETT |nsqfftot|
                        (SPADCALL
                         (PROG2
                             (LETT #3# (SPADCALL |f0| |lcont| (QREFELT $ 51))
                                   . #14#)
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 0)
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 9))
                                           (|Union|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 9))
                                            "failed")
                                           #3#))
                         |lvar| NIL (QREFELT $ 66))
                        . #14#)
                  (LETT |nsqff|
                        (PROGN
                         (LETT #2# NIL . #14#)
                         (SEQ (LETT |fu| NIL . #14#)
                              (LETT #1# (QCDR |nsqfftot|) . #14#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |fu| (CAR #1#) . #14#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (VECTOR (CONS 1 "sqfr")
                                               (SPADCALL (QCAR |fu|) |x|
                                                         (QREFELT $ 128))
                                               (QCDR |fu|))
                                       #2#)
                                      . #14#)))
                              (LETT #1# (CDR #1#) . #14#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #14#)
                  (LETT |result1| (SPADCALL |result1| |nsqff| (QREFELT $ 121))
                        . #14#)
                  (EXIT
                   (COND
                    ((SPADCALL |lcont| (QREFELT $ 73))
                     (SPADCALL
                      (SPADCALL |lcont| (QCAR |nsqfftot|) (QREFELT $ 40))
                      |result1| (QREFELT $ 112)))
                    (#13#
                     (SEQ
                      (LETT |sqlead| (SPADCALL |lcont| (QREFELT $ 38)) . #14#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |sqlead| (QREFELT $ 39))
                                  (QCAR |nsqfftot|) (QREFELT $ 40))
                        (SPADCALL |result1| (SPADCALL |sqlead| (QREFELT $ 86))
                                  (QREFELT $ 121))
                        (QREFELT $ 112)))))))))))))))
          #15# (EXIT #10#)))) 

(SDEFUN |MULTSQFR;intChoose;SupLLR;4|
        ((|f| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
          (|:| |Lval| (|List| R))
          (|:| |Lfact|
               (|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                          (|:| |exponent| (|Integer|)))))
          (|:| |ctpol| R)))
        (SPROG
         ((|d1| #1=(|Integer|)) (|lval1| (|List| R)) (|ctf1| (R))
          (|lfact1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|Integer|)))))
          (|f1| (|SparseUnivariatePolynomial| R))
          (|try_n| (|NonNegativeInteger|)) (#2=#:G272 NIL) (|d0| #1#)
          (|lfact|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|Integer|)))))
          (#3=#:G259 NIL) (|ctf| (R)) (|f0| (|SparseUnivariatePolynomial| R))
          (|lval| (|List| R)) (#4=#:G274 NIL) (|i| NIL) (#5=#:G273 NIL)
          (|range| (|Integer|)) (|nvr| (|NonNegativeInteger|))
          (|degf| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |degf| (SPADCALL |f| (QREFELT $ 81))
                  . #6=(|MULTSQFR;intChoose;SupLLR;4|))
            (LETT |try_n| 0 . #6#) (LETT |nvr| (LENGTH |lvar|) . #6#)
            (LETT |range| 10 . #6#) (LETT |lfact1| NIL . #6#)
            (LETT |lval1| NIL . #6#) (LETT |ctf1| (|spadConstant| $ 28) . #6#)
            (LETT |f1| (|spadConstant| $ 24) . #6#)
            (EXIT
             (SEQ G190 (COND ((NULL (< |range| 10000000000)) (GO G191)))
                  (SEQ
                   (LETT |range| (SPADCALL 2 |range| (QREFELT $ 129)) . #6#)
                   (LETT |lval|
                         (PROGN
                          (LETT #5# NIL . #6#)
                          (SEQ (LETT |i| 1 . #6#) (LETT #4# |nvr| . #6#) G190
                               (COND ((|greater_SI| |i| #4#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #5#
                                       (CONS (SPADCALL |range| (QREFELT $ 130))
                                             #5#)
                                       . #6#)))
                               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                               (EXIT (NREVERSE #5#))))
                         . #6#)
                   (EXIT
                    (COND
                     ((SPADCALL |lval| |ltry| (QREFELT $ 131)) "new integer")
                     ('T
                      (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #6#)
                           (LETT |f0|
                                 (SPADCALL |f| |lvar| |lval| (QREFELT $ 72))
                                 . #6#)
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |f0| (QREFELT $ 132)) |degf|
                                        (QREFELT $ 123))
                              "new integer")
                             ('T
                              (SEQ
                               (LETT |ctf| (SPADCALL |f0| (QREFELT $ 133))
                                     . #6#)
                               (LETT |lfact|
                                     (SPADCALL
                                      (SPADCALL
                                       (PROG2
                                           (LETT #3#
                                                 (SPADCALL |f0|
                                                           (SPADCALL |ctf|
                                                                     (QREFELT $
                                                                              134))
                                                           (QREFELT $ 60))
                                                 . #6#)
                                           (QCDR #3#)
                                         (|check_union2| (QEQCAR #3# 0)
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 8))
                                                         (|Union|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 8))
                                                          "failed")
                                                         #3#))
                                       (QREFELT $ 100))
                                      (QREFELT $ 135))
                                     . #6#)
                               (COND
                                ((EQL (LENGTH |lfact|) 1)
                                 (COND
                                  ((EQL
                                    (QCDR (SPADCALL |lfact| 1 (QREFELT $ 136)))
                                    1)
                                   (PROGN
                                    (LETT #2#
                                          (VECTOR (|spadConstant| $ 24) |lval|
                                                  |lfact|
                                                  (|spadConstant| $ 28))
                                          . #6#)
                                    (GO #7=#:G271))))))
                               (LETT |d0| (SPADCALL |lfact| (QREFELT $ 137))
                                     . #6#)
                               (EXIT
                                (COND
                                 ((EQL |try_n| 0)
                                  (SEQ (LETT |f1| |f0| . #6#)
                                       (LETT |lfact1| |lfact| . #6#)
                                       (LETT |ctf1| |ctf| . #6#)
                                       (LETT |lval1| |lval| . #6#)
                                       (LETT |d1| |d0| . #6#)
                                       (EXIT (LETT |try_n| 1 . #6#))))
                                 ((EQL |d0| |d1|)
                                  (PROGN
                                   (LETT #2#
                                         (VECTOR |f1| |lval1| |lfact1| |ctf1|)
                                         . #6#)
                                   (GO #7#)))
                                 ((< |d0| |d1|)
                                  (SEQ (LETT |try_n| 1 . #6#)
                                       (LETT |f1| |f0| . #6#)
                                       (LETT |lfact1| |lfact| . #6#)
                                       (LETT |ctf1| |ctf| . #6#)
                                       (LETT |lval1| |lval| . #6#)
                                       (EXIT
                                        (LETT |d1| |d0| . #6#)))))))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #2#)))) 

(SDEFUN |MULTSQFR;coefChoose;IPLP;5|
        ((|exp| |Integer|) (|unitsq| P)
         (|sqlead| |List|
          (|Record| (|:| |factor| P) (|:| |exponent| (|Integer|))))
         ($ P))
        (SPROG
         ((|lcoef| (P)) (#1=#:G277 NIL) (|texp| (|Integer|)) (#2=#:G282 NIL)
          (|term| NIL))
         (SEQ (LETT |lcoef| |unitsq| . #3=(|MULTSQFR;coefChoose;IPLP;5|))
              (SEQ (LETT |term| NIL . #3#) (LETT #2# |sqlead| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |texp| (QCDR |term|) . #3#)
                        (EXIT
                         (COND ((< |texp| |exp|) "next term")
                               ((EQL |texp| |exp|)
                                (LETT |lcoef|
                                      (SPADCALL |lcoef| (QCAR |term|)
                                                (QREFELT $ 40))
                                      . #3#))
                               ('T
                                (LETT |lcoef|
                                      (SPADCALL |lcoef|
                                                (SPADCALL (QCAR |term|)
                                                          (PROG1
                                                              (LETT #1#
                                                                    (QUOTIENT2
                                                                     |texp|
                                                                     |exp|)
                                                                    . #3#)
                                                            (|check_subtype2|
                                                             (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                                          (QREFELT $ 138))
                                                (QREFELT $ 40))
                                      . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |lcoef|)))) 

(SDEFUN |MULTSQFR;consnewpol;SupSupIR;6|
        ((|g| |SparseUnivariatePolynomial| P)
         (|g0| |SparseUnivariatePolynomial| R) (|deg| |Integer|)
         ($ |Record| (|:| |pol| (|SparseUnivariatePolynomial| P))
          (|:| |polval| (|SparseUnivariatePolynomial| R))))
        (SEQ
         (COND ((EQL |deg| 1) (CONS |g| |g0|))
               ('T
                (SEQ (LETT |deg| (- |deg| 1) |MULTSQFR;consnewpol;SupSupIR;6|)
                     (EXIT
                      (CONS (SPADCALL |g| |deg| (QREFELT $ 139))
                            (SPADCALL |g0| |deg| (QREFELT $ 140))))))))) 

(SDEFUN |MULTSQFR;lift;Sup2SupPLLLU;7|
        ((|ud| |SparseUnivariatePolynomial| P)
         (|g0| |SparseUnivariatePolynomial| R)
         (|g1| |SparseUnivariatePolynomial| R) (|lcoef| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lval| |List| R)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG
         ((|p1| #1=(|SparseUnivariatePolynomial| P)) (|p0| #1#) (|#G60| #1#)
          (|#G59| #1#) (|#G58| #1#) (|#G57| #1#)
          (|plist|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|leadlist| (|List| P)) (|lcg0| (R)) (|leadpol| (|Boolean|))
          (|lcd| (P)))
         (SEQ (LETT |leadpol| NIL . #2=(|MULTSQFR;lift;Sup2SupPLLLU;7|))
              (LETT |lcd| (SPADCALL |ud| (QREFELT $ 29)) . #2#)
              (LETT |leadlist| NIL . #2#)
              (COND
               ((NULL (SPADCALL (SPADCALL |ud| (QREFELT $ 29)) (QREFELT $ 73)))
                (SEQ (LETT |leadpol| 'T . #2#)
                     (LETT |ud| (SPADCALL |lcoef| |ud| (QREFELT $ 33)) . #2#)
                     (LETT |lcg0| (SPADCALL |g0| (QREFELT $ 141)) . #2#)
                     (COND
                      ((SPADCALL |lcoef| (QREFELT $ 73))
                       (LETT |g0|
                             (SPADCALL
                              (SPADCALL (SPADCALL |lcoef| (QREFELT $ 142))
                                        |lcg0| (QREFELT $ 143))
                              |g0| (QREFELT $ 31))
                             . #2#))
                      (#3='T
                       (LETT |g0|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |lcoef| |lvar| |lval|
                                          (QREFELT $ 144))
                                (QREFELT $ 142))
                               |lcg0| (QREFELT $ 143))
                              |g0| (QREFELT $ 31))
                             . #2#)))
                     (LETT |g1| (SPADCALL |lcg0| |g1| (QREFELT $ 31)) . #2#)
                     (EXIT (LETT |leadlist| (LIST |lcoef| |lcd|) . #2#)))))
              (LETT |plist|
                    (SPADCALL |ud| |lvar| (LIST |g0| |g1|) |lval| |leadlist|
                              |ldeg| (QREFELT $ 16) (QREFELT $ 147))
                    . #2#)
              (EXIT
               (COND ((QEQCAR |plist| 1) (CONS 1 "failed"))
                     (#3#
                      (SEQ
                       (PROGN
                        (LETT |#G57| (SPADCALL (QCDR |plist|) 1 (QREFELT $ 68))
                              . #2#)
                        (LETT |#G58| (SPADCALL (QCDR |plist|) 2 (QREFELT $ 68))
                              . #2#)
                        (LETT |p0| |#G57| . #2#)
                        (LETT |p1| |#G58| . #2#))
                       (COND
                        ((SPADCALL (SPADCALL |p0| |lvar| |lval| (QREFELT $ 72))
                                   |g0| (QREFELT $ 148))
                         (PROGN
                          (LETT |#G59| |p1| . #2#)
                          (LETT |#G60| |p0| . #2#)
                          (LETT |p0| |#G59| . #2#)
                          (LETT |p1| |#G60| . #2#))))
                       (EXIT
                        (CONS 0
                              (LIST (SPADCALL |p0| (QREFELT $ 149))
                                    (SPADCALL |p1| (QREFELT $ 149)))))))))))) 

(SDEFUN |MULTSQFR;univcase;POVF;8| ((|f| P) (|x| OV) ($ |Factored| P))
        (SPROG
         ((#1=#:G315 NIL) (|term| NIL) (#2=#:G314 NIL)
          (|result| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|uf| (|SparseUnivariatePolynomial| R)) (#3=#:G302 NIL) (|cf| (R)))
         (SEQ
          (LETT |uf| (SPADCALL |f| (QREFELT $ 150))
                . #4=(|MULTSQFR;univcase;POVF;8|))
          (LETT |cf| (SPADCALL |uf| (QREFELT $ 133)) . #4#)
          (LETT |uf|
                (PROG2 (LETT #3# (SPADCALL |uf| |cf| (QREFELT $ 151)) . #4#)
                    (QCDR #3#)
                  (|check_union2| (QEQCAR #3# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                   "failed")
                                  #3#))
                . #4#)
          (LETT |result| (SPADCALL |uf| (QREFELT $ 100)) . #4#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL |cf| (SPADCALL |result| (QREFELT $ 102)) (QREFELT $ 31))
             |x| (QREFELT $ 152))
            (PROGN
             (LETT #2# NIL . #4#)
             (SEQ (LETT |term| NIL . #4#)
                  (LETT #1# (SPADCALL |result| (QREFELT $ 135)) . #4#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (VECTOR (CONS 1 "sqfr")
                                   (SPADCALL (QCAR |term|) |x| (QREFELT $ 152))
                                   (QCDR |term|))
                           #2#)
                          . #4#)))
                  (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 112)))))) 

(SDEFUN |MULTSQFR;compdegd;LI;9|
        ((|lfact| |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                    (|:| |exponent| (|Integer|))))
         ($ |Integer|))
        (SPROG ((|ris| (|Integer|)) (#1=#:G320 NIL) (|pfact| NIL))
               (SEQ (LETT |ris| 0 . #2=(|MULTSQFR;compdegd;LI;9|))
                    (SEQ (LETT |pfact| NIL . #2#) (LETT #1# |lfact| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |pfact| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ris|
                                 (+ |ris|
                                    (* (- (QCDR |pfact|) 1)
                                       (SPADCALL (QCAR |pfact|)
                                                 (QREFELT $ 132))))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ris|)))) 

(SDEFUN |MULTSQFR;normDeriv2;SupISup;10|
        ((|f| |SparseUnivariatePolynomial| R) (|m| |Integer|)
         ($ |SparseUnivariatePolynomial| R))
        (SPROG
         ((|n| #1=(|Integer|)) (|ris| (|SparseUnivariatePolynomial| R))
          (#2=#:G323 NIL) (|n1| #1#) (|k| (|Integer|))
          (|#G1| (|NonNegativeInteger|)))
         (SEQ
          (LETT |#G1| (SPADCALL |f| (QREFELT $ 132))
                . #3=(|MULTSQFR;normDeriv2;SupISup;10|))
          (LETT |n1| |#G1| . #3#)
          (EXIT
           (COND ((< |#G1| |m|) (|spadConstant| $ 153))
                 ((EQL |n1| |m|)
                  (SPADCALL (SPADCALL |f| (QREFELT $ 141)) (QREFELT $ 134)))
                 ('T
                  (SEQ (LETT |k| (SPADCALL |n1| |m| (QREFELT $ 154)) . #3#)
                       (LETT |ris| (|spadConstant| $ 153) . #3#)
                       (LETT |n| |n1| . #3#)
                       (SEQ G190 (COND ((NULL (>= |n| |m|)) (GO G191)))
                            (SEQ
                             (SEQ G190
                                  (COND
                                   ((NULL (SPADCALL |n1| |n| (QREFELT $ 44)))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |k|
                                         (QUOTIENT2 (* |k| (- |n1| |m|)) |n1|)
                                         . #3#)
                                   (EXIT (LETT |n1| (- |n1| 1) . #3#)))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (LETT |ris|
                                   (SPADCALL |ris|
                                             (SPADCALL
                                              (SPADCALL |k|
                                                        (SPADCALL |f|
                                                                  (QREFELT $
                                                                           141))
                                                        (QREFELT $ 155))
                                              (PROG1
                                                  (LETT #2# (- |n| |m|) . #3#)
                                                (|check_subtype2| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#))
                                              (QREFELT $ 156))
                                             (QREFELT $ 157))
                                   . #3#)
                             (LETT |f| (SPADCALL |f| (QREFELT $ 158)) . #3#)
                             (EXIT
                              (LETT |n| (SPADCALL |f| (QREFELT $ 132)) . #3#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |ris|)))))))) 

(SDEFUN |MULTSQFR;myDegree;SupLNniL;11|
        ((|f| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|exp| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G332 NIL) (|n| NIL) (#2=#:G331 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MULTSQFR;myDegree;SupLNniL;11|))
                 (SEQ (LETT |n| NIL . #3#)
                      (LETT #1# (SPADCALL |f| |lvar| (QREFELT $ 159)) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (QUOTIENT2 |n| |exp|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(DECLAIM (NOTINLINE |MultivariateSquareFree;|)) 

(DEFUN |MultivariateSquareFree| (&REST #1=#:G333)
  (SPROG NIL
         (PROG (#2=#:G334)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultivariateSquareFree|)
                                               '|domainEqualList|)
                    . #3=(|MultivariateSquareFree|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultivariateSquareFree;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultivariateSquareFree|)))))))))) 

(DEFUN |MultivariateSquareFree;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MultivariateSquareFree|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|MultivariateSquareFree| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 160) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|MultivariateSquareFree|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 16
              (SPADCALL (SPADCALL (EXPT 2 26) (QREFELT $ 14)) (QREFELT $ 15)))
    $))) 

(MAKEPROP '|MultivariateSquareFree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|) (0 . ^)
              (|Integer|) (|IntegerPrimesPackage| 12) (6 . |prevPrime|)
              (11 . |coerce|) '|pmod|
              (|Record| (|:| |factor| 23) (|:| |exponent| 12))
              (|Record| (|:| |upol| 23) (|:| |Lval| 62) (|:| |Lfact| 46)
                        (|:| |ctpol| 8))
              (|SparseUnivariatePolynomial| 9) (|List| 7) (|List| 62)
              |MULTSQFR;intChoose;SupLLR;4| (|SparseUnivariatePolynomial| 8)
              (16 . |One|) (|Boolean|) (20 . =) (26 . |One|) (30 . |One|)
              (34 . |leadingCoefficient|) (39 . ~=) (45 . *) (51 . |coerce|)
              (56 . *) (62 . *) (|Factored| 9) (68 . |One|) (72 . ~=)
              |MULTSQFR;squareFree;PF;3| (78 . |unit|) (83 . *)
              (|Record| (|:| |factor| 9) (|:| |exponent| 12)) (|List| 41)
              (89 . |factors|) (94 . >) (|Mapping| 25 17 17) (|List| 17)
              (100 . |sort|) (106 . ~=) (112 . =) (|Union| $ '"failed")
              (118 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (124 . |unitNormal|) (|Record| (|:| |pol| 19) (|:| |polval| 23))
              |MULTSQFR;consnewpol;SupSupIR;6| |MULTSQFR;coefChoose;IPLP;5|
              (|List| 58) (|NonNegativeInteger|)
              |MULTSQFR;myDegree;SupLNniL;11| (129 . |exquo|)
              (|Union| 67 '"failed") (|List| 8) |MULTSQFR;lift;Sup2SupPLLLU;7|
              (|Record| (|:| |factor| 19) (|:| |exponent| 12))
              (|Record| (|:| |unitPart| 9) (|:| |suPart| (|List| 64)))
              |MULTSQFR;nsqfree;SupLLR;1| (|List| 19) (135 . |elt|) (141 . ^)
              (147 . |exquo|) (|FactoringUtilities| 6 7 8 9)
              (153 . |completeEval|) (160 . |ground?|) (165 . |exquo|)
              (171 . |gcd|) (177 . =) (|SingletonAsOrderedSet|)
              (183 . |retract|) (188 . |retract|) (193 . |exquo|)
              (199 . |degree|) (204 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 83) (|:| |factor| 9) (|:| |exponent| 12))
              (|List| 84) (209 . |factorList|)
              (|Record| (|:| |flag| 83) (|:| |factor| 19) (|:| |exponent| 12))
              (|List| 87) (|Factored| 19) (214 . |makeFR|) (|List| 9)
              (220 . |coefficients|) (225 . |variables|) (230 . |setUnion|)
              (236 . |ground|) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 19 8 23)
              (241 . |map|) (|Factored| $) (247 . |squareFree|) (|Factored| 23)
              (252 . |unit|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 23 9 19)
              (257 . |map|)
              (|Record| (|:| |flag| 83) (|:| |factor| 23) (|:| |exponent| 12))
              (|List| 106) (263 . |factorList|) (268 . |content|)
              (273 . |append|) |MULTSQFR;squareFree;SupF;2| (279 . |makeFR|)
              (285 . |minimumDegree|) (291 . |elt|) (297 . |Zero|)
              (301 . |Zero|) (305 . |elt|) (311 . |monomial|) (318 . |coerce|)
              |MULTSQFR;univcase;POVF;8| (323 . |append|) (329 . |degree|)
              (335 . ~=) (341 . >) (347 . |delete|)
              (|SparseUnivariatePolynomial| $) (353 . |univariate|)
              (359 . |multivariate|) (365 . *) (371 . |ran|) (376 . |member?|)
              (382 . |degree|) (387 . |content|) (392 . |coerce|)
              (397 . |factors|) (402 . |elt|) |MULTSQFR;compdegd;LI;9|
              (408 . ^) (414 . |normalDeriv|) |MULTSQFR;normDeriv2;SupISup;10|
              (420 . |leadingCoefficient|) (425 . |retract|) (430 . |quo|)
              (436 . |eval|) (|List| 23) (|MultivariateLifting| 6 7 8 9)
              (443 . |lifting|) (454 . ~=) (460 . |primitivePart|)
              (465 . |univariate|) (470 . |exquo|) (476 . |multivariate|)
              (482 . |Zero|) (486 . |binomial|) (492 . *) (498 . |monomial|)
              (504 . +) (510 . |reductum|) (515 . |degree|))
           '#(|univcase| 521 |squareFreePrim| 527 |squareFree| 532 |nsqfree|
              542 |normDeriv2| 549 |myDegree| 555 |lift| 562 |intChoose| 573
              |consnewpol| 580 |compdegd| 587 |coefChoose| 592 |check| 599)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 159
                                                 '(2 10 0 0 10 11 1 13 12 12 14
                                                   1 8 0 12 15 0 23 0 24 2 23
                                                   25 0 0 26 0 9 0 27 0 8 0 28
                                                   1 19 9 0 29 2 8 25 0 0 30 2
                                                   23 0 8 0 31 1 9 0 8 32 2 19
                                                   0 9 0 33 2 9 0 8 0 34 0 35 0
                                                   36 2 9 25 0 0 37 1 35 9 0 39
                                                   2 9 0 0 0 40 1 35 42 0 43 2
                                                   12 25 0 0 44 2 46 0 45 0 47
                                                   2 46 25 0 0 48 2 46 25 0 0
                                                   49 2 19 50 0 9 51 1 9 52 0
                                                   53 2 23 50 0 0 60 2 67 19 0
                                                   12 68 2 19 0 0 58 69 2 19 50
                                                   0 0 70 3 71 23 19 20 62 72 1
                                                   9 25 0 73 2 9 50 0 0 74 2 9
                                                   0 0 0 75 2 9 25 0 0 76 1 19
                                                   77 0 78 1 19 9 0 79 2 9 50 0
                                                   8 80 1 19 58 0 81 1 19 0 9
                                                   82 1 35 85 0 86 2 89 0 19 88
                                                   90 1 19 91 0 92 1 9 20 0 93
                                                   2 20 0 0 0 94 1 9 8 0 95 2
                                                   97 23 96 19 98 1 23 99 0 100
                                                   1 101 23 0 102 2 104 19 103
                                                   23 105 1 101 107 0 108 1 19
                                                   9 0 109 2 88 0 0 0 110 2 35
                                                   0 9 85 112 2 9 57 0 20 113 2
                                                   57 58 0 12 114 0 6 0 115 0 8
                                                   0 116 2 20 7 0 12 117 3 9 0
                                                   0 7 58 118 1 9 0 7 119 2 85
                                                   0 0 0 121 2 9 57 0 20 122 2
                                                   58 25 0 0 123 2 58 25 0 0
                                                   124 2 20 0 0 12 125 2 9 126
                                                   0 7 127 2 9 0 126 7 128 2 12
                                                   0 10 0 129 1 71 8 12 130 2
                                                   21 25 62 0 131 1 23 58 0 132
                                                   1 23 8 0 133 1 23 0 8 134 1
                                                   101 46 0 135 2 46 17 0 12
                                                   136 2 9 0 0 58 138 2 71 19
                                                   19 12 139 1 23 8 0 141 1 9 8
                                                   0 142 2 8 0 0 0 143 3 9 0 0
                                                   20 62 144 7 146 61 19 20 145
                                                   62 91 57 8 147 2 23 25 0 0
                                                   148 1 19 0 0 149 1 9 23 0
                                                   150 2 23 50 0 8 151 2 9 0 23
                                                   7 152 0 23 0 153 2 12 0 0 0
                                                   154 2 8 0 12 0 155 2 23 0 8
                                                   58 156 2 23 0 0 0 157 1 23 0
                                                   0 158 2 71 57 19 20 159 2 0
                                                   35 9 7 120 1 0 35 9 1 1 0 35
                                                   9 38 1 0 89 19 111 3 0 65 19
                                                   20 21 66 2 0 23 23 12 140 3
                                                   0 57 19 20 58 59 7 0 61 19
                                                   23 23 9 20 57 62 63 3 0 18
                                                   19 20 21 22 3 0 54 19 23 12
                                                   55 1 0 12 46 137 3 0 9 12 9
                                                   42 56 2 0 25 46 46 1)))))
           '|lookupComplete|)) 
