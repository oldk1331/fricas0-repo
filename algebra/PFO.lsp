
(SDEFUN |PFO;torsion?;FdB;1| ((|d| |FiniteDivisor| F UP UPUP R) ($ |Boolean|))
        (QEQCAR (SPADCALL |d| (QREFELT $ 15)) 0)) 

(SDEFUN |PFO;Q2F| ((|x| |Fraction| (|Integer|)) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 21))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 22)) (QREFELT $ 21))
                  (QREFELT $ 23))) 

(SDEFUN |PFO;Q2UPUP|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         ($ UPUP))
        (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 27))) 

(SDEFUN |PFO;raise|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|k| |Kernel| F) ($ F))
        (SPADCALL (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 31))
                  (SPADCALL |k| (QREFELT $ 33)) (QREFELT $ 34))) 

(SDEFUN |PFO;raise2|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| |Kernel| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;raise2!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 38)))) 

(SDEFUN |PFO;raise2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|PFO;raise| |z1| |k| $))))) 

(SDEFUN |PFO;qmod| ((|x| F) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 39))) 

(SDEFUN |PFO;fmod|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 42))) 

(SDEFUN |PFO;pmod|
        ((|p| UPUP)
         ($ |SparseUnivariatePolynomial|
          (|Fraction|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 44))) 

(SDEFUN |PFO;rmod|
        ((|p| UP) ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 46))) 

(SDEFUN |PFO;kqmod|
        ((|x| F) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL |x| |k| (QREFELT $ 48))) 

(SDEFUN |PFO;krmod|
        ((|p| UP) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;krmod!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 51)))) 

(SDEFUN |PFO;krmod!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|PFO;kqmod| |z1| |k| $))))) 

(SDEFUN |PFO;kpmod|
        ((|p| UPUP) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;kpmod!0| (VECTOR |k| $)) |p|
                         (QREFELT $ 57)))) 

(SDEFUN |PFO;kpmod!0| ((|p1| NIL) ($$ NIL))
        (PROG ($ |k|)
          (LETT $ (QREFELT $$ 1))
          (LETT |k| (QREFELT $$ 0))
          (RETURN (PROGN (|PFO;krmod| (SPADCALL |p1| (QREFELT $ 53)) |k| $))))) 

(SDEFUN |PFO;klist| ((|d| UP) ($ |List| (|Kernel| F)))
        (SPADCALL (SPADCALL |d| (QREFELT $ 59)) (QREFELT $ 62))) 

(SDEFUN |PFO;notIrr?|
        ((|d| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPADCALL
         (LENGTH (SPADCALL (SPADCALL |d| (QREFELT $ 65)) (QREFELT $ 69))) 1
         (QREFELT $ 72))) 

(SDEFUN |PFO;kbadBadNum|
        ((|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G161 NIL) (|c| NIL) (#2=#:G160 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |c| NIL) (LETT #1# (SPADCALL |d| (QREFELT $ 74)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |c| |m| (QREFELT $ 75))
                                          (QREFELT $ 78))
                                #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 80))))) 

(SDEFUN |PFO;kbad3Num|
        ((|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G165 NIL) (|c| NIL) (#2=#:G164 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |c| NIL) (LETT #1# (SPADCALL |h| (QREFELT $ 82)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|PFO;kbadBadNum| |c| |m| $) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 83))))) 

(SDEFUN |PFO;torsionIfCan;FdU;17|
        ((|d| |FiniteDivisor| F UP UPUP R)
         ($ |Union|
          (|Record| (|:| |order| (|NonNegativeInteger|)) (|:| |function| R))
          "failed"))
        (SPROG ((|g| (|Union| R "failed")) (|n| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((ZEROP
                   (LETT |n|
                         (SPADCALL (LETT |d| (SPADCALL |d| (QREFELT $ 84)))
                                   (QREFELT $ 85))))
                  (CONS 1 "failed"))
                 (#1='T
                  (SEQ
                   (LETT |g|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |d| (QREFELT $ 86))
                                    (QREFELT $ 84))
                          (QREFELT $ 88)))
                   (EXIT
                    (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                          (#1# (CONS 0 (CONS |n| (QCDR |g|)))))))))))) 

(SDEFUN |PFO;UPQ2F|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|k| |Kernel| F) ($ F))
        (SPADCALL (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 93))
                  (SPADCALL |k| (QREFELT $ 33)) (QREFELT $ 94))) 

(SDEFUN |PFO;UP22UP|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| |Kernel| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP22UP!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 38)))) 

(SDEFUN |PFO;UP22UP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|PFO;UPQ2F| |p1| |k| $))))) 

(SDEFUN |PFO;UP32UPUP|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|k| |Kernel| F) ($ UPUP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP32UPUP!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 98)))) 

(SDEFUN |PFO;UP32UPUP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (|PFO;UP22UP| |p1| |k| $) (QREFELT $ 95)))))) 

(SDEFUN |PFO;cmult;LSmp;21|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPADCALL |l| (QREFELT $ 100))) 

(SDEFUN |PFO;cmult;LSmp;22|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((#1=#:G189 NIL)
          (#2=#:G188 #3=(|SparseMultivariatePolynomial| R0 (|Kernel| F)))
          (#4=#:G190 #3#) (#5=#:G192 NIL) (#6=#:G104 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT #6# NIL) (LETT #5# |l|) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# #6#)
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 103))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 104))))))) 

