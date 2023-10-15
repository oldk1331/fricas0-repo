
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
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;raise2|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;krmod|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;kpmod|))
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;krmod| (SPADCALL |p1| (QREFELT $ 53)) |k| $))))) 

(SDEFUN |PFO;klist| ((|d| UP) ($ |List| (|Kernel| F)))
        (SPADCALL (SPADCALL |d| (QREFELT $ 59)) (QREFELT $ 62))) 

(SDEFUN |PFO;notIrr?|
        ((|d| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPADCALL
         (LENGTH (SPADCALL (SPADCALL |d| (QREFELT $ 65)) (QREFELT $ 68))) 1
         (QREFELT $ 71))) 

(SDEFUN |PFO;kbadBadNum|
        ((|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G160 NIL) (|c| NIL) (#2=#:G159 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PFO;kbadBadNum|))
                  (SEQ (LETT |c| NIL . #3#)
                       (LETT #1# (SPADCALL |d| (QREFELT $ 73)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |c| |m| (QREFELT $ 74))
                                          (QREFELT $ 77))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 79))))) 

(SDEFUN |PFO;kbad3Num|
        ((|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G164 NIL) (|c| NIL) (#2=#:G163 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PFO;kbad3Num|))
                  (SEQ (LETT |c| NIL . #3#)
                       (LETT #1# (SPADCALL |h| (QREFELT $ 81)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|PFO;kbadBadNum| |c| |m| $) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 82))))) 

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
                         (SPADCALL
                          (LETT |d| (SPADCALL |d| (QREFELT $ 83))
                                . #1=(|PFO;torsionIfCan;FdU;17|))
                          (QREFELT $ 84))
                         . #1#))
                  (CONS 1 "failed"))
                 (#2='T
                  (SEQ
                   (LETT |g|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |d| (QREFELT $ 85))
                                    (QREFELT $ 83))
                          (QREFELT $ 87))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                          (#2# (CONS 0 (CONS |n| (QCDR |g|)))))))))))) 

(SDEFUN |PFO;UPQ2F|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|k| |Kernel| F) ($ F))
        (SPADCALL (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 92))
                  (SPADCALL |k| (QREFELT $ 33)) (QREFELT $ 93))) 

(SDEFUN |PFO;UP22UP|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| |Kernel| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP22UP!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 38)))) 

(SDEFUN |PFO;UP22UP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;UP22UP|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;UPQ2F| |p1| |k| $))))) 

(SDEFUN |PFO;UP32UPUP|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|k| |Kernel| F) ($ UPUP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP32UPUP!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 97)))) 

(SDEFUN |PFO;UP32UPUP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;UP32UPUP|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (|PFO;UP22UP| |p1| |k| $) (QREFELT $ 94)))))) 

(SDEFUN |PFO;cmult;LSmp;21|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPADCALL |l| (QREFELT $ 99))) 

(SDEFUN |PFO;cmult;LSmp;22|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((#1=#:G188 NIL)
          (#2=#:G187 #3=(|SparseMultivariatePolynomial| R0 (|Kernel| F)))
          (#4=#:G189 #3#) (#5=#:G191 NIL) (#6=#:G104 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|PFO;cmult;LSmp;22|))
           (SEQ (LETT #6# NIL . #7#) (LETT #5# |l| . #7#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# #6# . #7#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 102)) . #7#))
                    ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 103))))))) 

