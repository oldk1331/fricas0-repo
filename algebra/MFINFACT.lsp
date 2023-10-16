
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
        (SPROG ((#1=#:G150 NIL) (|lff| NIL) (#2=#:G149 NIL))
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
         ((#1=#:G197 NIL) (|lcfacs| #2=(|SparseUnivariatePolynomial| F))
          (#3=#:G194 NIL) (#4=#:G193 #2#) (#5=#:G195 #2#) (#6=#:G212 NIL)
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
          (#10=#:G211 NIL) (|lfp| NIL) (#11=#:G210 NIL)
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (|ldeg| (|List| #12=(|NonNegativeInteger|))) (#13=#:G186 NIL)
          (#14=#:G185 #12#) (#15=#:G187 #12#) (#16=#:G209 NIL) (|fc| NIL)
          (#17=#:G208 NIL) (|xx| NIL) (#18=#:G207 NIL)
          (|coefs|
           (|List|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|ffcont|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|ffexp| #9#) (|ffactor| #8#) (#19=#:G206 NIL) (|fact| NIL)
          (|sqqfact| (|List| #7#)) (#20=#:G205 NIL) (|ff| NIL) (#21=#:G204 NIL)
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors| (|List| #7#))))
          (|lcont|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|sqfacs| (|Factored| (|SparseUnivariatePolynomial| PG)))
          (|om| (|SparseUnivariatePolynomial| PG)) (#22=#:G202 NIL)
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
          (#23=#:G157 NIL)
          (|f1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|mdeg| (|NonNegativeInteger|)) (|lvar| #24=(|List| OV))
          (#25=#:G153 NIL) (#26=#:G152 #24#) (#27=#:G154 #24#) (#28=#:G203 NIL)
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
                     (GO #31=#:G201))))))))
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
                               (SPADCALL |factorlist| |auxfl|
                                         (QREFELT $ 36)))))
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
                                     (QREFELT $ 57))
                                    (QCDR |f|) (QREFELT $ 58)))
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 59))))
                              ('T (PROGN (LETT #4# #5#) (LETT #3# 'T)))))))
                          (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                     (COND (#3# #4#) (#29# (|spadConstant| $ 60)))))
              (EXIT
               (CONS
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |um| (QREFELT $ 55))
                                     (QREFELT $ 57))
                           |lcfacs| (QREFELT $ 61)))
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
          (#2=#:G216 NIL) (#3=#:G215 #1#) (#4=#:G217 #1#) (#5=#:G221 NIL)
          (|p| NIL)
          (|fm|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| F))
                            (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ (LETT |fm| (SPADCALL |m| NIL (QREFELT $ 65)))
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
                                    (SPADCALL (ELT $ 66) (QCAR |p|)
                                              (QREFELT $ 69))
                                    (QCDR |p|) (QREFELT $ 70)))
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT $ 71))))
                              ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#2# #3#) ('T (|spadConstant| $ 72)))))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL (QCAR |fm|) (QREFELT $ 66))
                           (QREFELT $ 73))
                 NIL (QREFELT $ 74))
                |fr1| (QREFELT $ 71)))))) 