(SDEFUN |PFO;doubleDisc|
        ((|f| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         ($ |Integer|))
        (SPROG
         ((#1=#:G200 NIL) (|c| NIL) (#2=#:G199 NIL)
          (|e| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|d|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
          (#3=#:G194 NIL)
          (|g|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 105)))
              (LETT |g|
                    (SPADCALL |d| (SPADCALL |d| (QREFELT $ 106))
                              (QREFELT $ 107)))
              (LETT |d|
                    (PROG2 (LETT #3# (SPADCALL |d| |g| (QREFELT $ 109)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (|SparseUnivariatePolynomial|
                                        (|Fraction| (|Integer|))))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (|SparseUnivariatePolynomial|
                                         (|Fraction| (|Integer|))))
                                       "failed")
                                      #3#)))
              (EXIT
               (COND
                ((SPADCALL (LETT |e| (SPADCALL |d| (QREFELT $ 111)))
                           (QREFELT $ 112))
                 0)
                ('T
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |c| NIL)
                        (LETT #1# (SPADCALL |e| (QREFELT $ 114))) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS (SPADCALL |c| (QREFELT $ 115)) #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 116)))))))) 

(SDEFUN |PFO;commonDen|
        ((|p| UP) ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((|l2| (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
          (#1=#:G205 NIL) (|c| NIL) (#2=#:G204 NIL) (|l1| (|List| F)))
         (SEQ (LETT |l1| (SPADCALL |p| (QREFELT $ 59)))
              (LETT |l2|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |c| NIL) (LETT #1# |l1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |c| (QREFELT $ 118)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (SPADCALL |l2| (QREFELT $ 102)))))) 

(SDEFUN |PFO;polyred| ((|f| UPUP) ($ UPUP))
        (SPROG ((#1=#:G316 NIL) (|c| NIL) (#2=#:G315 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |c| NIL)
                           (LETT #1# (SPADCALL |f| (QREFELT $ 120))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|PFO;commonDen|
                                     (SPADCALL |c| (QREFELT $ 53)) $)
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 102))
                    (QREFELT $ 121))
                   (QREFELT $ 122))
                  (QREFELT $ 95))
                 |f| (QREFELT $ 123))))) 

(SDEFUN |PFO;aklist| ((|f| R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G321 NIL) (#2=#:G320 #3=(|List| (|Kernel| F))) (#4=#:G322 #3#)
          (#5=#:G325 NIL) (|c| NIL) (|r| (|Union| (|Fraction| UP) "failed")))
         (SEQ (LETT |r| (SPADCALL |f| (QREFELT $ 125)))
              (EXIT
               (COND
                ((QEQCAR |r| 1)
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |c| NIL)
                       (LETT #5#
                             (SPADCALL (SPADCALL |f| (QREFELT $ 126))
                                       (QREFELT $ 120)))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|PFO;klist| (SPADCALL |c| (QREFELT $ 53)) $))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 128))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6='T (|IdentityError| '|setUnion|)))))
                (#6# (|PFO;klist| (SPADCALL (QCDR |r|) (QREFELT $ 53)) $))))))) 

(SDEFUN |PFO;alglist0|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G328 NIL) (#2=#:G327 #3=(|List| (|Kernel| F))) (#4=#:G329 #3#)
          (#5=#:G332 NIL) (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|n| (|Vector| R)))
         (SEQ
          (LETT |n|
                (SPADCALL (LETT |i| (SPADCALL |d| (QREFELT $ 130)))
                          (QREFELT $ 132)))
          (EXIT
           (SPADCALL (CONS #'|PFO;alglist0!0| (VECTOR (QREFELT $ 11) $))
                     (SPADCALL (|PFO;klist| (SPADCALL |i| (QREFELT $ 137)) $)
                               (PROGN
                                (LETT #1# NIL)
                                (SEQ (LETT |i| (SPADCALL |n| (QREFELT $ 138)))
                                     (LETT #5# (QVSIZE |n|)) G190
                                     (COND ((> |i| #5#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #4#
                                              (|PFO;aklist| (QAREF1O |n| |i| 1)
                                               $))
                                        (COND
                                         (#1#
                                          (LETT #2#
                                                (SPADCALL #2# #4#
                                                          (QREFELT $ 128))))
                                         ('T
                                          (PROGN
                                           (LETT #2# #4#)
                                           (LETT #1# 'T)))))))
                                     (LETT |i| (+ |i| 1)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#1# #2#)
                                      ('T (|IdentityError| '|setUnion|))))
                               (QREFELT $ 128))
                     (QREFELT $ 140)))))) 

(SDEFUN |PFO;alglist0!0| ((|k1| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1))
          (LETT ALGOP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |k1| (QREFELT $ 134)) ALGOP (QREFELT $ 136)))))) 

(SDEFUN |PFO;alglist|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |List| (|Kernel| F)))
        (SPROG
         ((|l1| #1=(|List| (|Kernel| F))) (#2=#:G334 NIL) (#3=#:G333 #1#)
          (#4=#:G335 #1#) (#5=#:G338 NIL) (|c| NIL) (|f| (UPUP)))
         (SEQ (LETT |f| (SPADCALL (QREFELT $ 141)))
              (LETT |l1|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |c| NIL)
                          (LETT #5# (SPADCALL |f| (QREFELT $ 120))) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (|PFO;klist| (SPADCALL |c| (QREFELT $ 53))
                                    $))
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT $ 128))))
                              ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#2# #3#) ('T (|IdentityError| '|setUnion|)))))
              (EXIT (SPADCALL |l1| (|PFO;alglist0| |d| $) (QREFELT $ 128)))))) 

(SDEFUN |PFO;alglist2| ((|f| UPUP) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G340 NIL) (#2=#:G339 #3=(|List| (|Kernel| F))) (#4=#:G341 #3#)
          (#5=#:G343 NIL) (|c| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |c| NIL) (LETT #5# (SPADCALL |f| (QREFELT $ 120))) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (|PFO;klist| (SPADCALL |c| (QREFELT $ 53)) $))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 128))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))))) 

(SDEFUN |PFO;alglist1|
        ((|nc| UPUP) (|nva| |Vector| UPUP) (|nd| UPUP) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G345 NIL) (#2=#:G344 #3=(|List| (|Kernel| F))) (#4=#:G346 #3#)
          (#5=#:G349 NIL) (|f| NIL) (|l2| (|List| UPUP)) (|l1| (|List| UPUP)))
         (SEQ (LETT |l1| (SPADCALL |nva| (QREFELT $ 144)))
              (LETT |l2| (CONS |nc| (CONS |nd| |l1|)))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |f| NIL) (LETT #5# |l2|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #4# (|PFO;alglist2| |f| $))
                        (COND
                         (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 128))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|IdentityError| '|setUnion|)))))))) 

(SDEFUN |PFO;subst_mp_ni|
        ((|p| |SparseMultivariatePolynomial| R0 (|Kernel| F)) (|ni| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (CONS #'|PFO;subst_mp_ni!0| $) |p| (QREFELT $ 149))
          (QREFELT $ 121))
         (SPADCALL |ni|
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;subst_mp_ni!1| $) |p|
                              (QREFELT $ 149))
                    (QREFELT $ 121))
                   (QREFELT $ 151))
         (QREFELT $ 152))) 

(SDEFUN |PFO;subst_mp_ni!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 150)) (QREFELT $ 147))) 

(SDEFUN |PFO;subst_mp_ni!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 146)) (QREFELT $ 147))) 

(SDEFUN |PFO;subst_upup_ni| ((|upup| UPUP) (|ni| F) ($ UPUP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;subst_upup_ni!2| (VECTOR |ni| $)) |upup|
                         (QREFELT $ 159)))) 

(SDEFUN |PFO;subst_upup_ni!2| ((|a| NIL) ($$ NIL))
        (PROG ($ |ni|)
          (LETT $ (QREFELT $$ 1))
          (LETT |ni| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;subst_upup_ni!1| (VECTOR $ |ni|)) |a|
                             (QREFELT $ 157))))))) 

(SDEFUN |PFO;subst_upup_ni!1| ((|b| NIL) ($$ NIL))
        (PROG (|ni| $)
          (LETT |ni| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;subst_upup_ni!0| (VECTOR |ni| $)) |b|
                             (QREFELT $ 155))))))) 

(SDEFUN |PFO;subst_upup_ni!0| ((|c| NIL) ($$ NIL))
        (PROG ($ |ni|)
          (LETT $ (QREFELT $$ 1))
          (LETT |ni| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|PFO;subst_mp_ni| (SPADCALL |c| (QREFELT $ 153)) |ni| $)
                      (|PFO;subst_mp_ni| (SPADCALL |c| (QREFELT $ 118)) |ni| $)
                      (QREFELT $ 23)))))) 

