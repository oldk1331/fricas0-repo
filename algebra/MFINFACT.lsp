
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
                     (LETT #25# NIL . #30=(|MFINFACT;supFactor|))
                     (SEQ (LETT |cf| NIL . #30#)
                          (LETT #28# (SPADCALL |um| (QREFELT $ 17)) . #30#)
                          G190
                          (COND
                           ((OR (ATOM #28#)
                                (PROGN (LETT |cf| (CAR #28#) . #30#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #27# (SPADCALL |cf| (QREFELT $ 19)) . #30#)
                             (COND
                              (#25#
                               (LETT #26# (SPADCALL #26# #27# (QREFELT $ 20))
                                     . #30#))
                              ('T
                               (PROGN
                                (LETT #26# #27# . #30#)
                                (LETT #25# 'T . #30#)))))))
                          (LETT #28# (CDR #28#) . #30#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#25# #26#) (#29# (|IdentityError| '|setUnion|))))
                    . #30#)
              (LETT |flead| (CONS (|spadConstant| $ 24) NIL) . #30#)
              (LETT |factorlist| NIL . #30#)
              (LETT |mdeg| (SPADCALL |um| (QREFELT $ 25)) . #30#)
              (COND
               ((SPADCALL |mdeg| 0 (QREFELT $ 27))
                (SEQ
                 (LETT |f1|
                       (SPADCALL (|spadConstant| $ 30) |mdeg| (QREFELT $ 31))
                       . #30#)
                 (LETT |um|
                       (PROG2
                           (LETT #23# (SPADCALL |um| |f1| (QREFELT $ 33))
                                 . #30#)
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
                                          #31="failed")
                                         #23#))
                       . #30#)
                 (LETT |factorlist|
                       (CONS
                        (CONS (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 31))
                              |mdeg|)
                        |factorlist|)
                       . #30#)
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
                                   $)
                                  . #30#)
                            (EXIT
                             (CONS (QCAR |lfg|)
                                   (SPADCALL |factorlist| (QCDR |lfg|)
                                             (QREFELT $ 36)))))
                           . #30#)
                     (GO #32=#:G201))))))))
              (LETT |om|
                    (SPADCALL (CONS #'|MFINFACT;supFactor!0| (VECTOR $ |var|))
                              |um| (QREFELT $ 40))
                    . #30#)
              (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 42)) . #30#)
              (LETT |lcont|
                    (SPADCALL (CONS #'|MFINFACT;supFactor!1| (VECTOR $ |var|))
                              (SPADCALL |sqfacs| (QREFELT $ 44))
                              (QREFELT $ 47))
                    . #30#)
              (COND
               ((SPADCALL |lcont| (QREFELT $ 48))
                (LETT |flead|
                      (|MFINFACT;convertPUP|
                       (|MFINFACT;constantCase|
                        (SPADCALL |lcont| (QREFELT $ 15)) NIL $)
                       $)
                      . #30#))
               (#29#
                (LETT |flead| (|MFINFACT;supFactor| |lcont| |var| |dx| $)
                      . #30#)))
              (LETT |factorlist| (QCDR |flead|) . #30#)
              (LETT |sqqfact|
                    (PROGN
                     (LETT #21# NIL . #30#)
                     (SEQ (LETT |ff| NIL . #30#)
                          (LETT #20# (SPADCALL |sqfacs| (QREFELT $ 51)) . #30#)
                          G190
                          (COND
                           ((OR (ATOM #20#)
                                (PROGN (LETT |ff| (CAR #20#) . #30#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #21#
                                  (CONS
                                   (CONS
                                    (SPADCALL
                                     (CONS #'|MFINFACT;supFactor!2|
                                           (VECTOR $ |var|))
                                     (QCAR |ff|) (QREFELT $ 47))
                                    (QCDR |ff|))
                                   #21#)
                                  . #30#)))
                          (LETT #20# (CDR #20#) . #30#) (GO G190) G191
                          (EXIT (NREVERSE #21#))))
                    . #30#)
              (SEQ (LETT |fact| NIL . #30#) (LETT #19# |sqqfact| . #30#) G190
                   (COND
                    ((OR (ATOM #19#)
                         (PROGN (LETT |fact| (CAR #19#) . #30#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ffactor| (QCAR |fact|) . #30#)
                        (LETT |ffexp| (QCDR |fact|) . #30#)
                        (LETT |ffcont| (SPADCALL |ffactor| (QREFELT $ 52))
                              . #30#)
                        (LETT |coefs| (SPADCALL |ffactor| (QREFELT $ 17))
                              . #30#)
                        (LETT |ldeg|
                              (PROGN
                               (LETT #18# NIL . #30#)
                               (SEQ (LETT |xx| NIL . #30#)
                                    (LETT #17# |lvar| . #30#) G190
                                    (COND
                                     ((OR (ATOM #17#)
                                          (PROGN
                                           (LETT |xx| (CAR #17#) . #30#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #18#
                                            (CONS
                                             (PROGN
                                              (LETT #13# NIL . #30#)
                                              (SEQ (LETT |fc| NIL . #30#)
                                                   (LETT #16# |coefs| . #30#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #16#)
                                                         (PROGN
                                                          (LETT |fc| (CAR #16#)
                                                                . #30#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #15#
                                                            (SPADCALL |fc| |xx|
                                                                      (QREFELT
                                                                       $ 53))
                                                            . #30#)
                                                      (COND
                                                       (#13#
                                                        (LETT #14#
                                                              (MAX #14# #15#)
                                                              . #30#))
                                                       ('T
                                                        (PROGN
                                                         (LETT #14# #15#
                                                               . #30#)
                                                         (LETT #13# 'T
                                                               . #30#)))))))
                                                   (LETT #16# (CDR #16#)
                                                         . #30#)
                                                   (GO G190) G191 (EXIT NIL))
                                              (COND (#13# #14#)
                                                    ('T
                                                     (|IdentityError|
                                                      '|max|))))
                                             #18#)
                                            . #30#)))
                                    (LETT #17# (CDR #17#) . #30#) (GO G190)
                                    G191 (EXIT (NREVERSE #18#))))
                              . #30#)
                        (COND
                         ((SPADCALL (SPADCALL |ffactor| (QREFELT $ 54))
                                    (QREFELT $ 55))
                          (LETT |lf|
                                (|MFINFACT;mfconst| |ffactor| |dx| |lvar|
                                 |ldeg| $)
                                . #30#))
                         ('T
                          (LETT |lf|
                                (|MFINFACT;mfpol| |ffactor| |var| |dx| |lvar|
                                 |ldeg| $)
                                . #30#)))
                        (LETT |auxfl|
                              (PROGN
                               (LETT #11# NIL . #30#)
                               (SEQ (LETT |lfp| NIL . #30#)
                                    (LETT #10# |lf| . #30#) G190
                                    (COND
                                     ((OR (ATOM #10#)
                                          (PROGN
                                           (LETT |lfp| (CAR #10#) . #30#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #11#
                                            (CONS (CONS |lfp| |ffexp|) #11#)
                                            . #30#)))
                                    (LETT #10# (CDR #10#) . #30#) (GO G190)
                                    G191 (EXIT (NREVERSE #11#))))
                              . #30#)
                        (EXIT
                         (LETT |factorlist|
                               (SPADCALL |factorlist| |auxfl| (QREFELT $ 36))
                               . #30#)))
                   (LETT #19# (CDR #19#) . #30#) (GO G190) G191 (EXIT NIL))
              (LETT |lcfacs|
                    (PROGN
                     (LETT #3# NIL . #30#)
                     (SEQ (LETT |f| NIL . #30#) (LETT #6# |factorlist| . #30#)
                          G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |f| (CAR #6#) . #30#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #5#
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QCAR |f|) (QREFELT $ 54))
                                     (QREFELT $ 56))
                                    (QCDR |f|) (QREFELT $ 57))
                                   . #30#)
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 58))
                                     . #30#))
                              ('T
                               (PROGN
                                (LETT #4# #5# . #30#)
                                (LETT #3# 'T . #30#)))))))
                          (LETT #6# (CDR #6#) . #30#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#3# #4#) (#29# (|spadConstant| $ 59))))
                    . #30#)
              (EXIT
               (CONS
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |um| (QREFELT $ 54))
                                     (QREFELT $ 56))
                           |lcfacs| (QREFELT $ 60))
                          . #30#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                   #31#)
                                  #1#))
                |factorlist|))))))
          #32# (EXIT #22#)))) 

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
         (SEQ
          (LETT |fm| (SPADCALL |m| NIL (QREFELT $ 64))
                . #6=(|MFINFACT;factor_sup|))
          (LETT |fr1|
                (PROGN
                 (LETT #2# NIL . #6#)
                 (SEQ (LETT |p| NIL . #6#) (LETT #5# (QCDR |fm|) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL
                                (SPADCALL (ELT $ 65) (QCAR |p|) (QREFELT $ 68))
                                (QCDR |p|) (QREFELT $ 69))
                               . #6#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 70)) . #6#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #6#)
                            (LETT #2# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T (|spadConstant| $ 71))))
                . #6#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL (QCAR |fm|) (QREFELT $ 65)) (QREFELT $ 72))
             NIL (QREFELT $ 76))
            |fr1| (QREFELT $ 70)))))) 

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
         (SEQ
          (LETT |lv| (SPADCALL |um| (QREFELT $ 78))
                . #12=(|MFINFACT;factor;SupF;4|))
          (EXIT
           (COND
            ((NULL |lv|)
             (|MFINFACT;factor_sup| (SPADCALL (ELT $ 79) |um| (QREFELT $ 82))
              $))
            (#13='T
             (SEQ (LETT |ld| (SPADCALL |um| |lv| (QREFELT $ 84)) . #12#)
                  (LETT |dx|
                        (PROGN
                         (LETT #7# NIL . #12#)
                         (SEQ (LETT #11# NIL . #12#) (LETT #10# |ld| . #12#)
                              G190
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
                              (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#7# #8#) (#13# (|IdentityError| '|min|))))
                        . #12#)
                  (LETT |var|
                        (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 86))
                                  (QREFELT $ 87))
                        . #12#)
                  (LETT |cm|
                        (SPADCALL
                         (CONS #'|MFINFACT;factor;SupF;4!0| (VECTOR $ |var|))
                         |um| (QREFELT $ 47))
                        . #12#)
                  (LETT |flist| (|MFINFACT;supFactor| |cm| |var| |dx| $)
                        . #12#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (|MFINFACT;pushupconst| (QCAR |flist|) |var| $)
                              (QREFELT $ 72))
                    (PROGN
                     (LETT #1# NIL . #12#)
                     (SEQ (LETT |u| NIL . #12#)
                          (LETT #5# (QCDR |flist|) . #12#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |u| (CAR #5#) . #12#) NIL))
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
                                    (QCDR |u|) (QREFELT $ 69))
                                   . #12#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 70))
                                     . #12#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #12#)
                                (LETT #1# 'T . #12#)))))))
                          (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#1# #2#) (#13# (|spadConstant| $ 71))))
                    (QREFELT $ 88)))))))))) 

(SDEFUN |MFINFACT;factor;SupF;4!1| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1) . #1=(|MFINFACT;factor;SupF;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MFINFACT;pushup| |p1| |var| $))))) 

(SDEFUN |MFINFACT;factor;SupF;4!0| ((|p1| NIL) ($$ NIL))
        (PROG (|var| $)
          (LETT |var| (QREFELT $$ 1) . #1=(|MFINFACT;factor;SupF;4|))
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
           ((SPADCALL |m| (QREFELT $ 55)) (|MFINFACT;constantCase| |m| NIL $))
           (#19='T
            (SEQ
             (LETT |lvar| (SPADCALL |m| (QREFELT $ 19))
                   . #20=(|MFINFACT;mFactor|))
             (LETT |flead| (CONS (|spadConstant| $ 59) NIL) . #20#)
             (LETT |factorlist| NIL . #20#)
             (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 90)) . #20#)
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
                     (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 91)) . #20#)
                     (LETT |lcont|
                           (|MFINFACT;pushdown|
                            (SPADCALL |sqfacs| (QREFELT $ 93)) |var| $)
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
                                 (LETT #12# (SPADCALL |sqfacs| (QREFELT $ 96))
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
                                   (LETT |x| (SPADCALL |lvar| 1 (QREFELT $ 87))
                                         . #20#)
                                   (LETT |ldeg|
                                         (SPADCALL |ffactor| |lvar|
                                                   (QREFELT $ 97))
                                         . #20#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL 1 |ldeg| (QREFELT $ 99))
                                      (SEQ
                                       (LETT |x|
                                             (SPADCALL |lvar|
                                                       (SPADCALL 1 |ldeg|
                                                                 (QREFELT $
                                                                          86))
                                                       (QREFELT $ 87))
                                             . #20#)
                                       (LETT |lcont|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |ffactor| |x|
                                                         (QREFELT $ 101))
                                               (QREFELT $ 17))
                                              (QREFELT $ 103))
                                             . #20#)
                                       (LETT |ffactor|
                                             (PROG2
                                                 (LETT #8#
                                                       (SPADCALL |ffactor|
                                                                 |lcont|
                                                                 (QREFELT $
                                                                          104))
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
                                                    (QREFELT $ 87))
                                          |x| (QREFELT $ 105))
                                         (SEQ
                                          (LETT |lvar| (QVELT |varch| 1)
                                                . #20#)
                                          (LETT |x|
                                                (SPADCALL |lvar| 1
                                                          (QREFELT $ 87))
                                                . #20#)
                                          (LETT |lvar| (CDR |lvar|) . #20#)
                                          (LETT |pc|
                                                (SPADCALL
                                                 (SPADCALL |um| (QREFELT $ 17))
                                                 (QREFELT $ 103))
                                                . #20#)
                                          (COND
                                           ((SPADCALL |pc|
                                                      (|spadConstant| $ 30)
                                                      (QREFELT $ 106))
                                            (SEQ
                                             (LETT |um|
                                                   (PROG2
                                                       (LETT #6#
                                                             (SPADCALL |um|
                                                                       |pc|
                                                                       (QREFELT
                                                                        $ 107))
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
                                                             (QREFELT $ 108))
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
                                                           (QREFELT $ 97))
                                                 . #20#)))))
                                       (LETT |lcum|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |um| (QREFELT $ 54))
                                               (QREFELT $ 56))
                                              (QREFELT $ 109))
                                             . #20#)
                                       (COND
                                        ((SPADCALL |lcum| (|spadConstant| $ 28)
                                                   (QREFELT $ 110))
                                         (SEQ
                                          (LETT |um|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |lcum|
                                                             (QREFELT $ 111))
                                                   (QREFELT $ 112))
                                                  (QREFELT $ 113))
                                                 |um| (QREFELT $ 114))
                                                . #20#)
                                          (EXIT
                                           (PROGN
                                            (RPLACA |flead|
                                                    (SPADCALL
                                                     (SPADCALL |lcum|
                                                               (QREFELT $ 112))
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
                                                                        $ 108))
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
                                                        (QREFELT $ 117))
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
         ((#1=#:G306 NIL) (|p| (|SparseUnivariatePolynomial| F))
          (#2=#:G296 NIL)
          (|q| (|Union| (|SparseUnivariatePolynomial| F) #3="failed"))
          (#4=#:G294 NIL) (|e| NIL) (#5=#:G305 NIL) (#6=#:G290 NIL)
          (#7=#:G307 NIL) (|i| NIL) (|x| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |x| (SPADCALL (|spadConstant| $ 28) 1 (QREFELT $ 118))
                  . #8=(|MFINFACT;pM|))
            (SEQ (LETT |i| 1 . #8#) (LETT #7# (SPADCALL (QREFELT $ 119)) . #8#)
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
                                      (QREFELT $ 121))
                                     (QREFELT $ 112))
                                    (QREFELT $ 122))
                          . #8#)
                    (EXIT
                     (COND
                      ((SPADCALL |p| |lum| (QREFELT $ 125))
                       (PROGN
                        (LETT #5# (PROGN (LETT #1# |p| . #8#) (GO #9=#:G304))
                              . #8#)
                        (GO #10=#:G291)))))))
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
                          (QREFELT $ 127))
                         . #8#)
                   (EXIT
                    (COND
                     ((SPADCALL |p| |lum| (QREFELT $ 125))
                      (PROGN (LETT #1# |p| . #8#) (GO #9#)))
                     ('T
                      (SEQ G190
                           (COND
                            ((NULL
                              (SEQ
                               (LETT |q| (SPADCALL |p| (QREFELT $ 129)) . #8#)
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
                              ((SPADCALL |p| |lum| (QREFELT $ 125))
                               (PROGN (LETT #1# |p| . #8#) (GO #9#))))))
                           NIL (GO G190) G191 (EXIT NIL))))))
                  (LETT |e| (|inc_SI| |e|) . #8#) (GO G190) G191 (EXIT NIL)))))
          #9# (EXIT #1#)))) 

(SDEFUN |MFINFACT;pushdcoef|
        ((|t| PG)
         ($ |SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
          OV))
        (SPADCALL (ELT $ 112) |t| (QREFELT $ 132))) 

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
                                                |lval| (QREFELT $ 138))
                                      . #9#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |distf| 1)
                                   (PROGN
                                    (LETT #6#
                                          (|MFINFACT;intfact| |um| |lvar|
                                           |ldeg| |tleadpol| |ltry| $)
                                          . #9#)
                                    (GO #11=#:G346)))
                                  (#10#
                                   (SEQ (LETT |dist| (QCDR |distf|) . #9#)
                                        (LETT |lpol| (QVELT |dist| 0) . #9#)
                                        (LETT |dd| (QVELT |dist| 1) . #9#)
                                        (EXIT
                                         (LETT |unifact| (QVELT |dist| 2)
                                               . #9#)))))))))
                         (COND
                          ((SPADCALL |dd| (|spadConstant| $ 59)
                                     (QREFELT $ 139))
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
                                                                              141))
                                                           (QREFELT $ 142))
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
                                     (QREFELT $ 113))
                                    |um| (QREFELT $ 114))
                                   . #9#)))))
                         (LETT |ffin|
                               (SPADCALL |um| |lvar| |unifact| |lval| |lpol|
                                         |ldeg| (|MFINFACT;pM| |unifact| $)
                                         (QREFELT $ 145))
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
                                             (QREFELT $ 139))
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
                                                                           146))
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
            (|MFINFACT;pushupconst| (SPADCALL |f| (QREFELT $ 147)) |x| $))
           ('T
            (SEQ (LETT |rr| (|spadConstant| $ 148) . #1=(|MFINFACT;pushup|))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |f| (|spadConstant| $ 149) (QREFELT $ 106)))
                        (GO G191)))
                      (SEQ (LETT |lf| (SPADCALL |f| (QREFELT $ 150)) . #1#)
                           (LETT |cf|
                                 (|MFINFACT;pushupconst|
                                  (SPADCALL |f| (QREFELT $ 56)) |x| $)
                                 . #1#)
                           (LETT |lvf| (SPADCALL |lf| (QREFELT $ 19)) . #1#)
                           (LETT |rr|
                                 (SPADCALL |rr|
                                           (SPADCALL |cf| |lvf|
                                                     (SPADCALL |lf| |lvf|
                                                               (QREFELT $ 97))
                                                     (QREFELT $ 151))
                                           (QREFELT $ 152))
                                 . #1#)
                           (EXIT
                            (LETT |f| (SPADCALL |f| (QREFELT $ 153)) . #1#)))
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
           ((SPADCALL |g| (QREFELT $ 154))
            (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 155)) (QREFELT $ 112))
                      (QREFELT $ 113)))
           ('T
            (SEQ (LETT |rf| (|spadConstant| $ 149) . #1=(|MFINFACT;pushdown|))
                 (LETT |ug| (SPADCALL |g| |x| (QREFELT $ 156)) . #1#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |ug| (|spadConstant| $ 157)
                                   (QREFELT $ 158)))
                        (GO G191)))
                      (SEQ
                       (LETT |cf|
                             (SPADCALL (|spadConstant| $ 28)
                                       (SPADCALL |ug| (QREFELT $ 159))
                                       (QREFELT $ 118))
                             . #1#)
                       (LETT |rf|
                             (SPADCALL |rf|
                                       (SPADCALL |cf|
                                                 (|MFINFACT;pushdcoef|
                                                  (SPADCALL |ug|
                                                            (QREFELT $ 160))
                                                  $)
                                                 (QREFELT $ 161))
                                       (QREFELT $ 162))
                             . #1#)
                       (EXIT
                        (LETT |ug| (SPADCALL |ug| (QREFELT $ 163)) . #1#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rf|))))))) 

(SDEFUN |MFINFACT;pushupconst|
        ((|r| |SparseUnivariatePolynomial| F) (|x| OV) ($ PG))
        (SPROG ((|rr| (PG)))
               (SEQ
                (COND
                 ((SPADCALL |r| (QREFELT $ 164))
                  (SPADCALL (SPADCALL |r| (QREFELT $ 165)) (QREFELT $ 65)))
                 ('T
                  (SEQ
                   (LETT |rr| (|spadConstant| $ 148)
                         . #1=(|MFINFACT;pushupconst|))
                   (SEQ G190
                        (COND
                         ((NULL
                           (SPADCALL |r| (|spadConstant| $ 24)
                                     (QREFELT $ 139)))
                          (GO G191)))
                        (SEQ
                         (LETT |rr|
                               (SPADCALL |rr|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |r| (QREFELT $ 109))
                                           (QREFELT $ 65))
                                          |x| (SPADCALL |r| (QREFELT $ 166))
                                          (QREFELT $ 167))
                                         (QREFELT $ 152))
                               . #1#)
                         (EXIT
                          (LETT |r| (SPADCALL |r| (QREFELT $ 168)) . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |rr|))))))) 

(SDEFUN |MFINFACT;ran| ((|k1| |Integer|) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G370 NIL) (#2=#:G369 #3=(|SparseUnivariatePolynomial| F))
          (#4=#:G371 #3#) (#5=#:G373 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|MFINFACT;ran|))
           (SEQ (LETT |i| 0 . #6#) (LETT #5# |k1| . #6#) G190
                (COND ((|greater_SI| |i| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (SPADCALL (QREFELT $ 169)) |i|
                                   (QREFELT $ 118))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 122)) . #6#))
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
         ((|x| (OV)) (|i| (|Integer|)) (|k| #1#) (#2=#:G376 NIL)
          (#3=#:G375 #1#) (#4=#:G377 #1#) (#5=#:G381 NIL) (|d| NIL))
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
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 101)) |lvar|
                     |ldeg|))
            (#7#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 86)) . #6#)
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 87)) . #6#)
                  (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 170)))
                        . #6#)
                  (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 171)))
                        . #6#)
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT $ 101)) |lvar|
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
           (LETT #2# NIL . #6=(|MFINFACT;norm|))
           (SEQ (LETT |lup| NIL . #6#) (LETT #5# |lum| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |lup| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (SPADCALL |lup| (QREFELT $ 172)) . #6#)
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
          (#3=#:G470 NIL) (|uf| NIL) (#4=#:G469 NIL)
          (|leadtest| #5=(|Boolean|)) (#6=#:G468 NIL) (#7=#:G467 NIL)
          (#8=#:G452 NIL) (#9=#:G466 NIL) (#10=#:G465 NIL) (#11=#:G464 NIL)
          (#12=#:G463 NIL) (#13=#:G462 NIL) (|ff| NIL) (#14=#:G461 NIL)
          (#15=#:G460 NIL) (#16=#:G459 NIL) (|lffc1| #2#)
          (|nf| (|NonNegativeInteger|))
          (|lunivf|
           (|List|
            (|Record|
             (|:| |factor|
                  (|SparseUnivariatePolynomial|
                   (|SparseUnivariatePolynomial| F)))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|skip| (|Boolean|)) (|base_success| (|Integer|))
          (|luniv|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|base_failure| (|Integer|))
          (|nfl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial|
                            (|SparseUnivariatePolynomial| F)))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|dx| #17=(|NonNegativeInteger|)) (#18=#:G413 NIL) (#19=#:G412 #17#)
          (#20=#:G414 #17#) (#21=#:G458 NIL) (|uc| NIL)
          (|newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|lcnm| (F)) (|range| (|NonNegativeInteger|))
          (|D2newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|Dnewm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (#22=#:G397 NIL) (#23=#:G391 NIL) (#24=#:G390 #25=(|Boolean|))
          (#26=#:G392 #25#) (#27=#:G457 NIL) (|epl| NIL) (|leadcomp1| #1#)
          (#28=#:G456 NIL) (|pol| NIL) (#29=#:G455 NIL)
          (|lval| (|List| (|SparseUnivariatePolynomial| F))) (#30=#:G454 NIL)
          (|i| NIL) (#31=#:G453 NIL)
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
          (LETT |testp| (NULL (SPADCALL |plist| NIL (QREFELT $ 173))) . #32#)
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
                    ((SPADCALL |lval| |ltry| (QREFELT $ 175))
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
                                                          (QREFELT $ 176))
                                                (QREFELT $ 147))
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
                                             (SPADCALL |epl| (QREFELT $ 177))
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
                                (SPADCALL |um| |lvar| |lval| (QREFELT $ 179))
                                . #32#)
                          (COND
                           ((OR
                             (SPADCALL |degum|
                                       (SPADCALL |newm| (QREFELT $ 172))
                                       (QREFELT $ 180))
                             (SPADCALL (SPADCALL |newm| (QREFELT $ 181)) 0
                                       (QREFELT $ 180)))
                            (EXIT (LETT |range| (+ |range| 1) . #32#))))
                          (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 182))
                                . #32#)
                          (LETT |newm|
                                (PROG2
                                    (LETT #22#
                                          (SPADCALL |newm| |lffc1|
                                                    (QREFELT $ 183))
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
                                  (QREFELT $ 184)))
                                (EXIT
                                 (LETT |range| (+ |range| 1) . #32#))))))))
                          (LETT |Dnewm| (SPADCALL |newm| (QREFELT $ 185))
                                . #32#)
                          (LETT |D2newm|
                                (SPADCALL (ELT $ 188) |newm| (QREFELT $ 191))
                                . #32#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (SPADCALL
                               (SPADCALL (LIST |newm| |Dnewm| |D2newm|)
                                         (QREFELT $ 192))
                               (QREFELT $ 172))
                              0 (QREFELT $ 180))
                             (LETT |range| (+ |range| 1) . #32#))
                            ('T
                             (SEQ (LETT |lcnm| (|spadConstant| $ 28) . #32#)
                                  (COND
                                   ((SPADCALL
                                     (LETT |lcnm|
                                           (SPADCALL
                                            (SPADCALL |newm| (QREFELT $ 193))
                                            (QREFELT $ 109))
                                           . #32#)
                                     (|spadConstant| $ 28) (QREFELT $ 110))
                                    (LETT |newm|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |lcnm| (QREFELT $ 111))
                                            (QREFELT $ 112))
                                           |newm| (QREFELT $ 142))
                                          . #32#)))
                                  (LETT |dx|
                                        (PROGN
                                         (LETT #18# NIL . #32#)
                                         (SEQ (LETT |uc| NIL . #32#)
                                              (LETT #21#
                                                    (SPADCALL |newm|
                                                              (QREFELT $ 194))
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
                                                                          166))
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
                                        (SPADCALL |newm| (QREFELT $ 197))
                                        . #32#)
                                  (LETT |nfl|
                                        (SPADCALL |luniv| (QREFELT $ 200))
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
                                        (SPADCALL |nfl| 1 (QREFELT $ 201)) 0)
                                       0)
                                      (SEQ
                                       (LETT |base_failure|
                                             (+ |base_failure| 1) . #32#)
                                       (LETT |skip|
                                             (< |base_failure|
                                                (+
                                                 (SPADCALL 3 |base_success|
                                                           (QREFELT $ 202))
                                                 3))
                                             . #32#)
                                       (EXIT
                                        (LETT |luniv|
                                              (COND (|skip| |luniv|)
                                                    ('T
                                                     (SPADCALL |newm|
                                                               (QREFELT $
                                                                        203))))
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
                                                           (QREFELT $ 206))
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
                                                (GO #33=#:G449))))))
                                           (LETT |lffc1|
                                                 (SPADCALL
                                                  (SPADCALL |lcnm|
                                                            (SPADCALL
                                                             (SPADCALL |luniv|
                                                                       (QREFELT
                                                                        $ 207))
                                                             (QREFELT $ 208))
                                                            (QREFELT $ 209))
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
                                                  (QREFELT $ 210))
                                                 (COND
                                                  (|testp|
                                                   (COND
                                                    ((SPADCALL
                                                      (SPADCALL |lffc1| |clc|
                                                                (QREFELT $ 58))
                                                      (LENGTH |plist|)
                                                      |leadcomp1|
                                                      (QREFELT $ 184))
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
                                                         (QREFELT $ 184)))
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
                (SPADCALL (SPADCALL |m| (QREFELT $ 147)) NIL (QREFELT $ 64))
                . #3=(|MFINFACT;constantCase|))
          (EXIT
           (CONS (SPADCALL (QCAR |lunm|) (QREFELT $ 112))
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
                                                     (QREFELT $ 113))
                                           (QCDR |pp|))
                                          #2#)
                                         . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 117))))))) 

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
         (SEQ (LETT |factorlist| NIL . #3=(|MFINFACT;simplify|))
              (LETT |pol1| (|spadConstant| $ 30) . #3#)
              (SEQ (LETT |x| NIL . #3#) (LETT #2# |lvar| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT $ 211))
                                    (QREFELT $ 212))
                          . #3#)
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| $ 30)
                                                       |x| |i| (QREFELT $ 213))
                                             (QREFELT $ 214))
                                   . #3#)
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT $ 215)) |i|)
                                     |factorlist|)
                                    . #3#)))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2
                        (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 104)) . #3#)
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
                                     (QREFELT $ 117)))
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
         (SEQ (LETT |factfin| NIL . #3=(|MFINFACT;mfconst|))
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ
                  (LETT |um1| (SPADCALL (ELT $ 216) |um| (QREFELT $ 219))
                        . #3#)
                  (LETT |lum| (SPADCALL |um1| (QREFELT $ 203)) . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |lumf| NIL . #3#)
                         (LETT #1# (SPADCALL |lum| (QREFELT $ 206)) . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |lumf| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL (ELT $ 113) (QCAR |lumf|)
                                            (QREFELT $ 222))
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
                            (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ
          (LETT |tleadpol|
                (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT $ 54)) |var| |dm|
                 $)
                |MFINFACT;mfpol|)
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
          (#8=#:G505 #6#) (#9=#:G507 #6#) (#10=#:G517 NIL) (#11=#:G105 NIL)
          (|ld| (|List| #6#)) (#12=#:G516 NIL) (|x| NIL) (#13=#:G515 NIL)
          (|lv| (|List| OV)))
         (SEQ
          (LETT |lv| (SPADCALL |m| (QREFELT $ 223))
                . #14=(|MFINFACT;factor;PGF;20|))
          (EXIT
           (COND
            ((SPADCALL |lv| NIL (QREFELT $ 224))
             (SPADCALL |m| NIL (QREFELT $ 227)))
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
                                  (CONS (SPADCALL |m| |x| (QREFELT $ 228))
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
                    (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 86))
                              (QREFELT $ 87))
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
                                         (QCDR |u|) (QREFELT $ 229))
                                        . #14#)
                                  (COND
                                   (#1#
                                    (LETT #2#
                                          (SPADCALL #2# #4# (QREFELT $ 230))
                                          . #14#))
                                   ('T
                                    (PROGN
                                     (LETT #2# #4# . #14#)
                                     (LETT #1# 'T . #14#)))))))
                               (LETT #5# (CDR #5#) . #14#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#1# #2#) (#15# (|spadConstant| $ 231))))
                         (QREFELT $ 232)))))))))) 

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
    (LETT $ (GETREFV 234) . #1#)
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
              (72 . |exquo|) (|Record| (|:| |irr| 11) (|:| |pow| 13))
              (|List| 34) (78 . |append|) (|SparseUnivariatePolynomial| 9)
              (|Mapping| 9 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 11 9 37)
              (84 . |map|) (|Factored| $) (90 . |squareFree|) (|Factored| 37)
              (95 . |unit|) (|Mapping| 10 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 37 10 11)
              (100 . |map|) (106 . |ground?|)
              (|Record| (|:| |factor| 37) (|:| |exponent| 13)) (|List| 49)
              (111 . |factors|) (116 . |content|) (121 . |degree|)
              (127 . |leadingCoefficient|) (132 . |ground?|)
              (137 . |leadingCoefficient|) (142 . ^) (148 . *) (154 . |One|)
              (158 . |exquo|) (|Record| (|:| |irr| 23) (|:| |pow| 13))
              (|Record| (|:| |cont| 8) (|:| |factors| (|List| 61)))
              (|DistinctDegreeFactorize| 8 23) (164 . |distdfact|)
              (170 . |coerce|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 23 9 37)
              (175 . |map|) (181 . |primeFactor|) (187 . *) (193 . |One|)
              (197 . |coerce|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 73) (|:| |factor| 37) (|:| |exponent| 13))
              (|List| 74) (202 . |makeFR|) (|FactoringUtilities| 7 6 8 9)
              (208 . |variables|) (213 . |ground|) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 37 8 23)
              (218 . |map|) (|List| 13) (224 . |degree|) (|Integer|)
              (230 . |position|) (236 . |elt|) (242 . *)
              |MFINFACT;factor;SupF;4| (248 . |minimumDegree|)
              (254 . |squareFree|) (|Factored| 9) (259 . |unit|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 13)) (|List| 94)
              (264 . |factors|) (269 . |degree|) (275 . |One|)
              (279 . |member?|) (|SparseUnivariatePolynomial| $)
              (285 . |univariate|) (|List| $) (291 . |gcd|) (296 . |exquo|)
              (302 . ~=) (308 . ~=) (314 . |exquo|) (320 . |multivariate|)
              (326 . |leadingCoefficient|) (331 . ~=) (337 . |inv|)
              (342 . |coerce|) (347 . |coerce|) (352 . *)
              (|Record| (|:| |irr| 10) (|:| |pow| 13)) (|List| 115)
              (358 . |append|) (364 . |monomial|) (370 . |size|)
              (|PositiveInteger|) (374 . |index|) (379 . +) (|List| 140)
              (|GenExEuclid| 23 140) (385 . |testModulus|)
              (|FiniteFieldPolynomialPackage| 8)
              (391 . |createIrreduciblePoly|) (|Union| 23 '"failed")
              (396 . |nextIrreduciblePoly|) (|Mapping| 23 8)
              (|MPolyCatFunctions2| 6 7 (|IndexedExponents| 6) 8 23 9 10)
              (401 . |map|)
              (|Record| (|:| |polfac| 16) (|:| |correct| 23)
                        (|:| |corrfact| 123))
              (|Union| 133 '"failed")
              (|Record| (|:| |contp| 23) (|:| |factors| 116)) (|List| 23)
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
              (583 . |degree|) (588 . =) (|List| 136) (594 . |member?|)
              (600 . |eval|) (607 . |unit?|)
              (|FactoringUtilities| (|IndexedExponents| 6) 6 23 10)
              (612 . |completeEval|) (619 . ~=) (625 . |minimumDegree|)
              (630 . |content|) (635 . |exquo|) (641 . |polCase|)
              (648 . |differentiate|) (653 . |differentiate|)
              (658 . |differentiate|) (663 . |differentiate|)
              (668 . |differentiate|) (|Mapping| 23 23) (673 . |map|)
              (679 . |gcd|) (684 . |leadingCoefficient|) (689 . |coefficients|)
              (|Factored| 140) (|TwoFactorize| 8) (694 . |tryTwoFactor|)
              (|Record| (|:| |flag| 73) (|:| |factor| 140) (|:| |exponent| 13))
              (|List| 198) (699 . |factorList|) (704 . |elt|) (710 . *)
              (716 . |generalTwoFactor|)
              (|Record| (|:| |factor| 140) (|:| |exponent| 13)) (|List| 204)
              (721 . |factors|) (726 . |unit|) (731 . |retract|) (736 . *)
              (742 . >) (748 . |position|) (754 . |elt|) (760 . |monomial|)
              (767 . *) (773 . |coerce|) (778 . |ground|) (|Mapping| 23 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 11 23 140)
              (783 . |map|) (|Mapping| 10 23)
              (|UnivariatePolynomialCategoryFunctions2| 23 140 10 11)
              (789 . |map|) (795 . |variables|) (800 . =)
              (|Record| (|:| |flag| 73) (|:| |factor| 9) (|:| |exponent| 13))
              (|List| 225) (806 . |makeFR|) (812 . |degree|)
              (818 . |primeFactor|) (824 . *) (830 . |One|) (834 . *)
              |MFINFACT;factor;PGF;20|)
           '#(|factor| 840) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 233
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
                                                   59 2 23 32 0 0 60 2 63 62 23
                                                   26 64 1 9 0 8 65 2 67 37 66
                                                   23 68 2 43 0 37 13 69 2 43 0
                                                   0 0 70 0 43 0 71 1 37 0 9 72
                                                   2 43 0 37 75 76 1 77 18 37
                                                   78 1 9 8 0 79 2 81 23 80 37
                                                   82 2 77 83 37 18 84 2 83 85
                                                   13 0 86 2 18 6 0 85 87 2 43
                                                   0 37 0 88 2 10 83 0 18 90 1
                                                   9 41 0 91 1 92 9 0 93 1 92
                                                   95 0 96 2 10 83 0 18 97 0 11
                                                   0 98 2 83 26 13 0 99 2 10
                                                   100 0 6 101 1 10 0 102 103 2
                                                   10 32 0 0 104 2 6 26 0 0 105
                                                   2 10 26 0 0 106 2 11 32 0 10
                                                   107 2 10 0 100 6 108 1 23 8
                                                   0 109 2 8 26 0 0 110 1 8 0 0
                                                   111 1 23 0 8 112 1 10 0 23
                                                   113 2 11 0 10 0 114 2 116 0
                                                   0 0 117 2 23 0 8 13 118 0 8
                                                   13 119 1 8 0 120 121 2 23 0
                                                   0 0 122 2 124 26 23 123 125
                                                   1 126 23 120 127 1 126 128
                                                   23 129 2 131 10 130 9 132 6
                                                   137 134 23 123 135 136 18
                                                   136 138 2 23 26 0 0 139 2
                                                   123 140 0 85 141 2 140 0 23
                                                   0 142 7 144 143 11 18 123
                                                   136 16 83 23 145 1 11 0 0
                                                   146 1 10 23 0 147 0 9 0 148
                                                   0 10 0 149 1 10 0 0 150 3 9
                                                   0 0 18 83 151 2 9 0 0 0 152
                                                   1 10 0 0 153 1 9 26 0 154 1
                                                   9 8 0 155 2 9 100 0 6 156 0
                                                   37 0 157 2 37 26 0 0 158 1
                                                   37 13 0 159 1 37 9 0 160 2
                                                   10 0 23 0 161 2 10 0 0 0 162
                                                   1 37 0 0 163 1 23 26 0 164 1
                                                   23 8 0 165 1 23 13 0 166 3 9
                                                   0 0 6 13 167 1 23 0 0 168 0
                                                   8 0 169 2 83 0 0 85 170 2 18
                                                   0 0 85 171 1 140 13 0 172 2
                                                   16 26 0 0 173 2 174 26 136 0
                                                   175 3 10 0 0 18 136 176 1 23
                                                   26 0 177 3 178 140 11 18 136
                                                   179 2 13 26 0 0 180 1 140 13
                                                   0 181 1 140 23 0 182 2 140
                                                   32 0 23 183 3 137 26 23 13
                                                   136 184 1 140 0 0 185 1 8 0
                                                   0 186 1 37 0 0 187 1 23 0 0
                                                   188 1 11 0 0 189 2 140 0 190
                                                   0 191 1 140 0 102 192 1 140
                                                   23 0 193 1 140 136 0 194 1
                                                   196 195 140 197 1 195 199 0
                                                   200 2 199 198 0 85 201 2 85
                                                   0 120 0 202 1 196 195 140
                                                   203 1 195 205 0 206 1 195
                                                   140 0 207 1 140 23 0 208 2
                                                   23 0 8 0 209 2 85 26 0 0 210
                                                   2 18 85 6 0 211 2 83 13 0 85
                                                   212 3 10 0 0 6 13 213 2 10 0
                                                   0 0 214 1 10 0 6 215 1 10 23
                                                   0 216 2 218 140 217 11 219 2
                                                   221 11 220 140 222 1 9 18 0
                                                   223 2 18 26 0 0 224 2 92 0 9
                                                   226 227 2 9 13 0 6 228 2 92
                                                   0 9 13 229 2 92 0 0 0 230 0
                                                   92 0 231 2 92 0 9 0 232 1 0
                                                   43 37 89 1 0 92 9 233)))))
           '|lookupComplete|)) 
