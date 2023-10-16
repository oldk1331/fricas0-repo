
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
                                      (SPADCALL (QCAR |lff|) (QREFELT $ 12))
                                      (QCDR |lff|))
                                     #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
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
                 (|:| |pow| (|Integer|)))))))
        (SPROG
         ((#1=#:G197 NIL) (|lcfacs| #2=(|SparseUnivariatePolynomial| F))
          (#3=#:G193 NIL) (#4=#:G192 #2#) (#5=#:G194 #2#) (#6=#:G195 NIL)
          (#7=#:G212 NIL) (|f| NIL)
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
          (#11=#:G211 NIL) (|lfp| NIL) (#12=#:G210 NIL)
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (|ldeg| (|List| #13=(|NonNegativeInteger|))) (#14=#:G185 NIL)
          (#15=#:G184 #13#) (#16=#:G186 #13#) (#17=#:G209 NIL) (|fc| NIL)
          (#18=#:G208 NIL) (|xx| NIL) (#19=#:G207 NIL)
          (|coefs|
           (|List|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|ffcont|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|ffexp| #10#) (|ffactor| #9#) (#20=#:G206 NIL) (|fact| NIL)
          (|sqqfact| (|List| #8#)) (#21=#:G205 NIL) (|ff| NIL) (#22=#:G204 NIL)
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors| (|List| #8#))))
          (|lcont|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|sqfacs| (|Factored| (|SparseUnivariatePolynomial| PG)))
          (|om| (|SparseUnivariatePolynomial| PG)) (#23=#:G202 NIL)
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
          (#26=#:G152 NIL) (#27=#:G151 #25#) (#28=#:G153 #25#) (#29=#:G203 NIL)
          (|cf| NIL))
         (SEQ
          (EXIT
           (COND
            ((EQL (SPADCALL |um| (QREFELT $ 14)) 0)
             (|MFINFACT;convertPUP|
              (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT $ 15)) |var| |dx| $)
              $))
            (#30='T
             (SEQ
              (LETT |lvar|
                    (PROGN
                     (LETT #26# NIL . #31=(|MFINFACT;supFactor|))
                     (SEQ (LETT |cf| NIL . #31#)
                          (LETT #29# (SPADCALL |um| (QREFELT $ 17)) . #31#)
                          G190
                          (COND
                           ((OR (ATOM #29#)
                                (PROGN (LETT |cf| (CAR #29#) . #31#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #28# (SPADCALL |cf| (QREFELT $ 19)) . #31#)
                             (COND
                              (#26#
                               (LETT #27# (SPADCALL #27# #28# (QREFELT $ 20))
                                     . #31#))
                              ('T
                               (PROGN
                                (LETT #27# #28# . #31#)
                                (LETT #26# 'T . #31#)))))))
                          (LETT #29# (CDR #29#) . #31#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#26# #27#) (#30# (|IdentityError| '|setUnion|))))
                    . #31#)
              (LETT |flead| (CONS (|spadConstant| $ 24) NIL) . #31#)
              (LETT |factorlist| NIL . #31#)
              (LETT |mdeg| (SPADCALL |um| (QREFELT $ 25)) . #31#)
              (COND
               ((SPADCALL |mdeg| 0 (QREFELT $ 27))
                (SEQ
                 (LETT |f1|
                       (SPADCALL (|spadConstant| $ 30) |mdeg| (QREFELT $ 31))
                       . #31#)
                 (LETT |um|
                       (PROG2
                           (LETT #24# (SPADCALL |um| |f1| (QREFELT $ 33))
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
                        (CONS (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 31))
                              |mdeg|)
                        |factorlist|)
                       . #31#)
                 (EXIT
                  (COND
                   ((EQL (SPADCALL |um| (QREFELT $ 14)) 0)
                    (PROGN
                     (LETT #23#
                           (SEQ
                            (LETT |lfg|
                                  (|MFINFACT;convertPUP|
                                   (|MFINFACT;mFactor|
                                    (SPADCALL |um| (QREFELT $ 15)) |var| |dx|
                                    $)
                                   $)
                                  . #31#)
                            (EXIT
                             (CONS (QCAR |lfg|)
                                   (SPADCALL |factorlist| (QCDR |lfg|)
                                             (QREFELT $ 36)))))
                           . #31#)
                     (GO #33=#:G201))))))))
              (LETT |om|
                    (SPADCALL (CONS #'|MFINFACT;supFactor!0| (VECTOR $ |var|))
                              |um| (QREFELT $ 40))
                    . #31#)
              (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 42)) . #31#)
              (LETT |lcont|
                    (SPADCALL (CONS #'|MFINFACT;supFactor!1| (VECTOR $ |var|))
                              (SPADCALL |sqfacs| (QREFELT $ 44))
                              (QREFELT $ 47))
                    . #31#)
              (COND
               ((SPADCALL |lcont| (QREFELT $ 48))
                (LETT |flead|
                      (|MFINFACT;convertPUP|
                       (|MFINFACT;constantCase|
                        (SPADCALL |lcont| (QREFELT $ 15)) NIL $)
                       $)
                      . #31#))
               (#30#
                (LETT |flead| (|MFINFACT;supFactor| |lcont| |var| |dx| $)
                      . #31#)))
              (LETT |factorlist| (QCDR |flead|) . #31#)
              (LETT |sqqfact|
                    (PROGN
                     (LETT #22# NIL . #31#)
                     (SEQ (LETT |ff| NIL . #31#)
                          (LETT #21# (SPADCALL |sqfacs| (QREFELT $ 51)) . #31#)
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
                                           (VECTOR $ |var|))
                                     (QCAR |ff|) (QREFELT $ 47))
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
                        (LETT |ffcont| (SPADCALL |ffactor| (QREFELT $ 52))
                              . #31#)
                        (LETT |coefs| (SPADCALL |ffactor| (QREFELT $ 17))
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
                                                                       $ 53))
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
                         ((SPADCALL (SPADCALL |ffactor| (QREFELT $ 54))
                                    (QREFELT $ 55))
                          (LETT |lf|
                                (|MFINFACT;mfconst| |ffactor| |dx| |lvar|
                                 |ldeg| $)
                                . #31#))
                         ('T
                          (LETT |lf|
                                (|MFINFACT;mfpol| |ffactor| |var| |dx| |lvar|
                                 |ldeg| $)
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
                         (LETT |factorlist|
                               (SPADCALL |factorlist| |auxfl| (QREFELT $ 36))
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
                                     (SPADCALL (QCAR |f|) (QREFELT $ 54))
                                     (QREFELT $ 56))
                                    (PROG1 (LETT #6# (QCDR |f|) . #31#)
                                      (|check_subtype2| (>= #6# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #6#))
                                    (QREFELT $ 57))
                                   . #31#)
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 58))
                                     . #31#))
                              ('T
                               (PROGN
                                (LETT #4# #5# . #31#)
                                (LETT #3# 'T . #31#)))))))
                          (LETT #7# (CDR #7#) . #31#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#3# #4#) (#30# (|spadConstant| $ 59))))
                    . #31#)
              (EXIT
               (CONS
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |um| (QREFELT $ 54))
                                     (QREFELT $ 56))
                           |lcfacs| (QREFELT $ 60))
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
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1) . #1=(|MFINFACT;supFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |var| $))))) 

(SDEFUN |MFINFACT;supFactor!1| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1) . #1=(|MFINFACT;supFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |var| $))))) 

(SDEFUN |MFINFACT;supFactor!0| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1) . #1=(|MFINFACT;supFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushup| |p1| |var| $))))) 

(SDEFUN |MFINFACT;factor;SupF;3|
        ((|um| |SparseUnivariatePolynomial| PG)
         ($ |Factored| (|SparseUnivariatePolynomial| PG)))
        (SPROG
         ((#1=#:G219 NIL)
          (#2=#:G218 #3=(|Factored| (|SparseUnivariatePolynomial| PG)))
          (#4=#:G220 #3#) (#5=#:G225 NIL) (|u| NIL)
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
          (|var| (OV)) (|dx| #6=(|NonNegativeInteger|)) (#7=#:G214 NIL)
          (#8=#:G213 #6#) (#9=#:G215 #6#) (#10=#:G224 NIL) (#11=#:G104 NIL)
          (|ld| (|List| #6#)) (|lv| (|List| OV)))
         (SEQ
          (LETT |lv| (SPADCALL |um| (QREFELT $ 62))
                . #12=(|MFINFACT;factor;SupF;3|))
          (LETT |ld| (SPADCALL |um| |lv| (QREFELT $ 64)) . #12#)
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
          (LETT |var|
                (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 66))
                          (QREFELT $ 67))
                . #12#)
          (LETT |cm|
                (SPADCALL (CONS #'|MFINFACT;factor;SupF;3!0| (VECTOR $ |var|))
                          |um| (QREFELT $ 47))
                . #12#)
          (LETT |flist| (|MFINFACT;supFactor| |cm| |var| |dx| $) . #12#)
          (EXIT
           (SPADCALL
            (SPADCALL (|MFINFACT;pushupconst| (QCAR |flist|) |var| $)
                      (QREFELT $ 68))
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
                                   (VECTOR $ |var|))
                             (QCAR |u|) (QREFELT $ 40))
                            (QCDR |u|) (QREFELT $ 69))
                           . #12#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 70)) . #12#))
                      ('T
                       (PROGN (LETT #2# #4# . #12#) (LETT #1# 'T . #12#)))))))
                  (LETT #5# (CDR #5#) . #12#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#13# (|spadConstant| $ 71))))
            (QREFELT $ 72)))))) 

(SDEFUN |MFINFACT;factor;SupF;3!1| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1) . #1=(|MFINFACT;factor;SupF;3|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushup| |p1| |var| $))))) 

(SDEFUN |MFINFACT;factor;SupF;3!0| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1) . #1=(|MFINFACT;factor;SupF;3|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
          (#1=#:G275 NIL) (|lfp| NIL) (#2=#:G274 NIL)
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (|um|
           #3=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                               OV)))
          (|lcum| (F)) (|ldeg| (|List| (|NonNegativeInteger|))) (#4=#:G273 NIL)
          (|lcterm| NIL)
          (|ffactor|
           #5=(|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                              OV))
          (#6=#:G247 NIL)
          (|pc|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|lvar| (|List| OV)) (|x| (OV))
          (|varch|
           (|Record| (|:| |npol| #3#) (|:| |nvar| (|List| OV))
                     (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
          (#7=#:G272 NIL) (#8=#:G241 NIL)
          (|lcont|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (#9=#:G271 NIL) (|lterm| NIL) (|ffexp| #10=(|Integer|))
          (#11=#:G270 NIL) (|fact| NIL)
          (|sqqfact|
           (|List| (|Record| (|:| |factor| #5#) (|:| |exponent| #10#))))
          (#12=#:G269 NIL) (|ff| NIL) (#13=#:G268 NIL)
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|Integer|)))))))
          (|sqfacs| (|Factored| PG)) (|om| (PG)) (#14=#:G229 NIL)
          (#15=#:G228 #16=(|Boolean|)) (#17=#:G230 #16#) (#18=#:G267 NIL)
          (|n| NIL) (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL |m| (QREFELT $ 55)) (|MFINFACT;constantCase| |m| NIL $))
           (#19='T
            (SEQ
             (LETT |lvar| (SPADCALL |m| (QREFELT $ 19))
                   . #20=(|MFINFACT;mFactor|))
             (LETT |flead| (CONS (|spadConstant| $ 59) NIL) . #20#)
             (LETT |factorlist| NIL . #20#)
             (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 74)) . #20#)
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
                         (LETT #17# (SPADCALL |n| 0 (QREFELT $ 27)) . #20#)
                         (COND
                          (#14# (LETT #15# (COND (#15# 'T) ('T #17#)) . #20#))
                          ('T
                           (PROGN
                            (LETT #15# #17# . #20#)
                            (LETT #14# 'T . #20#)))))))
                      (LETT #18# (CDR #18#) . #20#) (GO G190) G191 (EXIT NIL))
                 (COND (#14# #15#) (#19# NIL)))
                (|MFINFACT;simplify| |m| |var| |dx| |lvar| |lmdeg| $))
               (#19#
                (SEQ (LETT |om| (|MFINFACT;pushup| |m| |var| $) . #20#)
                     (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 75)) . #20#)
                     (LETT |lcont|
                           (|MFINFACT;pushdown|
                            (SPADCALL |sqfacs| (QREFELT $ 77)) |var| $)
                           . #20#)
                     (COND
                      ((SPADCALL |lcont| (QREFELT $ 55))
                       (LETT |flead| (|MFINFACT;constantCase| |lcont| NIL $)
                             . #20#))
                      (#19#
                       (LETT |flead| (|MFINFACT;mFactor| |lcont| |var| |dx| $)
                             . #20#)))
                     (LETT |factorlist| (QCDR |flead|) . #20#)
                     (LETT |sqqfact|
                           (PROGN
                            (LETT #13# NIL . #20#)
                            (SEQ (LETT |ff| NIL . #20#)
                                 (LETT #12# (SPADCALL |sqfacs| (QREFELT $ 80))
                                       . #20#)
                                 G190
                                 (COND
                                  ((OR (ATOM #12#)
                                       (PROGN
                                        (LETT |ff| (CAR #12#) . #20#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #13#
                                         (CONS
                                          (CONS
                                           (|MFINFACT;pushdown| (QCAR |ff|)
                                            |var| $)
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
                                 ((SPADCALL |ffactor| (QREFELT $ 55))
                                  (SEQ (LETT |lterm| NIL . #20#)
                                       (LETT #9#
                                             (QCDR
                                              (|MFINFACT;constantCase|
                                               |ffactor| NIL $))
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
                                                      (* (QCDR |lterm|)
                                                         |ffexp|))
                                                |factorlist|)
                                               . #20#)))
                                       (LETT #9# (CDR #9#) . #20#) (GO G190)
                                       G191 (EXIT NIL)))
                                 ('T
                                  (SEQ
                                   (LETT |lvar|
                                         (SPADCALL |ffactor| (QREFELT $ 19))
                                         . #20#)
                                   (LETT |x| (SPADCALL |lvar| 1 (QREFELT $ 67))
                                         . #20#)
                                   (LETT |ldeg|
                                         (SPADCALL |ffactor| |lvar|
                                                   (QREFELT $ 81))
                                         . #20#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL 1 |ldeg| (QREFELT $ 83))
                                      (SEQ
                                       (LETT |x|
                                             (SPADCALL |lvar|
                                                       (SPADCALL 1 |ldeg|
                                                                 (QREFELT $
                                                                          66))
                                                       (QREFELT $ 67))
                                             . #20#)
                                       (LETT |lcont|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |ffactor| |x|
                                                         (QREFELT $ 85))
                                               (QREFELT $ 17))
                                              (QREFELT $ 87))
                                             . #20#)
                                       (LETT |ffactor|
                                             (PROG2
                                                 (LETT #8#
                                                       (SPADCALL |ffactor|
                                                                 |lcont|
                                                                 (QREFELT $
                                                                          88))
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
                                                                  (QREFELT $
                                                                           8))
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
                                                     |var| |dx| $))
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
                                             (LETT #7# (CDR #7#) . #20#)
                                             (GO G190) G191 (EXIT NIL)))))
                                     ('T
                                      (SEQ
                                       (LETT |varch|
                                             (|MFINFACT;varChoose| |ffactor|
                                              |lvar| |ldeg| $)
                                             . #20#)
                                       (LETT |um| (QVELT |varch| 0) . #20#)
                                       (LETT |ldeg| (CDR |ldeg|) . #20#)
                                       (LETT |lvar| (CDR |lvar|) . #20#)
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL (QVELT |varch| 1) 1
                                                    (QREFELT $ 67))
                                          |x| (QREFELT $ 89))
                                         (SEQ
                                          (LETT |lvar| (QVELT |varch| 1)
                                                . #20#)
                                          (LETT |x|
                                                (SPADCALL |lvar| 1
                                                          (QREFELT $ 67))
                                                . #20#)
                                          (LETT |lvar| (CDR |lvar|) . #20#)
                                          (LETT |pc|
                                                (SPADCALL
                                                 (SPADCALL |um| (QREFELT $ 17))
                                                 (QREFELT $ 87))
                                                . #20#)
                                          (COND
                                           ((SPADCALL |pc|
                                                      (|spadConstant| $ 30)
                                                      (QREFELT $ 90))
                                            (SEQ
                                             (LETT |um|
                                                   (PROG2
                                                       (LETT #6#
                                                             (SPADCALL |um|
                                                                       |pc|
                                                                       (QREFELT
                                                                        $ 91))
                                                             . #20#)
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
                                                      #6#))
                                                   . #20#)
                                             (LETT |ffactor|
                                                   (SPADCALL |um| |x|
                                                             (QREFELT $ 92))
                                                   . #20#)
                                             (EXIT
                                              (SEQ (LETT |lcterm| NIL . #20#)
                                                   (LETT #4#
                                                         (QCDR
                                                          (|MFINFACT;mFactor|
                                                           |pc| |var| |dx| $))
                                                         . #20#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #4#)
                                                         (PROGN
                                                          (LETT |lcterm|
                                                                (CAR #4#)
                                                                . #20#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |factorlist|
                                                           (CONS
                                                            (CONS
                                                             (QCAR |lcterm|)
                                                             (* (QCDR |lcterm|)
                                                                |ffexp|))
                                                            |factorlist|)
                                                           . #20#)))
                                                   (LETT #4# (CDR #4#) . #20#)
                                                   (GO G190) G191
                                                   (EXIT NIL))))))
                                          (EXIT
                                           (LETT |ldeg|
                                                 (SPADCALL |ffactor| |lvar|
                                                           (QREFELT $ 81))
                                                 . #20#)))))
                                       (LETT |lcum|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |um| (QREFELT $ 54))
                                               (QREFELT $ 56))
                                              (QREFELT $ 93))
                                             . #20#)
                                       (COND
                                        ((SPADCALL |lcum| (|spadConstant| $ 28)
                                                   (QREFELT $ 94))
                                         (SEQ
                                          (LETT |um|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |lcum|
                                                             (QREFELT $ 95))
                                                   (QREFELT $ 96))
                                                  (QREFELT $ 97))
                                                 |um| (QREFELT $ 98))
                                                . #20#)
                                          (EXIT
                                           (PROGN
                                            (RPLACA |flead|
                                                    (SPADCALL
                                                     (SPADCALL |lcum|
                                                               (QREFELT $ 96))
                                                     (QCAR |flead|)
                                                     (QREFELT $ 58)))
                                            (QCAR |flead|))))))
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL |um| (QREFELT $ 54))
                                          (QREFELT $ 55))
                                         (LETT |lf|
                                               (|MFINFACT;mfconst| |um| |dx|
                                                |lvar| |ldeg| $)
                                               . #20#))
                                        ('T
                                         (LETT |lf|
                                               (|MFINFACT;mfpol| |um| |var|
                                                |dx| |lvar| |ldeg| $)
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
                                                             (SPADCALL |lfp|
                                                                       |x|
                                                                       (QREFELT
                                                                        $ 92))
                                                             |ffexp|)
                                                            #2#)
                                                           . #20#)))
                                                   (LETT #1# (CDR #1#) . #20#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #2#))))
                                             . #20#)
                                       (EXIT
                                        (LETT |factorlist|
                                              (SPADCALL |factorlist| |auxfl|
                                                        (QREFELT $ 101))
                                              . #20#)))))))))))
                          (LETT #11# (CDR #11#) . #20#) (GO G190) G191
                          (EXIT NIL))
                     (PROGN (RPLACD |flead| |factorlist|) (QCDR |flead|))
                     (EXIT |flead|))))))))))) 

(SDEFUN |MFINFACT;pM|
        ((|lum| |List|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G296 NIL) (|p| (|SparseUnivariatePolynomial| F))
          (#2=#:G286 NIL)
          (|q| (|Union| (|SparseUnivariatePolynomial| F) #3="failed"))
          (#4=#:G284 NIL) (|e| NIL) (#5=#:G295 NIL) (#6=#:G280 NIL)
          (#7=#:G297 NIL) (|i| NIL) (|x| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |x| (SPADCALL (|spadConstant| $ 28) 1 (QREFELT $ 102))
                  . #8=(|MFINFACT;pM|))
            (SEQ (LETT |i| 1 . #8#) (LETT #7# (SPADCALL (QREFELT $ 103)) . #8#)
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
                                      (QREFELT $ 105))
                                     (QREFELT $ 96))
                                    (QREFELT $ 106))
                          . #8#)
                    (EXIT
                     (COND
                      ((SPADCALL |p| |lum| (QREFELT $ 109))
                       (PROGN
                        (LETT #5# (PROGN (LETT #1# |p| . #8#) (GO #9=#:G294))
                              . #8#)
                        (GO #10=#:G281)))))))
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
                          (QREFELT $ 111))
                         . #8#)
                   (EXIT
                    (COND
                     ((SPADCALL |p| |lum| (QREFELT $ 109))
                      (PROGN (LETT #1# |p| . #8#) (GO #9#)))
                     ('T
                      (SEQ G190
                           (COND
                            ((NULL
                              (SEQ
                               (LETT |q| (SPADCALL |p| (QREFELT $ 113)) . #8#)
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
                              ((SPADCALL |p| |lum| (QREFELT $ 109))
                               (PROGN (LETT #1# |p| . #8#) (GO #9#))))))
                           NIL (GO G190) G191 (EXIT NIL))))))
                  (LETT |e| (|inc_SI| |e|) . #8#) (GO G190) G191 (EXIT NIL)))))
          #9# (EXIT #1#)))) 

(SDEFUN |MFINFACT;pushdcoef|
        ((|t| PG)
         ($ |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV))
        (SPADCALL (ELT $ 96) |t| (QREFELT $ 116))) 

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
          (#1=#:G343 NIL) (|ff| NIL) (#2=#:G342 NIL)
          (|ffin|
           (|Union|
            (|List|
             (|SparseUnivariatePolynomial|
              (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                              OV)))
            "failed"))
          (#3=#:G320 NIL)
          (|unifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#4=#:G341 NIL) (|i| NIL) (#5=#:G340 NIL)
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
          (#6=#:G337 NIL)
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
          (#7=#:G339 NIL) (#8=#:G338 NIL) (|polcase| (|Boolean|)))
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
                    (|MFINFACT;intChoose| |um| |lvar| (|spadConstant| $ 59) NIL
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
                                                |lval| (QREFELT $ 122))
                                      . #9#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |distf| 1)
                                   (PROGN
                                    (LETT #6#
                                          (|MFINFACT;intfact| |um| |lvar|
                                           |ldeg| |tleadpol| |ltry| $)
                                          . #9#)
                                    (GO #11=#:G336)))
                                  (#10#
                                   (SEQ (LETT |dist| (QCDR |distf|) . #9#)
                                        (LETT |lpol| (QVELT |dist| 0) . #9#)
                                        (LETT |dd| (QVELT |dist| 1) . #9#)
                                        (EXIT
                                         (LETT |unifact| (QVELT |dist| 2)
                                               . #9#)))))))))
                         (COND
                          ((SPADCALL |dd| (|spadConstant| $ 59)
                                     (QREFELT $ 123))
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
                                                                              125))
                                                           (QREFELT $ 126))
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
                                               (QREFELT $ 57))
                                     (QREFELT $ 97))
                                    |um| (QREFELT $ 98))
                                   . #9#)))))
                         (LETT |ffin|
                               (SPADCALL |um| |lvar| |unifact| |lval| |lpol|
                                         |ldeg| (|MFINFACT;pM| |unifact| $)
                                         (QREFELT $ 129))
                               . #9#)
                         (EXIT
                          (COND
                           ((QEQCAR |ffin| 1)
                            (|MFINFACT;intfact| |um| |lvar| |ldeg| |tleadpol|
                             |ltry| $))
                           (#10#
                            (SEQ (LETT |factfin| (QCDR |ffin|) . #9#)
                                 (COND
                                  ((SPADCALL |dd| (|spadConstant| $ 59)
                                             (QREFELT $ 123))
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
                                                                           130))
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
           ((SPADCALL |f| (QREFELT $ 55))
            (|MFINFACT;pushupconst| (SPADCALL |f| (QREFELT $ 131)) |x| $))
           ('T
            (SEQ (LETT |rr| (|spadConstant| $ 132) . #1=(|MFINFACT;pushup|))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |f| (|spadConstant| $ 133) (QREFELT $ 90)))
                        (GO G191)))
                      (SEQ (LETT |lf| (SPADCALL |f| (QREFELT $ 134)) . #1#)
                           (LETT |cf|
                                 (|MFINFACT;pushupconst|
                                  (SPADCALL |f| (QREFELT $ 56)) |x| $)
                                 . #1#)
                           (LETT |lvf| (SPADCALL |lf| (QREFELT $ 19)) . #1#)
                           (LETT |rr|
                                 (SPADCALL |rr|
                                           (SPADCALL |cf| |lvf|
                                                     (SPADCALL |lf| |lvf|
                                                               (QREFELT $ 81))
                                                     (QREFELT $ 135))
                                           (QREFELT $ 136))
                                 . #1#)
                           (EXIT
                            (LETT |f| (SPADCALL |f| (QREFELT $ 137)) . #1#)))
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
           ((SPADCALL |g| (QREFELT $ 138))
            (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 139)) (QREFELT $ 96))
                      (QREFELT $ 97)))
           ('T
            (SEQ (LETT |rf| (|spadConstant| $ 133) . #1=(|MFINFACT;pushdown|))
                 (LETT |ug| (SPADCALL |g| |x| (QREFELT $ 140)) . #1#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |ug| (|spadConstant| $ 141)
                                   (QREFELT $ 142)))
                        (GO G191)))
                      (SEQ
                       (LETT |cf|
                             (SPADCALL (|spadConstant| $ 28)
                                       (SPADCALL |ug| (QREFELT $ 143))
                                       (QREFELT $ 102))
                             . #1#)
                       (LETT |rf|
                             (SPADCALL |rf|
                                       (SPADCALL |cf|
                                                 (|MFINFACT;pushdcoef|
                                                  (SPADCALL |ug|
                                                            (QREFELT $ 144))
                                                  $)
                                                 (QREFELT $ 145))
                                       (QREFELT $ 146))
                             . #1#)
                       (EXIT
                        (LETT |ug| (SPADCALL |ug| (QREFELT $ 147)) . #1#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rf|))))))) 

(SDEFUN |MFINFACT;pushupconst|
        ((|r| |SparseUnivariatePolynomial| F) (|x| OV) ($ PG))
        (SPROG ((|rr| (PG)))
               (SEQ
                (COND
                 ((SPADCALL |r| (QREFELT $ 148))
                  (SPADCALL (SPADCALL |r| (QREFELT $ 149)) (QREFELT $ 150)))
                 ('T
                  (SEQ
                   (LETT |rr| (|spadConstant| $ 132)
                         . #1=(|MFINFACT;pushupconst|))
                   (SEQ G190
                        (COND
                         ((NULL
                           (SPADCALL |r| (|spadConstant| $ 24)
                                     (QREFELT $ 123)))
                          (GO G191)))
                        (SEQ
                         (LETT |rr|
                               (SPADCALL |rr|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |r| (QREFELT $ 93))
                                           (QREFELT $ 150))
                                          |x| (SPADCALL |r| (QREFELT $ 151))
                                          (QREFELT $ 152))
                                         (QREFELT $ 136))
                               . #1#)
                         (EXIT
                          (LETT |r| (SPADCALL |r| (QREFELT $ 153)) . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |rr|))))))) 

(SDEFUN |MFINFACT;ran| ((|k1| |Integer|) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G360 NIL) (#2=#:G359 #3=(|SparseUnivariatePolynomial| F))
          (#4=#:G361 #3#) (#5=#:G363 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|MFINFACT;ran|))
           (SEQ (LETT |i| 0 . #6#) (LETT #5# |k1| . #6#) G190
                (COND ((|greater_SI| |i| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (SPADCALL (QREFELT $ 154)) |i|
                                   (QREFELT $ 102))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 106)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
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
         ((|x| (OV)) (|i| (|Integer|)) (|k| #1#) (#2=#:G366 NIL)
          (#3=#:G365 #1#) (#4=#:G367 #1#) (#5=#:G371 NIL) (|d| NIL))
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
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 53)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 85)) |lvar|
                     |ldeg|))
            (#7#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 66)) . #6#)
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 67)) . #6#)
                  (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 155)))
                        . #6#)
                  (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 156)))
                        . #6#)
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT $ 85)) |lvar|
                           |ldeg|))))))))) 

(SDEFUN |MFINFACT;norm|
        ((|lum| |List|
          (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
         ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G373 NIL) (#3=#:G372 #1#) (#4=#:G374 #1#) (#5=#:G376 NIL)
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
                   (LETT #4# (SPADCALL |lup| (QREFELT $ 157)) . #6#)
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
          (#3=#:G459 NIL) (|uf| NIL) (#4=#:G458 NIL)
          (|leadtest| #5=(|Boolean|)) (#6=#:G457 NIL) (#7=#:G456 NIL)
          (#8=#:G441 NIL) (#9=#:G455 NIL) (#10=#:G454 NIL) (#11=#:G453 NIL)
          (#12=#:G452 NIL) (#13=#:G451 NIL) (|ff| NIL) (#14=#:G450 NIL)
          (#15=#:G449 NIL) (#16=#:G448 NIL) (|lffc1| #2#)
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
          (|dx| #17=(|NonNegativeInteger|)) (#18=#:G402 NIL) (#19=#:G401 #17#)
          (#20=#:G403 #17#) (#21=#:G447 NIL) (|uc| NIL)
          (|newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|lcnm| (F)) (|range| (|NonNegativeInteger|))
          (|D2newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|Dnewm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#22=#:G387 NIL) (#23=#:G381 NIL) (#24=#:G380 #25=(|Boolean|))
          (#26=#:G382 #25#) (#27=#:G446 NIL) (|epl| NIL) (|leadcomp1| #1#)
          (#28=#:G445 NIL) (|pol| NIL) (#29=#:G444 NIL)
          (|lval| (|List| (|SparseUnivariatePolynomial| F))) (#30=#:G443 NIL)
          (|i| NIL) (#31=#:G442 NIL)
          (|newunifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|testp| #5#) (|ctf1| #2#) (|nvar1| (|NonNegativeInteger|))
          (|degum| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degum| (SPADCALL |um| (QREFELT $ 14))
                . #32=(|MFINFACT;intChoose|))
          (LETT |nvar1| (LENGTH |lvar|) . #32#) (LETT |range| 0 . #32#)
          (LETT |ctf1| (|spadConstant| $ 59) . #32#)
          (LETT |testp| (NULL (SPADCALL |plist| NIL (QREFELT $ 158))) . #32#)
          (LETT |leadcomp| (LETT |leadcomp1| NIL . #32#) . #32#)
          (LETT |nfatt| (+ |degum| 1) . #32#)
          (LETT |lffc| (|spadConstant| $ 59) . #32#)
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
                    ((SPADCALL |lval| |ltry| (QREFELT $ 160))
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
                                                          (QREFELT $ 161))
                                                (QREFELT $ 131))
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
                                             (SPADCALL |epl| (QREFELT $ 162))
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
                                (SPADCALL |um| |lvar| |lval| (QREFELT $ 164))
                                . #32#)
                          (COND
                           ((OR
                             (SPADCALL |degum|
                                       (SPADCALL |newm| (QREFELT $ 157))
                                       (QREFELT $ 165))
                             (SPADCALL (SPADCALL |newm| (QREFELT $ 166)) 0
                                       (QREFELT $ 165)))
                            (EXIT (LETT |range| (+ |range| 1) . #32#))))
                          (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 167))
                                . #32#)
                          (LETT |newm|
                                (PROG2
                                    (LETT #22#
                                          (SPADCALL |newm| |lffc1|
                                                    (QREFELT $ 168))
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
                                  (SPADCALL |lffc1| |clc| (QREFELT $ 58))
                                  (LENGTH |plist|) |leadcomp1|
                                  (QREFELT $ 169)))
                                (EXIT
                                 (LETT |range| (+ |range| 1) . #32#))))))))
                          (LETT |Dnewm| (SPADCALL |newm| (QREFELT $ 170))
                                . #32#)
                          (LETT |D2newm|
                                (SPADCALL (ELT $ 172) |newm| (QREFELT $ 175))
                                . #32#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (SPADCALL
                               (SPADCALL (LIST |newm| |Dnewm| |D2newm|)
                                         (QREFELT $ 176))
                               (QREFELT $ 157))
                              0 (QREFELT $ 165))
                             (LETT |range| (+ |range| 1) . #32#))
                            ('T
                             (SEQ (LETT |lcnm| (|spadConstant| $ 28) . #32#)
                                  (COND
                                   ((SPADCALL
                                     (LETT |lcnm|
                                           (SPADCALL
                                            (SPADCALL |newm| (QREFELT $ 177))
                                            (QREFELT $ 93))
                                           . #32#)
                                     (|spadConstant| $ 28) (QREFELT $ 94))
                                    (LETT |newm|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |lcnm| (QREFELT $ 95))
                                            (QREFELT $ 96))
                                           |newm| (QREFELT $ 126))
                                          . #32#)))
                                  (LETT |dx|
                                        (PROGN
                                         (LETT #18# NIL . #32#)
                                         (SEQ (LETT |uc| NIL . #32#)
                                              (LETT #21#
                                                    (SPADCALL |newm|
                                                              (QREFELT $ 178))
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
                                                                          151))
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
                                        (SPADCALL |newm| (QREFELT $ 181))
                                        . #32#)
                                  (LETT |nfl|
                                        (SPADCALL |luniv| (QREFELT $ 185))
                                        . #32#)
                                  (LETT |nf| (LENGTH |nfl|) . #32#)
                                  (COND
                                   ((OR (EQL |nf| 0)
                                        (SPADCALL |nf| |nfatt| (QREFELT $ 27)))
                                    (EXIT "next values")))
                                  (COND
                                   ((EQL |nf| 1)
                                    (COND
                                     ((QEQCAR
                                       (QVELT
                                        (SPADCALL |nfl| 1 (QREFELT $ 186)) 0)
                                       0)
                                      (SEQ
                                       (LETT |base_failure|
                                             (+ |base_failure| 1) . #32#)
                                       (LETT |skip|
                                             (< |base_failure|
                                                (+
                                                 (SPADCALL 3 |base_success|
                                                           (QREFELT $ 187))
                                                 3))
                                             . #32#)
                                       (EXIT
                                        (LETT |luniv|
                                              (COND (|skip| |luniv|)
                                                    ('T
                                                     (SPADCALL |newm|
                                                               (QREFELT $
                                                                        188))))
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
                                                           (QREFELT $ 191))
                                                 . #32#)
                                           (LETT |nf| (LENGTH |lunivf|) . #32#)
                                           (COND
                                            ((OR (EQL |nf| 0)
                                                 (SPADCALL |nf| |nfatt|
                                                           (QREFELT $ 27)))
                                             (EXIT "next values")))
                                           (COND
                                            ((EQL |nf| 1)
                                             (SEQ
                                              (LETT |unifact| (LIST |newm|)
                                                    . #32#)
                                              (EXIT
                                               (PROGN
                                                (LETT #8# |$NoValue| . #32#)
                                                (GO #33=#:G438))))))
                                           (LETT |lffc1|
                                                 (SPADCALL
                                                  (SPADCALL |lcnm|
                                                            (SPADCALL
                                                             (SPADCALL |luniv|
                                                                       (QREFELT
                                                                        $ 192))
                                                             (QREFELT $ 193))
                                                            (QREFELT $ 194))
                                                  |lffc1| (QREFELT $ 58))
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
                                                  (QREFELT $ 195))
                                                 (COND
                                                  (|testp|
                                                   (COND
                                                    ((SPADCALL
                                                      (SPADCALL |lffc1| |clc|
                                                                (QREFELT $ 58))
                                                      (LENGTH |plist|)
                                                      |leadcomp1|
                                                      (QREFELT $ 169))
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
                                                        (QREFELT $ 27))
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
                                                        (QREFELT $ 27))
                                              (SEQ
                                               (COND
                                                (|testp|
                                                 (LETT |leadtest|
                                                       (NULL
                                                        (SPADCALL
                                                         (SPADCALL |lffc| |clc|
                                                                   (QREFELT $
                                                                            58))
                                                         (LENGTH |plist|)
                                                         |leadcomp|
                                                         (QREFELT $ 169)))
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
         ((#1=#:G467 NIL) (|pp| NIL) (#2=#:G466 NIL)
          (|lunm|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| F))
                            (|:| |pow| (|Integer|))))))))
         (SEQ
          (LETT |lunm|
                (SPADCALL (SPADCALL |m| (QREFELT $ 131)) NIL (QREFELT $ 199))
                . #3=(|MFINFACT;constantCase|))
          (EXIT
           (CONS (SPADCALL (QCAR |lunm|) (QREFELT $ 96))
                 (SPADCALL |factorlist|
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
                                           (SPADCALL (QCAR |pp|)
                                                     (QREFELT $ 97))
                                           (QCDR |pp|))
                                          #2#)
                                         . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 101))))))) 

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
          (#1=#:G473 NIL)
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
          (|i| (|NonNegativeInteger|)) (#2=#:G478 NIL) (|x| NIL))
         (SEQ (LETT |factorlist| NIL . #3=(|MFINFACT;simplify|))
              (LETT |pol1| (|spadConstant| $ 30) . #3#)
              (SEQ (LETT |x| NIL . #3#) (LETT #2# |lvar| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT $ 200))
                                    (QREFELT $ 201))
                          . #3#)
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| $ 30)
                                                       |x| |i| (QREFELT $ 202))
                                             (QREFELT $ 203))
                                   . #3#)
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT $ 204)) |i|)
                                     |factorlist|)
                                    . #3#)))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2
                        (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 88)) . #3#)
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
                ((SPADCALL |m| (QREFELT $ 55))
                 (|MFINFACT;constantCase| |m| |factorlist| $))
                ('T
                 (SEQ
                  (LETT |flead| (|MFINFACT;mFactor| |m| |var| |dm| $) . #3#)
                  (PROGN
                   (RPLACD |flead|
                           (SPADCALL |factorlist| (QCDR |flead|)
                                     (QREFELT $ 101)))
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
         ((#1=#:G488 NIL) (|lumf| NIL) (#2=#:G487 NIL)
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
                  (LETT |um1| (SPADCALL (ELT $ 205) |um| (QREFELT $ 208))
                        . #3#)
                  (LETT |lum| (SPADCALL |um1| (QREFELT $ 188)) . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |lumf| NIL . #3#)
                         (LETT #1# (SPADCALL |lum| (QREFELT $ 191)) . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |lumf| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL (ELT $ 97) (QCAR |lumf|)
                                            (QREFELT $ 211))
                                  #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
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
                            (|:| |pow| (|Integer|))))))))
         (SEQ
          (LETT |tleadpol|
                (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT $ 54)) |var| |dm|
                 $)
                |MFINFACT;mfpol|)
          (EXIT (|MFINFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL $))))) 

(SDEFUN |MFINFACT;factor;PGF;19| ((|m| PG) ($ |Factored| PG))
        (SPROG
         ((#1=#:G499 NIL) (#2=#:G498 #3=(|Factored| PG)) (#4=#:G500 #3#)
          (#5=#:G507 NIL) (|u| NIL)
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
          (|var| (OV)) (|dx| #6=(|NonNegativeInteger|)) (#7=#:G495 NIL)
          (#8=#:G494 #6#) (#9=#:G496 #6#) (#10=#:G506 NIL) (#11=#:G105 NIL)
          (|ld| (|List| #6#)) (#12=#:G505 NIL) (|x| NIL) (#13=#:G504 NIL)
          (|lv| (|List| OV)))
         (SEQ
          (LETT |lv| (SPADCALL |m| (QREFELT $ 212))
                . #14=(|MFINFACT;factor;PGF;19|))
          (EXIT
           (COND
            ((SPADCALL |lv| NIL (QREFELT $ 213))
             (SPADCALL |m| NIL (QREFELT $ 216)))
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
                                  (CONS (SPADCALL |m| |x| (QREFELT $ 217))
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
              (LETT |var|
                    (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 66))
                              (QREFELT $ 67))
                    . #14#)
              (LETT |cm| (|MFINFACT;pushdown| |m| |var| $) . #14#)
              (LETT |flist| (|MFINFACT;mFactor| |cm| |var| |dx| $) . #14#)
              (EXIT
               (SPADCALL (|MFINFACT;pushupconst| (QCAR |flist|) |var| $)
                         (PROGN
                          (LETT #1# NIL . #14#)
                          (SEQ (LETT |u| NIL . #14#)
                               (LETT #5# (QCDR |flist|) . #14#) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |u| (CAR #5#) . #14#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #4#
                                        (SPADCALL
                                         (|MFINFACT;pushup| (QCAR |u|) |var| $)
                                         (QCDR |u|) (QREFELT $ 218))
                                        . #14#)
                                  (COND
                                   (#1#
                                    (LETT #2#
                                          (SPADCALL #2# #4# (QREFELT $ 219))
                                          . #14#))
                                   ('T
                                    (PROGN
                                     (LETT #2# #4# . #14#)
                                     (LETT #1# 'T . #14#)))))))
                               (LETT #5# (CDR #5#) . #14#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#1# #2#) (#15# (|spadConstant| $ 220))))
                         (QREFELT $ 221)))))))))) 

(DECLAIM (NOTINLINE |MultFiniteFactorize;|)) 

(DEFUN |MultFiniteFactorize| (&REST #1=#:G508)
  (SPROG NIL
         (PROG (#2=#:G509)
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
    (LETT $ (GETREFV 223) . #1#)
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
              (72 . |exquo|) (|Record| (|:| |irr| 11) (|:| |pow| 65))
              (|List| 34) (78 . |append|) (|SparseUnivariatePolynomial| 9)
              (|Mapping| 9 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 11 9 37)
              (84 . |map|) (|Factored| $) (90 . |squareFree|) (|Factored| 37)
              (95 . |unit|) (|Mapping| 10 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 37 10 11)
              (100 . |map|) (106 . |ground?|)
              (|Record| (|:| |factor| 37) (|:| |exponent| 65)) (|List| 49)
              (111 . |factors|) (116 . |content|) (121 . |degree|)
              (127 . |leadingCoefficient|) (132 . |ground?|)
              (137 . |leadingCoefficient|) (142 . ^) (148 . *) (154 . |One|)
              (158 . |exquo|) (|FactoringUtilities| 7 6 8 9)
              (164 . |variables|) (|List| 13) (169 . |degree|) (|Integer|)
              (175 . |position|) (181 . |elt|) (187 . |coerce|)
              (192 . |primeFactor|) (198 . *) (204 . |One|) (208 . *)
              |MFINFACT;factor;SupF;3| (214 . |minimumDegree|)
              (220 . |squareFree|) (|Factored| 9) (225 . |unit|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 65)) (|List| 78)
              (230 . |factors|) (235 . |degree|) (241 . |One|)
              (245 . |member?|) (|SparseUnivariatePolynomial| $)
              (251 . |univariate|) (|List| $) (257 . |gcd|) (262 . |exquo|)
              (268 . ~=) (274 . ~=) (280 . |exquo|) (286 . |multivariate|)
              (292 . |leadingCoefficient|) (297 . ~=) (303 . |inv|)
              (308 . |coerce|) (313 . |coerce|) (318 . *)
              (|Record| (|:| |irr| 10) (|:| |pow| 65)) (|List| 99)
              (324 . |append|) (330 . |monomial|) (336 . |size|)
              (|PositiveInteger|) (340 . |index|) (345 . +) (|List| 124)
              (|GenExEuclid| 23 124) (351 . |testModulus|)
              (|FiniteFieldPolynomialPackage| 8)
              (357 . |createIrreduciblePoly|) (|Union| 23 '"failed")
              (362 . |nextIrreduciblePoly|) (|Mapping| 23 8)
              (|MPolyCatFunctions2| 6 7 (|IndexedExponents| 6) 8 23 9 10)
              (367 . |map|)
              (|Record| (|:| |polfac| 16) (|:| |correct| 23)
                        (|:| |corrfact| 107))
              (|Union| 117 '"failed")
              (|Record| (|:| |contp| 23) (|:| |factors| 100)) (|List| 23)
              (|LeadingCoefDetermination| 6 (|IndexedExponents| 6) 23 10)
              (373 . |distFact|) (383 . ~=) (|SparseUnivariatePolynomial| 23)
              (389 . |elt|) (395 . *) (|Union| (|List| 11) '"failed")
              (|MultivariateLifting| (|IndexedExponents| 6) 6 23 10)
              (401 . |lifting|) (412 . |primitivePart|) (417 . |retract|)
              (422 . |Zero|) (426 . |Zero|) (430 . |leadingMonomial|)
              (435 . |monomial|) (442 . +) (448 . |reductum|) (453 . |ground?|)
              (458 . |retract|) (463 . |univariate|) (469 . |Zero|) (473 . ~=)
              (479 . |degree|) (484 . |leadingCoefficient|) (489 . *) (495 . +)
              (501 . |reductum|) (506 . |ground?|) (511 . |retract|)
              (516 . |coerce|) (521 . |degree|) (526 . |monomial|)
              (533 . |reductum|) (538 . |random|) (542 . |delete|)
              (548 . |delete|) (554 . |degree|) (559 . =) (|List| 120)
              (565 . |member?|) (571 . |eval|) (578 . |unit?|)
              (|FactoringUtilities| (|IndexedExponents| 6) 6 23 10)
              (583 . |completeEval|) (590 . ~=) (596 . |minimumDegree|)
              (601 . |content|) (606 . |exquo|) (612 . |polCase|)
              (619 . |differentiate|) (624 . |differentiate|)
              (629 . |differentiate|) (634 . |differentiate|) (|Mapping| 23 23)
              (639 . |map|) (645 . |gcd|) (650 . |leadingCoefficient|)
              (655 . |coefficients|) (|Factored| 124) (|TwoFactorize| 8)
              (660 . |tryTwoFactor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 182) (|:| |fctr| 124) (|:| |xpnt| 65))
              (|List| 183) (665 . |factorList|) (670 . |elt|) (676 . *)
              (682 . |generalTwoFactor|)
              (|Record| (|:| |factor| 124) (|:| |exponent| 65)) (|List| 189)
              (687 . |factors|) (692 . |unit|) (697 . |retract|) (702 . *)
              (708 . >) (|Record| (|:| |irr| 23) (|:| |pow| 65))
              (|Record| (|:| |cont| 8) (|:| |factors| (|List| 196)))
              (|DistinctDegreeFactorize| 8 23) (714 . |distdfact|)
              (720 . |position|) (726 . |elt|) (732 . |monomial|) (739 . *)
              (745 . |coerce|) (750 . |ground|) (|Mapping| 23 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 11 23 124)
              (755 . |map|) (|Mapping| 10 23)
              (|UnivariatePolynomialCategoryFunctions2| 23 124 10 11)
              (761 . |map|) (767 . |variables|) (772 . =)
              (|Record| (|:| |flg| 182) (|:| |fctr| 9) (|:| |xpnt| 65))
              (|List| 214) (778 . |makeFR|) (784 . |degree|)
              (790 . |primeFactor|) (796 . *) (802 . |One|) (806 . *)
              |MFINFACT;factor;PGF;19|)
           '#(|factor| 812) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 222
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
                                                   43 50 0 51 1 11 10 0 52 2 10
                                                   13 0 6 53 1 11 10 0 54 1 10
                                                   26 0 55 1 10 23 0 56 2 23 0
                                                   0 13 57 2 23 0 0 0 58 0 23 0
                                                   59 2 23 32 0 0 60 1 61 18 37
                                                   62 2 61 63 37 18 64 2 63 65
                                                   13 0 66 2 18 6 0 65 67 1 37
                                                   0 9 68 2 43 0 37 65 69 2 43
                                                   0 0 0 70 0 43 0 71 2 43 0 37
                                                   0 72 2 10 63 0 18 74 1 9 41
                                                   0 75 1 76 9 0 77 1 76 79 0
                                                   80 2 10 63 0 18 81 0 11 0 82
                                                   2 63 26 13 0 83 2 10 84 0 6
                                                   85 1 10 0 86 87 2 10 32 0 0
                                                   88 2 6 26 0 0 89 2 10 26 0 0
                                                   90 2 11 32 0 10 91 2 10 0 84
                                                   6 92 1 23 8 0 93 2 8 26 0 0
                                                   94 1 8 0 0 95 1 23 0 8 96 1
                                                   10 0 23 97 2 11 0 10 0 98 2
                                                   100 0 0 0 101 2 23 0 8 13
                                                   102 0 8 13 103 1 8 0 104 105
                                                   2 23 0 0 0 106 2 108 26 23
                                                   107 109 1 110 23 104 111 1
                                                   110 112 23 113 2 115 10 114
                                                   9 116 6 121 118 23 107 119
                                                   120 18 120 122 2 23 26 0 0
                                                   123 2 107 124 0 65 125 2 124
                                                   0 23 0 126 7 128 127 11 18
                                                   107 120 16 63 23 129 1 11 0
                                                   0 130 1 10 23 0 131 0 9 0
                                                   132 0 10 0 133 1 10 0 0 134
                                                   3 9 0 0 18 63 135 2 9 0 0 0
                                                   136 1 10 0 0 137 1 9 26 0
                                                   138 1 9 8 0 139 2 9 84 0 6
                                                   140 0 37 0 141 2 37 26 0 0
                                                   142 1 37 13 0 143 1 37 9 0
                                                   144 2 10 0 23 0 145 2 10 0 0
                                                   0 146 1 37 0 0 147 1 23 26 0
                                                   148 1 23 8 0 149 1 9 0 8 150
                                                   1 23 13 0 151 3 9 0 0 6 13
                                                   152 1 23 0 0 153 0 8 0 154 2
                                                   63 0 0 65 155 2 18 0 0 65
                                                   156 1 124 13 0 157 2 16 26 0
                                                   0 158 2 159 26 120 0 160 3
                                                   10 0 0 18 120 161 1 23 26 0
                                                   162 3 163 124 11 18 120 164
                                                   2 13 26 0 0 165 1 124 13 0
                                                   166 1 124 23 0 167 2 124 32
                                                   0 23 168 3 121 26 23 13 120
                                                   169 1 124 0 0 170 1 8 0 0
                                                   171 1 23 0 0 172 1 11 0 0
                                                   173 2 124 0 174 0 175 1 124
                                                   0 86 176 1 124 23 0 177 1
                                                   124 120 0 178 1 180 179 124
                                                   181 1 179 184 0 185 2 184
                                                   183 0 65 186 2 65 0 104 0
                                                   187 1 180 179 124 188 1 179
                                                   190 0 191 1 179 124 0 192 1
                                                   124 23 0 193 2 23 0 8 0 194
                                                   2 65 26 0 0 195 2 198 197 23
                                                   26 199 2 18 65 6 0 200 2 63
                                                   13 0 65 201 3 10 0 0 6 13
                                                   202 2 10 0 0 0 203 1 10 0 6
                                                   204 1 10 23 0 205 2 207 124
                                                   206 11 208 2 210 11 209 124
                                                   211 1 9 18 0 212 2 18 26 0 0
                                                   213 2 76 0 9 215 216 2 9 13
                                                   0 6 217 2 76 0 9 65 218 2 76
                                                   0 0 0 219 0 76 0 220 2 76 0
                                                   9 0 221 1 0 43 37 73 1 0 76
                                                   9 222)))))
           '|lookupComplete|)) 
