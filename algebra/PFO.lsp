
(SDEFUN |PFO;torsion?;FdB;1| ((|d| |FiniteDivisor| F UP UPUP R) ($ |Boolean|))
        (QEQCAR (SPADCALL |d| (QREFELT $ 15)) 0)) 

(SDEFUN |PFO;Q2F| ((|x| |Fraction| (|Integer|)) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 21))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 22)) (QREFELT $ 21))
                  (QREFELT $ 23))) 

(SDEFUN |PFO;qmod| ((|x| F) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 24))) 

(SDEFUN |PFO;kqmod|
        ((|x| F) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL |x| |k| (QREFELT $ 27))) 

(SDEFUN |PFO;fmod|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 31))) 

(SDEFUN |PFO;pmod|
        ((|p| UPUP)
         ($ |SparseUnivariatePolynomial|
          (|Fraction|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 34))) 

(SDEFUN |PFO;Q2UPUP|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         ($ UPUP))
        (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 37))) 

(SDEFUN |PFO;klist| ((|d| UP) ($ |List| (|Kernel| F)))
        (SPADCALL (SPADCALL |d| (QREFELT $ 39)) (QREFELT $ 42))) 

(SDEFUN |PFO;notIrr?|
        ((|d| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPADCALL
         (LENGTH (SPADCALL (SPADCALL |d| (QREFELT $ 45)) (QREFELT $ 48))) 1
         (QREFELT $ 51))) 

(SDEFUN |PFO;kbadBadNum|
        ((|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G147 NIL) (|c| NIL) (#2=#:G146 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PFO;kbadBadNum|))
                  (SEQ (LETT |c| NIL . #3#)
                       (LETT #1# (SPADCALL |d| (QREFELT $ 54)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |c| |m| (QREFELT $ 55))
                                          (QREFELT $ 58))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 60))))) 

(SDEFUN |PFO;kbad3Num|
        ((|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G151 NIL) (|c| NIL) (#2=#:G150 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PFO;kbad3Num|))
                  (SEQ (LETT |c| NIL . #3#)
                       (LETT #1# (SPADCALL |h| (QREFELT $ 63)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|PFO;kbadBadNum| |c| |m| $) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 64))))) 

(SDEFUN |PFO;torsionIfCan;FdU;12|
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
                          (LETT |d| (SPADCALL |d| (QREFELT $ 65))
                                . #1=(|PFO;torsionIfCan;FdU;12|))
                          (QREFELT $ 66))
                         . #1#))
                  (CONS 1 "failed"))
                 (#2='T
                  (SEQ
                   (LETT |g|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |d| (QREFELT $ 67))
                                    (QREFELT $ 65))
                          (QREFELT $ 69))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                          (#2# (CONS 0 (CONS |n| (QCDR |g|)))))))))))) 

(SDEFUN |PFO;UPQ2F|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|k| |Kernel| F) ($ F))
        (SPADCALL (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 74))
                  (SPADCALL |k| (QREFELT $ 76)) (QREFELT $ 77))) 

(SDEFUN |PFO;UP22UP|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| |Kernel| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP22UP!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 80)))) 

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
                         (QREFELT $ 85)))) 

(SDEFUN |PFO;UP32UPUP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;UP32UPUP|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (|PFO;UP22UP| |p1| |k| $) (QREFELT $ 82)))))) 

(SDEFUN |PFO;cmult;LSmp;16|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPADCALL |l| (QREFELT $ 87))) 

(SDEFUN |PFO;cmult;LSmp;17|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((#1=#:G175 NIL)
          (#2=#:G174 #3=(|SparseMultivariatePolynomial| R0 (|Kernel| F)))
          (#4=#:G176 #3#) (#5=#:G178 NIL) (#6=#:G104 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|PFO;cmult;LSmp;17|))
           (SEQ (LETT #6# NIL . #7#) (LETT #5# |l| . #7#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# #6# . #7#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 90)) . #7#))
                    ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 91))))))) 

