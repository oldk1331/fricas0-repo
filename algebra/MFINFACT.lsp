
(SDEFUN |MFINFACT;convertPUP|
        ((|lfg| |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV))
                 (|:| |pow| (|Integer|))))))
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseUnivariatePolynomial|
                       (|SparseMultivariatePolynomial|
                        (|SparseUnivariatePolynomial| F) OV)))
                 (|:| |pow| (|Integer|)))))))
        (SPROG ((#1=#:G149 NIL) (|lff| NIL) (#2=#:G148 NIL))
               (SEQ
                (CONS (QCAR |lfg|)
                      (PROGN
                       (LETT #2# NIL . #3=(|MFINFACT;convertPUP|))
                       (SEQ (LETT |lff| NIL . #3#)
                            (LETT #1# (QCDR |lfg|) . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |lff| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (CONS
                                      (SPADCALL (QCAR |lff|) (QREFELT $ 13))
                                      (QCDR |lff|))
                                     #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |MFINFACT;supFactor|
        ((|um| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|dx| |Integer|)
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseUnivariatePolynomial|
                       (|SparseMultivariatePolynomial|
                        (|SparseUnivariatePolynomial| F) OV)))
                 (|:| |pow| (|Integer|)))))))
        (SPROG
         ((#1=#:G196 NIL) (|lcfacs| #2=(|SparseUnivariatePolynomial| F))
          (#3=#:G192 NIL) (#4=#:G191 #2#) (#5=#:G193 #2#) (#6=#:G194 NIL)
          (#7=#:G211 NIL) (|f| NIL)
          (|factorlist|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseUnivariatePolynomial|
                   (|SparseMultivariatePolynomial|
                    (|SparseUnivariatePolynomial| F) OV)))
             (|:| |pow| (|Integer|)))))
          (|auxfl|
           (|List|
            #8=(|Record|
                (|:| |irr|
                     #9=(|SparseUnivariatePolynomial|
                         (|SparseMultivariatePolynomial|
                          (|SparseUnivariatePolynomial| F) OV)))
                (|:| |pow| #10=(|Integer|)))))
          (#11=#:G210 NIL) (|lfp| NIL) (#12=#:G209 NIL)
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (|ldeg| (|List| #13=(|NonNegativeInteger|))) (#14=#:G184 NIL)
          (#15=#:G183 #13#) (#16=#:G185 #13#) (#17=#:G208 NIL) (|fc| NIL)
          (#18=#:G207 NIL) (|xx| NIL) (#19=#:G206 NIL)
          (|coefs|
           (|List|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|ffcont|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|ffexp| #10#) (|ffactor| #9#) (#20=#:G205 NIL) (|fact| NIL)
          (|sqqfact| (|List| #8#)) (#21=#:G204 NIL) (|ff| NIL) (#22=#:G203 NIL)
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors| (|List| #8#))))
          (|lcont|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|sqfacs| (|Factored| (|SparseUnivariatePolynomial| PG)))
          (|om| (|SparseUnivariatePolynomial| PG)) (#23=#:G201 NIL)
          (|lfg|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseUnivariatePolynomial|
                                  (|SparseMultivariatePolynomial|
                                   (|SparseUnivariatePolynomial| F) OV)))
                            (|:| |pow| (|Integer|)))))))
          (#24=#:G156 NIL)
          (|f1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|mdeg| (|NonNegativeInteger|)) (|lvar| #25=(|List| OV))
          (#26=#:G152 NIL) (#27=#:G151 #25#) (#28=#:G153 #25#) (#29=#:G202 NIL)
          (|cf| NIL))
         (SEQ
          (EXIT
           (COND
            ((EQL (SPADCALL |um| (QREFELT $ 15)) 0)
             (|MFINFACT;convertPUP|
              (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT $ 16)) |dx| $) $))
            (#30='T
             (SEQ
              (LETT |lvar|
                    (PROGN
                     (LETT #26# NIL . #31=(|MFINFACT;supFactor|))
                     (SEQ (LETT |cf| NIL . #31#)
                          (LETT #29# (SPADCALL |um| (QREFELT $ 18)) . #31#)
                          G190
                          (COND
                           ((OR (ATOM #29#)
                                (PROGN (LETT |cf| (CAR #29#) . #31#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #28# (SPADCALL |cf| (QREFELT $ 20)) . #31#)
                             (COND
                              (#26#
                               (LETT #27# (SPADCALL #27# #28# (QREFELT $ 21))
                                     . #31#))
                              ('T
                               (PROGN
                                (LETT #27# #28# . #31#)
                                (LETT #26# 'T . #31#)))))))
                          (LETT #29# (CDR #29#) . #31#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#26# #27#) (#30# (|IdentityError| '|setUnion|))))
                    . #31#)
              (LETT |flead| (CONS (|spadConstant| $ 25) NIL) . #31#)
              (LETT |factorlist| NIL . #31#)
              (LETT |mdeg| (SPADCALL |um| (QREFELT $ 26)) . #31#)
              (COND
               ((SPADCALL |mdeg| 0 (QREFELT $ 28))
                (SEQ
                 (LETT |f1|
                       (SPADCALL (|spadConstant| $ 31) |mdeg| (QREFELT $ 32))
                       . #31#)
                 (LETT |um|
                       (PROG2
                           (LETT #24# (SPADCALL |um| |f1| (QREFELT $ 34))
                                 . #31#)
                           (QCDR #24#)
                         (|check_union2| (QEQCAR #24# 0)
                                         (|SparseUnivariatePolynomial|
                                          (|SparseMultivariatePolynomial|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 8))
                                           (QREFELT $ 6)))
                                         (|Union|
                                          (|SparseUnivariatePolynomial|
                                           (|SparseMultivariatePolynomial|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 8))
                                            (QREFELT $ 6)))
                                          #32="failed")
                                         #24#))
                       . #31#)
                 (LETT |factorlist|
                       (CONS
                        (CONS (SPADCALL (|spadConstant| $ 31) 1 (QREFELT $ 32))
                              |mdeg|)
                        |factorlist|)
                       . #31#)
                 (EXIT
                  (COND
                   ((EQL (SPADCALL |um| (QREFELT $ 15)) 0)
                    (PROGN
                     (LETT #23#
                           (SEQ
                            (LETT |lfg|
                                  (|MFINFACT;convertPUP|
                                   (|MFINFACT;mFactor|
                                    (SPADCALL |um| (QREFELT $ 16)) |dx| $)
                                   $)
                                  . #31#)
                            (EXIT
                             (CONS (QCAR |lfg|)
                                   (APPEND |factorlist| (QCDR |lfg|)))))
                           . #31#)
                     (GO #33=#:G200))))))))
              (LETT |om|
                    (SPADCALL
                     (CONS #'|MFINFACT;supFactor!0| (VECTOR $ (QREFELT $ 10)))
                     |um| (QREFELT $ 38))
                    . #31#)
              (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 40)) . #31#)
              (LETT |lcont|
                    (SPADCALL
                     (CONS #'|MFINFACT;supFactor!1| (VECTOR $ (QREFELT $ 10)))
                     (SPADCALL |sqfacs| (QREFELT $ 42)) (QREFELT $ 45))
                    . #31#)
              (COND
               ((SPADCALL |lcont| (QREFELT $ 46))
                (LETT |flead|
                      (|MFINFACT;convertPUP|
                       (|MFINFACT;constantCase|
                        (SPADCALL |lcont| (QREFELT $ 16)) NIL $)
                       $)
                      . #31#))
               (#30#
                (LETT |flead| (|MFINFACT;supFactor| |lcont| |dx| $) . #31#)))
              (LETT |factorlist| (QCDR |flead|) . #31#)
              (LETT |sqqfact|
                    (PROGN
                     (LETT #22# NIL . #31#)
                     (SEQ (LETT |ff| NIL . #31#)
                          (LETT #21# (SPADCALL |sqfacs| (QREFELT $ 49)) . #31#)
                          G190
                          (COND
                           ((OR (ATOM #21#)
                                (PROGN (LETT |ff| (CAR #21#) . #31#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #22#
                                  (CONS
                                   (CONS
                                    (SPADCALL
                                     (CONS #'|MFINFACT;supFactor!2|
                                           (VECTOR $ (QREFELT $ 10)))
                                     (QCAR |ff|) (QREFELT $ 45))
                                    (QCDR |ff|))
                                   #22#)
                                  . #31#)))
                          (LETT #21# (CDR #21#) . #31#) (GO G190) G191
                          (EXIT (NREVERSE #22#))))
                    . #31#)
              (SEQ (LETT |fact| NIL . #31#) (LETT #20# |sqqfact| . #31#) G190
                   (COND
                    ((OR (ATOM #20#)
                         (PROGN (LETT |fact| (CAR #20#) . #31#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ffactor| (QCAR |fact|) . #31#)
                        (LETT |ffexp| (QCDR |fact|) . #31#)
                        (LETT |ffcont| (SPADCALL |ffactor| (QREFELT $ 50))
                              . #31#)
                        (LETT |coefs| (SPADCALL |ffactor| (QREFELT $ 18))
                              . #31#)
                        (LETT |ldeg|
                              (PROGN
                               (LETT #19# NIL . #31#)
                               (SEQ (LETT |xx| NIL . #31#)
                                    (LETT #18# |lvar| . #31#) G190
                                    (COND
                                     ((OR (ATOM #18#)
                                          (PROGN
                                           (LETT |xx| (CAR #18#) . #31#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #19#
                                            (CONS
                                             (PROGN
                                              (LETT #14# NIL . #31#)
                                              (SEQ (LETT |fc| NIL . #31#)
                                                   (LETT #17# |coefs| . #31#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #17#)
                                                         (PROGN
                                                          (LETT |fc| (CAR #17#)
                                                                . #31#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #16#
                                                            (SPADCALL |fc| |xx|
                                                                      (QREFELT
                                                                       $ 51))
                                                            . #31#)
                                                      (COND
                                                       (#14#
                                                        (LETT #15#
                                                              (MAX #15# #16#)
                                                              . #31#))
                                                       ('T
                                                        (PROGN
                                                         (LETT #15# #16#
                                                               . #31#)
                                                         (LETT #14# 'T
                                                               . #31#)))))))
                                                   (LETT #17# (CDR #17#)
                                                         . #31#)
                                                   (GO G190) G191 (EXIT NIL))
                                              (COND (#14# #15#)
                                                    ('T
                                                     (|IdentityError|
                                                      '|max|))))
                                             #19#)
                                            . #31#)))
                                    (LETT #18# (CDR #18#) . #31#) (GO G190)
                                    G191 (EXIT (NREVERSE #19#))))
                              . #31#)
                        (COND
                         ((SPADCALL (SPADCALL |ffactor| (QREFELT $ 52))
                                    (QREFELT $ 53))
                          (LETT |lf|
                                (|MFINFACT;mfconst| |ffactor| |dx| |lvar|
                                 |ldeg| $)
                                . #31#))
                         ('T
                          (LETT |lf|
                                (|MFINFACT;mfpol| |ffactor| |dx| |lvar| |ldeg|
                                 $)
                                . #31#)))
                        (LETT |auxfl|
                              (PROGN
                               (LETT #12# NIL . #31#)
                               (SEQ (LETT |lfp| NIL . #31#)
                                    (LETT #11# |lf| . #31#) G190
                                    (COND
                                     ((OR (ATOM #11#)
                                          (PROGN
                                           (LETT |lfp| (CAR #11#) . #31#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #12#
                                            (CONS (CONS |lfp| |ffexp|) #12#)
                                            . #31#)))
                                    (LETT #11# (CDR #11#) . #31#) (GO G190)
                                    G191 (EXIT (NREVERSE #12#))))
                              . #31#)
                        (EXIT
                         (LETT |factorlist| (APPEND |factorlist| |auxfl|)
                               . #31#)))
                   (LETT #20# (CDR #20#) . #31#) (GO G190) G191 (EXIT NIL))
              (LETT |lcfacs|
                    (PROGN
                     (LETT #3# NIL . #31#)
                     (SEQ (LETT |f| NIL . #31#) (LETT #7# |factorlist| . #31#)
                          G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |f| (CAR #7#) . #31#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #5#
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QCAR |f|) (QREFELT $ 52))
                                     (QREFELT $ 54))
                                    (PROG1 (LETT #6# (QCDR |f|) . #31#)
                                      (|check_subtype2| (>= #6# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #6#))
                                    (QREFELT $ 55))
                                   . #31#)
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 56))
                                     . #31#))
                              ('T
                               (PROGN
                                (LETT #4# #5# . #31#)
                                (LETT #3# 'T . #31#)))))))
                          (LETT #7# (CDR #7#) . #31#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#3# #4#) (#30# (|spadConstant| $ 57))))
                    . #31#)
              (EXIT
               (CONS
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |um| (QREFELT $ 52))
                                     (QREFELT $ 54))
                           |lcfacs| (QREFELT $ 58))
                          . #31#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                   #32#)
                                  #1#))
                |factorlist|))))))
          #33# (EXIT #23#)))) 

(SDEFUN |MFINFACT;supFactor!2| ((|p1| NIL) ($$ NIL))
        (PROG (|basicVar| $)
          (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;supFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |basicVar| $))))) 

(SDEFUN |MFINFACT;supFactor!1| ((|p1| NIL) ($$ NIL))
        (PROG (|basicVar| $)
          (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;supFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |basicVar| $))))) 

(SDEFUN |MFINFACT;supFactor!0| ((|p1| NIL) ($$ NIL))
        (PROG (|basicVar| $)
          (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;supFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushup| |p1| |basicVar| $))))) 

(SDEFUN |MFINFACT;factor;SupF;3|
        ((|um| |SparseUnivariatePolynomial| PG)
         ($ |Factored| (|SparseUnivariatePolynomial| PG)))
        (SPROG
         ((#1=#:G218 NIL)
          (#2=#:G217 #3=(|Factored| (|SparseUnivariatePolynomial| PG)))
          (#4=#:G219 #3#) (#5=#:G224 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseUnivariatePolynomial|
                                  (|SparseMultivariatePolynomial|
                                   (|SparseUnivariatePolynomial| F) OV)))
                            (|:| |pow| (|Integer|)))))))
          (|cm|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|dx| #6=(|NonNegativeInteger|)) (#7=#:G213 NIL) (#8=#:G212 #6#)
          (#9=#:G214 #6#) (#10=#:G223 NIL) (#11=#:G104 NIL) (|ld| (|List| #6#))
          (|lv| (|List| OV)))
         (SEQ
          (LETT |lv| (SPADCALL |um| (QREFELT $ 60))
                . #12=(|MFINFACT;factor;SupF;3|))
          (LETT |ld| (SPADCALL |um| |lv| (QREFELT $ 62)) . #12#)
          (LETT |dx|
                (PROGN
                 (LETT #7# NIL . #12#)
                 (SEQ (LETT #11# NIL . #12#) (LETT #10# |ld| . #12#) G190
                      (COND
                       ((OR (ATOM #10#)
                            (PROGN (LETT #11# (CAR #10#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #9# #11# . #12#)
                         (COND (#7# (LETT #8# (MIN #8# #9#) . #12#))
                               ('T
                                (PROGN
                                 (LETT #8# #9# . #12#)
                                 (LETT #7# 'T . #12#)))))))
                      (LETT #10# (CDR #10#) . #12#) (GO G190) G191 (EXIT NIL))
                 (COND (#7# #8#) (#13='T (|IdentityError| '|min|))))
                . #12#)
          (SETELT $ 10
                  (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 64))
                            (QREFELT $ 65)))
          (LETT |cm|
                (SPADCALL
                 (CONS #'|MFINFACT;factor;SupF;3!0| (VECTOR $ (QREFELT $ 10)))
                 |um| (QREFELT $ 45))
                . #12#)
          (LETT |flist| (|MFINFACT;supFactor| |cm| |dx| $) . #12#)
          (EXIT
           (SPADCALL
            (SPADCALL (|MFINFACT;pushupconst| (QCAR |flist|) (QREFELT $ 10) $)
                      (QREFELT $ 66))
            (PROGN
             (LETT #1# NIL . #12#)
             (SEQ (LETT |u| NIL . #12#) (LETT #5# (QCDR |flist|) . #12#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #12#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL
                            (SPADCALL
                             (CONS #'|MFINFACT;factor;SupF;3!1|
                                   (VECTOR $ (QREFELT $ 10)))
                             (QCAR |u|) (QREFELT $ 38))
                            (QCDR |u|) (QREFELT $ 67))
                           . #12#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 68)) . #12#))
                      ('T
                       (PROGN (LETT #2# #4# . #12#) (LETT #1# 'T . #12#)))))))
                  (LETT #5# (CDR #5#) . #12#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#13# (|spadConstant| $ 69))))
            (QREFELT $ 70)))))) 

(SDEFUN |MFINFACT;factor;SupF;3!1| ((|p1| NIL) ($$ NIL))
        (PROG (|basicVar| $)
          (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;factor;SupF;3|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushup| |p1| |basicVar| $))))) 

(SDEFUN |MFINFACT;factor;SupF;3!0| ((|p1| NIL) ($$ NIL))
        (PROG (|basicVar| $)
          (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;factor;SupF;3|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |basicVar| $))))) 

(SDEFUN |MFINFACT;mFactor|
        ((|m| |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV)
         (|dx| |Integer|)
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV))
                 (|:| |pow| (|Integer|)))))))
        (SPROG
         ((|factorlist|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV))
             (|:| |pow| (|Integer|)))))
          (|auxfl|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV))
             (|:| |pow| (|Integer|)))))
          (#1=#:G273 NIL) (|lfp| NIL) (#2=#:G272 NIL)
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (|um|
           #3=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                               OV)))
          (|lcum| (F)) (|ldeg| (|List| (|NonNegativeInteger|))) (#4=#:G271 NIL)
          (|lcterm| NIL)
          (|ffactor|
           #5=(|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                              OV))
          (#6=#:G246 NIL)
          (|pc|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|lvar| (|List| OV)) (|x| (OV))
          (|varch|
           (|Record| (|:| |npol| #3#) (|:| |nvar| (|List| OV))
                     (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
          (#7=#:G270 NIL) (#8=#:G240 NIL)
          (|lcont|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (#9=#:G269 NIL) (|lterm| NIL) (|ffexp| #10=(|Integer|))
          (#11=#:G268 NIL) (|fact| NIL)
          (|sqqfact|
           (|List| (|Record| (|:| |factor| #5#) (|:| |exponent| #10#))))
          (#12=#:G267 NIL) (|ff| NIL) (#13=#:G266 NIL)
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|Integer|)))))))
          (|sqfacs| (|Factored| PG)) (|om| (PG)) (#14=#:G228 NIL)
          (#15=#:G227 #16=(|Boolean|)) (#17=#:G229 #16#) (#18=#:G265 NIL)
          (|n| NIL) (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL |m| (QREFELT $ 53)) (|MFINFACT;constantCase| |m| NIL $))
           (#19='T
            (SEQ
             (LETT |lvar| (SPADCALL |m| (QREFELT $ 20))
                   . #20=(|MFINFACT;mFactor|))
             (LETT |flead| (CONS (|spadConstant| $ 57) NIL) . #20#)
             (LETT |factorlist| NIL . #20#)
             (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 72)) . #20#)
             (EXIT
              (COND
               ((PROGN
                 (LETT #14# NIL . #20#)
                 (SEQ (LETT |n| NIL . #20#) (LETT #18# |lmdeg| . #20#) G190
                      (COND
                       ((OR (ATOM #18#)
                            (PROGN (LETT |n| (CAR #18#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #17# (SPADCALL |n| 0 (QREFELT $ 28)) . #20#)
                         (COND
                          (#14# (LETT #15# (COND (#15# 'T) ('T #17#)) . #20#))
                          ('T
                           (PROGN
                            (LETT #15# #17# . #20#)
                            (LETT #14# 'T . #20#)))))))
                      (LETT #18# (CDR #18#) . #20#) (GO G190) G191 (EXIT NIL))
                 (COND (#14# #15#) (#19# NIL)))
                (|MFINFACT;simplify| |m| |dx| |lvar| |lmdeg| $))
               (#19#
                (SEQ
                 (LETT |om| (|MFINFACT;pushup| |m| (QREFELT $ 10) $) . #20#)
                 (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 73)) . #20#)
                 (LETT |lcont|
                       (|MFINFACT;pushdown| (SPADCALL |sqfacs| (QREFELT $ 75))
                        (QREFELT $ 10) $)
                       . #20#)
                 (COND
                  ((SPADCALL |lcont| (QREFELT $ 53))
                   (LETT |flead| (|MFINFACT;constantCase| |lcont| NIL $)
                         . #20#))
                  (#19#
                   (LETT |flead| (|MFINFACT;mFactor| |lcont| |dx| $) . #20#)))
                 (LETT |factorlist| (QCDR |flead|) . #20#)
                 (LETT |sqqfact|
                       (PROGN
                        (LETT #13# NIL . #20#)
                        (SEQ (LETT |ff| NIL . #20#)
                             (LETT #12# (SPADCALL |sqfacs| (QREFELT $ 78))
                                   . #20#)
                             G190
                             (COND
                              ((OR (ATOM #12#)
                                   (PROGN (LETT |ff| (CAR #12#) . #20#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #13#
                                     (CONS
                                      (CONS
                                       (|MFINFACT;pushdown| (QCAR |ff|)
                                        (QREFELT $ 10) $)
                                       (QCDR |ff|))
                                      #13#)
                                     . #20#)))
                             (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                             (EXIT (NREVERSE #13#))))
                       . #20#)
                 (SEQ (LETT |fact| NIL . #20#) (LETT #11# |sqqfact| . #20#)
                      G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |fact| (CAR #11#) . #20#) NIL))
                        (GO G191)))
                      (SEQ (LETT |ffactor| (QCAR |fact|) . #20#)
                           (LETT |ffexp| (QCDR |fact|) . #20#)
                           (EXIT
                            (COND
                             ((SPADCALL |ffactor| (QREFELT $ 53))
                              (SEQ (LETT |lterm| NIL . #20#)
                                   (LETT #9#
                                         (QCDR
                                          (|MFINFACT;constantCase| |ffactor|
                                           NIL $))
                                         . #20#)
                                   G190
                                   (COND
                                    ((OR (ATOM #9#)
                                         (PROGN
                                          (LETT |lterm| (CAR #9#) . #20#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |factorlist|
                                           (CONS
                                            (CONS (QCAR |lterm|)
                                                  (* (QCDR |lterm|) |ffexp|))
                                            |factorlist|)
                                           . #20#)))
                                   (LETT #9# (CDR #9#) . #20#) (GO G190) G191
                                   (EXIT NIL)))
                             ('T
                              (SEQ
                               (LETT |lvar| (SPADCALL |ffactor| (QREFELT $ 20))
                                     . #20#)
                               (LETT |x| (SPADCALL |lvar| 1 (QREFELT $ 65))
                                     . #20#)
                               (LETT |ldeg|
                                     (SPADCALL |ffactor| |lvar| (QREFELT $ 79))
                                     . #20#)
                               (EXIT
                                (COND
                                 ((SPADCALL 1 |ldeg| (QREFELT $ 81))
                                  (SEQ
                                   (LETT |x|
                                         (SPADCALL |lvar|
                                                   (SPADCALL 1 |ldeg|
                                                             (QREFELT $ 64))
                                                   (QREFELT $ 65))
                                         . #20#)
                                   (LETT |lcont|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |ffactor| |x|
                                                     (QREFELT $ 83))
                                           (QREFELT $ 18))
                                          (QREFELT $ 85))
                                         . #20#)
                                   (LETT |ffactor|
                                         (PROG2
                                             (LETT #8#
                                                   (SPADCALL |ffactor| |lcont|
                                                             (QREFELT $ 86))
                                                   . #20#)
                                             (QCDR #8#)
                                           (|check_union2| (QEQCAR #8# 0)
                                                           (|SparseMultivariatePolynomial|
                                                            (|SparseUnivariatePolynomial|
                                                             (QREFELT $ 8))
                                                            (QREFELT $ 6))
                                                           (|Union|
                                                            (|SparseMultivariatePolynomial|
                                                             (|SparseUnivariatePolynomial|
                                                              (QREFELT $ 8))
                                                             (QREFELT $ 6))
                                                            "failed")
                                                           #8#))
                                         . #20#)
                                   (LETT |factorlist|
                                         (CONS (CONS |ffactor| |ffexp|)
                                               |factorlist|)
                                         . #20#)
                                   (EXIT
                                    (SEQ (LETT |lcterm| NIL . #20#)
                                         (LETT #7#
                                               (QCDR
                                                (|MFINFACT;mFactor| |lcont|
                                                 |dx| $))
                                               . #20#)
                                         G190
                                         (COND
                                          ((OR (ATOM #7#)
                                               (PROGN
                                                (LETT |lcterm| (CAR #7#)
                                                      . #20#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |factorlist|
                                                 (CONS
                                                  (CONS (QCAR |lcterm|)
                                                        (* (QCDR |lcterm|)
                                                           |ffexp|))
                                                  |factorlist|)
                                                 . #20#)))
                                         (LETT #7# (CDR #7#) . #20#) (GO G190)
                                         G191 (EXIT NIL)))))
                                 ('T
                                  (SEQ
                                   (LETT |varch|
                                         (|MFINFACT;varChoose| |ffactor| |lvar|
                                          |ldeg| $)
                                         . #20#)
                                   (LETT |um| (QVELT |varch| 0) . #20#)
                                   (LETT |ldeg| (CDR |ldeg|) . #20#)
                                   (LETT |lvar| (CDR |lvar|) . #20#)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL (QVELT |varch| 1) 1
                                                (QREFELT $ 65))
                                      |x| (QREFELT $ 87))
                                     (SEQ
                                      (LETT |lvar| (QVELT |varch| 1) . #20#)
                                      (LETT |x|
                                            (SPADCALL |lvar| 1 (QREFELT $ 65))
                                            . #20#)
                                      (LETT |lvar| (CDR |lvar|) . #20#)
                                      (LETT |pc|
                                            (SPADCALL
                                             (SPADCALL |um| (QREFELT $ 18))
                                             (QREFELT $ 85))
                                            . #20#)
                                      (COND
                                       ((SPADCALL |pc| (|spadConstant| $ 31)
                                                  (QREFELT $ 88))
                                        (SEQ
                                         (LETT |um|
                                               (PROG2
                                                   (LETT #6#
                                                         (SPADCALL |um| |pc|
                                                                   (QREFELT $
                                                                            89))
                                                         . #20#)
                                                   (QCDR #6#)
                                                 (|check_union2| (QEQCAR #6# 0)
                                                                 (|SparseUnivariatePolynomial|
                                                                  (|SparseMultivariatePolynomial|
                                                                   (|SparseUnivariatePolynomial|
                                                                    (QREFELT $
                                                                             8))
                                                                   (QREFELT $
                                                                            6)))
                                                                 (|Union|
                                                                  (|SparseUnivariatePolynomial|
                                                                   (|SparseMultivariatePolynomial|
                                                                    (|SparseUnivariatePolynomial|
                                                                     (QREFELT $
                                                                              8))
                                                                    (QREFELT $
                                                                             6)))
                                                                  "failed")
                                                                 #6#))
                                               . #20#)
                                         (LETT |ffactor|
                                               (SPADCALL |um| |x|
                                                         (QREFELT $ 90))
                                               . #20#)
                                         (EXIT
                                          (SEQ (LETT |lcterm| NIL . #20#)
                                               (LETT #4#
                                                     (QCDR
                                                      (|MFINFACT;mFactor| |pc|
                                                       |dx| $))
                                                     . #20#)
                                               G190
                                               (COND
                                                ((OR (ATOM #4#)
                                                     (PROGN
                                                      (LETT |lcterm| (CAR #4#)
                                                            . #20#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT |factorlist|
                                                       (CONS
                                                        (CONS (QCAR |lcterm|)
                                                              (*
                                                               (QCDR |lcterm|)
                                                               |ffexp|))
                                                        |factorlist|)
                                                       . #20#)))
                                               (LETT #4# (CDR #4#) . #20#)
                                               (GO G190) G191 (EXIT NIL))))))
                                      (EXIT
                                       (LETT |ldeg|
                                             (SPADCALL |ffactor| |lvar|
                                                       (QREFELT $ 79))
                                             . #20#)))))
                                   (LETT |lcum|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |um| (QREFELT $ 52))
                                           (QREFELT $ 54))
                                          (QREFELT $ 91))
                                         . #20#)
                                   (COND
                                    ((SPADCALL |lcum| (|spadConstant| $ 29)
                                               (QREFELT $ 92))
                                     (SEQ
                                      (LETT |um|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |lcum| (QREFELT $ 93))
                                               (QREFELT $ 94))
                                              (QREFELT $ 95))
                                             |um| (QREFELT $ 96))
                                            . #20#)
                                      (EXIT
                                       (PROGN
                                        (RPLACA |flead|
                                                (SPADCALL
                                                 (SPADCALL |lcum|
                                                           (QREFELT $ 94))
                                                 (QCAR |flead|)
                                                 (QREFELT $ 56)))
                                        (QCAR |flead|))))))
                                   (COND
                                    ((SPADCALL (SPADCALL |um| (QREFELT $ 52))
                                               (QREFELT $ 53))
                                     (LETT |lf|
                                           (|MFINFACT;mfconst| |um| |dx| |lvar|
                                            |ldeg| $)
                                           . #20#))
                                    ('T
                                     (LETT |lf|
                                           (|MFINFACT;mfpol| |um| |dx| |lvar|
                                            |ldeg| $)
                                           . #20#)))
                                   (LETT |auxfl|
                                         (PROGN
                                          (LETT #2# NIL . #20#)
                                          (SEQ (LETT |lfp| NIL . #20#)
                                               (LETT #1# |lf| . #20#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |lfp| (CAR #1#)
                                                            . #20#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL |lfp| |x|
                                                                   (QREFELT $
                                                                            90))
                                                         |ffexp|)
                                                        #2#)
                                                       . #20#)))
                                               (LETT #1# (CDR #1#) . #20#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         . #20#)
                                   (EXIT
                                    (LETT |factorlist|
                                          (APPEND |factorlist| |auxfl|)
                                          . #20#)))))))))))
                      (LETT #11# (CDR #11#) . #20#) (GO G190) G191 (EXIT NIL))
                 (PROGN (RPLACD |flead| |factorlist|) (QCDR |flead|))
                 (EXIT |flead|))))))))))) 

(SDEFUN |MFINFACT;pM|
        ((|lum| |List|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G294 NIL) (|p| (|SparseUnivariatePolynomial| F))
          (#2=#:G284 NIL)
          (|q| (|Union| (|SparseUnivariatePolynomial| F) #3="failed"))
          (#4=#:G282 NIL) (|e| NIL) (#5=#:G293 NIL) (#6=#:G278 NIL)
          (#7=#:G295 NIL) (|i| NIL) (|x| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |x| (SPADCALL (|spadConstant| $ 29) 1 (QREFELT $ 97))
                  . #8=(|MFINFACT;pM|))
            (SEQ (LETT |i| 1 . #8#) (LETT #7# (SPADCALL (QREFELT $ 98)) . #8#)
                 G190 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |p|
                          (SPADCALL |x|
                                    (SPADCALL
                                     (SPADCALL
                                      (PROG1 (LETT #6# |i| . #8#)
                                        (|check_subtype2| (> #6# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #6#))
                                      (QREFELT $ 100))
                                     (QREFELT $ 94))
                                    (QREFELT $ 101))
                          . #8#)
                    (EXIT
                     (COND
                      ((SPADCALL |p| |lum| (QREFELT $ 104))
                       (PROGN
                        (LETT #5# (PROGN (LETT #1# |p| . #8#) (GO #9=#:G292))
                              . #8#)
                        (GO #10=#:G279)))))))
                  #10# (EXIT #5#))
                 (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (SEQ (LETT |e| 2 . #8#) G190 NIL
                  (SEQ
                   (LETT |p|
                         (SPADCALL
                          (PROG1 (LETT #4# |e| . #8#)
                            (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                              '(|NonNegativeInteger|) #4#))
                          (QREFELT $ 106))
                         . #8#)
                   (EXIT
                    (COND
                     ((SPADCALL |p| |lum| (QREFELT $ 104))
                      (PROGN (LETT #1# |p| . #8#) (GO #9#)))
                     ('T
                      (SEQ G190
                           (COND
                            ((NULL
                              (SEQ
                               (LETT |q| (SPADCALL |p| (QREFELT $ 108)) . #8#)
                               (EXIT (NULL (QEQCAR |q| 1)))))
                             (GO G191)))
                           (SEQ
                            (LETT |p|
                                  (PROG2 (LETT #2# |q| . #8#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 8))
                                                    (|Union|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 8))
                                                     #3#)
                                                    #2#))
                                  . #8#)
                            (EXIT
                             (COND
                              ((SPADCALL |p| |lum| (QREFELT $ 104))
                               (PROGN (LETT #1# |p| . #8#) (GO #9#))))))
                           NIL (GO G190) G191 (EXIT NIL))))))
                  (LETT |e| (|inc_SI| |e|) . #8#) (GO G190) G191 (EXIT NIL)))))
          #9# (EXIT #1#)))) 

(SDEFUN |MFINFACT;pushdcoef|
        ((|t| PG)
         ($ |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV))
        (SPADCALL (ELT $ 94) |t| (QREFELT $ 111))) 

(SDEFUN |MFINFACT;intfact|
        ((|um| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|lvar| |List| OV) (|ldeg| |List| (|NonNegativeInteger|))
         (|tleadpol| |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV))
                 (|:| |pow| (|Integer|))))))
         (|ltry| |List| (|List| (|SparseUnivariatePolynomial| F)))
         ($ |List|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))))
        (SPROG
         ((|factfin|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (#1=#:G341 NIL) (|ff| NIL) (#2=#:G340 NIL)
          (|ffin|
           (|Union|
            (|List|
             (|SparseUnivariatePolynomial|
              (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                              OV)))
            "failed"))
          (#3=#:G318 NIL)
          (|unifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#4=#:G339 NIL) (|i| NIL) (#5=#:G338 NIL)
          (|dd| (|SparseUnivariatePolynomial| F))
          (|lpol|
           (|List|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|dist|
           (|Record|
            (|:| |polfac|
                 (|List|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV)))
            (|:| |correct| (|SparseUnivariatePolynomial| F))
            (|:| |corrfact|
                 (|List|
                  (|SparseUnivariatePolynomial|
                   (|SparseUnivariatePolynomial| F))))))
          (#6=#:G335 NIL)
          (|distf|
           (|Union|
            (|Record|
             (|:| |polfac|
                  (|List|
                   (|SparseMultivariatePolynomial|
                    (|SparseUnivariatePolynomial| F) OV)))
             (|:| |correct| (|SparseUnivariatePolynomial| F))
             (|:| |corrfact|
                  (|List|
                   (|SparseUnivariatePolynomial|
                    (|SparseUnivariatePolynomial| F)))))
            "failed"))
          (|leadval| (|List| (|SparseUnivariatePolynomial| F)))
          (|lval| (|List| (|SparseUnivariatePolynomial| F)))
          (|nfact| (|NonNegativeInteger|))
          (|vfchoo|
           (|Record|
            (|:| |inval| (|List| (|List| (|SparseUnivariatePolynomial| F))))
            (|:| |unvfact|
                 (|List|
                  (|SparseUnivariatePolynomial|
                   (|SparseUnivariatePolynomial| F))))
            (|:| |lu| (|SparseUnivariatePolynomial| F))
            (|:| |complead| (|List| (|SparseUnivariatePolynomial| F)))))
          (|leadpol|
           (|List|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (#7=#:G337 NIL) (#8=#:G336 NIL) (|polcase| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |polcase| (NULL (NULL (QCDR |tleadpol|)))
                  . #9=(|MFINFACT;intfact|))
            (LETT |vfchoo|
                  (COND
                   (|polcase|
                    (SEQ
                     (LETT |leadpol|
                           (PROGN
                            (LETT #8# NIL . #9#)
                            (SEQ (LETT |ff| NIL . #9#)
                                 (LETT #7# (QCDR |tleadpol|) . #9#) G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |ff| (CAR #7#) . #9#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #8# (CONS (QCAR |ff|) #8#) . #9#)))
                                 (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                                 (EXIT (NREVERSE #8#))))
                           . #9#)
                     (EXIT
                      (|MFINFACT;intChoose| |um| |lvar| (QCAR |tleadpol|)
                       |leadpol| |ltry| $))))
                   (#10='T
                    (|MFINFACT;intChoose| |um| |lvar| (|spadConstant| $ 57) NIL
                     NIL $)))
                  . #9#)
            (LETT |unifact| (QVELT |vfchoo| 1) . #9#)
            (LETT |nfact| (LENGTH |unifact|) . #9#)
            (EXIT
             (COND ((EQL |nfact| 1) (LIST |um|))
                   (#10#
                    (SEQ (LETT |ltry| (QVELT |vfchoo| 0) . #9#)
                         (LETT |lval| (|SPADfirst| |ltry|) . #9#)
                         (LETT |dd| (QVELT |vfchoo| 2) . #9#)
                         (LETT |lpol| NIL . #9#) (LETT |leadval| NIL . #9#)
                         (COND
                          (|polcase|
                           (SEQ (LETT |leadval| (QVELT |vfchoo| 3) . #9#)
                                (LETT |distf|
                                      (SPADCALL (QVELT |vfchoo| 2) |unifact|
                                                |tleadpol| |leadval| |lvar|
                                                |lval| (QREFELT $ 118))
                                      . #9#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |distf| 1)
                                   (PROGN
                                    (LETT #6#
                                          (|MFINFACT;intfact| |um| |lvar|
                                           |ldeg| |tleadpol| |ltry| $)
                                          . #9#)
                                    (GO #11=#:G334)))
                                  (#10#
                                   (SEQ (LETT |dist| (QCDR |distf|) . #9#)
                                        (LETT |lpol| (QVELT |dist| 0) . #9#)
                                        (LETT |dd| (QVELT |dist| 1) . #9#)
                                        (EXIT
                                         (LETT |unifact| (QVELT |dist| 2)
                                               . #9#)))))))))
                         (COND
                          ((SPADCALL |dd| (|spadConstant| $ 57)
                                     (QREFELT $ 119))
                           (SEQ
                            (LETT |unifact|
                                  (PROGN
                                   (LETT #5# NIL . #9#)
                                   (SEQ (LETT |i| 1 . #9#)
                                        (LETT #4# |nfact| . #9#) G190
                                        (COND
                                         ((|greater_SI| |i| #4#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |dd|
                                                           (SPADCALL |unifact|
                                                                     |i|
                                                                     (QREFELT $
                                                                              121))
                                                           (QREFELT $ 122))
                                                 #5#)
                                                . #9#)))
                                        (LETT |i| (|inc_SI| |i|) . #9#)
                                        (GO G190) G191 (EXIT (NREVERSE #5#))))
                                  . #9#)
                            (EXIT
                             (LETT |um|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |dd|
                                               (PROG1
                                                   (LETT #3# (- |nfact| 1)
                                                         . #9#)
                                                 (|check_subtype2| (>= #3# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #3#))
                                               (QREFELT $ 55))
                                     (QREFELT $ 95))
                                    |um| (QREFELT $ 96))
                                   . #9#)))))
                         (LETT |ffin|
                               (SPADCALL |um| |lvar| |unifact| |lval| |lpol|
                                         |ldeg| (|MFINFACT;pM| |unifact| $)
                                         (QREFELT $ 125))
                               . #9#)
                         (EXIT
                          (COND
                           ((QEQCAR |ffin| 1)
                            (|MFINFACT;intfact| |um| |lvar| |ldeg| |tleadpol|
                             |ltry| $))
                           (#10#
                            (SEQ (LETT |factfin| (QCDR |ffin|) . #9#)
                                 (COND
                                  ((SPADCALL |dd| (|spadConstant| $ 57)
                                             (QREFELT $ 119))
                                   (LETT |factfin|
                                         (PROGN
                                          (LETT #2# NIL . #9#)
                                          (SEQ (LETT |ff| NIL . #9#)
                                               (LETT #1# |factfin| . #9#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |ff| (CAR #1#)
                                                            . #9#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (SPADCALL |ff|
                                                                  (QREFELT $
                                                                           126))
                                                        #2#)
                                                       . #9#)))
                                               (LETT #1# (CDR #1#) . #9#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         . #9#)))
                                 (EXIT |factfin|)))))))))))
          #11# (EXIT #6#)))) 

(SDEFUN |MFINFACT;pushup|
        ((|f| |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV)
         (|x| OV) ($ PG))
        (SPROG
         ((|rr| (PG)) (|lvf| (|List| OV)) (|cf| (PG))
          (|lf|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV)))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 53))
            (|MFINFACT;pushupconst| (SPADCALL |f| (QREFELT $ 127)) |x| $))
           ('T
            (SEQ (LETT |rr| (|spadConstant| $ 128) . #1=(|MFINFACT;pushup|))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |f| (|spadConstant| $ 129) (QREFELT $ 88)))
                        (GO G191)))
                      (SEQ (LETT |lf| (SPADCALL |f| (QREFELT $ 130)) . #1#)
                           (LETT |cf|
                                 (|MFINFACT;pushupconst|
                                  (SPADCALL |f| (QREFELT $ 54)) |x| $)
                                 . #1#)
                           (LETT |lvf| (SPADCALL |lf| (QREFELT $ 20)) . #1#)
                           (LETT |rr|
                                 (SPADCALL |rr|
                                           (SPADCALL |cf| |lvf|
                                                     (SPADCALL |lf| |lvf|
                                                               (QREFELT $ 79))
                                                     (QREFELT $ 131))
                                           (QREFELT $ 132))
                                 . #1#)
                           (EXIT
                            (LETT |f| (SPADCALL |f| (QREFELT $ 133)) . #1#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rr|))))))) 

(SDEFUN |MFINFACT;pushdown|
        ((|g| PG) (|x| OV)
         ($ |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV))
        (SPROG
         ((|ug| (|SparseUnivariatePolynomial| PG))
          (|rf|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|cf| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (COND
           ((SPADCALL |g| (QREFELT $ 134))
            (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 135)) (QREFELT $ 94))
                      (QREFELT $ 95)))
           ('T
            (SEQ (LETT |rf| (|spadConstant| $ 129) . #1=(|MFINFACT;pushdown|))
                 (LETT |ug| (SPADCALL |g| |x| (QREFELT $ 136)) . #1#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |ug| (|spadConstant| $ 137)
                                   (QREFELT $ 138)))
                        (GO G191)))
                      (SEQ
                       (LETT |cf|
                             (SPADCALL (|spadConstant| $ 29)
                                       (SPADCALL |ug| (QREFELT $ 139))
                                       (QREFELT $ 97))
                             . #1#)
                       (LETT |rf|
                             (SPADCALL |rf|
                                       (SPADCALL |cf|
                                                 (|MFINFACT;pushdcoef|
                                                  (SPADCALL |ug|
                                                            (QREFELT $ 140))
                                                  $)
                                                 (QREFELT $ 141))
                                       (QREFELT $ 142))
                             . #1#)
                       (EXIT
                        (LETT |ug| (SPADCALL |ug| (QREFELT $ 143)) . #1#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rf|))))))) 

(SDEFUN |MFINFACT;pushupconst|
        ((|r| |SparseUnivariatePolynomial| F) (|x| OV) ($ PG))
        (SPROG ((|rr| (PG)))
               (SEQ
                (COND
                 ((SPADCALL |r| (QREFELT $ 144))
                  (SPADCALL (SPADCALL |r| (QREFELT $ 145)) (QREFELT $ 146)))
                 ('T
                  (SEQ
                   (LETT |rr| (|spadConstant| $ 128)
                         . #1=(|MFINFACT;pushupconst|))
                   (SEQ G190
                        (COND
                         ((NULL
                           (SPADCALL |r| (|spadConstant| $ 25)
                                     (QREFELT $ 119)))
                          (GO G191)))
                        (SEQ
                         (LETT |rr|
                               (SPADCALL |rr|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |r| (QREFELT $ 91))
                                           (QREFELT $ 146))
                                          |x| (SPADCALL |r| (QREFELT $ 147))
                                          (QREFELT $ 148))
                                         (QREFELT $ 132))
                               . #1#)
                         (EXIT
                          (LETT |r| (SPADCALL |r| (QREFELT $ 149)) . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |rr|))))))) 

(SDEFUN |MFINFACT;ran| ((|k1| |Integer|) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G358 NIL) (#2=#:G357 #3=(|SparseUnivariatePolynomial| F))
          (#4=#:G359 #3#) (#5=#:G361 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|MFINFACT;ran|))
           (SEQ (LETT |i| 0 . #6#) (LETT #5# |k1| . #6#) G190
                (COND ((|greater_SI| |i| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (SPADCALL (QREFELT $ 150)) |i|
                                   (QREFELT $ 97))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 101)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 25))))))) 

(SDEFUN |MFINFACT;varChoose|
        ((|m| |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV)
         (|lvar| |List| OV) (|ldeg| |List| #1=(|NonNegativeInteger|))
         ($ |Record|
          (|:| |npol|
               (|SparseUnivariatePolynomial|
                (|SparseMultivariatePolynomial|
                 (|SparseUnivariatePolynomial| F) OV)))
          (|:| |nvar| (|List| OV))
          (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|x| (OV)) (|i| (|Integer|)) (|k| #1#) (#2=#:G364 NIL)
          (#3=#:G363 #1#) (#4=#:G365 #1#) (#5=#:G369 NIL) (|d| NIL))
         (SEQ
          (LETT |k|
                (PROGN
                 (LETT #2# NIL . #6=(|MFINFACT;varChoose|))
                 (SEQ (LETT |d| NIL . #6#) (LETT #5# |ldeg| . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |d| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# |d| . #6#)
                         (COND (#2# (LETT #3# (MIN #3# #4#) . #6#))
                               ('T
                                (PROGN
                                 (LETT #3# #4# . #6#)
                                 (LETT #2# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) (#7='T (|IdentityError| '|min|))))
                . #6#)
          (EXIT
           (COND
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 51)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 83)) |lvar|
                     |ldeg|))
            (#7#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 64)) . #6#)
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 65)) . #6#)
                  (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 151)))
                        . #6#)
                  (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 152)))
                        . #6#)
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT $ 83)) |lvar|
                           |ldeg|))))))))) 

(SDEFUN |MFINFACT;norm|
        ((|lum| |List|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G371 NIL) (#3=#:G370 #1#) (#4=#:G372 #1#) (#5=#:G374 NIL)
          (|lup| NIL))
         (SEQ
          (PROGN
           (LETT #2# NIL . #6=(|MFINFACT;norm|))
           (SEQ (LETT |lup| NIL . #6#) (LETT #5# |lum| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |lup| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (SPADCALL |lup| (QREFELT $ 153)) . #6#)
                   (COND (#2# (LETT #3# (MAX #3# #4#) . #6#))
                         ('T
                          (PROGN (LETT #3# #4# . #6#) (LETT #2# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#2# #3#) ('T (|IdentityError| '|max|))))))) 

(SDEFUN |MFINFACT;intChoose|
        ((|um| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|lvar| |List| OV) (|clc| |SparseUnivariatePolynomial| F)
         (|plist| |List|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|ltry| |List| (|List| (|SparseUnivariatePolynomial| F)))
         ($ |Record|
          (|:| |inval| (|List| (|List| (|SparseUnivariatePolynomial| F))))
          (|:| |unvfact|
               (|List|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| F))))
          (|:| |lu| (|SparseUnivariatePolynomial| F))
          (|:| |complead| (|List| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|nfatt| (|NonNegativeInteger|))
          (|int| #1=(|List| (|SparseUnivariatePolynomial| F))) (|leadcomp| #1#)
          (|lffc| #2=(|SparseUnivariatePolynomial| F))
          (|unifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#3=#:G457 NIL) (|uf| NIL) (#4=#:G456 NIL)
          (|leadtest| #5=(|Boolean|)) (#6=#:G455 NIL) (#7=#:G454 NIL)
          (#8=#:G439 NIL) (#9=#:G453 NIL) (#10=#:G452 NIL) (#11=#:G451 NIL)
          (#12=#:G450 NIL) (#13=#:G449 NIL) (|ff| NIL) (#14=#:G448 NIL)
          (#15=#:G447 NIL) (#16=#:G446 NIL) (|lffc1| #2#)
          (|nf| (|NonNegativeInteger|))
          (|lunivf|
           (|List|
            (|Record|
             (|:| |factor|
                  (|SparseUnivariatePolynomial|
                   (|SparseUnivariatePolynomial| F)))
             (|:| |exponent| (|Integer|)))))
          (|skip| (|Boolean|)) (|base_success| (|Integer|))
          (|luniv|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|base_failure| (|Integer|))
          (|nfl|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |xpnt| (|Integer|)))))
          (|dx| #17=(|NonNegativeInteger|)) (#18=#:G400 NIL) (#19=#:G399 #17#)
          (#20=#:G401 #17#) (#21=#:G445 NIL) (|uc| NIL)
          (|newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|lcnm| (F)) (|range| (|NonNegativeInteger|))
          (|D2newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|Dnewm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#22=#:G385 NIL) (#23=#:G379 NIL) (#24=#:G378 #25=(|Boolean|))
          (#26=#:G380 #25#) (#27=#:G444 NIL) (|epl| NIL) (|leadcomp1| #1#)
          (#28=#:G443 NIL) (|pol| NIL) (#29=#:G442 NIL)
          (|lval| (|List| (|SparseUnivariatePolynomial| F))) (#30=#:G441 NIL)
          (|i| NIL) (#31=#:G440 NIL)
          (|newunifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|testp| #5#) (|ctf1| #2#) (|nvar1| (|NonNegativeInteger|))
          (|degum| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degum| (SPADCALL |um| (QREFELT $ 15))
                . #32=(|MFINFACT;intChoose|))
          (LETT |nvar1| (LENGTH |lvar|) . #32#) (LETT |range| 0 . #32#)
          (LETT |ctf1| (|spadConstant| $ 57) . #32#)
          (LETT |testp| (NULL (SPADCALL |plist| NIL (QREFELT $ 154))) . #32#)
          (LETT |leadcomp| (LETT |leadcomp1| NIL . #32#) . #32#)
          (LETT |nfatt| (+ |degum| 1) . #32#)
          (LETT |lffc| (|spadConstant| $ 57) . #32#)
          (LETT |lffc1| |lffc| . #32#) (LETT |newunifact| NIL . #32#)
          (LETT |leadtest| 'T . #32#) (LETT |int| NIL . #32#)
          (LETT |base_success| 0 . #32#) (LETT |base_failure| 0 . #32#)
          (SEQ
           (EXIT
            (SEQ G190 (COND ((NULL 'T) (GO G191)))
                 (SEQ
                  (LETT |lval|
                        (PROGN
                         (LETT #31# NIL . #32#)
                         (SEQ (LETT |i| 1 . #32#) (LETT #30# |nvar1| . #32#)
                              G190 (COND ((|greater_SI| |i| #30#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #31#
                                      (CONS (|MFINFACT;ran| |range| $) #31#)
                                      . #32#)))
                              (LETT |i| (|inc_SI| |i|) . #32#) (GO G190) G191
                              (EXIT (NREVERSE #31#))))
                        . #32#)
                  (EXIT
                   (COND
                    ((SPADCALL |lval| |ltry| (QREFELT $ 156))
                     (LETT |range| (+ 1 |range|) . #32#))
                    ('T
                     (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #32#)
                          (LETT |leadcomp1|
                                (PROGN
                                 (LETT #29# NIL . #32#)
                                 (SEQ (LETT |pol| NIL . #32#)
                                      (LETT #28# |plist| . #32#) G190
                                      (COND
                                       ((OR (ATOM #28#)
                                            (PROGN
                                             (LETT |pol| (CAR #28#) . #32#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #29#
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL |pol| |lvar| |lval|
                                                          (QREFELT $ 157))
                                                (QREFELT $ 127))
                                               #29#)
                                              . #32#)))
                                      (LETT #28# (CDR #28#) . #32#) (GO G190)
                                      G191 (EXIT (NREVERSE #29#))))
                                . #32#)
                          (COND
                           (|testp|
                            (COND
                             ((PROGN
                               (LETT #23# NIL . #32#)
                               (SEQ (LETT |epl| NIL . #32#)
                                    (LETT #27# |leadcomp1| . #32#) G190
                                    (COND
                                     ((OR (ATOM #27#)
                                          (PROGN
                                           (LETT |epl| (CAR #27#) . #32#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #26#
                                             (SPADCALL |epl| (QREFELT $ 158))
                                             . #32#)
                                       (COND
                                        (#23#
                                         (LETT #24# (COND (#24# 'T) ('T #26#))
                                               . #32#))
                                        ('T
                                         (PROGN
                                          (LETT #24# #26# . #32#)
                                          (LETT #23# 'T . #32#)))))))
                                    (LETT #27# (CDR #27#) . #32#) (GO G190)
                                    G191 (EXIT NIL))
                               (COND (#23# #24#) ('T NIL)))
                              (EXIT (LETT |range| (+ |range| 1) . #32#))))))
                          (LETT |newm|
                                (SPADCALL |um| |lvar| |lval| (QREFELT $ 160))
                                . #32#)
                          (COND
                           ((OR
                             (SPADCALL |degum|
                                       (SPADCALL |newm| (QREFELT $ 153))
                                       (QREFELT $ 161))
                             (SPADCALL (SPADCALL |newm| (QREFELT $ 162)) 0
                                       (QREFELT $ 161)))
                            (EXIT (LETT |range| (+ |range| 1) . #32#))))
                          (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 163))
                                . #32#)
                          (LETT |newm|
                                (PROG2
                                    (LETT #22#
                                          (SPADCALL |newm| |lffc1|
                                                    (QREFELT $ 164))
                                          . #32#)
                                    (QCDR #22#)
                                  (|check_union2| (QEQCAR #22# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 8)))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 8)))
                                                   "failed")
                                                  #22#))
                                . #32#)
                          (COND
                           (|testp|
                            (COND
                             (|leadtest|
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (SPADCALL |lffc1| |clc| (QREFELT $ 56))
                                  (LENGTH |plist|) |leadcomp1|
                                  (QREFELT $ 165)))
                                (EXIT
                                 (LETT |range| (+ |range| 1) . #32#))))))))
                          (LETT |Dnewm| (SPADCALL |newm| (QREFELT $ 166))
                                . #32#)
                          (LETT |D2newm|
                                (SPADCALL (ELT $ 168) |newm| (QREFELT $ 171))
                                . #32#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (SPADCALL
                               (SPADCALL (LIST |newm| |Dnewm| |D2newm|)
                                         (QREFELT $ 172))
                               (QREFELT $ 153))
                              0 (QREFELT $ 161))
                             (LETT |range| (+ |range| 1) . #32#))
                            ('T
                             (SEQ (LETT |lcnm| (|spadConstant| $ 29) . #32#)
                                  (COND
                                   ((SPADCALL
                                     (LETT |lcnm|
                                           (SPADCALL
                                            (SPADCALL |newm| (QREFELT $ 173))
                                            (QREFELT $ 91))
                                           . #32#)
                                     (|spadConstant| $ 29) (QREFELT $ 92))
                                    (LETT |newm|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |lcnm| (QREFELT $ 93))
                                            (QREFELT $ 94))
                                           |newm| (QREFELT $ 122))
                                          . #32#)))
                                  (LETT |dx|
                                        (PROGN
                                         (LETT #18# NIL . #32#)
                                         (SEQ (LETT |uc| NIL . #32#)
                                              (LETT #21#
                                                    (SPADCALL |newm|
                                                              (QREFELT $ 174))
                                                    . #32#)
                                              G190
                                              (COND
                                               ((OR (ATOM #21#)
                                                    (PROGN
                                                     (LETT |uc| (CAR #21#)
                                                           . #32#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (PROGN
                                                 (LETT #20#
                                                       (SPADCALL |uc|
                                                                 (QREFELT $
                                                                          147))
                                                       . #32#)
                                                 (COND
                                                  (#18#
                                                   (LETT #19# (MAX #19# #20#)
                                                         . #32#))
                                                  ('T
                                                   (PROGN
                                                    (LETT #19# #20# . #32#)
                                                    (LETT #18# 'T . #32#)))))))
                                              (LETT #21# (CDR #21#) . #32#)
                                              (GO G190) G191 (EXIT NIL))
                                         (COND (#18# #19#)
                                               ('T (|IdentityError| '|max|))))
                                        . #32#)
                                  (LETT |luniv|
                                        (SPADCALL |newm| (QREFELT $ 177))
                                        . #32#)
                                  (LETT |nfl|
                                        (SPADCALL |luniv| (QREFELT $ 181))
                                        . #32#)
                                  (LETT |nf| (LENGTH |nfl|) . #32#)
                                  (COND
                                   ((OR (EQL |nf| 0)
                                        (SPADCALL |nf| |nfatt| (QREFELT $ 28)))
                                    (EXIT "next values")))
                                  (COND
                                   ((EQL |nf| 1)
                                    (COND
                                     ((QEQCAR
                                       (QVELT
                                        (SPADCALL |nfl| 1 (QREFELT $ 182)) 0)
                                       0)
                                      (SEQ
                                       (LETT |base_failure|
                                             (+ |base_failure| 1) . #32#)
                                       (LETT |skip|
                                             (< |base_failure|
                                                (+
                                                 (SPADCALL 3 |base_success|
                                                           (QREFELT $ 183))
                                                 3))
                                             . #32#)
                                       (EXIT
                                        (LETT |luniv|
                                              (COND (|skip| |luniv|)
                                                    ('T
                                                     (SPADCALL |newm|
                                                               (QREFELT $
                                                                        184))))
                                              . #32#))))
                                     ('T
                                      (SEQ
                                       (LETT |base_success|
                                             (+ |base_success| 1) . #32#)
                                       (EXIT (LETT |skip| NIL . #32#))))))
                                   ('T
                                    (SEQ
                                     (LETT |base_success| (+ |base_success| 1)
                                           . #32#)
                                     (EXIT (LETT |skip| NIL . #32#)))))
                                  (EXIT
                                   (COND (|skip| "iterate")
                                         ('T
                                          (SEQ
                                           (LETT |lunivf|
                                                 (SPADCALL |luniv|
                                                           (QREFELT $ 187))
                                                 . #32#)
                                           (LETT |nf| (LENGTH |lunivf|) . #32#)
                                           (COND
                                            ((OR (EQL |nf| 0)
                                                 (SPADCALL |nf| |nfatt|
                                                           (QREFELT $ 28)))
                                             (EXIT "next values")))
                                           (COND
                                            ((EQL |nf| 1)
                                             (SEQ
                                              (LETT |unifact| (LIST |newm|)
                                                    . #32#)
                                              (EXIT
                                               (PROGN
                                                (LETT #8# |$NoValue| . #32#)
                                                (GO #33=#:G436))))))
                                           (LETT |lffc1|
                                                 (SPADCALL
                                                  (SPADCALL |lcnm|
                                                            (SPADCALL
                                                             (SPADCALL |luniv|
                                                                       (QREFELT
                                                                        $ 188))
                                                             (QREFELT $ 189))
                                                            (QREFELT $ 190))
                                                  |lffc1| (QREFELT $ 56))
                                                 . #32#)
                                           (EXIT
                                            (COND
                                             ((EQL |nfatt| |nf|)
                                              (SEQ
                                               (COND
                                                (|leadtest|
                                                 (SEQ
                                                  (LETT |unifact|
                                                        (PROGN
                                                         (LETT #16# NIL . #32#)
                                                         (SEQ
                                                          (LETT |uf| NIL
                                                                . #32#)
                                                          (LETT #15# |lunivf|
                                                                . #32#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #15#)
                                                                (PROGN
                                                                 (LETT |uf|
                                                                       (CAR
                                                                        #15#)
                                                                       . #32#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #16#
                                                                  (CONS
                                                                   (QCAR |uf|)
                                                                   #16#)
                                                                  . #32#)))
                                                          (LETT #15# (CDR #15#)
                                                                . #32#)
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #16#))))
                                                        . #32#)
                                                  (LETT |int| |lval| . #32#)
                                                  (LETT |lffc| |lffc1| . #32#)
                                                  (EXIT
                                                   (COND
                                                    (|testp|
                                                     (LETT |leadcomp|
                                                           |leadcomp1|
                                                           . #32#))))))
                                                ((SPADCALL
                                                  (|MFINFACT;norm| |unifact| $)
                                                  (|MFINFACT;norm|
                                                   (PROGN
                                                    (LETT #14# NIL . #32#)
                                                    (SEQ (LETT |ff| NIL . #32#)
                                                         (LETT #13# |lunivf|
                                                               . #32#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #13#)
                                                               (PROGN
                                                                (LETT |ff|
                                                                      (CAR
                                                                       #13#)
                                                                      . #32#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #14#
                                                                 (CONS
                                                                  (QCAR |ff|)
                                                                  #14#)
                                                                 . #32#)))
                                                         (LETT #13# (CDR #13#)
                                                               . #32#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #14#))))
                                                   $)
                                                  (QREFELT $ 191))
                                                 (COND
                                                  (|testp|
                                                   (COND
                                                    ((SPADCALL
                                                      (SPADCALL |lffc1| |clc|
                                                                (QREFELT $ 56))
                                                      (LENGTH |plist|)
                                                      |leadcomp1|
                                                      (QREFELT $ 165))
                                                     (SEQ
                                                      (LETT |unifact|
                                                            (PROGN
                                                             (LETT #12# NIL
                                                                   . #32#)
                                                             (SEQ
                                                              (LETT |uf| NIL
                                                                    . #32#)
                                                              (LETT #11#
                                                                    |lunivf|
                                                                    . #32#)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #11#)
                                                                    (PROGN
                                                                     (LETT |uf|
                                                                           (CAR
                                                                            #11#)
                                                                           . #32#)
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT #12#
                                                                      (CONS
                                                                       (QCAR
                                                                        |uf|)
                                                                       #12#)
                                                                      . #32#)))
                                                              (LETT #11#
                                                                    (CDR #11#)
                                                                    . #32#)
                                                              (GO G190) G191
                                                              (EXIT
                                                               (NREVERSE
                                                                #12#))))
                                                            . #32#)
                                                      (LETT |int| |lval|
                                                            . #32#)
                                                      (LETT |lffc| |lffc1|
                                                            . #32#)
                                                      (EXIT
                                                       (COND
                                                        (|testp|
                                                         (LETT |leadcomp|
                                                               |leadcomp1|
                                                               . #32#))))))))
                                                  ('T
                                                   (SEQ
                                                    (LETT |unifact|
                                                          (PROGN
                                                           (LETT #10# NIL
                                                                 . #32#)
                                                           (SEQ
                                                            (LETT |uf| NIL
                                                                  . #32#)
                                                            (LETT #9# |lunivf|
                                                                  . #32#)
                                                            G190
                                                            (COND
                                                             ((OR (ATOM #9#)
                                                                  (PROGN
                                                                   (LETT |uf|
                                                                         (CAR
                                                                          #9#)
                                                                         . #32#)
                                                                   NIL))
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (LETT #10#
                                                                    (CONS
                                                                     (QCAR
                                                                      |uf|)
                                                                     #10#)
                                                                    . #32#)))
                                                            (LETT #9# (CDR #9#)
                                                                  . #32#)
                                                            (GO G190) G191
                                                            (EXIT
                                                             (NREVERSE #10#))))
                                                          . #32#)
                                                    (LETT |int| |lval| . #32#)
                                                    (LETT |lffc| |lffc1|
                                                          . #32#)
                                                    (EXIT
                                                     (COND
                                                      (|testp|
                                                       (LETT |leadcomp|
                                                             |leadcomp1|
                                                             . #32#)))))))))
                                               (EXIT
                                                (PROGN
                                                 (LETT #8# |$NoValue| . #32#)
                                                 (GO #33#)))))
                                             ((SPADCALL |nfatt| |degum|
                                                        (QREFELT $ 28))
                                              (SEQ
                                               (LETT |unifact|
                                                     (PROGN
                                                      (LETT #7# NIL . #32#)
                                                      (SEQ
                                                       (LETT |uf| NIL . #32#)
                                                       (LETT #6# |lunivf|
                                                             . #32#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #6#)
                                                             (PROGN
                                                              (LETT |uf|
                                                                    (CAR #6#)
                                                                    . #32#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #7#
                                                               (CONS
                                                                (QCAR |uf|)
                                                                #7#)
                                                               . #32#)))
                                                       (LETT #6# (CDR #6#)
                                                             . #32#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #7#))))
                                                     . #32#)
                                               (LETT |lffc| |lffc1| . #32#)
                                               (COND
                                                (|testp|
                                                 (LETT |leadcomp| |leadcomp1|
                                                       . #32#)))
                                               (LETT |int| |lval| . #32#)
                                               (LETT |leadtest| NIL . #32#)
                                               (EXIT
                                                (LETT |nfatt| |nf| . #32#))))
                                             ((SPADCALL |nfatt| |nf|
                                                        (QREFELT $ 28))
                                              (SEQ
                                               (COND
                                                (|testp|
                                                 (LETT |leadtest|
                                                       (NULL
                                                        (SPADCALL
                                                         (SPADCALL |lffc| |clc|
                                                                   (QREFELT $
                                                                            56))
                                                         (LENGTH |plist|)
                                                         |leadcomp|
                                                         (QREFELT $ 165)))
                                                       . #32#))
                                                ('T
                                                 (LETT |leadtest| NIL . #32#)))
                                               (COND
                                                ((NULL |leadtest|)
                                                 (SEQ
                                                  (LETT |unifact|
                                                        (PROGN
                                                         (LETT #4# NIL . #32#)
                                                         (SEQ
                                                          (LETT |uf| NIL
                                                                . #32#)
                                                          (LETT #3# |lunivf|
                                                                . #32#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #3#)
                                                                (PROGN
                                                                 (LETT |uf|
                                                                       (CAR
                                                                        #3#)
                                                                       . #32#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #4#
                                                                  (CONS
                                                                   (QCAR |uf|)
                                                                   #4#)
                                                                  . #32#)))
                                                          (LETT #3# (CDR #3#)
                                                                . #32#)
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #4#))))
                                                        . #32#)
                                                  (LETT |lffc| |lffc1| . #32#)
                                                  (COND
                                                   (|testp|
                                                    (LETT |leadcomp|
                                                          |leadcomp1| . #32#)))
                                                  (EXIT
                                                   (LETT |int| |lval|
                                                         . #32#)))))
                                               (EXIT
                                                (LETT |nfatt| |nf|
                                                      . #32#)))))))))))))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #33# (EXIT #8#))
          (EXIT (VECTOR (CONS |int| |ltry|) |unifact| |lffc| |leadcomp|))))) 

(SDEFUN |MFINFACT;constantCase|
        ((|m| |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV)
         (|factorlist| |List|
          (|Record|
           (|:| |irr|
                (|SparseMultivariatePolynomial|
                 (|SparseUnivariatePolynomial| F) OV))
           (|:| |pow| (|Integer|))))
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV))
                 (|:| |pow| (|Integer|)))))))
        (SPROG
         ((#1=#:G465 NIL) (|pp| NIL) (#2=#:G464 NIL)
          (|lunm|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| F))
                            (|:| |pow| (|Integer|))))))))
         (SEQ
          (LETT |lunm|
                (SPADCALL (SPADCALL |m| (QREFELT $ 127)) NIL (QREFELT $ 195))
                . #3=(|MFINFACT;constantCase|))
          (EXIT
           (CONS (SPADCALL (QCAR |lunm|) (QREFELT $ 94))
                 (APPEND |factorlist|
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |pp| NIL . #3#)
                               (LETT #1# (QCDR |lunm|) . #3#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |pp| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (CONS
                                         (SPADCALL (QCAR |pp|) (QREFELT $ 95))
                                         (QCDR |pp|))
                                        #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |MFINFACT;simplify|
        ((|m| |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV)
         (|dm| |Integer|) (|lvar| |List| OV)
         (|lmdeg| |List| (|NonNegativeInteger|))
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV))
                 (|:| |pow| (|Integer|)))))))
        (SPROG
         ((|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|Integer|)))))))
          (#1=#:G471 NIL)
          (|factorlist|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV))
             (|:| |pow| (|Integer|)))))
          (|pol1|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|i| (|NonNegativeInteger|)) (#2=#:G476 NIL) (|x| NIL))
         (SEQ (LETT |factorlist| NIL . #3=(|MFINFACT;simplify|))
              (LETT |pol1| (|spadConstant| $ 31) . #3#)
              (SEQ (LETT |x| NIL . #3#) (LETT #2# |lvar| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT $ 196))
                                    (QREFELT $ 197))
                          . #3#)
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| $ 31)
                                                       |x| |i| (QREFELT $ 198))
                                             (QREFELT $ 199))
                                   . #3#)
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT $ 200)) |i|)
                                     |factorlist|)
                                    . #3#)))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2
                        (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 86)) . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0)
                                      (|SparseMultivariatePolynomial|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT $ 8))
                                       (QREFELT $ 6))
                                      (|Union|
                                       (|SparseMultivariatePolynomial|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 8))
                                        (QREFELT $ 6))
                                       "failed")
                                      #1#))
                    . #3#)
              (EXIT
               (COND
                ((SPADCALL |m| (QREFELT $ 53))
                 (|MFINFACT;constantCase| |m| |factorlist| $))
                ('T
                 (SEQ (LETT |flead| (|MFINFACT;mFactor| |m| |dm| $) . #3#)
                      (PROGN
                       (RPLACD |flead| (APPEND |factorlist| (QCDR |flead|)))
                       (QCDR |flead|))
                      (EXIT |flead|)))))))) 

(SDEFUN |MFINFACT;mfconst|
        ((|um| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|dm| |Integer|) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         ($ |List|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))))
        (SPROG
         ((#1=#:G486 NIL) (|lumf| NIL) (#2=#:G485 NIL)
          (|lum|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|um1|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|factfin|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV)))))
         (SEQ (LETT |factfin| NIL . #3=(|MFINFACT;mfconst|))
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ
                  (LETT |um1| (SPADCALL (ELT $ 201) |um| (QREFELT $ 204))
                        . #3#)
                  (LETT |lum| (SPADCALL |um1| (QREFELT $ 184)) . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |lumf| NIL . #3#)
                         (LETT #1# (SPADCALL |lum| (QREFELT $ 187)) . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |lumf| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL (ELT $ 95) (QCAR |lumf|)
                                            (QREFELT $ 207))
                                  #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))
                ('T
                 (|MFINFACT;intfact| |um| |lvar| |ldeg|
                  (CONS (|spadConstant| $ 25) NIL) NIL $))))))) 

(SDEFUN |MFINFACT;mfpol|
        ((|um| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|dm| |Integer|) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         ($ |List|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))))
        (SPROG
         ((|tleadpol|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|Integer|))))))))
         (SEQ
          (LETT |tleadpol|
                (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT $ 52)) |dm| $)
                |MFINFACT;mfpol|)
          (EXIT (|MFINFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL $))))) 

(SDEFUN |MFINFACT;factor;PGF;19| ((|m| PG) ($ |Factored| PG))
        (SPROG
         ((#1=#:G497 NIL) (#2=#:G496 #3=(|Factored| PG)) (#4=#:G498 #3#)
          (#5=#:G505 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|Integer|)))))))
          (|cm|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|dx| #6=(|NonNegativeInteger|)) (#7=#:G493 NIL) (#8=#:G492 #6#)
          (#9=#:G494 #6#) (#10=#:G504 NIL) (#11=#:G105 NIL) (|ld| (|List| #6#))
          (#12=#:G503 NIL) (|x| NIL) (#13=#:G502 NIL) (|lv| (|List| OV)))
         (SEQ
          (LETT |lv| (SPADCALL |m| (QREFELT $ 208))
                . #14=(|MFINFACT;factor;PGF;19|))
          (EXIT
           (COND
            ((SPADCALL |lv| NIL (QREFELT $ 209))
             (SPADCALL |m| NIL (QREFELT $ 212)))
            (#15='T
             (SEQ
              (LETT |ld|
                    (PROGN
                     (LETT #13# NIL . #14#)
                     (SEQ (LETT |x| NIL . #14#) (LETT #12# |lv| . #14#) G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |x| (CAR #12#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS (SPADCALL |m| |x| (QREFELT $ 213))
                                        #13#)
                                  . #14#)))
                          (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #14#)
              (LETT |dx|
                    (PROGN
                     (LETT #7# NIL . #14#)
                     (SEQ (LETT #11# NIL . #14#) (LETT #10# |ld| . #14#) G190
                          (COND
                           ((OR (ATOM #10#)
                                (PROGN (LETT #11# (CAR #10#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #9# #11# . #14#)
                             (COND (#7# (LETT #8# (MIN #8# #9#) . #14#))
                                   ('T
                                    (PROGN
                                     (LETT #8# #9# . #14#)
                                     (LETT #7# 'T . #14#)))))))
                          (LETT #10# (CDR #10#) . #14#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#7# #8#) (#15# (|IdentityError| '|min|))))
                    . #14#)
              (SETELT $ 10
                      (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 64))
                                (QREFELT $ 65)))
              (LETT |cm| (|MFINFACT;pushdown| |m| (QREFELT $ 10) $) . #14#)
              (LETT |flist| (|MFINFACT;mFactor| |cm| |dx| $) . #14#)
              (EXIT
               (SPADCALL
                (|MFINFACT;pushupconst| (QCAR |flist|) (QREFELT $ 10) $)
                (PROGN
                 (LETT #1# NIL . #14#)
                 (SEQ (LETT |u| NIL . #14#) (LETT #5# (QCDR |flist|) . #14#)
                      G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #14#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL
                                (|MFINFACT;pushup| (QCAR |u|) (QREFELT $ 10) $)
                                (QCDR |u|) (QREFELT $ 214))
                               . #14#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #4# (QREFELT $ 215))
                                 . #14#))
                          ('T
                           (PROGN
                            (LETT #2# #4# . #14#)
                            (LETT #1# 'T . #14#)))))))
                      (LETT #5# (CDR #5#) . #14#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) (#15# (|spadConstant| $ 216))))
                (QREFELT $ 217)))))))))) 

(DECLAIM (NOTINLINE |MultFiniteFactorize;|)) 

(DEFUN |MultFiniteFactorize| (&REST #1=#:G506)
  (SPROG NIL
         (PROG (#2=#:G507)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultFiniteFactorize|)
                                               '|domainEqualList|)
                    . #3=(|MultFiniteFactorize|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultFiniteFactorize;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultFiniteFactorize|)))))))))) 

(DEFUN |MultFiniteFactorize;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MultFiniteFactorize|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|MultFiniteFactorize| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 219) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|MultFiniteFactorize|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 NIL)
    $))) 

(MAKEPROP '|MultFiniteFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|basicVar|
              (|SparseMultivariatePolynomial| 24 6)
              (|SparseUnivariatePolynomial| 11) (0 . |coerce|)
              (|NonNegativeInteger|) (5 . |degree|) (10 . |ground|) (|List| 11)
              (15 . |coefficients|) (|List| 6) (20 . |variables|)
              (25 . |setUnion|) (31 . |Zero|) (35 . |Zero|)
              (|SparseUnivariatePolynomial| 8) (39 . |Zero|)
              (43 . |minimumDegree|) (|Boolean|) (48 . >) (54 . |One|)
              (58 . |One|) (62 . |One|) (66 . |monomial|) (|Union| $ '"failed")
              (72 . |exquo|) (|SparseUnivariatePolynomial| 9) (|Mapping| 9 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 12 9 35)
              (78 . |map|) (|Factored| $) (84 . |squareFree|) (|Factored| 35)
              (89 . |unit|) (|Mapping| 11 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 35 11 12)
              (94 . |map|) (100 . |ground?|)
              (|Record| (|:| |factor| 35) (|:| |exponent| 63)) (|List| 47)
              (105 . |factors|) (110 . |content|) (115 . |degree|)
              (121 . |leadingCoefficient|) (126 . |ground?|)
              (131 . |leadingCoefficient|) (136 . ^) (142 . *) (148 . |One|)
              (152 . |exquo|) (|FactoringUtilities| 7 6 8 9)
              (158 . |variables|) (|List| 14) (163 . |degree|) (|Integer|)
              (169 . |position|) (175 . |elt|) (181 . |coerce|)
              (186 . |primeFactor|) (192 . *) (198 . |One|) (202 . *)
              |MFINFACT;factor;SupF;3| (208 . |minimumDegree|)
              (214 . |squareFree|) (|Factored| 9) (219 . |unit|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 63)) (|List| 76)
              (224 . |factors|) (229 . |degree|) (235 . |One|)
              (239 . |member?|) (|SparseUnivariatePolynomial| $)
              (245 . |univariate|) (|List| $) (251 . |gcd|) (256 . |exquo|)
              (262 . ~=) (268 . ~=) (274 . |exquo|) (280 . |multivariate|)
              (286 . |leadingCoefficient|) (291 . ~=) (297 . |inv|)
              (302 . |coerce|) (307 . |coerce|) (312 . *) (318 . |monomial|)
              (324 . |size|) (|PositiveInteger|) (328 . |index|) (333 . +)
              (|List| 120) (|GenExEuclid| 24 120) (339 . |testModulus|)
              (|FiniteFieldPolynomialPackage| 8)
              (345 . |createIrreduciblePoly|) (|Union| 24 '"failed")
              (350 . |nextIrreduciblePoly|) (|Mapping| 24 8)
              (|MPolyCatFunctions2| 6 7 (|IndexedExponents| 6) 8 24 9 11)
              (355 . |map|)
              (|Record| (|:| |polfac| 17) (|:| |correct| 24)
                        (|:| |corrfact| 102))
              (|Union| 112 '"failed") (|Record| (|:| |irr| 11) (|:| |pow| 63))
              (|Record| (|:| |contp| 24) (|:| |factors| (|List| 114)))
              (|List| 24)
              (|LeadingCoefDetermination| 6 (|IndexedExponents| 6) 24 11)
              (361 . |distFact|) (371 . ~=) (|SparseUnivariatePolynomial| 24)
              (377 . |elt|) (383 . *) (|Union| (|List| 12) '"failed")
              (|MultivariateLifting| (|IndexedExponents| 6) 6 24 11)
              (389 . |lifting|) (400 . |primitivePart|) (405 . |retract|)
              (410 . |Zero|) (414 . |Zero|) (418 . |leadingMonomial|)
              (423 . |monomial|) (430 . +) (436 . |reductum|) (441 . |ground?|)
              (446 . |retract|) (451 . |univariate|) (457 . |Zero|) (461 . ~=)
              (467 . |degree|) (472 . |leadingCoefficient|) (477 . *) (483 . +)
              (489 . |reductum|) (494 . |ground?|) (499 . |retract|)
              (504 . |coerce|) (509 . |degree|) (514 . |monomial|)
              (521 . |reductum|) (526 . |random|) (530 . |delete|)
              (536 . |delete|) (542 . |degree|) (547 . =) (|List| 116)
              (553 . |member?|) (559 . |eval|) (566 . |unit?|)
              (|FactoringUtilities| (|IndexedExponents| 6) 6 24 11)
              (571 . |completeEval|) (578 . ~=) (584 . |minimumDegree|)
              (589 . |content|) (594 . |exquo|) (600 . |polCase|)
              (607 . |differentiate|) (612 . |differentiate|)
              (617 . |differentiate|) (622 . |differentiate|) (|Mapping| 24 24)
              (627 . |map|) (633 . |gcd|) (638 . |leadingCoefficient|)
              (643 . |coefficients|) (|Factored| 120) (|TwoFactorize| 8)
              (648 . |tryTwoFactor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 178) (|:| |fctr| 120) (|:| |xpnt| 63))
              (|List| 179) (653 . |factorList|) (658 . |elt|) (664 . *)
              (670 . |generalTwoFactor|)
              (|Record| (|:| |factor| 120) (|:| |exponent| 63)) (|List| 185)
              (675 . |factors|) (680 . |unit|) (685 . |retract|) (690 . *)
              (696 . >) (|Record| (|:| |irr| 24) (|:| |pow| 63))
              (|Record| (|:| |cont| 8) (|:| |factors| (|List| 192)))
              (|DistinctDegreeFactorize| 8 24) (702 . |distdfact|)
              (708 . |position|) (714 . |elt|) (720 . |monomial|) (727 . *)
              (733 . |coerce|) (738 . |ground|) (|Mapping| 24 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 12 24 120)
              (743 . |map|) (|Mapping| 11 24)
              (|UnivariatePolynomialCategoryFunctions2| 24 120 11 12)
              (749 . |map|) (755 . |variables|) (760 . =)
              (|Record| (|:| |flg| 178) (|:| |fctr| 9) (|:| |xpnt| 63))
              (|List| 210) (766 . |makeFR|) (772 . |degree|)
              (778 . |primeFactor|) (784 . *) (790 . |One|) (794 . *)
              |MFINFACT;factor;PGF;19|)
           '#(|factor| 800) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 218
                                                 '(1 12 0 11 13 1 12 14 0 15 1
                                                   12 11 0 16 1 12 17 0 18 1 11
                                                   19 0 20 2 19 0 0 0 21 0 7 0
                                                   22 0 8 0 23 0 24 0 25 1 12
                                                   14 0 26 2 14 27 0 0 28 0 8 0
                                                   29 0 9 0 30 0 11 0 31 2 12 0
                                                   11 14 32 2 12 33 0 0 34 2 37
                                                   35 36 12 38 1 35 39 0 40 1
                                                   41 35 0 42 2 44 12 43 35 45
                                                   1 12 27 0 46 1 41 48 0 49 1
                                                   12 11 0 50 2 11 14 0 6 51 1
                                                   12 11 0 52 1 11 27 0 53 1 11
                                                   24 0 54 2 24 0 0 14 55 2 24
                                                   0 0 0 56 0 24 0 57 2 24 33 0
                                                   0 58 1 59 19 35 60 2 59 61
                                                   35 19 62 2 61 63 14 0 64 2
                                                   19 6 0 63 65 1 35 0 9 66 2
                                                   41 0 35 63 67 2 41 0 0 0 68
                                                   0 41 0 69 2 41 0 35 0 70 2
                                                   11 61 0 19 72 1 9 39 0 73 1
                                                   74 9 0 75 1 74 77 0 78 2 11
                                                   61 0 19 79 0 12 0 80 2 61 27
                                                   14 0 81 2 11 82 0 6 83 1 11
                                                   0 84 85 2 11 33 0 0 86 2 6
                                                   27 0 0 87 2 11 27 0 0 88 2
                                                   12 33 0 11 89 2 11 0 82 6 90
                                                   1 24 8 0 91 2 8 27 0 0 92 1
                                                   8 0 0 93 1 24 0 8 94 1 11 0
                                                   24 95 2 12 0 11 0 96 2 24 0
                                                   8 14 97 0 8 14 98 1 8 0 99
                                                   100 2 24 0 0 0 101 2 103 27
                                                   24 102 104 1 105 24 99 106 1
                                                   105 107 24 108 2 110 11 109
                                                   9 111 6 117 113 24 102 115
                                                   116 19 116 118 2 24 27 0 0
                                                   119 2 102 120 0 63 121 2 120
                                                   0 24 0 122 7 124 123 12 19
                                                   102 116 17 61 24 125 1 12 0
                                                   0 126 1 11 24 0 127 0 9 0
                                                   128 0 11 0 129 1 11 0 0 130
                                                   3 9 0 0 19 61 131 2 9 0 0 0
                                                   132 1 11 0 0 133 1 9 27 0
                                                   134 1 9 8 0 135 2 9 82 0 6
                                                   136 0 35 0 137 2 35 27 0 0
                                                   138 1 35 14 0 139 1 35 9 0
                                                   140 2 11 0 24 0 141 2 11 0 0
                                                   0 142 1 35 0 0 143 1 24 27 0
                                                   144 1 24 8 0 145 1 9 0 8 146
                                                   1 24 14 0 147 3 9 0 0 6 14
                                                   148 1 24 0 0 149 0 8 0 150 2
                                                   61 0 0 63 151 2 19 0 0 63
                                                   152 1 120 14 0 153 2 17 27 0
                                                   0 154 2 155 27 116 0 156 3
                                                   11 0 0 19 116 157 1 24 27 0
                                                   158 3 159 120 12 19 116 160
                                                   2 14 27 0 0 161 1 120 14 0
                                                   162 1 120 24 0 163 2 120 33
                                                   0 24 164 3 117 27 24 14 116
                                                   165 1 120 0 0 166 1 8 0 0
                                                   167 1 24 0 0 168 1 12 0 0
                                                   169 2 120 0 170 0 171 1 120
                                                   0 84 172 1 120 24 0 173 1
                                                   120 116 0 174 1 176 175 120
                                                   177 1 175 180 0 181 2 180
                                                   179 0 63 182 2 63 0 99 0 183
                                                   1 176 175 120 184 1 175 186
                                                   0 187 1 175 120 0 188 1 120
                                                   24 0 189 2 24 0 8 0 190 2 63
                                                   27 0 0 191 2 194 193 24 27
                                                   195 2 19 63 6 0 196 2 61 14
                                                   0 63 197 3 11 0 0 6 14 198 2
                                                   11 0 0 0 199 1 11 0 6 200 1
                                                   11 24 0 201 2 203 120 202 12
                                                   204 2 206 12 205 120 207 1 9
                                                   19 0 208 2 19 27 0 0 209 2
                                                   74 0 9 211 212 2 9 14 0 6
                                                   213 2 74 0 9 63 214 2 74 0 0
                                                   0 215 0 74 0 216 2 74 0 9 0
                                                   217 1 0 41 35 71 1 0 74 9
                                                   218)))))
           '|lookupComplete|)) 
