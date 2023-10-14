
(SDEFUN |MLIFT;corrPoly;SupLLLLVRU;1|
        ((|m| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|fval| |List| R) (|ld| |List| (|NonNegativeInteger|))
         (|flist| |List| (|SparseUnivariatePolynomial| P))
         (|table| |Vector| (|List| (|SparseUnivariatePolynomial| R)))
         (|pmod| R)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG
         ((|diff| (|SparseUnivariatePolynomial| P)) (#1=#:G159 NIL)
          (#2=#:G158 #3=(|SparseUnivariatePolynomial| P)) (#4=#:G160 #3#)
          (|i| NIL) (|lcoef| (|List| (|SparseUnivariatePolynomial| P)))
          (#5=#:G173 NIL) (|beta| (|List| (|SparseUnivariatePolynomial| P)))
          (#6=#:G167 NIL)
          (|fbeta|
           #7=(|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|ddiff| #8=(|SparseUnivariatePolynomial| P))
          (|pol| (|SparseUnivariatePolynomial| P)) (|l| NIL) (#9=#:G139 NIL)
          (#10=#:G138 #3#) (#11=#:G140 #3#)
          (|polc| (|SparseUnivariatePolynomial| P))
          (|listcong| (|List| (|SparseUnivariatePolynomial| P)))
          (#12=#:G135 NIL) (#13=#:G134 #14=(|SparseUnivariatePolynomial| P))
          (#15=#:G136 #14#) (#16=#:G172 NIL) (|flcoef| #7#) (|um| #8#)
          (|listpolv| (|List| (|SparseUnivariatePolynomial| P)))
          (#17=#:G171 NIL) (|f1| NIL) (#18=#:G170 NIL) (|y| (OV)) (|a| (P))
          (|np| (|NonNegativeInteger|)) (|deg1| (|NonNegativeInteger|))
          (#19=#:G169 NIL) (|mp| NIL) (#20=#:G168 NIL)
          (|lp| (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed")))
         (SEQ
          (EXIT
           (COND
            ((EQL (LENGTH |lvar|) 0)
             (SEQ
              (LETT |lp|
                    (SPADCALL (SPADCALL (ELT $ 10) |m| (QREFELT $ 15)) |pmod|
                              |table| (QREFELT $ 19))
                    . #21=(|MLIFT;corrPoly;SupLLLLVRU;1|))
              (COND
               ((QEQCAR |lp| 1)
                (PROGN (LETT #6# (CONS 1 "failed") . #21#) (GO #22=#:G166))))
              (EXIT
               (LETT |lcoef|
                     (CONS 0
                           (PROGN
                            (LETT #20# NIL . #21#)
                            (SEQ (LETT |mp| NIL . #21#)
                                 (LETT #19# (QCDR |lp|) . #21#) G190
                                 (COND
                                  ((OR (ATOM #19#)
                                       (PROGN
                                        (LETT |mp| (CAR #19#) . #21#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #20#
                                         (CONS
                                          (SPADCALL (ELT $ 20) |mp|
                                                    (QREFELT $ 23))
                                          #20#)
                                         . #21#)))
                                 (LETT #19# (CDR #19#) . #21#) (GO G190) G191
                                 (EXIT (NREVERSE #20#)))))
                     . #21#))))
            (#23='T
             (SEQ (LETT |deg1| (|SPADfirst| |ld|) . #21#)
                  (LETT |np| (LENGTH |flist|) . #21#)
                  (LETT |a| (SPADCALL (|SPADfirst| |fval|) (QREFELT $ 20))
                        . #21#)
                  (LETT |y| (|SPADfirst| |lvar|) . #21#)
                  (LETT |lvar| (CDR |lvar|) . #21#)
                  (LETT |listpolv|
                        (PROGN
                         (LETT #18# NIL . #21#)
                         (SEQ (LETT |f1| NIL . #21#) (LETT #17# |flist| . #21#)
                              G190
                              (COND
                               ((OR (ATOM #17#)
                                    (PROGN (LETT |f1| (CAR #17#) . #21#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #18#
                                      (CONS
                                       (SPADCALL
                                        (CONS #'|MLIFT;corrPoly;SupLLLLVRU;1!0|
                                              (VECTOR $ |a| |y|))
                                        |f1| (QREFELT $ 26))
                                       #18#)
                                      . #21#)))
                              (LETT #17# (CDR #17#) . #21#) (GO G190) G191
                              (EXIT (NREVERSE #18#))))
                        . #21#)
                  (LETT |um|
                        (SPADCALL
                         (CONS #'|MLIFT;corrPoly;SupLLLLVRU;1!1|
                               (VECTOR $ |a| |y|))
                         |m| (QREFELT $ 26))
                        . #21#)
                  (LETT |flcoef|
                        (SPADCALL |um| |lvar| (CDR |fval|) (CDR |ld|)
                                  |listpolv| |table| |pmod| (QREFELT $ 32))
                        . #21#)
                  (COND
                   ((QEQCAR |flcoef| 1)
                    (PROGN (LETT #6# (CONS 1 "failed") . #21#) (GO #22#)))
                   (#23# (LETT |lcoef| (QCDR |flcoef|) . #21#)))
                  (LETT |listcong|
                        (PROGN
                         (LETT #16# NIL . #21#)
                         (SEQ (LETT |l| 1 . #21#) G190
                              (COND ((|greater_SI| |l| |np|) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #16#
                                      (CONS
                                       (PROGN
                                        (LETT #12# NIL . #21#)
                                        (SEQ (LETT |i| 1 . #21#) G190
                                             (COND
                                              ((|greater_SI| |i| |np|)
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((SPADCALL |i| |l|
                                                           (QREFELT $ 35))
                                                 (PROGN
                                                  (LETT #15#
                                                        (SPADCALL |flist| |i|
                                                                  (QREFELT $
                                                                           37))
                                                        . #21#)
                                                  (COND
                                                   (#12#
                                                    (LETT #13#
                                                          (SPADCALL #13# #15#
                                                                    (QREFELT $
                                                                             38))
                                                          . #21#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #13# #15# . #21#)
                                                     (LETT #12# 'T
                                                           . #21#)))))))))
                                             (LETT |i| (|inc_SI| |i|) . #21#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#12# #13#)
                                              ('T (|spadConstant| $ 39))))
                                       #16#)
                                      . #21#)))
                              (LETT |l| (|inc_SI| |l|) . #21#) (GO G190) G191
                              (EXIT (NREVERSE #16#))))
                        . #21#)
                  (LETT |polc|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 41) |y| 1 (QREFELT $ 42))
                          |a| (QREFELT $ 43))
                         (QREFELT $ 44))
                        . #21#)
                  (LETT |pol| (|spadConstant| $ 39) . #21#)
                  (LETT |diff|
                        (SPADCALL |m|
                                  (PROGN
                                   (LETT #9# NIL . #21#)
                                   (SEQ (LETT |i| 1 . #21#) G190
                                        (COND
                                         ((|greater_SI| |i| |np|) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #11#
                                                 (SPADCALL
                                                  (SPADCALL |lcoef| |i|
                                                            (QREFELT $ 37))
                                                  (SPADCALL |listcong| |i|
                                                            (QREFELT $ 37))
                                                  (QREFELT $ 38))
                                                 . #21#)
                                           (COND
                                            (#9#
                                             (LETT #10#
                                                   (SPADCALL #10# #11#
                                                             (QREFELT $ 45))
                                                   . #21#))
                                            ('T
                                             (PROGN
                                              (LETT #10# #11# . #21#)
                                              (LETT #9# 'T . #21#)))))))
                                        (LETT |i| (|inc_SI| |i|) . #21#)
                                        (GO G190) G191 (EXIT NIL))
                                   (COND (#9# #10#)
                                         (#23# (|spadConstant| $ 46))))
                                  (QREFELT $ 47))
                        . #21#)
                  (SEQ (LETT |l| 1 . #21#) G190
                       (COND ((|greater_SI| |l| |deg1|) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL |diff| (|spadConstant| $ 46)
                                    (QREFELT $ 50))
                          (PROGN
                           (LETT #6# (CONS 0 |lcoef|) . #21#)
                           (GO #22#))))
                        (LETT |pol| (SPADCALL |pol| |polc| (QREFELT $ 38))
                              . #21#)
                        (LETT |ddiff|
                              (SPADCALL
                               (CONS #'|MLIFT;corrPoly;SupLLLLVRU;1!2|
                                     (VECTOR |a| $ |y| |l|))
                               |diff| (QREFELT $ 26))
                              . #21#)
                        (EXIT
                         (COND
                          ((SPADCALL |ddiff| (|spadConstant| $ 46)
                                     (QREFELT $ 50))
                           "next l")
                          ('T
                           (SEQ
                            (LETT |fbeta|
                                  (SPADCALL |ddiff| |lvar| (CDR |fval|)
                                            (CDR |ld|) |listpolv| |table|
                                            |pmod| (QREFELT $ 32))
                                  . #21#)
                            (COND
                             ((QEQCAR |fbeta| 1)
                              (PROGN
                               (LETT #6# (CONS 1 "failed") . #21#)
                               (GO #22#)))
                             ('T (LETT |beta| (QCDR |fbeta|) . #21#)))
                            (LETT |lcoef|
                                  (PROGN
                                   (LETT #5# NIL . #21#)
                                   (SEQ (LETT |i| 1 . #21#) G190
                                        (COND
                                         ((|greater_SI| |i| |np|) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |lcoef| |i|
                                                            (QREFELT $ 37))
                                                  (SPADCALL
                                                   (SPADCALL |beta| |i|
                                                             (QREFELT $ 37))
                                                   |pol| (QREFELT $ 38))
                                                  (QREFELT $ 45))
                                                 #5#)
                                                . #21#)))
                                        (LETT |i| (|inc_SI| |i|) . #21#)
                                        (GO G190) G191 (EXIT (NREVERSE #5#))))
                                  . #21#)
                            (EXIT
                             (LETT |diff|
                                   (SPADCALL |diff|
                                             (SPADCALL
                                              (PROGN
                                               (LETT #1# NIL . #21#)
                                               (SEQ (LETT |i| 1 . #21#) G190
                                                    (COND
                                                     ((|greater_SI| |i| |np|)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #4#
                                                             (SPADCALL
                                                              (SPADCALL
                                                               |listcong| |i|
                                                               (QREFELT $ 37))
                                                              (SPADCALL |beta|
                                                                        |i|
                                                                        (QREFELT
                                                                         $ 37))
                                                              (QREFELT $ 38))
                                                             . #21#)
                                                       (COND
                                                        (#1#
                                                         (LETT #2#
                                                               (SPADCALL #2#
                                                                         #4#
                                                                         (QREFELT
                                                                          $
                                                                          45))
                                                               . #21#))
                                                        ('T
                                                         (PROGN
                                                          (LETT #2# #4# . #21#)
                                                          (LETT #1# 'T
                                                                . #21#)))))))
                                                    (LETT |i| (|inc_SI| |i|)
                                                          . #21#)
                                                    (GO G190) G191 (EXIT NIL))
                                               (COND (#1# #2#)
                                                     ('T
                                                      (|spadConstant| $ 46))))
                                              |pol| (QREFELT $ 38))
                                             (QREFELT $ 47))
                                   . #21#)))))))
                       (LETT |l| (|inc_SI| |l|) . #21#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (CONS 0 |lcoef|))))))
          #22# (EXIT #6#)))) 

(SDEFUN |MLIFT;corrPoly;SupLLLLVRU;1!2| ((|p1| NIL) ($$ NIL))
        (PROG (|l| |y| $ |a|)
          (LETT |l| (QREFELT $$ 3) . #1=(|MLIFT;corrPoly;SupLLLLVRU;1|))
          (LETT |y| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |a| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|MLIFT;normalDerivM| |p1| |l| |y| $) |y| |a|
                      (QREFELT $ 24)))))) 

(SDEFUN |MLIFT;corrPoly;SupLLLLVRU;1!1| ((|p1| NIL) ($$ NIL))
        (PROG (|y| |a| $)
          (LETT |y| (QREFELT $$ 2) . #1=(|MLIFT;corrPoly;SupLLLLVRU;1|))
          (LETT |a| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |p1| |y| |a| (QREFELT $ 24)))))) 

(SDEFUN |MLIFT;corrPoly;SupLLLLVRU;1!0| ((|p1| NIL) ($$ NIL))
        (PROG (|y| |a| $)
          (LETT |y| (QREFELT $$ 2) . #1=(|MLIFT;corrPoly;SupLLLLVRU;1|))
          (LETT |a| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |p1| |y| |a| (QREFELT $ 24)))))) 

(SDEFUN |MLIFT;lifting1;SupLLLLLLVRU;2|
        ((|m| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|plist| |List| (|SparseUnivariatePolynomial| P)) (|vlist| |List| R)
         (|tlist| |List| P)
         (|coeflist| |List|
          (|List|
           (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))
         (|listdeg| |List| (|NonNegativeInteger|))
         (|table| |Vector| (|List| (|SparseUnivariatePolynomial| R)))
         (|pmod| R)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG
         ((#1=#:G204 NIL) (|idegj| (|Integer|)) (#2=#:G221 NIL) (|term| NIL)
          (#3=#:G219 NIL) (#4=#:G220 NIL) (|alpha| NIL) (#5=#:G218 NIL)
          (|lalpha| #6=(|List| (|SparseUnivariatePolynomial| P)))
          (|flalpha|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|mc| (|SparseUnivariatePolynomial| P)) (#7=#:G203 NIL)
          (#8=#:G188 NIL) (#9=#:G187 #10=(|SparseUnivariatePolynomial| P))
          (#11=#:G189 #10#) (#12=#:G217 NIL) (|pol| (P)) (|k| NIL) (|polc| (P))
          (|mj| (|SparseUnivariatePolynomial| P)) (#13=#:G215 NIL) (|tpol| NIL)
          (#14=#:G216 NIL) (|clist| NIL) (#15=#:G214 NIL) (#16=#:G212 NIL)
          (|p| NIL) (#17=#:G213 NIL) (|lcp| NIL) (#18=#:G211 NIL)
          (|clv|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (|tlv| (|List| P))
          (|#G41|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (|#G40| (|List| P)) (#19=#:G210 NIL) (#20=#:G209 NIL)
          (#21=#:G208 NIL) (#22=#:G207 NIL) (#23=#:G206 NIL) (#24=#:G205 NIL)
          (|subsval| (|List| R)) (|subsvar| (|List| OV))
          (|ldeg| (|List| (|NonNegativeInteger|)))
          (|degj| (|NonNegativeInteger|)) (|v| (R)) (|conglist| #6#)
          (|li| (|List| OV)) (|x| (OV)) (|j| NIL) (|testp| (|Boolean|))
          (|nvar| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |conglist| NIL . #25=(|MLIFT;lifting1;SupLLLLLLVRU;2|))
                (LETT |nvar| (LENGTH |lvar|) . #25#)
                (LETT |testp| (COND ((NULL |tlist|) 'NIL) ('T 'T)) . #25#)
                (LETT |lalpha| NIL . #25#) (LETT |tlv| NIL . #25#)
                (LETT |subsvar| NIL . #25#) (LETT |subsval| NIL . #25#)
                (LETT |li| |lvar| . #25#) (LETT |ldeg| NIL . #25#)
                (LETT |clv| NIL . #25#)
                (SEQ (LETT |j| 1 . #25#) G190
                     (COND ((|greater_SI| |j| |nvar|) (GO G191)))
                     (SEQ (LETT |x| (|SPADfirst| |li|) . #25#)
                          (LETT |li| (CDR |li|) . #25#)
                          (LETT |conglist| |plist| . #25#)
                          (LETT |v| (|SPADfirst| |vlist|) . #25#)
                          (LETT |vlist| (CDR |vlist|) . #25#)
                          (LETT |degj| (SPADCALL |listdeg| |j| (QREFELT $ 51))
                                . #25#)
                          (LETT |ldeg| (CONS |degj| |ldeg|) . #25#)
                          (LETT |subsvar| (CONS |x| |subsvar|) . #25#)
                          (LETT |subsval| (CONS |v| |subsval|) . #25#)
                          (COND
                           (|testp|
                            (SEQ
                             (COND
                              ((< |j| |nvar|)
                               (SEQ
                                (LETT |tlv|
                                      (PROGN
                                       (LETT #24# NIL . #25#)
                                       (SEQ (LETT |p| NIL . #25#)
                                            (LETT #23# |tlist| . #25#) G190
                                            (COND
                                             ((OR (ATOM #23#)
                                                  (PROGN
                                                   (LETT |p| (CAR #23#) . #25#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #24#
                                                    (CONS
                                                     (SPADCALL |p| |li| |vlist|
                                                               (QREFELT $ 52))
                                                     #24#)
                                                    . #25#)))
                                            (LETT #23# (CDR #23#) . #25#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #24#))))
                                      . #25#)
                                (EXIT
                                 (LETT |clv|
                                       (PROGN
                                        (LETT #22# NIL . #25#)
                                        (SEQ (LETT |clist| NIL . #25#)
                                             (LETT #21# |coeflist| . #25#) G190
                                             (COND
                                              ((OR (ATOM #21#)
                                                   (PROGN
                                                    (LETT |clist| (CAR #21#)
                                                          . #25#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #22#
                                                     (CONS
                                                      (PROGN
                                                       (LETT #20# NIL . #25#)
                                                       (SEQ
                                                        (LETT |term| NIL
                                                              . #25#)
                                                        (LETT #19# |clist|
                                                              . #25#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #19#)
                                                              (PROGN
                                                               (LETT |term|
                                                                     (CAR #19#)
                                                                     . #25#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #20#
                                                                (CONS
                                                                 (CONS
                                                                  (QCAR |term|)
                                                                  (SPADCALL
                                                                   (QCDR
                                                                    |term|)
                                                                   |li| |vlist|
                                                                   (QREFELT $
                                                                            52)))
                                                                 #20#)
                                                                . #25#)))
                                                        (LETT #19# (CDR #19#)
                                                              . #25#)
                                                        (GO G190) G191
                                                        (EXIT
                                                         (NREVERSE #20#))))
                                                      #22#)
                                                     . #25#)))
                                             (LETT #21# (CDR #21#) . #25#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #22#))))
                                       . #25#))))
                              ('T
                               (PROGN
                                (LETT |#G40| |tlist| . #25#)
                                (LETT |#G41| |coeflist| . #25#)
                                (LETT |tlv| |#G40| . #25#)
                                (LETT |clv| |#G41| . #25#))))
                             (LETT |plist|
                                   (PROGN
                                    (LETT #18# NIL . #25#)
                                    (SEQ (LETT |lcp| NIL . #25#)
                                         (LETT #17# |tlv| . #25#)
                                         (LETT |p| NIL . #25#)
                                         (LETT #16# |plist| . #25#) G190
                                         (COND
                                          ((OR (ATOM #16#)
                                               (PROGN
                                                (LETT |p| (CAR #16#) . #25#)
                                                NIL)
                                               (ATOM #17#)
                                               (PROGN
                                                (LETT |lcp| (CAR #17#) . #25#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #18#
                                                 (CONS
                                                  (|MLIFT;subslead| |p| |lcp|
                                                   $)
                                                  #18#)
                                                 . #25#)))
                                         (LETT #16#
                                               (PROG1 (CDR #16#)
                                                 (LETT #17# (CDR #17#) . #25#))
                                               . #25#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #18#))))
                                   . #25#)
                             (EXIT
                              (COND
                               ((NULL (NULL |coeflist|))
                                (LETT |plist|
                                      (PROGN
                                       (LETT #15# NIL . #25#)
                                       (SEQ (LETT |clist| NIL . #25#)
                                            (LETT #14# |clv| . #25#)
                                            (LETT |tpol| NIL . #25#)
                                            (LETT #13# |plist| . #25#) G190
                                            (COND
                                             ((OR (ATOM #13#)
                                                  (PROGN
                                                   (LETT |tpol| (CAR #13#)
                                                         . #25#)
                                                   NIL)
                                                  (ATOM #14#)
                                                  (PROGN
                                                   (LETT |clist| (CAR #14#)
                                                         . #25#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #15#
                                                    (CONS
                                                     (|MLIFT;subscoef| |tpol|
                                                      |clist| $)
                                                     #15#)
                                                    . #25#)))
                                            (LETT #13#
                                                  (PROG1 (CDR #13#)
                                                    (LETT #14# (CDR #14#)
                                                          . #25#))
                                                  . #25#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #15#))))
                                      . #25#)))))))
                          (LETT |mj|
                                (SPADCALL
                                 (CONS #'|MLIFT;lifting1;SupLLLLLLVRU;2!0|
                                       (VECTOR $ |vlist| |li|))
                                 |m| (QREFELT $ 26))
                                . #25#)
                          (LETT |polc|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 53))
                                          (SPADCALL |v| (QREFELT $ 20))
                                          (QREFELT $ 43))
                                . #25#)
                          (LETT |pol| (|spadConstant| $ 41) . #25#)
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1 . #25#) G190
                                 (COND ((|greater_SI| |k| |degj|) (GO G191)))
                                 (SEQ
                                  (LETT |pol|
                                        (SPADCALL |pol| |polc| (QREFELT $ 54))
                                        . #25#)
                                  (LETT |mc|
                                        (SPADCALL
                                         (PROGN
                                          (LETT #8# NIL . #25#)
                                          (SEQ (LETT |term| NIL . #25#)
                                               (LETT #12# |plist| . #25#) G190
                                               (COND
                                                ((OR (ATOM #12#)
                                                     (PROGN
                                                      (LETT |term| (CAR #12#)
                                                            . #25#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #11# |term| . #25#)
                                                  (COND
                                                   (#8#
                                                    (LETT #9#
                                                          (SPADCALL #9# #11#
                                                                    (QREFELT $
                                                                             38))
                                                          . #25#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #9# #11# . #25#)
                                                     (LETT #8# 'T . #25#)))))))
                                               (LETT #12# (CDR #12#) . #25#)
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#8# #9#)
                                                ('T (|spadConstant| $ 39))))
                                         |mj| (QREFELT $ 47))
                                        . #25#)
                                  (COND
                                   ((SPADCALL |mc| (|spadConstant| $ 46)
                                              (QREFELT $ 50))
                                    (PROGN
                                     (LETT #7# |$NoValue| . #25#)
                                     (GO #26=#:G195))))
                                  (LETT |mc|
                                        (SPADCALL
                                         (CONS
                                          #'|MLIFT;lifting1;SupLLLLLLVRU;2!1|
                                          (VECTOR $ |x| |k|))
                                         |mc| (QREFELT $ 26))
                                        . #25#)
                                  (LETT |mc|
                                        (SPADCALL
                                         (CONS
                                          #'|MLIFT;lifting1;SupLLLLLLVRU;2!2|
                                          (VECTOR $ |v| |x|))
                                         |mc| (QREFELT $ 26))
                                        . #25#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL |mc| (|spadConstant| $ 46)
                                               (QREFELT $ 50))
                                     "next k")
                                    ('T
                                     (SEQ
                                      (LETT |flalpha|
                                            (SPADCALL |mc| (CDR |subsvar|)
                                                      (CDR |subsval|)
                                                      (CDR |ldeg|) |conglist|
                                                      |table| |pmod|
                                                      (QREFELT $ 32))
                                            . #25#)
                                      (COND
                                       ((QEQCAR |flalpha| 1)
                                        (PROGN
                                         (LETT #1# (CONS 1 "failed") . #25#)
                                         (GO #27=#:G202)))
                                       ('T
                                        (LETT |lalpha| (QCDR |flalpha|)
                                              . #25#)))
                                      (EXIT
                                       (LETT |plist|
                                             (PROGN
                                              (LETT #5# NIL . #25#)
                                              (SEQ (LETT |alpha| NIL . #25#)
                                                   (LETT #4# |lalpha| . #25#)
                                                   (LETT |term| NIL . #25#)
                                                   (LETT #3# |plist| . #25#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #3#)
                                                         (PROGN
                                                          (LETT |term|
                                                                (CAR #3#)
                                                                . #25#)
                                                          NIL)
                                                         (ATOM #4#)
                                                         (PROGN
                                                          (LETT |alpha|
                                                                (CAR #4#)
                                                                . #25#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #5#
                                                           (CONS
                                                            (SPADCALL |term|
                                                                      (SPADCALL
                                                                       |alpha|
                                                                       |pol|
                                                                       (QREFELT
                                                                        $ 55))
                                                                      (QREFELT
                                                                       $ 47))
                                                            #5#)
                                                           . #25#)))
                                                   (LETT #3#
                                                         (PROG1 (CDR #3#)
                                                           (LETT #4# (CDR #4#)
                                                                 . #25#))
                                                         . #25#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #5#))))
                                             . #25#)))))))
                                 (LETT |k| (|inc_SI| |k|) . #25#) (GO G190)
                                 G191 (EXIT NIL)))
                           #26# (EXIT #7#))
                          (LETT |idegj| (|MLIFT;maxDegree| |m| |x| $) . #25#)
                          (SEQ (LETT |term| NIL . #25#)
                               (LETT #2# |plist| . #25#) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN
                                      (LETT |term| (CAR #2#) . #25#)
                                      NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |idegj|
                                       (- |idegj|
                                          (|MLIFT;maxDegree| |term| |x| $))
                                       . #25#)))
                               (LETT #2# (CDR #2#) . #25#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            ((< |idegj| 0)
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #25#)
                              (GO #27#))))))
                     (LETT |j| (|inc_SI| |j|) . #25#) (GO G190) G191
                     (EXIT NIL))
                (EXIT (CONS 0 |plist|))))
          #27# (EXIT #1#)))) 

(SDEFUN |MLIFT;lifting1;SupLLLLLLVRU;2!2| ((|p1| NIL) ($$ NIL))
        (PROG (|x| |v| $)
          (LETT |x| (QREFELT $$ 2) . #1=(|MLIFT;lifting1;SupLLLLLLVRU;2|))
          (LETT |v| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (SPADCALL |p1| (LIST |x|) (LIST |v|) (QREFELT $ 52)))))) 

(SDEFUN |MLIFT;lifting1;SupLLLLLLVRU;2!1| ((|p1| NIL) ($$ NIL))
        (PROG (|k| |x| $)
          (LETT |k| (QREFELT $$ 2) . #1=(|MLIFT;lifting1;SupLLLLLLVRU;2|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MLIFT;normalDerivM| |p1| |k| |x| $))))) 

(SDEFUN |MLIFT;lifting1;SupLLLLLLVRU;2!0| ((|p1| NIL) ($$ NIL))
        (PROG (|li| |vlist| $)
          (LETT |li| (QREFELT $$ 2) . #1=(|MLIFT;lifting1;SupLLLLLLVRU;2|))
          (LETT |vlist| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |p1| |li| |vlist| (QREFELT $ 52)))))) 

(SDEFUN |MLIFT;maxDegree|
        ((|um| |SparseUnivariatePolynomial| P) (|x| OV)
         ($ |NonNegativeInteger|))
        (SPROG ((|ans| (|NonNegativeInteger|)))
               (SEQ (LETT |ans| 0 . #1=(|MLIFT;maxDegree|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |um| (|spadConstant| $ 46)
                                      (QREFELT $ 60)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (MAX |ans|
                                     (SPADCALL (SPADCALL |um| (QREFELT $ 61))
                                               |x| (QREFELT $ 62)))
                                . #1#)
                          (EXIT
                           (LETT |um| (SPADCALL |um| (QREFELT $ 63)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |MLIFT;lifting;SupLLLLLRU;4|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|plist| |List| (|SparseUnivariatePolynomial| R)) (|vlist| |List| R)
         (|tlist| |List| P) (|listdeg| |List| (|NonNegativeInteger|))
         (|pmod| R)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
        (SPROG
         ((#1=#:G255 NIL)
          (|ffl| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|table| (|Vector| (|List| (|SparseUnivariatePolynomial| R))))
          (|tab|
           (|Union| (|Vector| (|List| (|SparseUnivariatePolynomial| R)))
                    "failed"))
          (#2=#:G247 NIL) (#3=#:G244 NIL)
          (#4=#:G243 #5=(|SparseUnivariatePolynomial| P)) (#6=#:G245 #5#)
          (#7=#:G260 NIL) (|pol| NIL)
          (|nplist| (|List| (|SparseUnivariatePolynomial| P))) (#8=#:G259 NIL)
          (|pp| NIL) (#9=#:G258 NIL) (|listdet| (|List| #5#))
          (|ldcoef|
           (|Record| (|:| |deter| (|List| (|SparseUnivariatePolynomial| P)))
                     (|:| |dterm|
                          (|List|
                           (|List|
                            (|Record| (|:| |expt| (|NonNegativeInteger|))
                                      (|:| |pcoef| P)))))
                     (|:| |nfacts| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |nlead| (|List| P))))
          (#10=#:G257 NIL) (#11=#:G256 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |nplist|
                  (PROGN
                   (LETT #11# NIL . #12=(|MLIFT;lifting;SupLLLLLRU;4|))
                   (SEQ (LETT |pp| NIL . #12#) (LETT #10# |plist| . #12#) G190
                        (COND
                         ((OR (ATOM #10#)
                              (PROGN (LETT |pp| (CAR #10#) . #12#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #11#
                                (CONS (SPADCALL (ELT $ 20) |pp| (QREFELT $ 23))
                                      #11#)
                                . #12#)))
                        (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                        (EXIT (NREVERSE #11#))))
                  . #12#)
            (EXIT
             (COND
              ((NULL |tlist|)
               (SEQ
                (LETT |table|
                      (SPADCALL (SPADCALL |um| (QREFELT $ 64)) |pmod| |plist|
                                (QREFELT $ 67))
                      . #12#)
                (EXIT
                 (COND
                  ((QEQCAR |table| 1)
                   (|error| "Table construction failed in MLIFT"))
                  (#13='T
                   (SPADCALL |um| |lvar| |nplist| |vlist| |tlist| NIL |listdeg|
                             (QCDR |table|) |pmod| (QREFELT $ 59)))))))
              (#13#
               (SEQ
                (LETT |ldcoef| (SPADCALL |um| |plist| |tlist| (QREFELT $ 70))
                      . #12#)
                (COND
                 ((NULL (LETT |listdet| (QVELT |ldcoef| 0) . #12#))
                  (LETT |tab|
                        (SPADCALL (SPADCALL |um| (QREFELT $ 64)) |pmod| |plist|
                                  (QREFELT $ 67))
                        . #12#))
                 (#13#
                  (SEQ
                   (COND
                    ((EQL (LENGTH |listdet|) (LENGTH |plist|))
                     (PROGN
                      (LETT #1# (CONS 0 |listdet|) . #12#)
                      (GO #14=#:G254))))
                   (LETT |plist| (QVELT |ldcoef| 2) . #12#)
                   (LETT |nplist|
                         (PROGN
                          (LETT #9# NIL . #12#)
                          (SEQ (LETT |pp| NIL . #12#) (LETT #8# |plist| . #12#)
                               G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |pp| (CAR #8#) . #12#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #9#
                                       (CONS
                                        (SPADCALL (ELT $ 20) |pp|
                                                  (QREFELT $ 23))
                                        #9#)
                                       . #12#)))
                               (LETT #8# (CDR #8#) . #12#) (GO G190) G191
                               (EXIT (NREVERSE #9#))))
                         . #12#)
                   (LETT |um|
                         (PROG2
                             (LETT #2#
                                   (SPADCALL |um|
                                             (PROGN
                                              (LETT #3# NIL . #12#)
                                              (SEQ (LETT |pol| NIL . #12#)
                                                   (LETT #7# |listdet| . #12#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #7#)
                                                         (PROGN
                                                          (LETT |pol| (CAR #7#)
                                                                . #12#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #6# |pol| . #12#)
                                                      (COND
                                                       (#3#
                                                        (LETT #4#
                                                              (SPADCALL #4# #6#
                                                                        (QREFELT
                                                                         $ 38))
                                                              . #12#))
                                                       ('T
                                                        (PROGN
                                                         (LETT #4# #6# . #12#)
                                                         (LETT #3# 'T
                                                               . #12#)))))))
                                                   (LETT #7# (CDR #7#) . #12#)
                                                   (GO G190) G191 (EXIT NIL))
                                              (COND (#3# #4#)
                                                    (#13#
                                                     (|spadConstant| $ 39))))
                                             (QREFELT $ 72))
                                   . #12#)
                             (QCDR #2#)
                           (|check_union| (QEQCAR #2# 0)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 9))
                                          #2#))
                         . #12#)
                   (LETT |tlist| (QVELT |ldcoef| 3) . #12#)
                   (EXIT
                    (LETT |tab|
                          (SPADCALL (SPADCALL |um| (QREFELT $ 64)) |pmod|
                                    (CDR |plist|) (QREFELT $ 67))
                          . #12#)))))
                (EXIT
                 (COND
                  ((QEQCAR |tab| 1)
                   (|error| "Table construction failed in MLIFT"))
                  (#13#
                   (SEQ (LETT |table| (QCDR |tab|) . #12#)
                        (LETT |ffl|
                              (SPADCALL |um| |lvar| |nplist| |vlist| |tlist|
                                        (QVELT |ldcoef| 1) |listdeg| |table|
                                        |pmod| (QREFELT $ 59))
                              . #12#)
                        (COND
                         ((QEQCAR |ffl| 1)
                          (PROGN
                           (LETT #1# (CONS 1 "failed") . #12#)
                           (GO #14#))))
                        (EXIT
                         (CONS 0 (APPEND |listdet| (QCDR |ffl|))))))))))))))
          #14# (EXIT #1#)))) 

(SDEFUN |MLIFT;normalDerivM| ((|g| P) (|m| |Integer|) (|x| OV) ($ P))
        (SPADCALL (|MLIFT;normalDeriv| (SPADCALL |g| |x| (QREFELT $ 75)) |m| $)
                  |x| (QREFELT $ 76))) 

(SDEFUN |MLIFT;normalDeriv|
        ((|f| |SparseUnivariatePolynomial| P) (|m| |Integer|)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|n| #1=(|Integer|)) (|ris| (|SparseUnivariatePolynomial| P))
          (#2=#:G264 NIL) (|n1| #1#) (|k| (|Integer|))
          (|#G1| (|NonNegativeInteger|)))
         (SEQ
          (LETT |#G1| (SPADCALL |f| (QREFELT $ 64)) . #3=(|MLIFT;normalDeriv|))
          (LETT |n1| |#G1| . #3#)
          (EXIT
           (COND ((< |#G1| |m|) (|spadConstant| $ 46))
                 ((EQL |n1| |m|)
                  (SPADCALL (SPADCALL |f| (QREFELT $ 61)) (QREFELT $ 44)))
                 ('T
                  (SEQ (LETT |k| (SPADCALL |n1| |m| (QREFELT $ 78)) . #3#)
                       (LETT |ris| (|spadConstant| $ 46) . #3#)
                       (LETT |n| |n1| . #3#)
                       (SEQ G190 (COND ((NULL (>= |n| |m|)) (GO G191)))
                            (SEQ
                             (SEQ G190
                                  (COND
                                   ((NULL (SPADCALL |n1| |n| (QREFELT $ 79)))
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
                                                                           61))
                                                        (QREFELT $ 80))
                                              (PROG1
                                                  (LETT #2# (- |n| |m|) . #3#)
                                                (|check_subtype| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                              (QREFELT $ 81))
                                             (QREFELT $ 45))
                                   . #3#)
                             (LETT |f| (SPADCALL |f| (QREFELT $ 63)) . #3#)
                             (EXIT
                              (LETT |n| (SPADCALL |f| (QREFELT $ 64)) . #3#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |ris|)))))))) 

(SDEFUN |MLIFT;subslead|
        ((|m| |SparseUnivariatePolynomial| P) (|pol| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG ((|dm| (|NonNegativeInteger|)))
               (SEQ (LETT |dm| (SPADCALL |m| (QREFELT $ 64)) |MLIFT;subslead|)
                    (EXIT
                     (SPADCALL (SPADCALL |pol| |dm| (QREFELT $ 81))
                               (SPADCALL |m| (QREFELT $ 63)) (QREFELT $ 45)))))) 

(SDEFUN |MLIFT;subscoef|
        ((|um| |SparseUnivariatePolynomial| P)
         (|lterm| |List|
          (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|new| (|SparseUnivariatePolynomial| P)) (|i| (|NonNegativeInteger|))
          (#1=#:G273 NIL) (|k| NIL) (|dm| (|NonNegativeInteger|)))
         (SEQ
          (LETT |dm| (SPADCALL |um| (QREFELT $ 64)) . #2=(|MLIFT;subscoef|))
          (LETT |new|
                (SPADCALL (SPADCALL |um| (QREFELT $ 61)) |dm| (QREFELT $ 81))
                . #2#)
          (SEQ (LETT |k| (- |dm| 1) . #2#) G190 (COND ((< |k| 0) (GO G191)))
               (SEQ
                (LETT |i|
                      (PROG1 (LETT #1# |k| . #2#)
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      . #2#)
                (COND
                 ((OR (NULL |lterm|)
                      (SPADCALL (QCAR (|SPADfirst| |lterm|)) |i|
                                (QREFELT $ 35)))
                  (EXIT
                   (LETT |new|
                         (SPADCALL |new|
                                   (SPADCALL (SPADCALL |um| |i| (QREFELT $ 82))
                                             |i| (QREFELT $ 81))
                                   (QREFELT $ 45))
                         . #2#))))
                (LETT |new|
                      (SPADCALL |new|
                                (SPADCALL (QCDR (|SPADfirst| |lterm|)) |i|
                                          (QREFELT $ 81))
                                (QREFELT $ 45))
                      . #2#)
                (EXIT (LETT |lterm| (CDR |lterm|) . #2#)))
               (LETT |k| (+ |k| -1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |new|)))) 

(DECLAIM (NOTINLINE |MultivariateLifting;|)) 

(DEFUN |MultivariateLifting| (&REST #1=#:G280)
  (SPROG NIL
         (PROG (#2=#:G281)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultivariateLifting|)
                                               '|domainEqualList|)
                    . #3=(|MultivariateLifting|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultivariateLifting;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultivariateLifting|)))))))))) 

(DEFUN |MultivariateLifting;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MultivariateLifting|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|MultivariateLifting| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 83) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|MultivariateLifting|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MultivariateLifting| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |ground|)
              (|SparseUnivariatePolynomial| 8) (|Mapping| 8 9)
              (|SparseUnivariatePolynomial| 9)
              (|SparseUnivariatePolynomialFunctions2| 9 8) (5 . |map|)
              (|Union| 66 '"failed") (|Vector| 66) (|GenExEuclid| 8 11)
              (11 . |solveid|) (18 . |coerce|) (|Mapping| 9 8)
              (|SparseUnivariatePolynomialFunctions2| 8 9) (23 . |map|)
              (29 . |eval|) (|Mapping| 9 9) (36 . |map|) (|Union| 31 '"failed")
              (|List| 7) (|List| 8) (|List| 34) (|List| 13)
              |MLIFT;corrPoly;SupLLLLVRU;1| (|Boolean|) (|NonNegativeInteger|)
              (42 . ~=) (|Integer|) (48 . |elt|) (54 . *) (60 . |One|)
              (64 . |One|) (68 . |One|) (72 . |monomial|) (79 . -)
              (85 . |coerce|) (90 . +) (96 . |Zero|) (100 . -) (106 . |Zero|)
              (110 . |Zero|) (114 . =) (120 . |elt|) (126 . |eval|)
              (133 . |coerce|) (138 . *) (144 . *) (|List| 9)
              (|Record| (|:| |expt| 34) (|:| |pcoef| 9)) (|List| (|List| 57))
              |MLIFT;lifting1;SupLLLLLLVRU;2| (150 . ~=)
              (156 . |leadingCoefficient|) (161 . |degree|) (167 . |reductum|)
              (172 . |degree|) (|Union| 17 '"failed") (|List| 11)
              (177 . |tablePow|)
              (|Record| (|:| |deter| 31) (|:| |dterm| 58) (|:| |nfacts| 66)
                        (|:| |nlead| 56))
              (|NPCoef| 11 6 7 8 9) (184 . |npcoef|) (|Union| $ '"failed")
              (191 . |exquo|) |MLIFT;lifting;SupLLLLLRU;4|
              (|SparseUnivariatePolynomial| $) (197 . |univariate|)
              (203 . |multivariate|) (|IntegerCombinatoricFunctions| 36)
              (209 . |binomial|) (215 . >) (221 . *) (227 . |monomial|)
              (233 . |coefficient|))
           '#(|lifting1| 239 |lifting| 252 |corrPoly| 263) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 82
                                                 '(1 9 8 0 10 2 14 11 12 13 15
                                                   3 18 16 11 8 17 19 1 9 0 8
                                                   20 2 22 13 21 11 23 3 9 0 0
                                                   7 0 24 2 13 0 25 0 26 2 34
                                                   33 0 0 35 2 31 13 0 36 37 2
                                                   13 0 0 0 38 0 13 0 39 0 8 0
                                                   40 0 9 0 41 3 9 0 0 7 34 42
                                                   2 9 0 0 0 43 1 13 0 9 44 2
                                                   13 0 0 0 45 0 13 0 46 2 13 0
                                                   0 0 47 0 6 0 48 0 8 0 49 2
                                                   13 33 0 0 50 2 30 34 0 36 51
                                                   3 9 0 0 28 29 52 1 9 0 7 53
                                                   2 9 0 0 0 54 2 13 0 0 9 55 2
                                                   13 33 0 0 60 1 13 9 0 61 2 9
                                                   34 0 7 62 1 13 0 0 63 1 13
                                                   34 0 64 3 18 65 34 8 66 67 3
                                                   69 68 13 66 56 70 2 13 71 0
                                                   0 72 2 9 74 0 7 75 2 9 0 74
                                                   7 76 2 77 36 36 36 78 2 36
                                                   33 0 0 79 2 9 0 36 0 80 2 13
                                                   0 9 34 81 2 13 9 0 34 82 9 0
                                                   27 13 28 31 29 56 58 30 17 8
                                                   59 7 0 27 13 28 66 29 56 30
                                                   8 73 7 0 27 13 28 29 30 31
                                                   17 8 32)))))
           '|lookupComplete|)) 