(SDEFUN |MFINFACT;factor;SupF;4|
        ((|um| |SparseUnivariatePolynomial| PG)
         ($ |Factored| (|SparseUnivariatePolynomial| PG)))
        (SPROG
         ((#1=#:G228 NIL)
          (#2=#:G227 #3=(|Factored| (|SparseUnivariatePolynomial| PG)))
          (#4=#:G229 #3#) (#5=#:G235 NIL) (|u| NIL)
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
          (|var| (OV)) (|dx| #6=(|NonNegativeInteger|)) (#7=#:G223 NIL)
          (#8=#:G222 #6#) (#9=#:G224 #6#) (#10=#:G234 NIL) (#11=#:G104 NIL)
          (|ld| (|List| #6#)) (|lv| (|List| OV)))
         (SEQ (LETT |lv| (SPADCALL |um| (QREFELT $ 76)))
              (EXIT
               (COND
                ((NULL |lv|)
                 (|MFINFACT;factor_sup|
                  (SPADCALL (ELT $ 77) |um| (QREFELT $ 80)) $))
                (#12='T
                 (SEQ (LETT |ld| (SPADCALL |um| |lv| (QREFELT $ 82)))
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
                            (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 84))
                                      (QREFELT $ 85)))
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
                         (QREFELT $ 73))
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
                                        (QCDR |u|) (QREFELT $ 70)))
                                 (COND
                                  (#1#
                                   (LETT #2#
                                         (SPADCALL #2# #4# (QREFELT $ 71))))
                                  ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#1# #2#) (#12# (|spadConstant| $ 72))))
                        (QREFELT $ 86)))))))))) 

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
          (#1=#:G285 NIL) (|lfp| NIL) (#2=#:G284 NIL)
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (|um|
           #3=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                               OV)))
          (|lcum| (F)) (|ldeg| (|List| (|NonNegativeInteger|))) (#4=#:G283 NIL)
          (|lcterm| NIL)
          (|ffactor|
           #5=(|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                              OV))
          (#6=#:G257 NIL)
          (|pc|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|lvar| (|List| OV)) (|x| (OV))
          (|varch|
           (|Record| (|:| |npol| #3#) (|:| |nvar| (|List| OV))
                     (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
          (#7=#:G282 NIL) (#8=#:G251 NIL)
          (|lcont|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (#9=#:G281 NIL) (|lterm| NIL) (|ffexp| #10=(|NonNegativeInteger|))
          (#11=#:G280 NIL) (|fact| NIL)
          (|sqqfact|
           (|List| (|Record| (|:| |factor| #5#) (|:| |exponent| #10#))))
          (#12=#:G279 NIL) (|ff| NIL) (#13=#:G278 NIL)
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (|sqfacs| (|Factored| PG)) (|om| (PG)) (#14=#:G239 NIL)
          (#15=#:G238 #16=(|Boolean|)) (#17=#:G240 #16#) (#18=#:G277 NIL)
          (|n| NIL) (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL |m| (QREFELT $ 56)) (|MFINFACT;constantCase| |m| NIL $))
           (#19='T
            (SEQ (LETT |lvar| (SPADCALL |m| (QREFELT $ 19)))
                 (LETT |flead| (CONS (|spadConstant| $ 60) NIL))
                 (LETT |factorlist| NIL)
                 (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 88)))
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
                         (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 89)))
                         (LETT |lcont|
                               (|MFINFACT;pushdown|
                                (SPADCALL |sqfacs| (QREFELT $ 91)) |var| $))
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
                                           (SPADCALL |sqfacs| (QREFELT $ 94)))
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
                                                       (QREFELT $ 85)))
                                       (LETT |ldeg|
                                             (SPADCALL |ffactor| |lvar|
                                                       (QREFELT $ 95)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL 1 |ldeg| (QREFELT $ 97))
                                          (SEQ
                                           (LETT |x|
                                                 (SPADCALL |lvar|
                                                           (SPADCALL 1 |ldeg|
                                                                     (QREFELT $
                                                                              84))
                                                           (QREFELT $ 85)))
                                           (LETT |lcont|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |ffactor| |x|
                                                             (QREFELT $ 99))
                                                   (QREFELT $ 17))
                                                  (QREFELT $ 101)))
                                           (LETT |ffactor|
                                                 (PROG2
                                                     (LETT #8#
                                                           (SPADCALL |ffactor|
                                                                     |lcont|
                                                                     (QREFELT $
                                                                              102)))
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
                                                        (QREFELT $ 85))
                                              |x| (QREFELT $ 103))
                                             (SEQ
                                              (LETT |lvar| (QVELT |varch| 1))
                                              (LETT |x|
                                                    (SPADCALL |lvar| 1
                                                              (QREFELT $ 85)))
                                              (LETT |lvar| (CDR |lvar|))
                                              (LETT |pc|
                                                    (SPADCALL
                                                     (SPADCALL |um|
                                                               (QREFELT $ 17))
                                                     (QREFELT $ 101)))
                                              (COND
                                               ((SPADCALL |pc|
                                                          (|spadConstant| $ 30)
                                                          (QREFELT $ 104))
                                                (SEQ
                                                 (LETT |um|
                                                       (PROG2
                                                           (LETT #6#
                                                                 (SPADCALL |um|
                                                                           |pc|
                                                                           (QREFELT
                                                                            $
                                                                            105)))
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
                                                                          106)))
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
                                                                        95)))))))
                                           (LETT |lcum|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |um|
                                                             (QREFELT $ 55))
                                                   (QREFELT $ 57))
                                                  (QREFELT $ 107)))
                                           (COND
                                            ((SPADCALL |lcum|
                                                       (|spadConstant| $ 28)
                                                       (QREFELT $ 108))
                                             (SEQ
                                              (LETT |um|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |lcum|
                                                                 (QREFELT $
                                                                          109))
                                                       (QREFELT $ 110))
                                                      (QREFELT $ 111))
                                                     |um| (QREFELT $ 112)))
                                              (EXIT
                                               (PROGN
                                                (RPLACA |flead|
                                                        (SPADCALL
                                                         (SPADCALL |lcum|
                                                                   (QREFELT $
                                                                            110))
                                                         (QCAR |flead|)
                                                         (QREFELT $ 59)))
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
                                                                           106))
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
                                                                     115)))))))))))))
                              (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                         (PROGN (RPLACD |flead| |factorlist|) (QCDR |flead|))
                         (EXIT |flead|))))))))))) 