(SDEFUN |PFO;handle_imaginary;FdR;33|
        ((|fd| |FiniteDivisor| F UP UPUP R)
         ($ |Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
          (|:| |n_div_denom| UPUP) (|:| |need_change| (|Boolean|))))
        (SPROG
         ((|nd| (UPUP)) (|nva| (|Vector| UPUP)) (#1=#:G564 NIL) (|vi| NIL)
          (#2=#:G563 NIL) (|n| (|Vector| R))
          (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)) (|nf| (UPUP))
          (|f| (UPUP)) (|ni| (|Expression| R0))
          (|p0| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |p0|
                (SPADCALL (SPADCALL (|spadConstant| $ 160) 2 (QREFELT $ 161))
                          (|spadConstant| $ 162) (QREFELT $ 163)))
          (LETT |ni| (SPADCALL |p0| (QREFELT $ 166)))
          (LETT |f| (SPADCALL (QREFELT $ 141)))
          (LETT |nf| (|PFO;subst_upup_ni| |f| |ni| $))
          (LETT |id| (SPADCALL |fd| (QREFELT $ 130)))
          (LETT |n| (SPADCALL |id| (QREFELT $ 132)))
          (LETT |nva|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |vi| NIL)
                       (LETT #1# (SPADCALL |n| (QREFELT $ 168))) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |vi| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (|PFO;subst_upup_ni|
                                 (SPADCALL |vi| (QREFELT $ 126)) |ni| $)
                                #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 169)))
          (LETT |nd|
                (|PFO;subst_upup_ni|
                 (SPADCALL
                  (SPADCALL (SPADCALL |id| (QREFELT $ 137)) (QREFELT $ 95))
                  (QREFELT $ 170))
                 |ni| $))
          (EXIT (VECTOR |nf| |nva| |nd| (SPADCALL |f| |nf| (QREFELT $ 171))))))) 

(SDEFUN |PFO;handle_imaginary;FdR;34|
        ((|fd| |FiniteDivisor| F UP UPUP R)
         ($ |Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
          (|:| |n_div_denom| UPUP) (|:| |need_change| (|Boolean|))))
        (SPROG
         ((|nva| (|Vector| UPUP)) (#1=#:G570 NIL) (|vi| NIL) (#2=#:G569 NIL)
          (|d| (UP)) (|n| (|Vector| R))
          (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ (LETT |id| (SPADCALL |fd| (QREFELT $ 130)))
              (LETT |n| (SPADCALL |id| (QREFELT $ 132)))
              (LETT |d| (SPADCALL |id| (QREFELT $ 137)))
              (LETT |nva|
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |vi| NIL)
                           (LETT #1# (SPADCALL |n| (QREFELT $ 168))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |vi| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |vi| (QREFELT $ 126))
                                         #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 169)))
              (EXIT
               (VECTOR (SPADCALL (QREFELT $ 141)) |nva|
                       (SPADCALL (SPADCALL |d| (QREFELT $ 95)) (QREFELT $ 170))
                       NIL))))) 

(SDEFUN |PFO;handle_imaginary;FdR;35|
        ((|fd| |FiniteDivisor| F UP UPUP R)
         ($ |Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
          (|:| |n_div_denom| UPUP) (|:| |need_change| (|Boolean|))))
        (SPROG
         ((|nva| (|Vector| UPUP)) (#1=#:G576 NIL) (|vi| NIL) (#2=#:G575 NIL)
          (|d| (UP)) (|n| (|Vector| R))
          (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ (LETT |id| (SPADCALL |fd| (QREFELT $ 130)))
              (LETT |n| (SPADCALL |id| (QREFELT $ 132)))
              (LETT |d| (SPADCALL |id| (QREFELT $ 137)))
              (LETT |nva|
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |vi| NIL)
                           (LETT #1# (SPADCALL |n| (QREFELT $ 168))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |vi| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |vi| (QREFELT $ 126))
                                         #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 169)))
              (EXIT
               (VECTOR (SPADCALL (QREFELT $ 141)) |nva|
                       (SPADCALL (SPADCALL |d| (QREFELT $ 95)) (QREFELT $ 170))
                       NIL))))) 

(SDEFUN |PFO;UPQ_to_UPF|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 31))) 

(SDEFUN |PFO;algcurve|
        ((|d| |FiniteDivisor| F UP UPUP R)
         (|rc| |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))
          (|:| |dfpoly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|k| |Kernel| F) ($ |NonNegativeInteger|))
        (SPROG
         ((|sae|
           (|Join|
            (|MonogenicAlgebra| |gf| (|SparseUnivariatePolynomial| |gf|))
            (CATEGORY |package|
             (IF (|has| |gf| (|Field|))
                 (IF (|has| |gf| (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|))))
          (|alpha| (|gf|)) (|m| (|SparseUnivariatePolynomial| |gf|))
          (|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|))))
          (|mm| #1=(|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|pp| (UPUP)) (|p| #2=(|PositiveInteger|))
          (|pr| (|Record| (|:| |prime| #2#) (|:| |poly| #1#)))
          (|dd|
           #3=(|SparseUnivariatePolynomial|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
          (|s| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|b2| (UP)) (|b| #3#)
          (|h|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|hh| (R)) (|mn| (|Integer|)) (|n| (|Vector| R))
          (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|k1| (|Kernel| F)) (|mp| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |k1|
                (SEQ (LETT |mp| (SPADCALL |k| (QREFELT $ 174)))
                     (EXIT
                      (COND
                       ((SPADCALL (CONS #'|PFO;algcurve!0| $)
                                  (SPADCALL |mp| (QREFELT $ 177))
                                  (QREFELT $ 179))
                        |k|)
                       ((|HasCategory| (QREFELT $ 7)
                                       '(|AlgebraicallyClosedField|))
                        (|SPADfirst|
                         (SPADCALL
                          (SPADCALL (|PFO;UPQ_to_UPF| (QVELT |rc| 2) $)
                                    (QREFELT $ 180))
                          (QREFELT $ 181))))
                       (#4='T (|error| "cannot reduce root"))))))
          (LETT |mn|
                (SPADCALL
                 (LETT |n|
                       (SPADCALL
                        (LETT |i|
                              (SPADCALL (SPADCALL |d| (QREFELT $ 130))
                                        (QREFELT $ 182)))
                        (QREFELT $ 132)))
                 (QREFELT $ 138)))
          (LETT |h|
                (|PFO;kpmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |n| (+ |mn| 1) (QREFELT $ 183)))
                  (QREFELT $ 126))
                 |k| $))
          (LETT |b2|
                (SPADCALL
                 (|PFO;raise2|
                  (LETT |b|
                        (|PFO;krmod|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |mn| (QREFELT $ 183))
                                    (QREFELT $ 184))
                          (QREFELT $ 53))
                         |k| $))
                  |k1| $)
                 (QREFELT $ 185)))
          (LETT |s|
                (|PFO;kqmod|
                 (SPADCALL
                  (SPADCALL
                   (QCAR
                    (SPADCALL
                     (|PFO;raise2|
                      (|PFO;krmod|
                       (SPADCALL (SPADCALL |hh| (QREFELT $ 186))
                                 (QREFELT $ 53))
                       |k| $)
                      |k1| $)
                     |b2| (QREFELT $ 188)))
                   (QREFELT $ 185))
                  |b2| (QREFELT $ 189))
                 |k1| $))
          (LETT |pr|
                (|PFO;kgetGoodPrime| |rc| |s| |h| |b|
                 (LETT |dd| (|PFO;krmod| (SPADCALL |i| (QREFELT $ 137)) |k| $))
                 $))
          (LETT |p| (QCAR |pr|))
          (LETT |pp| (|PFO;UP32UPUP| (QVELT |rc| 0) |k| $))
          (LETT |mm| (QCDR |pr|)) (LETT |gf| (|InnerPrimeField| |p|))
          (LETT |m|
                (SPADCALL (CONS #'|PFO;algcurve!1| (VECTOR |gf| $)) |mm|
                          (|compiledLookupCheck| '|map|
                                                 (LIST
                                                  (LIST
                                                   '|SparseUnivariatePolynomial|
                                                   (|devaluate| |gf|))
                                                  (LIST '|Mapping|
                                                        (|devaluate| |gf|)
                                                        (LIST '|Fraction|
                                                              (LIST
                                                               '|Integer|)))
                                                  (LIST
                                                   '|SparseUnivariatePolynomial|
                                                   (LIST '|Fraction|
                                                         (LIST '|Integer|))))
                                                 (|SparseUnivariatePolynomialFunctions2|
                                                  (|Fraction| (|Integer|))
                                                  |gf|))))
          (EXIT
           (COND
            ((EQL
              (SPADCALL |m|
                        (|compiledLookupCheck| '|degree|
                                               (LIST
                                                (LIST '|NonNegativeInteger|)
                                                '$)
                                               (|SparseUnivariatePolynomial|
                                                |gf|)))
              1)
             (SEQ
              (LETT |alpha|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |m| 0
                                (|compiledLookupCheck| '|coefficient|
                                                       (LIST (|devaluate| |gf|)
                                                             '$
                                                             (LIST
                                                              '|NonNegativeInteger|))
                                                       (|SparseUnivariatePolynomial|
                                                        |gf|)))
                      (SPADCALL |m|
                                (|compiledLookupCheck| '|leadingCoefficient|
                                                       (LIST (|devaluate| |gf|)
                                                             '$)
                                                       (|SparseUnivariatePolynomial|
                                                        |gf|)))
                      (|compiledLookupCheck| '/ (LIST '$ '$ '$) |gf|))
                     (|compiledLookupCheck| '- (LIST '$ '$) |gf|)))
              (EXIT
               (SPADCALL |d| |pp|
                         (CONS #'|PFO;algcurve!3| (VECTOR |alpha| |k| $ |gf|))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (|devaluate| (ELT $ 7))
                                                       (|devaluate| (ELT $ 8))
                                                       (|devaluate| (ELT $ 9))
                                                       (|devaluate|
                                                        (ELT $ 10)))
                                                 (|devaluate| (ELT $ 9))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |gf|)
                                                       (|devaluate|
                                                        (ELT $ 7))))
                                                (|ReducedDivisor| (ELT $ 7)
                                                                  (ELT $ 8)
                                                                  (ELT $ 9)
                                                                  (ELT $ 10)
                                                                  |gf|))))))
            (#4#
             (SEQ
              (LETT |sae|
                    (|SimpleAlgebraicExtension| |gf|
                                                (|SparseUnivariatePolynomial|
                                                 |gf|)
                                                |m|))
              (EXIT
               (SPADCALL |d| |pp|
                         (CONS #'|PFO;algcurve!5| (VECTOR |sae| |k| $ |gf|))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (|devaluate| (ELT $ 7))
                                                       (|devaluate| (ELT $ 8))
                                                       (|devaluate| (ELT $ 9))
                                                       (|devaluate|
                                                        (ELT $ 10)))
                                                 (|devaluate| (ELT $ 9))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |sae|)
                                                       (|devaluate|
                                                        (ELT $ 7))))
                                                (|ReducedDivisor| (ELT $ 7)
                                                                  (ELT $ 8)
                                                                  (ELT $ 9)
                                                                  (ELT $ 10)
                                                                  |sae|))))))))))) 

(SDEFUN |PFO;algcurve!5| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| $ |k| |sae|)
          (LETT |gf| (QREFELT $$ 3))
          (LETT $ (QREFELT $$ 2))
          (LETT |k| (QREFELT $$ 1))
          (LETT |sae| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;algcurve!4| (VECTOR |gf| $))
                              (|PFO;kqmod| |z1| |k| $)
                              (|compiledLookupCheck| '|map|
                                                     (LIST
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate| |gf|))
                                                      (LIST '|Mapping|
                                                            (|devaluate| |gf|)
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|Integer|)))
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (LIST '|Fraction|
                                                             (LIST
                                                              '|Integer|))))
                                                     (|SparseUnivariatePolynomialFunctions2|
                                                      (|Fraction| (|Integer|))
                                                      |gf|)))
                    (|compiledLookupCheck| '|reduce|
                                           (LIST '$
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| |gf|)))
                                           |sae|))))))) 

(SDEFUN |PFO;algcurve!4| ((|q1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |q1| (QREFELT $ 20))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (SPADCALL (SPADCALL |q1| (QREFELT $ 22))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (|compiledLookupCheck| '/ (LIST '$ '$ '$) |gf|)))))) 

(SDEFUN |PFO;algcurve!3| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| $ |k| |alpha|)
          (LETT |gf| (QREFELT $$ 3))
          (LETT $ (QREFELT $$ 2))
          (LETT |k| (QREFELT $$ 1))
          (LETT |alpha| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;algcurve!2| (VECTOR |gf| $))
                              (|PFO;kqmod| |z1| |k| $)
                              (|compiledLookupCheck| '|map|
                                                     (LIST
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate| |gf|))
                                                      (LIST '|Mapping|
                                                            (|devaluate| |gf|)
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|Integer|)))
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (LIST '|Fraction|
                                                             (LIST
                                                              '|Integer|))))
                                                     (|SparseUnivariatePolynomialFunctions2|
                                                      (|Fraction| (|Integer|))
                                                      |gf|)))
                    |alpha|
                    (|compiledLookupCheck| '|elt|
                                           (LIST (|devaluate| |gf|) '$
                                                 (|devaluate| |gf|))
                                           (|SparseUnivariatePolynomial|
                                            |gf|)))))))) 

