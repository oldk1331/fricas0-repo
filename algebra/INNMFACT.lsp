
(SDEFUN |INNMFACT;convertPUP|
        ((|lfg| |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| P) (|:| |pow| (|NonNegativeInteger|))))))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                          (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG ((#1=#:G140 NIL) (|lff| NIL) (#2=#:G139 NIL))
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
                                      (SPADCALL (QCAR |lff|) (QREFELT $ 18))
                                      (QCDR |lff|))
                                     #2#))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |INNMFACT;supFactor|
        ((|um| |SparseUnivariatePolynomial| P)
         (|ufactor| |Mapping| #1=(|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                          (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((#2=#:G181 NIL) (|uum1| (R)) (|lcfacs| (R)) (#3=#:G178 NIL)
          (#4=#:G177 (R)) (#5=#:G179 (R)) (#6=#:G199 NIL) (|f| NIL)
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                      (|:| |pow| (|NonNegativeInteger|)))))
          (|auxfl|
           (|List|
            #7=(|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                         (|:| |pow| (|NonNegativeInteger|)))))
          (#8=#:G198 NIL) (|lfp| NIL) (#9=#:G197 NIL)
          (|lf| (|List| (|SparseUnivariatePolynomial| P)))
          (|ldeg| (|List| #10=(|NonNegativeInteger|))) (#11=#:G167 NIL)
          (#12=#:G166 #10#) (#13=#:G168 #10#) (#14=#:G196 NIL) (|fc| NIL)
          (#15=#:G195 NIL) (|xx| NIL) (#16=#:G194 NIL) (|coefs| (|List| P))
          (#17=#:G193 NIL) (|lff| NIL) (#18=#:G192 NIL) (|lcont| (P))
          (|lfg|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|NonNegativeInteger|)))))))
          (|ffexp| #19=(|NonNegativeInteger|))
          (|ffactor| #20=(|SparseUnivariatePolynomial| P)) (#21=#:G191 NIL)
          (|fact| NIL)
          (|sqqfact|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #20#) (|:| |exponent| #19#))))
          (|flead| (|Record| (|:| |contp| R) (|:| |factors| (|List| #7#))))
          (|sqfacs| (|Factored| (|SparseUnivariatePolynomial| P)))
          (|uum|
           (|Record| (|:| |unit| (|SparseUnivariatePolynomial| P))
                     (|:| |canonical| (|SparseUnivariatePolynomial| P))
                     (|:| |associate| (|SparseUnivariatePolynomial| P))))
          (#22=#:G187 NIL) (#23=#:G153 NIL)
          (|f1| (|SparseUnivariatePolynomial| P))
          (|mdeg| (|NonNegativeInteger|)) (#24=#:G190 NIL) (|ff| NIL)
          (#25=#:G189 NIL) (|lfact| #1#)
          (|umv| (|SparseUnivariatePolynomial| R)) (|lvar| #26=(|List| OV))
          (#27=#:G144 NIL) (#28=#:G143 #26#) (#29=#:G145 #26#) (#30=#:G188 NIL)
          (|cf| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |um| (QREFELT $ 20))
             (|INNMFACT;convertPUP|
              (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT $ 21)) |ufactor| $)
              $))
            (#31='T
             (SEQ
              (LETT |lvar|
                    (PROGN
                     (LETT #27# NIL)
                     (SEQ (LETT |cf| NIL)
                          (LETT #30# (SPADCALL |um| (QREFELT $ 23))) G190
                          (COND
                           ((OR (ATOM #30#) (PROGN (LETT |cf| (CAR #30#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #29# (SPADCALL |cf| (QREFELT $ 25)))
                             (COND
                              (#27#
                               (LETT #28# (SPADCALL #28# #29# (QREFELT $ 26))))
                              ('T (PROGN (LETT #28# #29#) (LETT #27# 'T)))))))
                          (LETT #30# (CDR #30#)) (GO G190) G191 (EXIT NIL))
                     (COND (#27# #28#) (#31# (|IdentityError| '|setUnion|)))))
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ (LETT |umv| (SPADCALL (ELT $ 27) |um| (QREFELT $ 31)))
                      (LETT |lfact| (SPADCALL |umv| |ufactor|))
                      (EXIT
                       (CONS
                        (SPADCALL (SPADCALL |lfact| (QREFELT $ 33))
                                  (QREFELT $ 34))
                        (PROGN
                         (LETT #25# NIL)
                         (SEQ (LETT |ff| NIL)
                              (LETT #24# (SPADCALL |lfact| (QREFELT $ 38)))
                              G190
                              (COND
                               ((OR (ATOM #24#)
                                    (PROGN (LETT |ff| (CAR #24#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #25#
                                      (CONS
                                       (CONS
                                        (SPADCALL (ELT $ 39) (QVELT |ff| 1)
                                                  (QREFELT $ 42))
                                        (QVELT |ff| 2))
                                       #25#))))
                              (LETT #24# (CDR #24#)) (GO G190) G191
                              (EXIT (NREVERSE #25#))))))))
                (#31#
                 (SEQ (LETT |flead| (CONS (|spadConstant| $ 44) NIL))
                      (LETT |factorlist| NIL)
                      (LETT |mdeg| (SPADCALL |um| (QREFELT $ 46)))
                      (COND
                       ((SPADCALL |mdeg| 0 (QREFELT $ 47))
                        (SEQ
                         (LETT |f1|
                               (SPADCALL (|spadConstant| $ 49) |mdeg|
                                         (QREFELT $ 50)))
                         (LETT |um|
                               (PROG2
                                   (LETT #23#
                                         (SPADCALL |um| |f1| (QREFELT $ 52)))
                                   (QCDR #23#)
                                 (|check_union2| (QEQCAR #23# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 9))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 9))
                                                  "failed")
                                                 #23#)))
                         (LETT |factorlist|
                               (CONS
                                (CONS
                                 (SPADCALL (|spadConstant| $ 49) 1
                                           (QREFELT $ 50))
                                 |mdeg|)
                                |factorlist|))
                         (EXIT
                          (COND
                           ((EQL (SPADCALL |um| (QREFELT $ 53)) 0)
                            (PROGN
                             (LETT #22#
                                   (SEQ
                                    (LETT |lfg|
                                          (|INNMFACT;convertPUP|
                                           (|INNMFACT;mFactor|
                                            (SPADCALL |um| (QREFELT $ 21))
                                            |ufactor| $)
                                           $))
                                    (EXIT
                                     (CONS (QCAR |lfg|)
                                           (SPADCALL |factorlist| (QCDR |lfg|)
                                                     (QREFELT $ 56))))))
                             (GO #32=#:G186))))))))
                      (LETT |uum| (SPADCALL |um| (QREFELT $ 58)))
                      (LETT |um| (QVELT |uum| 1))
                      (LETT |sqfacs| (SPADCALL |um| (QREFELT $ 61)))
                      (LETT |lcont|
                            (SPADCALL
                             (SPADCALL (QVELT |uum| 0)
                                       (SPADCALL |sqfacs| (QREFELT $ 62))
                                       (QREFELT $ 63))
                             (QREFELT $ 21)))
                      (LETT |flead|
                            (|INNMFACT;convertPUP|
                             (|INNMFACT;mFactor| |lcont| |ufactor| $) $))
                      (LETT |factorlist|
                            (SPADCALL (QCDR |flead|) |factorlist|
                                      (QREFELT $ 56)))
                      (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 66)))
                      (SEQ (LETT |fact| NIL) (LETT #21# |sqqfact|) G190
                           (COND
                            ((OR (ATOM #21#)
                                 (PROGN (LETT |fact| (CAR #21#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |ffactor| (QVELT |fact| 1))
                                (LETT |ffexp| (QVELT |fact| 2))
                                (EXIT
                                 (COND
                                  ((ZEROP (SPADCALL |ffactor| (QREFELT $ 53)))
                                   (SEQ
                                    (LETT |lfg|
                                          (|INNMFACT;mFactor|
                                           (SPADCALL |ffactor| (QREFELT $ 21))
                                           |ufactor| $))
                                    (LETT |lcont|
                                          (SPADCALL (QCAR |lfg|) |lcont|
                                                    (QREFELT $ 67)))
                                    (EXIT
                                     (LETT |factorlist|
                                           (SPADCALL |factorlist|
                                                     (PROGN
                                                      (LETT #18# NIL)
                                                      (SEQ (LETT |lff| NIL)
                                                           (LETT #17#
                                                                 (QCDR |lfg|))
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #17#)
                                                                 (PROGN
                                                                  (LETT |lff|
                                                                        (CAR
                                                                         #17#))
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #18#
                                                                   (CONS
                                                                    (CONS
                                                                     (SPADCALL
                                                                      (QCAR
                                                                       |lff|)
                                                                      (QREFELT
                                                                       $ 18))
                                                                     (*
                                                                      (QCDR
                                                                       |lff|)
                                                                      |ffexp|))
                                                                    #18#))))
                                                           (LETT #17#
                                                                 (CDR #17#))
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #18#))))
                                                     (QREFELT $ 56))))))
                                  ('T
                                   (SEQ
                                    (LETT |coefs|
                                          (SPADCALL |ffactor| (QREFELT $ 23)))
                                    (LETT |ldeg|
                                          (PROGN
                                           (LETT #16# NIL)
                                           (SEQ (LETT |xx| NIL)
                                                (LETT #15# |lvar|) G190
                                                (COND
                                                 ((OR (ATOM #15#)
                                                      (PROGN
                                                       (LETT |xx| (CAR #15#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #16#
                                                        (CONS
                                                         (PROGN
                                                          (LETT #11# NIL)
                                                          (SEQ (LETT |fc| NIL)
                                                               (LETT #14#
                                                                     |coefs|)
                                                               G190
                                                               (COND
                                                                ((OR
                                                                  (ATOM #14#)
                                                                  (PROGN
                                                                   (LETT |fc|
                                                                         (CAR
                                                                          #14#))
                                                                   NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (PROGN
                                                                  (LETT #13#
                                                                        (SPADCALL
                                                                         |fc|
                                                                         |xx|
                                                                         (QREFELT
                                                                          $
                                                                          68)))
                                                                  (COND
                                                                   (#11#
                                                                    (LETT #12#
                                                                          (MAX
                                                                           #12#
                                                                           #13#)))
                                                                   ('T
                                                                    (PROGN
                                                                     (LETT #12#
                                                                           #13#)
                                                                     (LETT #11#
                                                                           'T)))))))
                                                               (LETT #14#
                                                                     (CDR
                                                                      #14#))
                                                               (GO G190) G191
                                                               (EXIT NIL))
                                                          (COND (#11# #12#)
                                                                ('T
                                                                 (|IdentityError|
                                                                  '|max|))))
                                                         #16#))))
                                                (LETT #15# (CDR #15#))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #16#)))))
                                    (LETT |lf|
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |ffactor|
                                                       (QREFELT $ 69))
                                             (QREFELT $ 70))
                                            (|INNMFACT;mfconst| |ffactor|
                                             |lvar| |ldeg| |ufactor| $))
                                           ('T
                                            (|INNMFACT;mfpol| |ffactor| |lvar|
                                             |ldeg| |ufactor| $))))
                                    (LETT |auxfl|
                                          (PROGN
                                           (LETT #9# NIL)
                                           (SEQ (LETT |lfp| NIL)
                                                (LETT #8# |lf|) G190
                                                (COND
                                                 ((OR (ATOM #8#)
                                                      (PROGN
                                                       (LETT |lfp| (CAR #8#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #9#
                                                        (CONS
                                                         (CONS |lfp| |ffexp|)
                                                         #9#))))
                                                (LETT #8# (CDR #8#)) (GO G190)
                                                G191 (EXIT (NREVERSE #9#)))))
                                    (EXIT
                                     (LETT |factorlist|
                                           (SPADCALL |factorlist| |auxfl|
                                                     (QREFELT $ 56)))))))))
                           (LETT #21# (CDR #21#)) (GO G190) G191 (EXIT NIL))
                      (LETT |lcfacs|
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |f| NIL) (LETT #6# |factorlist|) G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN (LETT |f| (CAR #6#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QCAR |f|)
                                                       (QREFELT $ 69))
                                             (QREFELT $ 71))
                                            (QCDR |f|) (QREFELT $ 72)))
                                     (COND
                                      (#3#
                                       (LETT #4#
                                             (SPADCALL #4# #5#
                                                       (QREFELT $ 73))))
                                      ('T
                                       (PROGN
                                        (LETT #4# #5#)
                                        (LETT #3# 'T)))))))
                                  (LETT #6# (CDR #6#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#3# #4#) (#31# (|spadConstant| $ 48)))))
                      (LETT |uum1|
                            (SPADCALL (SPADCALL (QVELT |uum| 0) (QREFELT $ 74))
                                      (QREFELT $ 75)))
                      (EXIT
                       (CONS
                        (SPADCALL |uum1|
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |um| (QREFELT $ 69))
                                              (QREFELT $ 71))
                                             |lcfacs| (QREFELT $ 76)))
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT $ 8)
                                                    (|Union| (QREFELT $ 8)
                                                             "failed")
                                                    #2#))
                                  (QREFELT $ 73))
                        |factorlist|))))))))))
          #32# (EXIT #22#)))) 

(SDEFUN |INNMFACT;factor;SupMF;3|
        ((|um| |SparseUnivariatePolynomial| P)
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Factored| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((#1=#:G203 NIL)
          (#2=#:G202 #3=(|Factored| (|SparseUnivariatePolynomial| P)))
          (#4=#:G204 #3#) (#5=#:G208 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| P))
                            (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ (LETT |flist| (|INNMFACT;supFactor| |um| |ufactor| $))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 39))
                          (QREFELT $ 18))
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |u| NIL) (LETT #5# (QCDR |flist|)) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL (QCAR |u|) (QCDR |u|) (QREFELT $ 77)))
                         (COND
                          (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 78))))
                          ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 79))))
                (QREFELT $ 80)))))) 

(SDEFUN |INNMFACT;varChoose|
        ((|m| P) (|lvar| |List| OV) (|ldeg| |List| #1=(|NonNegativeInteger|))
         ($ |Record| (|:| |npol| (|SparseUnivariatePolynomial| P))
          (|:| |nvar| (|List| OV))
          (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|x| (OV)) (|i| (|Integer|)) (|k| #1#) (#2=#:G211 NIL)
          (#3=#:G210 #1#) (#4=#:G212 #1#) (#5=#:G216 NIL) (|d| NIL))
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
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 68)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 84)) |lvar|
                     |ldeg|))
            (#6#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 86)))
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 87)))
                  (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 88))))
                  (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 89))))
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT $ 84)) |lvar|
                           |ldeg|))))))))) 

(SDEFUN |INNMFACT;localNorm|
        ((|lum| |List| (|SparseUnivariatePolynomial| R)) ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G221 NIL) (#3=#:G220 #1#) (#4=#:G222 #1#) (#5=#:G224 NIL)
          (#6=#:G223 #1#) (#7=#:G225 #1#) (|cc| (R)) (#8=#:G229 NIL) (|i| NIL)
          (#9=#:G228 NIL) (|ff| NIL) (#10=#:G218 NIL) (#11=#:G217 #1#)
          (#12=#:G219 #1#) (#13=#:G227 NIL))
         (SEQ
          (COND
           ((|domainEqual| (QREFELT $ 8) (|AlgebraicNumber|))
            (PROGN
             (LETT #10# NIL)
             (SEQ (LETT |ff| NIL) (LETT #13# |lum|) G190
                  (COND
                   ((OR (ATOM #13#) (PROGN (LETT |ff| (CAR #13#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #12# (SPADCALL |ff| (QREFELT $ 90)))
                     (COND (#10# (LETT #11# (MAX #11# #12#)))
                           ('T (PROGN (LETT #11# #12#) (LETT #10# 'T)))))))
                  (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
             (COND (#10# #11#) (#14='T (|IdentityError| '|max|)))))
           (#14#
            (PROGN
             (LETT #2# NIL)
             (SEQ (LETT |ff| NIL) (LETT #9# |lum|) G190
                  (COND
                   ((OR (ATOM #9#) (PROGN (LETT |ff| (CAR #9#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #5# NIL)
                            (SEQ (LETT |i| 0)
                                 (LETT #8# (SPADCALL |ff| (QREFELT $ 91))) G190
                                 (COND ((|greater_SI| |i| #8#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (LETT |cc|
                                            (SPADCALL |ff| |i| (QREFELT $ 92)))
                                      (|spadConstant| $ 44) (QREFELT $ 93))
                                     (PROGN
                                      (LETT #7# (SPADCALL |cc| (QREFELT $ 94)))
                                      (COND (#5# (LETT #6# (+ #6# #7#)))
                                            ('T
                                             (PROGN
                                              (LETT #6# #7#)
                                              (LETT #5# 'T)))))))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#5# #6#) ('T 0))))
                     (COND (#2# (LETT #3# (MAX #3# #4#)))
                           ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                  (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#14# (|IdentityError| '|max|))))))))) 

(SDEFUN |INNMFACT;intChoose|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV) (|clc| R)
         (|plist| |List| P) (|ltry| |List| (|List| R))
         (|ufactor| |Mapping| #1=(|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Union|
          (|Record| (|:| |inval| (|List| (|List| R)))
                    (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                    (|:| |lu| R) (|:| |complead| (|List| R)))
          "failed"))
        (SPROG
         ((|nfatt| (|NonNegativeInteger|)) (|int| #2=(|List| R))
          (|leadcomp| #2#) (|lffc| (R))
          (|unifact| (|List| (|SparseUnivariatePolynomial| R))) (#3=#:G291 NIL)
          (|uf| NIL) (#4=#:G290 NIL) (|leadtest| (|Boolean|)) (#5=#:G289 NIL)
          (#6=#:G288 NIL) (#7=#:G273 NIL) (#8=#:G287 NIL) (#9=#:G286 NIL)
          (#10=#:G285 NIL) (#11=#:G284 NIL) (#12=#:G283 NIL) (|ff| NIL)
          (#13=#:G282 NIL) (#14=#:G281 NIL) (#15=#:G280 NIL)
          (|nf| (|NonNegativeInteger|)) (|lffc1| (R))
          (|lunivf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|luniv| #1#) (|range| (|NonNegativeInteger|))
          (|newm| (|SparseUnivariatePolynomial| R)) (#16=#:G245 NIL)
          (#17=#:G239 NIL) (#18=#:G238 #19=(|Boolean|)) (#20=#:G240 #19#)
          (#21=#:G279 NIL) (|epl| NIL) (|leadcomp1| #2#) (#22=#:G278 NIL)
          (|pol| NIL) (#23=#:G277 NIL) (|lval| (|List| R)) (#24=#:G276 NIL)
          (|i| NIL) (#25=#:G275 NIL) (#26=#:G274 NIL)
          (|newunifact| (|List| (|SparseUnivariatePolynomial| R)))
          (|testp| (|Boolean|)) (|ctf1| (R)) (|nvar1| (|NonNegativeInteger|))
          (|degum| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |degum| (SPADCALL |um| (QREFELT $ 53)))
                (LETT |nvar1| (LENGTH |lvar|)) (LETT |range| 5)
                (LETT |ctf1| (|spadConstant| $ 48))
                (LETT |testp| (NULL (NULL |plist|)))
                (LETT |leadcomp| (LETT |leadcomp1| NIL))
                (LETT |nfatt| (+ |degum| 1))
                (LETT |lffc| (|spadConstant| $ 48)) (LETT |lffc1| |lffc|)
                (LETT |newunifact| NIL) (LETT |leadtest| 'T) (LETT |int| NIL)
                (SEQ
                 (EXIT
                  (SEQ G190 (COND ((NULL 'T) (GO G191)))
                       (SEQ
                        (COND
                         (|testp|
                          (COND
                           ((SPADCALL (LENGTH |ltry|) 10 (QREFELT $ 47))
                            (EXIT
                             (PROGN
                              (LETT #26# (CONS 1 "failed"))
                              (GO #27=#:G272)))))))
                        (LETT |lval|
                              (PROGN
                               (LETT #25# NIL)
                               (SEQ (LETT |i| 1) (LETT #24# |nvar1|) G190
                                    (COND ((|greater_SI| |i| #24#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #25#
                                            (CONS
                                             (SPADCALL |range| (QREFELT $ 96))
                                             #25#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #25#)))))
                        (EXIT
                         (COND
                          ((SPADCALL |lval| |ltry| (QREFELT $ 99))
                           (LETT |range| (SPADCALL 2 |range| (QREFELT $ 100))))
                          ('T
                           (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                (LETT |leadcomp1|
                                      (PROGN
                                       (LETT #23# NIL)
                                       (SEQ (LETT |pol| NIL)
                                            (LETT #22# |plist|) G190
                                            (COND
                                             ((OR (ATOM #22#)
                                                  (PROGN
                                                   (LETT |pol| (CAR #22#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #23#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL |pol| |lvar|
                                                                |lval|
                                                                (QREFELT $
                                                                         101))
                                                      (QREFELT $ 75))
                                                     #23#))))
                                            (LETT #22# (CDR #22#)) (GO G190)
                                            G191 (EXIT (NREVERSE #23#)))))
                                (COND
                                 (|testp|
                                  (COND
                                   ((PROGN
                                     (LETT #17# NIL)
                                     (SEQ (LETT |epl| NIL)
                                          (LETT #21# |leadcomp1|) G190
                                          (COND
                                           ((OR (ATOM #21#)
                                                (PROGN
                                                 (LETT |epl| (CAR #21#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #20#
                                                   (SPADCALL |epl|
                                                             (QREFELT $ 102)))
                                             (COND
                                              (#17#
                                               (LETT #18#
                                                     (COND (#18# 'T)
                                                           ('T #20#))))
                                              ('T
                                               (PROGN
                                                (LETT #18# #20#)
                                                (LETT #17# 'T)))))))
                                          (LETT #21# (CDR #21#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND (#17# #18#) ('T NIL)))
                                    (EXIT
                                     (LETT |range|
                                           (SPADCALL 2 |range|
                                                     (QREFELT $ 100))))))))
                                (LETT |newm|
                                      (SPADCALL |um| |lvar| |lval|
                                                (QREFELT $ 103)))
                                (COND
                                 ((OR
                                   (SPADCALL |degum|
                                             (SPADCALL |newm| (QREFELT $ 91))
                                             (QREFELT $ 104))
                                   (SPADCALL (SPADCALL |newm| (QREFELT $ 105))
                                             0 (QREFELT $ 104)))
                                  (EXIT
                                   (LETT |range|
                                         (SPADCALL 2 |range|
                                                   (QREFELT $ 100))))))
                                (LETT |lffc1|
                                      (SPADCALL |newm| (QREFELT $ 106)))
                                (LETT |newm|
                                      (PROG2
                                          (LETT #16#
                                                (SPADCALL |newm| |lffc1|
                                                          (QREFELT $ 107)))
                                          (QCDR #16#)
                                        (|check_union2| (QEQCAR #16# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 8))
                                                        (|Union|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 8))
                                                         "failed")
                                                        #16#)))
                                (COND
                                 (|testp|
                                  (COND
                                   (|leadtest|
                                    (COND
                                     ((NULL
                                       (SPADCALL
                                        (SPADCALL |lffc1| |clc| (QREFELT $ 73))
                                        (LENGTH |plist|) |leadcomp1|
                                        (QREFELT $ 109)))
                                      (EXIT
                                       (LETT |range|
                                             (SPADCALL 2 |range|
                                                       (QREFELT $ 100))))))))))
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (LIST |newm|
                                            (SPADCALL |newm| (QREFELT $ 110)))
                                      (QREFELT $ 112))
                                     (QREFELT $ 91))
                                    0 (QREFELT $ 104))
                                   (LETT |range|
                                         (SPADCALL 2 |range| (QREFELT $ 100))))
                                  ('T
                                   (SEQ
                                    (LETT |luniv| (SPADCALL |newm| |ufactor|))
                                    (LETT |lunivf|
                                          (SPADCALL |luniv| (QREFELT $ 38)))
                                    (LETT |lffc1|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |luniv| (QREFELT $ 33))
                                            (QREFELT $ 34))
                                           |lffc1| (QREFELT $ 73)))
                                    (LETT |nf| (LENGTH |lunivf|))
                                    (COND
                                     ((OR (EQL |nf| 0)
                                          (SPADCALL |nf| |nfatt|
                                                    (QREFELT $ 47)))
                                      (EXIT "next values")))
                                    (COND
                                     ((EQL |nf| 1)
                                      (SEQ (LETT |unifact| (LIST |newm|))
                                           (EXIT
                                            (PROGN
                                             (LETT #7# |$NoValue|)
                                             (GO #28=#:G270))))))
                                    (EXIT
                                     (COND
                                      ((EQL |nfatt| |nf|)
                                       (SEQ
                                        (COND
                                         (|leadtest|
                                          (SEQ
                                           (LETT |unifact|
                                                 (PROGN
                                                  (LETT #15# NIL)
                                                  (SEQ (LETT |uf| NIL)
                                                       (LETT #14# |lunivf|)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #14#)
                                                             (PROGN
                                                              (LETT |uf|
                                                                    (CAR #14#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #15#
                                                               (CONS
                                                                (QVELT |uf| 1)
                                                                #15#))))
                                                       (LETT #14# (CDR #14#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #15#)))))
                                           (LETT |int| |lval|)
                                           (LETT |lffc| |lffc1|)
                                           (EXIT
                                            (COND
                                             (|testp|
                                              (LETT |leadcomp|
                                                    |leadcomp1|))))))
                                         ((SPADCALL
                                           (|INNMFACT;localNorm| |unifact| $)
                                           (|INNMFACT;localNorm|
                                            (PROGN
                                             (LETT #13# NIL)
                                             (SEQ (LETT |ff| NIL)
                                                  (LETT #12# |lunivf|) G190
                                                  (COND
                                                   ((OR (ATOM #12#)
                                                        (PROGN
                                                         (LETT |ff| (CAR #12#))
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #13#
                                                          (CONS (QVELT |ff| 1)
                                                                #13#))))
                                                  (LETT #12# (CDR #12#))
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #13#))))
                                            $)
                                           (QREFELT $ 113))
                                          (COND
                                           (|testp|
                                            (COND
                                             ((SPADCALL
                                               (SPADCALL |lffc1| |clc|
                                                         (QREFELT $ 73))
                                               (LENGTH |plist|) |leadcomp1|
                                               (QREFELT $ 109))
                                              (SEQ
                                               (LETT |unifact|
                                                     (PROGN
                                                      (LETT #11# NIL)
                                                      (SEQ (LETT |uf| NIL)
                                                           (LETT #10# |lunivf|)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #10#)
                                                                 (PROGN
                                                                  (LETT |uf|
                                                                        (CAR
                                                                         #10#))
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #11#
                                                                   (CONS
                                                                    (QVELT |uf|
                                                                           1)
                                                                    #11#))))
                                                           (LETT #10#
                                                                 (CDR #10#))
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #11#)))))
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
                                                    (LETT #9# NIL)
                                                    (SEQ (LETT |uf| NIL)
                                                         (LETT #8# |lunivf|)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #8#)
                                                               (PROGN
                                                                (LETT |uf|
                                                                      (CAR
                                                                       #8#))
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #9#
                                                                 (CONS
                                                                  (QVELT |uf|
                                                                         1)
                                                                  #9#))))
                                                         (LETT #8# (CDR #8#))
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #9#)))))
                                             (LETT |int| |lval|)
                                             (LETT |lffc| |lffc1|)
                                             (EXIT
                                              (COND
                                               (|testp|
                                                (LETT |leadcomp|
                                                      |leadcomp1|)))))))))
                                        (EXIT
                                         (PROGN
                                          (LETT #7# |$NoValue|)
                                          (GO #28#)))))
                                      ((SPADCALL |nfatt| |degum|
                                                 (QREFELT $ 47))
                                       (SEQ
                                        (LETT |unifact|
                                              (PROGN
                                               (LETT #6# NIL)
                                               (SEQ (LETT |uf| NIL)
                                                    (LETT #5# |lunivf|) G190
                                                    (COND
                                                     ((OR (ATOM #5#)
                                                          (PROGN
                                                           (LETT |uf|
                                                                 (CAR #5#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #6#
                                                            (CONS
                                                             (QVELT |uf| 1)
                                                             #6#))))
                                                    (LETT #5# (CDR #5#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #6#)))))
                                        (LETT |lffc| |lffc1|)
                                        (COND
                                         (|testp|
                                          (LETT |leadcomp| |leadcomp1|)))
                                        (LETT |int| |lval|)
                                        (LETT |leadtest| NIL)
                                        (EXIT (LETT |nfatt| |nf|))))
                                      ((SPADCALL |nfatt| |nf| (QREFELT $ 47))
                                       (SEQ
                                        (COND
                                         (|testp|
                                          (LETT |leadtest|
                                                (NULL
                                                 (SPADCALL
                                                  (SPADCALL |lffc| |clc|
                                                            (QREFELT $ 73))
                                                  (LENGTH |plist|) |leadcomp|
                                                  (QREFELT $ 109)))))
                                         ('T (LETT |leadtest| NIL)))
                                        (COND
                                         ((NULL |leadtest|)
                                          (SEQ
                                           (LETT |unifact|
                                                 (PROGN
                                                  (LETT #4# NIL)
                                                  (SEQ (LETT |uf| NIL)
                                                       (LETT #3# |lunivf|) G190
                                                       (COND
                                                        ((OR (ATOM #3#)
                                                             (PROGN
                                                              (LETT |uf|
                                                                    (CAR #3#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #4#
                                                               (CONS
                                                                (QVELT |uf| 1)
                                                                #4#))))
                                                       (LETT #3# (CDR #3#))
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #4#)))))
                                           (LETT |lffc| |lffc1|)
                                           (COND
                                            (|testp|
                                             (LETT |leadcomp| |leadcomp1|)))
                                           (EXIT (LETT |int| |lval|)))))
                                        (EXIT (LETT |nfatt| |nf|)))))))))))))))
                       NIL (GO G190) G191 (EXIT NIL)))
                 #28# (EXIT #7#))
                (EXIT
                 (CONS 0
                       (VECTOR (CONS |int| |ltry|) |unifact| |lffc|
                               |leadcomp|)))))
          #27# (EXIT #26#)))) 

(SDEFUN |INNMFACT;simplify|
        ((|m| P) (|lvar| |List| OV) (|lmdeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| P) (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((|flead|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|NonNegativeInteger|)))))))
          (#1=#:G298 NIL)
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| P) (|:| |pow| (|NonNegativeInteger|)))))
          (|pol1| (P)) (|i| (|NonNegativeInteger|)) (#2=#:G305 NIL) (|x| NIL))
         (SEQ (LETT |factorlist| NIL) (LETT |pol1| (|spadConstant| $ 49))
              (SEQ (LETT |x| NIL) (LETT #2# |lvar|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT $ 114))
                                    (QREFELT $ 115)))
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| $ 49)
                                                       |x| |i| (QREFELT $ 116))
                                             (QREFELT $ 117)))
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT $ 118)) |i|)
                                     |factorlist|))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2 (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 119)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                      (|Union| (QREFELT $ 9) "failed") #1#)))
              (EXIT
               (COND
                ((SPADCALL |m| (QREFELT $ 70))
                 (CONS (SPADCALL |m| (QREFELT $ 75)) |factorlist|))
                ('T
                 (SEQ (LETT |flead| (|INNMFACT;mFactor| |m| |ufactor| $))
                      (PROGN
                       (RPLACD |flead|
                               (SPADCALL |factorlist| (QCDR |flead|)
                                         (QREFELT $ 122)))
                       (QCDR |flead|))
                      (EXIT |flead|)))))))) 

(SDEFUN |INNMFACT;intfact|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|tleadpol| |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| P) (|:| |pow| (|NonNegativeInteger|))))))
         (|ltry| |List| (|List| R))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|factfin| (|List| (|SparseUnivariatePolynomial| P))) (#1=#:G458 NIL)
          (|ff| NIL) (#2=#:G457 NIL)
          (|ffin| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|umd| (|SparseUnivariatePolynomial| P)) (#3=#:G439 NIL)
          (|unifact| (|List| (|SparseUnivariatePolynomial| R))) (#4=#:G456 NIL)
          (|unif| NIL) (#5=#:G455 NIL) (|dd| (R)) (|lpol| (|List| P))
          (|dist|
           (|Record| (|:| |polfac| (|List| P)) (|:| |correct| R)
                     (|:| |corrfact|
                          (|List| (|SparseUnivariatePolynomial| R)))))
          (#6=#:G452 NIL)
          (|distf|
           (|Union|
            (|Record| (|:| |polfac| (|List| P)) (|:| |correct| R)
                      (|:| |corrfact|
                           (|List| (|SparseUnivariatePolynomial| R))))
            "failed"))
          (|leadval| (|List| R)) (|lval| (|List| R))
          (|nfact| (|NonNegativeInteger|))
          (|vfchoo|
           (|Record| (|:| |inval| (|List| (|List| R)))
                     (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lu| R) (|:| |complead| (|List| R))))
          (#7=#:G232 NIL)
          (|check|
           (|Union|
            (|Record| (|:| |inval| (|List| (|List| R)))
                      (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                      (|:| |lu| R) (|:| |complead| (|List| R)))
            #8="failed"))
          (|leadpol| (|List| P)) (#9=#:G454 NIL) (#10=#:G453 NIL)
          (|polcase| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ (LETT |polcase| (NULL (NULL (QCDR |tleadpol|))))
                (LETT |vfchoo|
                      (COND
                       (|polcase|
                        (SEQ
                         (LETT |leadpol|
                               (PROGN
                                (LETT #10# NIL)
                                (SEQ (LETT |ff| NIL)
                                     (LETT #9# (QCDR |tleadpol|)) G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN (LETT |ff| (CAR #9#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #10# (CONS (QCAR |ff|) #10#))))
                                     (LETT #9# (CDR #9#)) (GO G190) G191
                                     (EXIT (NREVERSE #10#)))))
                         (LETT |check|
                               (|INNMFACT;intChoose| |um| |lvar|
                                (QCAR |tleadpol|) |leadpol| |ltry| |ufactor|
                                $))
                         (EXIT
                          (COND
                           ((QEQCAR |check| 1)
                            (PROGN
                             (LETT #6#
                                   (|INNMFACT;monicMfpol| |um| |lvar| |ldeg|
                                    |ufactor| $))
                             (GO #11=#:G451)))
                           (#12='T (QCDR |check|))))))
                       (#12#
                        (PROG2
                            (LETT #7#
                                  (|INNMFACT;intChoose| |um| |lvar|
                                   (|spadConstant| $ 48) NIL NIL |ufactor| $))
                            (QCDR #7#)
                          (|check_union2| (QEQCAR #7# 0)
                                          (|Record|
                                           (|:| |inval|
                                                (|List|
                                                 (|List| (QREFELT $ 8))))
                                           (|:| |unvfact|
                                                (|List|
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 8))))
                                           (|:| |lu| (QREFELT $ 8))
                                           (|:| |complead|
                                                (|List| (QREFELT $ 8))))
                                          (|Union|
                                           (|Record|
                                            (|:| |inval|
                                                 (|List|
                                                  (|List| (QREFELT $ 8))))
                                            (|:| |unvfact|
                                                 (|List|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 8))))
                                            (|:| |lu| (QREFELT $ 8))
                                            (|:| |complead|
                                                 (|List| (QREFELT $ 8))))
                                           #8#)
                                          #7#)))))
                (LETT |unifact| (QVELT |vfchoo| 1))
                (LETT |nfact| (LENGTH |unifact|))
                (EXIT
                 (COND ((EQL |nfact| 1) (LIST |um|))
                       (#12#
                        (SEQ (LETT |ltry| (QVELT |vfchoo| 0))
                             (LETT |lval| (|SPADfirst| |ltry|))
                             (LETT |dd| (QVELT |vfchoo| 2))
                             (LETT |leadval| NIL) (LETT |lpol| NIL)
                             (COND
                              (|polcase|
                               (SEQ (LETT |leadval| (QVELT |vfchoo| 3))
                                    (LETT |distf|
                                          (SPADCALL (QVELT |vfchoo| 2)
                                                    |unifact| |tleadpol|
                                                    |leadval| |lvar| |lval|
                                                    (QREFELT $ 127)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |distf| 1)
                                       (PROGN
                                        (LETT #6#
                                              (|INNMFACT;intfact| |um| |lvar|
                                               |ldeg| |tleadpol| |ltry|
                                               |ufactor| $))
                                        (GO #11#)))
                                      (#12#
                                       (SEQ (LETT |dist| (QCDR |distf|))
                                            (LETT |lpol| (QVELT |dist| 0))
                                            (LETT |dd| (QVELT |dist| 1))
                                            (EXIT
                                             (LETT |unifact|
                                                   (QVELT |dist| 2))))))))))
                             (COND
                              ((SPADCALL |dd| (|spadConstant| $ 48)
                                         (QREFELT $ 93))
                               (SEQ
                                (LETT |unifact|
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |unif| NIL)
                                            (LETT #4# |unifact|) G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |unif| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |dd| |unif|
                                                               (QREFELT $ 128))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#)))))
                                (EXIT
                                 (LETT |umd|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |dd|
                                                   (PROG1
                                                       (LETT #3# (- |nfact| 1))
                                                     (|check_subtype2|
                                                      (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                                   (QREFELT $ 72))
                                         (QREFELT $ 39))
                                        |um| (QREFELT $ 129))))))
                              (#12# (LETT |umd| |um|)))
                             (LETT |ffin|
                                   (SPADCALL |umd| |lvar| |unifact| |lval|
                                             |lpol| |ldeg| (QREFELT $ 16)
                                             (QREFELT $ 132)))
                             (EXIT
                              (COND
                               ((QEQCAR |ffin| 1)
                                (|INNMFACT;intfact| |um| |lvar| |ldeg|
                                 |tleadpol| |ltry| |ufactor| $))
                               (#12#
                                (SEQ (LETT |factfin| (QCDR |ffin|))
                                     (COND
                                      ((SPADCALL |dd| (|spadConstant| $ 48)
                                                 (QREFELT $ 93))
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
                                                                       $ 133))
                                                            #2#))))
                                                   (LETT #1# (CDR #1#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #2#)))))))
                                     (EXIT |factfin|)))))))))))
          #11# (EXIT #6#)))) 

(SDEFUN |INNMFACT;mfconst|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((#1=#:G470 NIL) (|uf| NIL) (#2=#:G469 NIL)
          (|lum|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|factfin| (|List| (|SparseUnivariatePolynomial| P))))
         (SEQ (LETT |factfin| NIL)
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ
                  (LETT |lum|
                        (SPADCALL
                         (SPADCALL (SPADCALL (ELT $ 27) |um| (QREFELT $ 31))
                                   |ufactor|)
                         (QREFELT $ 38)))
                  (EXIT
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |uf| NIL) (LETT #1# |lum|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |uf| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL (ELT $ 39) (QVELT |uf| 1)
                                            (QREFELT $ 42))
                                  #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))
                ('T
                 (|INNMFACT;intfact| |um| |lvar| |ldeg|
                  (CONS (|spadConstant| $ 44) NIL) NIL |ufactor| $))))))) 

(SDEFUN |INNMFACT;monicize|
        ((|um| |SparseUnivariatePolynomial| P) (|c| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|ans| (|SparseUnivariatePolynomial| P)) (|prod| (P)) (#1=#:G473 NIL)
          (|n| #2=(|NonNegativeInteger|)) (|lc| (P)) (|i| #2#) (#3=#:G471 NIL))
         (SEQ (LETT |n| (SPADCALL |um| (QREFELT $ 53)))
              (LETT |ans| (SPADCALL (|spadConstant| $ 49) |n| (QREFELT $ 50)))
              (LETT |n|
                    (PROG1 (LETT #3# (- |n| 1))
                      (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #3#)))
              (LETT |prod| (|spadConstant| $ 49))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (LETT |um| (SPADCALL |um| (QREFELT $ 134)))
                                (|spadConstant| $ 135) (QREFELT $ 136)))
                     (GO G191)))
                   (SEQ (LETT |i| (SPADCALL |um| (QREFELT $ 53)))
                        (LETT |lc| (SPADCALL |um| (QREFELT $ 69)))
                        (LETT |prod|
                              (SPADCALL |prod|
                                        (SPADCALL |c|
                                                  (PROG1
                                                      (LETT #1#
                                                            (- |n|
                                                               (LETT |n| |i|)))
                                                    (|check_subtype2|
                                                     (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                                  (QREFELT $ 137))
                                        (QREFELT $ 117)))
                        (EXIT
                         (LETT |ans|
                               (SPADCALL |ans|
                                         (SPADCALL
                                          (SPADCALL |prod| |lc|
                                                    (QREFELT $ 117))
                                          |i| (QREFELT $ 50))
                                         (QREFELT $ 138)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |INNMFACT;unmonicize|
        ((|m| |SparseUnivariatePolynomial| P) (|c| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPADCALL
         (SPADCALL |m| (SPADCALL |c| 1 (QREFELT $ 50)) (QREFELT $ 139))
         (QREFELT $ 133))) 

(SDEFUN |INNMFACT;monicMfpol|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|nldeg| (|List| (|NonNegativeInteger|)))
          (|monpol| (|SparseUnivariatePolynomial| P)) (|l| (P)))
         (SEQ (LETT |l| (SPADCALL |um| (QREFELT $ 69)))
              (LETT |monpol| (|INNMFACT;monicize| |um| |l| $))
              (LETT |nldeg| (SPADCALL |monpol| |lvar| (QREFELT $ 140)))
              (EXIT
               (SPADCALL (CONS #'|INNMFACT;monicMfpol!0| (VECTOR $ |l|))
                         (|INNMFACT;mfconst| |monpol| |lvar| |nldeg| |ufactor|
                          $)
                         (QREFELT $ 143)))))) 

(SDEFUN |INNMFACT;monicMfpol!0| ((|z1| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INNMFACT;unmonicize| |z1| |l| $))))) 

(SDEFUN |INNMFACT;mfpol|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|tleadpol|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ
          (COND
           ((|HasCategory| (QREFELT $ 8) '(|Field|))
            (|INNMFACT;monicMfpol| |um| |lvar| |ldeg| |ufactor| $))
           ('T
            (SEQ
             (LETT |tleadpol|
                   (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT $ 69)) |ufactor|
                    $))
             (EXIT
              (|INNMFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL |ufactor|
               $)))))))) 

(SDEFUN |INNMFACT;mFactor|
        ((|m| P)
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| P) (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((#1=#:G534 NIL) (|lcfacs| (R)) (#2=#:G531 NIL) (#3=#:G530 (R))
          (#4=#:G532 (R)) (#5=#:G546 NIL) (|f| NIL)
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| P) (|:| |pow| (|NonNegativeInteger|)))))
          (|auxfl|
           (|List|
            #6=(|Record| (|:| |irr| P) (|:| |pow| (|NonNegativeInteger|)))))
          (#7=#:G545 NIL) (|lfp| NIL) (#8=#:G544 NIL)
          (|lf| (|List| (|SparseUnivariatePolynomial| P)))
          (|um| (|SparseUnivariatePolynomial| P))
          (|ldeg| (|List| (|NonNegativeInteger|))) (#9=#:G543 NIL)
          (|lcterm| NIL) (|ffactor| (P)) (#10=#:G513 NIL) (|pc| (P))
          (|lvar| (|List| OV)) (|x| (OV))
          (|varch|
           (|Record| (|:| |npol| (|SparseUnivariatePolynomial| P))
                     (|:| |nvar| (|List| OV))
                     (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
          (#11=#:G542 NIL) (#12=#:G501 NIL) (|lcont| (P))
          (|ffexp| #13=(|NonNegativeInteger|)) (#14=#:G541 NIL) (|fact| NIL)
          (|sqqfact|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P) (|:| |exponent| #13#))))
          (|flead| (|Record| (|:| |contp| R) (|:| |factors| (|List| #6#))))
          (|sqfacs| (|Factored| P)) (#15=#:G490 NIL)
          (#16=#:G489 #17=(|Boolean|)) (#18=#:G491 #17#) (#19=#:G540 NIL)
          (|n| NIL) (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL |m| (QREFELT $ 70))
            (CONS (SPADCALL |m| (QREFELT $ 75)) NIL))
           (#20='T
            (SEQ (LETT |lvar| (SPADCALL |m| (QREFELT $ 25)))
                 (LETT |flead| (CONS (|spadConstant| $ 44) NIL))
                 (LETT |factorlist| NIL)
                 (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 144)))
                 (EXIT
                  (COND
                   ((PROGN
                     (LETT #15# NIL)
                     (SEQ (LETT |n| NIL) (LETT #19# |lmdeg|) G190
                          (COND
                           ((OR (ATOM #19#) (PROGN (LETT |n| (CAR #19#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #18# (SPADCALL |n| 0 (QREFELT $ 47)))
                             (COND
                              (#15# (LETT #16# (COND (#16# 'T) ('T #18#))))
                              ('T (PROGN (LETT #16# #18#) (LETT #15# 'T)))))))
                          (LETT #19# (CDR #19#)) (GO G190) G191 (EXIT NIL))
                     (COND (#15# #16#) (#20# NIL)))
                    (|INNMFACT;simplify| |m| |lvar| |lmdeg| |ufactor| $))
                   (#20#
                    (SEQ (LETT |sqfacs| (SPADCALL |m| (QREFELT $ 146)))
                         (LETT |lcont| (SPADCALL |sqfacs| (QREFELT $ 148)))
                         (COND
                          ((SPADCALL |lcont| (QREFELT $ 70))
                           (PROGN
                            (RPLACA |flead| (SPADCALL |lcont| (QREFELT $ 75)))
                            (QCAR |flead|)))
                          (#20#
                           (LETT |flead|
                                 (|INNMFACT;mFactor| |lcont| |ufactor| $))))
                         (LETT |factorlist| (QCDR |flead|))
                         (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 151)))
                         (SEQ (LETT |fact| NIL) (LETT #14# |sqqfact|) G190
                              (COND
                               ((OR (ATOM #14#)
                                    (PROGN (LETT |fact| (CAR #14#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |ffactor| (QVELT |fact| 1))
                                   (LETT |ffexp| (QVELT |fact| 2))
                                   (LETT |lvar|
                                         (SPADCALL |ffactor| (QREFELT $ 25)))
                                   (LETT |x| (|SPADfirst| |lvar|))
                                   (LETT |ldeg|
                                         (SPADCALL |ffactor| |lvar|
                                                   (QREFELT $ 152)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL 1 |ldeg| (QREFELT $ 154))
                                      (SEQ
                                       (LETT |x|
                                             (SPADCALL |lvar|
                                                       (SPADCALL 1 |ldeg|
                                                                 (QREFELT $
                                                                          86))
                                                       (QREFELT $ 87)))
                                       (LETT |lcont|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |ffactor| |x|
                                                         (QREFELT $ 84))
                                               (QREFELT $ 23))
                                              (QREFELT $ 155)))
                                       (LETT |ffactor|
                                             (PROG2
                                                 (LETT #12#
                                                       (SPADCALL |ffactor|
                                                                 |lcont|
                                                                 (QREFELT $
                                                                          119)))
                                                 (QCDR #12#)
                                               (|check_union2| (QEQCAR #12# 0)
                                                               (QREFELT $ 9)
                                                               (|Union|
                                                                (QREFELT $ 9)
                                                                #21="failed")
                                                               #12#)))
                                       (LETT |factorlist|
                                             (CONS (CONS |ffactor| |ffexp|)
                                                   |factorlist|))
                                       (EXIT
                                        (SEQ (LETT |lcterm| NIL)
                                             (LETT #11#
                                                   (QCDR
                                                    (|INNMFACT;mFactor| |lcont|
                                                     |ufactor| $)))
                                             G190
                                             (COND
                                              ((OR (ATOM #11#)
                                                   (PROGN
                                                    (LETT |lcterm| (CAR #11#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |factorlist|
                                                     (CONS
                                                      (CONS (QCAR |lcterm|)
                                                            (* (QCDR |lcterm|)
                                                               |ffexp|))
                                                      |factorlist|))))
                                             (LETT #11# (CDR #11#)) (GO G190)
                                             G191 (EXIT NIL)))))
                                     ('T
                                      (SEQ
                                       (LETT |varch|
                                             (|INNMFACT;varChoose| |ffactor|
                                              |lvar| |ldeg| $))
                                       (LETT |um| (QVELT |varch| 0))
                                       (LETT |x| (|SPADfirst| |lvar|))
                                       (LETT |ldeg| (CDR |ldeg|))
                                       (LETT |lvar| (CDR |lvar|))
                                       (COND
                                        ((SPADCALL
                                          (|SPADfirst| (QVELT |varch| 1)) |x|
                                          (QREFELT $ 156))
                                         (SEQ (LETT |lvar| (QVELT |varch| 1))
                                              (LETT |x| (|SPADfirst| |lvar|))
                                              (EXIT
                                               (LETT |lvar| (CDR |lvar|))))))
                                       (LETT |pc|
                                             (SPADCALL
                                              (SPADCALL |um| (QREFELT $ 23))
                                              (QREFELT $ 155)))
                                       (COND
                                        ((SPADCALL |pc| (|spadConstant| $ 49)
                                                   (QREFELT $ 157))
                                         (SEQ
                                          (LETT |um|
                                                (PROG2
                                                    (LETT #10#
                                                          (SPADCALL |um| |pc|
                                                                    (QREFELT $
                                                                             158)))
                                                    (QCDR #10#)
                                                  (|check_union2|
                                                   (QEQCAR #10# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 9))
                                                    "failed")
                                                   #10#)))
                                          (LETT |ffactor|
                                                (SPADCALL |um| |x|
                                                          (QREFELT $ 159)))
                                          (EXIT
                                           (SEQ (LETT |lcterm| NIL)
                                                (LETT #9#
                                                      (QCDR
                                                       (|INNMFACT;mFactor| |pc|
                                                        |ufactor| $)))
                                                G190
                                                (COND
                                                 ((OR (ATOM #9#)
                                                      (PROGN
                                                       (LETT |lcterm|
                                                             (CAR #9#))
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
                                                         |factorlist|))))
                                                (LETT #9# (CDR #9#)) (GO G190)
                                                G191 (EXIT NIL))))))
                                       (LETT |ldeg|
                                             (SPADCALL |ffactor| |lvar|
                                                       (QREFELT $ 152)))
                                       (LETT |um|
                                             (SPADCALL |um| (QREFELT $ 160)))
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL |um| (QREFELT $ 69))
                                          (QREFELT $ 70))
                                         (LETT |lf|
                                               (|INNMFACT;mfconst| |um| |lvar|
                                                |ldeg| |ufactor| $)))
                                        ('T
                                         (LETT |lf|
                                               (|INNMFACT;mfpol| |um| |lvar|
                                                |ldeg| |ufactor| $))))
                                       (LETT |auxfl|
                                             (PROGN
                                              (LETT #8# NIL)
                                              (SEQ (LETT |lfp| NIL)
                                                   (LETT #7# |lf|) G190
                                                   (COND
                                                    ((OR (ATOM #7#)
                                                         (PROGN
                                                          (LETT |lfp|
                                                                (CAR #7#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #8#
                                                           (CONS
                                                            (CONS
                                                             (SPADCALL
                                                              (SPADCALL |lfp|
                                                                        |x|
                                                                        (QREFELT
                                                                         $
                                                                         159))
                                                              (QREFELT $ 161))
                                                             |ffexp|)
                                                            #8#))))
                                                   (LETT #7# (CDR #7#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #8#)))))
                                       (EXIT
                                        (LETT |factorlist|
                                              (SPADCALL |factorlist| |auxfl|
                                                        (QREFELT $ 122)))))))))
                              (LETT #14# (CDR #14#)) (GO G190) G191 (EXIT NIL))
                         (LETT |lcfacs|
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |f| NIL) (LETT #5# |factorlist|)
                                     G190
                                     (COND
                                      ((OR (ATOM #5#)
                                           (PROGN (LETT |f| (CAR #5#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #4#
                                              (SPADCALL
                                               (SPADCALL (QCAR |f|)
                                                         (QREFELT $ 71))
                                               (QCDR |f|) (QREFELT $ 72)))
                                        (COND
                                         (#2#
                                          (LETT #3#
                                                (SPADCALL #3# #4#
                                                          (QREFELT $ 73))))
                                         ('T
                                          (PROGN
                                           (LETT #3# #4#)
                                           (LETT #2# 'T)))))))
                                     (LETT #5# (CDR #5#)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#2# #3#) (#20# (|spadConstant| $ 48)))))
                         (EXIT
                          (CONS
                           (PROG2
                               (LETT #1#
                                     (SPADCALL (SPADCALL |m| (QREFELT $ 71))
                                               |lcfacs| (QREFELT $ 76)))
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0) (QREFELT $ 8)
                                             (|Union| (QREFELT $ 8) #21#) #1#))
                           |factorlist|)))))))))))) 

(SDEFUN |INNMFACT;factor;PMF;15|
        ((|m| P)
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Factored| P))
        (SPROG
         ((#1=#:G550 NIL) (#2=#:G549 #3=(|Factored| P)) (#4=#:G551 #3#)
          (#5=#:G554 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ (LETT |flist| (|INNMFACT;mFactor| |m| |ufactor| $))
              (EXIT
               (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 39))
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
                                        (SPADCALL (QCAR |u|) (QCDR |u|)
                                                  (QREFELT $ 162)))
                                  (COND
                                   (#1#
                                    (LETT #2#
                                          (SPADCALL #2# #4# (QREFELT $ 163))))
                                   ('T
                                    (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                          (COND (#1# #2#) ('T (|spadConstant| $ 164))))
                         (QREFELT $ 165)))))) 

(DECLAIM (NOTINLINE |InnerMultFact;|)) 

(DEFUN |InnerMultFact| (&REST #1=#:G555)
  (SPROG NIL
         (PROG (#2=#:G556)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerMultFact|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerMultFact;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|InnerMultFact|)))))))))) 

(DEFUN |InnerMultFact;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|InnerMultFact| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 167))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|InnerMultFact| (LIST DV$1 DV$2 DV$3 DV$4)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 16
              (SPADCALL (SPADCALL (EXPT 2 26) (QREFELT $ 14)) (QREFELT $ 15)))
    $))) 

(MAKEPROP '|InnerMultFact| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|) (0 . ^)
              (|Integer|) (|IntegerPrimesPackage| 12) (6 . |prevPrime|)
              (11 . |coerce|) '|pmod| (|SparseUnivariatePolynomial| 9)
              (16 . |coerce|) (|Boolean|) (21 . |ground?|) (26 . |ground|)
              (|List| 9) (31 . |coefficients|) (|List| 6) (36 . |variables|)
              (41 . |setUnion|) (47 . |ground|)
              (|SparseUnivariatePolynomial| 8) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 17 8 28) (52 . |map|)
              (|Factored| 28) (58 . |unit|) (63 . |retract|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 35) (|:| |factor| 28) (|:| |exponent| 45))
              (|List| 36) (68 . |factorList|) (73 . |coerce|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 28 9 17) (78 . |map|)
              (84 . |Zero|) (88 . |Zero|) (|NonNegativeInteger|)
              (92 . |minimumDegree|) (97 . >) (103 . |One|) (107 . |One|)
              (111 . |monomial|) (|Union| $ '"failed") (117 . |exquo|)
              (123 . |degree|) (|Record| (|:| |irr| 17) (|:| |pow| 45))
              (|List| 54) (128 . |append|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (134 . |unitNormal|) (|Factored| 17)
              (|MultivariateSquareFree| 7 6 8 9) (139 . |squareFree|)
              (144 . |unit|) (149 . *)
              (|Record| (|:| |flag| 35) (|:| |factor| 17) (|:| |exponent| 45))
              (|List| 64) (155 . |factorList|) (160 . *) (166 . |degree|)
              (172 . |leadingCoefficient|) (177 . |ground?|)
              (182 . |leadingCoefficient|) (187 . ^) (193 . *)
              (199 . |retract|) (204 . |retract|) (209 . |exquo|)
              (215 . |primeFactor|) (221 . *) (227 . |One|) (231 . *)
              (|Mapping| 32 28) |INNMFACT;factor;SupMF;3|
              (|SparseUnivariatePolynomial| $) (237 . |univariate|) (|List| 45)
              (243 . |position|) (249 . |elt|) (255 . |delete|)
              (261 . |delete|) (267 . |numberOfMonomials|) (272 . |degree|)
              (277 . |coefficient|) (283 . ~=) (289 . |euclideanSize|)
              (|FactoringUtilities| 7 6 8 9) (294 . |ran|) (|List| 8)
              (|List| 97) (299 . |member?|) (305 . *) (311 . |eval|)
              (318 . |unit?|) (323 . |completeEval|) (330 . ~=)
              (336 . |minimumDegree|) (341 . |content|) (346 . |exquo|)
              (|LeadingCoefDetermination| 6 7 8 9) (352 . |polCase|)
              (359 . |differentiate|) (|List| $) (364 . |gcd|) (369 . >)
              (375 . |position|) (381 . |elt|) (387 . |monomial|) (394 . *)
              (400 . |coerce|) (405 . |exquo|)
              (|Record| (|:| |irr| 9) (|:| |pow| 45)) (|List| 120)
              (411 . |append|)
              (|Record| (|:| |polfac| 22) (|:| |correct| 8)
                        (|:| |corrfact| 125))
              (|Union| 123 '"failed") (|List| 28)
              (|Record| (|:| |contp| 8) (|:| |factors| 121)) (417 . |distFact|)
              (427 . *) (433 . *) (|Union| 142 '"failed")
              (|MultivariateLifting| 7 6 8 9) (439 . |lifting|)
              (450 . |primitivePart|) (455 . |reductum|) (460 . |Zero|)
              (464 . ~=) (470 . ^) (476 . +) (482 . |elt|) (488 . |degree|)
              (|Mapping| 17 17) (|List| 17) (494 . |map|)
              (500 . |minimumDegree|) (|Factored| $) (506 . |squareFree|)
              (|Factored| 9) (511 . |unit|)
              (|Record| (|:| |flag| 35) (|:| |factor| 9) (|:| |exponent| 45))
              (|List| 149) (516 . |factorList|) (521 . |degree|) (527 . |One|)
              (531 . |member?|) (537 . |gcd|) (542 . ~=) (548 . ~=)
              (554 . |exquo|) (560 . |multivariate|) (566 . |unitCanonical|)
              (571 . |unitCanonical|) (576 . |primeFactor|) (582 . *)
              (588 . |One|) (592 . *) |INNMFACT;factor;PMF;15|)
           '#(|factor| 598) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 166
                                                 '(2 10 0 0 10 11 1 13 12 12 14
                                                   1 8 0 12 15 1 17 0 9 18 1 17
                                                   19 0 20 1 17 9 0 21 1 17 22
                                                   0 23 1 9 24 0 25 2 24 0 0 0
                                                   26 1 9 8 0 27 2 30 28 29 17
                                                   31 1 32 28 0 33 1 28 8 0 34
                                                   1 32 37 0 38 1 9 0 8 39 2 41
                                                   17 40 28 42 0 7 0 43 0 8 0
                                                   44 1 17 45 0 46 2 45 19 0 0
                                                   47 0 8 0 48 0 9 0 49 2 17 0
                                                   9 45 50 2 17 51 0 0 52 1 17
                                                   45 0 53 2 55 0 0 0 56 1 17
                                                   57 0 58 1 60 59 17 61 1 59
                                                   17 0 62 2 17 0 0 0 63 1 59
                                                   65 0 66 2 9 0 8 0 67 2 9 45
                                                   0 6 68 1 17 9 0 69 1 9 19 0
                                                   70 1 9 8 0 71 2 8 0 0 45 72
                                                   2 8 0 0 0 73 1 17 9 0 74 1 9
                                                   8 0 75 2 8 51 0 0 76 2 59 0
                                                   17 45 77 2 59 0 0 0 78 0 59
                                                   0 79 2 59 0 17 0 80 2 9 83 0
                                                   6 84 2 85 12 45 0 86 2 24 6
                                                   0 12 87 2 85 0 0 12 88 2 24
                                                   0 0 12 89 1 28 45 0 90 1 28
                                                   45 0 91 2 28 8 0 45 92 2 8
                                                   19 0 0 93 1 8 45 0 94 1 95 8
                                                   12 96 2 98 19 97 0 99 2 45 0
                                                   10 0 100 3 9 0 0 24 97 101 1
                                                   8 19 0 102 3 95 28 17 24 97
                                                   103 2 45 19 0 0 104 1 28 45
                                                   0 105 1 28 8 0 106 2 28 51 0
                                                   8 107 3 108 19 8 45 97 109 1
                                                   28 0 0 110 1 28 0 111 112 2
                                                   12 19 0 0 113 2 24 12 6 0
                                                   114 2 85 45 0 12 115 3 9 0 0
                                                   6 45 116 2 9 0 0 0 117 1 9 0
                                                   6 118 2 9 51 0 0 119 2 121 0
                                                   0 0 122 6 108 124 8 125 126
                                                   97 24 97 127 2 28 0 8 0 128
                                                   2 17 0 9 0 129 7 131 130 17
                                                   24 125 97 22 85 8 132 1 17 0
                                                   0 133 1 17 0 0 134 0 17 0
                                                   135 2 17 19 0 0 136 2 9 0 0
                                                   45 137 2 17 0 0 0 138 2 17 0
                                                   0 0 139 2 95 85 17 24 140 2
                                                   142 0 141 0 143 2 9 85 0 24
                                                   144 1 9 145 0 146 1 147 9 0
                                                   148 1 147 150 0 151 2 9 85 0
                                                   24 152 0 17 0 153 2 85 19 45
                                                   0 154 1 9 0 111 155 2 6 19 0
                                                   0 156 2 9 19 0 0 157 2 17 51
                                                   0 9 158 2 9 0 83 6 159 1 17
                                                   0 0 160 1 9 0 0 161 2 147 0
                                                   9 45 162 2 147 0 0 0 163 0
                                                   147 0 164 2 147 0 9 0 165 2
                                                   0 59 17 81 82 2 0 147 9 81
                                                   166)))))
           '|lookupComplete|)) 