(SDEFUN |MFINFACT;pM|
        ((|lum| |List|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G306 NIL) (|p| (|SparseUnivariatePolynomial| F))
          (#2=#:G296 NIL)
          (|q| (|Union| (|SparseUnivariatePolynomial| F) #3="failed"))
          (#4=#:G294 NIL) (|e| NIL) (#5=#:G305 NIL) (#6=#:G290 NIL)
          (#7=#:G307 NIL) (|i| NIL) (|x| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |x| (SPADCALL (|spadConstant| $ 28) 1 (QREFELT $ 116)))
                (SEQ (LETT |i| 1) (LETT #7# (SPADCALL (QREFELT $ 117))) G190
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
                                          (QREFELT $ 119))
                                         (QREFELT $ 110))
                                        (QREFELT $ 120)))
                        (EXIT
                         (COND
                          ((SPADCALL |p| |lum| (QREFELT $ 123))
                           (PROGN
                            (LETT #5# (PROGN (LETT #1# |p|) (GO #8=#:G304)))
                            (GO #9=#:G291)))))))
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
                              (QREFELT $ 125)))
                       (EXIT
                        (COND
                         ((SPADCALL |p| |lum| (QREFELT $ 123))
                          (PROGN (LETT #1# |p|) (GO #8#)))
                         ('T
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SEQ
                                   (LETT |q| (SPADCALL |p| (QREFELT $ 127)))
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
                                  ((SPADCALL |p| |lum| (QREFELT $ 123))
                                   (PROGN (LETT #1# |p|) (GO #8#))))))
                               NIL (GO G190) G191 (EXIT NIL))))))
                      (LETT |e| (|inc_SI| |e|)) (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #1#)))) 

(SDEFUN |MFINFACT;pushdcoef|
        ((|t| PG)
         ($ |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV))
        (SPADCALL (ELT $ 110) |t| (QREFELT $ 130))) 

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
          (#1=#:G353 NIL) (|ff| NIL) (#2=#:G352 NIL)
          (|ffin|
           (|Union|
            (|List|
             (|SparseUnivariatePolynomial|
              (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                              OV)))
            "failed"))
          (#3=#:G330 NIL)
          (|unifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#4=#:G351 NIL) (|i| NIL) (#5=#:G350 NIL)
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
          (#6=#:G347 NIL)
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
          (#7=#:G349 NIL) (#8=#:G348 NIL) (|polcase| (|Boolean|)))
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
                        (|MFINFACT;intChoose| |um| |lvar| (|spadConstant| $ 60)
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
                                                    (QREFELT $ 136)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |distf| 1)
                                       (PROGN
                                        (LETT #6#
                                              (|MFINFACT;intfact| |um| |lvar|
                                               |ldeg| |tleadpol| |ltry| $))
                                        (GO #10=#:G346)))
                                      (#9#
                                       (SEQ (LETT |dist| (QCDR |distf|))
                                            (LETT |lpol| (QVELT |dist| 0))
                                            (LETT |dd| (QVELT |dist| 1))
                                            (EXIT
                                             (LETT |unifact|
                                                   (QVELT |dist| 2))))))))))
                             (COND
                              ((SPADCALL |dd| (|spadConstant| $ 60)
                                         (QREFELT $ 137))
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
                                                                         139))
                                                               (QREFELT $ 140))
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
                                                   (QREFELT $ 58))
                                         (QREFELT $ 111))
                                        |um| (QREFELT $ 112)))))))
                             (LETT |ffin|
                                   (SPADCALL |um| |lvar| |unifact| |lval|
                                             |lpol| |ldeg|
                                             (|MFINFACT;pM| |unifact| $)
                                             (QREFELT $ 143)))
                             (EXIT
                              (COND
                               ((QEQCAR |ffin| 1)
                                (|MFINFACT;intfact| |um| |lvar| |ldeg|
                                 |tleadpol| |ltry| $))
                               (#9#
                                (SEQ (LETT |factfin| (QCDR |ffin|))
                                     (COND
                                      ((SPADCALL |dd| (|spadConstant| $ 60)
                                                 (QREFELT $ 137))
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
                                                                       $ 144))
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
            (|MFINFACT;pushupconst| (SPADCALL |f| (QREFELT $ 145)) |x| $))
           ('T
            (SEQ (LETT |rr| (|spadConstant| $ 146))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |f| (|spadConstant| $ 147) (QREFELT $ 104)))
                        (GO G191)))
                      (SEQ (LETT |lf| (SPADCALL |f| (QREFELT $ 148)))
                           (LETT |cf|
                                 (|MFINFACT;pushupconst|
                                  (SPADCALL |f| (QREFELT $ 57)) |x| $))
                           (LETT |lvf| (SPADCALL |lf| (QREFELT $ 19)))
                           (LETT |rr|
                                 (SPADCALL |rr|
                                           (SPADCALL |cf| |lvf|
                                                     (SPADCALL |lf| |lvf|
                                                               (QREFELT $ 95))
                                                     (QREFELT $ 149))
                                           (QREFELT $ 150)))
                           (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 151)))))
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
           ((SPADCALL |g| (QREFELT $ 152))
            (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 153)) (QREFELT $ 110))
                      (QREFELT $ 111)))
           ('T
            (SEQ (LETT |rf| (|spadConstant| $ 147))
                 (LETT |ug| (SPADCALL |g| |x| (QREFELT $ 154)))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |ug| (|spadConstant| $ 155)
                                   (QREFELT $ 156)))
                        (GO G191)))
                      (SEQ
                       (LETT |cf|
                             (SPADCALL (|spadConstant| $ 28)
                                       (SPADCALL |ug| (QREFELT $ 157))
                                       (QREFELT $ 116)))
                       (LETT |rf|
                             (SPADCALL |rf|
                                       (SPADCALL |cf|
                                                 (|MFINFACT;pushdcoef|
                                                  (SPADCALL |ug|
                                                            (QREFELT $ 158))
                                                  $)
                                                 (QREFELT $ 159))
                                       (QREFELT $ 160)))
                       (EXIT (LETT |ug| (SPADCALL |ug| (QREFELT $ 161)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rf|))))))) 