(SDEFUN |PFO;algcurve!2| ((|q1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |q1| (QREFELT $ 20))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (SPADCALL (SPADCALL |q1| (QREFELT $ 22))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (|compiledLookupCheck| '/ (LIST '$ '$ '$) |gf|)))))) 

(SDEFUN |PFO;algcurve!1| ((|z1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 115))
                      (|compiledLookupCheck| '|coerce|
                                             (LIST '$ (LIST '|Integer|))
                                             |gf|)))))) 

(SDEFUN |PFO;algcurve!0| ((|x| NIL) ($ NIL))
        (QEQCAR (SPADCALL |x| (QREFELT $ 176)) 0)) 

(SDEFUN |PFO;ratcurve|
        ((|d| |FiniteDivisor| F UP UPUP R)
         (|rc| |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|Fraction|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|)))
         ($ |NonNegativeInteger|))
        (SPROG
         ((|m| #1=(|NonNegativeInteger|)) (|n| #1#) (|p| (|PositiveInteger|))
          (|pp| (UPUP)) (|bad| (|Integer|)) (|r| (|Fraction| (|Integer|)))
          (|bd| (|Record| (|:| |den| (|Integer|)) (|:| |gcdnum| (|Integer|))))
          (|s| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|b| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|h|
           (|SparseUnivariatePolynomial|
            (|Fraction|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|hh| (R)) (|mn| (|Integer|)) (|nm| (|Vector| R))
          (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ
          (LETT |mn|
                (SPADCALL
                 (LETT |nm|
                       (SPADCALL
                        (LETT |i|
                              (SPADCALL (SPADCALL |d| (QREFELT $ 130))
                                        (QREFELT $ 182)))
                        (QREFELT $ 132)))
                 (QREFELT $ 138)))
          (LETT |h|
                (|PFO;pmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |nm| (+ |mn| 1) (QREFELT $ 183)))
                  (QREFELT $ 126))
                 $))
          (LETT |b|
                (|PFO;rmod|
                 (SPADCALL
                  (SPADCALL (SPADCALL |nm| |mn| (QREFELT $ 183))
                            (QREFELT $ 184))
                  (QREFELT $ 53))
                 $))
          (LETT |s|
                (QCAR
                 (SPADCALL
                  (|PFO;rmod|
                   (SPADCALL (SPADCALL |hh| (QREFELT $ 186)) (QREFELT $ 53)) $)
                  |b| (QREFELT $ 192))))
          (LETT |bd|
                (SPADCALL (|PFO;rmod| (SPADCALL |i| (QREFELT $ 137)) $)
                          (QREFELT $ 78)))
          (LETT |r| (SPADCALL |s| |b| (QREFELT $ 193)))
          (LETT |bad|
                (SPADCALL
                 (LIST (SPADCALL (SPADCALL (QREFELT $ 195)) (QREFELT $ 196))
                       (QCDR |rc|) (SPADCALL |r| (QREFELT $ 20))
                       (SPADCALL |r| (QREFELT $ 22))
                       (* (QCAR |bd|) (QCDR |bd|))
                       (SPADCALL |h| (QREFELT $ 197)))
                 (QREFELT $ 83)))
          (LETT |pp| (|PFO;Q2UPUP| (QCAR |rc|) $))
          (LETT |n|
                (|PFO;rat| |pp| |d| (LETT |p| (SPADCALL |bad| (QREFELT $ 198)))
                 $))
          (EXIT
           (COND ((EQL |n| 1) |n|)
                 (#2='T
                  (SEQ
                   (LETT |m|
                         (|PFO;rat| |pp| |d|
                          (SPADCALL (SPADCALL |p| |bad| (QREFELT $ 199))
                                    (QREFELT $ 198))
                          $))
                   (EXIT (COND ((EQL |n| |m|) |n|) (#2# 0)))))))))) 

(SDEFUN |PFO;rat|
        ((|pp| UPUP) (|d| |FiniteDivisor| F UP UPUP R) (|p| |PositiveInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|)))))
         (SEQ (LETT |gf| (|InnerPrimeField| |p|))
              (EXIT
               (SPADCALL |d| |pp| (CONS #'|PFO;rat!0| (VECTOR |gf| $))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (|devaluate| (ELT $ 7))
                                                       (|devaluate| (ELT $ 8))
                                                       (|devaluate| (ELT $ 9))
                                                       (|devaluate|
                                                        (ELT $ 10)))
                                                 (|devaluate| (ELT $ 9))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |gf|)
                                                       (|devaluate|
                                                        (ELT $ 7))))
                                                (|ReducedDivisor| (ELT $ 7)
                                                                  (ELT $ 8)
                                                                  (ELT $ 9)
                                                                  (ELT $ 10)
                                                                  |gf|))))))) 

(SDEFUN |PFO;rat!0| ((|q1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|qq| NIL))
                   (SEQ (LETT |qq| (|PFO;qmod| |q1| $))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |qq| (QREFELT $ 20))
                                    (|compiledLookupCheck| '|coerce|
                                                           (LIST '$
                                                                 (LIST
                                                                  '|Integer|))
                                                           |gf|))
                          (SPADCALL (SPADCALL |qq| (QREFELT $ 22))
                                    (|compiledLookupCheck| '|coerce|
                                                           (LIST '$
                                                                 (LIST
                                                                  '|Integer|))
                                                           |gf|))
                          (|compiledLookupCheck| '/ (LIST '$ '$ '$)
                                                 |gf|))))))))) 

(SDEFUN |PFO;evalup|
        ((|upup| UPUP) (|la| |List| (|Kernel| F)) (|lrhs| |List| F) ($ UPUP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;evalup!2| (VECTOR $ |lrhs| |la|)) |upup|
                         (QREFELT $ 159)))) 

(SDEFUN |PFO;evalup!2| ((|a| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2))
          (LETT |lrhs| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!1| (VECTOR |la| |lrhs| $)) |a|
                             (QREFELT $ 157))))))) 

(SDEFUN |PFO;evalup!1| ((|b| NIL) ($$ NIL))
        (PROG ($ |lrhs| |la|)
          (LETT $ (QREFELT $$ 2))
          (LETT |lrhs| (QREFELT $$ 1))
          (LETT |la| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!0| (VECTOR $ |lrhs| |la|)) |b|
                             (QREFELT $ 155))))))) 

(SDEFUN |PFO;evalup!0| ((|c| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2))
          (LETT |lrhs| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |la| |lrhs| (QREFELT $ 200)))))) 

