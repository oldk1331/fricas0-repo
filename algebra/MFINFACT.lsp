
(SDEFUN |MFINFACT;convertPUP|
        ((|lfg| |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV))
                 (|:| |pow| (|NonNegativeInteger|))))))
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseUnivariatePolynomial|
                       (|SparseMultivariatePolynomial|
                        (|SparseUnivariatePolynomial| F) OV)))
                 (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG ((#1=#:G151 NIL) (|lff| NIL) (#2=#:G150 NIL))
               (SEQ
                (CONS (QCAR |lfg|)
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |lff| NIL) (LETT #1# (QCDR |lfg|)) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |lff| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (CONS
                                      (SPADCALL (QCAR |lff|) (QREFELT $ 12))
                                      (QCDR |lff|))
                                     #2#))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |MFINFACT;supFactor|
        ((|um| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|var| OV) (|dx| |Integer|)
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseUnivariatePolynomial|
                       (|SparseMultivariatePolynomial|
                        (|SparseUnivariatePolynomial| F) OV)))
                 (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((#1=#:G198 NIL) (|lcfacs| #2=(|SparseUnivariatePolynomial| F))
          (#3=#:G195 NIL) (#4=#:G194 #2#) (#5=#:G196 #2#) (#6=#:G213 NIL)
          (|f| NIL)
          (|factorlist|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseUnivariatePolynomial|
                   (|SparseMultivariatePolynomial|
                    (|SparseUnivariatePolynomial| F) OV)))
             (|:| |pow| (|NonNegativeInteger|)))))
          (|auxfl|
           (|List|
            #7=(|Record|
                (|:| |irr|
                     #8=(|SparseUnivariatePolynomial|
                         (|SparseMultivariatePolynomial|
                          (|SparseUnivariatePolynomial| F) OV)))
                (|:| |pow| #9=(|NonNegativeInteger|)))))
          (#10=#:G212 NIL) (|lfp| NIL) (#11=#:G211 NIL)
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (|ldeg| (|List| #12=(|NonNegativeInteger|))) (#13=#:G187 NIL)
          (#14=#:G186 #12#) (#15=#:G188 #12#) (#16=#:G210 NIL) (|fc| NIL)
          (#17=#:G209 NIL) (|xx| NIL) (#18=#:G208 NIL)
          (|coefs|
           (|List|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|ffcont|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|ffexp| #9#) (|ffactor| #8#) (#19=#:G207 NIL) (|fact| NIL)
          (|sqqfact| (|List| #7#)) (#20=#:G206 NIL) (|ff| NIL) (#21=#:G205 NIL)
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors| (|List| #7#))))
          (|lcont|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|sqfacs| (|Factored| (|SparseUnivariatePolynomial| PG)))
          (|om| (|SparseUnivariatePolynomial| PG)) (#22=#:G203 NIL)
          (|lfg|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseUnivariatePolynomial|
                                  (|SparseMultivariatePolynomial|
                                   (|SparseUnivariatePolynomial| F) OV)))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (#23=#:G158 NIL)
          (|f1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|mdeg| (|NonNegativeInteger|)) (|lvar| #24=(|List| OV))
          (#25=#:G154 NIL) (#26=#:G153 #24#) (#27=#:G155 #24#) (#28=#:G204 NIL)
          (|cf| NIL))
         (SEQ
          (EXIT
           (COND
            ((EQL (SPADCALL |um| (QREFELT $ 14)) 0)
             (|MFINFACT;convertPUP|
              (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT $ 15)) |var| |dx| $)
              $))
            (#29='T
             (SEQ
              (LETT |lvar|
                    (PROGN
                     (LETT #25# NIL)
                     (SEQ (LETT |cf| NIL)
                          (LETT #28# (SPADCALL |um| (QREFELT $ 17))) G190
                          (COND
                           ((OR (ATOM #28#) (PROGN (LETT |cf| (CAR #28#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #27# (SPADCALL |cf| (QREFELT $ 19)))
                             (COND
                              (#25#
                               (LETT #26# (SPADCALL #26# #27# (QREFELT $ 20))))
                              ('T (PROGN (LETT #26# #27#) (LETT #25# 'T)))))))
                          (LETT #28# (CDR #28#)) (GO G190) G191 (EXIT NIL))
                     (COND (#25# #26#) (#29# (|IdentityError| '|setUnion|)))))
              (LETT |flead| (CONS (|spadConstant| $ 24) NIL))
              (LETT |factorlist| NIL)
              (LETT |mdeg| (SPADCALL |um| (QREFELT $ 25)))
              (COND
               ((SPADCALL |mdeg| 0 (QREFELT $ 27))
                (SEQ
                 (LETT |f1|
                       (SPADCALL (|spadConstant| $ 30) |mdeg| (QREFELT $ 31)))
                 (LETT |um|
                       (PROG2 (LETT #23# (SPADCALL |um| |f1| (QREFELT $ 33)))
                           (QCDR #23#)
                         (|check_union2| (QEQCAR #23# 0)
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
                                          #30="failed")
                                         #23#)))
                 (LETT |factorlist|
                       (CONS
                        (CONS (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 31))
                              |mdeg|)
                        |factorlist|))
                 (EXIT
                  (COND
                   ((EQL (SPADCALL |um| (QREFELT $ 14)) 0)
                    (PROGN
                     (LETT #22#
                           (SEQ
                            (LETT |lfg|
                                  (|MFINFACT;convertPUP|
                                   (|MFINFACT;mFactor|
                                    (SPADCALL |um| (QREFELT $ 15)) |var| |dx|
                                    $)
                                   $))
                            (EXIT
                             (CONS (QCAR |lfg|)
                                   (SPADCALL |factorlist| (QCDR |lfg|)
                                             (QREFELT $ 36))))))
                     (GO #31=#:G202))))))))
              (LETT |om|
                    (SPADCALL (CONS #'|MFINFACT;supFactor!0| (VECTOR $ |var|))
                              |um| (QREFELT $ 40)))
              (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 42)))
              (LETT |lcont|
                    (SPADCALL (CONS #'|MFINFACT;supFactor!1| (VECTOR $ |var|))
                              (SPADCALL |sqfacs| (QREFELT $ 44))
                              (QREFELT $ 47)))
              (COND
               ((SPADCALL |lcont| (QREFELT $ 48))
                (LETT |flead|
                      (|MFINFACT;convertPUP|
                       (|MFINFACT;constantCase|
                        (SPADCALL |lcont| (QREFELT $ 15)) NIL $)
                       $)))
               (#29#
                (LETT |flead| (|MFINFACT;supFactor| |lcont| |var| |dx| $))))
              (LETT |factorlist| (QCDR |flead|))
              (LETT |sqqfact|
                    (PROGN
                     (LETT #21# NIL)
                     (SEQ (LETT |ff| NIL)
                          (LETT #20# (SPADCALL |sqfacs| (QREFELT $ 52))) G190
                          (COND
                           ((OR (ATOM #20#) (PROGN (LETT |ff| (CAR #20#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #21#
                                  (CONS
                                   (CONS
                                    (SPADCALL
                                     (CONS #'|MFINFACT;supFactor!2|
                                           (VECTOR $ |var|))
                                     (QVELT |ff| 1) (QREFELT $ 47))
                                    (QVELT |ff| 2))
                                   #21#))))
                          (LETT #20# (CDR #20#)) (GO G190) G191
                          (EXIT (NREVERSE #21#)))))
              (SEQ (LETT |fact| NIL) (LETT #19# |sqqfact|) G190
                   (COND
                    ((OR (ATOM #19#) (PROGN (LETT |fact| (CAR #19#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ffactor| (QCAR |fact|))
                        (LETT |ffexp| (QCDR |fact|))
                        (LETT |ffcont| (SPADCALL |ffactor| (QREFELT $ 53)))
                        (LETT |coefs| (SPADCALL |ffactor| (QREFELT $ 17)))
                        (LETT |ldeg|
                              (PROGN
                               (LETT #18# NIL)
                               (SEQ (LETT |xx| NIL) (LETT #17# |lvar|) G190
                                    (COND
                                     ((OR (ATOM #17#)
                                          (PROGN (LETT |xx| (CAR #17#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #18#
                                            (CONS
                                             (PROGN
                                              (LETT #13# NIL)
                                              (SEQ (LETT |fc| NIL)
                                                   (LETT #16# |coefs|) G190
                                                   (COND
                                                    ((OR (ATOM #16#)
                                                         (PROGN
                                                          (LETT |fc|
                                                                (CAR #16#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #15#
                                                            (SPADCALL |fc| |xx|
                                                                      (QREFELT
                                                                       $ 54)))
                                                      (COND
                                                       (#13#
                                                        (LETT #14#
                                                              (MAX #14# #15#)))
                                                       ('T
                                                        (PROGN
                                                         (LETT #14# #15#)
                                                         (LETT #13# 'T)))))))
                                                   (LETT #16# (CDR #16#))
                                                   (GO G190) G191 (EXIT NIL))
                                              (COND (#13# #14#)
                                                    ('T
                                                     (|IdentityError|
                                                      '|max|))))
                                             #18#))))
                                    (LETT #17# (CDR #17#)) (GO G190) G191
                                    (EXIT (NREVERSE #18#)))))
                        (COND
                         ((SPADCALL (SPADCALL |ffactor| (QREFELT $ 55))
                                    (QREFELT $ 56))
                          (LETT |lf|
                                (|MFINFACT;mfconst| |ffactor| |dx| |lvar|
                                 |ldeg| $)))
                         ('T
                          (LETT |lf|
                                (|MFINFACT;mfpol| |ffactor| |var| |dx| |lvar|
                                 |ldeg| $))))
                        (LETT |auxfl|
                              (PROGN
                               (LETT #11# NIL)
                               (SEQ (LETT |lfp| NIL) (LETT #10# |lf|) G190
                                    (COND
                                     ((OR (ATOM #10#)
                                          (PROGN (LETT |lfp| (CAR #10#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #11#
                                            (CONS (CONS |lfp| |ffexp|) #11#))))
                                    (LETT #10# (CDR #10#)) (GO G190) G191
                                    (EXIT (NREVERSE #11#)))))
                        (EXIT
                         (LETT |factorlist|
                               (SPADCALL |auxfl| |factorlist|
                                         (QREFELT $ 57)))))
                   (LETT #19# (CDR #19#)) (GO G190) G191 (EXIT NIL))
              (LETT |lcfacs|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |f| NIL) (LETT #6# |factorlist|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |f| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #5#
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QCAR |f|) (QREFELT $ 55))
                                     (QREFELT $ 58))
                                    (QCDR |f|) (QREFELT $ 59)))
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 60))))
                              ('T (PROGN (LETT #4# #5#) (LETT #3# 'T)))))))
                          (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                     (COND (#3# #4#) (#29# (|spadConstant| $ 61)))))
              (EXIT
               (CONS
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |um| (QREFELT $ 55))
                                     (QREFELT $ 58))
                           |lcfacs| (QREFELT $ 62)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                   #30#)
                                  #1#))
                |factorlist|))))))
          #31# (EXIT #22#)))) 

(SDEFUN |MFINFACT;supFactor!2| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |var| $))))) 

(SDEFUN |MFINFACT;supFactor!1| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |var| $))))) 

(SDEFUN |MFINFACT;supFactor!0| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushup| |p1| |var| $))))) 

(SDEFUN |MFINFACT;factor_sup|
        ((|m| |SparseUnivariatePolynomial| F)
         ($ |Factored| (|SparseUnivariatePolynomial| PG)))
        (SPROG
         ((|fr1| #1=(|Factored| (|SparseUnivariatePolynomial| PG)))
          (#2=#:G217 NIL) (#3=#:G216 #1#) (#4=#:G218 #1#) (#5=#:G222 NIL)
          (|p| NIL)
          (|fm|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| F))
                            (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ (LETT |fm| (SPADCALL |m| NIL (QREFELT $ 66)))
              (LETT |fr1|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |p| NIL) (LETT #5# (QCDR |fm|)) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (SPADCALL
                                    (SPADCALL (ELT $ 67) (QCAR |p|)
                                              (QREFELT $ 70))
                                    (QCDR |p|) (QREFELT $ 71)))
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT $ 72))))
                              ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#2# #3#) ('T (|spadConstant| $ 73)))))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL (QCAR |fm|) (QREFELT $ 67))
                           (QREFELT $ 74))
                 NIL (QREFELT $ 75))
                |fr1| (QREFELT $ 72)))))) 

(SDEFUN |MFINFACT;factor;SupF;4|
        ((|um| |SparseUnivariatePolynomial| PG)
         ($ |Factored| (|SparseUnivariatePolynomial| PG)))
        (SPROG
         ((#1=#:G229 NIL)
          (#2=#:G228 #3=(|Factored| (|SparseUnivariatePolynomial| PG)))
          (#4=#:G230 #3#) (#5=#:G236 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseUnivariatePolynomial|
                                  (|SparseMultivariatePolynomial|
                                   (|SparseUnivariatePolynomial| F) OV)))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (|cm|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|var| (OV)) (|dx| #6=(|NonNegativeInteger|)) (#7=#:G224 NIL)
          (#8=#:G223 #6#) (#9=#:G225 #6#) (#10=#:G235 NIL) (#11=#:G104 NIL)
          (|ld| (|List| #6#)) (|lv| (|List| OV)))
         (SEQ (LETT |lv| (SPADCALL |um| (QREFELT $ 77)))
              (EXIT
               (COND
                ((NULL |lv|)
                 (|MFINFACT;factor_sup|
                  (SPADCALL (ELT $ 78) |um| (QREFELT $ 81)) $))
                (#12='T
                 (SEQ (LETT |ld| (SPADCALL |um| |lv| (QREFELT $ 83)))
                      (LETT |dx|
                            (PROGN
                             (LETT #7# NIL)
                             (SEQ (LETT #11# NIL) (LETT #10# |ld|) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN (LETT #11# (CAR #10#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #9# #11#)
                                     (COND (#7# (LETT #8# (MIN #8# #9#)))
                                           ('T
                                            (PROGN
                                             (LETT #8# #9#)
                                             (LETT #7# 'T)))))))
                                  (LETT #10# (CDR #10#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#7# #8#) (#12# (|IdentityError| '|min|)))))
                      (LETT |var|
                            (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 85))
                                      (QREFELT $ 86)))
                      (LETT |cm|
                            (SPADCALL
                             (CONS #'|MFINFACT;factor;SupF;4!0|
                                   (VECTOR $ |var|))
                             |um| (QREFELT $ 47)))
                      (LETT |flist| (|MFINFACT;supFactor| |cm| |var| |dx| $))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (|MFINFACT;pushupconst| (QCAR |flist|) |var| $)
                         (QREFELT $ 74))
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |u| NIL) (LETT #5# (QCDR |flist|)) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |u| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4#
                                       (SPADCALL
                                        (SPADCALL
                                         (CONS #'|MFINFACT;factor;SupF;4!1|
                                               (VECTOR $ |var|))
                                         (QCAR |u|) (QREFELT $ 40))
                                        (QCDR |u|) (QREFELT $ 71)))
                                 (COND
                                  (#1#
                                   (LETT #2#
                                         (SPADCALL #2# #4# (QREFELT $ 72))))
                                  ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#1# #2#) (#12# (|spadConstant| $ 73))))
                        (QREFELT $ 87)))))))))) 

(SDEFUN |MFINFACT;factor;SupF;4!1| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushup| |p1| |var| $))))) 

(SDEFUN |MFINFACT;factor;SupF;4!0| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |var| $))))) 

(SDEFUN |MFINFACT;mFactor|
        ((|m| |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV)
         (|var| OV) (|dx| |Integer|)
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV))
                 (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((|factorlist|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV))
             (|:| |pow| (|NonNegativeInteger|)))))
          (|auxfl|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV))
             (|:| |pow| (|NonNegativeInteger|)))))
          (#1=#:G286 NIL) (|lfp| NIL) (#2=#:G285 NIL)
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (|um|
           #3=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                               OV)))
          (|lcum| (F)) (|ldeg| (|List| (|NonNegativeInteger|))) (#4=#:G284 NIL)
          (|lcterm| NIL)
          (|ffactor|
           #5=(|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                              OV))
          (#6=#:G258 NIL)
          (|pc|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|lvar| (|List| OV)) (|x| (OV))
          (|varch|
           (|Record| (|:| |npol| #3#) (|:| |nvar| (|List| OV))
                     (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
          (#7=#:G283 NIL) (#8=#:G252 NIL)
          (|lcont|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (#9=#:G282 NIL) (|lterm| NIL) (|ffexp| #10=(|NonNegativeInteger|))
          (#11=#:G281 NIL) (|fact| NIL)
          (|sqqfact|
           (|List| (|Record| (|:| |factor| #5#) (|:| |exponent| #10#))))
          (#12=#:G280 NIL) (|ff| NIL) (#13=#:G279 NIL)
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (|sqfacs| (|Factored| PG)) (|om| (PG)) (#14=#:G240 NIL)
          (#15=#:G239 #16=(|Boolean|)) (#17=#:G241 #16#) (#18=#:G278 NIL)
          (|n| NIL) (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL |m| (QREFELT $ 56)) (|MFINFACT;constantCase| |m| NIL $))
           (#19='T
            (SEQ (LETT |lvar| (SPADCALL |m| (QREFELT $ 19)))
                 (LETT |flead| (CONS (|spadConstant| $ 61) NIL))
                 (LETT |factorlist| NIL)
                 (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 89)))
                 (EXIT
                  (COND
                   ((PROGN
                     (LETT #14# NIL)
                     (SEQ (LETT |n| NIL) (LETT #18# |lmdeg|) G190
                          (COND
                           ((OR (ATOM #18#) (PROGN (LETT |n| (CAR #18#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #17# (SPADCALL |n| 0 (QREFELT $ 27)))
                             (COND
                              (#14# (LETT #15# (COND (#15# 'T) ('T #17#))))
                              ('T (PROGN (LETT #15# #17#) (LETT #14# 'T)))))))
                          (LETT #18# (CDR #18#)) (GO G190) G191 (EXIT NIL))
                     (COND (#14# #15#) (#19# NIL)))
                    (|MFINFACT;simplify| |m| |var| |dx| |lvar| |lmdeg| $))
                   (#19#
                    (SEQ (LETT |om| (|MFINFACT;pushup| |m| |var| $))
                         (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 90)))
                         (LETT |lcont|
                               (|MFINFACT;pushdown|
                                (SPADCALL |sqfacs| (QREFELT $ 92)) |var| $))
                         (COND
                          ((SPADCALL |lcont| (QREFELT $ 56))
                           (LETT |flead|
                                 (|MFINFACT;constantCase| |lcont| NIL $)))
                          (#19#
                           (LETT |flead|
                                 (|MFINFACT;mFactor| |lcont| |var| |dx| $))))
                         (LETT |factorlist| (QCDR |flead|))
                         (LETT |sqqfact|
                               (PROGN
                                (LETT #13# NIL)
                                (SEQ (LETT |ff| NIL)
                                     (LETT #12#
                                           (SPADCALL |sqfacs| (QREFELT $ 95)))
                                     G190
                                     (COND
                                      ((OR (ATOM #12#)
                                           (PROGN (LETT |ff| (CAR #12#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #13#
                                             (CONS
                                              (CONS
                                               (|MFINFACT;pushdown|
                                                (QVELT |ff| 1) |var| $)
                                               (QVELT |ff| 2))
                                              #13#))))
                                     (LETT #12# (CDR #12#)) (GO G190) G191
                                     (EXIT (NREVERSE #13#)))))
                         (SEQ (LETT |fact| NIL) (LETT #11# |sqqfact|) G190
                              (COND
                               ((OR (ATOM #11#)
                                    (PROGN (LETT |fact| (CAR #11#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |ffactor| (QCAR |fact|))
                                   (LETT |ffexp| (QCDR |fact|))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |ffactor| (QREFELT $ 56))
                                      (SEQ (LETT |lterm| NIL)
                                           (LETT #9#
                                                 (QCDR
                                                  (|MFINFACT;constantCase|
                                                   |ffactor| NIL $)))
                                           G190
                                           (COND
                                            ((OR (ATOM #9#)
                                                 (PROGN
                                                  (LETT |lterm| (CAR #9#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |factorlist|
                                                   (CONS
                                                    (CONS (QCAR |lterm|)
                                                          (* (QCDR |lterm|)
                                                             |ffexp|))
                                                    |factorlist|))))
                                           (LETT #9# (CDR #9#)) (GO G190) G191
                                           (EXIT NIL)))
                                     ('T
                                      (SEQ
                                       (LETT |lvar|
                                             (SPADCALL |ffactor|
                                                       (QREFELT $ 19)))
                                       (LETT |x|
                                             (SPADCALL |lvar| 1
                                                       (QREFELT $ 86)))
                                       (LETT |ldeg|
                                             (SPADCALL |ffactor| |lvar|
                                                       (QREFELT $ 96)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL 1 |ldeg| (QREFELT $ 98))
                                          (SEQ
                                           (LETT |x|
                                                 (SPADCALL |lvar|
                                                           (SPADCALL 1 |ldeg|
                                                                     (QREFELT $
                                                                              85))
                                                           (QREFELT $ 86)))
                                           (LETT |lcont|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |ffactor| |x|
                                                             (QREFELT $ 100))
                                                   (QREFELT $ 17))
                                                  (QREFELT $ 102)))
                                           (LETT |ffactor|
                                                 (PROG2
                                                     (LETT #8#
                                                           (SPADCALL |ffactor|
                                                                     |lcont|
                                                                     (QREFELT $
                                                                              103)))
                                                     (QCDR #8#)
                                                   (|check_union2|
                                                    (QEQCAR #8# 0)
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
                                                    #8#)))
                                           (LETT |factorlist|
                                                 (CONS (CONS |ffactor| |ffexp|)
                                                       |factorlist|))
                                           (EXIT
                                            (SEQ (LETT |lcterm| NIL)
                                                 (LETT #7#
                                                       (QCDR
                                                        (|MFINFACT;mFactor|
                                                         |lcont| |var| |dx|
                                                         $)))
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |lcterm|
                                                              (CAR #7#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |factorlist|
                                                         (CONS
                                                          (CONS (QCAR |lcterm|)
                                                                (*
                                                                 (QCDR
                                                                  |lcterm|)
                                                                 |ffexp|))
                                                          |factorlist|))))
                                                 (LETT #7# (CDR #7#)) (GO G190)
                                                 G191 (EXIT NIL)))))
                                         ('T
                                          (SEQ
                                           (LETT |varch|
                                                 (|MFINFACT;varChoose|
                                                  |ffactor| |lvar| |ldeg| $))
                                           (LETT |um| (QVELT |varch| 0))
                                           (LETT |ldeg| (CDR |ldeg|))
                                           (LETT |lvar| (CDR |lvar|))
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL (QVELT |varch| 1) 1
                                                        (QREFELT $ 86))
                                              |x| (QREFELT $ 104))
                                             (SEQ
                                              (LETT |lvar| (QVELT |varch| 1))
                                              (LETT |x|
                                                    (SPADCALL |lvar| 1
                                                              (QREFELT $ 86)))
                                              (LETT |lvar| (CDR |lvar|))
                                              (LETT |pc|
                                                    (SPADCALL
                                                     (SPADCALL |um|
                                                               (QREFELT $ 17))
                                                     (QREFELT $ 102)))
                                              (COND
                                               ((SPADCALL |pc|
                                                          (|spadConstant| $ 30)
                                                          (QREFELT $ 105))
                                                (SEQ
                                                 (LETT |um|
                                                       (PROG2
                                                           (LETT #6#
                                                                 (SPADCALL |um|
                                                                           |pc|
                                                                           (QREFELT
                                                                            $
                                                                            106)))
                                                           (QCDR #6#)
                                                         (|check_union2|
                                                          (QEQCAR #6# 0)
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
                                                           "failed")
                                                          #6#)))
                                                 (LETT |ffactor|
                                                       (SPADCALL |um| |x|
                                                                 (QREFELT $
                                                                          107)))
                                                 (EXIT
                                                  (SEQ (LETT |lcterm| NIL)
                                                       (LETT #4#
                                                             (QCDR
                                                              (|MFINFACT;mFactor|
                                                               |pc| |var| |dx|
                                                               $)))
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #4#)
                                                             (PROGN
                                                              (LETT |lcterm|
                                                                    (CAR #4#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT |factorlist|
                                                               (CONS
                                                                (CONS
                                                                 (QCAR
                                                                  |lcterm|)
                                                                 (*
                                                                  (QCDR
                                                                   |lcterm|)
                                                                  |ffexp|))
                                                                |factorlist|))))
                                                       (LETT #4# (CDR #4#))
                                                       (GO G190) G191
                                                       (EXIT NIL))))))
                                              (EXIT
                                               (LETT |ldeg|
                                                     (SPADCALL |ffactor| |lvar|
                                                               (QREFELT $
                                                                        96)))))))
                                           (LETT |lcum|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |um|
                                                             (QREFELT $ 55))
                                                   (QREFELT $ 58))
                                                  (QREFELT $ 108)))
                                           (COND
                                            ((SPADCALL |lcum|
                                                       (|spadConstant| $ 28)
                                                       (QREFELT $ 109))
                                             (SEQ
                                              (LETT |um|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |lcum|
                                                                 (QREFELT $
                                                                          110))
                                                       (QREFELT $ 111))
                                                      (QREFELT $ 112))
                                                     |um| (QREFELT $ 113)))
                                              (EXIT
                                               (PROGN
                                                (RPLACA |flead|
                                                        (SPADCALL
                                                         (SPADCALL |lcum|
                                                                   (QREFELT $
                                                                            111))
                                                         (QCAR |flead|)
                                                         (QREFELT $ 60)))
                                                (QCAR |flead|))))))
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |um| (QREFELT $ 55))
                                              (QREFELT $ 56))
                                             (LETT |lf|
                                                   (|MFINFACT;mfconst| |um|
                                                    |dx| |lvar| |ldeg| $)))
                                            ('T
                                             (LETT |lf|
                                                   (|MFINFACT;mfpol| |um| |var|
                                                    |dx| |lvar| |ldeg| $))))
                                           (LETT |auxfl|
                                                 (PROGN
                                                  (LETT #2# NIL)
                                                  (SEQ (LETT |lfp| NIL)
                                                       (LETT #1# |lf|) G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |lfp|
                                                                    (CAR #1#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #2#
                                                               (CONS
                                                                (CONS
                                                                 (SPADCALL
                                                                  |lfp| |x|
                                                                  (QREFELT $
                                                                           107))
                                                                 |ffexp|)
                                                                #2#))))
                                                       (LETT #1# (CDR #1#))
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #2#)))))
                                           (EXIT
                                            (LETT |factorlist|
                                                  (SPADCALL |factorlist|
                                                            |auxfl|
                                                            (QREFELT $
                                                                     116)))))))))))))
                              (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                         (PROGN (RPLACD |flead| |factorlist|) (QCDR |flead|))
                         (EXIT |flead|))))))))))) 

(SDEFUN |MFINFACT;pM|
        ((|lum| |List|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G307 NIL) (|p| (|SparseUnivariatePolynomial| F))
          (#2=#:G297 NIL)
          (|q| (|Union| (|SparseUnivariatePolynomial| F) #3="failed"))
          (#4=#:G295 NIL) (|e| NIL) (#5=#:G306 NIL) (#6=#:G291 NIL)
          (#7=#:G308 NIL) (|i| NIL) (|x| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |x| (SPADCALL (|spadConstant| $ 28) 1 (QREFELT $ 117)))
                (SEQ (LETT |i| 1) (LETT #7# (SPADCALL (QREFELT $ 118))) G190
                     (COND ((|greater_SI| |i| #7#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (LETT |p|
                              (SPADCALL |x|
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1 (LETT #6# |i|)
                                            (|check_subtype2| (> #6# 0)
                                                              '(|PositiveInteger|)
                                                              '(|NonNegativeInteger|)
                                                              #6#))
                                          (QREFELT $ 120))
                                         (QREFELT $ 111))
                                        (QREFELT $ 121)))
                        (EXIT
                         (COND
                          ((SPADCALL |p| |lum| (QREFELT $ 124))
                           (PROGN
                            (LETT #5# (PROGN (LETT #1# |p|) (GO #8=#:G305)))
                            (GO #9=#:G292)))))))
                      #9# (EXIT #5#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SEQ (LETT |e| 2) G190 NIL
                      (SEQ
                       (LETT |p|
                             (SPADCALL
                              (PROG1 (LETT #4# |e|)
                                (|check_subtype2| (> #4# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|) #4#))
                              (QREFELT $ 126)))
                       (EXIT
                        (COND
                         ((SPADCALL |p| |lum| (QREFELT $ 124))
                          (PROGN (LETT #1# |p|) (GO #8#)))
                         ('T
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SEQ
                                   (LETT |q| (SPADCALL |p| (QREFELT $ 128)))
                                   (EXIT (NULL (QEQCAR |q| 1)))))
                                 (GO G191)))
                               (SEQ
                                (LETT |p|
                                      (PROG2 (LETT #2# |q|)
                                          (QCDR #2#)
                                        (|check_union2| (QEQCAR #2# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 8))
                                                        (|Union|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 8))
                                                         #3#)
                                                        #2#)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |p| |lum| (QREFELT $ 124))
                                   (PROGN (LETT #1# |p|) (GO #8#))))))
                               NIL (GO G190) G191 (EXIT NIL))))))
                      (LETT |e| (|inc_SI| |e|)) (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #1#)))) 

(SDEFUN |MFINFACT;pushdcoef|
        ((|t| PG)
         ($ |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV))
        (SPADCALL (ELT $ 111) |t| (QREFELT $ 131))) 

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
                 (|:| |pow| (|NonNegativeInteger|))))))
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
          (#1=#:G354 NIL) (|ff| NIL) (#2=#:G353 NIL)
          (|ffin|
           (|Union|
            (|List|
             (|SparseUnivariatePolynomial|
              (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                              OV)))
            "failed"))
          (#3=#:G331 NIL)
          (|unifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#4=#:G352 NIL) (|i| NIL) (#5=#:G351 NIL)
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
          (#6=#:G348 NIL)
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
          (#7=#:G350 NIL) (#8=#:G349 NIL) (|polcase| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ (LETT |polcase| (NULL (NULL (QCDR |tleadpol|))))
                (LETT |vfchoo|
                      (COND
                       (|polcase|
                        (SEQ
                         (LETT |leadpol|
                               (PROGN
                                (LETT #8# NIL)
                                (SEQ (LETT |ff| NIL)
                                     (LETT #7# (QCDR |tleadpol|)) G190
                                     (COND
                                      ((OR (ATOM #7#)
                                           (PROGN (LETT |ff| (CAR #7#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT (LETT #8# (CONS (QCAR |ff|) #8#))))
                                     (LETT #7# (CDR #7#)) (GO G190) G191
                                     (EXIT (NREVERSE #8#)))))
                         (EXIT
                          (|MFINFACT;intChoose| |um| |lvar| (QCAR |tleadpol|)
                           |leadpol| |ltry| $))))
                       (#9='T
                        (|MFINFACT;intChoose| |um| |lvar| (|spadConstant| $ 61)
                         NIL NIL $))))
                (LETT |unifact| (QVELT |vfchoo| 1))
                (LETT |nfact| (LENGTH |unifact|))
                (EXIT
                 (COND ((EQL |nfact| 1) (LIST |um|))
                       (#9#
                        (SEQ (LETT |ltry| (QVELT |vfchoo| 0))
                             (LETT |lval| (|SPADfirst| |ltry|))
                             (LETT |dd| (QVELT |vfchoo| 2)) (LETT |lpol| NIL)
                             (LETT |leadval| NIL)
                             (COND
                              (|polcase|
                               (SEQ (LETT |leadval| (QVELT |vfchoo| 3))
                                    (LETT |distf|
                                          (SPADCALL (QVELT |vfchoo| 2)
                                                    |unifact| |tleadpol|
                                                    |leadval| |lvar| |lval|
                                                    (QREFELT $ 137)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |distf| 1)
                                       (PROGN
                                        (LETT #6#
                                              (|MFINFACT;intfact| |um| |lvar|
                                               |ldeg| |tleadpol| |ltry| $))
                                        (GO #10=#:G347)))
                                      (#9#
                                       (SEQ (LETT |dist| (QCDR |distf|))
                                            (LETT |lpol| (QVELT |dist| 0))
                                            (LETT |dd| (QVELT |dist| 1))
                                            (EXIT
                                             (LETT |unifact|
                                                   (QVELT |dist| 2))))))))))
                             (COND
                              ((SPADCALL |dd| (|spadConstant| $ 61)
                                         (QREFELT $ 138))
                               (SEQ
                                (LETT |unifact|
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |i| 1) (LETT #4# |nfact|)
                                            G190
                                            (COND
                                             ((|greater_SI| |i| #4#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |dd|
                                                               (SPADCALL
                                                                |unifact| |i|
                                                                (QREFELT $
                                                                         140))
                                                               (QREFELT $ 141))
                                                     #5#))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191 (EXIT (NREVERSE #5#)))))
                                (EXIT
                                 (LETT |um|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |dd|
                                                   (PROG1
                                                       (LETT #3# (- |nfact| 1))
                                                     (|check_subtype2|
                                                      (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                                   (QREFELT $ 59))
                                         (QREFELT $ 112))
                                        |um| (QREFELT $ 113)))))))
                             (LETT |ffin|
                                   (SPADCALL |um| |lvar| |unifact| |lval|
                                             |lpol| |ldeg|
                                             (|MFINFACT;pM| |unifact| $)
                                             (QREFELT $ 144)))
                             (EXIT
                              (COND
                               ((QEQCAR |ffin| 1)
                                (|MFINFACT;intfact| |um| |lvar| |ldeg|
                                 |tleadpol| |ltry| $))
                               (#9#
                                (SEQ (LETT |factfin| (QCDR |ffin|))
                                     (COND
                                      ((SPADCALL |dd| (|spadConstant| $ 61)
                                                 (QREFELT $ 138))
                                       (LETT |factfin|
                                             (PROGN
                                              (LETT #2# NIL)
                                              (SEQ (LETT |ff| NIL)
                                                   (LETT #1# |factfin|) G190
                                                   (COND
                                                    ((OR (ATOM #1#)
                                                         (PROGN
                                                          (LETT |ff| (CAR #1#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #2#
                                                           (CONS
                                                            (SPADCALL |ff|
                                                                      (QREFELT
                                                                       $ 145))
                                                            #2#))))
                                                   (LETT #1# (CDR #1#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #2#)))))))
                                     (EXIT |factfin|)))))))))))
          #10# (EXIT #6#)))) 

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
           ((SPADCALL |f| (QREFELT $ 56))
            (|MFINFACT;pushupconst| (SPADCALL |f| (QREFELT $ 146)) |x| $))
           ('T
            (SEQ (LETT |rr| (|spadConstant| $ 147))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |f| (|spadConstant| $ 148) (QREFELT $ 105)))
                        (GO G191)))
                      (SEQ (LETT |lf| (SPADCALL |f| (QREFELT $ 149)))
                           (LETT |cf|
                                 (|MFINFACT;pushupconst|
                                  (SPADCALL |f| (QREFELT $ 58)) |x| $))
                           (LETT |lvf| (SPADCALL |lf| (QREFELT $ 19)))
                           (LETT |rr|
                                 (SPADCALL |rr|
                                           (SPADCALL |cf| |lvf|
                                                     (SPADCALL |lf| |lvf|
                                                               (QREFELT $ 96))
                                                     (QREFELT $ 150))
                                           (QREFELT $ 151)))
                           (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 152)))))
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
           ((SPADCALL |g| (QREFELT $ 153))
            (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 154)) (QREFELT $ 111))
                      (QREFELT $ 112)))
           ('T
            (SEQ (LETT |rf| (|spadConstant| $ 148))
                 (LETT |ug| (SPADCALL |g| |x| (QREFELT $ 155)))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |ug| (|spadConstant| $ 156)
                                   (QREFELT $ 157)))
                        (GO G191)))
                      (SEQ
                       (LETT |cf|
                             (SPADCALL (|spadConstant| $ 28)
                                       (SPADCALL |ug| (QREFELT $ 158))
                                       (QREFELT $ 117)))
                       (LETT |rf|
                             (SPADCALL |rf|
                                       (SPADCALL |cf|
                                                 (|MFINFACT;pushdcoef|
                                                  (SPADCALL |ug|
                                                            (QREFELT $ 159))
                                                  $)
                                                 (QREFELT $ 160))
                                       (QREFELT $ 161)))
                       (EXIT (LETT |ug| (SPADCALL |ug| (QREFELT $ 162)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rf|))))))) 

(SDEFUN |MFINFACT;pushupconst|
        ((|r| |SparseUnivariatePolynomial| F) (|x| OV) ($ PG))
        (SPROG ((|rr| (PG)))
               (SEQ
                (COND
                 ((SPADCALL |r| (QREFELT $ 163))
                  (SPADCALL (SPADCALL |r| (QREFELT $ 164)) (QREFELT $ 67)))
                 ('T
                  (SEQ (LETT |rr| (|spadConstant| $ 147))
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |r| (|spadConstant| $ 24)
                                         (QREFELT $ 138)))
                              (GO G191)))
                            (SEQ
                             (LETT |rr|
                                   (SPADCALL |rr|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |r| (QREFELT $ 108))
                                               (QREFELT $ 67))
                                              |x|
                                              (SPADCALL |r| (QREFELT $ 165))
                                              (QREFELT $ 166))
                                             (QREFELT $ 151)))
                             (EXIT (LETT |r| (SPADCALL |r| (QREFELT $ 167)))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |rr|))))))) 

(SDEFUN |MFINFACT;ran| ((|k1| |Integer|) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G371 NIL) (#2=#:G370 #3=(|SparseUnivariatePolynomial| F))
          (#4=#:G372 #3#) (#5=#:G374 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |i| 0) (LETT #5# |k1|) G190
                (COND ((|greater_SI| |i| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (SPADCALL (QREFELT $ 168)) |i|
                                   (QREFELT $ 117)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 121))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 24))))))) 

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
         ((|x| (OV)) (|i| (|Integer|)) (|k| #1#) (#2=#:G377 NIL)
          (#3=#:G376 #1#) (#4=#:G378 #1#) (#5=#:G382 NIL) (#6=#:G105 NIL))
         (SEQ
          (LETT |k|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT #6# NIL) (LETT #5# |ldeg|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# #6#)
                         (COND (#2# (LETT #3# (MIN #3# #4#)))
                               ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) (#7='T (|IdentityError| '|min|)))))
          (EXIT
           (COND
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 54)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 100)) |lvar|
                     |ldeg|))
            (#7#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 85)))
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 86)))
                  (LETT |ldeg|
                        (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 169))))
                  (LETT |lvar|
                        (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 170))))
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT $ 100)) |lvar|
                           |ldeg|))))))))) 

(SDEFUN |MFINFACT;norm|
        ((|lum| |List|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G384 NIL) (#3=#:G383 #1#) (#4=#:G385 #1#) (#5=#:G387 NIL)
          (|lup| NIL))
         (SEQ
          (PROGN
           (LETT #2# NIL)
           (SEQ (LETT |lup| NIL) (LETT #5# |lum|) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |lup| (CAR #5#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (SPADCALL |lup| (QREFELT $ 171)))
                   (COND (#2# (LETT #3# (MAX #3# #4#)))
                         ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
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
          (#3=#:G470 NIL) (|uf| NIL) (#4=#:G469 NIL)
          (|leadtest| #5=(|Boolean|)) (#6=#:G468 NIL) (#7=#:G467 NIL)
          (#8=#:G452 NIL) (#9=#:G466 NIL) (#10=#:G465 NIL) (#11=#:G464 NIL)
          (#12=#:G463 NIL) (#13=#:G462 NIL) (|ff| NIL) (#14=#:G461 NIL)
          (#15=#:G460 NIL) (#16=#:G459 NIL) (|lffc1| #2#)
          (|nf| (|NonNegativeInteger|))
          (|lunivf|
           #17=(|List|
                (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                          (|:| |factor|
                               (|SparseUnivariatePolynomial|
                                (|SparseUnivariatePolynomial| F)))
                          (|:| |exponent| (|NonNegativeInteger|)))))
          (|skip| (|Boolean|)) (|base_success| (|Integer|))
          (|luniv|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|base_failure| (|Integer|)) (|nfl| #17#)
          (|dx| #18=(|NonNegativeInteger|)) (#19=#:G414 NIL) (#20=#:G413 #18#)
          (#21=#:G415 #18#) (#22=#:G458 NIL) (|uc| NIL)
          (|newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|lcnm| (F)) (|range| (|NonNegativeInteger|))
          (|D2newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|Dnewm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#23=#:G398 NIL) (#24=#:G392 NIL) (#25=#:G391 #26=(|Boolean|))
          (#27=#:G393 #26#) (#28=#:G457 NIL) (|epl| NIL) (|leadcomp1| #1#)
          (#29=#:G456 NIL) (|pol| NIL) (#30=#:G455 NIL)
          (|lval| (|List| (|SparseUnivariatePolynomial| F))) (#31=#:G454 NIL)
          (|i| NIL) (#32=#:G453 NIL)
          (|newunifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|testp| #5#) (|ctf1| #2#) (|nvar1| (|NonNegativeInteger|))
          (|degum| (|NonNegativeInteger|)))
         (SEQ (LETT |degum| (SPADCALL |um| (QREFELT $ 14)))
              (LETT |nvar1| (LENGTH |lvar|)) (LETT |range| 0)
              (LETT |ctf1| (|spadConstant| $ 61))
              (LETT |testp| (NULL (SPADCALL |plist| NIL (QREFELT $ 172))))
              (LETT |leadcomp| (LETT |leadcomp1| NIL))
              (LETT |nfatt| (+ |degum| 1)) (LETT |lffc| (|spadConstant| $ 61))
              (LETT |lffc1| |lffc|) (LETT |newunifact| NIL)
              (LETT |leadtest| 'T) (LETT |int| NIL) (LETT |base_success| 0)
              (LETT |base_failure| 0)
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL 'T) (GO G191)))
                     (SEQ
                      (LETT |lval|
                            (PROGN
                             (LETT #32# NIL)
                             (SEQ (LETT |i| 1) (LETT #31# |nvar1|) G190
                                  (COND ((|greater_SI| |i| #31#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #32#
                                          (CONS (|MFINFACT;ran| |range| $)
                                                #32#))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT (NREVERSE #32#)))))
                      (EXIT
                       (COND
                        ((SPADCALL |lval| |ltry| (QREFELT $ 174))
                         (LETT |range| (+ 1 |range|)))
                        ('T
                         (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                              (LETT |leadcomp1|
                                    (PROGN
                                     (LETT #30# NIL)
                                     (SEQ (LETT |pol| NIL) (LETT #29# |plist|)
                                          G190
                                          (COND
                                           ((OR (ATOM #29#)
                                                (PROGN
                                                 (LETT |pol| (CAR #29#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #30#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |pol| |lvar|
                                                              |lval|
                                                              (QREFELT $ 175))
                                                    (QREFELT $ 146))
                                                   #30#))))
                                          (LETT #29# (CDR #29#)) (GO G190) G191
                                          (EXIT (NREVERSE #30#)))))
                              (COND
                               (|testp|
                                (COND
                                 ((PROGN
                                   (LETT #24# NIL)
                                   (SEQ (LETT |epl| NIL)
                                        (LETT #28# |leadcomp1|) G190
                                        (COND
                                         ((OR (ATOM #28#)
                                              (PROGN
                                               (LETT |epl| (CAR #28#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #27#
                                                 (SPADCALL |epl|
                                                           (QREFELT $ 176)))
                                           (COND
                                            (#24#
                                             (LETT #25#
                                                   (COND (#25# 'T) ('T #27#))))
                                            ('T
                                             (PROGN
                                              (LETT #25# #27#)
                                              (LETT #24# 'T)))))))
                                        (LETT #28# (CDR #28#)) (GO G190) G191
                                        (EXIT NIL))
                                   (COND (#24# #25#) ('T NIL)))
                                  (EXIT (LETT |range| (+ |range| 1)))))))
                              (LETT |newm|
                                    (SPADCALL |um| |lvar| |lval|
                                              (QREFELT $ 178)))
                              (COND
                               ((OR
                                 (SPADCALL |degum|
                                           (SPADCALL |newm| (QREFELT $ 171))
                                           (QREFELT $ 179))
                                 (SPADCALL (SPADCALL |newm| (QREFELT $ 180)) 0
                                           (QREFELT $ 179)))
                                (EXIT (LETT |range| (+ |range| 1)))))
                              (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 181)))
                              (LETT |newm|
                                    (PROG2
                                        (LETT #23#
                                              (SPADCALL |newm| |lffc1|
                                                        (QREFELT $ 182)))
                                        (QCDR #23#)
                                      (|check_union2| (QEQCAR #23# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 8)))
                                                      (|Union|
                                                       (|SparseUnivariatePolynomial|
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 8)))
                                                       "failed")
                                                      #23#)))
                              (COND
                               (|testp|
                                (COND
                                 (|leadtest|
                                  (COND
                                   ((NULL
                                     (SPADCALL
                                      (SPADCALL |lffc1| |clc| (QREFELT $ 60))
                                      (LENGTH |plist|) |leadcomp1|
                                      (QREFELT $ 183)))
                                    (EXIT (LETT |range| (+ |range| 1)))))))))
                              (LETT |Dnewm| (SPADCALL |newm| (QREFELT $ 184)))
                              (LETT |D2newm|
                                    (SPADCALL (ELT $ 187) |newm|
                                              (QREFELT $ 190)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL
                                   (SPADCALL (LIST |newm| |Dnewm| |D2newm|)
                                             (QREFELT $ 191))
                                   (QREFELT $ 171))
                                  0 (QREFELT $ 179))
                                 (LETT |range| (+ |range| 1)))
                                ('T
                                 (SEQ (LETT |lcnm| (|spadConstant| $ 28))
                                      (COND
                                       ((SPADCALL
                                         (LETT |lcnm|
                                               (SPADCALL
                                                (SPADCALL |newm|
                                                          (QREFELT $ 192))
                                                (QREFELT $ 108)))
                                         (|spadConstant| $ 28) (QREFELT $ 109))
                                        (LETT |newm|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |lcnm|
                                                          (QREFELT $ 110))
                                                (QREFELT $ 111))
                                               |newm| (QREFELT $ 141)))))
                                      (LETT |dx|
                                            (PROGN
                                             (LETT #19# NIL)
                                             (SEQ (LETT |uc| NIL)
                                                  (LETT #22#
                                                        (SPADCALL |newm|
                                                                  (QREFELT $
                                                                           193)))
                                                  G190
                                                  (COND
                                                   ((OR (ATOM #22#)
                                                        (PROGN
                                                         (LETT |uc| (CAR #22#))
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #21#
                                                           (SPADCALL |uc|
                                                                     (QREFELT $
                                                                              165)))
                                                     (COND
                                                      (#19#
                                                       (LETT #20#
                                                             (MAX #20# #21#)))
                                                      ('T
                                                       (PROGN
                                                        (LETT #20# #21#)
                                                        (LETT #19# 'T)))))))
                                                  (LETT #22# (CDR #22#))
                                                  (GO G190) G191 (EXIT NIL))
                                             (COND (#19# #20#)
                                                   ('T
                                                    (|IdentityError|
                                                     '|max|)))))
                                      (LETT |luniv|
                                            (SPADCALL |newm| (QREFELT $ 196)))
                                      (LETT |nfl|
                                            (SPADCALL |luniv| (QREFELT $ 199)))
                                      (LETT |nf| (LENGTH |nfl|))
                                      (COND
                                       ((OR (EQL |nf| 0)
                                            (SPADCALL |nf| |nfatt|
                                                      (QREFELT $ 27)))
                                        (EXIT "next values")))
                                      (COND
                                       ((EQL |nf| 1)
                                        (COND
                                         ((QEQCAR
                                           (QVELT
                                            (SPADCALL |nfl| 1 (QREFELT $ 200))
                                            0)
                                           0)
                                          (SEQ
                                           (LETT |base_failure|
                                                 (+ |base_failure| 1))
                                           (LETT |skip|
                                                 (< |base_failure|
                                                    (+
                                                     (SPADCALL 3 |base_success|
                                                               (QREFELT $ 201))
                                                     3)))
                                           (EXIT
                                            (LETT |luniv|
                                                  (COND (|skip| |luniv|)
                                                        ('T
                                                         (SPADCALL |newm|
                                                                   (QREFELT $
                                                                            202))))))))
                                         ('T
                                          (SEQ
                                           (LETT |base_success|
                                                 (+ |base_success| 1))
                                           (EXIT (LETT |skip| NIL))))))
                                       ('T
                                        (SEQ
                                         (LETT |base_success|
                                               (+ |base_success| 1))
                                         (EXIT (LETT |skip| NIL)))))
                                      (EXIT
                                       (COND (|skip| "iterate")
                                             ('T
                                              (SEQ
                                               (LETT |lunivf|
                                                     (SPADCALL |luniv|
                                                               (QREFELT $
                                                                        199)))
                                               (LETT |nf| (LENGTH |lunivf|))
                                               (COND
                                                ((OR (EQL |nf| 0)
                                                     (SPADCALL |nf| |nfatt|
                                                               (QREFELT $ 27)))
                                                 (EXIT "next values")))
                                               (COND
                                                ((EQL |nf| 1)
                                                 (SEQ
                                                  (LETT |unifact|
                                                        (LIST |newm|))
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #8# |$NoValue|)
                                                    (GO #33=#:G449))))))
                                               (LETT |lffc1|
                                                     (SPADCALL
                                                      (SPADCALL |lcnm|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |luniv|
                                                                  (QREFELT $
                                                                           203))
                                                                 (QREFELT $
                                                                          204))
                                                                (QREFELT $
                                                                         205))
                                                      |lffc1| (QREFELT $ 60)))
                                               (EXIT
                                                (COND
                                                 ((EQL |nfatt| |nf|)
                                                  (SEQ
                                                   (COND
                                                    (|leadtest|
                                                     (SEQ
                                                      (LETT |unifact|
                                                            (PROGN
                                                             (LETT #16# NIL)
                                                             (SEQ
                                                              (LETT |uf| NIL)
                                                              (LETT #15#
                                                                    |lunivf|)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #15#)
                                                                    (PROGN
                                                                     (LETT |uf|
                                                                           (CAR
                                                                            #15#))
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT #16#
                                                                      (CONS
                                                                       (QVELT
                                                                        |uf| 1)
                                                                       #16#))))
                                                              (LETT #15#
                                                                    (CDR #15#))
                                                              (GO G190) G191
                                                              (EXIT
                                                               (NREVERSE
                                                                #16#)))))
                                                      (LETT |int| |lval|)
                                                      (LETT |lffc| |lffc1|)
                                                      (EXIT
                                                       (COND
                                                        (|testp|
                                                         (LETT |leadcomp|
                                                               |leadcomp1|))))))
                                                    ((SPADCALL
                                                      (|MFINFACT;norm|
                                                       |unifact| $)
                                                      (|MFINFACT;norm|
                                                       (PROGN
                                                        (LETT #14# NIL)
                                                        (SEQ (LETT |ff| NIL)
                                                             (LETT #13#
                                                                   |lunivf|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #13#)
                                                                   (PROGN
                                                                    (LETT |ff|
                                                                          (CAR
                                                                           #13#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT #14#
                                                                     (CONS
                                                                      (QVELT
                                                                       |ff| 1)
                                                                      #14#))))
                                                             (LETT #13#
                                                                   (CDR #13#))
                                                             (GO G190) G191
                                                             (EXIT
                                                              (NREVERSE
                                                               #14#))))
                                                       $)
                                                      (QREFELT $ 206))
                                                     (COND
                                                      (|testp|
                                                       (COND
                                                        ((SPADCALL
                                                          (SPADCALL |lffc1|
                                                                    |clc|
                                                                    (QREFELT $
                                                                             60))
                                                          (LENGTH |plist|)
                                                          |leadcomp1|
                                                          (QREFELT $ 183))
                                                         (SEQ
                                                          (LETT |unifact|
                                                                (PROGN
                                                                 (LETT #12#
                                                                       NIL)
                                                                 (SEQ
                                                                  (LETT |uf|
                                                                        NIL)
                                                                  (LETT #11#
                                                                        |lunivf|)
                                                                  G190
                                                                  (COND
                                                                   ((OR
                                                                     (ATOM
                                                                      #11#)
                                                                     (PROGN
                                                                      (LETT
                                                                       |uf|
                                                                       (CAR
                                                                        #11#))
                                                                      NIL))
                                                                    (GO G191)))
                                                                  (SEQ
                                                                   (EXIT
                                                                    (LETT #12#
                                                                          (CONS
                                                                           (QVELT
                                                                            |uf|
                                                                            1)
                                                                           #12#))))
                                                                  (LETT #11#
                                                                        (CDR
                                                                         #11#))
                                                                  (GO G190)
                                                                  G191
                                                                  (EXIT
                                                                   (NREVERSE
                                                                    #12#)))))
                                                          (LETT |int| |lval|)
                                                          (LETT |lffc| |lffc1|)
                                                          (EXIT
                                                           (COND
                                                            (|testp|
                                                             (LETT |leadcomp|
                                                                   |leadcomp1|))))))))
                                                      ('T
                                                       (SEQ
                                                        (LETT |unifact|
                                                              (PROGN
                                                               (LETT #10# NIL)
                                                               (SEQ
                                                                (LETT |uf| NIL)
                                                                (LETT #9#
                                                                      |lunivf|)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #9#)
                                                                   (PROGN
                                                                    (LETT |uf|
                                                                          (CAR
                                                                           #9#))
                                                                    NIL))
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (LETT #10#
                                                                        (CONS
                                                                         (QVELT
                                                                          |uf|
                                                                          1)
                                                                         #10#))))
                                                                (LETT #9#
                                                                      (CDR
                                                                       #9#))
                                                                (GO G190) G191
                                                                (EXIT
                                                                 (NREVERSE
                                                                  #10#)))))
                                                        (LETT |int| |lval|)
                                                        (LETT |lffc| |lffc1|)
                                                        (EXIT
                                                         (COND
                                                          (|testp|
                                                           (LETT |leadcomp|
                                                                 |leadcomp1|)))))))))
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #8# |$NoValue|)
                                                     (GO #33#)))))
                                                 ((SPADCALL |nfatt| |degum|
                                                            (QREFELT $ 27))
                                                  (SEQ
                                                   (LETT |unifact|
                                                         (PROGN
                                                          (LETT #7# NIL)
                                                          (SEQ (LETT |uf| NIL)
                                                               (LETT #6#
                                                                     |lunivf|)
                                                               G190
                                                               (COND
                                                                ((OR (ATOM #6#)
                                                                     (PROGN
                                                                      (LETT
                                                                       |uf|
                                                                       (CAR
                                                                        #6#))
                                                                      NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #7#
                                                                       (CONS
                                                                        (QVELT
                                                                         |uf|
                                                                         1)
                                                                        #7#))))
                                                               (LETT #6#
                                                                     (CDR #6#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #7#)))))
                                                   (LETT |lffc| |lffc1|)
                                                   (COND
                                                    (|testp|
                                                     (LETT |leadcomp|
                                                           |leadcomp1|)))
                                                   (LETT |int| |lval|)
                                                   (LETT |leadtest| NIL)
                                                   (EXIT (LETT |nfatt| |nf|))))
                                                 ((SPADCALL |nfatt| |nf|
                                                            (QREFELT $ 27))
                                                  (SEQ
                                                   (COND
                                                    (|testp|
                                                     (LETT |leadtest|
                                                           (NULL
                                                            (SPADCALL
                                                             (SPADCALL |lffc|
                                                                       |clc|
                                                                       (QREFELT
                                                                        $ 60))
                                                             (LENGTH |plist|)
                                                             |leadcomp|
                                                             (QREFELT $
                                                                      183)))))
                                                    ('T (LETT |leadtest| NIL)))
                                                   (COND
                                                    ((NULL |leadtest|)
                                                     (SEQ
                                                      (LETT |unifact|
                                                            (PROGN
                                                             (LETT #4# NIL)
                                                             (SEQ
                                                              (LETT |uf| NIL)
                                                              (LETT #3#
                                                                    |lunivf|)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #3#)
                                                                    (PROGN
                                                                     (LETT |uf|
                                                                           (CAR
                                                                            #3#))
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT #4#
                                                                      (CONS
                                                                       (QVELT
                                                                        |uf| 1)
                                                                       #4#))))
                                                              (LETT #3#
                                                                    (CDR #3#))
                                                              (GO G190) G191
                                                              (EXIT
                                                               (NREVERSE
                                                                #4#)))))
                                                      (LETT |lffc| |lffc1|)
                                                      (COND
                                                       (|testp|
                                                        (LETT |leadcomp|
                                                              |leadcomp1|)))
                                                      (EXIT
                                                       (LETT |int| |lval|)))))
                                                   (EXIT
                                                    (LETT |nfatt|
                                                          |nf|)))))))))))))))))))
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
           (|:| |pow| (|NonNegativeInteger|))))
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV))
                 (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((#1=#:G478 NIL) (|pp| NIL) (#2=#:G477 NIL)
          (|lunm|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| F))
                            (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ
          (LETT |lunm|
                (SPADCALL (SPADCALL |m| (QREFELT $ 146)) NIL (QREFELT $ 66)))
          (EXIT
           (CONS (SPADCALL (QCAR |lunm|) (QREFELT $ 111))
                 (SPADCALL |factorlist|
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |pp| NIL) (LETT #1# (QCDR |lunm|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |pp| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (CONS
                                           (SPADCALL (QCAR |pp|)
                                                     (QREFELT $ 112))
                                           (QCDR |pp|))
                                          #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 116))))))) 

(SDEFUN |MFINFACT;simplify|
        ((|m| |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV)
         (|var| OV) (|dm| |Integer|) (|lvar| |List| OV)
         (|lmdeg| |List| (|NonNegativeInteger|))
         ($ |Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
          (|:| |factors|
               (|List|
                (|Record|
                 (|:| |irr|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV))
                 (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (#1=#:G484 NIL)
          (|factorlist|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV))
             (|:| |pow| (|NonNegativeInteger|)))))
          (|pol1|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|i| (|NonNegativeInteger|)) (#2=#:G489 NIL) (|x| NIL))
         (SEQ (LETT |factorlist| NIL) (LETT |pol1| (|spadConstant| $ 30))
              (SEQ (LETT |x| NIL) (LETT #2# |lvar|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT $ 207))
                                    (QREFELT $ 208)))
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| $ 30)
                                                       |x| |i| (QREFELT $ 209))
                                             (QREFELT $ 210)))
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT $ 211)) |i|)
                                     |factorlist|))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2 (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 103)))
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
                                      #1#)))
              (EXIT
               (COND
                ((SPADCALL |m| (QREFELT $ 56))
                 (|MFINFACT;constantCase| |m| |factorlist| $))
                ('T
                 (SEQ (LETT |flead| (|MFINFACT;mFactor| |m| |var| |dm| $))
                      (PROGN
                       (RPLACD |flead|
                               (SPADCALL |factorlist| (QCDR |flead|)
                                         (QREFELT $ 116)))
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
         ((#1=#:G499 NIL) (|lumf| NIL) (#2=#:G498 NIL)
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
         (SEQ (LETT |factfin| NIL)
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ (LETT |um1| (SPADCALL (ELT $ 212) |um| (QREFELT $ 215)))
                      (LETT |lum| (SPADCALL |um1| (QREFELT $ 202)))
                      (EXIT
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |lumf| NIL)
                             (LETT #1# (SPADCALL |lum| (QREFELT $ 199))) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |lumf| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL (ELT $ 112) (QVELT |lumf| 1)
                                                (QREFELT $ 218))
                                      #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))))
                ('T
                 (|MFINFACT;intfact| |um| |lvar| |ldeg|
                  (CONS (|spadConstant| $ 24) NIL) NIL $))))))) 

(SDEFUN |MFINFACT;mfpol|
        ((|um| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|var| OV) (|dm| |Integer|) (|lvar| |List| OV)
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
                            (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ
          (LETT |tleadpol|
                (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT $ 55)) |var| |dm|
                 $))
          (EXIT (|MFINFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL $))))) 

(SDEFUN |MFINFACT;factor;PGF;20| ((|m| PG) ($ |Factored| PG))
        (SPROG
         ((#1=#:G510 NIL) (#2=#:G509 #3=(|Factored| PG)) (#4=#:G511 #3#)
          (#5=#:G518 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (|cm|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|var| (OV)) (|dx| #6=(|NonNegativeInteger|)) (#7=#:G506 NIL)
          (#8=#:G505 #6#) (#9=#:G507 #6#) (#10=#:G517 NIL) (#11=#:G106 NIL)
          (|ld| (|List| #6#)) (#12=#:G516 NIL) (|x| NIL) (#13=#:G515 NIL)
          (|lv| (|List| OV)))
         (SEQ (LETT |lv| (SPADCALL |m| (QREFELT $ 219)))
              (EXIT
               (COND
                ((SPADCALL |lv| NIL (QREFELT $ 220))
                 (SPADCALL |m| NIL (QREFELT $ 221)))
                (#14='T
                 (SEQ
                  (LETT |ld|
                        (PROGN
                         (LETT #13# NIL)
                         (SEQ (LETT |x| NIL) (LETT #12# |lv|) G190
                              (COND
                               ((OR (ATOM #12#)
                                    (PROGN (LETT |x| (CAR #12#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #13#
                                      (CONS (SPADCALL |m| |x| (QREFELT $ 222))
                                            #13#))))
                              (LETT #12# (CDR #12#)) (GO G190) G191
                              (EXIT (NREVERSE #13#)))))
                  (LETT |dx|
                        (PROGN
                         (LETT #7# NIL)
                         (SEQ (LETT #11# NIL) (LETT #10# |ld|) G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT #11# (CAR #10#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #9# #11#)
                                 (COND (#7# (LETT #8# (MIN #8# #9#)))
                                       ('T
                                        (PROGN
                                         (LETT #8# #9#)
                                         (LETT #7# 'T)))))))
                              (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
                         (COND (#7# #8#) (#14# (|IdentityError| '|min|)))))
                  (LETT |var|
                        (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 85))
                                  (QREFELT $ 86)))
                  (LETT |cm| (|MFINFACT;pushdown| |m| |var| $))
                  (LETT |flist| (|MFINFACT;mFactor| |cm| |var| |dx| $))
                  (EXIT
                   (SPADCALL (|MFINFACT;pushupconst| (QCAR |flist|) |var| $)
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |u| NIL) (LETT #5# (QCDR |flist|))
                                   G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN (LETT |u| (CAR #5#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #4#
                                            (SPADCALL
                                             (|MFINFACT;pushup| (QCAR |u|)
                                              |var| $)
                                             (QCDR |u|) (QREFELT $ 223)))
                                      (COND
                                       (#1#
                                        (LETT #2#
                                              (SPADCALL #2# #4#
                                                        (QREFELT $ 224))))
                                       ('T
                                        (PROGN
                                         (LETT #2# #4#)
                                         (LETT #1# 'T)))))))
                                   (LETT #5# (CDR #5#)) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#1# #2#) (#14# (|spadConstant| $ 225))))
                             (QREFELT $ 226)))))))))) 

(DECLAIM (NOTINLINE |MultFiniteFactorize;|)) 

(DEFUN |MultFiniteFactorize| (&REST #1=#:G519)
  (SPROG NIL
         (PROG (#2=#:G520)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultFiniteFactorize|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultFiniteFactorize;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultFiniteFactorize|)))))))))) 

(DEFUN |MultFiniteFactorize;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MultFiniteFactorize| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 228))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|MultFiniteFactorize|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MultFiniteFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|)
              (|SparseMultivariatePolynomial| 23 6)
              (|SparseUnivariatePolynomial| 10) (0 . |coerce|)
              (|NonNegativeInteger|) (5 . |degree|) (10 . |ground|) (|List| 10)
              (15 . |coefficients|) (|List| 6) (20 . |variables|)
              (25 . |setUnion|) (31 . |Zero|) (35 . |Zero|)
              (|SparseUnivariatePolynomial| 8) (39 . |Zero|)
              (43 . |minimumDegree|) (|Boolean|) (48 . >) (54 . |One|)
              (58 . |One|) (62 . |One|) (66 . |monomial|) (|Union| $ '"failed")
              (72 . |exquo|) (|Record| (|:| |irr| 11) (|:| |pow| 13))
              (|List| 34) (78 . |append|) (|SparseUnivariatePolynomial| 9)
              (|Mapping| 9 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 11 9 37)
              (84 . |map|) (|Factored| $) (90 . |squareFree|) (|Factored| 37)
              (95 . |unit|) (|Mapping| 10 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 37 10 11)
              (100 . |map|) (106 . |ground?|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 49) (|:| |factor| 37) (|:| |exponent| 13))
              (|List| 50) (111 . |factorList|) (116 . |content|)
              (121 . |degree|) (127 . |leadingCoefficient|) (132 . |ground?|)
              (137 . |concat!|) (143 . |leadingCoefficient|) (148 . ^)
              (154 . *) (160 . |One|) (164 . |exquo|)
              (|Record| (|:| |irr| 23) (|:| |pow| 13))
              (|Record| (|:| |cont| 8) (|:| |factors| (|List| 63)))
              (|DistinctDegreeFactorize| 8 23) (170 . |distdfact|)
              (176 . |coerce|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 23 9 37)
              (181 . |map|) (187 . |primeFactor|) (193 . *) (199 . |One|)
              (203 . |coerce|) (208 . |makeFR|) (|FactoringUtilities| 7 6 8 9)
              (214 . |variables|) (219 . |ground|) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 37 8 23)
              (224 . |map|) (|List| 13) (230 . |degree|) (|Integer|)
              (236 . |position|) (242 . |elt|) (248 . *)
              |MFINFACT;factor;SupF;4| (254 . |minimumDegree|)
              (260 . |squareFree|) (|Factored| 9) (265 . |unit|)
              (|Record| (|:| |flag| 49) (|:| |factor| 9) (|:| |exponent| 13))
              (|List| 93) (270 . |factorList|) (275 . |degree|) (281 . |One|)
              (285 . |member?|) (|SparseUnivariatePolynomial| $)
              (291 . |univariate|) (|List| $) (297 . |gcd|) (302 . |exquo|)
              (308 . ~=) (314 . ~=) (320 . |exquo|) (326 . |multivariate|)
              (332 . |leadingCoefficient|) (337 . ~=) (343 . |inv|)
              (348 . |coerce|) (353 . |coerce|) (358 . *)
              (|Record| (|:| |irr| 10) (|:| |pow| 13)) (|List| 114)
              (364 . |append|) (370 . |monomial|) (376 . |size|)
              (|PositiveInteger|) (380 . |index|) (385 . +) (|List| 139)
              (|GenExEuclid| 23 139) (391 . |testModulus|)
              (|FiniteFieldPolynomialPackage| 8)
              (397 . |createIrreduciblePoly|) (|Union| 23 '"failed")
              (402 . |nextIrreduciblePoly|) (|Mapping| 23 8)
              (|MPolyCatFunctions2| 6 7 (|IndexedExponents| 6) 8 23 9 10)
              (407 . |map|)
              (|Record| (|:| |polfac| 16) (|:| |correct| 23)
                        (|:| |corrfact| 122))
              (|Union| 132 '"failed")
              (|Record| (|:| |contp| 23) (|:| |factors| 115)) (|List| 23)
              (|LeadingCoefDetermination| 6 (|IndexedExponents| 6) 23 10)
              (413 . |distFact|) (423 . ~=) (|SparseUnivariatePolynomial| 23)
              (429 . |elt|) (435 . *) (|Union| (|List| 11) '"failed")
              (|MultivariateLifting| (|IndexedExponents| 6) 6 23 10)
              (441 . |lifting|) (452 . |primitivePart|) (457 . |retract|)
              (462 . |Zero|) (466 . |Zero|) (470 . |leadingMonomial|)
              (475 . |monomial|) (482 . +) (488 . |reductum|) (493 . |ground?|)
              (498 . |retract|) (503 . |univariate|) (509 . |Zero|) (513 . ~=)
              (519 . |degree|) (524 . |leadingCoefficient|) (529 . *) (535 . +)
              (541 . |reductum|) (546 . |ground?|) (551 . |retract|)
              (556 . |degree|) (561 . |monomial|) (568 . |reductum|)
              (573 . |random|) (577 . |delete|) (583 . |delete|)
              (589 . |degree|) (594 . =) (|List| 135) (600 . |member?|)
              (606 . |eval|) (613 . |unit?|)
              (|FactoringUtilities| (|IndexedExponents| 6) 6 23 10)
              (618 . |completeEval|) (625 . ~=) (631 . |minimumDegree|)
              (636 . |content|) (641 . |exquo|) (647 . |polCase|)
              (654 . |differentiate|) (659 . |differentiate|)
              (664 . |differentiate|) (669 . |differentiate|)
              (674 . |differentiate|) (|Mapping| 23 23) (679 . |map|)
              (685 . |gcd|) (690 . |leadingCoefficient|) (695 . |coefficients|)
              (|Factored| 139) (|TwoFactorize| 8) (700 . |tryTwoFactor|)
              (|Record| (|:| |flag| 49) (|:| |factor| 139) (|:| |exponent| 13))
              (|List| 197) (705 . |factorList|) (710 . |elt|) (716 . *)
              (722 . |generalTwoFactor|) (727 . |unit|) (732 . |retract|)
              (737 . *) (743 . >) (749 . |position|) (755 . |elt|)
              (761 . |monomial|) (768 . *) (774 . |coerce|) (779 . |ground|)
              (|Mapping| 23 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 11 23 139)
              (784 . |map|) (|Mapping| 10 23)
              (|UnivariatePolynomialCategoryFunctions2| 23 139 10 11)
              (790 . |map|) (796 . |variables|) (801 . =) (807 . |makeFR|)
              (813 . |degree|) (819 . |primeFactor|) (825 . *) (831 . |One|)
              (835 . *) |MFINFACT;factor;PGF;20|)
           '#(|factor| 841) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|factor| ((|Factored| |#4|) |#4|)) T)
                                   '((|factor|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#4|))
                                       (|SparseUnivariatePolynomial| |#4|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 227
                                            '(1 11 0 10 12 1 11 13 0 14 1 11 10
                                              0 15 1 11 16 0 17 1 10 18 0 19 2
                                              18 0 0 0 20 0 7 0 21 0 8 0 22 0
                                              23 0 24 1 11 13 0 25 2 13 26 0 0
                                              27 0 8 0 28 0 9 0 29 0 10 0 30 2
                                              11 0 10 13 31 2 11 32 0 0 33 2 35
                                              0 0 0 36 2 39 37 38 11 40 1 37 41
                                              0 42 1 43 37 0 44 2 46 11 45 37
                                              47 1 11 26 0 48 1 43 51 0 52 1 11
                                              10 0 53 2 10 13 0 6 54 1 11 10 0
                                              55 1 10 26 0 56 2 35 0 0 0 57 1
                                              10 23 0 58 2 23 0 0 13 59 2 23 0
                                              0 0 60 0 23 0 61 2 23 32 0 0 62 2
                                              65 64 23 26 66 1 9 0 8 67 2 69 37
                                              68 23 70 2 43 0 37 13 71 2 43 0 0
                                              0 72 0 43 0 73 1 37 0 9 74 2 43 0
                                              37 51 75 1 76 18 37 77 1 9 8 0 78
                                              2 80 23 79 37 81 2 76 82 37 18 83
                                              2 82 84 13 0 85 2 18 6 0 84 86 2
                                              43 0 37 0 87 2 10 82 0 18 89 1 9
                                              41 0 90 1 91 9 0 92 1 91 94 0 95
                                              2 10 82 0 18 96 0 11 0 97 2 82 26
                                              13 0 98 2 10 99 0 6 100 1 10 0
                                              101 102 2 10 32 0 0 103 2 6 26 0
                                              0 104 2 10 26 0 0 105 2 11 32 0
                                              10 106 2 10 0 99 6 107 1 23 8 0
                                              108 2 8 26 0 0 109 1 8 0 0 110 1
                                              23 0 8 111 1 10 0 23 112 2 11 0
                                              10 0 113 2 115 0 0 0 116 2 23 0 8
                                              13 117 0 8 13 118 1 8 0 119 120 2
                                              23 0 0 0 121 2 123 26 23 122 124
                                              1 125 23 119 126 1 125 127 23 128
                                              2 130 10 129 9 131 6 136 133 23
                                              122 134 135 18 135 137 2 23 26 0
                                              0 138 2 122 139 0 84 140 2 139 0
                                              23 0 141 7 143 142 11 18 122 135
                                              16 82 23 144 1 11 0 0 145 1 10 23
                                              0 146 0 9 0 147 0 10 0 148 1 10 0
                                              0 149 3 9 0 0 18 82 150 2 9 0 0 0
                                              151 1 10 0 0 152 1 9 26 0 153 1 9
                                              8 0 154 2 9 99 0 6 155 0 37 0 156
                                              2 37 26 0 0 157 1 37 13 0 158 1
                                              37 9 0 159 2 10 0 23 0 160 2 10 0
                                              0 0 161 1 37 0 0 162 1 23 26 0
                                              163 1 23 8 0 164 1 23 13 0 165 3
                                              9 0 0 6 13 166 1 23 0 0 167 0 8 0
                                              168 2 82 0 0 84 169 2 18 0 0 84
                                              170 1 139 13 0 171 2 16 26 0 0
                                              172 2 173 26 135 0 174 3 10 0 0
                                              18 135 175 1 23 26 0 176 3 177
                                              139 11 18 135 178 2 13 26 0 0 179
                                              1 139 13 0 180 1 139 23 0 181 2
                                              139 32 0 23 182 3 136 26 23 13
                                              135 183 1 139 0 0 184 1 8 0 0 185
                                              1 37 0 0 186 1 23 0 0 187 1 11 0
                                              0 188 2 139 0 189 0 190 1 139 0
                                              101 191 1 139 23 0 192 1 139 135
                                              0 193 1 195 194 139 196 1 194 198
                                              0 199 2 198 197 0 84 200 2 84 0
                                              119 0 201 1 195 194 139 202 1 194
                                              139 0 203 1 139 23 0 204 2 23 0 8
                                              0 205 2 84 26 0 0 206 2 18 84 6 0
                                              207 2 82 13 0 84 208 3 10 0 0 6
                                              13 209 2 10 0 0 0 210 1 10 0 6
                                              211 1 10 23 0 212 2 214 139 213
                                              11 215 2 217 11 216 139 218 1 9
                                              18 0 219 2 18 26 0 0 220 2 91 0 9
                                              94 221 2 9 13 0 6 222 2 91 0 9 13
                                              223 2 91 0 0 0 224 0 91 0 225 2
                                              91 0 9 0 226 1 0 43 37 88 1 0 91
                                              9 227)))))
           '|lookupComplete|)) 
