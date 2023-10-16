
(SDEFUN |MULTSQFR;nsqfree;SupLLR;1|
        ((|oldf| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |unitPart| P)
          (|:| |suPart|
               (|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| P))
                          (|:| |exponent| (|NonNegativeInteger|)))))))
        (SPROG
         ((#1=#:G156 NIL)
          (|sqlead|
           (|List|
            (|Record| (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#2=#:G161 NIL)
          (|nsqlead|
           (|List|
            (|Record| (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|nff| (P)) (|lcr| (P)) (#3=#:G175 NIL) (|hh1| (P)) (#4=#:G159 NIL)
          (|h1| (|Union| P #5="failed")) (|unitsq| (P)) (#6=#:G177 NIL)
          (|lpfact| NIL) (|f0| #7=(|SparseUnivariatePolynomial| R))
          (|f| (|SparseUnivariatePolynomial| P))
          (|sqdec|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| P))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#8=#:G176 NIL)
          (|h| (|Union| (|SparseUnivariatePolynomial| P) #9="failed"))
          (|r1| (|SparseUnivariatePolynomial| P))
          (|result0| (|SparseUnivariatePolynomial| P))
          (|result|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (#10=#:G149 NIL) (|ldeg| (|List| (|NonNegativeInteger|)))
          (|lcoef| (P)) (|d0| #11=(|SparseUnivariatePolynomial| R))
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
                          (|:| |exponent| (|NonNegativeInteger|)))))
          (|exp0| (|NonNegativeInteger|)) (|#G10| (|NonNegativeInteger|))
          (|#G9| #13#)
          (|pfact|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|sqlc| (|Factored| P)) (|leadpol| (|Boolean|)) (|lcf| (P))
          (|ctf| (R)) (|lval| #16=(|List| R))
          (|univPol|
           (|Record| (|:| |upol| #7#) (|:| |Lval| #16#) (|:| |Lfact| #15#)
                     (|:| |ctpol| R))))
         (SEQ
          (EXIT
           (SEQ (LETT |f| |oldf|)
                (LETT |univPol| (SPADCALL |f| |lvar| |ltry| (QREFELT $ 22)))
                (LETT |f0| (QVELT |univPol| 0))
                (EXIT
                 (COND
                  ((SPADCALL |f0| (|spadConstant| $ 24) (QREFELT $ 26))
                   (CONS (|spadConstant| $ 27) (LIST (CONS |f| 1))))
                  ('T
                   (SEQ (LETT |lfact| (QVELT |univPol| 2))
                        (LETT |lval| (QVELT |univPol| 1))
                        (LETT |ctf| (QVELT |univPol| 3)) (LETT |leadpol| NIL)
                        (LETT |sqdec| NIL) (LETT |exp0| 0)
                        (LETT |unitsq| (|spadConstant| $ 27))
                        (LETT |lcf| (SPADCALL |f| (QREFELT $ 29)))
                        (COND
                         ((SPADCALL |ctf| (|spadConstant| $ 28) (QREFELT $ 30))
                          (SEQ (LETT |f0| (SPADCALL |ctf| |f0| (QREFELT $ 31)))
                               (LETT |f|
                                     (SPADCALL (SPADCALL |ctf| (QREFELT $ 32))
                                               |f| (QREFELT $ 33)))
                               (EXIT
                                (LETT |lcf|
                                      (SPADCALL |ctf| |lcf|
                                                (QREFELT $ 34)))))))
                        (LETT |sqlead| NIL) (LETT |sqlc| (|spadConstant| $ 36))
                        (COND
                         ((SPADCALL |lcf| (|spadConstant| $ 27) (QREFELT $ 37))
                          (SEQ (LETT |leadpol| 'T)
                               (LETT |sqlc| (SPADCALL |lcf| (QREFELT $ 38)))
                               (LETT |unitsq|
                                     (SPADCALL |unitsq|
                                               (SPADCALL |sqlc| (QREFELT $ 39))
                                               (QREFELT $ 40)))
                               (EXIT
                                (LETT |sqlead|
                                      (SPADCALL |sqlc| (QREFELT $ 43)))))))
                        (LETT |lfact|
                              (SPADCALL
                               (CONS #'|MULTSQFR;nsqfree;SupLLR;1!0| $) |lfact|
                               (QREFELT $ 48)))
                        (SEQ G190
                             (COND
                              ((NULL (SPADCALL |lfact| NIL (QREFELT $ 49)))
                               (GO G191)))
                             (SEQ (LETT |pfact| (|SPADfirst| |lfact|))
                                  (PROGN
                                   (LETT |#G9| (QCAR |pfact|))
                                   (LETT |#G10| (QCDR |pfact|))
                                   (LETT |g0| |#G9|)
                                   (LETT |exp0| |#G10|))
                                  (LETT |lfact| (CDR |lfact|))
                                  (COND
                                   ((SPADCALL |lfact| NIL (QREFELT $ 50))
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
                                                                           52)))
                                                  (QCDR #14#)
                                                (|check_union2| (QEQCAR #14# 0)
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT $ 9))
                                                                (|Union|
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT $
                                                                           9))
                                                                 "failed")
                                                                #14#)))
                                        (LETT |gg|
                                              (SPADCALL
                                               (SPADCALL |f| (QREFELT $ 29))
                                               (QREFELT $ 54)))
                                        (LETT |sqdec|
                                              (CONS
                                               (CONS
                                                (SPADCALL (QVELT |gg| 2) |f|
                                                          (QREFELT $ 33))
                                                |exp0|)
                                               |sqdec|))
                                        (EXIT
                                         (PROGN
                                          (LETT #8#
                                                (CONS (QVELT |gg| 0) |sqdec|))
                                          (GO #17=#:G174)))))))))
                                  (COND
                                   ((SPADCALL |ctf| (|spadConstant| $ 28)
                                              (QREFELT $ 30))
                                    (LETT |g0|
                                          (SPADCALL |ctf| |g0|
                                                    (QREFELT $ 31)))))
                                  (LETT |npol|
                                        (SPADCALL |f| |f0| |exp0|
                                                  (QREFELT $ 56)))
                                  (PROGN
                                   (LETT |#G11| (QCAR |npol|))
                                   (LETT |#G12| (QCDR |npol|))
                                   (LETT |d| |#G11|)
                                   (LETT |d0| |#G12|))
                                  (COND
                                   (|leadpol|
                                    (LETT |lcoef|
                                          (SPADCALL |exp0| |unitsq| |sqlead|
                                                    (QREFELT $ 57))))
                                   ('T (LETT |lcoef| (|spadConstant| $ 27))))
                                  (LETT |ldeg|
                                        (SPADCALL |f| |lvar| |exp0|
                                                  (QREFELT $ 59)))
                                  (LETT |result|
                                        (SPADCALL |d| |g0|
                                                  (PROG2
                                                      (LETT #10#
                                                            (SPADCALL |d0| |g0|
                                                                      (QREFELT
                                                                       $ 60)))
                                                      (QCDR #10#)
                                                    (|check_union2|
                                                     (QEQCAR #10# 0)
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 8))
                                                     (|Union|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 8))
                                                      #9#)
                                                     #10#))
                                                  |lcoef| |lvar| |ldeg| |lval|
                                                  (QREFELT $ 63)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |result| 1)
                                     (PROGN
                                      (LETT #8#
                                            (SPADCALL |oldf| |lvar| |ltry|
                                                      (QREFELT $ 66)))
                                      (GO #17#)))
                                    ('T
                                     (SEQ
                                      (LETT |result0|
                                            (SPADCALL (QCDR |result|) 1
                                                      (QREFELT $ 68)))
                                      (LETT |r1|
                                            (SPADCALL |result0| |exp0|
                                                      (QREFELT $ 69)))
                                      (SEQ
                                       (LETT |h|
                                             (SPADCALL |f| |r1|
                                                       (QREFELT $ 70)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |h| 1)
                                          (PROGN
                                           (LETT #8#
                                                 (SPADCALL |oldf| |lvar| NIL
                                                           (QREFELT $ 66)))
                                           (GO #17#))))))
                                      (LETT |sqdec|
                                            (CONS (CONS |result0| |exp0|)
                                                  |sqdec|))
                                      (LETT |f| (QCDR |h|))
                                      (LETT |f0|
                                            (SPADCALL (QCDR |h|) |lvar| |lval|
                                                      (QREFELT $ 72)))
                                      (LETT |lcr|
                                            (SPADCALL |result0|
                                                      (QREFELT $ 29)))
                                      (LETT |nsqlead| |sqlead|)
                                      (SEQ (LETT |lpfact| NIL)
                                           (LETT #6# |sqlead|) G190
                                           (COND
                                            ((OR (ATOM #6#)
                                                 (PROGN
                                                  (LETT |lpfact| (CAR #6#))
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
                                                                          74)))
                                                          (QCDR #1#)
                                                        (|check_union2|
                                                         (QEQCAR #1# 0)
                                                         (QREFELT $ 9)
                                                         (|Union| (QREFELT $ 9)
                                                                  #5#)
                                                         #1#)))
                                                (EXIT
                                                 (LETT |lcr|
                                                       (|spadConstant| $
                                                                       27)))))
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
                                                           (LETT #3#
                                                                 |$NoValue|)
                                                           (GO #18=#:G166)))
                                                         ('T
                                                          (SEQ
                                                           (LETT |h1|
                                                                 (SPADCALL
                                                                  |lcr|
                                                                  (QCAR
                                                                   |lpfact|)
                                                                  (QREFELT $
                                                                           74)))
                                                           (EXIT
                                                            (COND
                                                             ((QEQCAR |h1| 0)
                                                              (SEQ
                                                               (LETT |lcr|
                                                                     (QCDR
                                                                      |h1|))
                                                               (EXIT
                                                                (PROGN
                                                                 (RPLACD
                                                                  |lpfact|
                                                                  (PROG1
                                                                      (LETT #4#
                                                                            (-
                                                                             (QCDR
                                                                              |lpfact|)
                                                                             |exp0|))
                                                                    (|check_subtype2|
                                                                     (>= #4# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #4#)))
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
                                                                       $ 75)))
                                                               (EXIT
                                                                (COND
                                                                 ((SPADCALL
                                                                   |hh1|
                                                                   (|spadConstant|
                                                                    $ 27)
                                                                   (QREFELT $
                                                                            76))
                                                                  (PROGN
                                                                   (LETT #3#
                                                                         |$NoValue|)
                                                                   (GO #18#)))
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
                                                                                74)))
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
                                                                             #5#)
                                                                            #1#)))
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
                                                                                74)))
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
                                                                             #5#)
                                                                            #1#)))
                                                                   (LETT
                                                                    |nsqlead|
                                                                    (CONS
                                                                     (CONS
                                                                      |nff|
                                                                      (QCDR
                                                                       |lpfact|))
                                                                     |nsqlead|))
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
                                                                      (PROG1
                                                                          (LETT
                                                                           #2#
                                                                           (-
                                                                            (QCDR
                                                                             |lpfact|)
                                                                            |exp0|))
                                                                        (|check_subtype2|
                                                                         (>=
                                                                          #2#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         '(|Integer|)
                                                                         #2#)))
                                                                     (QCDR
                                                                      |lpfact|))))))))))))))))
                                                      NIL (GO G190) G191
                                                      (EXIT NIL)))
                                                #18# (EXIT #3#))))))
                                           (LETT #6# (CDR #6#)) (GO G190) G191
                                           (EXIT NIL))
                                      (EXIT (LETT |sqlead| |nsqlead|)))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (CONS
                          (PROG2
                              (LETT #1#
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 79))
                                              |ctf| (QREFELT $ 80)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                            (|Union| (QREFELT $ 9) #5#) #1#))
                          |sqdec|))))))))
          #17# (EXIT #8#)))) 

(SDEFUN |MULTSQFR;nsqfree;SupLLR;1!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCDR |z1|) (QCDR |z2|) (QREFELT $ 45))) 

(SDEFUN |MULTSQFR;squareFree;SupF;2|
        ((|f| |SparseUnivariatePolynomial| P)
         ($ |Factored| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|lfs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| P))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G215 NIL) (|fu| #2=(|Factored| P)) (#3=#:G214 NIL)
          (|partSq|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (#4=#:G213 NIL) (|ff| NIL) (#5=#:G212 NIL) (|lcSq| #2#)
          (#6=#:G197 NIL) (|lcf| (P)) (#7=#:G211 NIL) (#8=#:G210 NIL)
          (|usqfr| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|upol| (|SparseUnivariatePolynomial| R)) (|lvar| #9=(|List| OV))
          (#10=#:G188 NIL) (#11=#:G187 #9#) (#12=#:G189 #9#) (#13=#:G209 NIL)
          (|cf| NIL) (#14=#:G208 NIL) (#15=#:G207 NIL))
         (SEQ
          (COND
           ((EQL (SPADCALL |f| (QREFELT $ 81)) 0)
            (SEQ
             (LETT |fu|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 79)) (QREFELT $ 38)))
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |fu| (QREFELT $ 39)) (QREFELT $ 82))
               (PROGN
                (LETT #15# NIL)
                (SEQ (LETT |ff| NIL) (LETT #14# (SPADCALL |fu| (QREFELT $ 86)))
                     G190
                     (COND
                      ((OR (ATOM #14#) (PROGN (LETT |ff| (CAR #14#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #15#
                             (CONS
                              (VECTOR (CONS 1 "sqfr")
                                      (SPADCALL (QVELT |ff| 1) (QREFELT $ 82))
                                      (QVELT |ff| 2))
                              #15#))))
                     (LETT #14# (CDR #14#)) (GO G190) G191
                     (EXIT (NREVERSE #15#))))
               (QREFELT $ 90)))))
           (#16='T
            (SEQ
             (LETT |lvar|
                   (PROGN
                    (LETT #10# NIL)
                    (SEQ (LETT |cf| NIL)
                         (LETT #13# (SPADCALL |f| (QREFELT $ 92))) G190
                         (COND
                          ((OR (ATOM #13#) (PROGN (LETT |cf| (CAR #13#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #12# (SPADCALL |cf| (QREFELT $ 93)))
                            (COND
                             (#10#
                              (LETT #11# (SPADCALL #11# #12# (QREFELT $ 94))))
                             ('T (PROGN (LETT #11# #12#) (LETT #10# 'T)))))))
                         (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
                    (COND (#10# #11#) (#16# (|IdentityError| '|setUnion|)))))
             (EXIT
              (COND
               ((NULL |lvar|)
                (SEQ (LETT |upol| (SPADCALL (ELT $ 95) |f| (QREFELT $ 98)))
                     (LETT |usqfr| (SPADCALL |upol| (QREFELT $ 100)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (ELT $ 32) (SPADCALL |usqfr| (QREFELT $ 102))
                                 (QREFELT $ 105))
                       (PROGN
                        (LETT #8# NIL)
                        (SEQ (LETT |ff| NIL)
                             (LETT #7# (SPADCALL |usqfr| (QREFELT $ 108))) G190
                             (COND
                              ((OR (ATOM #7#)
                                   (PROGN (LETT |ff| (CAR #7#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #8#
                                     (CONS
                                      (VECTOR (CONS 1 "sqfr")
                                              (SPADCALL (ELT $ 32)
                                                        (QVELT |ff| 1)
                                                        (QREFELT $ 105))
                                              (QVELT |ff| 2))
                                      #8#))))
                             (LETT #7# (CDR #7#)) (GO G190) G191
                             (EXIT (NREVERSE #8#))))
                       (QREFELT $ 90)))))
               (#16#
                (SEQ (LETT |lcf| (SPADCALL |f| (QREFELT $ 109)))
                     (LETT |f|
                           (PROG2
                               (LETT #6# (SPADCALL |f| |lcf| (QREFELT $ 52)))
                               (QCDR #6#)
                             (|check_union2| (QEQCAR #6# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 9))
                                             (|Union|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              "failed")
                                             #6#)))
                     (LETT |lcSq| (SPADCALL |lcf| (QREFELT $ 38)))
                     (LETT |lfs|
                           (PROGN
                            (LETT #5# NIL)
                            (SEQ (LETT |ff| NIL)
                                 (LETT #4# (SPADCALL |lcSq| (QREFELT $ 86)))
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |ff| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #5#
                                         (CONS
                                          (VECTOR (CONS 1 "sqfr")
                                                  (SPADCALL (QVELT |ff| 1)
                                                            (QREFELT $ 82))
                                                  (QVELT |ff| 2))
                                          #5#))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT (NREVERSE #5#)))))
                     (LETT |partSq| (SPADCALL |f| |lvar| NIL (QREFELT $ 66)))
                     (LETT |lfs|
                           (SPADCALL
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |fu| NIL) (LETT #1# (QCDR |partSq|))
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |fu| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (VECTOR (CONS 1 "sqfr") (QCAR |fu|)
                                                   (QCDR |fu|))
                                           #3#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            |lfs| (QREFELT $ 110)))
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
                      (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|nsqff|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G252 NIL) (|fu| NIL) (#2=#:G251 NIL)
          (|nsqfftot|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (#3=#:G237 NIL) (|lcont| (P)) (|f0| (|SparseUnivariatePolynomial| P))
          (|lvar| (|List| OV)) (|x| (OV)) (|i| (|Integer|)) (#4=#:G250 NIL)
          (|j| NIL) (|m| #5=(|NonNegativeInteger|)) (#6=#:G233 NIL)
          (#7=#:G232 #5#) (#8=#:G234 #5#) (#9=#:G249 NIL) (|ldeg| (|List| #5#))
          (|result| (|Factored| P)) (#10=#:G247 NIL) (#11=#:G226 NIL) (|p| (P))
          (|y| (OV)) (|n| (|NonNegativeInteger|)) (#12=#:G248 NIL) (|im| NIL)
          (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |f| (QREFELT $ 73)) (SPADCALL |f| NIL (QREFELT $ 112)))
            (#13='T
             (SEQ (LETT |lvar| (SPADCALL |f| (QREFELT $ 93)))
                  (LETT |result1| NIL)
                  (LETT |lmdeg| (SPADCALL |f| |lvar| (QREFELT $ 113)))
                  (LETT |p| (|spadConstant| $ 27))
                  (SEQ (LETT |im| 1) (LETT #12# (LENGTH |lvar|)) G190
                       (COND ((|greater_SI| |im| #12#) (GO G191)))
                       (SEQ (LETT |n| (SPADCALL |lmdeg| |im| (QREFELT $ 114)))
                            (EXIT
                             (COND ((EQL |n| 0) "next im")
                                   ('T
                                    (SEQ
                                     (LETT |y|
                                           (SPADCALL |lvar| |im|
                                                     (QREFELT $ 117)))
                                     (LETT |p|
                                           (SPADCALL |p|
                                                     (SPADCALL
                                                      (|spadConstant| $ 27) |y|
                                                      |n| (QREFELT $ 118))
                                                     (QREFELT $ 40)))
                                     (EXIT
                                      (LETT |result1|
                                            (CONS
                                             (VECTOR (CONS 1 "sqfr")
                                                     (SPADCALL |y|
                                                               (QREFELT $ 119))
                                                     |n|)
                                             |result1|))))))))
                       (LETT |im| (|inc_SI| |im|)) (GO G190) G191 (EXIT NIL))
                  (COND
                   ((SPADCALL |p| (|spadConstant| $ 27) (QREFELT $ 37))
                    (SEQ
                     (LETT |f|
                           (PROG2 (LETT #11# (SPADCALL |f| |p| (QREFELT $ 74)))
                               (QCDR #11#)
                             (|check_union2| (QEQCAR #11# 0) (QREFELT $ 9)
                                             (|Union| (QREFELT $ 9) "failed")
                                             #11#)))
                     (COND
                      ((SPADCALL |f| (QREFELT $ 73))
                       (PROGN
                        (LETT #10# (SPADCALL |f| |result1| (QREFELT $ 112)))
                        (GO #14=#:G246))))
                     (EXIT (LETT |lvar| (SPADCALL |f| (QREFELT $ 93)))))))
                  (EXIT
                   (COND
                    ((EQL (LENGTH |lvar|) 1)
                     (SEQ
                      (LETT |result|
                            (SPADCALL |f| (|SPADfirst| |lvar|)
                                      (QREFELT $ 120)))
                      (EXIT
                       (SPADCALL (SPADCALL |result| (QREFELT $ 39))
                                 (SPADCALL |result1|
                                           (SPADCALL |result| (QREFELT $ 86))
                                           (QREFELT $ 121))
                                 (QREFELT $ 112)))))
                    (#13#
                     (SEQ (LETT |ldeg| (SPADCALL |f| |lvar| (QREFELT $ 122)))
                          (LETT |m|
                                (PROGN
                                 (LETT #6# NIL)
                                 (SEQ (LETT |j| NIL) (LETT #9# |ldeg|) G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN (LETT |j| (CAR #9#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL |j| 0 (QREFELT $ 123))
                                          (PROGN
                                           (LETT #8# |j|)
                                           (COND (#6# (LETT #7# (MIN #7# #8#)))
                                                 ('T
                                                  (PROGN
                                                   (LETT #7# #8#)
                                                   (LETT #6# 'T)))))))))
                                      (LETT #9# (CDR #9#)) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#6# #7#)
                                       (#13# (|IdentityError| '|min|)))))
                          (LETT |i| 1)
                          (SEQ (LETT |j| NIL) (LETT #4# |ldeg|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |j| (CAR #4#)) NIL)
                                     (NULL (SPADCALL |j| |m| (QREFELT $ 45))))
                                 (GO G191)))
                               (SEQ (EXIT (LETT |i| (+ |i| 1))))
                               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                          (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 117)))
                          (LETT |lvar| (SPADCALL |lvar| |i| (QREFELT $ 124)))
                          (LETT |f0| (SPADCALL |f| |x| (QREFELT $ 126)))
                          (LETT |lcont| (SPADCALL |f0| (QREFELT $ 109)))
                          (LETT |nsqfftot|
                                (SPADCALL
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL |f0| |lcont|
                                                     (QREFELT $ 52)))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 9))
                                                    "failed")
                                                   #3#))
                                 |lvar| NIL (QREFELT $ 66)))
                          (LETT |nsqff|
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |fu| NIL)
                                      (LETT #1# (QCDR |nsqfftot|)) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |fu| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (VECTOR (CONS 1 "sqfr")
                                                       (SPADCALL (QCAR |fu|)
                                                                 |x|
                                                                 (QREFELT $
                                                                          127))
                                                       (QCDR |fu|))
                                               #2#))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#)))))
                          (LETT |result1|
                                (SPADCALL |result1| |nsqff| (QREFELT $ 121)))
                          (EXIT
                           (COND
                            ((SPADCALL |lcont| (QREFELT $ 73))
                             (SPADCALL
                              (SPADCALL |lcont| (QCAR |nsqfftot|)
                                        (QREFELT $ 40))
                              |result1| (QREFELT $ 112)))
                            (#13#
                             (SEQ
                              (LETT |sqlead| (SPADCALL |lcont| (QREFELT $ 38)))
                              (EXIT
                               (SPADCALL
                                (SPADCALL (SPADCALL |sqlead| (QREFELT $ 39))
                                          (QCAR |nsqfftot|) (QREFELT $ 40))
                                (SPADCALL |result1|
                                          (SPADCALL |sqlead| (QREFELT $ 86))
                                          (QREFELT $ 121))
                                (QREFELT $ 112)))))))))))))))
          #14# (EXIT #10#)))) 

(SDEFUN |MULTSQFR;intChoose;SupLLR;4|
        ((|f| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
          (|:| |Lval| (|List| R))
          (|:| |Lfact|
               (|List|
                (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                          (|:| |exponent| (|NonNegativeInteger|)))))
          (|:| |ctpol| R)))
        (SPROG
         ((|d1| #1=(|Integer|)) (|lval1| (|List| R)) (|ctf1| (R))
          (|lfact1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|f1| (|SparseUnivariatePolynomial| R))
          (|try_n| (|NonNegativeInteger|)) (#2=#:G270 NIL) (|d0| #1#)
          (|lfact|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#3=#:G257 NIL) (|ctf| (R)) (|f0| (|SparseUnivariatePolynomial| R))
          (|lval| (|List| R)) (#4=#:G272 NIL) (|i| NIL) (#5=#:G271 NIL)
          (|range| (|Integer|)) (|nvr| (|NonNegativeInteger|))
          (|degf| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |degf| (SPADCALL |f| (QREFELT $ 81))) (LETT |try_n| 0)
                (LETT |nvr| (LENGTH |lvar|)) (LETT |range| 10)
                (LETT |lfact1| NIL) (LETT |lval1| NIL)
                (LETT |ctf1| (|spadConstant| $ 28))
                (LETT |f1| (|spadConstant| $ 24))
                (EXIT
                 (SEQ G190 (COND ((NULL (< |range| 10000000000)) (GO G191)))
                      (SEQ (LETT |range| (SPADCALL 2 |range| (QREFELT $ 128)))
                           (LETT |lval|
                                 (PROGN
                                  (LETT #5# NIL)
                                  (SEQ (LETT |i| 1) (LETT #4# |nvr|) G190
                                       (COND
                                        ((|greater_SI| |i| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #5#
                                               (CONS
                                                (SPADCALL |range|
                                                          (QREFELT $ 129))
                                                #5#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #5#)))))
                           (EXIT
                            (COND
                             ((SPADCALL |lval| |ltry| (QREFELT $ 130))
                              "new integer")
                             ('T
                              (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                   (LETT |f0|
                                         (SPADCALL |f| |lvar| |lval|
                                                   (QREFELT $ 72)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |f0| (QREFELT $ 131))
                                                |degf| (QREFELT $ 123))
                                      "new integer")
                                     ('T
                                      (SEQ
                                       (LETT |ctf|
                                             (SPADCALL |f0| (QREFELT $ 132)))
                                       (LETT |lfact|
                                             (SPADCALL
                                              (SPADCALL
                                               (PROG2
                                                   (LETT #3#
                                                         (SPADCALL |f0|
                                                                   (SPADCALL
                                                                    |ctf|
                                                                    (QREFELT $
                                                                             133))
                                                                   (QREFELT $
                                                                            60)))
                                                   (QCDR #3#)
                                                 (|check_union2| (QEQCAR #3# 0)
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT $
                                                                           8))
                                                                 (|Union|
                                                                  (|SparseUnivariatePolynomial|
                                                                   (QREFELT $
                                                                            8))
                                                                  "failed")
                                                                 #3#))
                                               (QREFELT $ 100))
                                              (QREFELT $ 134)))
                                       (COND
                                        ((EQL (LENGTH |lfact|) 1)
                                         (COND
                                          ((EQL
                                            (QCDR
                                             (SPADCALL |lfact| 1
                                                       (QREFELT $ 135)))
                                            1)
                                           (PROGN
                                            (LETT #2#
                                                  (VECTOR (|spadConstant| $ 24)
                                                          |lval| |lfact|
                                                          (|spadConstant| $
                                                                          28)))
                                            (GO #6=#:G269))))))
                                       (LETT |d0|
                                             (SPADCALL |lfact|
                                                       (QREFELT $ 136)))
                                       (EXIT
                                        (COND
                                         ((EQL |try_n| 0)
                                          (SEQ (LETT |f1| |f0|)
                                               (LETT |lfact1| |lfact|)
                                               (LETT |ctf1| |ctf|)
                                               (LETT |lval1| |lval|)
                                               (LETT |d1| |d0|)
                                               (EXIT (LETT |try_n| 1))))
                                         ((EQL |d0| |d1|)
                                          (PROGN
                                           (LETT #2#
                                                 (VECTOR |f1| |lval1| |lfact1|
                                                         |ctf1|))
                                           (GO #6#)))
                                         ((< |d0| |d1|)
                                          (SEQ (LETT |try_n| 1)
                                               (LETT |f1| |f0|)
                                               (LETT |lfact1| |lfact|)
                                               (LETT |ctf1| |ctf|)
                                               (LETT |lval1| |lval|)
                                               (EXIT
                                                (LETT |d1| |d0|)))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |MULTSQFR;coefChoose;IPLP;5|
        ((|exp| |Integer|) (|unitsq| P)
         (|sqlead| |List|
          (|Record| (|:| |factor| P) (|:| |exponent| (|NonNegativeInteger|))))
         ($ P))
        (SPROG
         ((|lcoef| (P)) (#1=#:G275 NIL) (|texp| (|NonNegativeInteger|))
          (#2=#:G280 NIL) (|term| NIL))
         (SEQ (LETT |lcoef| |unitsq|)
              (SEQ (LETT |term| NIL) (LETT #2# |sqlead|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |texp| (QCDR |term|))
                        (EXIT
                         (COND ((< |texp| |exp|) "next term")
                               ((EQL |texp| |exp|)
                                (LETT |lcoef|
                                      (SPADCALL |lcoef| (QCAR |term|)
                                                (QREFELT $ 40))))
                               ('T
                                (LETT |lcoef|
                                      (SPADCALL |lcoef|
                                                (SPADCALL (QCAR |term|)
                                                          (PROG1
                                                              (LETT #1#
                                                                    (QUOTIENT2
                                                                     |texp|
                                                                     |exp|))
                                                            (|check_subtype2|
                                                             (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                                          (QREFELT $ 137))
                                                (QREFELT $ 40)))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |lcoef|)))) 

(SDEFUN |MULTSQFR;consnewpol;SupSupIR;6|
        ((|g| |SparseUnivariatePolynomial| P)
         (|g0| |SparseUnivariatePolynomial| R) (|deg| |Integer|)
         ($ |Record| (|:| |pol| (|SparseUnivariatePolynomial| P))
          (|:| |polval| (|SparseUnivariatePolynomial| R))))
        (SEQ
         (COND ((EQL |deg| 1) (CONS |g| |g0|))
               ('T
                (SEQ (LETT |deg| (- |deg| 1))
                     (EXIT
                      (CONS (SPADCALL |g| |deg| (QREFELT $ 138))
                            (SPADCALL |g0| |deg| (QREFELT $ 139))))))))) 

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
         (SEQ (LETT |leadpol| NIL) (LETT |lcd| (SPADCALL |ud| (QREFELT $ 29)))
              (LETT |leadlist| NIL)
              (COND
               ((NULL (SPADCALL (SPADCALL |ud| (QREFELT $ 29)) (QREFELT $ 73)))
                (SEQ (LETT |leadpol| 'T)
                     (LETT |ud| (SPADCALL |lcoef| |ud| (QREFELT $ 33)))
                     (LETT |lcg0| (SPADCALL |g0| (QREFELT $ 140)))
                     (COND
                      ((SPADCALL |lcoef| (QREFELT $ 73))
                       (LETT |g0|
                             (SPADCALL
                              (SPADCALL (SPADCALL |lcoef| (QREFELT $ 141))
                                        |lcg0| (QREFELT $ 142))
                              |g0| (QREFELT $ 31))))
                      (#2='T
                       (LETT |g0|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |lcoef| |lvar| |lval|
                                          (QREFELT $ 143))
                                (QREFELT $ 141))
                               |lcg0| (QREFELT $ 142))
                              |g0| (QREFELT $ 31)))))
                     (LETT |g1| (SPADCALL |lcg0| |g1| (QREFELT $ 31)))
                     (EXIT (LETT |leadlist| (LIST |lcoef| |lcd|))))))
              (LETT |plist|
                    (SPADCALL |ud| |lvar| (LIST |g0| |g1|) |lval| |leadlist|
                              |ldeg| (QREFELT $ 16) (QREFELT $ 146)))
              (EXIT
               (COND ((QEQCAR |plist| 1) (CONS 1 "failed"))
                     (#2#
                      (SEQ
                       (PROGN
                        (LETT |#G57|
                              (SPADCALL (QCDR |plist|) 1 (QREFELT $ 68)))
                        (LETT |#G58|
                              (SPADCALL (QCDR |plist|) 2 (QREFELT $ 68)))
                        (LETT |p0| |#G57|)
                        (LETT |p1| |#G58|))
                       (COND
                        ((SPADCALL (SPADCALL |p0| |lvar| |lval| (QREFELT $ 72))
                                   |g0| (QREFELT $ 147))
                         (PROGN
                          (LETT |#G59| |p1|)
                          (LETT |#G60| |p0|)
                          (LETT |p0| |#G59|)
                          (LETT |p1| |#G60|))))
                       (EXIT
                        (CONS 0
                              (LIST (SPADCALL |p0| (QREFELT $ 148))
                                    (SPADCALL |p1| (QREFELT $ 148)))))))))))) 

(SDEFUN |MULTSQFR;univcase;POVF;8| ((|f| P) (|x| OV) ($ |Factored| P))
        (SPROG
         ((#1=#:G313 NIL) (|term| NIL) (#2=#:G312 NIL)
          (|result| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|uf| (|SparseUnivariatePolynomial| R)) (#3=#:G300 NIL) (|cf| (R)))
         (SEQ (LETT |uf| (SPADCALL |f| (QREFELT $ 149)))
              (LETT |cf| (SPADCALL |uf| (QREFELT $ 132)))
              (LETT |uf|
                    (PROG2 (LETT #3# (SPADCALL |uf| |cf| (QREFELT $ 150)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 8))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT $ 8))
                                       "failed")
                                      #3#)))
              (LETT |result| (SPADCALL |uf| (QREFELT $ 100)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL |cf| (SPADCALL |result| (QREFELT $ 102))
                           (QREFELT $ 31))
                 |x| (QREFELT $ 151))
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |term| NIL)
                      (LETT #1# (SPADCALL |result| (QREFELT $ 108))) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR (CONS 1 "sqfr")
                                       (SPADCALL (QVELT |term| 1) |x|
                                                 (QREFELT $ 151))
                                       (QVELT |term| 2))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 112)))))) 

(SDEFUN |MULTSQFR;compdegd;LI;9|
        ((|lfact| |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                    (|:| |exponent| (|NonNegativeInteger|))))
         ($ |Integer|))
        (SPROG ((|ris| (|Integer|)) (#1=#:G318 NIL) (|pfact| NIL))
               (SEQ (LETT |ris| 0)
                    (SEQ (LETT |pfact| NIL) (LETT #1# |lfact|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |pfact| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ris|
                                 (+ |ris|
                                    (* (- (QCDR |pfact|) 1)
                                       (SPADCALL (QCAR |pfact|)
                                                 (QREFELT $ 131)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ris|)))) 

(SDEFUN |MULTSQFR;normDeriv2;SupISup;10|
        ((|f| |SparseUnivariatePolynomial| R) (|m| |Integer|)
         ($ |SparseUnivariatePolynomial| R))
        (SPROG
         ((|n| #1=(|Integer|)) (|ris| (|SparseUnivariatePolynomial| R))
          (#2=#:G321 NIL) (|n1| #1#) (|k| (|Integer|))
          (|#G1| (|NonNegativeInteger|)))
         (SEQ (LETT |#G1| (SPADCALL |f| (QREFELT $ 131))) (LETT |n1| |#G1|)
              (EXIT
               (COND ((< |#G1| |m|) (|spadConstant| $ 152))
                     ((EQL |n1| |m|)
                      (SPADCALL (SPADCALL |f| (QREFELT $ 140))
                                (QREFELT $ 133)))
                     ('T
                      (SEQ (LETT |k| (SPADCALL |n1| |m| (QREFELT $ 153)))
                           (LETT |ris| (|spadConstant| $ 152)) (LETT |n| |n1|)
                           (SEQ G190 (COND ((NULL (>= |n| |m|)) (GO G191)))
                                (SEQ
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (SPADCALL |n1| |n| (QREFELT $ 154)))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |k|
                                             (QUOTIENT2 (* |k| (- |n1| |m|))
                                                        |n1|))
                                       (EXIT (LETT |n1| (- |n1| 1))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |ris|
                                       (SPADCALL |ris|
                                                 (SPADCALL
                                                  (SPADCALL |k|
                                                            (SPADCALL |f|
                                                                      (QREFELT
                                                                       $ 140))
                                                            (QREFELT $ 155))
                                                  (PROG1 (LETT #2# (- |n| |m|))
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 156))
                                                 (QREFELT $ 157)))
                                 (LETT |f| (SPADCALL |f| (QREFELT $ 158)))
                                 (EXIT
                                  (LETT |n| (SPADCALL |f| (QREFELT $ 131)))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT |ris|)))))))) 

(SDEFUN |MULTSQFR;myDegree;SupLNniL;11|
        ((|f| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|exp| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G330 NIL) (|n| NIL) (#2=#:G329 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |n| NIL)
                      (LETT #1# (SPADCALL |f| |lvar| (QREFELT $ 159))) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QUOTIENT2 |n| |exp|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(DECLAIM (NOTINLINE |MultivariateSquareFree;|)) 

(DEFUN |MultivariateSquareFree| (&REST #1=#:G331)
  (SPROG NIL
         (PROG (#2=#:G332)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultivariateSquareFree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultivariateSquareFree;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultivariateSquareFree|)))))))))) 

(DEFUN |MultivariateSquareFree;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MultivariateSquareFree| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 160))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (|Record| (|:| |factor| 23) (|:| |exponent| 44))
              (|Record| (|:| |upol| 23) (|:| |Lval| 62) (|:| |Lfact| 47)
                        (|:| |ctpol| 8))
              (|SparseUnivariatePolynomial| 9) (|List| 7) (|List| 62)
              |MULTSQFR;intChoose;SupLLR;4| (|SparseUnivariatePolynomial| 8)
              (16 . |One|) (|Boolean|) (20 . =) (26 . |One|) (30 . |One|)
              (34 . |leadingCoefficient|) (39 . ~=) (45 . *) (51 . |coerce|)
              (56 . *) (62 . *) (|Factored| 9) (68 . |One|) (72 . ~=)
              |MULTSQFR;squareFree;PF;3| (78 . |unit|) (83 . *)
              (|Record| (|:| |factor| 9) (|:| |exponent| 44)) (|List| 41)
              (89 . |factors|) (|NonNegativeInteger|) (94 . >)
              (|Mapping| 25 17 17) (|List| 17) (100 . |sort|) (106 . ~=)
              (112 . =) (|Union| $ '"failed") (118 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (124 . |unitNormal|) (|Record| (|:| |pol| 19) (|:| |polval| 23))
              |MULTSQFR;consnewpol;SupSupIR;6| |MULTSQFR;coefChoose;IPLP;5|
              (|List| 44) |MULTSQFR;myDegree;SupLNniL;11| (129 . |exquo|)
              (|Union| 67 '#1="failed") (|List| 8)
              |MULTSQFR;lift;Sup2SupPLLLU;7|
              (|Record| (|:| |factor| 19) (|:| |exponent| 44))
              (|Record| (|:| |unitPart| 9) (|:| |suPart| (|List| 64)))
              |MULTSQFR;nsqfree;SupLLR;1| (|List| 19) (135 . |elt|) (141 . ^)
              (147 . |exquo|) (|FactoringUtilities| 6 7 8 9)
              (153 . |completeEval|) (160 . |ground?|) (165 . |exquo|)
              (171 . |gcd|) (177 . =) (|SingletonAsOrderedSet|)
              (183 . |retract|) (188 . |retract|) (193 . |exquo|)
              (199 . |degree|) (204 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 83) (|:| |factor| 9) (|:| |exponent| 44))
              (|List| 84) (209 . |factorList|)
              (|Record| (|:| |flag| 83) (|:| |factor| 19) (|:| |exponent| 44))
              (|List| 87) (|Factored| 19) (214 . |makeFR|) (|List| 9)
              (220 . |coefficients|) (225 . |variables|) (230 . |setUnion|)
              (236 . |ground|) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 19 8 23)
              (241 . |map|) (|Factored| $) (247 . |squareFree|) (|Factored| 23)
              (252 . |unit|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 23 9 19)
              (257 . |map|)
              (|Record| (|:| |flag| 83) (|:| |factor| 23) (|:| |exponent| 44))
              (|List| 106) (263 . |factorList|) (268 . |content|)
              (273 . |append|) |MULTSQFR;squareFree;SupF;2| (279 . |makeFR|)
              (285 . |minimumDegree|) (291 . |elt|) (297 . |Zero|)
              (301 . |Zero|) (305 . |elt|) (311 . |monomial|) (318 . |coerce|)
              |MULTSQFR;univcase;POVF;8| (323 . |append|) (329 . |degree|)
              (335 . ~=) (341 . |delete|) (|SparseUnivariatePolynomial| $)
              (347 . |univariate|) (353 . |multivariate|) (359 . *)
              (365 . |ran|) (370 . |member?|) (376 . |degree|)
              (381 . |content|) (386 . |coerce|) (391 . |factors|)
              (396 . |elt|) |MULTSQFR;compdegd;LI;9| (402 . ^)
              (408 . |normalDeriv|) |MULTSQFR;normDeriv2;SupISup;10|
              (414 . |leadingCoefficient|) (419 . |retract|) (424 . |quo|)
              (430 . |eval|) (|List| 23) (|MultivariateLifting| 6 7 8 9)
              (437 . |lifting|) (448 . ~=) (454 . |primitivePart|)
              (459 . |univariate|) (464 . |exquo|) (470 . |multivariate|)
              (476 . |Zero|) (480 . |binomial|) (486 . >) (492 . *)
              (498 . |monomial|) (504 . +) (510 . |reductum|) (515 . |degree|))
           '#(|univcase| 521 |squareFreePrim| 527 |squareFree| 532 |nsqfree|
              542 |normDeriv2| 549 |myDegree| 555 |lift| 562 |intChoose| 573
              |consnewpol| 580 |compdegd| 587 |coefChoose| 592 |check| 599)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|squareFree| ((|Factored| |#4|) |#4|)) T)
                                   '((|squareFree|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#4|))
                                       (|SparseUnivariatePolynomial| |#4|)))
                                     T)
                                   '((|squareFreePrim|
                                      ((|Factored| |#4|) |#4|))
                                     T)
                                   '((|compdegd|
                                      ((|Integer|)
                                       (|List|
                                        (|Record|
                                         (|:| |factor|
                                              (|SparseUnivariatePolynomial|
                                               |#3|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|))))))
                                     T)
                                   '((|univcase| ((|Factored| |#4|) |#4| |#2|))
                                     T)
                                   '((|consnewpol|
                                      ((|Record|
                                        (|:| |pol|
                                             (|SparseUnivariatePolynomial|
                                              |#4|))
                                        (|:| |polval|
                                             (|SparseUnivariatePolynomial|
                                              |#3|)))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#3|)
                                       (|Integer|)))
                                     T)
                                   '((|nsqfree|
                                      ((|Record| (|:| |unitPart| |#4|)
                                                 (|:| |suPart|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |factor|
                                                             (|SparseUnivariatePolynomial|
                                                              |#4|))
                                                        (|:| |exponent|
                                                             (|NonNegativeInteger|))))))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|List| |#2|) (|List| (|List| |#3|))))
                                     T)
                                   '((|intChoose|
                                      ((|Record|
                                        (|:| |upol|
                                             (|SparseUnivariatePolynomial|
                                              |#3|))
                                        (|:| |Lval| (|List| |#3|))
                                        (|:| |Lfact|
                                             (|List|
                                              (|Record|
                                               (|:| |factor|
                                                    (|SparseUnivariatePolynomial|
                                                     |#3|))
                                               (|:| |exponent|
                                                    (|NonNegativeInteger|)))))
                                        (|:| |ctpol| |#3|))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|List| |#2|) (|List| (|List| |#3|))))
                                     T)
                                   '((|coefChoose|
                                      (|#4| (|Integer|) |#4|
                                       (|List|
                                        (|Record| (|:| |factor| |#4|)
                                                  (|:| |exponent|
                                                       (|NonNegativeInteger|))))))
                                     T)
                                   '((|check|
                                      ((|Boolean|)
                                       (|List|
                                        (|Record|
                                         (|:| |factor|
                                              (|SparseUnivariatePolynomial|
                                               |#3|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|))))
                                       (|List|
                                        (|Record|
                                         (|:| |factor|
                                              (|SparseUnivariatePolynomial|
                                               |#3|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|))))))
                                     T)
                                   '((|lift|
                                      ((|Union|
                                        (|List|
                                         (|SparseUnivariatePolynomial| |#4|))
                                        #1#)
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#3|)
                                       (|SparseUnivariatePolynomial| |#3|) |#4|
                                       (|List| |#2|)
                                       (|List| (|NonNegativeInteger|))
                                       (|List| |#3|)))
                                     T)
                                   '((|myDegree|
                                      ((|List| (|NonNegativeInteger|))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|List| |#2|) (|NonNegativeInteger|)))
                                     T)
                                   '((|normDeriv2|
                                      ((|SparseUnivariatePolynomial| |#3|)
                                       (|SparseUnivariatePolynomial| |#3|)
                                       (|Integer|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 159
                                            '(2 10 0 0 10 11 1 13 12 12 14 1 8
                                              0 12 15 0 23 0 24 2 23 25 0 0 26
                                              0 9 0 27 0 8 0 28 1 19 9 0 29 2 8
                                              25 0 0 30 2 23 0 8 0 31 1 9 0 8
                                              32 2 19 0 9 0 33 2 9 0 8 0 34 0
                                              35 0 36 2 9 25 0 0 37 1 35 9 0 39
                                              2 9 0 0 0 40 1 35 42 0 43 2 44 25
                                              0 0 45 2 47 0 46 0 48 2 47 25 0 0
                                              49 2 47 25 0 0 50 2 19 51 0 9 52
                                              1 9 53 0 54 2 23 51 0 0 60 2 67
                                              19 0 12 68 2 19 0 0 44 69 2 19 51
                                              0 0 70 3 71 23 19 20 62 72 1 9 25
                                              0 73 2 9 51 0 0 74 2 9 0 0 0 75 2
                                              9 25 0 0 76 1 19 77 0 78 1 19 9 0
                                              79 2 9 51 0 8 80 1 19 44 0 81 1
                                              19 0 9 82 1 35 85 0 86 2 89 0 19
                                              88 90 1 19 91 0 92 1 9 20 0 93 2
                                              20 0 0 0 94 1 9 8 0 95 2 97 23 96
                                              19 98 1 23 99 0 100 1 101 23 0
                                              102 2 104 19 103 23 105 1 101 107
                                              0 108 1 19 9 0 109 2 88 0 0 0 110
                                              2 35 0 9 85 112 2 9 58 0 20 113 2
                                              58 44 0 12 114 0 6 0 115 0 8 0
                                              116 2 20 7 0 12 117 3 9 0 0 7 44
                                              118 1 9 0 7 119 2 85 0 0 0 121 2
                                              9 58 0 20 122 2 44 25 0 0 123 2
                                              20 0 0 12 124 2 9 125 0 7 126 2 9
                                              0 125 7 127 2 12 0 10 0 128 1 71
                                              8 12 129 2 21 25 62 0 130 1 23 44
                                              0 131 1 23 8 0 132 1 23 0 8 133 1
                                              101 47 0 134 2 47 17 0 12 135 2 9
                                              0 0 44 137 2 71 19 19 12 138 1 23
                                              8 0 140 1 9 8 0 141 2 8 0 0 0 142
                                              3 9 0 0 20 62 143 7 145 61 19 20
                                              144 62 91 58 8 146 2 23 25 0 0
                                              147 1 19 0 0 148 1 9 23 0 149 2
                                              23 51 0 8 150 2 9 0 23 7 151 0 23
                                              0 152 2 12 0 0 0 153 2 12 25 0 0
                                              154 2 8 0 12 0 155 2 23 0 8 44
                                              156 2 23 0 0 0 157 1 23 0 0 158 2
                                              71 58 19 20 159 2 0 35 9 7 120 1
                                              0 35 9 1 1 0 35 9 38 1 0 89 19
                                              111 3 0 65 19 20 21 66 2 0 23 23
                                              12 139 3 0 58 19 20 44 59 7 0 61
                                              19 23 23 9 20 58 62 63 3 0 18 19
                                              20 21 22 3 0 55 19 23 12 56 1 0
                                              12 47 136 3 0 9 12 9 42 57 2 0 25
                                              47 47 1)))))
           '|lookupComplete|)) 