(SDEFUN |MFINFACT;pushupconst|
        ((|r| |SparseUnivariatePolynomial| F) (|x| OV) ($ PG))
        (SPROG ((|rr| (PG)))
               (SEQ
                (COND
                 ((SPADCALL |r| (QREFELT $ 162))
                  (SPADCALL (SPADCALL |r| (QREFELT $ 163)) (QREFELT $ 66)))
                 ('T
                  (SEQ (LETT |rr| (|spadConstant| $ 146))
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |r| (|spadConstant| $ 24)
                                         (QREFELT $ 137)))
                              (GO G191)))
                            (SEQ
                             (LETT |rr|
                                   (SPADCALL |rr|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |r| (QREFELT $ 107))
                                               (QREFELT $ 66))
                                              |x|
                                              (SPADCALL |r| (QREFELT $ 164))
                                              (QREFELT $ 165))
                                             (QREFELT $ 150)))
                             (EXIT (LETT |r| (SPADCALL |r| (QREFELT $ 166)))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |rr|))))))) 

(SDEFUN |MFINFACT;ran| ((|k1| |Integer|) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G370 NIL) (#2=#:G369 #3=(|SparseUnivariatePolynomial| F))
          (#4=#:G371 #3#) (#5=#:G373 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |i| 0) (LETT #5# |k1|) G190
                (COND ((|greater_SI| |i| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (SPADCALL (QREFELT $ 167)) |i|
                                   (QREFELT $ 116)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 120))))
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
         ((|x| (OV)) (|i| (|Integer|)) (|k| #1#) (#2=#:G376 NIL)
          (#3=#:G375 #1#) (#4=#:G377 #1#) (#5=#:G381 NIL) (|d| NIL))
         (SEQ
          (LETT |k|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |d| NIL) (LETT #5# |ldeg|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |d| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# |d|)
                         (COND (#2# (LETT #3# (MIN #3# #4#)))
                               ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) (#6='T (|IdentityError| '|min|)))))
          (EXIT
           (COND
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 54)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 99)) |lvar|
                     |ldeg|))
            (#6#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 84)))
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 85)))
                  (LETT |ldeg|
                        (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 168))))
                  (LETT |lvar|
                        (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 169))))
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT $ 99)) |lvar|
                           |ldeg|))))))))) 

