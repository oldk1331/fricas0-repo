
(/VERSIONCHECK 2) 

(DEFUN |MLIFT;corrPoly;SupLLLLVRU;1|
       (|m| |lvar| |fval| |ld| |flist| |table| |pmod| $)
  (PROG (|diff| #1=#:G183 #2=#:G182 #3=#:G184 |i| |lcoef| #4=#:G196 |beta|
         #5=#:G190 |fbeta| |ddiff| |pol| |l| #6=#:G163 #7=#:G162 #8=#:G164
         |polc| |listcong| #9=#:G159 #10=#:G158 #11=#:G160 #12=#:G195 |flcoef|
         |um| |listpolv| #13=#:G194 |f1| #14=#:G193 |y| |a| |np| |deg1|
         #15=#:G192 |mp| #16=#:G191 |lp|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((EQL (LENGTH |lvar|) 0)
         (SEQ
          (LETT |lp|
                (SPADCALL (SPADCALL (ELT $ 10) |m| (QREFELT $ 15)) |pmod|
                          |table| (QREFELT $ 19))
                . #17=(|MLIFT;corrPoly;SupLLLLVRU;1|))
          (COND
           ((QEQCAR |lp| 1)
            (PROGN (LETT #5# (CONS 1 "failed") . #17#) (GO #5#))))
          (EXIT
           (LETT |lcoef|
                 (CONS 0
                       (PROGN
                        (LETT #16# NIL . #17#)
                        (SEQ (LETT |mp| NIL . #17#)
                             (LETT #15# (QCDR |lp|) . #17#) G190
                             (COND
                              ((OR (ATOM #15#)
                                   (PROGN (LETT |mp| (CAR #15#) . #17#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #16#
                                     (CONS
                                      (SPADCALL (ELT $ 20) |mp| (QREFELT $ 23))
                                      #16#)
                                     . #17#)))
                             (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                             (EXIT (NREVERSE #16#)))))
                 . #17#))))
        (#18='T
         (SEQ (LETT |deg1| (|SPADfirst| |ld|) . #17#)
              (LETT |np| (LENGTH |flist|) . #17#)
              (LETT |a| (SPADCALL (|SPADfirst| |fval|) (QREFELT $ 20)) . #17#)
              (LETT |y| (|SPADfirst| |lvar|) . #17#)
              (LETT |lvar| (CDR |lvar|) . #17#)
              (LETT |listpolv|
                    (PROGN
                     (LETT #14# NIL . #17#)
                     (SEQ (LETT |f1| NIL . #17#) (LETT #13# |flist| . #17#)
                          G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |f1| (CAR #13#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS
                                   (SPADCALL
                                    (CONS #'|MLIFT;corrPoly;SupLLLLVRU;1!0|
                                          (VECTOR $ |a| |y|))
                                    |f1| (QREFELT $ 26))
                                   #14#)
                                  . #17#)))
                          (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #17#)
              (LETT |um|
                    (SPADCALL
                     (CONS #'|MLIFT;corrPoly;SupLLLLVRU;1!1|
                           (VECTOR $ |a| |y|))
                     |m| (QREFELT $ 26))
                    . #17#)
              (LETT |flcoef|
                    (SPADCALL |um| |lvar| (CDR |fval|) (CDR |ld|) |listpolv|
                              |table| |pmod| (QREFELT $ 32))
                    . #17#)
              (COND
               ((QEQCAR |flcoef| 1)
                (PROGN (LETT #5# (CONS 1 "failed") . #17#) (GO #5#)))
               (#18# (LETT |lcoef| (QCDR |flcoef|) . #17#)))
              (LETT |listcong|
                    (PROGN
                     (LETT #12# NIL . #17#)
                     (SEQ (LETT |l| 1 . #17#) G190
                          (COND ((|greater_SI| |l| |np|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #12#
                                  (CONS
                                   (PROGN
                                    (LETT #9# NIL . #17#)
                                    (SEQ (LETT |i| 1 . #17#) G190
                                         (COND
                                          ((|greater_SI| |i| |np|) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL |i| |l| (QREFELT $ 35))
                                             (PROGN
                                              (LETT #11#
                                                    (SPADCALL |flist| |i|
                                                              (QREFELT $ 37))
                                                    . #17#)
                                              (COND
                                               (#9#
                                                (LETT #10#
                                                      (SPADCALL #10# #11#
                                                                (QREFELT $ 38))
                                                      . #17#))
                                               ('T
                                                (PROGN
                                                 (LETT #10# #11# . #17#)
                                                 (LETT #9# 'T . #17#)))))))))
                                         (LETT |i| (|inc_SI| |i|) . #17#)
                                         (GO G190) G191 (EXIT NIL))
                                    (COND (#9# #10#)
                                          ('T (|spadConstant| $ 39))))
                                   #12#)
                                  . #17#)))
                          (LETT |l| (|inc_SI| |l|) . #17#) (GO G190) G191
                          (EXIT (NREVERSE #12#))))
                    . #17#)
              (LETT |polc|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 41) |y| 1 (QREFELT $ 42)) |a|
                      (QREFELT $ 43))
                     (QREFELT $ 44))
                    . #17#)
              (LETT |pol| (|spadConstant| $ 39) . #17#)
              (LETT |diff|
                    (SPADCALL |m|
                              (PROGN
                               (LETT #6# NIL . #17#)
                               (SEQ (LETT |i| 1 . #17#) G190
                                    (COND ((|greater_SI| |i| |np|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #8#
                                             (SPADCALL
                                              (SPADCALL |lcoef| |i|
                                                        (QREFELT $ 37))
                                              (SPADCALL |listcong| |i|
                                                        (QREFELT $ 37))
                                              (QREFELT $ 38))
                                             . #17#)
                                       (COND
                                        (#6#
                                         (LETT #7#
                                               (SPADCALL #7# #8#
                                                         (QREFELT $ 45))
                                               . #17#))
                                        ('T
                                         (PROGN
                                          (LETT #7# #8# . #17#)
                                          (LETT #6# 'T . #17#)))))))
                                    (LETT |i| (|inc_SI| |i|) . #17#) (GO G190)
                                    G191 (EXIT NIL))
                               (COND (#6# #7#) (#18# (|spadConstant| $ 46))))
                              (QREFELT $ 47))
                    . #17#)
              (SEQ (LETT |l| 1 . #17#) G190
                   (COND ((|greater_SI| |l| |deg1|) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |diff| (|spadConstant| $ 46) (QREFELT $ 50))
                      (PROGN (LETT #5# (CONS 0 |lcoef|) . #17#) (GO #5#))))
                    (LETT |pol| (SPADCALL |pol| |polc| (QREFELT $ 38)) . #17#)
                    (LETT |ddiff|
                          (SPADCALL
                           (CONS #'|MLIFT;corrPoly;SupLLLLVRU;1!2|
                                 (VECTOR |a| $ |y| |l|))
                           |diff| (QREFELT $ 26))
                          . #17#)
                    (EXIT
                     (COND
                      ((SPADCALL |ddiff| (|spadConstant| $ 46) (QREFELT $ 50))
                       "next l")
                      ('T
                       (SEQ
                        (LETT |fbeta|
                              (SPADCALL |ddiff| |lvar| (CDR |fval|) (CDR |ld|)
                                        |listpolv| |table| |pmod|
                                        (QREFELT $ 32))
                              . #17#)
                        (COND
                         ((QEQCAR |fbeta| 1)
                          (PROGN (LETT #5# (CONS 1 "failed") . #17#) (GO #5#)))
                         ('T (LETT |beta| (QCDR |fbeta|) . #17#)))
                        (LETT |lcoef|
                              (PROGN
                               (LETT #4# NIL . #17#)
                               (SEQ (LETT |i| 1 . #17#) G190
                                    (COND ((|greater_SI| |i| |np|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |lcoef| |i|
                                                        (QREFELT $ 37))
                                              (SPADCALL
                                               (SPADCALL |beta| |i|
                                                         (QREFELT $ 37))
                                               |pol| (QREFELT $ 38))
                                              (QREFELT $ 45))
                                             #4#)
                                            . #17#)))
                                    (LETT |i| (|inc_SI| |i|) . #17#) (GO G190)
                                    G191 (EXIT (NREVERSE #4#))))
                              . #17#)
                        (EXIT
                         (LETT |diff|
                               (SPADCALL |diff|
                                         (SPADCALL
                                          (PROGN
                                           (LETT #1# NIL . #17#)
                                           (SEQ (LETT |i| 1 . #17#) G190
                                                (COND
                                                 ((|greater_SI| |i| |np|)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #3#
                                                         (SPADCALL
                                                          (SPADCALL |listcong|
                                                                    |i|
                                                                    (QREFELT $
                                                                             37))
                                                          (SPADCALL |beta| |i|
                                                                    (QREFELT $
                                                                             37))
                                                          (QREFELT $ 38))
                                                         . #17#)
                                                   (COND
                                                    (#1#
                                                     (LETT #2#
                                                           (SPADCALL #2# #3#
                                                                     (QREFELT $
                                                                              45))
                                                           . #17#))
                                                    ('T
                                                     (PROGN
                                                      (LETT #2# #3# . #17#)
                                                      (LETT #1# 'T
                                                            . #17#)))))))
                                                (LETT |i| (|inc_SI| |i|)
                                                      . #17#)
                                                (GO G190) G191 (EXIT NIL))
                                           (COND (#1# #2#)
                                                 ('T (|spadConstant| $ 46))))
                                          |pol| (QREFELT $ 38))
                                         (QREFELT $ 47))
                               . #17#)))))))
                   (LETT |l| (|inc_SI| |l|) . #17#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |lcoef|))))))
      #5# (EXIT #5#))))) 

(DEFUN |MLIFT;corrPoly;SupLLLLVRU;1!2| (|p1| $$)
  (PROG (|l| |y| $ |a|)
    (LETT |l| (QREFELT $$ 3) . #1=(|MLIFT;corrPoly;SupLLLLVRU;1|))
    (LETT |y| (QREFELT $$ 2) . #1#)
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |a| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|MLIFT;normalDerivM| |p1| |l| |y| $) |y| |a|
                (QREFELT $ 24)))))) 

(DEFUN |MLIFT;corrPoly;SupLLLLVRU;1!1| (|p1| $$)
  (PROG (|y| |a| $)
    (LETT |y| (QREFELT $$ 2) . #1=(|MLIFT;corrPoly;SupLLLLVRU;1|))
    (LETT |a| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |p1| |y| |a| (QREFELT $ 24)))))) 

(DEFUN |MLIFT;corrPoly;SupLLLLVRU;1!0| (|p1| $$)
  (PROG (|y| |a| $)
    (LETT |y| (QREFELT $$ 2) . #1=(|MLIFT;corrPoly;SupLLLLVRU;1|))
    (LETT |a| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |p1| |y| |a| (QREFELT $ 24)))))) 

(DEFUN |MLIFT;lifting1;SupLLLLLLVRU;2|
       (|m| |lvar| |plist| |vlist| |tlist| |coeflist| |listdeg| |table| |pmod|
        $)
  (PROG (#1=#:G225 |idegj| #2=#:G242 |term| #3=#:G240 #4=#:G241 |alpha|
         #5=#:G239 |lalpha| |flalpha| |mc| #6=#:G218 #7=#:G211 #8=#:G210
         #9=#:G212 #10=#:G238 |pol| |k| |polc| |mj| #11=#:G236 |tpol|
         #12=#:G237 |clist| #13=#:G235 #14=#:G233 |p| #15=#:G234 |lcp|
         #16=#:G232 |clv| |tlv| |#G41| |#G40| #17=#:G231 #18=#:G230 #19=#:G229
         #20=#:G228 #21=#:G227 #22=#:G226 |subsval| |subsvar| |ldeg| |degj| |v|
         |conglist| |li| |x| |j| |testp| |nvar|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |conglist| NIL . #23=(|MLIFT;lifting1;SupLLLLLLVRU;2|))
            (LETT |nvar| (LENGTH |lvar|) . #23#)
            (LETT |testp| (COND ((NULL |tlist|) 'NIL) ('T 'T)) . #23#)
            (LETT |lalpha| NIL . #23#) (LETT |tlv| NIL . #23#)
            (LETT |subsvar| NIL . #23#) (LETT |subsval| NIL . #23#)
            (LETT |li| |lvar| . #23#) (LETT |ldeg| NIL . #23#)
            (LETT |clv| NIL . #23#)
            (SEQ (LETT |j| 1 . #23#) G190
                 (COND ((|greater_SI| |j| |nvar|) (GO G191)))
                 (SEQ (LETT |x| (|SPADfirst| |li|) . #23#)
                      (LETT |li| (CDR |li|) . #23#)
                      (LETT |conglist| |plist| . #23#)
                      (LETT |v| (|SPADfirst| |vlist|) . #23#)
                      (LETT |vlist| (CDR |vlist|) . #23#)
                      (LETT |degj| (SPADCALL |listdeg| |j| (QREFELT $ 51))
                            . #23#)
                      (LETT |ldeg| (CONS |degj| |ldeg|) . #23#)
                      (LETT |subsvar| (CONS |x| |subsvar|) . #23#)
                      (LETT |subsval| (CONS |v| |subsval|) . #23#)
                      (COND
                       (|testp|
                        (SEQ
                         (COND
                          ((< |j| |nvar|)
                           (SEQ
                            (LETT |tlv|
                                  (PROGN
                                   (LETT #22# NIL . #23#)
                                   (SEQ (LETT |p| NIL . #23#)
                                        (LETT #21# |tlist| . #23#) G190
                                        (COND
                                         ((OR (ATOM #21#)
                                              (PROGN
                                               (LETT |p| (CAR #21#) . #23#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #22#
                                                (CONS
                                                 (SPADCALL |p| |li| |vlist|
                                                           (QREFELT $ 52))
                                                 #22#)
                                                . #23#)))
                                        (LETT #21# (CDR #21#) . #23#) (GO G190)
                                        G191 (EXIT (NREVERSE #22#))))
                                  . #23#)
                            (EXIT
                             (LETT |clv|
                                   (PROGN
                                    (LETT #20# NIL . #23#)
                                    (SEQ (LETT |clist| NIL . #23#)
                                         (LETT #19# |coeflist| . #23#) G190
                                         (COND
                                          ((OR (ATOM #19#)
                                               (PROGN
                                                (LETT |clist| (CAR #19#)
                                                      . #23#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #20#
                                                 (CONS
                                                  (PROGN
                                                   (LETT #18# NIL . #23#)
                                                   (SEQ
                                                    (LETT |term| NIL . #23#)
                                                    (LETT #17# |clist| . #23#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #17#)
                                                          (PROGN
                                                           (LETT |term|
                                                                 (CAR #17#)
                                                                 . #23#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #18#
                                                            (CONS
                                                             (CONS
                                                              (QCAR |term|)
                                                              (SPADCALL
                                                               (QCDR |term|)
                                                               |li| |vlist|
                                                               (QREFELT $ 52)))
                                                             #18#)
                                                            . #23#)))
                                                    (LETT #17# (CDR #17#)
                                                          . #23#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #18#))))
                                                  #20#)
                                                 . #23#)))
                                         (LETT #19# (CDR #19#) . #23#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #20#))))
                                   . #23#))))
                          ('T
                           (PROGN
                            (LETT |#G40| |tlist| . #23#)
                            (LETT |#G41| |coeflist| . #23#)
                            (LETT |tlv| |#G40| . #23#)
                            (LETT |clv| |#G41| . #23#))))
                         (LETT |plist|
                               (PROGN
                                (LETT #16# NIL . #23#)
                                (SEQ (LETT |lcp| NIL . #23#)
                                     (LETT #15# |tlv| . #23#)
                                     (LETT |p| NIL . #23#)
                                     (LETT #14# |plist| . #23#) G190
                                     (COND
                                      ((OR (ATOM #14#)
                                           (PROGN
                                            (LETT |p| (CAR #14#) . #23#)
                                            NIL)
                                           (ATOM #15#)
                                           (PROGN
                                            (LETT |lcp| (CAR #15#) . #23#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #16#
                                             (CONS
                                              (|MLIFT;subslead| |p| |lcp| $)
                                              #16#)
                                             . #23#)))
                                     (LETT #14#
                                           (PROG1 (CDR #14#)
                                             (LETT #15# (CDR #15#) . #23#))
                                           . #23#)
                                     (GO G190) G191 (EXIT (NREVERSE #16#))))
                               . #23#)
                         (EXIT
                          (COND
                           ((NULL (NULL |coeflist|))
                            (LETT |plist|
                                  (PROGN
                                   (LETT #13# NIL . #23#)
                                   (SEQ (LETT |clist| NIL . #23#)
                                        (LETT #12# |clv| . #23#)
                                        (LETT |tpol| NIL . #23#)
                                        (LETT #11# |plist| . #23#) G190
                                        (COND
                                         ((OR (ATOM #11#)
                                              (PROGN
                                               (LETT |tpol| (CAR #11#) . #23#)
                                               NIL)
                                              (ATOM #12#)
                                              (PROGN
                                               (LETT |clist| (CAR #12#) . #23#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #13#
                                                (CONS
                                                 (|MLIFT;subscoef| |tpol|
                                                  |clist| $)
                                                 #13#)
                                                . #23#)))
                                        (LETT #11#
                                              (PROG1 (CDR #11#)
                                                (LETT #12# (CDR #12#) . #23#))
                                              . #23#)
                                        (GO G190) G191 (EXIT (NREVERSE #13#))))
                                  . #23#)))))))
                      (LETT |mj|
                            (SPADCALL
                             (CONS #'|MLIFT;lifting1;SupLLLLLLVRU;2!0|
                                   (VECTOR $ |vlist| |li|))
                             |m| (QREFELT $ 26))
                            . #23#)
                      (LETT |polc|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 53))
                                      (SPADCALL |v| (QREFELT $ 20))
                                      (QREFELT $ 43))
                            . #23#)
                      (LETT |pol| (|spadConstant| $ 41) . #23#)
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k| 1 . #23#) G190
                             (COND ((|greater_SI| |k| |degj|) (GO G191)))
                             (SEQ
                              (LETT |pol|
                                    (SPADCALL |pol| |polc| (QREFELT $ 54))
                                    . #23#)
                              (LETT |mc|
                                    (SPADCALL
                                     (PROGN
                                      (LETT #7# NIL . #23#)
                                      (SEQ (LETT |term| NIL . #23#)
                                           (LETT #10# |plist| . #23#) G190
                                           (COND
                                            ((OR (ATOM #10#)
                                                 (PROGN
                                                  (LETT |term| (CAR #10#)
                                                        . #23#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (PROGN
                                              (LETT #9# |term| . #23#)
                                              (COND
                                               (#7#
                                                (LETT #8#
                                                      (SPADCALL #8# #9#
                                                                (QREFELT $ 38))
                                                      . #23#))
                                               ('T
                                                (PROGN
                                                 (LETT #8# #9# . #23#)
                                                 (LETT #7# 'T . #23#)))))))
                                           (LETT #10# (CDR #10#) . #23#)
                                           (GO G190) G191 (EXIT NIL))
                                      (COND (#7# #8#)
                                            ('T (|spadConstant| $ 39))))
                                     |mj| (QREFELT $ 47))
                                    . #23#)
                              (COND
                               ((SPADCALL |mc| (|spadConstant| $ 46)
                                          (QREFELT $ 50))
                                (PROGN (LETT #6# |$NoValue| . #23#) (GO #6#))))
                              (LETT |mc|
                                    (SPADCALL
                                     (CONS #'|MLIFT;lifting1;SupLLLLLLVRU;2!1|
                                           (VECTOR $ |x| |k|))
                                     |mc| (QREFELT $ 26))
                                    . #23#)
                              (LETT |mc|
                                    (SPADCALL
                                     (CONS #'|MLIFT;lifting1;SupLLLLLLVRU;2!2|
                                           (VECTOR $ |v| |x|))
                                     |mc| (QREFELT $ 26))
                                    . #23#)
                              (EXIT
                               (COND
                                ((SPADCALL |mc| (|spadConstant| $ 46)
                                           (QREFELT $ 50))
                                 "next k")
                                ('T
                                 (SEQ
                                  (LETT |flalpha|
                                        (SPADCALL |mc| (CDR |subsvar|)
                                                  (CDR |subsval|) (CDR |ldeg|)
                                                  |conglist| |table| |pmod|
                                                  (QREFELT $ 32))
                                        . #23#)
                                  (COND
                                   ((QEQCAR |flalpha| 1)
                                    (PROGN
                                     (LETT #1# (CONS 1 "failed") . #23#)
                                     (GO #1#)))
                                   ('T
                                    (LETT |lalpha| (QCDR |flalpha|) . #23#)))
                                  (EXIT
                                   (LETT |plist|
                                         (PROGN
                                          (LETT #5# NIL . #23#)
                                          (SEQ (LETT |alpha| NIL . #23#)
                                               (LETT #4# |lalpha| . #23#)
                                               (LETT |term| NIL . #23#)
                                               (LETT #3# |plist| . #23#) G190
                                               (COND
                                                ((OR (ATOM #3#)
                                                     (PROGN
                                                      (LETT |term| (CAR #3#)
                                                            . #23#)
                                                      NIL)
                                                     (ATOM #4#)
                                                     (PROGN
                                                      (LETT |alpha| (CAR #4#)
                                                            . #23#)
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
                                                                   (QREFELT $
                                                                            55))
                                                                  (QREFELT $
                                                                           47))
                                                        #5#)
                                                       . #23#)))
                                               (LETT #3#
                                                     (PROG1 (CDR #3#)
                                                       (LETT #4# (CDR #4#)
                                                             . #23#))
                                                     . #23#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #5#))))
                                         . #23#)))))))
                             (LETT |k| (|inc_SI| |k|) . #23#) (GO G190) G191
                             (EXIT NIL)))
                       #6# (EXIT #6#))
                      (LETT |idegj| (|MLIFT;maxDegree| |m| |x| $) . #23#)
                      (SEQ (LETT |term| NIL . #23#) (LETT #2# |plist| . #23#)
                           G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |term| (CAR #2#) . #23#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |idegj|
                                   (- |idegj| (|MLIFT;maxDegree| |term| |x| $))
                                   . #23#)))
                           (LETT #2# (CDR #2#) . #23#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((< |idegj| 0)
                         (PROGN
                          (LETT #1# (CONS 1 "failed") . #23#)
                          (GO #1#))))))
                 (LETT |j| (|inc_SI| |j|) . #23#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |plist|))))
      #1# (EXIT #1#))))) 

(DEFUN |MLIFT;lifting1;SupLLLLLLVRU;2!2| (|p1| $$)
  (PROG (|x| |v| $)
    (LETT |x| (QREFELT $$ 2) . #1=(|MLIFT;lifting1;SupLLLLLLVRU;2|))
    (LETT |v| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |p1| (LIST |x|) (LIST |v|) (QREFELT $ 52)))))) 

(DEFUN |MLIFT;lifting1;SupLLLLLLVRU;2!1| (|p1| $$)
  (PROG (|k| |x| $)
    (LETT |k| (QREFELT $$ 2) . #1=(|MLIFT;lifting1;SupLLLLLLVRU;2|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|MLIFT;normalDerivM| |p1| |k| |x| $))))) 

(DEFUN |MLIFT;lifting1;SupLLLLLLVRU;2!0| (|p1| $$)
  (PROG (|li| |vlist| $)
    (LETT |li| (QREFELT $$ 2) . #1=(|MLIFT;lifting1;SupLLLLLLVRU;2|))
    (LETT |vlist| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |p1| |li| |vlist| (QREFELT $ 52)))))) 

(DEFUN |MLIFT;maxDegree| (|um| |x| $)
  (PROG (|ans|)
    (RETURN
     (SEQ (LETT |ans| 0 . #1=(|MLIFT;maxDegree|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |um| (|spadConstant| $ 46) (QREFELT $ 60)))
                 (GO G191)))
               (SEQ
                (LETT |ans|
                      (MAX |ans|
                           (SPADCALL (SPADCALL |um| (QREFELT $ 61)) |x|
                                     (QREFELT $ 62)))
                      . #1#)
                (EXIT (LETT |um| (SPADCALL |um| (QREFELT $ 63)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |MLIFT;lifting;SupLLLLLRU;4|
       (|um| |lvar| |plist| |vlist| |tlist| |listdeg| |pmod| $)
  (PROG (#1=#:G275 |ffl| |table| |tab| #2=#:G268 #3=#:G265 #4=#:G264 #5=#:G266
         #6=#:G280 |pol| |nplist| #7=#:G279 |pp| #8=#:G278 |listdet| |ldcoef|
         #9=#:G277 #10=#:G276)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nplist|
              (PROGN
               (LETT #10# NIL . #11=(|MLIFT;lifting;SupLLLLLRU;4|))
               (SEQ (LETT |pp| NIL . #11#) (LETT #9# |plist| . #11#) G190
                    (COND
                     ((OR (ATOM #9#) (PROGN (LETT |pp| (CAR #9#) . #11#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #10#
                            (CONS (SPADCALL (ELT $ 20) |pp| (QREFELT $ 23))
                                  #10#)
                            . #11#)))
                    (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                    (EXIT (NREVERSE #10#))))
              . #11#)
        (EXIT
         (COND
          ((NULL |tlist|)
           (SEQ
            (LETT |table|
                  (SPADCALL (SPADCALL |um| (QREFELT $ 64)) |pmod| |plist|
                            (QREFELT $ 67))
                  . #11#)
            (EXIT
             (COND
              ((QEQCAR |table| 1)
               (|error| "Table construction failed in MLIFT"))
              (#12='T
               (SPADCALL |um| |lvar| |nplist| |vlist| |tlist| NIL |listdeg|
                         (QCDR |table|) |pmod| (QREFELT $ 59)))))))
          (#12#
           (SEQ
            (LETT |ldcoef| (SPADCALL |um| |plist| |tlist| (QREFELT $ 70))
                  . #11#)
            (COND
             ((NULL (LETT |listdet| (QVELT |ldcoef| 0) . #11#))
              (LETT |tab|
                    (SPADCALL (SPADCALL |um| (QREFELT $ 64)) |pmod| |plist|
                              (QREFELT $ 67))
                    . #11#))
             (#12#
              (SEQ
               (COND
                ((EQL (LENGTH |listdet|) (LENGTH |plist|))
                 (PROGN (LETT #1# (CONS 0 |listdet|) . #11#) (GO #1#))))
               (LETT |plist| (QVELT |ldcoef| 2) . #11#)
               (LETT |nplist|
                     (PROGN
                      (LETT #8# NIL . #11#)
                      (SEQ (LETT |pp| NIL . #11#) (LETT #7# |plist| . #11#)
                           G190
                           (COND
                            ((OR (ATOM #7#)
                                 (PROGN (LETT |pp| (CAR #7#) . #11#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #8#
                                   (CONS
                                    (SPADCALL (ELT $ 20) |pp| (QREFELT $ 23))
                                    #8#)
                                   . #11#)))
                           (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                           (EXIT (NREVERSE #8#))))
                     . #11#)
               (LETT |um|
                     (PROG2
                         (LETT #2#
                               (SPADCALL |um|
                                         (PROGN
                                          (LETT #3# NIL . #11#)
                                          (SEQ (LETT |pol| NIL . #11#)
                                               (LETT #6# |listdet| . #11#) G190
                                               (COND
                                                ((OR (ATOM #6#)
                                                     (PROGN
                                                      (LETT |pol| (CAR #6#)
                                                            . #11#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #5# |pol| . #11#)
                                                  (COND
                                                   (#3#
                                                    (LETT #4#
                                                          (SPADCALL #4# #5#
                                                                    (QREFELT $
                                                                             38))
                                                          . #11#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #4# #5# . #11#)
                                                     (LETT #3# 'T . #11#)))))))
                                               (LETT #6# (CDR #6#) . #11#)
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#3# #4#)
                                                (#12# (|spadConstant| $ 39))))
                                         (QREFELT $ 72))
                               . #11#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 9))
                                      #2#))
                     . #11#)
               (LETT |tlist| (QVELT |ldcoef| 3) . #11#)
               (EXIT
                (LETT |tab|
                      (SPADCALL (SPADCALL |um| (QREFELT $ 64)) |pmod|
                                (CDR |plist|) (QREFELT $ 67))
                      . #11#)))))
            (EXIT
             (COND
              ((QEQCAR |tab| 1) (|error| "Table construction failed in MLIFT"))
              (#12#
               (SEQ (LETT |table| (QCDR |tab|) . #11#)
                    (LETT |ffl|
                          (SPADCALL |um| |lvar| |nplist| |vlist| |tlist|
                                    (QVELT |ldcoef| 1) |listdeg| |table| |pmod|
                                    (QREFELT $ 59))
                          . #11#)
                    (COND
                     ((QEQCAR |ffl| 1)
                      (PROGN (LETT #1# (CONS 1 "failed") . #11#) (GO #1#))))
                    (EXIT (CONS 0 (APPEND |listdet| (QCDR |ffl|))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |MLIFT;normalDerivM| (|g| |m| |x| $)
  (SPADCALL (|MLIFT;normalDeriv| (SPADCALL |g| |x| (QREFELT $ 75)) |m| $) |x|
            (QREFELT $ 76))) 

(DEFUN |MLIFT;normalDeriv| (|f| |m| $)
  (PROG (|n| |ris| #1=#:G284 |n1| |k| |#G1|)
    (RETURN
     (SEQ (LETT |#G1| (SPADCALL |f| (QREFELT $ 64)) . #2=(|MLIFT;normalDeriv|))
          (LETT |n1| |#G1| . #2#)
          (EXIT
           (COND ((< |#G1| |m|) (|spadConstant| $ 46))
                 ((EQL |n1| |m|)
                  (SPADCALL (SPADCALL |f| (QREFELT $ 61)) (QREFELT $ 44)))
                 ('T
                  (SEQ (LETT |k| (SPADCALL |n1| |m| (QREFELT $ 78)) . #2#)
                       (LETT |ris| (|spadConstant| $ 46) . #2#)
                       (LETT |n| |n1| . #2#)
                       (SEQ G190 (COND ((NULL (>= |n| |m|)) (GO G191)))
                            (SEQ
                             (SEQ G190
                                  (COND
                                   ((NULL (SPADCALL |n1| |n| (QREFELT $ 79)))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |k|
                                         (QUOTIENT2 (* |k| (- |n1| |m|)) |n1|)
                                         . #2#)
                                   (EXIT (LETT |n1| (- |n1| 1) . #2#)))
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
                                                  (LETT #1# (- |n| |m|) . #2#)
                                                (|check_subtype| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #1#))
                                              (QREFELT $ 81))
                                             (QREFELT $ 45))
                                   . #2#)
                             (LETT |f| (SPADCALL |f| (QREFELT $ 63)) . #2#)
                             (EXIT
                              (LETT |n| (SPADCALL |f| (QREFELT $ 64)) . #2#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |ris|))))))))) 

(DEFUN |MLIFT;subslead| (|m| |pol| $)
  (PROG (|dm|)
    (RETURN
     (SEQ (LETT |dm| (SPADCALL |m| (QREFELT $ 64)) |MLIFT;subslead|)
          (EXIT
           (SPADCALL (SPADCALL |pol| |dm| (QREFELT $ 81))
                     (SPADCALL |m| (QREFELT $ 63)) (QREFELT $ 45))))))) 

(DEFUN |MLIFT;subscoef| (|um| |lterm| $)
  (PROG (|new| |i| #1=#:G293 |k| |dm|)
    (RETURN
     (SEQ (LETT |dm| (SPADCALL |um| (QREFELT $ 64)) . #2=(|MLIFT;subscoef|))
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
          (EXIT |new|))))) 

(DEFUN |MultivariateLifting| (&REST #1=#:G300)
  (PROG ()
    (RETURN
     (PROG (#2=#:G301)
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
              (HREM |$ConstructorCache| '|MultivariateLifting|))))))))))) 

(DEFUN |MultivariateLifting;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
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
      $)))) 

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