(SDEFUN |PFO;simplifyCoeffs;RLNni;41|
        ((|irec| |Record| (|:| |ncurve| UPUP)
          (|:| |n_div_numer| (|Vector| UPUP)) (|:| |n_div_denom| UPUP)
          . #1=((|:| |need_change| (|Boolean|))))
         (|la| |List| (|Kernel| F)) ($ |NonNegativeInteger|))
        (SPROG
         ((|ndiv| (|nFD|)) (|va| (|Vector| |nR|)) (#2=#:G631 NIL)
          (#3=#:G633 NIL) (|ni| NIL) (#4=#:G632 NIL) (|nd| (|nR|))
          (|nPFO|
           (CATEGORY |package|
            (SIGNATURE |order|
             ((|Union| (|NonNegativeInteger|) "failed")
              (|FiniteDivisor| F UP UPUP |nR|)))
            (SIGNATURE |torsion?|
             ((|Boolean|) (|FiniteDivisor| F UP UPUP |nR|)))
            (SIGNATURE |torsionIfCan|
             ((|Union|
               (|Record| (|:| |order| (|NonNegativeInteger|))
                         (|:| |function| |nR|))
               "failed")
              (|FiniteDivisor| F UP UPUP |nR|)))
            (SIGNATURE |cmult|
             ((|SparseMultivariatePolynomial| R0 (|Kernel| F))
              (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))))
            (SIGNATURE |possibleOrder|
             ((|NonNegativeInteger|) (|FiniteDivisor| F UP UPUP |nR|)))
            (SIGNATURE |handle_imaginary|
             ((|Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
                        (|:| |n_div_denom| UPUP)
                        (|:| |need_change| (|Boolean|)))
              (|FiniteDivisor| F UP UPUP |nR|)))
            (IF (|has| R0 (|CharacteristicZero|))
                (IF (|has| F (|AlgebraicallyClosedField|))
                    (SIGNATURE |simplifyCoeffs|
                     ((|NonNegativeInteger|)
                      (|Record| (|:| |ncurve| UPUP)
                                (|:| |n_div_numer| (|Vector| UPUP))
                                (|:| |n_div_denom| UPUP) . #1#)
                      (|List| (|Kernel| F))))
                    |noBranch|)
                |noBranch|)))
          (|nFR|
           (|Join| (|Group|)
                   (CATEGORY |domain| (SIGNATURE |ideal| ($ (|Vector| |nR|)))
                    (SIGNATURE |basis| ((|Vector| |nR|) $))
                    (SIGNATURE |norm| ((|Fraction| UP) $))
                    (SIGNATURE |numer| ((|Vector| |nR|) $))
                    (SIGNATURE |denom| (UP $)) (SIGNATURE |minimize| ($ $))
                    (SIGNATURE |randomLC|
                     (|nR| (|NonNegativeInteger|) (|Vector| |nR|))))))
          (|nFD|
           (|Join| (|FiniteDivisorCategory| F UP UPUP |nR|)
                   (CATEGORY |domain|
                    (SIGNATURE |finiteBasis| ((|Vector| |nR|) $))
                    (SIGNATURE |lSpaceBasis| ((|Vector| |nR|) $)))))
          (|nR|
           (|Join| (|FunctionFieldCategory| F UP UPUP)
                   (CATEGORY |package|
                    (SIGNATURE |knownInfBasis|
                     ((|Void|) (|NonNegativeInteger|))))))
          (|nf| (UPUP)) (|lrhs| (|List| F)) (#5=#:G630 NIL) (|pol| NIL)
          (#6=#:G629 NIL) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |poly| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (#7=#:G628 NIL) (|k| NIL) (#8=#:G627 NIL)
          (|lp| (|List| (|SparseUnivariatePolynomial| F))) (#9=#:G626 NIL)
          (#10=#:G625 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #10# NIL)
                 (SEQ (LETT |k| NIL) (LETT #9# |la|) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |k| (CAR #9#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10#
                              (CONS (SPADCALL |k| (QREFELT $ 174)) #10#))))
                      (LETT #9# (CDR #9#)) (GO G190) G191
                      (EXIT (NREVERSE #10#)))))
          (LETT |rec|
                (SPADCALL
                 (PROGN
                  (LETT #8# NIL)
                  (SEQ (LETT |k| NIL) (LETT #7# |la|) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #8# (CONS (SPADCALL |k| (QREFELT $ 33)) #8#))))
                       (LETT #7# (CDR #7#)) (GO G190) G191
                       (EXIT (NREVERSE #8#))))
                 (QREFELT $ 203)))
          (LETT |y| (SPADCALL (QVELT |rec| 2) (QREFELT $ 180)))
          (LETT |lrhs|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |pol| NIL) (LETT #5# (QVELT |rec| 1)) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |pol| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL |pol| |y| (QREFELT $ 34)) #6#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (LETT |nf| (|PFO;evalup| (QVELT |irec| 0) |la| |lrhs| $))
          (LETT |nR|
                (|AlgebraicFunctionField| (QREFELT $ 7) (QREFELT $ 8)
                                          (QREFELT $ 9) |nf|))
          (LETT |nFD|
                (|FiniteDivisor| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 9)
                                 |nR|))
          (LETT |nFR|
                (|FractionalIdeal| (QREFELT $ 8) (|Fraction| (QREFELT $ 8))
                                   (QREFELT $ 9) |nR|))
          (LETT |nPFO|
                (|PointsOfFiniteOrder| (QREFELT $ 6) (QREFELT $ 7)
                                       (QREFELT $ 8) (QREFELT $ 9) |nR|))
          (LETT |nd|
                (SPADCALL (|PFO;evalup| (QVELT |irec| 2) |la| |lrhs| $)
                          (|compiledLookupCheck| '|reduce|
                                                 (LIST '$
                                                       (|devaluate| (ELT $ 9)))
                                                 |nR|)))
          (LETT |va|
                (PROGN
                 (LETT #4#
                       (GETREFV
                        (SIZE
                         #11=(SPADCALL (QVELT |irec| 1) (QREFELT $ 144)))))
                 (SEQ (LETT |ni| NIL) (LETT #3# #11#) (LETT #2# 0) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |ni| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #4# #2#
                                (SPADCALL
                                 (SPADCALL (|PFO;evalup| |ni| |la| |lrhs| $)
                                           (|compiledLookupCheck| '|reduce|
                                                                  (LIST '$
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              9)))
                                                                  |nR|))
                                 |nd|
                                 (|compiledLookupCheck| '/ (LIST '$ '$ '$)
                                                        |nR|)))))
                      (LETT #2# (PROG1 (|inc_SI| #2#) (LETT #3# (CDR #3#))))
                      (GO G190) G191 (EXIT NIL))
                 #4#))
          (LETT |ndiv|
                (SPADCALL
                 (SPADCALL |va|
                           (|compiledLookupCheck| '|ideal|
                                                  (LIST '$
                                                        (LIST '|Vector|
                                                              (|devaluate|
                                                               |nR|)))
                                                  |nFR|))
                 (|compiledLookupCheck| '|divisor|
                                        (LIST '$
                                              (LIST '|FractionalIdeal|
                                                    (|devaluate| (ELT $ 8))
                                                    (LIST '|Fraction|
                                                          (|devaluate|
                                                           (ELT $ 8)))
                                                    (|devaluate| (ELT $ 9))
                                                    (|devaluate| |nR|)))
                                        |nFD|)))
          (EXIT
           (SPADCALL |ndiv|
                     (|compiledLookupCheck| '|possibleOrder|
                                            (LIST (LIST '|NonNegativeInteger|)
                                                  (LIST '|FiniteDivisor|
                                                        (|devaluate| (ELT $ 7))
                                                        (|devaluate| (ELT $ 8))
                                                        (|devaluate| (ELT $ 9))
                                                        (|devaluate| |nR|)))
                                            |nPFO|)))))) 

(SDEFUN |PFO;possibleOrder;FdNni;42|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |NonNegativeInteger|))
        (SPROG
         ((|va| (|Vector| R)) (#1=#:G649 NIL) (#2=#:G651 NIL) (|ni| NIL)
          (#3=#:G650 NIL) (|nden| (R)) (#4=#:G648 NIL)
          (|la| (|List| (|Kernel| F)))
          (|irec|
           (|Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
                     (|:| |n_div_denom| UPUP)
                     (|:| |need_change| (|Boolean|)))))
         (SEQ
          (EXIT
           (COND
            ((OR (ZEROP (SPADCALL (QREFELT $ 205)))
                 (EQL
                  (QVSIZE
                   (SPADCALL (SPADCALL |d| (QREFELT $ 130)) (QREFELT $ 132)))
                  1))
             1)
            ('T
             (SEQ
              (LETT |d|
                    (SPADCALL (QCAR (SPADCALL |d| (QREFELT $ 207)))
                              (QREFELT $ 208)))
              (LETT |irec| (SPADCALL |d| (QREFELT $ 173)))
              (LETT |la|
                    (|PFO;alglist1| (QVELT |irec| 0) (QVELT |irec| 1)
                     (QVELT |irec| 2) $))
              (EXIT
               (COND ((NULL |la|) (|PFO;ratcurve| |d| (|PFO;selIntegers| $) $))
                     (#5='T
                      (SEQ
                       (COND
                        ((NULL (CDR |la|))
                         (COND
                          ((QVELT |irec| 3)
                           (EXIT
                            (SEQ
                             (COND
                              ((|HasCategory| (QREFELT $ 6)
                                              '(|CharacteristicZero|))
                               (COND
                                ((|HasCategory| (QREFELT $ 7)
                                                '(|AlgebraicallyClosedField|))
                                 (PROGN
                                  (LETT #4#
                                        (SPADCALL |irec| |la| (QREFELT $ 204)))
                                  (GO #6=#:G647))))))
                             (EXIT
                              (|error|
                               #7="PFO::possibleOrder: more than 1 algebraic constant")))))))
                        (#5#
                         (EXIT
                          (SEQ
                           (COND
                            ((|HasCategory| (QREFELT $ 6)
                                            '(|CharacteristicZero|))
                             (COND
                              ((|HasCategory| (QREFELT $ 7)
                                              '(|AlgebraicallyClosedField|))
                               (PROGN
                                (LETT #4#
                                      (SPADCALL |irec| |la| (QREFELT $ 204)))
                                (GO #6#))))))
                           (EXIT (|error| #7#))))))
                       (LETT |nden|
                             (SPADCALL (QVELT |irec| 2) (QREFELT $ 209)))
                       (LETT |va|
                             (PROGN
                              (LETT #3#
                                    (GETREFV
                                     (SIZE
                                      #8=(SPADCALL (QVELT |irec| 1)
                                                   (QREFELT $ 144)))))
                              (SEQ (LETT |ni| NIL) (LETT #2# #8#) (LETT #1# 0)
                                   G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |ni| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SETELT #3# #1#
                                             (SPADCALL
                                              (SPADCALL |ni| (QREFELT $ 209))
                                              |nden| (QREFELT $ 210)))))
                                   (LETT #1#
                                         (PROG1 (|inc_SI| #1#)
                                           (LETT #2# (CDR #2#))))
                                   (GO G190) G191 (EXIT NIL))
                              #3#))
                       (LETT |d|
                             (SPADCALL (SPADCALL |va| (QREFELT $ 211))
                                       (QREFELT $ 208)))
                       (EXIT
                        (|PFO;algcurve| |d|
                         (|PFO;selectIntegers| (|SPADfirst| |la|) $)
                         (|SPADfirst| |la|) $))))))))))
          #6# (EXIT #4#)))) 

(SDEFUN |PFO;selIntegers|
        (($ |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|Fraction|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))))
        (SPROG
         ((#1=#:G657 NIL) (|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|Fraction|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|f| (UPUP)))
         (SEQ
          (EXIT
           (SEQ (LETT |f| (SPADCALL (QREFELT $ 141))) (LETT |n| (EXPT 10 6))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (SPADCALL |n| (QREFELT $ 213))
                           (LETT |d|
                                 (SPADCALL
                                  (LETT |r|
                                        (SPADCALL (|PFO;pmod| |f| $)
                                                  (QREFELT $ 214)))
                                  (QREFELT $ 215)))
                           (EXIT
                            (COND
                             ((NULL (ZEROP |d|))
                              (PROGN
                               (LETT #1# (CONS |r| |d|))
                               (GO #2=#:G656))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |PFO;selectIntegers|
        ((|k| |Kernel| F)
         ($ |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))
          (|:| |dfpoly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPROG
         ((#1=#:G666 NIL) (|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|p| (|SparseUnivariatePolynomial| F)) (|g| (UPUP))
          (|f| (UPUP)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g| (|PFO;polyred| (LETT |f| (SPADCALL (QREFELT $ 141))) $))
            (LETT |p| (SPADCALL |k| (QREFELT $ 174))) (LETT |n| (EXPT 10 6))
            (EXIT
             (SEQ G190 NIL
                  (SEQ (SPADCALL |n| (QREFELT $ 213))
                       (LETT |d|
                             (|PFO;doubleDisc|
                              (LETT |r| (|PFO;kpmod| |g| |k| $)) $))
                       (COND
                        ((OR (ZEROP |d|) (|PFO;notIrr?| (|PFO;fmod| |p| $) $))
                         (EXIT "iterate")))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (VECTOR |r| |d|
                                       (QCAR
                                        (SPADCALL (|PFO;fmod| |p| $)
                                                  (QREFELT $ 218)))))
                         (GO #2=#:G665))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |PFO;order;FdU;45|
        ((|d| |FiniteDivisor| F UP UPUP R)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND
                ((OR
                  (ZEROP
                   (LETT |n|
                         (SPADCALL (LETT |d| (SPADCALL |d| (QREFELT $ 84)))
                                   (QREFELT $ 85))))
                  (NULL
                   (SPADCALL
                    (SPADCALL (SPADCALL |n| |d| (QREFELT $ 86)) (QREFELT $ 84))
                    (QREFELT $ 219))))
                 (CONS 1 "failed"))
                ('T (CONS 0 |n|))))) 

(SDEFUN |PFO;kgetGoodPrime|
        ((|rec| |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))
          (|:| |dfpoly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|res| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|b| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         ($ |Record| (|:| |prime| (|PositiveInteger|))
          (|:| |poly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPROG
         ((#1=#:G676 NIL) (|p| (|PositiveInteger|)) (#2=#:G678 NIL)
          (|u|
           (|Union| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
                    #3="failed"))
          (#4=#:G674 NIL))
         (SEQ
          (LETT |p|
                (PROG1
                    (LETT #4#
                          (SPADCALL (SPADCALL (QREFELT $ 195))
                                    (QREFELT $ 221)))
                  (|check_subtype2| (> #4# 0) '(|PositiveInteger|) '(|Integer|)
                                    #4#)))
          (SEQ G190
               (COND
                ((NULL
                  (QEQCAR
                   (LETT |u| (|PFO;goodRed| |rec| |res| |h| |b| |d| |p| $)) 1))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |p|
                       (PROG1 (LETT #2# (SPADCALL |p| (QREFELT $ 221)))
                         (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                           '(|Integer|) #2#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS |p|
                 (PROG2 (LETT #1# |u|)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial|
                                    (|Fraction| (|Integer|)))
                                   (|Union|
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction| (|Integer|)))
                                    #3#)
                                   #1#))))))) 

(SDEFUN |PFO;goodRed|
        ((|rec| |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))
          (|:| |dfpoly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|res| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|b| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|p| |PositiveInteger|)
         ($ |Union| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
          "failed"))
        (SPROG
         ((|md| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|mdg| (|SparseUnivariatePolynomial| |gf|)) (#1=#:G698 NIL)
          (|ff| NIL) (|l| (|List| (|SparseUnivariatePolynomial| |gf|)))
          (#2=#:G697 NIL) (|f| NIL) (#3=#:G696 NIL)
          (|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|)))))
         (SEQ
          (COND ((ZEROP (REM (QVELT |rec| 1) |p|)) (CONS 1 "failed"))
                (#4='T
                 (SEQ (LETT |gf| (|InnerPrimeField| |p|))
                      (LETT |l|
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |f| NIL)
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (CONS #'|PFO;goodRed!0|
                                                 (VECTOR |gf| $))
                                           (QVELT |rec| 2)
                                           (|compiledLookupCheck| '|map|
                                                                  (LIST
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     |gf|))
                                                                   (LIST
                                                                    '|Mapping|
                                                                    (|devaluate|
                                                                     |gf|)
                                                                    (LIST
                                                                     '|Fraction|
                                                                     (LIST
                                                                      '|Integer|)))
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (LIST
                                                                     '|Fraction|
                                                                     (LIST
                                                                      '|Integer|))))
                                                                  (|SparseUnivariatePolynomialFunctions2|
                                                                   (|Fraction|
                                                                    (|Integer|))
                                                                   |gf|)))
                                          (|compiledLookupCheck| '|factor|
                                                                 (LIST
                                                                  (LIST
                                                                   '|Factored|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     |gf|)))
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    |gf|)))
                                                                 (|DistinctDegreeFactorize|
                                                                  |gf|
                                                                  (|SparseUnivariatePolynomial|
                                                                   |gf|))))
                                         (|compiledLookupCheck| '|factorList|
                                                                (LIST
                                                                 (LIST '|List|
                                                                       (LIST
                                                                        '|Record|
                                                                        (LIST
                                                                         '|:|
                                                                         '|flag|
                                                                         (LIST
                                                                          '|Union|
                                                                          '"nil"
                                                                          '"sqfr"
                                                                          '"irred"
                                                                          '"prime"))
                                                                        (LIST
                                                                         '|:|
                                                                         '|factor|
                                                                         (LIST
                                                                          '|SparseUnivariatePolynomial|
                                                                          (|devaluate|
                                                                           |gf|)))
                                                                        (LIST
                                                                         '|:|
                                                                         '|exponent|
                                                                         (LIST
                                                                          '|NonNegativeInteger|))))
                                                                 '$)
                                                                (|Factored|
                                                                 (|SparseUnivariatePolynomial|
                                                                  |gf|)))))
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |f| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL (QVELT |f| 2) 1)
                                      (LETT #3# (CONS (QVELT |f| 1) #3#))))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#)))))
                      (EXIT
                       (COND ((NULL |l|) (CONS 1 "failed"))
                             (#4#
                              (SEQ (LETT |mdg| (|SPADfirst| |l|))
                                   (SEQ (LETT |ff| NIL) (LETT #1# (CDR |l|))
                                        G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |ff| (CAR #1#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((<
                                             (SPADCALL |ff|
                                                       (|compiledLookupCheck|
                                                        '|degree|
                                                        (LIST
                                                         (LIST
                                                          '|NonNegativeInteger|)
                                                         '$)
                                                        (|SparseUnivariatePolynomial|
                                                         |gf|)))
                                             (SPADCALL |mdg|
                                                       (|compiledLookupCheck|
                                                        '|degree|
                                                        (LIST
                                                         (LIST
                                                          '|NonNegativeInteger|)
                                                         '$)
                                                        (|SparseUnivariatePolynomial|
                                                         |gf|))))
                                            (LETT |mdg| |ff|)))))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT NIL))
                                   (LETT |md|
                                         (SPADCALL
                                          (CONS #'|PFO;goodRed!1|
                                                (VECTOR $ |gf|))
                                          |mdg|
                                          (|compiledLookupCheck| '|map|
                                                                 (LIST
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (LIST
                                                                    '|Fraction|
                                                                    (LIST
                                                                     '|Integer|)))
                                                                  (LIST
                                                                   '|Mapping|
                                                                   (LIST
                                                                    '|Fraction|
                                                                    (LIST
                                                                     '|Integer|))
                                                                   (|devaluate|
                                                                    |gf|))
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    |gf|)))
                                                                 (|SparseUnivariatePolynomialFunctions2|
                                                                  |gf|
                                                                  (|Fraction|
                                                                   (|Integer|))))))
                                   (EXIT
                                    (COND
                                     ((|PFO;good?| |res| |h| |b| |d| |p| |md|
                                       $)
                                      (CONS 0 |md|))
                                     (#4# (CONS 1 "failed")))))))))))))) 

(SDEFUN |PFO;goodRed!1| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| $)
          (LETT |gf| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |z1|
                       (|compiledLookupCheck| '|convert|
                                              (LIST (LIST '|Integer|) '$)
                                              |gf|))
             (QREFELT $ 222)))))) 

(SDEFUN |PFO;goodRed!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 115))
                      (|compiledLookupCheck| '|coerce|
                                             (LIST '$ (LIST '|Integer|))
                                             |gf|)))))) 

(SDEFUN |PFO;good?|
        ((|res| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|b| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|p| |PositiveInteger|)
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPROG
         ((|bd| (|Record| (|:| |den| (|Integer|)) (|:| |gcdnum| (|Integer|)))))
         (SEQ
          (LETT |bd|
                (SPADCALL (SPADCALL |res| |m| (QREFELT $ 75)) (QREFELT $ 78)))
          (EXIT
           (COND
            ((OR (ZEROP (REM (QCAR |bd|) |p|))
                 (OR (ZEROP (REM (QCDR |bd|) |p|))
                     (OR (ZEROP (REM (|PFO;kbadBadNum| |b| |m| $) |p|))
                         (ZEROP (REM (|PFO;kbadBadNum| |d| |m| $) |p|)))))
             NIL)
            ('T (NULL (ZEROP (REM (|PFO;kbad3Num| |h| |m| $) |p|))))))))) 

(DECLAIM (NOTINLINE |PointsOfFiniteOrder;|)) 

(DEFUN |PointsOfFiniteOrder| (&REST #1=#:G706)
  (SPROG NIL
         (PROG (#2=#:G707)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PointsOfFiniteOrder|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PointsOfFiniteOrder;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PointsOfFiniteOrder|)))))))))) 

(DEFUN |PointsOfFiniteOrder;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|PointsOfFiniteOrder| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT $ (GETREFV 223))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|AlgebraicallyClosedField|)))))))
    (|haddProp| |$ConstructorCache| '|PointsOfFiniteOrder|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 '|%alg|)
    (QSETREFV $ 12 (|FunctionSpaceReduce| |#1| |#2|))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (QSETREFV $ 102 (CONS (|dispatchFunction| |PFO;cmult;LSmp;21|) $)))
     ('T (QSETREFV $ 102 (CONS (|dispatchFunction| |PFO;cmult;LSmp;22|) $))))
    (COND
     ((|domainEqual| |#1| (|Complex| (|Integer|)))
      (COND
       ((|domainEqual| |#2| (|Expression| |#1|))
        (PROGN
         (QSETREFV $ 173
                   (CONS (|dispatchFunction| |PFO;handle_imaginary;FdR;33|)
                         $))))
       ('T
        (QSETREFV $ 173
                  (CONS (|dispatchFunction| |PFO;handle_imaginary;FdR;34|)
                        $)))))
     ('T
      (QSETREFV $ 173
                (CONS (|dispatchFunction| |PFO;handle_imaginary;FdR;35|) $))))
    (COND
     ((|HasCategory| |#1| '(|CharacteristicZero|))
      (COND
       ((|HasCategory| |#2| '(|AlgebraicallyClosedField|))
        (QSETREFV $ 204
                  (CONS (|dispatchFunction| |PFO;simplifyCoeffs;RLNni;41|)
                        $))))))
    $))) 

(MAKEPROP '|PointsOfFiniteOrder| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) 'ALGOP '|q|
              (|Union| 71 '#1="failed") (|FiniteDivisor| 7 8 9 10)
              |PFO;order;FdU;45| (|Boolean|) |PFO;torsion?;FdB;1| (|Integer|)
              (|Fraction| 18) (0 . |numer|) (5 . |coerce|) (10 . |denom|)
              (15 . /) (|Mapping| 7 19)
              (|SparseUnivariatePolynomial| (|Fraction| 29))
              (|MultipleMap| 19 29 25 7 8 9) (21 . |map|)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomial| 19)
              (|SparseUnivariatePolynomialFunctions2| 19 7) (27 . |map|)
              (|Kernel| $) (33 . |coerce|) (38 . |elt|) (|Mapping| 7 29)
              (|SparseUnivariatePolynomial| 29)
              (|UnivariatePolynomialCategoryFunctions2| 29 36 7 8) (44 . |map|)
              (50 . |bringDown|) (|Mapping| 19 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 28 19 29)
              (55 . |map|) (|MultipleMap| 7 8 9 19 29 25) (61 . |map|)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 19 29) (67 . |map|)
              (|Kernel| 7) (73 . |bringDown|) (|Mapping| 29 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 29 36) (79 . |map|)
              (|Fraction| 8) (85 . |retract|) (|SparseUnivariatePolynomial| 36)
              (|Mapping| 36 52)
              (|UnivariatePolynomialCategoryFunctions2| 52 9 36 54)
              (90 . |map|) (|List| 7) (96 . |coefficients|) (|List| 32)
              (|List| $) (101 . |algtower|) (|Factored| 29)
              (|RationalFactorize| 29) (106 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 66) (|:| |factor| 29) (|:| |exponent| 71))
              (|List| 67) (111 . |factorList|) (116 . |One|)
              (|NonNegativeInteger|) (120 . >) (|List| 29)
              (126 . |coefficients|) (131 . |rem|)
              (|Record| (|:| |den| 18) (|:| |gcdnum| 18))
              (|PointsOfFiniteOrderTools| 29 25) (137 . |badNum|) (|List| 76)
              (142 . |mix|) (|List| 36) (147 . |coefficients|) (152 . |lcm|)
              (157 . |reduce|) |PFO;possibleOrder;FdNni;42| (162 . *)
              (|Union| 10 '"failed") (168 . |generator|)
              (|Record| (|:| |order| 71) (|:| |function| 10))
              (|Union| 89 '#2="failed") |PFO;torsionIfCan;FdU;17|
              (|UnivariatePolynomialCategoryFunctions2| 19 29 7 8)
              (173 . |map|) (179 . |elt|) (185 . |coerce|) (|Mapping| 52 36)
              (|UnivariatePolynomialCategoryFunctions2| 36 54 52 9)
              (190 . |map|) (|SparseMultivariatePolynomial| 6 47) (196 . |lcm|)
              (|List| 99) (201 . |cmult|) (206 . *) (212 . |One|)
              (216 . |discriminant|) (221 . |differentiate|) (226 . |gcd|)
              (|Union| $ '"failed") (232 . |exquo|) (238 . |discriminant|)
              (242 . |discriminant|) (247 . |zero?|) (|List| 19)
              (252 . |coefficients|) (257 . |retract|) (262 . |gcd|)
              (|SparseMultivariatePolynomial| 6 32) (267 . |denom|) (|List| 52)
              (272 . |coefficients|) (277 . |coerce|) (282 . |coerce|)
              (287 . *) (|Union| 52 '#3="failed") (293 . |retractIfCan|)
              (298 . |lift|) (|List| 47) (303 . |setUnion|)
              (|FractionalIdeal| 8 52 9 10) (309 . |ideal|) (|Vector| 10)
              (314 . |numer|) (|BasicOperator|) (319 . |operator|) (|Symbol|)
              (324 . |has?|) (330 . |denom|) (335 . |minIndex|)
              (|Mapping| 16 47) (340 . |select!|) (346 . |definingPolynomial|)
              (|List| 9) (|Vector| 9) (350 . |entries|) (|Complex| 18)
              (355 . |real|) (360 . |coerce|) (|Mapping| 6 6) (365 . |map|)
              (371 . |imag|) (376 . *) (382 . +) (388 . |numer|)
              (|Mapping| 7 7) (393 . |map|) (|Mapping| 8 8) (399 . |map|)
              (|Mapping| 52 52) (405 . |map|) (411 . |One|) (415 . |monomial|)
              (421 . |One|) (425 . +) (|SparseUnivariatePolynomial| $)
              (|Expression| 6) (431 . |rootOf|) (|List| 10) (436 . |entries|)
              (441 . |vector|) (446 . |coerce|) (451 . ~=)
              (|Record| (|:| |ncurve| 9) (|:| |n_div_numer| 143)
                        (|:| |n_div_denom| 9) (|:| |need_change| 16))
              (457 . |handle_imaginary|) (462 . |minPoly|) (|Union| 19 '#3#)
              (467 . |retractIfCan|) (472 . |coefficients|) (|Mapping| 16 7)
              (477 . |every?|) (483 . |rootOf|) (488 . |kernels|)
              (493 . |minimize|) (498 . |elt|) (504 . |retract|)
              (509 . |primitivePart|) (514 . |norm|)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (519 . |separate|) (525 . |resultant|) (531 . |Zero|)
              (535 . |Zero|) (539 . |separate|) (545 . |resultant|)
              (|PositiveInteger|) (551 . |rank|) (555 . |factorial|)
              (560 . |badNum|) (565 . |getGoodPrime|) (570 . *) (576 . |eval|)
              (|Record| (|:| |primelt| 7) (|:| |poly| (|List| 28))
                        (|:| |prim| 28))
              (|FunctionSpacePrimitiveElement| 6 7) (583 . |primitiveElement|)
              (588 . |simplifyCoeffs|) (594 . |genus|)
              (|Record| (|:| |id| 129) (|:| |principalPart| 10))
              (598 . |decompose|) (603 . |divisor|) (608 . |reduce|) (613 . /)
              (619 . |ideal|) (|Void|) (624 . |newReduc|) (629 . |polyred|)
              (634 . |doubleDisc|) (|Record| (|:| |num| 29) (|:| |den| 18))
              (|UnivariatePolynomialCommonDenominator| 18 19 29)
              (639 . |splitDenominator|) (644 . |principal?|)
              (|IntegerPrimesPackage| 18) (649 . |nextPrime|) (654 . |coerce|))
           '#(|torsionIfCan| 659 |torsion?| 664 |simplifyCoeffs| 669
              |possibleOrder| 675 |order| 680 |handle_imaginary| 685 |cmult|
              690)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|order|
                                 ((|Union| (|NonNegativeInteger|) #1#)
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|torsion?|
                                 ((|Boolean|)
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|torsionIfCan|
                                 ((|Union|
                                   (|Record|
                                    (|:| |order| (|NonNegativeInteger|))
                                    (|:| |function| |#5|))
                                   #2#)
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|cmult|
                                 ((|SparseMultivariatePolynomial| |#1|
                                                                  (|Kernel|
                                                                   |#2|))
                                  (|List|
                                   (|SparseMultivariatePolynomial| |#1|
                                                                   (|Kernel|
                                                                    |#2|)))))
                                T)
                              '((|possibleOrder|
                                 ((|NonNegativeInteger|)
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|handle_imaginary|
                                 ((|Record| (|:| |ncurve| |#4|)
                                            (|:| |n_div_numer| (|Vector| |#4|))
                                            (|:| |n_div_denom| |#4|)
                                            (|:| |need_change| (|Boolean|)))
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|simplifyCoeffs|
                                 ((|NonNegativeInteger|)
                                  (|Record| (|:| |ncurve| |#4|)
                                            (|:| |n_div_numer| (|Vector| |#4|))
                                            (|:| |n_div_denom| |#4|)
                                            (|:| |need_change| (|Boolean|)))
                                  (|List| (|Kernel| |#2|))))
                                (AND (|has| 7 (|AlgebraicallyClosedField|))
                                     (|has| 6 (|CharacteristicZero|)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 222
                                            '(1 19 18 0 20 1 7 0 18 21 1 19 18
                                              0 22 2 7 0 0 0 23 2 26 9 24 25 27
                                              2 30 28 24 29 31 1 7 0 32 33 2 28
                                              7 0 7 34 2 37 8 35 36 38 1 12 19
                                              7 39 2 41 29 40 28 42 2 43 25 40
                                              9 44 2 45 29 40 8 46 2 12 29 7 47
                                              48 2 50 36 49 8 51 1 52 8 0 53 2
                                              56 54 55 9 57 1 8 58 0 59 1 7 60
                                              61 62 1 64 63 29 65 1 63 68 0 69
                                              0 6 0 70 2 71 16 0 0 72 1 36 73 0
                                              74 2 29 0 0 0 75 1 77 76 29 78 1
                                              77 18 79 80 1 54 81 0 82 1 18 0
                                              61 83 1 14 0 0 84 2 14 0 18 0 86
                                              1 14 87 0 88 2 92 8 24 29 93 2 8
                                              7 0 7 94 1 52 0 8 95 2 97 9 96 54
                                              98 1 99 0 61 100 1 0 99 101 102 2
                                              99 0 0 0 103 0 99 0 104 1 54 36 0
                                              105 1 36 0 0 106 2 36 0 0 0 107 2
                                              36 108 0 0 109 0 10 52 110 1 36
                                              29 0 111 1 29 16 0 112 1 29 113 0
                                              114 1 19 18 0 115 1 18 0 61 116 1
                                              7 117 0 118 1 9 119 0 120 1 7 0
                                              117 121 1 8 0 7 122 2 9 0 52 0
                                              123 1 10 124 0 125 1 10 9 0 126 2
                                              127 0 0 0 128 1 14 129 0 130 1
                                              129 131 0 132 1 47 133 0 134 2
                                              133 16 0 135 136 1 129 8 0 137 1
                                              131 18 0 138 2 127 0 139 0 140 0
                                              10 9 141 1 143 142 0 144 1 145 18
                                              0 146 1 6 0 18 147 2 99 0 148 0
                                              149 1 145 18 0 150 2 7 0 0 0 151
                                              2 7 0 0 0 152 1 7 117 0 153 2 8 0
                                              154 0 155 2 52 0 156 0 157 2 9 0
                                              158 0 159 0 7 0 160 2 28 0 7 71
                                              161 0 28 0 162 2 28 0 0 0 163 1
                                              165 0 164 166 1 131 167 0 168 1
                                              143 0 142 169 1 9 0 52 170 2 9 16
                                              0 0 171 1 0 172 14 173 1 7 164 32
                                              174 1 7 175 0 176 1 28 58 0 177 2
                                              58 16 178 0 179 1 7 0 164 180 1 7
                                              60 0 181 1 129 0 0 182 2 131 10 0
                                              18 183 1 10 52 0 184 1 8 0 0 185
                                              1 10 52 0 186 2 8 187 0 0 188 2 8
                                              7 0 0 189 0 6 0 190 0 7 0 191 2
                                              29 187 0 0 192 2 29 19 0 0 193 0
                                              10 194 195 1 18 0 0 196 1 77 18
                                              25 197 1 77 194 18 198 2 18 0 194
                                              0 199 3 7 0 0 60 61 200 1 202 201
                                              58 203 2 0 71 172 127 204 0 10 71
                                              205 1 14 206 0 207 1 14 0 129 208
                                              1 10 0 9 209 2 10 0 0 0 210 1 129
                                              0 131 211 1 12 212 18 213 1 77 25
                                              25 214 1 77 18 25 215 1 217 216
                                              29 218 1 14 16 0 219 1 220 18 18
                                              221 1 19 0 18 222 1 0 90 14 91 1
                                              0 16 14 17 2 1 71 172 127 204 1 0
                                              71 14 85 1 0 13 14 15 1 0 172 14
                                              173 1 0 99 101 102)))))
           '|lookupComplete|)) 