(SDEFUN |PFO;doubleDisc|
        ((|f| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         ($ |Integer|))
        (SPROG
         ((#1=#:G186 NIL) (|c| NIL) (#2=#:G185 NIL)
          (|e| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|d|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
          (#3=#:G180 NIL)
          (|g|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 92)) . #4=(|PFO;doubleDisc|))
              (LETT |g|
                    (SPADCALL |d| (SPADCALL |d| (QREFELT $ 93)) (QREFELT $ 94))
                    . #4#)
              (LETT |d|
                    (PROG2 (LETT #3# (SPADCALL |d| |g| (QREFELT $ 96)) . #4#)
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
                ((SPADCALL (LETT |e| (SPADCALL |d| (QREFELT $ 98)) . #4#)
                           (QREFELT $ 99))
                 0)
                ('T
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #4#)
                   (SEQ (LETT |c| NIL . #4#)
                        (LETT #1# (SPADCALL |e| (QREFELT $ 101)) . #4#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |c| (CAR #1#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 102)) #2#)
                                . #4#)))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 103)))))))) 

(SDEFUN |PFO;commonDen|
        ((|p| UP) ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((|l2| (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
          (#1=#:G191 NIL) (|c| NIL) (#2=#:G190 NIL) (|l1| (|List| F)))
         (SEQ (LETT |l1| (SPADCALL |p| (QREFELT $ 39)) . #3=(|PFO;commonDen|))
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
                            (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 105)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |l2| (QREFELT $ 89)))))) 

(SDEFUN |PFO;polyred| ((|f| UPUP) ($ UPUP))
        (SPROG ((#1=#:G302 NIL) (|c| NIL) (#2=#:G301 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL . #3=(|PFO;polyred|))
                      (SEQ (LETT |c| NIL . #3#)
                           (LETT #1# (SPADCALL |f| (QREFELT $ 107)) . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|PFO;commonDen|
                                     (SPADCALL |c| (QREFELT $ 108)) $)
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 89))
                    (QREFELT $ 109))
                   (QREFELT $ 110))
                  (QREFELT $ 82))
                 |f| (QREFELT $ 111))))) 

(SDEFUN |PFO;aklist| ((|f| R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G307 NIL) (#2=#:G306 #3=(|List| (|Kernel| F))) (#4=#:G308 #3#)
          (#5=#:G311 NIL) (|c| NIL) (|r| (|Union| (|Fraction| UP) "failed")))
         (SEQ (LETT |r| (SPADCALL |f| (QREFELT $ 113)) . #6=(|PFO;aklist|))
              (EXIT
               (COND
                ((QEQCAR |r| 1)
                 (PROGN
                  (LETT #1# NIL . #6#)
                  (SEQ (LETT |c| NIL . #6#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |f| (QREFELT $ 114))
                                       (QREFELT $ 107))
                             . #6#)
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|PFO;klist| (SPADCALL |c| (QREFELT $ 108)) $)
                                . #6#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 116))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7='T (|IdentityError| '|setUnion|)))))
                (#7# (|PFO;klist| (SPADCALL (QCDR |r|) (QREFELT $ 108)) $))))))) 

(SDEFUN |PFO;alglist|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G314 NIL) (#2=#:G313 #3=(|List| (|Kernel| F))) (#4=#:G315 #3#)
          (#5=#:G318 NIL) (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|n| (|Vector| R)))
         (SEQ
          (LETT |n|
                (SPADCALL
                 (LETT |i| (SPADCALL |d| (QREFELT $ 118)) . #6=(|PFO;alglist|))
                 (QREFELT $ 120))
                . #6#)
          (EXIT
           (SPADCALL (CONS #'|PFO;alglist!0| (VECTOR (QREFELT $ 11) $))
                     (SPADCALL (|PFO;klist| (SPADCALL |i| (QREFELT $ 125)) $)
                               (PROGN
                                (LETT #1# NIL . #6#)
                                (SEQ
                                 (LETT |i| (SPADCALL |n| (QREFELT $ 126))
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
                                            (SPADCALL #2# #4# (QREFELT $ 116))
                                            . #6#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #4# . #6#)
                                       (LETT #1# 'T . #6#)))))))
                                 (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                                 (EXIT NIL))
                                (COND (#1# #2#)
                                      ('T (|IdentityError| '|setUnion|))))
                               (QREFELT $ 116))
                     (QREFELT $ 128)))))) 

(SDEFUN |PFO;alglist!0| ((|k1| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;alglist|))
          (LETT ALGOP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |k1| (QREFELT $ 122)) ALGOP (QREFELT $ 124)))))) 

(SDEFUN |PFO;krmod|
        ((|p| UP) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;krmod!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 131)))) 

(SDEFUN |PFO;krmod!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;krmod|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;kqmod| |z1| |k| $))))) 

(SDEFUN |PFO;rmod|
        ((|p| UP) ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 133))) 

(SDEFUN |PFO;raise|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|k| |Kernel| F) ($ F))
        (SPADCALL
         (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 135))
         (SPADCALL |k| (QREFELT $ 76)) (QREFELT $ 136))) 

(SDEFUN |PFO;raise2|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| |Kernel| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;raise2!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 80)))) 

(SDEFUN |PFO;raise2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;raise2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;raise| |z1| |k| $))))) 

(SDEFUN |PFO;UPQ_to_UPF|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 135))) 

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
                 (LETT |mp| (SPADCALL |k| (QREFELT $ 138))
                       . #4=(|PFO;algcurve|))
                 (EXIT
                  (COND
                   ((SPADCALL (CONS #'|PFO;algcurve!0| $)
                              (SPADCALL |mp| (QREFELT $ 141)) (QREFELT $ 143))
                    |k|)
                   ((|HasCategory| (QREFELT $ 7) '(|AlgebraicallyClosedField|))
                    (|SPADfirst|
                     (SPADCALL
                      (SPADCALL (|PFO;UPQ_to_UPF| (QVELT |rc| 2) $)
                                (QREFELT $ 144))
                      (QREFELT $ 145))))
                   (#5='T (|error| "cannot reduce root")))))
                . #4#)
          (LETT |mn|
                (SPADCALL
                 (LETT |n|
                       (SPADCALL
                        (LETT |i|
                              (SPADCALL (SPADCALL |d| (QREFELT $ 118))
                                        (QREFELT $ 146))
                              . #4#)
                        (QREFELT $ 120))
                       . #4#)
                 (QREFELT $ 126))
                . #4#)
          (LETT |h|
                (|PFO;kpmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |n| (+ |mn| 1) (QREFELT $ 148)) . #4#)
                  (QREFELT $ 114))
                 |k| $)
                . #4#)
          (LETT |b2|
                (SPADCALL
                 (|PFO;raise2|
                  (LETT |b|
                        (|PFO;krmod|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |mn| (QREFELT $ 148))
                                    (QREFELT $ 149))
                          (QREFELT $ 108))
                         |k| $)
                        . #4#)
                  |k1| $)
                 (QREFELT $ 150))
                . #4#)
          (LETT |s|
                (|PFO;kqmod|
                 (SPADCALL
                  (SPADCALL
                   (QCAR
                    (SPADCALL
                     (|PFO;raise2|
                      (|PFO;krmod|
                       (SPADCALL (SPADCALL |hh| (QREFELT $ 151))
                                 (QREFELT $ 108))
                       |k| $)
                      |k1| $)
                     |b2| (QREFELT $ 153)))
                   (QREFELT $ 150))
                  |b2| (QREFELT $ 154))
                 |k1| $)
                . #4#)
          (LETT |pr|
                (|PFO;kgetGoodPrime| |rc| |s| |h| |b|
                 (LETT |dd| (|PFO;krmod| (SPADCALL |i| (QREFELT $ 125)) |k| $)
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
            (SPADCALL (SPADCALL |z1| (QREFELT $ 102))
                      (|compiledLookupCheck| '|coerce|
                                             (LIST '$ (LIST '|Integer|))
                                             |gf|)))))) 

(SDEFUN |PFO;algcurve!0| ((|x| NIL) ($ NIL))
        (QEQCAR (SPADCALL |x| (QREFELT $ 140)) 0)) 

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
                              (SPADCALL (SPADCALL |d| (QREFELT $ 118))
                                        (QREFELT $ 146))
                              . #2=(|PFO;ratcurve|))
                        (QREFELT $ 120))
                       . #2#)
                 (QREFELT $ 126))
                . #2#)
          (LETT |h|
                (|PFO;pmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |nm| (+ |mn| 1) (QREFELT $ 148)) . #2#)
                  (QREFELT $ 114))
                 $)
                . #2#)
          (LETT |b|
                (|PFO;rmod|
                 (SPADCALL
                  (SPADCALL (SPADCALL |nm| |mn| (QREFELT $ 148))
                            (QREFELT $ 149))
                  (QREFELT $ 108))
                 $)
                . #2#)
          (LETT |s|
                (QCAR
                 (SPADCALL
                  (|PFO;rmod|
                   (SPADCALL (SPADCALL |hh| (QREFELT $ 151)) (QREFELT $ 108))
                   $)
                  |b| (QREFELT $ 157)))
                . #2#)
          (LETT |bd|
                (SPADCALL (|PFO;rmod| (SPADCALL |i| (QREFELT $ 125)) $)
                          (QREFELT $ 58))
                . #2#)
          (LETT |r| (SPADCALL |s| |b| (QREFELT $ 158)) . #2#)
          (LETT |bad|
                (SPADCALL
                 (LIST (SPADCALL (SPADCALL (QREFELT $ 160)) (QREFELT $ 161))
                       (QCDR |rc|) (SPADCALL |r| (QREFELT $ 20))
                       (SPADCALL |r| (QREFELT $ 22))
                       (* (QCAR |bd|) (QCDR |bd|))
                       (SPADCALL |h| (QREFELT $ 162)))
                 (QREFELT $ 64))
                . #2#)
          (LETT |pp| (|PFO;Q2UPUP| (QCAR |rc|) $) . #2#)
          (LETT |n|
                (|PFO;rat| |pp| |d|
                 (LETT |p| (SPADCALL |bad| (QREFELT $ 163)) . #2#) $)
                . #2#)
          (EXIT
           (COND ((EQL |n| 1) |n|)
                 (#3='T
                  (SEQ
                   (LETT |m|
                         (|PFO;rat| |pp| |d|
                          (SPADCALL (SPADCALL |p| |bad| (QREFELT $ 164))
                                    (QREFELT $ 163))
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
                         (QREFELT $ 171)))) 

(SDEFUN |PFO;evalup!2| ((|a| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2) . #1=(|PFO;evalup|))
          (LETT |lrhs| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!1| (VECTOR |la| |lrhs| $)) |a|
                             (QREFELT $ 169))))))) 

(SDEFUN |PFO;evalup!1| ((|b| NIL) ($$ NIL))
        (PROG ($ |lrhs| |la|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lrhs| (QREFELT $$ 1) NIL)
          (LETT |la| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!0| (VECTOR $ |lrhs| |la|)) |b|
                             (QREFELT $ 167))))))) 

(SDEFUN |PFO;evalup!0| ((|c| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2) NIL)
          (LETT |lrhs| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |c| |la| |lrhs| (QREFELT $ 165)))))) 

(SDEFUN |PFO;evala|
        ((|f| R) (|la| |List| (|Kernel| F)) (|lrhs| |List| F) ($ R))
        (SPADCALL (|PFO;evalup| (SPADCALL |f| (QREFELT $ 114)) |la| |lrhs| $)
                  (QREFELT $ 172))) 

(SDEFUN |PFO;simplifyCoeffs;FdLNni;33|
        ((|d| |FiniteDivisor| F UP UPUP R) (|la| |List| (|Kernel| F))
         ($ |NonNegativeInteger|))
        (SPROG
         ((|ndiv| (|nFD|)) (|va| (|Vector| |nR|)) (#1=#:G375 NIL)
          (#2=#:G377 NIL) (|i| NIL) (#3=#:G376 NIL) (|v| (|Vector| R))
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
          (|nf| (UPUP)) (|lrhs| (|List| F)) (#4=#:G374 NIL) (|pol| NIL)
          (#5=#:G373 NIL) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |poly| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (#6=#:G372 NIL) (|k| NIL) (#7=#:G371 NIL))
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
                         (LETT #7# (CONS (SPADCALL |k| (QREFELT $ 76)) #7#)
                               . #8#)))
                       (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #7#))))
                 (QREFELT $ 175))
                . #8#)
          (LETT |y| (SPADCALL (QVELT |rec| 2) (QREFELT $ 144)) . #8#)
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
                              (CONS (SPADCALL |pol| |y| (QREFELT $ 136)) #5#)
                              . #8#)))
                      (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #8#)
          (LETT |nf| (|PFO;evalup| (SPADCALL (QREFELT $ 176)) |la| |lrhs| $)
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
          (LETT |id| (SPADCALL |d| (QREFELT $ 118)) . #8#)
          (LETT |nd|
                (SPADCALL
                 (|PFO;evalup|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |id| (QREFELT $ 125)) (QREFELT $ 82))
                    (QREFELT $ 177))
                   (QREFELT $ 114))
                  |la| |lrhs| $)
                 (|compiledLookupCheck| '|reduce|
                                        (LIST '$ (|devaluate| (ELT $ 9)))
                                        |nR|))
                . #8#)
          (LETT |v| (SPADCALL |id| (QREFELT $ 120)) . #8#)
          (LETT |va|
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI|
                         (- #9=(QVSIZE |v|)
                            #10=(SPADCALL |v| (QREFELT $ 126)))))
                       . #8#)
                 (SEQ (LETT |i| #10# . #8#) (LETT #2# #9# . #8#)
                      (LETT #1# 0 . #8#) G190 (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL
                                 (SPADCALL
                                  (|PFO;evalup|
                                   (SPADCALL (SPADCALL |v| |i| (QREFELT $ 148))
                                             (QREFELT $ 114))
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
        (SPROG ((#1=#:G387 NIL) (|la| (|List| (|Kernel| F))))
               (SEQ
                (EXIT
                 (COND
                  ((OR (ZEROP (SPADCALL (QREFELT $ 179)))
                       (EQL
                        (QVSIZE
                         (SPADCALL (SPADCALL |d| (QREFELT $ 118))
                                   (QREFELT $ 120)))
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
                           (LETT #1# (SPADCALL |d| |la| (QREFELT $ 178)) . #3#)
                           (GO #4=#:G386))))))
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
         ((|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|Fraction|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|f| (UPUP)))
         (SEQ (LETT |f| (SPADCALL (QREFELT $ 176)) . #1=(|PFO;selIntegers|))
              (LETT |n| (EXPT 10 6) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (ZEROP
                       (LETT |d|
                             (SPADCALL
                              (LETT |r|
                                    (SPADCALL (|PFO;pmod| |f| $)
                                              (QREFELT $ 180))
                                    . #1#)
                              (QREFELT $ 181))
                             . #1#)))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |n| (QREFELT $ 183)))) NIL (GO G190)
                   G191 (EXIT NIL))
              (EXIT (CONS |r| |d|))))) 

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
         ((|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|p| (|SparseUnivariatePolynomial| F)) (|g| (UPUP))
          (|f| (UPUP)))
         (SEQ
          (LETT |g|
                (|PFO;polyred|
                 (LETT |f| (SPADCALL (QREFELT $ 176))
                       . #1=(|PFO;selectIntegers|))
                 $)
                . #1#)
          (LETT |p| (SPADCALL |k| (QREFELT $ 138)) . #1#)
          (LETT |n| (EXPT 10 6) . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((ZEROP
                     (LETT |d|
                           (|PFO;doubleDisc|
                            (LETT |r| (|PFO;kpmod| |g| |k| $) . #1#) $)
                           . #1#))
                    'T)
                   ('T (|PFO;notIrr?| (|PFO;fmod| |p| $) $))))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |n| (QREFELT $ 183)))) NIL (GO G190) G191
               (EXIT NIL))
          (EXIT
           (VECTOR |r| |d|
                   (QCAR (SPADCALL (|PFO;fmod| |p| $) (QREFELT $ 186)))))))) 

(SDEFUN |PFO;toQ1|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|d| |SparseUnivariatePolynomial| (|Fraction| (|Integer|))) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;toQ1!0| (VECTOR $ |d|)) |p|
                         (QREFELT $ 80)))) 

(SDEFUN |PFO;toQ1!0| ((|p1| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|PFO;toQ1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|PFO;Q2F|
             (SPADCALL (SPADCALL |p1| |d| (QREFELT $ 55)) (QREFELT $ 187))
             $))))) 

(SDEFUN |PFO;toQ2|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|d| |SparseUnivariatePolynomial| (|Fraction| (|Integer|))) ($ R))
        (SPROG NIL
               (SPADCALL
                (SPADCALL (CONS #'|PFO;toQ2!0| (VECTOR $ |d|)) |p|
                          (QREFELT $ 85))
                (QREFELT $ 172)))) 

(SDEFUN |PFO;toQ2!0| ((|p1| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|PFO;toQ2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (|PFO;toQ1| |p1| |d| $) (QREFELT $ 82)))))) 

(SDEFUN |PFO;kpmod|
        ((|p| UPUP) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;kpmod!0| (VECTOR |k| $)) |p|
                         (QREFELT $ 190)))) 

(SDEFUN |PFO;kpmod!0| ((|p1| NIL) ($$ NIL))
        (PROG ($ |k|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;kpmod|))
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;krmod| (SPADCALL |p1| (QREFELT $ 108)) |k| $))))) 

(SDEFUN |PFO;order;FdU;40|
        ((|d| |FiniteDivisor| F UP UPUP R)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND
                ((OR
                  (ZEROP
                   (LETT |n|
                         (SPADCALL
                          (LETT |d| (SPADCALL |d| (QREFELT $ 65))
                                . #1=(|PFO;order;FdU;40|))
                          (QREFELT $ 66))
                         . #1#))
                  (NULL
                   (SPADCALL
                    (SPADCALL (SPADCALL |n| |d| (QREFELT $ 67)) (QREFELT $ 65))
                    (QREFELT $ 191))))
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
         ((#1=#:G413 NIL) (|p| (|PositiveInteger|)) (#2=#:G415 NIL)
          (|u|
           (|Union| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
                    #3="failed"))
          (#4=#:G411 NIL))
         (SEQ
          (LETT |p|
                (PROG1
                    (LETT #4#
                          (SPADCALL (SPADCALL (QREFELT $ 160)) (QREFELT $ 193))
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
                       (PROG1 (LETT #2# (SPADCALL |p| (QREFELT $ 193)) . #5#)
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
          (|mdg| (|SparseUnivariatePolynomial| |gf|)) (#1=#:G435 NIL)
          (|ff| NIL) (|l| (|List| (|SparseUnivariatePolynomial| |gf|)))
          (#2=#:G434 NIL) (|f| NIL) (#3=#:G433 NIL)
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
             (QREFELT $ 194)))))) 

(SDEFUN |PFO;goodRed!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;goodRed|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 102))
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
                (SPADCALL (SPADCALL |res| |m| (QREFELT $ 55)) (QREFELT $ 58))
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

(DEFUN |PointsOfFiniteOrder| (&REST #1=#:G443)
  (SPROG NIL
         (PROG (#2=#:G444)
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
    (LETT $ (GETREFV 195) . #1#)
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
      (QSETREFV $ 89 (CONS (|dispatchFunction| |PFO;cmult;LSmp;16|) $)))
     ('T (QSETREFV $ 89 (CONS (|dispatchFunction| |PFO;cmult;LSmp;17|) $))))
    (COND
     ((|HasCategory| |#1| '(|CharacteristicZero|))
      (COND
       ((|HasCategory| |#2| '(|AlgebraicallyClosedField|))
        (QSETREFV $ 178
                  (CONS (|dispatchFunction| |PFO;simplifyCoeffs;FdLNni;33|)
                        $))))))
    $))) 

(MAKEPROP '|PointsOfFiniteOrder| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) 'ALGOP '|q|
              (|Union| 50 '"failed") (|FiniteDivisor| 7 8 9 10)
              |PFO;order;FdU;40| (|Boolean|) |PFO;torsion?;FdB;1| (|Integer|)
              (|Fraction| 18) (0 . |numer|) (5 . |coerce|) (10 . |denom|)
              (15 . /) (21 . |bringDown|) (|SparseUnivariatePolynomial| 19)
              (|Kernel| 7) (26 . |bringDown|) (|Mapping| 19 7)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomialFunctions2| 7 19) (32 . |map|)
              (|SparseUnivariatePolynomial| (|Fraction| 25))
              (|MultipleMap| 7 8 9 19 25 32) (38 . |map|) (|Mapping| 7 19)
              (|MultipleMap| 19 25 32 7 8 9) (44 . |map|) (|List| 7)
              (50 . |coefficients|) (|List| 75) (|List| $) (55 . |algtower|)
              (|Factored| 25) (|RationalFactorize| 25) (60 . |factor|)
              (|Record| (|:| |factor| 25) (|:| |exponent| 18)) (|List| 46)
              (65 . |factors|) (70 . |One|) (|NonNegativeInteger|) (74 . >)
              (|List| 25) (|SparseUnivariatePolynomial| 25)
              (80 . |coefficients|) (85 . |rem|)
              (|Record| (|:| |den| 18) (|:| |gcdnum| 18))
              (|PointsOfFiniteOrderTools| 25 32) (91 . |badNum|) (|List| 56)
              (96 . |mix|) (|List| 53) (|SparseUnivariatePolynomial| 53)
              (101 . |coefficients|) (106 . |lcm|) (111 . |reduce|)
              |PFO;possibleOrder;FdNni;34| (116 . *) (|Union| 10 '"failed")
              (122 . |generator|)
              (|Record| (|:| |order| 50) (|:| |function| 10))
              (|Union| 70 '"failed") |PFO;torsionIfCan;FdU;12|
              (|UnivariatePolynomialCategoryFunctions2| 19 25 7 8)
              (127 . |map|) (|Kernel| $) (133 . |coerce|) (138 . |elt|)
              (|Mapping| 7 25)
              (|UnivariatePolynomialCategoryFunctions2| 25 53 7 8)
              (144 . |map|) (|Fraction| 8) (150 . |coerce|) (|Mapping| 81 53)
              (|UnivariatePolynomialCategoryFunctions2| 53 62 81 9)
              (155 . |map|) (|SparseMultivariatePolynomial| 6 26) (161 . |lcm|)
              (|List| 86) (166 . |cmult|) (171 . *) (177 . |One|)
              (181 . |discriminant|) (186 . |differentiate|) (191 . |gcd|)
              (|Union| $ '"failed") (197 . |exquo|) (203 . |discriminant|)
              (207 . |discriminant|) (212 . |zero?|) (|List| 19)
              (217 . |coefficients|) (222 . |retract|) (227 . |gcd|)
              (|SparseMultivariatePolynomial| 6 75) (232 . |denom|) (|List| 81)
              (237 . |coefficients|) (242 . |retract|) (247 . |coerce|)
              (252 . |coerce|) (257 . *) (|Union| 81 '#1="failed")
              (263 . |retractIfCan|) (268 . |lift|) (|List| 26)
              (273 . |setUnion|) (|FractionalIdeal| 8 81 9 10) (279 . |ideal|)
              (|Vector| 10) (284 . |numer|) (|BasicOperator|)
              (289 . |operator|) (|Symbol|) (294 . |has?|) (300 . |denom|)
              (305 . |minIndex|) (|Mapping| 16 26) (310 . |select!|)
              (|Mapping| 25 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 25 53)
              (316 . |map|)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 19 25)
              (322 . |map|) (|SparseUnivariatePolynomialFunctions2| 19 7)
              (328 . |map|) (334 . |elt|) (|SparseUnivariatePolynomial| $)
              (340 . |minPoly|) (|Union| 19 '#1#) (345 . |retractIfCan|)
              (350 . |coefficients|) (|Mapping| 16 7) (355 . |every?|)
              (361 . |rootOf|) (366 . |kernels|) (371 . |minimize|)
              (376 . |One|) (380 . |elt|) (386 . |retract|)
              (391 . |primitivePart|) (396 . |norm|)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (401 . |separate|) (407 . |resultant|) (413 . |Zero|)
              (417 . |Zero|) (421 . |separate|) (427 . |resultant|)
              (|PositiveInteger|) (433 . |rank|) (437 . |factorial|)
              (442 . |badNum|) (447 . |getGoodPrime|) (452 . *) (458 . |eval|)
              (|Mapping| 7 7) (465 . |map|) (|Mapping| 8 8) (471 . |map|)
              (|Mapping| 81 81) (477 . |map|) (483 . |reduce|)
              (|Record| (|:| |primelt| 7) (|:| |poly| (|List| 29))
                        (|:| |prim| 29))
              (|FunctionSpacePrimitiveElement| 6 7) (488 . |primitiveElement|)
              (493 . |definingPolynomial|) (497 . |coerce|)
              (502 . |simplifyCoeffs|) (508 . |genus|) (512 . |polyred|)
              (517 . |doubleDisc|) (|Void|) (522 . |newReduc|)
              (|Record| (|:| |num| 25) (|:| |den| 18))
              (|UnivariatePolynomialCommonDenominator| 18 19 25)
              (527 . |splitDenominator|) (532 . |retract|) (|Mapping| 53 81)
              (|UnivariatePolynomialCategoryFunctions2| 81 9 53 62)
              (537 . |map|) (543 . |principal?|) (|IntegerPrimesPackage| 18)
              (548 . |nextPrime|) (553 . |coerce|))
           '#(|torsionIfCan| 558 |torsion?| 563 |simplifyCoeffs| 568
              |possibleOrder| 574 |order| 579 |cmult| 584)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 194
                                                 '(1 19 18 0 20 1 7 0 18 21 1
                                                   19 18 0 22 2 7 0 0 0 23 1 12
                                                   19 7 24 2 12 25 7 26 27 2 30
                                                   25 28 29 31 2 33 32 28 9 34
                                                   2 36 9 35 32 37 1 8 38 0 39
                                                   1 7 40 41 42 1 44 43 25 45 1
                                                   43 47 0 48 0 6 0 49 2 50 16
                                                   0 0 51 1 53 52 0 54 2 25 0 0
                                                   0 55 1 57 56 25 58 1 57 18
                                                   59 60 1 62 61 0 63 1 18 0 41
                                                   64 1 14 0 0 65 2 14 0 18 0
                                                   67 1 14 68 0 69 2 73 8 35 25
                                                   74 1 7 0 75 76 2 8 7 0 7 77
                                                   2 79 8 78 53 80 1 81 0 8 82
                                                   2 84 9 83 62 85 1 86 0 41 87
                                                   1 0 86 88 89 2 86 0 0 0 90 0
                                                   86 0 91 1 62 53 0 92 1 53 0
                                                   0 93 2 53 0 0 0 94 2 53 95 0
                                                   0 96 0 10 81 97 1 53 25 0 98
                                                   1 25 16 0 99 1 25 100 0 101
                                                   1 19 18 0 102 1 18 0 41 103
                                                   1 7 104 0 105 1 9 106 0 107
                                                   1 81 8 0 108 1 7 0 104 109 1
                                                   8 0 7 110 2 9 0 81 0 111 1
                                                   10 112 0 113 1 10 9 0 114 2
                                                   115 0 0 0 116 1 14 117 0 118
                                                   1 117 119 0 120 1 26 121 0
                                                   122 2 121 16 0 123 124 1 117
                                                   8 0 125 1 119 18 0 126 2 115
                                                   0 127 0 128 2 130 53 129 8
                                                   131 2 132 25 28 8 133 2 134
                                                   29 35 25 135 2 29 7 0 7 136
                                                   1 7 137 75 138 1 7 139 0 140
                                                   1 29 38 0 141 2 38 16 142 0
                                                   143 1 7 0 137 144 1 7 40 0
                                                   145 1 117 0 0 146 0 7 0 147
                                                   2 119 10 0 18 148 1 10 81 0
                                                   149 1 8 0 0 150 1 10 81 0
                                                   151 2 8 152 0 0 153 2 8 7 0
                                                   0 154 0 6 0 155 0 7 0 156 2
                                                   25 152 0 0 157 2 25 19 0 0
                                                   158 0 10 159 160 1 18 0 0
                                                   161 1 57 18 32 162 1 57 159
                                                   18 163 2 18 0 159 0 164 3 7
                                                   0 0 40 41 165 2 8 0 166 0
                                                   167 2 81 0 168 0 169 2 9 0
                                                   170 0 171 1 10 0 9 172 1 174
                                                   173 38 175 0 10 9 176 1 10 0
                                                   81 177 2 0 50 14 115 178 0
                                                   10 50 179 1 57 32 32 180 1
                                                   57 18 32 181 1 12 182 18 183
                                                   1 185 184 25 186 1 25 19 0
                                                   187 2 189 62 188 9 190 1 14
                                                   16 0 191 1 192 18 18 193 1
                                                   19 0 18 194 1 0 71 14 72 1 0
                                                   16 14 17 2 1 50 14 115 178 1
                                                   0 50 14 66 1 0 13 14 15 1 0
                                                   86 88 89)))))
           '|lookupComplete|)) 
