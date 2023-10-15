
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
                       |p| (QREFELT $ 29))
                      |TWOFACT;pthRoot|)
                (EXIT
                 (COND
                  ((QEQCAR |tmp| 1) (|error| "consistency error in TwoFactor"))
                  ('T (QCDR |tmp|))))))) 

(SDEFUN |TWOFACT;pthRoot!0| ((|x| NIL) ($$ NIL))
        (PROG (|PthRootPow| $)
          (LETT |PthRootPow| (QREFELT $$ 1) . #1=(|TWOFACT;pthRoot|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |PthRootPow| (QREFELT $ 25)))))) 

(SDEFUN |TWOFACT;generalSqFr;SupF;4|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|pfaclist|
           (|List|
            (|Record|
             (|:| |flg| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
             (|:| |fctr|
                  (|SparseUnivariatePolynomial|
                   (|SparseUnivariatePolynomial| F)))
             (|:| |xpnt| (|Integer|)))))
          (|contlist|
           (|List|
            (|Record| (|:| |flg| (|Union| #1# #2# #3# #4#))
                      (|:| |fctr|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |xpnt| (|Integer|)))))
          (#5=#:G166 NIL) (|w| NIL) (#6=#:G165 NIL)
          (|sqp| #7=(|Factored| (|SparseUnivariatePolynomial| F)))
          (|unitPart|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#8=#:G164 NIL) (|v| NIL)
          (|nfacs|
           #9=(|Factored|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial| F))))
          (|uexp| (|NonNegativeInteger|)) (#10=#:G151 NIL) (#11=#:G163 NIL)
          (|u| NIL) (|sqfrm| #9#) (#12=#:G149 NIL)
          (|cont| (|SparseUnivariatePolynomial| F)) (#13=#:G162 NIL)
          (#14=#:G161 NIL) (|l| #7#))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| $ 9) (QREFELT $ 11))
            (|spadConstant| $ 31))
           ((EQL (SPADCALL |m| (QREFELT $ 15)) 0)
            (SEQ
             (LETT |l| (SPADCALL (SPADCALL |m| (QREFELT $ 13)) (QREFELT $ 33))
                   . #15=(|TWOFACT;generalSqFr;SupF;4|))
             (EXIT
              (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 35)) (QREFELT $ 36))
                        (PROGN
                         (LETT #14# NIL . #15#)
                         (SEQ (LETT |u| NIL . #15#)
                              (LETT #13# (SPADCALL |l| (QREFELT $ 40)) . #15#)
                              G190
                              (COND
                               ((OR (ATOM #13#)
                                    (PROGN (LETT |u| (CAR #13#) . #15#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #14#
                                      (CONS
                                       (VECTOR (QVELT |u| 0)
                                               (SPADCALL (QVELT |u| 1)
                                                         (QREFELT $ 36))
                                               (QVELT |u| 2))
                                       #14#)
                                      . #15#)))
                              (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                              (EXIT (NREVERSE #14#))))
                        (QREFELT $ 43)))))
           (#16='T
            (SEQ (LETT |cont| (SPADCALL |m| (QREFELT $ 44)) . #15#)
                 (LETT |m|
                       (PROG2
                           (LETT #12# (SPADCALL |m| |cont| (QREFELT $ 45))
                                 . #15#)
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
                                         #12#))
                       . #15#)
                 (LETT |sqfrm| (SPADCALL |m| (QREFELT $ 46)) . #15#)
                 (LETT |pfaclist| NIL . #15#)
                 (LETT |unitPart| (SPADCALL |sqfrm| (QREFELT $ 47)) . #15#)
                 (SEQ (LETT |u| NIL . #15#)
                      (LETT #11# (SPADCALL |sqfrm| (QREFELT $ 48)) . #15#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |u| (CAR #11#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |u| 0) (CONS 0 "nil")
                                    (QREFELT $ 49))
                          (SEQ
                           (LETT |uexp|
                                 (PROG1 (LETT #10# (QVELT |u| 2) . #15#)
                                   (|check_subtype2| (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#))
                                 . #15#)
                           (LETT |nfacs|
                                 (SPADCALL
                                  (|TWOFACT;exchangeVars| (QVELT |u| 1) $)
                                  (QREFELT $ 46))
                                 . #15#)
                           (SEQ (LETT |v| NIL . #15#)
                                (LETT #8# (SPADCALL |nfacs| (QREFELT $ 48))
                                      . #15#)
                                G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |v| (CAR #8#) . #15#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |pfaclist|
                                        (CONS
                                         (VECTOR (QVELT |v| 0)
                                                 (|TWOFACT;exchangeVars|
                                                  (QVELT |v| 1) $)
                                                 (* (QVELT |v| 2) |uexp|))
                                         |pfaclist|)
                                        . #15#)))
                                (LETT #8# (CDR #8#) . #15#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (LETT |unitPart|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |nfacs| (QREFELT $ 47))
                                             |uexp| (QREFELT $ 50))
                                   |unitPart| (QREFELT $ 51))
                                  . #15#))))
                         ('T (LETT |pfaclist| (CONS |u| |pfaclist|) . #15#)))))
                      (LETT #11# (CDR #11#) . #15#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((SPADCALL |cont| (|spadConstant| $ 54) (QREFELT $ 55))
                    (SEQ (LETT |sqp| (SPADCALL |cont| (QREFELT $ 33)) . #15#)
                         (LETT |contlist|
                               (PROGN
                                (LETT #6# NIL . #15#)
                                (SEQ (LETT |w| NIL . #15#)
                                     (LETT #5# (SPADCALL |sqp| (QREFELT $ 40))
                                           . #15#)
                                     G190
                                     (COND
                                      ((OR (ATOM #5#)
                                           (PROGN
                                            (LETT |w| (CAR #5#) . #15#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #6#
                                             (CONS
                                              (VECTOR (QVELT |w| 0)
                                                      (SPADCALL (QVELT |w| 1)
                                                                (QREFELT $ 36))
                                                      (QVELT |w| 2))
                                              #6#)
                                             . #15#)))
                                     (LETT #5# (CDR #5#) . #15#) (GO G190) G191
                                     (EXIT (NREVERSE #6#))))
                               . #15#)
                         (LETT |pfaclist| (APPEND |contlist| |pfaclist|)
                               . #15#)
                         (EXIT
                          (SPADCALL
                           (SPADCALL (SPADCALL |sqp| (QREFELT $ 35)) |unitPart|
                                     (QREFELT $ 56))
                           |pfaclist| (QREFELT $ 43)))))
                   (#16#
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
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |xpnt| (|Integer|)))))
          (#1=#:G224 NIL) (|v| NIL) (#2=#:G223 NIL)
          (|unitPart|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#3=#:G212 NIL)
          (|nfl|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |xpnt| (|Integer|)))))
          (|twoF|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|ydeg| #4=(|NonNegativeInteger|)) (#5=#:G199 NIL) (#6=#:G198 #4#)
          (#7=#:G200 #4#) (#8=#:G222 NIL) (|w| NIL) (#9=#:G221 NIL)
          (#10=#:G220 NIL)
          (|m2|
           #11=(|Factored|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| F))))
          (#12=#:G219 NIL) (#13=#:G218 NIL) (|res| #11#)
          (|m1|
           (|Union|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
            "failed"))
          (|PthRootPow| (|NonNegativeInteger|)) (#14=#:G189 NIL)
          (|p| (|NonNegativeInteger|))
          (|fac|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|expon| (|NonNegativeInteger|)) (#15=#:G186 NIL)
          (|expo| (|Integer|)) (#16=#:G217 NIL) (|u| NIL)
          (|sqfrm|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#17=#:G216 NIL) (#18=#:G215 NIL)
          (|contfact| #19=(|Factored| (|SparseUnivariatePolynomial| F)))
          (|cont| (|SparseUnivariatePolynomial| F)) (#20=#:G214 NIL)
          (#21=#:G213 NIL) (|l| #19#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |m| (|spadConstant| $ 9) (QREFELT $ 11))
             (|spadConstant| $ 31))
            ((EQL (SPADCALL |m| (QREFELT $ 15)) 0)
             (SEQ
              (LETT |l| (SPADCALL (SPADCALL |m| (QREFELT $ 13)) (QREFELT $ 61))
                    . #22=(|TWOFACT;doTwoFactor|))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |l| (QREFELT $ 35)) (QREFELT $ 36))
                (PROGN
                 (LETT #21# NIL . #22#)
                 (SEQ (LETT |u| NIL . #22#)
                      (LETT #20# (SPADCALL |l| (QREFELT $ 40)) . #22#) G190
                      (COND
                       ((OR (ATOM #20#)
                            (PROGN (LETT |u| (CAR #20#) . #22#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #21#
                              (CONS
                               (VECTOR (QVELT |u| 0)
                                       (SPADCALL (QVELT |u| 1) (QREFELT $ 36))
                                       (QVELT |u| 2))
                               #21#)
                              . #22#)))
                      (LETT #20# (CDR #20#) . #22#) (GO G190) G191
                      (EXIT (NREVERSE #21#))))
                (QREFELT $ 43)))))
            (#23='T
             (SEQ (LETT |ll| NIL . #22#)
                  (LETT |cont| (SPADCALL |m| (QREFELT $ 44)) . #22#)
                  (COND
                   ((SPADCALL (SPADCALL |cont| (QREFELT $ 22)) 0
                              (QREFELT $ 62))
                    (SEQ
                     (LETT |m1| (SPADCALL |m| |cont| (QREFELT $ 45)) . #22#)
                     (EXIT
                      (COND
                       ((QEQCAR |m1| 1) (|error| "content doesn't divide"))
                       (#23#
                        (SEQ (LETT |m| (QCDR |m1|) . #22#)
                             (LETT |contfact| (SPADCALL |cont| (QREFELT $ 61))
                                   . #22#)
                             (LETT |unitPart|
                                   (SPADCALL
                                    (SPADCALL |contfact| (QREFELT $ 35))
                                    (QREFELT $ 36))
                                   . #22#)
                             (EXIT
                              (LETT |ll|
                                    (PROGN
                                     (LETT #18# NIL . #22#)
                                     (SEQ (LETT |w| NIL . #22#)
                                          (LETT #17#
                                                (SPADCALL |contfact|
                                                          (QREFELT $ 40))
                                                . #22#)
                                          G190
                                          (COND
                                           ((OR (ATOM #17#)
                                                (PROGN
                                                 (LETT |w| (CAR #17#) . #22#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #18#
                                                  (CONS
                                                   (VECTOR (QVELT |w| 0)
                                                           (SPADCALL
                                                            (QVELT |w| 1)
                                                            (QREFELT $ 36))
                                                           (QVELT |w| 2))
                                                   #18#)
                                                  . #22#)))
                                          (LETT #17# (CDR #17#) . #22#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #18#))))
                                    . #22#))))))))
                   (#23#
                    (LETT |unitPart| (SPADCALL |cont| (QREFELT $ 36)) . #22#)))
                  (LETT |sqfrm| (SPADCALL |m| (QREFELT $ 46)) . #22#)
                  (SEQ (LETT |u| NIL . #22#)
                       (LETT #16# (SPADCALL |sqfrm| (QREFELT $ 65)) . #22#)
                       G190
                       (COND
                        ((OR (ATOM #16#)
                             (PROGN (LETT |u| (CAR #16#) . #22#) NIL))
                         (GO G191)))
                       (SEQ (LETT |expo| (QCDR |u|) . #22#)
                            (COND
                             ((< |expo| 0)
                              (|error|
                               "negative exponent in a factorisation")))
                            (LETT |expon|
                                  (PROG1 (LETT #15# |expo| . #22#)
                                    (|check_subtype2| (>= #15# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #15#))
                                  . #22#)
                            (LETT |fac| (QCAR |u|) . #22#)
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |fac| (QREFELT $ 15)) 1)
                               (LETT |ll|
                                     (CONS
                                      (VECTOR (CONS 2 "irred") |fac| |expon|)
                                      |ll|)
                                     . #22#))
                              ((SPADCALL (SPADCALL |fac| (QREFELT $ 66))
                                         (|spadConstant| $ 9) (QREFELT $ 11))
                               (COND
                                ((SPADCALL
                                  (SPADCALL (ELT $ 67) |fac| (QREFELT $ 69))
                                  (|spadConstant| $ 9) (QREFELT $ 11))
                                 (SEQ
                                  (LETT |p| (SPADCALL (QREFELT $ 70)) . #22#)
                                  (LETT |PthRootPow|
                                        (PROG2
                                            (LETT #14#
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 71))
                                                   |p| (QREFELT $ 72))
                                                  . #22#)
                                            (QCDR #14#)
                                          (|check_union2| (QEQCAR #14# 0)
                                                          (|NonNegativeInteger|)
                                                          (|Union|
                                                           (|NonNegativeInteger|)
                                                           "failed")
                                                          #14#))
                                        . #22#)
                                  (LETT |m1|
                                        (SPADCALL
                                         (SPADCALL
                                          (CONS #'|TWOFACT;doTwoFactor!0|
                                                (VECTOR $ |PthRootPow| |p|))
                                          |fac| (QREFELT $ 69))
                                         |p| (QREFELT $ 73))
                                        . #22#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |m1| 1)
                                     (|error|
                                      "consistency error in TwoFactor"))
                                    ('T
                                     (SEQ
                                      (LETT |res|
                                            (SPADCALL (QCDR |m1|)
                                                      (QREFELT $ 59))
                                            . #22#)
                                      (LETT |unitPart|
                                            (SPADCALL |unitPart|
                                                      (SPADCALL
                                                       (SPADCALL |res|
                                                                 (QREFELT $
                                                                          47))
                                                       (* |p| |expon|)
                                                       (QREFELT $ 50))
                                                      (QREFELT $ 51))
                                            . #22#)
                                      (EXIT
                                       (LETT |ll|
                                             (APPEND
                                              (PROGN
                                               (LETT #13# NIL . #22#)
                                               (SEQ (LETT |v| NIL . #22#)
                                                    (LETT #12#
                                                          (SPADCALL |res|
                                                                    (QREFELT $
                                                                             48))
                                                          . #22#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #12#)
                                                          (PROGN
                                                           (LETT |v| (CAR #12#)
                                                                 . #22#)
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
                                                               (* |expon| |p|)
                                                               (QVELT |v| 2)))
                                                             #13#)
                                                            . #22#)))
                                                    (LETT #12# (CDR #12#)
                                                          . #22#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #13#))))
                                              |ll|)
                                             . #22#))))))))
                                ('T
                                 (SEQ
                                  (LETT |m2|
                                        (SPADCALL
                                         (SPADCALL |fac| (QREFELT $ 75))
                                         (QREFELT $ 59))
                                        . #22#)
                                  (LETT |unitPart|
                                        (SPADCALL |unitPart|
                                                  (SPADCALL
                                                   (SPADCALL |m2|
                                                             (QREFELT $ 47))
                                                   |expon| (QREFELT $ 50))
                                                  (QREFELT $ 51))
                                        . #22#)
                                  (EXIT
                                   (LETT |ll|
                                         (APPEND
                                          (PROGN
                                           (LETT #10# NIL . #22#)
                                           (SEQ (LETT |v| NIL . #22#)
                                                (LETT #9#
                                                      (SPADCALL |m2|
                                                                (QREFELT $ 48))
                                                      . #22#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #9#)
                                                      (PROGN
                                                       (LETT |v| (CAR #9#)
                                                             . #22#)
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
                                                                           75))
                                                                 (SPADCALL
                                                                  |expon|
                                                                  (QVELT |v| 2)
                                                                  (QREFELT $
                                                                           77)))
                                                         #10#)
                                                        . #22#)))
                                                (LETT #9# (CDR #9#) . #22#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #10#))))
                                          |ll|)
                                         . #22#))))))
                              ('T
                               (SEQ
                                (LETT |ydeg|
                                      (PROGN
                                       (LETT #5# NIL . #22#)
                                       (SEQ (LETT |w| NIL . #22#)
                                            (LETT #8#
                                                  (SPADCALL |fac|
                                                            (QREFELT $ 79))
                                                  . #22#)
                                            G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |w| (CAR #8#) . #22#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (PROGN
                                               (LETT #7#
                                                     (SPADCALL |w|
                                                               (QREFELT $ 22))
                                                     . #22#)
                                               (COND
                                                (#5#
                                                 (LETT #6# (MAX #6# #7#)
                                                       . #22#))
                                                ('T
                                                 (PROGN
                                                  (LETT #6# #7# . #22#)
                                                  (LETT #5# 'T . #22#)))))))
                                            (LETT #8# (CDR #8#) . #22#)
                                            (GO G190) G191 (EXIT NIL))
                                       (COND (#5# #6#)
                                             ('T (|IdentityError| '|max|))))
                                      . #22#)
                                (LETT |twoF|
                                      (SPADCALL |fac| |ydeg| |do_ext|
                                                (QREFELT $ 80))
                                      . #22#)
                                (LETT |nfl| (SPADCALL |twoF| (QREFELT $ 48))
                                      . #22#)
                                (COND
                                 ((EQL (LENGTH |nfl|) 1)
                                  (COND
                                   ((QEQCAR
                                     (QVELT (SPADCALL |nfl| 1 (QREFELT $ 81))
                                            0)
                                     0)
                                    (EXIT
                                     (PROGN
                                      (LETT #3# |twoF| . #22#)
                                      (GO #24=#:G211)))))))
                                (LETT |unitPart|
                                      (SPADCALL |unitPart|
                                                (SPADCALL
                                                 (SPADCALL |twoF|
                                                           (QREFELT $ 47))
                                                 |expon| (QREFELT $ 50))
                                                (QREFELT $ 51))
                                      . #22#)
                                (EXIT
                                 (LETT |ll|
                                       (APPEND
                                        (PROGN
                                         (LETT #2# NIL . #22#)
                                         (SEQ (LETT |v| NIL . #22#)
                                              (LETT #1#
                                                    (SPADCALL |twoF|
                                                              (QREFELT $ 48))
                                                    . #22#)
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |v| (CAR #1#)
                                                           . #22#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (VECTOR (QVELT |v| 0)
                                                               (QVELT |v| 1)
                                                               (SPADCALL
                                                                |expon|
                                                                (QVELT |v| 2)
                                                                (QREFELT $
                                                                         77)))
                                                       #2#)
                                                      . #22#)))
                                              (LETT #1# (CDR #1#) . #22#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        |ll|)
                                       . #22#)))))))
                       (LETT #16# (CDR #16#) . #22#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |unitPart| |ll| (QREFELT $ 43)))))))
          #24# (EXIT #3#)))) 

(SDEFUN |TWOFACT;doTwoFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| |PthRootPow| $)
          (LETT |p| (QREFELT $$ 2) . #1=(|TWOFACT;doTwoFactor|))
          (LETT |PthRootPow| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|TWOFACT;pthRoot| |x| |p| |PthRootPow| $))))) 

(SDEFUN |TWOFACT;twoFactor;SupIF;8|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         (|dx| |Integer|)
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPADCALL |m| |dx| 'T (QREFELT $ 80))) 

(SDEFUN |TWOFACT;doExtension1|
        ((|m|
          . #1=(|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         (|n| |PositiveInteger|) (|dx| |Integer|)
         (|extField| |FiniteAlgebraicExtensionField| F)
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#2=#:G252 NIL)
          (#3=#:G251
           #4=(|Factored|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial| F))))
          (#5=#:G253 #4#) (#6=#:G263 NIL) (|ff1| NIL)
          (|lfactk|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#7=#:G241 NIL) (|ffn| (TP)) (#8=#:G247 NIL) (#9=#:G246 (TP))
          (#10=#:G248 (TP)) (#11=#:G262 NIL) (#12=#:G104 NIL)
          (|lfacth|
           (|List|
            #13=(|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| |extField|))))
          (#14=#:G261 NIL) (|g| NIL) (#15=#:G260 NIL) (|normfacs| (|List| TP))
          (#16=#:G257 NIL)
          (|ffu|
           (|Union|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
            #17="failed"))
          (|ff|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| |extField|)))
          (|c| (|extField|)) (#18=#:G259 NIL) (|fac| NIL) (#19=#:G258 NIL)
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
            (|Record| (|:| |factor| #13#) (|:| |exponent| (|Integer|)))))
          (|res1|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| |extField|))))
          (|m1| #1#) (|mm| (TP))
          (TP
           (|Join| (|UnivariatePolynomialCategory| |SUEx|)
                   (CATEGORY |domain|
                    #20=(SIGNATURE |outputForm|
                         ((|OutputForm|) $ (|OutputForm|)))
                    (IF (|has| |SUEx| . #21=((|Ring|)))
                        (SIGNATURE |fmecg|
                         ($ $ #22=(|NonNegativeInteger|) |SUEx| . #23=($)))
                        . #24=(|noBranch|)))))
          (|SUEx|
           (|Join| (|UnivariatePolynomialCategory| |extField|)
                   (CATEGORY |domain| #20#
                    (IF (|has| |extField| . #21#)
                        (SIGNATURE |fmecg| ($ $ #22# |extField| . #23#))
                        . #24#)))))
         (SEQ
          (LETT |SUEx| (|SparseUnivariatePolynomial| |extField|)
                . #25=(|TWOFACT;doExtension1|))
          (LETT TP (|SparseUnivariatePolynomial| |SUEx|) . #25#)
          (LETT |mm| (SPADCALL (|compiledLookupCheck| '|Zero| (LIST '$) TP))
                . #25#)
          (LETT |m1| |m| . #25#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |m1| (|spadConstant| $ 9) (QREFELT $ 83)))
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
                                                          (|devaluate| |SUEx|)
                                                          (LIST '|Mapping|
                                                                (|devaluate|
                                                                 |extField|)
                                                                (|devaluate|
                                                                 (ELT $ 6)))
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate|
                                                            (ELT $ 6))))
                                                         (|UnivariatePolynomialCategoryFunctions2|
                                                          (ELT $ 6)
                                                          (|SparseUnivariatePolynomial|
                                                           (ELT $ 6))
                                                          |extField| |SUEx|)))
                                 (SPADCALL |m1| (QREFELT $ 15))
                                 (|compiledLookupCheck| '|monomial|
                                                        (LIST '$
                                                              (|devaluate|
                                                               |SUEx|)
                                                              (LIST
                                                               '|NonNegativeInteger|))
                                                        TP))
                                (|compiledLookupCheck| '+ (LIST '$ '$ '$) TP))
                      . #25#)
                (EXIT (LETT |m1| (SPADCALL |m1| (QREFELT $ 16)) . #25#)))
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
                                                    (|devaluate| |extField|)))
                                                  (LIST '|Integer|)
                                                  (LIST '|Boolean|))
                                                 (|TwoFactorize| |extField|)))
                . #25#)
          (LETT |flist|
                (SPADCALL |res1|
                          (|compiledLookupCheck| '|factors|
                                                 (LIST
                                                  (LIST '|List|
                                                        (LIST '|Record|
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
                                                                     '|Integer|))))
                                                  '$)
                                                 (|Factored|
                                                  (|SparseUnivariatePolynomial|
                                                   (|SparseUnivariatePolynomial|
                                                    |extField|)))))
                . #25#)
          (EXIT
           (COND
            ((EQL (LENGTH |flist|) 1)
             (COND
              ((SPADCALL
                (SPADCALL |res1| 1
                          (|compiledLookupCheck| '|nthFlag|
                                                 (LIST
                                                  (LIST '|Union| '"nil" '"sqfr"
                                                        '"irred" '"prime")
                                                  '$ (LIST '|Integer|))
                                                 (|Factored|
                                                  (|SparseUnivariatePolynomial|
                                                   (|SparseUnivariatePolynomial|
                                                    |extField|)))))
                (CONS 3 "prime") (QREFELT $ 49))
               (SPADCALL |m| 1 (QREFELT $ 84)))
              (#26='T (SPADCALL |m| 1 (QREFELT $ 85)))))
            (#26#
             (SEQ
              (LETT |Normp|
                    (|NormRetractPackage| (QREFELT $ 6) |extField| |SUEx| TP
                                          |n|)
                    . #25#)
              (LETT |lfacth|
                    (PROGN
                     (LETT #19# NIL . #25#)
                     (SEQ (LETT |fac| NIL . #25#)
                          (LETT #18#
                                (SPADCALL |res1|
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
                                                                           (LIST
                                                                            '|SparseUnivariatePolynomial|
                                                                            (|devaluate|
                                                                             |extField|))))
                                                                         (LIST
                                                                          '|:|
                                                                          '|exponent|
                                                                          (LIST
                                                                           '|Integer|))))
                                                                  '$)
                                                                 (|Factored|
                                                                  (|SparseUnivariatePolynomial|
                                                                   (|SparseUnivariatePolynomial|
                                                                    |extField|)))))
                                . #25#)
                          G190
                          (COND
                           ((OR (ATOM #18#)
                                (PROGN (LETT |fac| (CAR #18#) . #25#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #19# (CONS (QCAR |fac|) #19#) . #25#)))
                          (LETT #18# (CDR #18#) . #25#) (GO G190) G191
                          (EXIT (NREVERSE #19#))))
                    . #25#)
              (LETT |lfactk| NIL . #25#)
              (SEQ G190 (COND ((NULL (NULL (NULL |lfacth|))) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |ff| (|SPADfirst| |lfacth|) . #25#)
                          (LETT |lfacth| (CDR |lfacth|) . #25#)
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
                                     |SUEx|))
                                   . #25#)
                             (SPADCALL
                              (|compiledLookupCheck| '|One| (LIST '$)
                                                     |extField|))
                             (|compiledLookupCheck| '~=
                                                    (LIST (LIST '|Boolean|) '$
                                                          '$)
                                                    |extField|))
                            (LETT |ff|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |c|
                                              (|compiledLookupCheck| '|inv|
                                                                     (LIST '$
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
                                                          TP))
                                  . #25#)))
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
                                                     (|devaluate| (ELT $ 6))))
                                                   '#17#)
                                             (|devaluate| TP))
                                            |Normp|))
                                 . #25#)
                           (EXIT
                            (COND
                             ((NULL (QEQCAR |ffu| 1))
                              (PROGN
                               (LETT #16#
                                     (LETT |lfactk|
                                           (CONS (QCDR |ffu|) |lfactk|) . #25#)
                                     . #25#)
                               (GO #27=#:G249))))))
                          (LETT |normfacs|
                                (SPADCALL |ff|
                                          (|compiledLookupCheck| '|normFactors|
                                                                 (LIST
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         TP))
                                                                  (|devaluate|
                                                                   TP))
                                                                 |Normp|))
                                . #25#)
                          (LETT |lfacth|
                                (PROGN
                                 (LETT #15# NIL . #25#)
                                 (SEQ (LETT |g| NIL . #25#)
                                      (LETT #14# |lfacth| . #25#) G190
                                      (COND
                                       ((OR (ATOM #14#)
                                            (PROGN
                                             (LETT |g| (CAR #14#) . #25#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (SPADCALL |g| |normfacs|
                                                     (|compiledLookupCheck|
                                                      '|member?|
                                                      (LIST (LIST '|Boolean|)
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
                                          (LETT #15# (CONS |g| #15#)
                                                . #25#)))))
                                      (LETT #14# (CDR #14#) . #25#) (GO G190)
                                      G191 (EXIT (NREVERSE #15#))))
                                . #25#)
                          (LETT |ffn|
                                (PROGN
                                 (LETT #8# NIL . #25#)
                                 (SEQ (LETT #12# NIL . #25#)
                                      (LETT #11# |normfacs| . #25#) G190
                                      (COND
                                       ((OR (ATOM #11#)
                                            (PROGN
                                             (LETT #12# (CAR #11#) . #25#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #10# #12# . #25#)
                                         (COND
                                          (#8#
                                           (LETT #9#
                                                 (SPADCALL #9# #10#
                                                           (|compiledLookupCheck|
                                                            '* (LIST '$ '$ '$)
                                                            TP))
                                                 . #25#))
                                          ('T
                                           (PROGN
                                            (LETT #9# #10# . #25#)
                                            (LETT #8# 'T . #25#)))))))
                                      (LETT #11# (CDR #11#) . #25#) (GO G190)
                                      G191 (EXIT NIL))
                                 (COND (#8# #9#)
                                       ('T
                                        (SPADCALL
                                         (|compiledLookupCheck| '|One|
                                                                (LIST '$)
                                                                TP)))))
                                . #25#)
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
                                                                 (ELT $ 6))))
                                                              '#17#)
                                                        (|devaluate| TP))
                                                       |Normp|))
                                            . #25#)
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
                                  |lfactk|)
                                 . #25#))))
                    #27# (EXIT #16#))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL . #25#)
                (SEQ (LETT |ff1| NIL . #25#) (LETT #6# |lfactk| . #25#) G190
                     (COND
                      ((OR (ATOM #6#)
                           (PROGN (LETT |ff1| (CAR #6#) . #25#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #5# (SPADCALL |ff1| 1 (QREFELT $ 84)) . #25#)
                        (COND
                         (#2#
                          (LETT #3# (SPADCALL #3# #5# (QREFELT $ 86)) . #25#))
                         ('T
                          (PROGN
                           (LETT #3# #5# . #25#)
                           (LETT #2# 'T . #25#)))))))
                     (LETT #6# (CDR #6#) . #25#) (GO G190) G191 (EXIT NIL))
                (COND (#2# #3#) (#26# (|spadConstant| $ 87)))))))))))) 

(SDEFUN |TWOFACT;doExtension|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         (|dx| |Integer|)
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G273 NIL) (#2=#:G274 NIL)
          (|res1|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|nsize| (|NonNegativeInteger|)) (#3=#:G275 NIL) (|n| NIL)
          (|ln| (|List| (|PositiveInteger|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ln| (LIST 2 3 5 7 9 11 13 17 19 23 29)
                  . #4=(|TWOFACT;doExtension|))
            (SEQ (LETT |n| NIL . #4#) (LETT #3# |ln| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |nsize|
                          (SPADCALL (SPADCALL (QREFELT $ 71)) |n|
                                    (QREFELT $ 89))
                          . #4#)
                    (LETT |res1|
                          (COND
                           ((< |nsize| 1000)
                            (|TWOFACT;doExtension1| |m| |n| |dx|
                             (|FiniteFieldCyclicGroupExtension| (QREFELT $ 6)
                                                                |n|)
                             $))
                           ('T
                            (|TWOFACT;doExtension1| |m| |n| |dx|
                             (|FiniteFieldExtension| (QREFELT $ 6) |n|) $)))
                          . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |res1| 1 (QREFELT $ 90))
                                 (CONS 3 "prime") (QREFELT $ 49))
                       (PROGN
                        (LETT #1#
                              (PROGN (LETT #2# |res1| . #4#) (GO #5=#:G272))
                              . #4#)
                        (GO #6=#:G269)))))))
                  #6# (EXIT #1#))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "doExtension : Impossible"))))
          #5# (EXIT #2#)))) 

(SDEFUN |TWOFACT;doFactor;SupIBF;11|
        ((|m| |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))
         (|dx| |Integer|) (|do_ext| |Boolean|)
         ($ |Factored|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G291 NIL)
          (#2=#:G290
           #3=(|Factored|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial| F))))
          (#4=#:G292 #3#) (#5=#:G300 NIL) (|ff1| NIL)
          (|lfactk|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|ff|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|c| (F))
          (|lfacth|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|dx1| (|PositiveInteger|)) (#6=#:G285 NIL)
          (|lfact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#7=#:G299 NIL) (|lf| NIL) (#8=#:G298 NIL)
          (|lfact1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|Integer|)))))
          (|fumv| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|prime| (|SparseUnivariatePolynomial| F)) (#9=#:G297 NIL)
          (|look| (|Boolean|)) (|umv| (|SparseUnivariatePolynomial| F))
          (|val| (F)) (|i| (|Integer|)) (|use_random| (|Boolean|))
          (|lcm| (|SparseUnivariatePolynomial| F)) (|try_max| (|Integer|))
          (|dm| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |look| 'T . #10=(|TWOFACT;doFactor;SupIBF;11|))
                (LETT |dm| (SPADCALL |m| (QREFELT $ 15)) . #10#)
                (LETT |try_max| (MIN (+ |dx| 5) (SPADCALL (QREFELT $ 71)))
                      . #10#)
                (LETT |i| 0 . #10#)
                (LETT |lcm| (SPADCALL |m| (QREFELT $ 13)) . #10#)
                (LETT |use_random|
                      (< (SPADCALL 2 |try_max| (QREFELT $ 91))
                         (SPADCALL (QREFELT $ 71)))
                      . #10#)
                (SEQ G190
                     (COND
                      ((NULL (COND (|look| (< |i| |try_max|)) ('T NIL)))
                       (GO G191)))
                     (SEQ (LETT |i| (+ |i| 1) . #10#)
                          (COND
                           (|use_random|
                            (LETT |val| (SPADCALL (QREFELT $ 92)) . #10#))
                           ('T
                            (LETT |val| (SPADCALL |i| (QREFELT $ 93)) . #10#)))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |lcm| |val| (QREFELT $ 94))
                                       (QREFELT $ 95))
                             "next value")
                            ('T
                             (SEQ
                              (LETT |umv|
                                    (SPADCALL
                                     (CONS #'|TWOFACT;doFactor;SupIBF;11!0|
                                           (VECTOR $ |val|))
                                     |m| (QREFELT $ 98))
                                    . #10#)
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL
                                   (SPADCALL |umv|
                                             (SPADCALL |umv| (QREFELT $ 67))
                                             (QREFELT $ 99))
                                   (QREFELT $ 22))
                                  0 (QREFELT $ 100))
                                 "next val")
                                ('T (LETT |look| NIL . #10#)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 (|look|
                  (COND
                   ((NULL |do_ext|)
                    (EXIT
                     (PROGN
                      (LETT #9# (SPADCALL |m| 1 (QREFELT $ 85)) . #10#)
                      (GO #11=#:G296)))))))
                (EXIT
                 (COND (|look| (|TWOFACT;doExtension| |m| |dx| $))
                       (#12='T
                        (SEQ
                         (LETT |prime|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 52) 1
                                          (QREFELT $ 21))
                                (SPADCALL |val| 0 (QREFELT $ 21))
                                (QREFELT $ 101))
                               . #10#)
                         (LETT |fumv| (SPADCALL |umv| (QREFELT $ 61)) . #10#)
                         (LETT |lfact1| (SPADCALL |fumv| (QREFELT $ 104))
                               . #10#)
                         (EXIT
                          (COND
                           ((EQL (LENGTH |lfact1|) 1)
                            (SPADCALL |m| 1 (QREFELT $ 84)))
                           (#12#
                            (SEQ
                             (LETT |lfact|
                                   (PROGN
                                    (LETT #8# NIL . #10#)
                                    (SEQ (LETT |lf| NIL . #10#)
                                         (LETT #7# |lfact1| . #10#) G190
                                         (COND
                                          ((OR (ATOM #7#)
                                               (PROGN
                                                (LETT |lf| (CAR #7#) . #10#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #8#
                                                 (CONS
                                                  (SPADCALL (ELT $ 105)
                                                            (QCAR |lf|)
                                                            (QREFELT $ 108))
                                                  #8#)
                                                 . #10#)))
                                         (LETT #7# (CDR #7#) . #10#) (GO G190)
                                         G191 (EXIT (NREVERSE #8#))))
                                   . #10#)
                             (LETT |lfact|
                                   (CONS
                                    (SPADCALL (ELT $ 105)
                                              (SPADCALL |fumv| (QREFELT $ 35))
                                              (QREFELT $ 108))
                                    |lfact|)
                                   . #10#)
                             (LETT |dx1|
                                   (PROG1 (LETT #6# (+ |dx| 1) . #10#)
                                     (|check_subtype2| (> #6# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #6#))
                                   . #10#)
                             (LETT |lfacth|
                                   (SPADCALL |m| |lfact| |prime| |dx1|
                                             (QREFELT $ 111))
                                   . #10#)
                             (LETT |lfactk| NIL . #10#)
                             (SEQ G190
                                  (COND
                                   ((NULL (NULL (NULL |lfacth|))) (GO G191)))
                                  (SEQ
                                   (LETT |ff| (|SPADfirst| |lfacth|) . #10#)
                                   (LETT |lfacth| (CDR |lfacth|) . #10#)
                                   (COND
                                    ((SPADCALL
                                      (LETT |c|
                                            (SPADCALL
                                             (SPADCALL |ff| (QREFELT $ 13))
                                             (QREFELT $ 20))
                                            . #10#)
                                      (|spadConstant| $ 52) (QREFELT $ 112))
                                     (LETT |ff|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |c| (QREFELT $ 113))
                                             (QREFELT $ 105))
                                            |ff| (QREFELT $ 56))
                                           . #10#)))
                                   (EXIT
                                    (LETT |lfactk| (CONS |ff| |lfactk|)
                                          . #10#)))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (PROGN
                               (LETT #1# NIL . #10#)
                               (SEQ (LETT |ff1| NIL . #10#)
                                    (LETT #5# |lfactk| . #10#) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN
                                           (LETT |ff1| (CAR #5#) . #10#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #4#
                                             (SPADCALL |ff1| 1 (QREFELT $ 84))
                                             . #10#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #4#
                                                         (QREFELT $ 86))
                                               . #10#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #4# . #10#)
                                          (LETT #1# 'T . #10#)))))))
                                    (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#)
                                     (#12# (|spadConstant| $ 87)))))))))))))))
          #11# (EXIT #9#)))) 

(SDEFUN |TWOFACT;doFactor;SupIBF;11!0| ((|x| NIL) ($$ NIL))
        (PROG (|val| $)
          (LETT |val| (QREFELT $$ 1) . #1=(|TWOFACT;doFactor;SupIBF;11|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |val| (QREFELT $ 94)))))) 

(DECLAIM (NOTINLINE |TwoFactorize;|)) 

(DEFUN |TwoFactorize| (#1=#:G301)
  (SPROG NIL
         (PROG (#2=#:G302)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TwoFactorize|)
                                               '|domainEqualList|)
                    . #3=(|TwoFactorize|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TwoFactorize;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TwoFactorize|)))))))))) 

(DEFUN |TwoFactorize;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TwoFactorize|))
          (LETT |dv$| (LIST '|TwoFactorize| DV$1) . #1#)
          (LETT $ (GETREFV 114) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              (|Record| (|:| |flg| 37) (|:| |fctr| 12) (|:| |xpnt| 76))
              (|List| 38) (109 . |factorList|)
              (|Record| (|:| |flg| 37) (|:| |fctr| 8) (|:| |xpnt| 76))
              (|List| 41) (114 . |makeFR|) (120 . |content|) (125 . |exquo|)
              (131 . |squareFree|) (136 . |unit|) (141 . |factorList|)
              (146 . =) (152 . ^) (158 . *) (164 . |One|) (168 . |One|)
              (172 . |One|) (176 . ~=) (182 . *) |TWOFACT;generalSqFr;SupF;4|
              |TWOFACT;tryTwoFactor;SupF;5| |TWOFACT;generalTwoFactor;SupF;6|
              (|DistinctDegreeFactorize| 6 12) (188 . |factor|) (193 . >)
              (|Record| (|:| |factor| 8) (|:| |exponent| 76)) (|List| 63)
              (199 . |factors|) (204 . |differentiate|) (209 . |differentiate|)
              (|Mapping| 12 12) (214 . |map|) (220 . |characteristic|)
              (224 . |size|) (228 . |exquo|) (234 . |divideExponents|)
              (|CommuteUnivariatePolynomialCategory| 6 12 8) (240 . |swap|)
              (|Integer|) (245 . *) (|List| 12) (251 . |coefficients|)
              |TWOFACT;doFactor;SupIBF;11| (256 . |elt|)
              |TWOFACT;twoFactor;SupIF;8| (262 . ~=) (268 . |primeFactor|)
              (274 . |nilFactor|) (280 . *) (286 . |One|) (|PositiveInteger|)
              (290 . ^) (296 . |nthFlag|) (302 . *) (308 . |random|)
              (312 . |index|) (317 . |elt|) (323 . |zero?|) (|Mapping| 6 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 8 6 12)
              (328 . |map|) (334 . |gcd|) (340 . ~=) (346 . -)
              (|Record| (|:| |factor| 12) (|:| |exponent| 76)) (|List| 102)
              (352 . |factors|) (357 . |coerce|) (|Mapping| 12 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 12 12 8)
              (362 . |map|) (|List| 8) (|GeneralHenselPackage| 12 8)
              (368 . |completeHensel|) (376 . ~=) (382 . |inv|))
           '#(|twoFactor| 387 |tryTwoFactor| 393 |generalTwoFactor| 398
              |generalSqFr| 403 |doFactor| 408)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 113
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
                                                   54 2 12 10 0 0 55 2 8 0 12 0
                                                   56 1 60 34 12 61 2 14 10 0 0
                                                   62 1 30 64 0 65 1 8 0 0 66 1
                                                   12 0 0 67 2 8 0 68 0 69 0 6
                                                   14 70 0 6 14 71 2 14 28 0 0
                                                   72 2 8 28 0 14 73 1 74 8 8
                                                   75 2 76 0 14 0 77 1 8 78 0
                                                   79 2 42 41 0 76 81 2 8 10 0
                                                   0 83 2 30 0 8 76 84 2 30 0 8
                                                   76 85 2 30 0 0 0 86 0 30 0
                                                   87 2 14 0 0 88 89 2 30 37 0
                                                   76 90 2 76 0 88 0 91 0 6 0
                                                   92 1 6 0 88 93 2 12 6 0 6 94
                                                   1 6 10 0 95 2 97 12 96 8 98
                                                   2 12 0 0 0 99 2 14 10 0 0
                                                   100 2 12 0 0 0 101 1 34 103
                                                   0 104 1 12 0 6 105 2 107 8
                                                   106 12 108 4 110 109 8 109
                                                   12 88 111 2 6 10 0 0 112 1 6
                                                   0 0 113 2 0 30 8 76 82 1 0
                                                   30 8 58 1 0 30 8 59 1 0 30 8
                                                   57 3 0 30 8 76 10 80)))))
           '|lookupComplete|)) 
