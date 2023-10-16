
(SDEFUN |TWOFACT;exchangeVars|
        ((|p| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         ($ |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
        (COND
         ((SPADCALL |p| (|spadConstant| $ 9) (QREFELT $ 11))
          (|spadConstant| $ 9))
         ('T
          (SPADCALL
           (|TWOFACT;exchangeVarTerm| (SPADCALL |p| (QREFELT $ 13))
            (SPADCALL |p| (QREFELT $ 15)) $)
           (|TWOFACT;exchangeVars| (SPADCALL |p| (QREFELT $ 16)) $)
           (QREFELT $ 17))))) 

(SDEFUN |TWOFACT;exchangeVarTerm|
        ((|c| |SparseUnivariatePolynomial| F) (|e| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
        (COND
         ((SPADCALL |c| (|spadConstant| $ 18) (QREFELT $ 19))
          (|spadConstant| $ 9))
         ('T
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL |c| (QREFELT $ 20)) |e| (QREFELT $ 21))
            (SPADCALL |c| (QREFELT $ 22)) (QREFELT $ 23))
           (|TWOFACT;exchangeVarTerm| (SPADCALL |c| (QREFELT $ 24)) |e| $)
           (QREFELT $ 17))))) 

(SDEFUN |TWOFACT;pthRoot|
        ((|poly| |SparseUnivariatePolynomial| F) (|p| |NonNegativeInteger|)
         (|PthRootPow| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| F))
        (SPROG ((|tmp| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
               (SEQ
                (LETT |tmp|
                      (SPADCALL
                       (SPADCALL
                        (CONS #'|TWOFACT;pthRoot!0| (VECTOR $ |PthRootPow|))
                        |poly| (QREFELT $ 27))
                       |p| (QREFELT $ 29)))
                (EXIT
                 (COND
                  ((QEQCAR |tmp| 1) (|error| "consistency error in TwoFactor"))
                  ('T (QCDR |tmp|))))))) 

(SDEFUN |TWOFACT;pthRoot!0| ((|x| NIL) ($$ NIL))
        (PROG (|PthRootPow| $)
          (LETT |PthRootPow| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |PthRootPow| (QREFELT $ 25)))))) 

(SDEFUN |TWOFACT;generalSqFr;SupF;4|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|pfaclist|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
             (|:| |factor|
                  (|SparseUnivariatePolynomial|
                   (|SparseUnivariatePolynomial| F)))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|contlist|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |exponent| #5=(|NonNegativeInteger|)))))
          (#6=#:G165 NIL) (|w| NIL) (#7=#:G164 NIL)
          (|sqp| #8=(|Factored| (|SparseUnivariatePolynomial| F)))
          (|unitPart|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#9=#:G163 NIL) (|v| NIL)
          (|nfacs|
           #10=(|Factored|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| F))))
          (|uexp| #5#) (#11=#:G162 NIL) (|u| NIL) (|sqfrm| #10#)
          (#12=#:G149 NIL) (|cont| (|SparseUnivariatePolynomial| F))
          (#13=#:G161 NIL) (#14=#:G160 NIL) (|l| #8#))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| $ 9) (QREFELT $ 11))
            (|spadConstant| $ 31))
           ((EQL (SPADCALL |m| (QREFELT $ 15)) 0)
            (SEQ
             (LETT |l| (SPADCALL (SPADCALL |m| (QREFELT $ 13)) (QREFELT $ 33)))
             (EXIT
              (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 35)) (QREFELT $ 36))
                        (PROGN
                         (LETT #14# NIL)
                         (SEQ (LETT |u| NIL)
                              (LETT #13# (SPADCALL |l| (QREFELT $ 40))) G190
                              (COND
                               ((OR (ATOM #13#)
                                    (PROGN (LETT |u| (CAR #13#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #14#
                                      (CONS
                                       (VECTOR (QVELT |u| 0)
                                               (SPADCALL (QVELT |u| 1)
                                                         (QREFELT $ 36))
                                               (QVELT |u| 2))
                                       #14#))))
                              (LETT #13# (CDR #13#)) (GO G190) G191
                              (EXIT (NREVERSE #14#))))
                        (QREFELT $ 43)))))
           (#15='T
            (SEQ (LETT |cont| (SPADCALL |m| (QREFELT $ 44)))
                 (LETT |m|
                       (PROG2 (LETT #12# (SPADCALL |m| |cont| (QREFELT $ 45)))
                           (QCDR #12#)
                         (|check_union2| (QEQCAR #12# 0)
                                         (|SparseUnivariatePolynomial|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 6)))
                                         (|Union|
                                          (|SparseUnivariatePolynomial|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 6)))
                                          "failed")
                                         #12#)))
                 (LETT |sqfrm| (SPADCALL |m| (QREFELT $ 46)))
                 (LETT |pfaclist| NIL)
                 (LETT |unitPart| (SPADCALL |sqfrm| (QREFELT $ 47)))
                 (SEQ (LETT |u| NIL)
                      (LETT #11# (SPADCALL |sqfrm| (QREFELT $ 48))) G190
                      (COND
                       ((OR (ATOM #11#) (PROGN (LETT |u| (CAR #11#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |u| 0) (CONS 0 "nil")
                                    (QREFELT $ 49))
                          (SEQ (LETT |uexp| (QVELT |u| 2))
                               (LETT |nfacs|
                                     (SPADCALL
                                      (|TWOFACT;exchangeVars| (QVELT |u| 1) $)
                                      (QREFELT $ 46)))
                               (SEQ (LETT |v| NIL)
                                    (LETT #9#
                                          (SPADCALL |nfacs| (QREFELT $ 48)))
                                    G190
                                    (COND
                                     ((OR (ATOM #9#)
                                          (PROGN (LETT |v| (CAR #9#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |pfaclist|
                                            (CONS
                                             (VECTOR (QVELT |v| 0)
                                                     (|TWOFACT;exchangeVars|
                                                      (QVELT |v| 1) $)
                                                     (* (QVELT |v| 2) |uexp|))
                                             |pfaclist|))))
                                    (LETT #9# (CDR #9#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |unitPart|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |nfacs| (QREFELT $ 47))
                                        |uexp| (QREFELT $ 50))
                                       |unitPart| (QREFELT $ 51))))))
                         ('T (LETT |pfaclist| (CONS |u| |pfaclist|))))))
                      (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((SPADCALL |cont| (|spadConstant| $ 54) (QREFELT $ 55))
                    (SEQ (LETT |sqp| (SPADCALL |cont| (QREFELT $ 33)))
                         (LETT |contlist|
                               (PROGN
                                (LETT #7# NIL)
                                (SEQ (LETT |w| NIL)
                                     (LETT #6# (SPADCALL |sqp| (QREFELT $ 40)))
                                     G190
                                     (COND
                                      ((OR (ATOM #6#)
                                           (PROGN (LETT |w| (CAR #6#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #7#
                                             (CONS
                                              (VECTOR (QVELT |w| 0)
                                                      (SPADCALL (QVELT |w| 1)
                                                                (QREFELT $ 36))
                                                      (QVELT |w| 2))
                                              #7#))))
                                     (LETT #6# (CDR #6#)) (GO G190) G191
                                     (EXIT (NREVERSE #7#)))))
                         (LETT |pfaclist|
                               (SPADCALL |contlist| |pfaclist| (QREFELT $ 56)))
                         (EXIT
                          (SPADCALL
                           (SPADCALL (SPADCALL |sqp| (QREFELT $ 35)) |unitPart|
                                     (QREFELT $ 57))
                           |pfaclist| (QREFELT $ 43)))))
                   (#15#
                    (SPADCALL |unitPart| |pfaclist| (QREFELT $ 43))))))))))) 

(SDEFUN |TWOFACT;tryTwoFactor;SupF;5|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (|TWOFACT;doTwoFactor| |m| NIL $)) 

(SDEFUN |TWOFACT;generalTwoFactor;SupF;6|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (|TWOFACT;doTwoFactor| |m| 'T $)) 

(SDEFUN |TWOFACT;doTwoFactor|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         (|do_ext| |Boolean|)
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|ll|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G221 NIL) (|v| NIL) (#2=#:G220 NIL)
          (|unitPart|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#3=#:G209 NIL)
          (|nfl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|twoF|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|ydeg| #4=(|NonNegativeInteger|)) (#5=#:G196 NIL) (#6=#:G195 #4#)
          (#7=#:G197 #4#) (#8=#:G219 NIL) (|w| NIL) (#9=#:G218 NIL)
          (#10=#:G217 NIL)
          (|m2|
           #11=(|Factored|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| F))))
          (#12=#:G216 NIL) (#13=#:G215 NIL) (|res| #11#)
          (|m1|
           (|Union|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
            "failed"))
          (|PthRootPow| (|NonNegativeInteger|)) (#14=#:G186 NIL)
          (|p| (|NonNegativeInteger|))
          (|fac|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|expon| (|NonNegativeInteger|)) (#15=#:G214 NIL) (|u| NIL)
          (|sqfrm|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#16=#:G213 NIL) (#17=#:G212 NIL)
          (|contfact| #18=(|Factored| (|SparseUnivariatePolynomial| F)))
          (|cont| (|SparseUnivariatePolynomial| F)) (#19=#:G211 NIL)
          (#20=#:G210 NIL) (|l| #18#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |m| (|spadConstant| $ 9) (QREFELT $ 11))
             (|spadConstant| $ 31))
            ((EQL (SPADCALL |m| (QREFELT $ 15)) 0)
             (SEQ
              (LETT |l|
                    (SPADCALL (SPADCALL |m| (QREFELT $ 13)) (QREFELT $ 62)))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |l| (QREFELT $ 35)) (QREFELT $ 36))
                (PROGN
                 (LETT #20# NIL)
                 (SEQ (LETT |u| NIL) (LETT #19# (SPADCALL |l| (QREFELT $ 40)))
                      G190
                      (COND
                       ((OR (ATOM #19#) (PROGN (LETT |u| (CAR #19#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #20#
                              (CONS
                               (VECTOR (QVELT |u| 0)
                                       (SPADCALL (QVELT |u| 1) (QREFELT $ 36))
                                       (QVELT |u| 2))
                               #20#))))
                      (LETT #19# (CDR #19#)) (GO G190) G191
                      (EXIT (NREVERSE #20#))))
                (QREFELT $ 43)))))
            (#21='T
             (SEQ (LETT |ll| NIL) (LETT |cont| (SPADCALL |m| (QREFELT $ 44)))
                  (COND
                   ((SPADCALL (SPADCALL |cont| (QREFELT $ 22)) 0
                              (QREFELT $ 63))
                    (SEQ (LETT |m1| (SPADCALL |m| |cont| (QREFELT $ 45)))
                         (EXIT
                          (COND
                           ((QEQCAR |m1| 1) (|error| "content doesn't divide"))
                           (#21#
                            (SEQ (LETT |m| (QCDR |m1|))
                                 (LETT |contfact|
                                       (SPADCALL |cont| (QREFELT $ 62)))
                                 (LETT |unitPart|
                                       (SPADCALL
                                        (SPADCALL |contfact| (QREFELT $ 35))
                                        (QREFELT $ 36)))
                                 (EXIT
                                  (LETT |ll|
                                        (PROGN
                                         (LETT #17# NIL)
                                         (SEQ (LETT |w| NIL)
                                              (LETT #16#
                                                    (SPADCALL |contfact|
                                                              (QREFELT $ 40)))
                                              G190
                                              (COND
                                               ((OR (ATOM #16#)
                                                    (PROGN
                                                     (LETT |w| (CAR #16#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #17#
                                                      (CONS
                                                       (VECTOR (QVELT |w| 0)
                                                               (SPADCALL
                                                                (QVELT |w| 1)
                                                                (QREFELT $ 36))
                                                               (QVELT |w| 2))
                                                       #17#))))
                                              (LETT #16# (CDR #16#)) (GO G190)
                                              G191
                                              (EXIT (NREVERSE #17#))))))))))))
                   (#21# (LETT |unitPart| (SPADCALL |cont| (QREFELT $ 36)))))
                  (LETT |sqfrm| (SPADCALL |m| (QREFELT $ 46)))
                  (SEQ (LETT |u| NIL)
                       (LETT #15# (SPADCALL |sqfrm| (QREFELT $ 48))) G190
                       (COND
                        ((OR (ATOM #15#) (PROGN (LETT |u| (CAR #15#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |expon| (QVELT |u| 2))
                            (LETT |fac| (QVELT |u| 1))
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |fac| (QREFELT $ 15)) 1)
                               (LETT |ll|
                                     (CONS
                                      (VECTOR (CONS 2 "irred") |fac| |expon|)
                                      |ll|)))
                              ((SPADCALL (SPADCALL |fac| (QREFELT $ 64))
                                         (|spadConstant| $ 9) (QREFELT $ 11))
                               (COND
                                ((SPADCALL
                                  (SPADCALL (ELT $ 65) |fac| (QREFELT $ 67))
                                  (|spadConstant| $ 9) (QREFELT $ 11))
                                 (SEQ (LETT |p| (SPADCALL (QREFELT $ 68)))
                                      (LETT |PthRootPow|
                                            (PROG2
                                                (LETT #14#
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (QREFELT $ 69))
                                                       |p| (QREFELT $ 70)))
                                                (QCDR #14#)
                                              (|check_union2| (QEQCAR #14# 0)
                                                              (|NonNegativeInteger|)
                                                              (|Union|
                                                               (|NonNegativeInteger|)
                                                               "failed")
                                                              #14#)))
                                      (LETT |m1|
                                            (SPADCALL
                                             (SPADCALL
                                              (CONS #'|TWOFACT;doTwoFactor!0|
                                                    (VECTOR $ |PthRootPow|
                                                            |p|))
                                              |fac| (QREFELT $ 67))
                                             |p| (QREFELT $ 71)))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |m1| 1)
                                         (|error|
                                          "consistency error in TwoFactor"))
                                        ('T
                                         (SEQ
                                          (LETT |res|
                                                (SPADCALL (QCDR |m1|)
                                                          (QREFELT $ 60)))
                                          (LETT |unitPart|
                                                (SPADCALL |unitPart|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (QREFELT $
                                                                              47))
                                                           (* |p| |expon|)
                                                           (QREFELT $ 50))
                                                          (QREFELT $ 51)))
                                          (EXIT
                                           (LETT |ll|
                                                 (SPADCALL
                                                  (PROGN
                                                   (LETT #13# NIL)
                                                   (SEQ (LETT |v| NIL)
                                                        (LETT #12#
                                                              (SPADCALL |res|
                                                                        (QREFELT
                                                                         $
                                                                         48)))
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #12#)
                                                              (PROGN
                                                               (LETT |v|
                                                                     (CAR
                                                                      #12#))
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #13#
                                                                (CONS
                                                                 (VECTOR
                                                                  (QVELT |v| 0)
                                                                  (QVELT |v| 1)
                                                                  (*
                                                                   (* |expon|
                                                                      |p|)
                                                                   (QVELT |v|
                                                                          2)))
                                                                 #13#))))
                                                        (LETT #12# (CDR #12#))
                                                        (GO G190) G191
                                                        (EXIT
                                                         (NREVERSE #13#))))
                                                  |ll| (QREFELT $ 56))))))))))
                                ('T
                                 (SEQ
                                  (LETT |m2|
                                        (SPADCALL
                                         (SPADCALL |fac| (QREFELT $ 73))
                                         (QREFELT $ 60)))
                                  (LETT |unitPart|
                                        (SPADCALL |unitPart|
                                                  (SPADCALL
                                                   (SPADCALL |m2|
                                                             (QREFELT $ 47))
                                                   |expon| (QREFELT $ 50))
                                                  (QREFELT $ 51)))
                                  (EXIT
                                   (LETT |ll|
                                         (SPADCALL
                                          (PROGN
                                           (LETT #10# NIL)
                                           (SEQ (LETT |v| NIL)
                                                (LETT #9#
                                                      (SPADCALL |m2|
                                                                (QREFELT $
                                                                         48)))
                                                G190
                                                (COND
                                                 ((OR (ATOM #9#)
                                                      (PROGN
                                                       (LETT |v| (CAR #9#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #10#
                                                        (CONS
                                                         (VECTOR (QVELT |v| 0)
                                                                 (SPADCALL
                                                                  (QVELT |v| 1)
                                                                  (QREFELT $
                                                                           73))
                                                                 (* |expon|
                                                                    (QVELT |v|
                                                                           2)))
                                                         #10#))))
                                                (LETT #9# (CDR #9#)) (GO G190)
                                                G191 (EXIT (NREVERSE #10#))))
                                          |ll| (QREFELT $ 56))))))))
                              ('T
                               (SEQ
                                (LETT |ydeg|
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |w| NIL)
                                            (LETT #8#
                                                  (SPADCALL |fac|
                                                            (QREFELT $ 75)))
                                            G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |w| (CAR #8#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (PROGN
                                               (LETT #7#
                                                     (SPADCALL |w|
                                                               (QREFELT $ 22)))
                                               (COND
                                                (#5# (LETT #6# (MAX #6# #7#)))
                                                ('T
                                                 (PROGN
                                                  (LETT #6# #7#)
                                                  (LETT #5# 'T)))))))
                                            (LETT #8# (CDR #8#)) (GO G190) G191
                                            (EXIT NIL))
                                       (COND (#5# #6#)
                                             ('T (|IdentityError| '|max|)))))
                                (LETT |twoF|
                                      (SPADCALL |fac| |ydeg| |do_ext|
                                                (QREFELT $ 77)))
                                (LETT |nfl| (SPADCALL |twoF| (QREFELT $ 48)))
                                (COND
                                 ((EQL (LENGTH |nfl|) 1)
                                  (COND
                                   ((QEQCAR
                                     (QVELT (SPADCALL |nfl| 1 (QREFELT $ 78))
                                            0)
                                     0)
                                    (EXIT
                                     (PROGN
                                      (LETT #3# |twoF|)
                                      (GO #22=#:G208)))))))
                                (LETT |unitPart|
                                      (SPADCALL |unitPart|
                                                (SPADCALL
                                                 (SPADCALL |twoF|
                                                           (QREFELT $ 47))
                                                 |expon| (QREFELT $ 50))
                                                (QREFELT $ 51)))
                                (EXIT
                                 (LETT |ll|
                                       (SPADCALL
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ (LETT |v| NIL)
                                              (LETT #1#
                                                    (SPADCALL |twoF|
                                                              (QREFELT $ 48)))
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |v| (CAR #1#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (VECTOR (QVELT |v| 0)
                                                               (QVELT |v| 1)
                                                               (* |expon|
                                                                  (QVELT |v|
                                                                         2)))
                                                       #2#))))
                                              (LETT #1# (CDR #1#)) (GO G190)
                                              G191 (EXIT (NREVERSE #2#))))
                                        |ll| (QREFELT $ 56)))))))))
                       (LETT #15# (CDR #15#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |unitPart| |ll| (QREFELT $ 43)))))))
          #22# (EXIT #3#)))) 

(SDEFUN |TWOFACT;doTwoFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| |PthRootPow| $)
          (LETT |p| (QREFELT $$ 2))
          (LETT |PthRootPow| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|TWOFACT;pthRoot| |x| |p| |PthRootPow| $))))) 

(SDEFUN |TWOFACT;twoFactor;SupIF;8|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         (|dx| |Integer|)
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPADCALL |m| |dx| 'T (QREFELT $ 77))) 

(SDEFUN |TWOFACT;doExtension1|
        ((|m|
          . #1=(|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         (|n| |PositiveInteger|) (|dx| |Integer|)
         (|extField| |FiniteAlgebraicExtensionField| F)
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#2=#:G249 NIL)
          (#3=#:G248
           #4=(|Factored|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial| F))))
          (#5=#:G250 #4#) (#6=#:G260 NIL) (|ff1| NIL)
          (|lfactk|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#7=#:G238 NIL) (|ffn| (TP)) (#8=#:G244 NIL) (#9=#:G243 (TP))
          (#10=#:G245 (TP)) (#11=#:G259 NIL) (#12=#:G104 NIL)
          (|lfacth|
           (|List|
            #13=(|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| |extField|))))
          (#14=#:G258 NIL) (|g| NIL) (#15=#:G257 NIL) (|normfacs| (|List| TP))
          (#16=#:G254 NIL)
          (|ffu|
           (|Union|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
            #17="failed"))
          (|ff|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| |extField|)))
          (|c| (|extField|)) (#18=#:G256 NIL) (|fac| NIL) (#19=#:G255 NIL)
          (|Normp|
           (CATEGORY |package| (SIGNATURE |normFactors| ((|List| TP) TP))
            (SIGNATURE |retractIfCan|
             ((|Union|
               (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
               "failed")
              TP))
            (SIGNATURE |Frobenius| (TP TP))))
          (|flist|
           (|List|
            (|Record|
             (|:| |flag|
                  (|Union| #20="nil" #21="sqfr" #22="irred" #23="prime"))
             (|:| |factor| #13#) (|:| |exponent| (|NonNegativeInteger|)))))
          (|res1|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| |extField|))))
          (|m1| #1#) (|mm| (TP))
          (TP
           (|Join| (|UnivariatePolynomialCategory| |SUEx|)
                   . #24=((CATEGORY |domain|
                           (SIGNATURE |outputForm|
                            ((|OutputForm|) $ (|OutputForm|)))))))
          (|SUEx| (|Join| (|UnivariatePolynomialCategory| |extField|) . #24#)))
         (SEQ (LETT |SUEx| (|SparseUnivariatePolynomial| |extField|))
              (LETT TP (|SparseUnivariatePolynomial| |SUEx|))
              (LETT |mm|
                    (SPADCALL (|compiledLookupCheck| '|Zero| (LIST '$) TP)))
              (LETT |m1| |m|)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |m1| (|spadConstant| $ 9) (QREFELT $ 80)))
                     (GO G191)))
                   (SEQ
                    (LETT |mm|
                          (SPADCALL |mm|
                                    (SPADCALL
                                     (SPADCALL
                                      (|compiledLookupCheck| '|coerce|
                                                             (LIST '$
                                                                   (|devaluate|
                                                                    (ELT $ 6)))
                                                             |extField|)
                                      (SPADCALL |m1| (QREFELT $ 13))
                                      (|compiledLookupCheck| '|map|
                                                             (LIST
                                                              (|devaluate|
                                                               |SUEx|)
                                                              (LIST '|Mapping|
                                                                    (|devaluate|
                                                                     |extField|)
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          6)))
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (|devaluate|
                                                                (ELT $ 6))))
                                                             (|UnivariatePolynomialCategoryFunctions2|
                                                              (ELT $ 6)
                                                              (|SparseUnivariatePolynomial|
                                                               (ELT $ 6))
                                                              |extField|
                                                              |SUEx|)))
                                     (SPADCALL |m1| (QREFELT $ 15))
                                     (|compiledLookupCheck| '|monomial|
                                                            (LIST '$
                                                                  (|devaluate|
                                                                   |SUEx|)
                                                                  (LIST
                                                                   '|NonNegativeInteger|))
                                                            TP))
                                    (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                           TP)))
                    (EXIT (LETT |m1| (SPADCALL |m1| (QREFELT $ 16)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |res1|
                    (SPADCALL |mm| |dx| NIL
                              (|compiledLookupCheck| '|doFactor|
                                                     (LIST
                                                      (LIST '|Factored|
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (LIST
                                                              '|SparseUnivariatePolynomial|
                                                              (|devaluate|
                                                               |extField|))))
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         |extField|)))
                                                      (LIST '|Integer|)
                                                      (LIST '|Boolean|))
                                                     (|TwoFactorize|
                                                      |extField|))))
              (LETT |flist|
                    (SPADCALL |res1|
                              (|compiledLookupCheck| '|factorList|
                                                     (LIST
                                                      (LIST '|List|
                                                            (LIST '|Record|
                                                                  (LIST '|:|
                                                                        '|flag|
                                                                        (LIST
                                                                         '|Union|
                                                                         '#20#
                                                                         '#21#
                                                                         '#22#
                                                                         '#23#))
                                                                  (LIST '|:|
                                                                        '|factor|
                                                                        (LIST
                                                                         '|SparseUnivariatePolynomial|
                                                                         (LIST
                                                                          '|SparseUnivariatePolynomial|
                                                                          (|devaluate|
                                                                           |extField|))))
                                                                  (LIST '|:|
                                                                        '|exponent|
                                                                        (LIST
                                                                         '|NonNegativeInteger|))))
                                                      '$)
                                                     (|Factored|
                                                      (|SparseUnivariatePolynomial|
                                                       (|SparseUnivariatePolynomial|
                                                        |extField|))))))
              (EXIT
               (COND
                ((EQL (LENGTH |flist|) 1)
                 (COND
                  ((SPADCALL (QVELT (|SPADfirst| |flist|) 0) (CONS 3 "prime")
                             (QREFELT $ 49))
                   (SPADCALL |m| 1 (QREFELT $ 81)))
                  (#25='T (SPADCALL |m| 1 (QREFELT $ 82)))))
                (#25#
                 (SEQ
                  (LETT |Normp|
                        (|NormRetractPackage| (QREFELT $ 6) |extField| |SUEx|
                                              TP |n|))
                  (LETT |lfacth|
                        (PROGN
                         (LETT #19# NIL)
                         (SEQ (LETT |fac| NIL) (LETT #18# |flist|) G190
                              (COND
                               ((OR (ATOM #18#)
                                    (PROGN (LETT |fac| (CAR #18#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT (LETT #19# (CONS (QVELT |fac| 1) #19#))))
                              (LETT #18# (CDR #18#)) (GO G190) G191
                              (EXIT (NREVERSE #19#)))))
                  (LETT |lfactk| NIL)
                  (SEQ G190 (COND ((NULL (NULL (NULL |lfacth|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |ff| (|SPADfirst| |lfacth|))
                              (LETT |lfacth| (CDR |lfacth|))
                              (COND
                               ((SPADCALL
                                 (LETT |c|
                                       (SPADCALL
                                        (SPADCALL |ff|
                                                  (|compiledLookupCheck|
                                                   '|leadingCoefficient|
                                                   (LIST
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (|devaluate| |extField|))
                                                    '$)
                                                   (|SparseUnivariatePolynomial|
                                                    (|SparseUnivariatePolynomial|
                                                     |extField|))))
                                        (|compiledLookupCheck|
                                         '|leadingCoefficient|
                                         (LIST (|devaluate| |extField|) '$)
                                         |SUEx|)))
                                 (SPADCALL
                                  (|compiledLookupCheck| '|One| (LIST '$)
                                                         |extField|))
                                 (|compiledLookupCheck| '~=
                                                        (LIST (LIST '|Boolean|)
                                                              '$ '$)
                                                        |extField|))
                                (LETT |ff|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |c|
                                                  (|compiledLookupCheck| '|inv|
                                                                         (LIST
                                                                          '$
                                                                          '$)
                                                                         |extField|))
                                        (|compiledLookupCheck| '|coerce|
                                                               (LIST '$
                                                                     (|devaluate|
                                                                      |extField|))
                                                               |SUEx|))
                                       |ff|
                                       (|compiledLookupCheck| '*
                                                              (LIST '$
                                                                    (|devaluate|
                                                                     |SUEx|)
                                                                    '$)
                                                              TP)))))
                              (SEQ
                               (LETT |ffu|
                                     (SPADCALL |ff|
                                               (|compiledLookupCheck|
                                                '|retractIfCan|
                                                (LIST
                                                 (LIST '|Union|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate|
                                                          (ELT $ 6))))
                                                       '#17#)
                                                 (|devaluate| TP))
                                                |Normp|)))
                               (EXIT
                                (COND
                                 ((NULL (QEQCAR |ffu| 1))
                                  (PROGN
                                   (LETT #16#
                                         (LETT |lfactk|
                                               (CONS (QCDR |ffu|) |lfactk|)))
                                   (GO #26=#:G246))))))
                              (LETT |normfacs|
                                    (SPADCALL |ff|
                                              (|compiledLookupCheck|
                                               '|normFactors|
                                               (LIST
                                                (LIST '|List| (|devaluate| TP))
                                                (|devaluate| TP))
                                               |Normp|)))
                              (LETT |lfacth|
                                    (PROGN
                                     (LETT #15# NIL)
                                     (SEQ (LETT |g| NIL) (LETT #14# |lfacth|)
                                          G190
                                          (COND
                                           ((OR (ATOM #14#)
                                                (PROGN
                                                 (LETT |g| (CAR #14#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((NULL
                                               (SPADCALL |g| |normfacs|
                                                         (|compiledLookupCheck|
                                                          '|member?|
                                                          (LIST
                                                           (LIST '|Boolean|)
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate|
                                                              |extField|)))
                                                           '$)
                                                          (|List|
                                                           (|SparseUnivariatePolynomial|
                                                            (|SparseUnivariatePolynomial|
                                                             |extField|))))))
                                              (LETT #15# (CONS |g| #15#))))))
                                          (LETT #14# (CDR #14#)) (GO G190) G191
                                          (EXIT (NREVERSE #15#)))))
                              (LETT |ffn|
                                    (PROGN
                                     (LETT #8# NIL)
                                     (SEQ (LETT #12# NIL)
                                          (LETT #11# |normfacs|) G190
                                          (COND
                                           ((OR (ATOM #11#)
                                                (PROGN
                                                 (LETT #12# (CAR #11#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #10# #12#)
                                             (COND
                                              (#8#
                                               (LETT #9#
                                                     (SPADCALL #9# #10#
                                                               (|compiledLookupCheck|
                                                                '*
                                                                (LIST '$ '$ '$)
                                                                TP))))
                                              ('T
                                               (PROGN
                                                (LETT #9# #10#)
                                                (LETT #8# 'T)))))))
                                          (LETT #11# (CDR #11#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND (#8# #9#)
                                           ('T
                                            (SPADCALL
                                             (|compiledLookupCheck| '|One|
                                                                    (LIST '$)
                                                                    TP))))))
                              (EXIT
                               (LETT |lfactk|
                                     (CONS
                                      (PROG2
                                          (LETT #7#
                                                (SPADCALL |ffn|
                                                          (|compiledLookupCheck|
                                                           '|retractIfCan|
                                                           (LIST
                                                            (LIST '|Union|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          6))))
                                                                  '#17#)
                                                            (|devaluate| TP))
                                                           |Normp|)))
                                          (QCDR #7#)
                                        (|check_union2| (QEQCAR #7# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 6)))
                                                        (|Union|
                                                         (|SparseUnivariatePolynomial|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 6)))
                                                         #17#)
                                                        #7#))
                                      |lfactk|)))))
                        #26# (EXIT #16#))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |ff1| NIL) (LETT #6# |lfactk|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |ff1| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #5# (SPADCALL |ff1| 1 (QREFELT $ 81)))
                            (COND
                             (#2# (LETT #3# (SPADCALL #3# #5# (QREFELT $ 83))))
                             ('T (PROGN (LETT #3# #5#) (LETT #2# 'T)))))))
                         (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                    (COND (#2# #3#) (#25# (|spadConstant| $ 84)))))))))))) 

(SDEFUN |TWOFACT;doExtension|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         (|dx| |Integer|)
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G271 NIL) (#2=#:G272 NIL)
          (|res1|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|nsize| (|NonNegativeInteger|)) (#3=#:G273 NIL) (|n| NIL)
          (|ln| (|List| (|PositiveInteger|))))
         (SEQ
          (EXIT
           (SEQ (LETT |ln| (LIST 2 3 5 7 9 11 13 17 19 23 29))
                (SEQ (LETT |n| NIL) (LETT #3# |ln|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (LETT |nsize|
                              (SPADCALL (SPADCALL (QREFELT $ 69)) |n|
                                        (QREFELT $ 86)))
                        (LETT |res1|
                              (COND
                               ((< |nsize| 1000)
                                (|TWOFACT;doExtension1| |m| |n| |dx|
                                 (|FiniteFieldCyclicGroupExtension|
                                  (QREFELT $ 6) |n|)
                                 $))
                               ('T
                                (|TWOFACT;doExtension1| |m| |n| |dx|
                                 (|FiniteFieldExtension| (QREFELT $ 6) |n|)
                                 $))))
                        (EXIT
                         (COND
                          ((SPADCALL
                            (QVELT
                             (|SPADfirst| (SPADCALL |res1| (QREFELT $ 48))) 0)
                            (CONS 3 "prime") (QREFELT $ 49))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# |res1|) (GO #4=#:G270)))
                            (GO #5=#:G267)))))))
                      #5# (EXIT #1#))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT (|error| "doExtension : Impossible"))))
          #4# (EXIT #2#)))) 

(SDEFUN |TWOFACT;doFactor;SupIBF;11|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         (|dx| |Integer|) (|do_ext| |Boolean|)
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G289 NIL)
          (#2=#:G288
           #3=(|Factored|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial| F))))
          (#4=#:G290 #3#) (#5=#:G298 NIL) (|ff1| NIL)
          (|lfactk|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|ff|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|c| (F))
          (|lfacth|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|dx1| (|PositiveInteger|)) (#6=#:G283 NIL)
          (|lfact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#7=#:G297 NIL) (|lf| NIL) (#8=#:G296 NIL)
          (|lfact1|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fumv| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|prime| (|SparseUnivariatePolynomial| F)) (#9=#:G295 NIL)
          (|look| (|Boolean|)) (|umv| (|SparseUnivariatePolynomial| F))
          (|val| (F)) (|i| (|Integer|)) (|use_random| (|Boolean|))
          (|lcm| (|SparseUnivariatePolynomial| F)) (|try_max| (|Integer|))
          (|dm| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |look| 'T) (LETT |dm| (SPADCALL |m| (QREFELT $ 15)))
                (LETT |try_max| (MIN (+ |dx| 5) (SPADCALL (QREFELT $ 69))))
                (LETT |i| 0) (LETT |lcm| (SPADCALL |m| (QREFELT $ 13)))
                (LETT |use_random|
                      (< (SPADCALL 2 |try_max| (QREFELT $ 87))
                         (SPADCALL (QREFELT $ 69))))
                (SEQ G190
                     (COND
                      ((NULL (COND (|look| (< |i| |try_max|)) ('T NIL)))
                       (GO G191)))
                     (SEQ (LETT |i| (+ |i| 1))
                          (COND
                           (|use_random|
                            (LETT |val| (SPADCALL (QREFELT $ 88))))
                           ('T (LETT |val| (SPADCALL |i| (QREFELT $ 89)))))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |lcm| |val| (QREFELT $ 90))
                                       (QREFELT $ 91))
                             "next value")
                            ('T
                             (SEQ
                              (LETT |umv|
                                    (SPADCALL
                                     (CONS #'|TWOFACT;doFactor;SupIBF;11!0|
                                           (VECTOR $ |val|))
                                     |m| (QREFELT $ 94)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL
                                   (SPADCALL |umv|
                                             (SPADCALL |umv| (QREFELT $ 65))
                                             (QREFELT $ 95))
                                   (QREFELT $ 22))
                                  0 (QREFELT $ 96))
                                 "next val")
                                ('T (LETT |look| NIL)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 (|look|
                  (COND
                   ((NULL |do_ext|)
                    (EXIT
                     (PROGN
                      (LETT #9# (SPADCALL |m| 1 (QREFELT $ 82)))
                      (GO #10=#:G294)))))))
                (EXIT
                 (COND (|look| (|TWOFACT;doExtension| |m| |dx| $))
                       (#11='T
                        (SEQ
                         (LETT |prime|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 52) 1
                                          (QREFELT $ 21))
                                (SPADCALL |val| 0 (QREFELT $ 21))
                                (QREFELT $ 97)))
                         (LETT |fumv| (SPADCALL |umv| (QREFELT $ 62)))
                         (LETT |lfact1| (SPADCALL |fumv| (QREFELT $ 40)))
                         (EXIT
                          (COND
                           ((EQL (LENGTH |lfact1|) 1)
                            (SPADCALL |m| 1 (QREFELT $ 81)))
                           (#11#
                            (SEQ
                             (LETT |lfact|
                                   (PROGN
                                    (LETT #8# NIL)
                                    (SEQ (LETT |lf| NIL) (LETT #7# |lfact1|)
                                         G190
                                         (COND
                                          ((OR (ATOM #7#)
                                               (PROGN
                                                (LETT |lf| (CAR #7#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #8#
                                                 (CONS
                                                  (SPADCALL (ELT $ 98)
                                                            (QVELT |lf| 1)
                                                            (QREFELT $ 101))
                                                  #8#))))
                                         (LETT #7# (CDR #7#)) (GO G190) G191
                                         (EXIT (NREVERSE #8#)))))
                             (LETT |lfact|
                                   (CONS
                                    (SPADCALL (ELT $ 98)
                                              (SPADCALL |fumv| (QREFELT $ 35))
                                              (QREFELT $ 101))
                                    |lfact|))
                             (LETT |dx1|
                                   (PROG1 (LETT #6# (+ |dx| 1))
                                     (|check_subtype2| (> #6# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #6#)))
                             (LETT |lfacth|
                                   (SPADCALL |m| |lfact| |prime| |dx1|
                                             (QREFELT $ 104)))
                             (LETT |lfactk| NIL)
                             (SEQ G190
                                  (COND
                                   ((NULL (NULL (NULL |lfacth|))) (GO G191)))
                                  (SEQ (LETT |ff| (|SPADfirst| |lfacth|))
                                       (LETT |lfacth| (CDR |lfacth|))
                                       (COND
                                        ((SPADCALL
                                          (LETT |c|
                                                (SPADCALL
                                                 (SPADCALL |ff| (QREFELT $ 13))
                                                 (QREFELT $ 20)))
                                          (|spadConstant| $ 52)
                                          (QREFELT $ 105))
                                         (LETT |ff|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |c| (QREFELT $ 106))
                                                 (QREFELT $ 98))
                                                |ff| (QREFELT $ 57)))))
                                       (EXIT
                                        (LETT |lfactk| (CONS |ff| |lfactk|))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |ff1| NIL) (LETT #5# |lfactk|) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN (LETT |ff1| (CAR #5#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #4#
                                             (SPADCALL |ff1| 1 (QREFELT $ 81)))
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #4#
                                                         (QREFELT $ 83))))
                                        ('T
                                         (PROGN
                                          (LETT #2# #4#)
                                          (LETT #1# 'T)))))))
                                    (LETT #5# (CDR #5#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#)
                                     (#11# (|spadConstant| $ 84)))))))))))))))
          #10# (EXIT #9#)))) 

(SDEFUN |TWOFACT;doFactor;SupIBF;11!0| ((|x| NIL) ($$ NIL))
        (PROG (|val| $)
          (LETT |val| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |val| (QREFELT $ 90)))))) 

(DECLAIM (NOTINLINE |TwoFactorize;|)) 

(DEFUN |TwoFactorize| (#1=#:G299)
  (SPROG NIL
         (PROG (#2=#:G300)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TwoFactorize|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TwoFactorize;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TwoFactorize|)))))))))) 

(DEFUN |TwoFactorize;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|TwoFactorize| DV$1))
          (LETT $ (GETREFV 107))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TwoFactorize| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TwoFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|)
              (|SparseUnivariatePolynomial| 12) (4 . |Zero|) (|Boolean|)
              (8 . =) (|SparseUnivariatePolynomial| 6)
              (14 . |leadingCoefficient|) (|NonNegativeInteger|)
              (19 . |degree|) (24 . |reductum|) (29 . +) (35 . |Zero|) (39 . =)
              (45 . |leadingCoefficient|) (50 . |monomial|) (56 . |degree|)
              (61 . |monomial|) (67 . |reductum|) (72 . ^) (|Mapping| 6 6)
              (78 . |map|) (|Union| $ '"failed") (84 . |divideExponents|)
              (|Factored| 8) (90 . |Zero|) (|Factored| $) (94 . |squareFree|)
              (|Factored| 12) (99 . |unit|) (104 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 37) (|:| |factor| 12) (|:| |exponent| 14))
              (|List| 38) (109 . |factorList|)
              (|Record| (|:| |flag| 37) (|:| |factor| 8) (|:| |exponent| 14))
              (|List| 41) (114 . |makeFR|) (120 . |content|) (125 . |exquo|)
              (131 . |squareFree|) (136 . |unit|) (141 . |factorList|)
              (146 . =) (152 . ^) (158 . *) (164 . |One|) (168 . |One|)
              (172 . |One|) (176 . ~=) (182 . |append|) (188 . *)
              |TWOFACT;generalSqFr;SupF;4| |TWOFACT;tryTwoFactor;SupF;5|
              |TWOFACT;generalTwoFactor;SupF;6|
              (|DistinctDegreeFactorize| 6 12) (194 . |factor|) (199 . >)
              (205 . |differentiate|) (210 . |differentiate|) (|Mapping| 12 12)
              (215 . |map|) (221 . |characteristic|) (225 . |size|)
              (229 . |exquo|) (235 . |divideExponents|)
              (|CommuteUnivariatePolynomialCategory| 6 12 8) (241 . |swap|)
              (|List| 12) (246 . |coefficients|) (|Integer|)
              |TWOFACT;doFactor;SupIBF;11| (251 . |elt|)
              |TWOFACT;twoFactor;SupIF;8| (257 . ~=) (263 . |primeFactor|)
              (269 . |nilFactor|) (275 . *) (281 . |One|) (|PositiveInteger|)
              (285 . ^) (291 . *) (297 . |random|) (301 . |index|)
              (306 . |elt|) (312 . |zero?|) (|Mapping| 6 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 8 6 12)
              (317 . |map|) (323 . |gcd|) (329 . ~=) (335 . -) (341 . |coerce|)
              (|Mapping| 12 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 12 12 8)
              (346 . |map|) (|List| 8) (|GeneralHenselPackage| 12 8)
              (352 . |completeHensel|) (360 . ~=) (366 . |inv|))
           '#(|twoFactor| 371 |tryTwoFactor| 377 |generalTwoFactor| 382
              |generalSqFr| 387 |doFactor| 392)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 106
                                                 '(0 6 0 7 0 8 0 9 2 8 10 0 0
                                                   11 1 8 12 0 13 1 8 14 0 15 1
                                                   8 0 0 16 2 8 0 0 0 17 0 12 0
                                                   18 2 12 10 0 0 19 1 12 6 0
                                                   20 2 12 0 6 14 21 1 12 14 0
                                                   22 2 8 0 12 14 23 1 12 0 0
                                                   24 2 6 0 0 14 25 2 12 0 26 0
                                                   27 2 12 28 0 14 29 0 30 0 31
                                                   1 12 32 0 33 1 34 12 0 35 1
                                                   8 0 12 36 1 34 39 0 40 2 30
                                                   0 8 42 43 1 8 12 0 44 2 8 28
                                                   0 12 45 1 8 32 0 46 1 30 8 0
                                                   47 1 30 42 0 48 2 37 10 0 0
                                                   49 2 8 0 0 14 50 2 8 0 0 0
                                                   51 0 6 0 52 0 8 0 53 0 12 0
                                                   54 2 12 10 0 0 55 2 42 0 0 0
                                                   56 2 8 0 12 0 57 1 61 34 12
                                                   62 2 14 10 0 0 63 1 8 0 0 64
                                                   1 12 0 0 65 2 8 0 66 0 67 0
                                                   6 14 68 0 6 14 69 2 14 28 0
                                                   0 70 2 8 28 0 14 71 1 72 8 8
                                                   73 1 8 74 0 75 2 42 41 0 76
                                                   78 2 8 10 0 0 80 2 30 0 8 14
                                                   81 2 30 0 8 14 82 2 30 0 0 0
                                                   83 0 30 0 84 2 14 0 0 85 86
                                                   2 76 0 85 0 87 0 6 0 88 1 6
                                                   0 85 89 2 12 6 0 6 90 1 6 10
                                                   0 91 2 93 12 92 8 94 2 12 0
                                                   0 0 95 2 14 10 0 0 96 2 12 0
                                                   0 0 97 1 12 0 6 98 2 100 8
                                                   99 12 101 4 103 102 8 102 12
                                                   85 104 2 6 10 0 0 105 1 6 0
                                                   0 106 2 0 30 8 76 79 1 0 30
                                                   8 59 1 0 30 8 60 1 0 30 8 58
                                                   3 0 30 8 76 10 77)))))
           '|lookupComplete|)) 