(SDEFUN |PFO;doubleDisc|
        ((|f| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         ($ |Integer|))
        (SPROG
         ((#1=#:G199 NIL) (|c| NIL) (#2=#:G198 NIL)
          (|e| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|d|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
          (#3=#:G193 NIL)
          (|g|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 104)) . #4=(|PFO;doubleDisc|))
              (LETT |g|
                    (SPADCALL |d| (SPADCALL |d| (QREFELT $ 105))
                              (QREFELT $ 106))
                    . #4#)
              (LETT |d|
                    (PROG2 (LETT #3# (SPADCALL |d| |g| (QREFELT $ 108)) . #4#)
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
                                      #3#))
                    . #4#)
              (EXIT
               (COND
                ((SPADCALL (LETT |e| (SPADCALL |d| (QREFELT $ 110)) . #4#)
                           (QREFELT $ 111))
                 0)
                ('T
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #4#)
                   (SEQ (LETT |c| NIL . #4#)
                        (LETT #1# (SPADCALL |e| (QREFELT $ 113)) . #4#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |c| (CAR #1#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 114)) #2#)
                                . #4#)))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 115)))))))) 

(SDEFUN |PFO;commonDen|
        ((|p| UP) ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((|l2| (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
          (#1=#:G204 NIL) (|c| NIL) (#2=#:G203 NIL) (|l1| (|List| F)))
         (SEQ (LETT |l1| (SPADCALL |p| (QREFELT $ 59)) . #3=(|PFO;commonDen|))
              (LETT |l2|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |c| NIL . #3#) (LETT #1# |l1| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 117)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |l2| (QREFELT $ 101)))))) 

(SDEFUN |PFO;polyred| ((|f| UPUP) ($ UPUP))
        (SPROG ((#1=#:G315 NIL) (|c| NIL) (#2=#:G314 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL . #3=(|PFO;polyred|))
                      (SEQ (LETT |c| NIL . #3#)
                           (LETT #1# (SPADCALL |f| (QREFELT $ 119)) . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|PFO;commonDen|
                                     (SPADCALL |c| (QREFELT $ 53)) $)
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 101))
                    (QREFELT $ 120))
                   (QREFELT $ 121))
                  (QREFELT $ 94))
                 |f| (QREFELT $ 122))))) 

(SDEFUN |PFO;aklist| ((|f| R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G320 NIL) (#2=#:G319 #3=(|List| (|Kernel| F))) (#4=#:G321 #3#)
          (#5=#:G324 NIL) (|c| NIL) (|r| (|Union| (|Fraction| UP) "failed")))
         (SEQ (LETT |r| (SPADCALL |f| (QREFELT $ 124)) . #6=(|PFO;aklist|))
              (EXIT
               (COND
                ((QEQCAR |r| 1)
                 (PROGN
                  (LETT #1# NIL . #6#)
                  (SEQ (LETT |c| NIL . #6#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |f| (QREFELT $ 125))
                                       (QREFELT $ 119))
                             . #6#)
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|PFO;klist| (SPADCALL |c| (QREFELT $ 53)) $)
                                . #6#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 127))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7='T (|IdentityError| '|setUnion|)))))
                (#7# (|PFO;klist| (SPADCALL (QCDR |r|) (QREFELT $ 53)) $))))))) 

(SDEFUN |PFO;alglist|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G327 NIL) (#2=#:G326 #3=(|List| (|Kernel| F))) (#4=#:G328 #3#)
          (#5=#:G331 NIL) (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|n| (|Vector| R)))
         (SEQ
          (LETT |n|
                (SPADCALL
                 (LETT |i| (SPADCALL |d| (QREFELT $ 129)) . #6=(|PFO;alglist|))
                 (QREFELT $ 131))
                . #6#)
          (EXIT
           (SPADCALL (CONS #'|PFO;alglist!0| (VECTOR (QREFELT $ 11) $))
                     (SPADCALL (|PFO;klist| (SPADCALL |i| (QREFELT $ 136)) $)
                               (PROGN
                                (LETT #1# NIL . #6#)
                                (SEQ
                                 (LETT |i| (SPADCALL |n| (QREFELT $ 137))
                                       . #6#)
                                 (LETT #5# (QVSIZE |n|) . #6#) G190
                                 (COND ((> |i| #5#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (|PFO;aklist| (QAREF1O |n| |i| 1) $)
                                          . #6#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #4# (QREFELT $ 127))
                                            . #6#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #4# . #6#)
                                       (LETT #1# 'T . #6#)))))))
                                 (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                                 (EXIT NIL))
                                (COND (#1# #2#)
                                      ('T (|IdentityError| '|setUnion|))))
                               (QREFELT $ 127))
                     (QREFELT $ 139)))))) 

(SDEFUN |PFO;alglist!0| ((|k1| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;alglist|))
          (LETT ALGOP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |k1| (QREFELT $ 133)) ALGOP (QREFELT $ 135)))))) 

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
                (SEQ
                 (LETT |mp| (SPADCALL |k| (QREFELT $ 141))
                       . #4=(|PFO;algcurve|))
                 (EXIT
                  (COND
                   ((SPADCALL (CONS #'|PFO;algcurve!0| $)
                              (SPADCALL |mp| (QREFELT $ 144)) (QREFELT $ 146))
                    |k|)
                   ((|HasCategory| (QREFELT $ 7) '(|AlgebraicallyClosedField|))
                    (|SPADfirst|
                     (SPADCALL
                      (SPADCALL (|PFO;UPQ_to_UPF| (QVELT |rc| 2) $)
                                (QREFELT $ 147))
                      (QREFELT $ 148))))
                   (#5='T (|error| "cannot reduce root")))))
                . #4#)
          (LETT |mn|
                (SPADCALL
                 (LETT |n|
                       (SPADCALL
                        (LETT |i|
                              (SPADCALL (SPADCALL |d| (QREFELT $ 129))
                                        (QREFELT $ 149))
                              . #4#)
                        (QREFELT $ 131))
                       . #4#)
                 (QREFELT $ 137))
                . #4#)
          (LETT |h|
                (|PFO;kpmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |n| (+ |mn| 1) (QREFELT $ 151)) . #4#)
                  (QREFELT $ 125))
                 |k| $)
                . #4#)
          (LETT |b2|
                (SPADCALL
                 (|PFO;raise2|
                  (LETT |b|
                        (|PFO;krmod|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |mn| (QREFELT $ 151))
                                    (QREFELT $ 152))
                          (QREFELT $ 53))
                         |k| $)
                        . #4#)
                  |k1| $)
                 (QREFELT $ 153))
                . #4#)
          (LETT |s|
                (|PFO;kqmod|
                 (SPADCALL
                  (SPADCALL
                   (QCAR
                    (SPADCALL
                     (|PFO;raise2|
                      (|PFO;krmod|
                       (SPADCALL (SPADCALL |hh| (QREFELT $ 154))
                                 (QREFELT $ 53))
                       |k| $)
                      |k1| $)
                     |b2| (QREFELT $ 156)))
                   (QREFELT $ 153))
                  |b2| (QREFELT $ 157))
                 |k1| $)
                . #4#)
          (LETT |pr|
                (|PFO;kgetGoodPrime| |rc| |s| |h| |b|
                 (LETT |dd| (|PFO;krmod| (SPADCALL |i| (QREFELT $ 136)) |k| $)
                       . #4#)
                 $)
                . #4#)
          (LETT |p| (QCAR |pr|) . #4#)
          (LETT |pp| (|PFO;UP32UPUP| (QVELT |rc| 0) |k| $) . #4#)
          (LETT |mm| (QCDR |pr|) . #4#)
          (LETT |gf| (|InnerPrimeField| |p|) . #4#)
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
                                                  |gf|)))
                . #4#)
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
                     (|compiledLookupCheck| '- (LIST '$ '$) |gf|))
                    . #4#)
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
            (#5#
             (SEQ
              (LETT |sae|
                    (|SimpleAlgebraicExtension| |gf|
                                                (|SparseUnivariatePolynomial|
                                                 |gf|)
                                                |m|)
                    . #4#)
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
          (LETT |gf| (QREFELT $$ 3) . #1=(|PFO;algcurve|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |k| (QREFELT $$ 1) . #1#)
          (LETT |sae| (QREFELT $$ 0) . #1#)
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
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |gf| (QREFELT $$ 0) NIL)
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
          (LETT |gf| (QREFELT $$ 3) . #1=(|PFO;algcurve|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |k| (QREFELT $$ 1) . #1#)
          (LETT |alpha| (QREFELT $$ 0) . #1#)
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
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |gf| (QREFELT $$ 0) NIL)
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
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;algcurve|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 114))
                      (|compiledLookupCheck| '|coerce|
                                             (LIST '$ (LIST '|Integer|))
                                             |gf|)))))) 

(SDEFUN |PFO;algcurve!0| ((|x| NIL) ($ NIL))
        (QEQCAR (SPADCALL |x| (QREFELT $ 143)) 0)) 

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
                              (SPADCALL (SPADCALL |d| (QREFELT $ 129))
                                        (QREFELT $ 149))
                              . #2=(|PFO;ratcurve|))
                        (QREFELT $ 131))
                       . #2#)
                 (QREFELT $ 137))
                . #2#)
          (LETT |h|
                (|PFO;pmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |nm| (+ |mn| 1) (QREFELT $ 151)) . #2#)
                  (QREFELT $ 125))
                 $)
                . #2#)
          (LETT |b|
                (|PFO;rmod|
                 (SPADCALL
                  (SPADCALL (SPADCALL |nm| |mn| (QREFELT $ 151))
                            (QREFELT $ 152))
                  (QREFELT $ 53))
                 $)
                . #2#)
          (LETT |s|
                (QCAR
                 (SPADCALL
                  (|PFO;rmod|
                   (SPADCALL (SPADCALL |hh| (QREFELT $ 154)) (QREFELT $ 53)) $)
                  |b| (QREFELT $ 160)))
                . #2#)
          (LETT |bd|
                (SPADCALL (|PFO;rmod| (SPADCALL |i| (QREFELT $ 136)) $)
                          (QREFELT $ 77))
                . #2#)
          (LETT |r| (SPADCALL |s| |b| (QREFELT $ 161)) . #2#)
          (LETT |bad|
                (SPADCALL
                 (LIST (SPADCALL (SPADCALL (QREFELT $ 163)) (QREFELT $ 164))
                       (QCDR |rc|) (SPADCALL |r| (QREFELT $ 20))
                       (SPADCALL |r| (QREFELT $ 22))
                       (* (QCAR |bd|) (QCDR |bd|))
                       (SPADCALL |h| (QREFELT $ 165)))
                 (QREFELT $ 82))
                . #2#)
          (LETT |pp| (|PFO;Q2UPUP| (QCAR |rc|) $) . #2#)
          (LETT |n|
                (|PFO;rat| |pp| |d|
                 (LETT |p| (SPADCALL |bad| (QREFELT $ 166)) . #2#) $)
                . #2#)
          (EXIT
           (COND ((EQL |n| 1) |n|)
                 (#3='T
                  (SEQ
                   (LETT |m|
                         (|PFO;rat| |pp| |d|
                          (SPADCALL (SPADCALL |p| |bad| (QREFELT $ 167))
                                    (QREFELT $ 166))
                          $)
                         . #2#)
                   (EXIT (COND ((EQL |n| |m|) |n|) (#3# 0)))))))))) 

(SDEFUN |PFO;rat|
        ((|pp| UPUP) (|d| |FiniteDivisor| F UP UPUP R) (|p| |PositiveInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|)))))
         (SEQ (LETT |gf| (|InnerPrimeField| |p|) |PFO;rat|)
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
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;rat|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|qq| NIL))
                   (SEQ (LETT |qq| (|PFO;qmod| |q1| $) NIL)
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
                         (QREFELT $ 174)))) 

(SDEFUN |PFO;evalup!2| ((|a| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2) . #1=(|PFO;evalup|))
          (LETT |lrhs| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!1| (VECTOR |la| |lrhs| $)) |a|
                             (QREFELT $ 172))))))) 

(SDEFUN |PFO;evalup!1| ((|b| NIL) ($$ NIL))
        (PROG ($ |lrhs| |la|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lrhs| (QREFELT $$ 1) NIL)
          (LETT |la| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!0| (VECTOR $ |lrhs| |la|)) |b|
                             (QREFELT $ 170))))))) 

(SDEFUN |PFO;evalup!0| ((|c| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2) NIL)
          (LETT |lrhs| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |c| |la| |lrhs| (QREFELT $ 168)))))) 

(SDEFUN |PFO;simplifyCoeffs;FdLNni;33|
        ((|d| |FiniteDivisor| F UP UPUP R) (|la| |List| (|Kernel| F))
         ($ |NonNegativeInteger|))
        (SPROG
         ((|ndiv| (|nFD|)) (|va| (|Vector| |nR|)) (#1=#:G378 NIL)
          (#2=#:G380 NIL) (|i| NIL) (#3=#:G379 NIL) (|v| (|Vector| R))
          (|nd| (|nR|)) (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
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
            (IF (|has| R0 (|CharacteristicZero|))
                (IF (|has| F (|AlgebraicallyClosedField|))
                    (SIGNATURE |simplifyCoeffs|
                     ((|NonNegativeInteger|) (|FiniteDivisor| F UP UPUP |nR|)
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
          (|nf| (UPUP)) (|lrhs| (|List| F)) (#4=#:G377 NIL) (|pol| NIL)
          (#5=#:G376 NIL) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |poly| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (#6=#:G375 NIL) (|k| NIL) (#7=#:G374 NIL))
         (SEQ
          (LETT |rec|
                (SPADCALL
                 (PROGN
                  (LETT #7# NIL . #8=(|PFO;simplifyCoeffs;FdLNni;33|))
                  (SEQ (LETT |k| NIL . #8#) (LETT #6# |la| . #8#) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #7# (CONS (SPADCALL |k| (QREFELT $ 33)) #7#)
                               . #8#)))
                       (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #7#))))
                 (QREFELT $ 177))
                . #8#)
          (LETT |y| (SPADCALL (QVELT |rec| 2) (QREFELT $ 147)) . #8#)
          (LETT |lrhs|
                (PROGN
                 (LETT #5# NIL . #8#)
                 (SEQ (LETT |pol| NIL . #8#) (LETT #4# (QVELT |rec| 1) . #8#)
                      G190
                      (COND
                       ((OR (ATOM #4#)
                            (PROGN (LETT |pol| (CAR #4#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS (SPADCALL |pol| |y| (QREFELT $ 34)) #5#)
                              . #8#)))
                      (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #8#)
          (LETT |nf| (|PFO;evalup| (SPADCALL (QREFELT $ 178)) |la| |lrhs| $)
                . #8#)
          (LETT |nR|
                (|AlgebraicFunctionField| (QREFELT $ 7) (QREFELT $ 8)
                                          (QREFELT $ 9) |nf|)
                . #8#)
          (LETT |nFD|
                (|FiniteDivisor| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 9)
                                 |nR|)
                . #8#)
          (LETT |nFR|
                (|FractionalIdeal| (QREFELT $ 8) (|Fraction| (QREFELT $ 8))
                                   (QREFELT $ 9) |nR|)
                . #8#)
          (LETT |nPFO|
                (|PointsOfFiniteOrder| (QREFELT $ 6) (QREFELT $ 7)
                                       (QREFELT $ 8) (QREFELT $ 9) |nR|)
                . #8#)
          (LETT |id| (SPADCALL |d| (QREFELT $ 129)) . #8#)
          (LETT |nd|
                (SPADCALL
                 (|PFO;evalup|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |id| (QREFELT $ 136)) (QREFELT $ 94))
                    (QREFELT $ 179))
                   (QREFELT $ 125))
                  |la| |lrhs| $)
                 (|compiledLookupCheck| '|reduce|
                                        (LIST '$ (|devaluate| (ELT $ 9)))
                                        |nR|))
                . #8#)
          (LETT |v| (SPADCALL |id| (QREFELT $ 131)) . #8#)
          (LETT |va|
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI|
                         (- #9=(QVSIZE |v|)
                            #10=(SPADCALL |v| (QREFELT $ 137)))))
                       . #8#)
                 (SEQ (LETT |i| #10# . #8#) (LETT #2# #9# . #8#)
                      (LETT #1# 0 . #8#) G190 (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL
                                 (SPADCALL
                                  (|PFO;evalup|
                                   (SPADCALL (SPADCALL |v| |i| (QREFELT $ 151))
                                             (QREFELT $ 125))
                                   |la| |lrhs| $)
                                  (|compiledLookupCheck| '|reduce|
                                                         (LIST '$
                                                               (|devaluate|
                                                                (ELT $ 9)))
                                                         |nR|))
                                 |nd|
                                 (|compiledLookupCheck| '/ (LIST '$ '$ '$)
                                                        |nR|)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #8#))
                            . #8#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)
                . #8#)
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
                                        |nFD|))
                . #8#)
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

(SDEFUN |PFO;possibleOrder;FdNni;34|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G390 NIL) (|la| (|List| (|Kernel| F))))
               (SEQ
                (EXIT
                 (COND
                  ((OR (ZEROP (SPADCALL (QREFELT $ 181)))
                       (EQL
                        (QVSIZE
                         (SPADCALL (SPADCALL |d| (QREFELT $ 129))
                                   (QREFELT $ 131)))
                        1))
                   1)
                  (#2='T
                   (COND
                    ((NULL
                      (LETT |la| (|PFO;alglist| |d| $)
                            . #3=(|PFO;possibleOrder;FdNni;34|)))
                     (|PFO;ratcurve| |d| (|PFO;selIntegers| $) $))
                    ((NULL (NULL (CDR |la|)))
                     (SEQ
                      (COND
                       ((|HasCategory| (QREFELT $ 6) '(|CharacteristicZero|))
                        (COND
                         ((|HasCategory| (QREFELT $ 7)
                                         '(|AlgebraicallyClosedField|))
                          (PROGN
                           (LETT #1# (SPADCALL |d| |la| (QREFELT $ 180)) . #3#)
                           (GO #4=#:G389))))))
                      (EXIT
                       (|error|
                        "PFO::possibleOrder: more than 1 algebraic constant"))))
                    (#2#
                     (|PFO;algcurve| |d|
                      (|PFO;selectIntegers| (|SPADfirst| |la|) $)
                      (|SPADfirst| |la|) $))))))
                #4# (EXIT #1#)))) 

(SDEFUN |PFO;selIntegers|
        (($ |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|Fraction|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))))
        (SPROG
         ((#1=#:G396 NIL) (|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|Fraction|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|f| (UPUP)))
         (SEQ
          (EXIT
           (SEQ (LETT |f| (SPADCALL (QREFELT $ 178)) . #2=(|PFO;selIntegers|))
                (LETT |n| (EXPT 10 6) . #2#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (SPADCALL |n| (QREFELT $ 183))
                           (LETT |d|
                                 (SPADCALL
                                  (LETT |r|
                                        (SPADCALL (|PFO;pmod| |f| $)
                                                  (QREFELT $ 184))
                                        . #2#)
                                  (QREFELT $ 185))
                                 . #2#)
                           (EXIT
                            (COND
                             ((NULL (ZEROP |d|))
                              (PROGN
                               (LETT #1# (CONS |r| |d|) . #2#)
                               (GO #3=#:G395))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

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
         ((#1=#:G405 NIL) (|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|p| (|SparseUnivariatePolynomial| F)) (|g| (UPUP))
          (|f| (UPUP)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g|
                  (|PFO;polyred|
                   (LETT |f| (SPADCALL (QREFELT $ 178))
                         . #2=(|PFO;selectIntegers|))
                   $)
                  . #2#)
            (LETT |p| (SPADCALL |k| (QREFELT $ 141)) . #2#)
            (LETT |n| (EXPT 10 6) . #2#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (SPADCALL |n| (QREFELT $ 183))
                       (LETT |d|
                             (|PFO;doubleDisc|
                              (LETT |r| (|PFO;kpmod| |g| |k| $) . #2#) $)
                             . #2#)
                       (COND
                        ((OR (ZEROP |d|) (|PFO;notIrr?| (|PFO;fmod| |p| $) $))
                         (EXIT "iterate")))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (VECTOR |r| |d|
                                       (QCAR
                                        (SPADCALL (|PFO;fmod| |p| $)
                                                  (QREFELT $ 188))))
                               . #2#)
                         (GO #3=#:G404))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |PFO;order;FdU;37|
        ((|d| |FiniteDivisor| F UP UPUP R)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND
                ((OR
                  (ZEROP
                   (LETT |n|
                         (SPADCALL
                          (LETT |d| (SPADCALL |d| (QREFELT $ 83))
                                . #1=(|PFO;order;FdU;37|))
                          (QREFELT $ 84))
                         . #1#))
                  (NULL
                   (SPADCALL
                    (SPADCALL (SPADCALL |n| |d| (QREFELT $ 85)) (QREFELT $ 83))
                    (QREFELT $ 189))))
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
         ((#1=#:G415 NIL) (|p| (|PositiveInteger|)) (#2=#:G417 NIL)
          (|u|
           (|Union| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
                    #3="failed"))
          (#4=#:G413 NIL))
         (SEQ
          (LETT |p|
                (PROG1
                    (LETT #4#
                          (SPADCALL (SPADCALL (QREFELT $ 163)) (QREFELT $ 191))
                          . #5=(|PFO;kgetGoodPrime|))
                  (|check_subtype2| (> #4# 0) '(|PositiveInteger|) '(|Integer|)
                                    #4#))
                . #5#)
          (SEQ G190
               (COND
                ((NULL
                  (QEQCAR
                   (LETT |u| (|PFO;goodRed| |rec| |res| |h| |b| |d| |p| $)
                         . #5#)
                   1))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |p|
                       (PROG1 (LETT #2# (SPADCALL |p| (QREFELT $ 191)) . #5#)
                         (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                           '(|Integer|) #2#))
                       . #5#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS |p|
                 (PROG2 (LETT #1# |u| . #5#)
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
          (|mdg| (|SparseUnivariatePolynomial| |gf|)) (#1=#:G437 NIL)
          (|ff| NIL) (|l| (|List| (|SparseUnivariatePolynomial| |gf|)))
          (#2=#:G436 NIL) (|f| NIL) (#3=#:G435 NIL)
          (|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|)))))
         (SEQ
          (COND ((ZEROP (REM (QVELT |rec| 1) |p|)) (CONS 1 "failed"))
                (#4='T
                 (SEQ (LETT |gf| (|InnerPrimeField| |p|) . #5=(|PFO;goodRed|))
                      (LETT |l|
                            (PROGN
                             (LETT #3# NIL . #5#)
                             (SEQ (LETT |f| NIL . #5#)
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
                                         (|compiledLookupCheck| '|factors|
                                                                (LIST
                                                                 (LIST '|List|
                                                                       (LIST
                                                                        '|Record|
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
                                                                          '|Integer|))))
                                                                 '$)
                                                                (|Factored|
                                                                 (|SparseUnivariatePolynomial|
                                                                  |gf|))))
                                        . #5#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |f| (CAR #2#) . #5#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL (QCDR |f|) 1)
                                      (LETT #3# (CONS (QCAR |f|) #3#)
                                            . #5#)))))
                                  (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            . #5#)
                      (EXIT
                       (COND ((NULL |l|) (CONS 1 "failed"))
                             (#4#
                              (SEQ (LETT |mdg| (|SPADfirst| |l|) . #5#)
                                   (SEQ (LETT |ff| NIL . #5#)
                                        (LETT #1# (CDR |l|) . #5#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |ff| (CAR #1#) . #5#)
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
                                            (LETT |mdg| |ff| . #5#)))))
                                        (LETT #1# (CDR #1#) . #5#) (GO G190)
                                        G191 (EXIT NIL))
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
                                                                   (|Integer|)))))
                                         . #5#)
                                   (EXIT
                                    (COND
                                     ((|PFO;good?| |res| |h| |b| |d| |p| |md|
                                       $)
                                      (CONS 0 |md|))
                                     (#4# (CONS 1 "failed")))))))))))))) 

(SDEFUN |PFO;goodRed!1| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| $)
          (LETT |gf| (QREFELT $$ 1) . #1=(|PFO;goodRed|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |z1|
                       (|compiledLookupCheck| '|convert|
                                              (LIST (LIST '|Integer|) '$)
                                              |gf|))
             (QREFELT $ 192)))))) 

(SDEFUN |PFO;goodRed!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;goodRed|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 114))
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
                (SPADCALL (SPADCALL |res| |m| (QREFELT $ 74)) (QREFELT $ 77))
                |PFO;good?|)
          (EXIT
           (COND
            ((OR (ZEROP (REM (QCAR |bd|) |p|))
                 (OR (ZEROP (REM (QCDR |bd|) |p|))
                     (OR (ZEROP (REM (|PFO;kbadBadNum| |b| |m| $) |p|))
                         (ZEROP (REM (|PFO;kbadBadNum| |d| |m| $) |p|)))))
             NIL)
            ('T (NULL (ZEROP (REM (|PFO;kbad3Num| |h| |m| $) |p|))))))))) 

(DECLAIM (NOTINLINE |PointsOfFiniteOrder;|)) 

(DEFUN |PointsOfFiniteOrder| (&REST #1=#:G445)
  (SPROG NIL
         (PROG (#2=#:G446)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PointsOfFiniteOrder|)
                                               '|domainEqualList|)
                    . #3=(|PointsOfFiniteOrder|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PointsOfFiniteOrder;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PointsOfFiniteOrder|)))))))))) 

(DEFUN |PointsOfFiniteOrder;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PointsOfFiniteOrder|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|PointsOfFiniteOrder| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 193) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|AlgebraicallyClosedField|)))))
                    . #1#))
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
      (QSETREFV $ 101 (CONS (|dispatchFunction| |PFO;cmult;LSmp;21|) $)))
     ('T (QSETREFV $ 101 (CONS (|dispatchFunction| |PFO;cmult;LSmp;22|) $))))
    (COND
     ((|HasCategory| |#1| '(|CharacteristicZero|))
      (COND
       ((|HasCategory| |#2| '(|AlgebraicallyClosedField|))
        (QSETREFV $ 180
                  (CONS (|dispatchFunction| |PFO;simplifyCoeffs;FdLNni;33|)
                        $))))))
    $))) 

(MAKEPROP '|PointsOfFiniteOrder| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) 'ALGOP '|q|
              (|Union| 70 '"failed") (|FiniteDivisor| 7 8 9 10)
              |PFO;order;FdU;37| (|Boolean|) |PFO;torsion?;FdB;1| (|Integer|)
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
              (|Record| (|:| |factor| 29) (|:| |exponent| 18)) (|List| 66)
              (111 . |factors|) (116 . |One|) (|NonNegativeInteger|) (120 . >)
              (|List| 29) (126 . |coefficients|) (131 . |rem|)
              (|Record| (|:| |den| 18) (|:| |gcdnum| 18))
              (|PointsOfFiniteOrderTools| 29 25) (137 . |badNum|) (|List| 75)
              (142 . |mix|) (|List| 36) (147 . |coefficients|) (152 . |lcm|)
              (157 . |reduce|) |PFO;possibleOrder;FdNni;34| (162 . *)
              (|Union| 10 '"failed") (168 . |generator|)
              (|Record| (|:| |order| 70) (|:| |function| 10))
              (|Union| 88 '"failed") |PFO;torsionIfCan;FdU;17|
              (|UnivariatePolynomialCategoryFunctions2| 19 29 7 8)
              (173 . |map|) (179 . |elt|) (185 . |coerce|) (|Mapping| 52 36)
              (|UnivariatePolynomialCategoryFunctions2| 36 54 52 9)
              (190 . |map|) (|SparseMultivariatePolynomial| 6 47) (196 . |lcm|)
              (|List| 98) (201 . |cmult|) (206 . *) (212 . |One|)
              (216 . |discriminant|) (221 . |differentiate|) (226 . |gcd|)
              (|Union| $ '"failed") (232 . |exquo|) (238 . |discriminant|)
              (242 . |discriminant|) (247 . |zero?|) (|List| 19)
              (252 . |coefficients|) (257 . |retract|) (262 . |gcd|)
              (|SparseMultivariatePolynomial| 6 32) (267 . |denom|) (|List| 52)
              (272 . |coefficients|) (277 . |coerce|) (282 . |coerce|)
              (287 . *) (|Union| 52 '#1="failed") (293 . |retractIfCan|)
              (298 . |lift|) (|List| 47) (303 . |setUnion|)
              (|FractionalIdeal| 8 52 9 10) (309 . |ideal|) (|Vector| 10)
              (314 . |numer|) (|BasicOperator|) (319 . |operator|) (|Symbol|)
              (324 . |has?|) (330 . |denom|) (335 . |minIndex|)
              (|Mapping| 16 47) (340 . |select!|)
              (|SparseUnivariatePolynomial| $) (346 . |minPoly|)
              (|Union| 19 '#1#) (351 . |retractIfCan|) (356 . |coefficients|)
              (|Mapping| 16 7) (361 . |every?|) (367 . |rootOf|)
              (372 . |kernels|) (377 . |minimize|) (382 . |One|) (386 . |elt|)
              (392 . |retract|) (397 . |primitivePart|) (402 . |norm|)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (407 . |separate|) (413 . |resultant|) (419 . |Zero|)
              (423 . |Zero|) (427 . |separate|) (433 . |resultant|)
              (|PositiveInteger|) (439 . |rank|) (443 . |factorial|)
              (448 . |badNum|) (453 . |getGoodPrime|) (458 . *) (464 . |eval|)
              (|Mapping| 7 7) (471 . |map|) (|Mapping| 8 8) (477 . |map|)
              (|Mapping| 52 52) (483 . |map|)
              (|Record| (|:| |primelt| 7) (|:| |poly| (|List| 28))
                        (|:| |prim| 28))
              (|FunctionSpacePrimitiveElement| 6 7) (489 . |primitiveElement|)
              (494 . |definingPolynomial|) (498 . |coerce|)
              (503 . |simplifyCoeffs|) (509 . |genus|) (|Void|)
              (513 . |newReduc|) (518 . |polyred|) (523 . |doubleDisc|)
              (|Record| (|:| |num| 29) (|:| |den| 18))
              (|UnivariatePolynomialCommonDenominator| 18 19 29)
              (528 . |splitDenominator|) (533 . |principal?|)
              (|IntegerPrimesPackage| 18) (538 . |nextPrime|) (543 . |coerce|))
           '#(|torsionIfCan| 548 |torsion?| 553 |simplifyCoeffs| 558
              |possibleOrder| 564 |order| 569 |cmult| 574)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 192
                                                 '(1 19 18 0 20 1 7 0 18 21 1
                                                   19 18 0 22 2 7 0 0 0 23 2 26
                                                   9 24 25 27 2 30 28 24 29 31
                                                   1 7 0 32 33 2 28 7 0 7 34 2
                                                   37 8 35 36 38 1 12 19 7 39 2
                                                   41 29 40 28 42 2 43 25 40 9
                                                   44 2 45 29 40 8 46 2 12 29 7
                                                   47 48 2 50 36 49 8 51 1 52 8
                                                   0 53 2 56 54 55 9 57 1 8 58
                                                   0 59 1 7 60 61 62 1 64 63 29
                                                   65 1 63 67 0 68 0 6 0 69 2
                                                   70 16 0 0 71 1 36 72 0 73 2
                                                   29 0 0 0 74 1 76 75 29 77 1
                                                   76 18 78 79 1 54 80 0 81 1
                                                   18 0 61 82 1 14 0 0 83 2 14
                                                   0 18 0 85 1 14 86 0 87 2 91
                                                   8 24 29 92 2 8 7 0 7 93 1 52
                                                   0 8 94 2 96 9 95 54 97 1 98
                                                   0 61 99 1 0 98 100 101 2 98
                                                   0 0 0 102 0 98 0 103 1 54 36
                                                   0 104 1 36 0 0 105 2 36 0 0
                                                   0 106 2 36 107 0 0 108 0 10
                                                   52 109 1 36 29 0 110 1 29 16
                                                   0 111 1 29 112 0 113 1 19 18
                                                   0 114 1 18 0 61 115 1 7 116
                                                   0 117 1 9 118 0 119 1 7 0
                                                   116 120 1 8 0 7 121 2 9 0 52
                                                   0 122 1 10 123 0 124 1 10 9
                                                   0 125 2 126 0 0 0 127 1 14
                                                   128 0 129 1 128 130 0 131 1
                                                   47 132 0 133 2 132 16 0 134
                                                   135 1 128 8 0 136 1 130 18 0
                                                   137 2 126 0 138 0 139 1 7
                                                   140 32 141 1 7 142 0 143 1
                                                   28 58 0 144 2 58 16 145 0
                                                   146 1 7 0 140 147 1 7 60 0
                                                   148 1 128 0 0 149 0 7 0 150
                                                   2 130 10 0 18 151 1 10 52 0
                                                   152 1 8 0 0 153 1 10 52 0
                                                   154 2 8 155 0 0 156 2 8 7 0
                                                   0 157 0 6 0 158 0 7 0 159 2
                                                   29 155 0 0 160 2 29 19 0 0
                                                   161 0 10 162 163 1 18 0 0
                                                   164 1 76 18 25 165 1 76 162
                                                   18 166 2 18 0 162 0 167 3 7
                                                   0 0 60 61 168 2 8 0 169 0
                                                   170 2 52 0 171 0 172 2 9 0
                                                   173 0 174 1 176 175 58 177 0
                                                   10 9 178 1 10 0 52 179 2 0
                                                   70 14 126 180 0 10 70 181 1
                                                   12 182 18 183 1 76 25 25 184
                                                   1 76 18 25 185 1 187 186 29
                                                   188 1 14 16 0 189 1 190 18
                                                   18 191 1 19 0 18 192 1 0 89
                                                   14 90 1 0 16 14 17 2 1 70 14
                                                   126 180 1 0 70 14 84 1 0 13
                                                   14 15 1 0 98 100 101)))))
           '|lookupComplete|)) 