(SDEFUN |MFINFACT;norm|
        ((|lum| |List|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G383 NIL) (#3=#:G382 #1#) (#4=#:G384 #1#) (#5=#:G386 NIL)
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
                   (LETT #4# (SPADCALL |lup| (QREFELT $ 170)))
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
          (#3=#:G469 NIL) (|uf| NIL) (#4=#:G468 NIL)
          (|leadtest| #5=(|Boolean|)) (#6=#:G467 NIL) (#7=#:G466 NIL)
          (#8=#:G451 NIL) (#9=#:G465 NIL) (#10=#:G464 NIL) (#11=#:G463 NIL)
          (#12=#:G462 NIL) (#13=#:G461 NIL) (|ff| NIL) (#14=#:G460 NIL)
          (#15=#:G459 NIL) (#16=#:G458 NIL) (|lffc1| #2#)
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
          (|dx| #18=(|NonNegativeInteger|)) (#19=#:G413 NIL) (#20=#:G412 #18#)
          (#21=#:G414 #18#) (#22=#:G457 NIL) (|uc| NIL)
          (|newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|lcnm| (F)) (|range| (|NonNegativeInteger|))
          (|D2newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|Dnewm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#23=#:G397 NIL) (#24=#:G391 NIL) (#25=#:G390 #26=(|Boolean|))
          (#27=#:G392 #26#) (#28=#:G456 NIL) (|epl| NIL) (|leadcomp1| #1#)
          (#29=#:G455 NIL) (|pol| NIL) (#30=#:G454 NIL)
          (|lval| (|List| (|SparseUnivariatePolynomial| F))) (#31=#:G453 NIL)
          (|i| NIL) (#32=#:G452 NIL)
          (|newunifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|testp| #5#) (|ctf1| #2#) (|nvar1| (|NonNegativeInteger|))
          (|degum| (|NonNegativeInteger|)))
         (SEQ (LETT |degum| (SPADCALL |um| (QREFELT $ 14)))
              (LETT |nvar1| (LENGTH |lvar|)) (LETT |range| 0)
              (LETT |ctf1| (|spadConstant| $ 60))
              (LETT |testp| (NULL (SPADCALL |plist| NIL (QREFELT $ 171))))
              (LETT |leadcomp| (LETT |leadcomp1| NIL))
              (LETT |nfatt| (+ |degum| 1)) (LETT |lffc| (|spadConstant| $ 60))
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
                        ((SPADCALL |lval| |ltry| (QREFELT $ 173))
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
                                                              (QREFELT $ 174))
                                                    (QREFELT $ 145))
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
                                                           (QREFELT $ 175)))
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
                                              (QREFELT $ 177)))
                              (COND
                               ((OR
                                 (SPADCALL |degum|
                                           (SPADCALL |newm| (QREFELT $ 170))
                                           (QREFELT $ 178))
                                 (SPADCALL (SPADCALL |newm| (QREFELT $ 179)) 0
                                           (QREFELT $ 178)))
                                (EXIT (LETT |range| (+ |range| 1)))))
                              (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 180)))
                              (LETT |newm|
                                    (PROG2
                                        (LETT #23#
                                              (SPADCALL |newm| |lffc1|
                                                        (QREFELT $ 181)))
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
                                      (SPADCALL |lffc1| |clc| (QREFELT $ 59))
                                      (LENGTH |plist|) |leadcomp1|
                                      (QREFELT $ 182)))
                                    (EXIT (LETT |range| (+ |range| 1)))))))))
                              (LETT |Dnewm| (SPADCALL |newm| (QREFELT $ 183)))
                              (LETT |D2newm|
                                    (SPADCALL (ELT $ 186) |newm|
                                              (QREFELT $ 189)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL
                                   (SPADCALL (LIST |newm| |Dnewm| |D2newm|)
                                             (QREFELT $ 190))
                                   (QREFELT $ 170))
                                  0 (QREFELT $ 178))
                                 (LETT |range| (+ |range| 1)))
                                ('T
                                 (SEQ (LETT |lcnm| (|spadConstant| $ 28))
                                      (COND
                                       ((SPADCALL
                                         (LETT |lcnm|
                                               (SPADCALL
                                                (SPADCALL |newm|
                                                          (QREFELT $ 191))
                                                (QREFELT $ 107)))
                                         (|spadConstant| $ 28) (QREFELT $ 108))
                                        (LETT |newm|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |lcnm|
                                                          (QREFELT $ 109))
                                                (QREFELT $ 110))
                                               |newm| (QREFELT $ 140)))))
                                      (LETT |dx|
                                            (PROGN
                                             (LETT #19# NIL)
                                             (SEQ (LETT |uc| NIL)
                                                  (LETT #22#
                                                        (SPADCALL |newm|
                                                                  (QREFELT $
                                                                           192)))
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
                                                                              164)))
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
                                            (SPADCALL |newm| (QREFELT $ 195)))
                                      (LETT |nfl|
                                            (SPADCALL |luniv| (QREFELT $ 198)))
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
                                            (SPADCALL |nfl| 1 (QREFELT $ 199))
                                            0)
                                           0)
                                          (SEQ
                                           (LETT |base_failure|
                                                 (+ |base_failure| 1))
                                           (LETT |skip|
                                                 (< |base_failure|
                                                    (+
                                                     (SPADCALL 3 |base_success|
                                                               (QREFELT $ 200))
                                                     3)))
                                           (EXIT
                                            (LETT |luniv|
                                                  (COND (|skip| |luniv|)
                                                        ('T
                                                         (SPADCALL |newm|
                                                                   (QREFELT $
                                                                            201))))))))
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
                                                                        198)))
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
                                                    (GO #33=#:G448))))))
                                               (LETT |lffc1|
                                                     (SPADCALL
                                                      (SPADCALL |lcnm|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |luniv|
                                                                  (QREFELT $
                                                                           202))
                                                                 (QREFELT $
                                                                          203))
                                                                (QREFELT $
                                                                         204))
                                                      |lffc1| (QREFELT $ 59)))
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
                                                      (QREFELT $ 205))
                                                     (COND
                                                      (|testp|
                                                       (COND
                                                        ((SPADCALL
                                                          (SPADCALL |lffc1|
                                                                    |clc|
                                                                    (QREFELT $
                                                                             59))
                                                          (LENGTH |plist|)
                                                          |leadcomp1|
                                                          (QREFELT $ 182))
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
                                                                        $ 59))
                                                             (LENGTH |plist|)
                                                             |leadcomp|
                                                             (QREFELT $
                                                                      182)))))
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
         ((#1=#:G477 NIL) (|pp| NIL) (#2=#:G476 NIL)
          (|lunm|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| F))
                            (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ
          (LETT |lunm|
                (SPADCALL (SPADCALL |m| (QREFELT $ 145)) NIL (QREFELT $ 65)))
          (EXIT
           (CONS (SPADCALL (QCAR |lunm|) (QREFELT $ 110))
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
                                                     (QREFELT $ 111))
                                           (QCDR |pp|))
                                          #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 115))))))) 

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
          (#1=#:G483 NIL)
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
          (|i| (|NonNegativeInteger|)) (#2=#:G488 NIL) (|x| NIL))
         (SEQ (LETT |factorlist| NIL) (LETT |pol1| (|spadConstant| $ 30))
              (SEQ (LETT |x| NIL) (LETT #2# |lvar|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT $ 206))
                                    (QREFELT $ 207)))
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| $ 30)
                                                       |x| |i| (QREFELT $ 208))
                                             (QREFELT $ 209)))
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT $ 210)) |i|)
                                     |factorlist|))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2 (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 102)))
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
                                         (QREFELT $ 115)))
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
         ((#1=#:G498 NIL) (|lumf| NIL) (#2=#:G497 NIL)
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
                 (SEQ (LETT |um1| (SPADCALL (ELT $ 211) |um| (QREFELT $ 214)))
                      (LETT |lum| (SPADCALL |um1| (QREFELT $ 201)))
                      (EXIT
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |lumf| NIL)
                             (LETT #1# (SPADCALL |lum| (QREFELT $ 198))) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |lumf| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL (ELT $ 111) (QVELT |lumf| 1)
                                                (QREFELT $ 217))
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
         ((#1=#:G509 NIL) (#2=#:G508 #3=(|Factored| PG)) (#4=#:G510 #3#)
          (#5=#:G517 NIL) (|u| NIL)
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
          (|var| (OV)) (|dx| #6=(|NonNegativeInteger|)) (#7=#:G505 NIL)
          (#8=#:G504 #6#) (#9=#:G506 #6#) (#10=#:G516 NIL) (#11=#:G105 NIL)
          (|ld| (|List| #6#)) (#12=#:G515 NIL) (|x| NIL) (#13=#:G514 NIL)
          (|lv| (|List| OV)))
         (SEQ (LETT |lv| (SPADCALL |m| (QREFELT $ 218)))
              (EXIT
               (COND
                ((SPADCALL |lv| NIL (QREFELT $ 219))
                 (SPADCALL |m| NIL (QREFELT $ 220)))
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
                                      (CONS (SPADCALL |m| |x| (QREFELT $ 221))
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
                        (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 84))
                                  (QREFELT $ 85)))
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
                                             (QCDR |u|) (QREFELT $ 222)))
                                      (COND
                                       (#1#
                                        (LETT #2#
                                              (SPADCALL #2# #4#
                                                        (QREFELT $ 223))))
                                       ('T
                                        (PROGN
                                         (LETT #2# #4#)
                                         (LETT #1# 'T)))))))
                                   (LETT #5# (CDR #5#)) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#1# #2#) (#14# (|spadConstant| $ 224))))
                             (QREFELT $ 225)))))))))) 

(DECLAIM (NOTINLINE |MultFiniteFactorize;|)) 

(DEFUN |MultFiniteFactorize| (&REST #1=#:G518)
  (SPROG NIL
         (PROG (#2=#:G519)
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
    (LETT $ (GETREFV 227))
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
              (137 . |leadingCoefficient|) (142 . ^) (148 . *) (154 . |One|)
              (158 . |exquo|) (|Record| (|:| |irr| 23) (|:| |pow| 13))
              (|Record| (|:| |cont| 8) (|:| |factors| (|List| 62)))
              (|DistinctDegreeFactorize| 8 23) (164 . |distdfact|)
              (170 . |coerce|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 23 9 37)
              (175 . |map|) (181 . |primeFactor|) (187 . *) (193 . |One|)
              (197 . |coerce|) (202 . |makeFR|) (|FactoringUtilities| 7 6 8 9)
              (208 . |variables|) (213 . |ground|) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 37 8 23)
              (218 . |map|) (|List| 13) (224 . |degree|) (|Integer|)
              (230 . |position|) (236 . |elt|) (242 . *)
              |MFINFACT;factor;SupF;4| (248 . |minimumDegree|)
              (254 . |squareFree|) (|Factored| 9) (259 . |unit|)
              (|Record| (|:| |flag| 49) (|:| |factor| 9) (|:| |exponent| 13))
              (|List| 92) (264 . |factorList|) (269 . |degree|) (275 . |One|)
              (279 . |member?|) (|SparseUnivariatePolynomial| $)
              (285 . |univariate|) (|List| $) (291 . |gcd|) (296 . |exquo|)
              (302 . ~=) (308 . ~=) (314 . |exquo|) (320 . |multivariate|)
              (326 . |leadingCoefficient|) (331 . ~=) (337 . |inv|)
              (342 . |coerce|) (347 . |coerce|) (352 . *)
              (|Record| (|:| |irr| 10) (|:| |pow| 13)) (|List| 113)
              (358 . |append|) (364 . |monomial|) (370 . |size|)
              (|PositiveInteger|) (374 . |index|) (379 . +) (|List| 138)
              (|GenExEuclid| 23 138) (385 . |testModulus|)
              (|FiniteFieldPolynomialPackage| 8)
              (391 . |createIrreduciblePoly|) (|Union| 23 '"failed")
              (396 . |nextIrreduciblePoly|) (|Mapping| 23 8)
              (|MPolyCatFunctions2| 6 7 (|IndexedExponents| 6) 8 23 9 10)
              (401 . |map|)
              (|Record| (|:| |polfac| 16) (|:| |correct| 23)
                        (|:| |corrfact| 121))
              (|Union| 131 '"failed")
              (|Record| (|:| |contp| 23) (|:| |factors| 114)) (|List| 23)
              (|LeadingCoefDetermination| 6 (|IndexedExponents| 6) 23 10)
              (407 . |distFact|) (417 . ~=) (|SparseUnivariatePolynomial| 23)
              (423 . |elt|) (429 . *) (|Union| (|List| 11) '"failed")
              (|MultivariateLifting| (|IndexedExponents| 6) 6 23 10)
              (435 . |lifting|) (446 . |primitivePart|) (451 . |retract|)
              (456 . |Zero|) (460 . |Zero|) (464 . |leadingMonomial|)
              (469 . |monomial|) (476 . +) (482 . |reductum|) (487 . |ground?|)
              (492 . |retract|) (497 . |univariate|) (503 . |Zero|) (507 . ~=)
              (513 . |degree|) (518 . |leadingCoefficient|) (523 . *) (529 . +)
              (535 . |reductum|) (540 . |ground?|) (545 . |retract|)
              (550 . |degree|) (555 . |monomial|) (562 . |reductum|)
              (567 . |random|) (571 . |delete|) (577 . |delete|)
              (583 . |degree|) (588 . =) (|List| 134) (594 . |member?|)
              (600 . |eval|) (607 . |unit?|)
              (|FactoringUtilities| (|IndexedExponents| 6) 6 23 10)
              (612 . |completeEval|) (619 . ~=) (625 . |minimumDegree|)
              (630 . |content|) (635 . |exquo|) (641 . |polCase|)
              (648 . |differentiate|) (653 . |differentiate|)
              (658 . |differentiate|) (663 . |differentiate|)
              (668 . |differentiate|) (|Mapping| 23 23) (673 . |map|)
              (679 . |gcd|) (684 . |leadingCoefficient|) (689 . |coefficients|)
              (|Factored| 138) (|TwoFactorize| 8) (694 . |tryTwoFactor|)
              (|Record| (|:| |flag| 49) (|:| |factor| 138) (|:| |exponent| 13))
              (|List| 196) (699 . |factorList|) (704 . |elt|) (710 . *)
              (716 . |generalTwoFactor|) (721 . |unit|) (726 . |retract|)
              (731 . *) (737 . >) (743 . |position|) (749 . |elt|)
              (755 . |monomial|) (762 . *) (768 . |coerce|) (773 . |ground|)
              (|Mapping| 23 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 11 23 138)
              (778 . |map|) (|Mapping| 10 23)
              (|UnivariatePolynomialCategoryFunctions2| 23 138 10 11)
              (784 . |map|) (790 . |variables|) (795 . =) (801 . |makeFR|)
              (807 . |degree|) (813 . |primeFactor|) (819 . *) (825 . |One|)
              (829 . *) |MFINFACT;factor;PGF;20|)
           '#(|factor| 835) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 226
                                                 '(1 11 0 10 12 1 11 13 0 14 1
                                                   11 10 0 15 1 11 16 0 17 1 10
                                                   18 0 19 2 18 0 0 0 20 0 7 0
                                                   21 0 8 0 22 0 23 0 24 1 11
                                                   13 0 25 2 13 26 0 0 27 0 8 0
                                                   28 0 9 0 29 0 10 0 30 2 11 0
                                                   10 13 31 2 11 32 0 0 33 2 35
                                                   0 0 0 36 2 39 37 38 11 40 1
                                                   37 41 0 42 1 43 37 0 44 2 46
                                                   11 45 37 47 1 11 26 0 48 1
                                                   43 51 0 52 1 11 10 0 53 2 10
                                                   13 0 6 54 1 11 10 0 55 1 10
                                                   26 0 56 1 10 23 0 57 2 23 0
                                                   0 13 58 2 23 0 0 0 59 0 23 0
                                                   60 2 23 32 0 0 61 2 64 63 23
                                                   26 65 1 9 0 8 66 2 68 37 67
                                                   23 69 2 43 0 37 13 70 2 43 0
                                                   0 0 71 0 43 0 72 1 37 0 9 73
                                                   2 43 0 37 51 74 1 75 18 37
                                                   76 1 9 8 0 77 2 79 23 78 37
                                                   80 2 75 81 37 18 82 2 81 83
                                                   13 0 84 2 18 6 0 83 85 2 43
                                                   0 37 0 86 2 10 81 0 18 88 1
                                                   9 41 0 89 1 90 9 0 91 1 90
                                                   93 0 94 2 10 81 0 18 95 0 11
                                                   0 96 2 81 26 13 0 97 2 10 98
                                                   0 6 99 1 10 0 100 101 2 10
                                                   32 0 0 102 2 6 26 0 0 103 2
                                                   10 26 0 0 104 2 11 32 0 10
                                                   105 2 10 0 98 6 106 1 23 8 0
                                                   107 2 8 26 0 0 108 1 8 0 0
                                                   109 1 23 0 8 110 1 10 0 23
                                                   111 2 11 0 10 0 112 2 114 0
                                                   0 0 115 2 23 0 8 13 116 0 8
                                                   13 117 1 8 0 118 119 2 23 0
                                                   0 0 120 2 122 26 23 121 123
                                                   1 124 23 118 125 1 124 126
                                                   23 127 2 129 10 128 9 130 6
                                                   135 132 23 121 133 134 18
                                                   134 136 2 23 26 0 0 137 2
                                                   121 138 0 83 139 2 138 0 23
                                                   0 140 7 142 141 11 18 121
                                                   134 16 81 23 143 1 11 0 0
                                                   144 1 10 23 0 145 0 9 0 146
                                                   0 10 0 147 1 10 0 0 148 3 9
                                                   0 0 18 81 149 2 9 0 0 0 150
                                                   1 10 0 0 151 1 9 26 0 152 1
                                                   9 8 0 153 2 9 98 0 6 154 0
                                                   37 0 155 2 37 26 0 0 156 1
                                                   37 13 0 157 1 37 9 0 158 2
                                                   10 0 23 0 159 2 10 0 0 0 160
                                                   1 37 0 0 161 1 23 26 0 162 1
                                                   23 8 0 163 1 23 13 0 164 3 9
                                                   0 0 6 13 165 1 23 0 0 166 0
                                                   8 0 167 2 81 0 0 83 168 2 18
                                                   0 0 83 169 1 138 13 0 170 2
                                                   16 26 0 0 171 2 172 26 134 0
                                                   173 3 10 0 0 18 134 174 1 23
                                                   26 0 175 3 176 138 11 18 134
                                                   177 2 13 26 0 0 178 1 138 13
                                                   0 179 1 138 23 0 180 2 138
                                                   32 0 23 181 3 135 26 23 13
                                                   134 182 1 138 0 0 183 1 8 0
                                                   0 184 1 37 0 0 185 1 23 0 0
                                                   186 1 11 0 0 187 2 138 0 188
                                                   0 189 1 138 0 100 190 1 138
                                                   23 0 191 1 138 134 0 192 1
                                                   194 193 138 195 1 193 197 0
                                                   198 2 197 196 0 83 199 2 83
                                                   0 118 0 200 1 194 193 138
                                                   201 1 193 138 0 202 1 138 23
                                                   0 203 2 23 0 8 0 204 2 83 26
                                                   0 0 205 2 18 83 6 0 206 2 81
                                                   13 0 83 207 3 10 0 0 6 13
                                                   208 2 10 0 0 0 209 1 10 0 6
                                                   210 1 10 23 0 211 2 213 138
                                                   212 11 214 2 216 11 215 138
                                                   217 1 9 18 0 218 2 18 26 0 0
                                                   219 2 90 0 9 93 220 2 9 13 0
                                                   6 221 2 90 0 9 13 222 2 90 0
                                                   0 0 223 0 90 0 224 2 90 0 9
                                                   0 225 1 0 43 37 87 1 0 90 9
                                                   226)))))
           '|lookupComplete|)) 
