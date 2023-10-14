
(/VERSIONCHECK 2) 

(DEFUN |TWOFACT;exchangeVars| (|p| $)
  (COND
   ((SPADCALL |p| (|spadConstant| $ 9) (QREFELT $ 11)) (|spadConstant| $ 9))
   ('T
    (SPADCALL
     (|TWOFACT;exchangeVarTerm| (SPADCALL |p| (QREFELT $ 13))
      (SPADCALL |p| (QREFELT $ 15)) $)
     (|TWOFACT;exchangeVars| (SPADCALL |p| (QREFELT $ 16)) $) (QREFELT $ 17))))) 

(DEFUN |TWOFACT;exchangeVarTerm| (|c| |e| $)
  (COND
   ((SPADCALL |c| (|spadConstant| $ 18) (QREFELT $ 19)) (|spadConstant| $ 9))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 20)) |e| (QREFELT $ 21))
               (SPADCALL |c| (QREFELT $ 22)) (QREFELT $ 23))
     (|TWOFACT;exchangeVarTerm| (SPADCALL |c| (QREFELT $ 24)) |e| $)
     (QREFELT $ 17))))) 

(DEFUN |TWOFACT;pthRoot| (|poly| |p| |PthRootPow| $)
  (PROG (|tmp|)
    (RETURN
     (SEQ
      (LETT |tmp|
            (SPADCALL
             (SPADCALL (CONS #'|TWOFACT;pthRoot!0| (VECTOR $ |PthRootPow|))
                       |poly| (QREFELT $ 27))
             |p| (QREFELT $ 29))
            |TWOFACT;pthRoot|)
      (EXIT
       (COND ((QEQCAR |tmp| 1) (|error| "consistency error in TwoFactor"))
             ('T (QCDR |tmp|)))))))) 

(DEFUN |TWOFACT;pthRoot!0| (|x| $$)
  (PROG (|PthRootPow| $)
    (LETT |PthRootPow| (QREFELT $$ 1) . #1=(|TWOFACT;pthRoot|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |PthRootPow| (QREFELT $ 25)))))) 

(DEFUN |TWOFACT;generalSqFr;SupF;4| (|m| $)
  (PROG (|pfaclist| |contlist| #1=#:G165 |w| #2=#:G164 |sqp| |unitPart|
         #3=#:G163 |v| |nfacs| |uexp| #4=#:G150 #5=#:G162 |u| |sqfrm| #6=#:G148
         |cont| #7=#:G161 #8=#:G160 |l|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 9) (QREFELT $ 11))
        (|spadConstant| $ 31))
       ((EQL (SPADCALL |m| (QREFELT $ 15)) 0)
        (SEQ
         (LETT |l| (SPADCALL (SPADCALL |m| (QREFELT $ 13)) (QREFELT $ 33))
               . #9=(|TWOFACT;generalSqFr;SupF;4|))
         (EXIT
          (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 35)) (QREFELT $ 36))
                    (PROGN
                     (LETT #8# NIL . #9#)
                     (SEQ (LETT |u| NIL . #9#)
                          (LETT #7# (SPADCALL |l| (QREFELT $ 40)) . #9#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |u| (CAR #7#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS
                                   (VECTOR (QVELT |u| 0)
                                           (SPADCALL (QVELT |u| 1)
                                                     (QREFELT $ 36))
                                           (QVELT |u| 2))
                                   #8#)
                                  . #9#)))
                          (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    (QREFELT $ 43)))))
       (#10='T
        (SEQ (LETT |cont| (SPADCALL |m| (QREFELT $ 44)) . #9#)
             (LETT |m|
                   (PROG2 (LETT #6# (SPADCALL |m| |cont| (QREFELT $ 45)) . #9#)
                       (QCDR #6#)
                     (|check_union| (QEQCAR #6# 0)
                                    (|SparseUnivariatePolynomial|
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 6)))
                                    #6#))
                   . #9#)
             (LETT |sqfrm| (SPADCALL |m| (QREFELT $ 46)) . #9#)
             (LETT |pfaclist| NIL . #9#)
             (LETT |unitPart| (SPADCALL |sqfrm| (QREFELT $ 47)) . #9#)
             (SEQ (LETT |u| NIL . #9#)
                  (LETT #5# (SPADCALL |sqfrm| (QREFELT $ 48)) . #9#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL (QVELT |u| 0) (CONS 0 "nil") (QREFELT $ 49))
                      (SEQ
                       (LETT |uexp|
                             (PROG1 (LETT #4# (QVELT |u| 2) . #9#)
                               (|check_subtype| (>= #4# 0)
                                                '(|NonNegativeInteger|) #4#))
                             . #9#)
                       (LETT |nfacs|
                             (SPADCALL (|TWOFACT;exchangeVars| (QVELT |u| 1) $)
                                       (QREFELT $ 46))
                             . #9#)
                       (SEQ (LETT |v| NIL . #9#)
                            (LETT #3# (SPADCALL |nfacs| (QREFELT $ 48)) . #9#)
                            G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |v| (CAR #3#) . #9#) NIL))
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
                                    . #9#)))
                            (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (LETT |unitPart|
                              (SPADCALL
                               (SPADCALL (SPADCALL |nfacs| (QREFELT $ 47))
                                         |uexp| (QREFELT $ 50))
                               |unitPart| (QREFELT $ 51))
                              . #9#))))
                     ('T (LETT |pfaclist| (CONS |u| |pfaclist|) . #9#)))))
                  (LETT #5# (CDR #5#) . #9#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (COND
               ((SPADCALL |cont| (|spadConstant| $ 54) (QREFELT $ 55))
                (SEQ (LETT |sqp| (SPADCALL |cont| (QREFELT $ 33)) . #9#)
                     (LETT |contlist|
                           (PROGN
                            (LETT #2# NIL . #9#)
                            (SEQ (LETT |w| NIL . #9#)
                                 (LETT #1# (SPADCALL |sqp| (QREFELT $ 40))
                                       . #9#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |w| (CAR #1#) . #9#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (VECTOR (QVELT |w| 0)
                                                  (SPADCALL (QVELT |w| 1)
                                                            (QREFELT $ 36))
                                                  (QVELT |w| 2))
                                          #2#)
                                         . #9#)))
                                 (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           . #9#)
                     (LETT |pfaclist| (APPEND |contlist| |pfaclist|) . #9#)
                     (EXIT
                      (SPADCALL
                       (SPADCALL (SPADCALL |sqp| (QREFELT $ 35)) |unitPart|
                                 (QREFELT $ 56))
                       |pfaclist| (QREFELT $ 43)))))
               (#10# (SPADCALL |unitPart| |pfaclist| (QREFELT $ 43)))))))))))) 

(DEFUN |TWOFACT;tryTwoFactor;SupF;5| (|m| $) (|TWOFACT;doTwoFactor| |m| 'NIL $)) 

(DEFUN |TWOFACT;generalTwoFactor;SupF;6| (|m| $)
  (|TWOFACT;doTwoFactor| |m| 'T $)) 

(DEFUN |TWOFACT;doTwoFactor| (|m| |do_ext| $)
  (PROG (|ll| #1=#:G222 |v| #2=#:G221 |unitPart| #3=#:G210 |nfl| |twoF| |ydeg|
         #4=#:G198 #5=#:G197 #6=#:G199 #7=#:G220 |w| #8=#:G219 #9=#:G218 |m2|
         #10=#:G217 #11=#:G216 |res| |m1| |PthRootPow| #12=#:G188 |p| |fac|
         |expon| #13=#:G185 |expo| #14=#:G215 |u| |sqfrm| #15=#:G214 #16=#:G213
         |contfact| |cont| #17=#:G212 #18=#:G211 |l|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |m| (|spadConstant| $ 9) (QREFELT $ 11))
         (|spadConstant| $ 31))
        ((EQL (SPADCALL |m| (QREFELT $ 15)) 0)
         (SEQ
          (LETT |l| (SPADCALL (SPADCALL |m| (QREFELT $ 13)) (QREFELT $ 61))
                . #19=(|TWOFACT;doTwoFactor|))
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 35)) (QREFELT $ 36))
                     (PROGN
                      (LETT #18# NIL . #19#)
                      (SEQ (LETT |u| NIL . #19#)
                           (LETT #17# (SPADCALL |l| (QREFELT $ 40)) . #19#)
                           G190
                           (COND
                            ((OR (ATOM #17#)
                                 (PROGN (LETT |u| (CAR #17#) . #19#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #18#
                                   (CONS
                                    (VECTOR (QVELT |u| 0)
                                            (SPADCALL (QVELT |u| 1)
                                                      (QREFELT $ 36))
                                            (QVELT |u| 2))
                                    #18#)
                                   . #19#)))
                           (LETT #17# (CDR #17#) . #19#) (GO G190) G191
                           (EXIT (NREVERSE #18#))))
                     (QREFELT $ 43)))))
        (#20='T
         (SEQ (LETT |ll| NIL . #19#)
              (LETT |cont| (SPADCALL |m| (QREFELT $ 44)) . #19#)
              (COND
               ((SPADCALL (SPADCALL |cont| (QREFELT $ 22)) 0 (QREFELT $ 62))
                (SEQ (LETT |m1| (SPADCALL |m| |cont| (QREFELT $ 45)) . #19#)
                     (EXIT
                      (COND
                       ((QEQCAR |m1| 1) (|error| "content doesn't divide"))
                       (#20#
                        (SEQ (LETT |m| (QCDR |m1|) . #19#)
                             (LETT |contfact| (SPADCALL |cont| (QREFELT $ 61))
                                   . #19#)
                             (LETT |unitPart|
                                   (SPADCALL
                                    (SPADCALL |contfact| (QREFELT $ 35))
                                    (QREFELT $ 36))
                                   . #19#)
                             (EXIT
                              (LETT |ll|
                                    (PROGN
                                     (LETT #16# NIL . #19#)
                                     (SEQ (LETT |w| NIL . #19#)
                                          (LETT #15#
                                                (SPADCALL |contfact|
                                                          (QREFELT $ 40))
                                                . #19#)
                                          G190
                                          (COND
                                           ((OR (ATOM #15#)
                                                (PROGN
                                                 (LETT |w| (CAR #15#) . #19#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #16#
                                                  (CONS
                                                   (VECTOR (QVELT |w| 0)
                                                           (SPADCALL
                                                            (QVELT |w| 1)
                                                            (QREFELT $ 36))
                                                           (QVELT |w| 2))
                                                   #16#)
                                                  . #19#)))
                                          (LETT #15# (CDR #15#) . #19#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #16#))))
                                    . #19#))))))))
               (#20#
                (LETT |unitPart| (SPADCALL |cont| (QREFELT $ 36)) . #19#)))
              (LETT |sqfrm| (SPADCALL |m| (QREFELT $ 46)) . #19#)
              (SEQ (LETT |u| NIL . #19#)
                   (LETT #14# (SPADCALL |sqfrm| (QREFELT $ 65)) . #19#) G190
                   (COND
                    ((OR (ATOM #14#) (PROGN (LETT |u| (CAR #14#) . #19#) NIL))
                     (GO G191)))
                   (SEQ (LETT |expo| (QCDR |u|) . #19#)
                        (COND
                         ((< |expo| 0)
                          (|error| "negative exponent in a factorisation")))
                        (LETT |expon|
                              (PROG1 (LETT #13# |expo| . #19#)
                                (|check_subtype| (>= #13# 0)
                                                 '(|NonNegativeInteger|) #13#))
                              . #19#)
                        (LETT |fac| (QCAR |u|) . #19#)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |fac| (QREFELT $ 15)) 1)
                           (LETT |ll|
                                 (CONS (VECTOR (CONS 2 "irred") |fac| |expon|)
                                       |ll|)
                                 . #19#))
                          ((SPADCALL (SPADCALL |fac| (QREFELT $ 66))
                                     (|spadConstant| $ 9) (QREFELT $ 11))
                           (COND
                            ((SPADCALL
                              (SPADCALL (ELT $ 67) |fac| (QREFELT $ 69))
                              (|spadConstant| $ 9) (QREFELT $ 11))
                             (SEQ (LETT |p| (SPADCALL (QREFELT $ 70)) . #19#)
                                  (LETT |PthRootPow|
                                        (PROG2
                                            (LETT #12#
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 71))
                                                   |p| (QREFELT $ 72))
                                                  . #19#)
                                            (QCDR #12#)
                                          (|check_union| (QEQCAR #12# 0)
                                                         (|NonNegativeInteger|)
                                                         #12#))
                                        . #19#)
                                  (LETT |m1|
                                        (SPADCALL
                                         (SPADCALL
                                          (CONS #'|TWOFACT;doTwoFactor!0|
                                                (VECTOR $ |PthRootPow| |p|))
                                          |fac| (QREFELT $ 69))
                                         |p| (QREFELT $ 73))
                                        . #19#)
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
                                            . #19#)
                                      (LETT |unitPart|
                                            (SPADCALL |unitPart|
                                                      (SPADCALL
                                                       (SPADCALL |res|
                                                                 (QREFELT $
                                                                          47))
                                                       (* |p| |expon|)
                                                       (QREFELT $ 50))
                                                      (QREFELT $ 51))
                                            . #19#)
                                      (EXIT
                                       (LETT |ll|
                                             (APPEND
                                              (PROGN
                                               (LETT #11# NIL . #19#)
                                               (SEQ (LETT |v| NIL . #19#)
                                                    (LETT #10#
                                                          (SPADCALL |res|
                                                                    (QREFELT $
                                                                             48))
                                                          . #19#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #10#)
                                                          (PROGN
                                                           (LETT |v| (CAR #10#)
                                                                 . #19#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #11#
                                                            (CONS
                                                             (VECTOR
                                                              (QVELT |v| 0)
                                                              (QVELT |v| 1)
                                                              (*
                                                               (* |expon| |p|)
                                                               (QVELT |v| 2)))
                                                             #11#)
                                                            . #19#)))
                                                    (LETT #10# (CDR #10#)
                                                          . #19#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #11#))))
                                              |ll|)
                                             . #19#))))))))
                            ('T
                             (SEQ
                              (LETT |m2|
                                    (SPADCALL (SPADCALL |fac| (QREFELT $ 75))
                                              (QREFELT $ 59))
                                    . #19#)
                              (LETT |unitPart|
                                    (SPADCALL |unitPart|
                                              (SPADCALL
                                               (SPADCALL |m2| (QREFELT $ 47))
                                               |expon| (QREFELT $ 50))
                                              (QREFELT $ 51))
                                    . #19#)
                              (EXIT
                               (LETT |ll|
                                     (APPEND
                                      (PROGN
                                       (LETT #9# NIL . #19#)
                                       (SEQ (LETT |v| NIL . #19#)
                                            (LETT #8#
                                                  (SPADCALL |m2|
                                                            (QREFELT $ 48))
                                                  . #19#)
                                            G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |v| (CAR #8#) . #19#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #9#
                                                    (CONS
                                                     (VECTOR (QVELT |v| 0)
                                                             (SPADCALL
                                                              (QVELT |v| 1)
                                                              (QREFELT $ 75))
                                                             (SPADCALL |expon|
                                                                       (QVELT
                                                                        |v| 2)
                                                                       (QREFELT
                                                                        $ 77)))
                                                     #9#)
                                                    . #19#)))
                                            (LETT #8# (CDR #8#) . #19#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #9#))))
                                      |ll|)
                                     . #19#))))))
                          ('T
                           (SEQ
                            (LETT |ydeg|
                                  (PROGN
                                   (LETT #4# NIL . #19#)
                                   (SEQ (LETT |w| NIL . #19#)
                                        (LETT #7#
                                              (SPADCALL |fac| (QREFELT $ 79))
                                              . #19#)
                                        G190
                                        (COND
                                         ((OR (ATOM #7#)
                                              (PROGN
                                               (LETT |w| (CAR #7#) . #19#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #6#
                                                 (SPADCALL |w| (QREFELT $ 22))
                                                 . #19#)
                                           (COND
                                            (#4#
                                             (LETT #5# (MAX #5# #6#) . #19#))
                                            ('T
                                             (PROGN
                                              (LETT #5# #6# . #19#)
                                              (LETT #4# 'T . #19#)))))))
                                        (LETT #7# (CDR #7#) . #19#) (GO G190)
                                        G191 (EXIT NIL))
                                   (COND (#4# #5#)
                                         ('T (|IdentityError| '|max|))))
                                  . #19#)
                            (LETT |twoF|
                                  (SPADCALL |fac| |ydeg| |do_ext|
                                            (QREFELT $ 80))
                                  . #19#)
                            (LETT |nfl| (SPADCALL |twoF| (QREFELT $ 48))
                                  . #19#)
                            (COND
                             ((EQL (LENGTH |nfl|) 1)
                              (COND
                               ((QEQCAR
                                 (QVELT (SPADCALL |nfl| 1 (QREFELT $ 81)) 0) 0)
                                (EXIT
                                 (PROGN (LETT #3# |twoF| . #19#) (GO #3#)))))))
                            (LETT |unitPart|
                                  (SPADCALL |unitPart|
                                            (SPADCALL
                                             (SPADCALL |twoF| (QREFELT $ 47))
                                             |expon| (QREFELT $ 50))
                                            (QREFELT $ 51))
                                  . #19#)
                            (EXIT
                             (LETT |ll|
                                   (APPEND
                                    (PROGN
                                     (LETT #2# NIL . #19#)
                                     (SEQ (LETT |v| NIL . #19#)
                                          (LETT #1#
                                                (SPADCALL |twoF|
                                                          (QREFELT $ 48))
                                                . #19#)
                                          G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |v| (CAR #1#) . #19#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2#
                                                  (CONS
                                                   (VECTOR (QVELT |v| 0)
                                                           (QVELT |v| 1)
                                                           (SPADCALL |expon|
                                                                     (QVELT |v|
                                                                            2)
                                                                     (QREFELT $
                                                                              77)))
                                                   #2#)
                                                  . #19#)))
                                          (LETT #1# (CDR #1#) . #19#) (GO G190)
                                          G191 (EXIT (NREVERSE #2#))))
                                    |ll|)
                                   . #19#)))))))
                   (LETT #14# (CDR #14#) . #19#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |unitPart| |ll| (QREFELT $ 43)))))))
      #3# (EXIT #3#))))) 

(DEFUN |TWOFACT;doTwoFactor!0| (|x| $$)
  (PROG (|p| |PthRootPow| $)
    (LETT |p| (QREFELT $$ 2) . #1=(|TWOFACT;doTwoFactor|))
    (LETT |PthRootPow| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|TWOFACT;pthRoot| |x| |p| |PthRootPow| $))))) 

(DEFUN |TWOFACT;twoFactor;SupIF;8| (|m| |dx| $)
  (SPADCALL |m| |dx| 'T (QREFELT $ 80))) 

(DEFUN |TWOFACT;doExtension1| (|m| |n| |dx| |extField| $)
  (PROG (#1=#:G250 #2=#:G249 #3=#:G251 #4=#:G260 |ff1| |lfactk| #5=#:G239 |ffn|
         #6=#:G245 #7=#:G244 #8=#:G246 #9=#:G259 #10=#:G103 |lfacth| #11=#:G258
         |g| #12=#:G257 |normfacs| #13=#:G247 |ffu| |ff| |c| #14=#:G256 |fac|
         #15=#:G255 |Normp| |flist| |res1| |m1| |mm| TP |SUEx|)
    (RETURN
     (SEQ
      (LETT |SUEx| (|SparseUnivariatePolynomial| |extField|)
            . #16=(|TWOFACT;doExtension1|))
      (LETT TP (|SparseUnivariatePolynomial| |SUEx|) . #16#)
      (LETT |mm| (SPADCALL (|compiledLookupCheck| '|Zero| (LIST '$) TP))
            . #16#)
      (LETT |m1| |m| . #16#)
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
                                                     (LIST (|devaluate| |SUEx|)
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
                                                          (|devaluate| |SUEx|)
                                                          (LIST
                                                           '|NonNegativeInteger|))
                                                    TP))
                            (|compiledLookupCheck| '+ (LIST '$ '$ '$) TP))
                  . #16#)
            (EXIT (LETT |m1| (SPADCALL |m1| (QREFELT $ 16)) . #16#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |res1|
            (SPADCALL |mm| |dx| 'NIL
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
            . #16#)
      (LETT |flist|
            (SPADCALL |res1|
                      (|compiledLookupCheck| '|factors|
                                             (LIST
                                              (LIST '|List|
                                                    (LIST '|Record|
                                                          (LIST '|:| '|factor|
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
            . #16#)
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
          (#17='T (SPADCALL |m| 1 (QREFELT $ 85)))))
        (#17#
         (SEQ
          (LETT |Normp|
                (|NormRetractPackage| (QREFELT $ 6) |extField| |SUEx| TP |n|)
                . #16#)
          (LETT |lfacth|
                (PROGN
                 (LETT #15# NIL . #16#)
                 (SEQ (LETT |fac| NIL . #16#)
                      (LETT #14#
                            (SPADCALL |res1|
                                      (|compiledLookupCheck| '|factors|
                                                             (LIST
                                                              (LIST '|List|
                                                                    (LIST
                                                                     '|Record|
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
                            . #16#)
                      G190
                      (COND
                       ((OR (ATOM #14#)
                            (PROGN (LETT |fac| (CAR #14#) . #16#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #15# (CONS (QCAR |fac|) #15#) . #16#)))
                      (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                      (EXIT (NREVERSE #15#))))
                . #16#)
          (LETT |lfactk| NIL . #16#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |lfacth|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |ff| (|SPADfirst| |lfacth|) . #16#)
                      (LETT |lfacth| (CDR |lfacth|) . #16#)
                      (COND
                       ((SPADCALL
                         (LETT |c|
                               (SPADCALL
                                (SPADCALL |ff|
                                          (|compiledLookupCheck|
                                           '|leadingCoefficient|
                                           (LIST
                                            (LIST '|SparseUnivariatePolynomial|
                                                  (|devaluate| |extField|))
                                            '$)
                                           (|SparseUnivariatePolynomial|
                                            (|SparseUnivariatePolynomial|
                                             |extField|))))
                                (|compiledLookupCheck| '|leadingCoefficient|
                                                       (LIST
                                                        (|devaluate|
                                                         |extField|)
                                                        '$)
                                                       |SUEx|))
                               . #16#)
                         (SPADCALL
                          (|compiledLookupCheck| '|One| (LIST '$) |extField|))
                         (|compiledLookupCheck| '~=
                                                (LIST (LIST '|Boolean|) '$ '$)
                                                |extField|))
                        (LETT |ff|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |c|
                                          (|compiledLookupCheck| '|inv|
                                                                 (LIST '$ '$)
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
                              . #16#)))
                      (SEQ
                       (LETT |ffu|
                             (SPADCALL |ff|
                                       (|compiledLookupCheck| '|retractIfCan|
                                                              (LIST
                                                               (LIST '|Union|
                                                                     (LIST
                                                                      '|SparseUnivariatePolynomial|
                                                                      (LIST
                                                                       '|SparseUnivariatePolynomial|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             6))))
                                                                     '#18="failed")
                                                               (|devaluate|
                                                                TP))
                                                              |Normp|))
                             . #16#)
                       (EXIT
                        (COND
                         ((NULL (QEQCAR |ffu| 1))
                          (PROGN
                           (LETT #13#
                                 (LETT |lfactk| (CONS (QCDR |ffu|) |lfactk|)
                                       . #16#)
                                 . #16#)
                           (GO #13#))))))
                      (LETT |normfacs|
                            (SPADCALL |ff|
                                      (|compiledLookupCheck| '|normFactors|
                                                             (LIST
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     TP))
                                                              (|devaluate| TP))
                                                             |Normp|))
                            . #16#)
                      (LETT |lfacth|
                            (PROGN
                             (LETT #12# NIL . #16#)
                             (SEQ (LETT |g| NIL . #16#)
                                  (LETT #11# |lfacth| . #16#) G190
                                  (COND
                                   ((OR (ATOM #11#)
                                        (PROGN
                                         (LETT |g| (CAR #11#) . #16#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((COND
                                       ((SPADCALL |g| |normfacs|
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
                                                      |extField|)))))
                                        'NIL)
                                       ('T 'T))
                                      (LETT #12# (CONS |g| #12#) . #16#)))))
                                  (LETT #11# (CDR #11#) . #16#) (GO G190) G191
                                  (EXIT (NREVERSE #12#))))
                            . #16#)
                      (LETT |ffn|
                            (PROGN
                             (LETT #6# NIL . #16#)
                             (SEQ (LETT #10# NIL . #16#)
                                  (LETT #9# |normfacs| . #16#) G190
                                  (COND
                                   ((OR (ATOM #9#)
                                        (PROGN
                                         (LETT #10# (CAR #9#) . #16#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #8# #10# . #16#)
                                     (COND
                                      (#6#
                                       (LETT #7#
                                             (SPADCALL #7# #8#
                                                       (|compiledLookupCheck|
                                                        '* (LIST '$ '$ '$) TP))
                                             . #16#))
                                      ('T
                                       (PROGN
                                        (LETT #7# #8# . #16#)
                                        (LETT #6# 'T . #16#)))))))
                                  (LETT #9# (CDR #9#) . #16#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#6# #7#)
                                   ('T
                                    (SPADCALL
                                     (|compiledLookupCheck| '|One| (LIST '$)
                                                            TP)))))
                            . #16#)
                      (EXIT
                       (LETT |lfactk|
                             (CONS
                              (PROG2
                                  (LETT #5#
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
                                                          '#18#)
                                                    (|devaluate| TP))
                                                   |Normp|))
                                        . #16#)
                                  (QCDR #5#)
                                (|check_union| (QEQCAR #5# 0)
                                               (|SparseUnivariatePolynomial|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 6)))
                                               #5#))
                              |lfactk|)
                             . #16#))))
                #13# (EXIT #13#))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #1# NIL . #16#)
            (SEQ (LETT |ff1| NIL . #16#) (LETT #4# |lfactk| . #16#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ff1| (CAR #4#) . #16#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3# (SPADCALL |ff1| 1 (QREFELT $ 84)) . #16#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 86)) . #16#))
                     ('T
                      (PROGN (LETT #2# #3# . #16#) (LETT #1# 'T . #16#)))))))
                 (LETT #4# (CDR #4#) . #16#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) (#17# (|spadConstant| $ 87))))))))))))) 

(DEFUN |TWOFACT;doExtension| (|m| |dx| $)
  (PROG (#1=#:G266 #2=#:G269 |res1| |nsize| #3=#:G270 |n| |ln|)
    (RETURN
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
                      (SPADCALL (SPADCALL (QREFELT $ 71)) |n| (QREFELT $ 89))
                      . #4#)
                (LETT |res1|
                      (COND
                       ((< |nsize| 1000)
                        (|TWOFACT;doExtension1| |m| |n| |dx|
                         (|FiniteFieldCyclicGroupExtension| (QREFELT $ 6) |n|)
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
                    (LETT #1# (PROGN (LETT #2# |res1| . #4#) (GO #2#)) . #4#)
                    (GO #1#)))))))
              #1# (EXIT #1#))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT (|error| "doExtension : Impossible"))))
      #2# (EXIT #2#))))) 

(DEFUN |TWOFACT;doFactor;SupIBF;11| (|m| |dx| |do_ext| $)
  (PROG (#1=#:G286 #2=#:G285 #3=#:G287 #4=#:G294 |ff1| |lfactk| |ff| |c|
         |lfacth| |dx1| #5=#:G280 |lfact| #6=#:G293 |lf| #7=#:G292 |lfact1|
         |fumv| |prime| #8=#:G291 |look| |umv| |val| |i| |use_random| |lcm|
         |try_max| |dm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |look| 'T . #9=(|TWOFACT;doFactor;SupIBF;11|))
            (LETT |dm| (SPADCALL |m| (QREFELT $ 15)) . #9#)
            (LETT |try_max| (MIN (+ |dx| 5) (SPADCALL (QREFELT $ 71))) . #9#)
            (LETT |i| 0 . #9#) (LETT |lcm| (SPADCALL |m| (QREFELT $ 13)) . #9#)
            (LETT |use_random|
                  (< (SPADCALL 2 |try_max| (QREFELT $ 91))
                     (SPADCALL (QREFELT $ 71)))
                  . #9#)
            (SEQ G190
                 (COND
                  ((NULL (COND (|look| (< |i| |try_max|)) ('T 'NIL)))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #9#)
                      (COND
                       (|use_random|
                        (LETT |val| (SPADCALL (QREFELT $ 92)) . #9#))
                       ('T (LETT |val| (SPADCALL |i| (QREFELT $ 93)) . #9#)))
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
                                . #9#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (SPADCALL
                               (SPADCALL |umv| (SPADCALL |umv| (QREFELT $ 67))
                                         (QREFELT $ 99))
                               (QREFELT $ 22))
                              0 (QREFELT $ 100))
                             "next val")
                            ('T (LETT |look| 'NIL . #9#)))))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             (|look|
              (COND
               ((NULL |do_ext|)
                (EXIT
                 (PROGN
                  (LETT #8# (SPADCALL |m| 1 (QREFELT $ 85)) . #9#)
                  (GO #8#)))))))
            (EXIT
             (COND (|look| (|TWOFACT;doExtension| |m| |dx| $))
                   (#10='T
                    (SEQ
                     (LETT |prime|
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 52) 1 (QREFELT $ 21))
                            (SPADCALL |val| 0 (QREFELT $ 21)) (QREFELT $ 101))
                           . #9#)
                     (LETT |fumv| (SPADCALL |umv| (QREFELT $ 61)) . #9#)
                     (LETT |lfact1| (SPADCALL |fumv| (QREFELT $ 104)) . #9#)
                     (EXIT
                      (COND
                       ((EQL (LENGTH |lfact1|) 1)
                        (SPADCALL |m| 1 (QREFELT $ 84)))
                       (#10#
                        (SEQ
                         (LETT |lfact|
                               (PROGN
                                (LETT #7# NIL . #9#)
                                (SEQ (LETT |lf| NIL . #9#)
                                     (LETT #6# |lfact1| . #9#) G190
                                     (COND
                                      ((OR (ATOM #6#)
                                           (PROGN
                                            (LETT |lf| (CAR #6#) . #9#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #7#
                                             (CONS
                                              (SPADCALL (ELT $ 105) (QCAR |lf|)
                                                        (QREFELT $ 108))
                                              #7#)
                                             . #9#)))
                                     (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                                     (EXIT (NREVERSE #7#))))
                               . #9#)
                         (LETT |lfact|
                               (CONS
                                (SPADCALL (ELT $ 105)
                                          (SPADCALL |fumv| (QREFELT $ 35))
                                          (QREFELT $ 108))
                                |lfact|)
                               . #9#)
                         (LETT |dx1|
                               (PROG1 (LETT #5# (+ |dx| 1) . #9#)
                                 (|check_subtype| (> #5# 0)
                                                  '(|PositiveInteger|) #5#))
                               . #9#)
                         (LETT |lfacth|
                               (SPADCALL |m| |lfact| |prime| |dx1|
                                         (QREFELT $ 111))
                               . #9#)
                         (LETT |lfactk| NIL . #9#)
                         (SEQ G190
                              (COND
                               ((NULL (COND ((NULL |lfacth|) 'NIL) ('T 'T)))
                                (GO G191)))
                              (SEQ (LETT |ff| (|SPADfirst| |lfacth|) . #9#)
                                   (LETT |lfacth| (CDR |lfacth|) . #9#)
                                   (COND
                                    ((SPADCALL
                                      (LETT |c|
                                            (SPADCALL
                                             (SPADCALL |ff| (QREFELT $ 13))
                                             (QREFELT $ 20))
                                            . #9#)
                                      (|spadConstant| $ 52) (QREFELT $ 112))
                                     (LETT |ff|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |c| (QREFELT $ 113))
                                             (QREFELT $ 105))
                                            |ff| (QREFELT $ 56))
                                           . #9#)))
                                   (EXIT
                                    (LETT |lfactk| (CONS |ff| |lfactk|)
                                          . #9#)))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (PROGN
                           (LETT #1# NIL . #9#)
                           (SEQ (LETT |ff1| NIL . #9#)
                                (LETT #4# |lfactk| . #9#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |ff1| (CAR #4#) . #9#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3# (SPADCALL |ff1| 1 (QREFELT $ 84))
                                         . #9#)
                                   (COND
                                    (#1#
                                     (LETT #2#
                                           (SPADCALL #2# #3# (QREFELT $ 86))
                                           . #9#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #3# . #9#)
                                      (LETT #1# 'T . #9#)))))))
                                (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#1# #2#)
                                 (#10# (|spadConstant| $ 87)))))))))))))))
      #8# (EXIT #8#))))) 

(DEFUN |TWOFACT;doFactor;SupIBF;11!0| (|x| $$)
  (PROG (|val| $)
    (LETT |val| (QREFELT $$ 1) . #1=(|TWOFACT;doFactor;SupIBF;11|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |val| (QREFELT $ 94)))))) 

(DECLAIM (NOTINLINE |TwoFactorize;|)) 

(DEFUN |TwoFactorize| (#1=#:G295)
  (PROG ()
    (RETURN
     (PROG (#2=#:G296)
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
             ((NOT #2#) (HREM |$ConstructorCache| '|TwoFactorize|))))))))))) 

(DEFUN |TwoFactorize;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TwoFactorize|))
      (LETT |dv$| (LIST '|TwoFactorize| DV$1) . #1#)
      (LETT $ (GETREFV 114) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TwoFactorize| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

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
