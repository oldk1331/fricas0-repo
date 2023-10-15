
(SDEFUN |INNMFACT;convertPUP|
        ((|lfg| |Record| (|:| |contp| R)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|))))))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                          (|:| |pow| (|Integer|)))))))
        (SPROG ((#1=#:G140 NIL) (|lff| NIL) (#2=#:G139 NIL))
               (SEQ
                (CONS (QCAR |lfg|)
                      (PROGN
                       (LETT #2# NIL . #3=(|INNMFACT;convertPUP|))
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
                                      (SPADCALL (QCAR |lff|) (QREFELT $ 18))
                                      (QCDR |lff|))
                                     #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |INNMFACT;supFactor|
        ((|um| |SparseUnivariatePolynomial| P)
         (|ufactor| |Mapping| #1=(|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                          (|:| |pow| (|Integer|)))))))
        (SPROG
         ((#2=#:G182 NIL) (|uum1| (R)) (|lcfacs| (R)) (#3=#:G177 NIL)
          (#4=#:G176 (R)) (#5=#:G178 (R)) (#6=#:G180 NIL) (#7=#:G200 NIL)
          (|f| NIL)
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                      (|:| |pow| (|Integer|)))))
          (|auxfl|
           (|List|
            #8=(|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                         (|:| |pow| (|Integer|)))))
          (#9=#:G199 NIL) (|lfp| NIL) (#10=#:G198 NIL)
          (|lf| (|List| (|SparseUnivariatePolynomial| P)))
          (|ldeg| (|List| #11=(|NonNegativeInteger|))) (#12=#:G166 NIL)
          (#13=#:G165 #11#) (#14=#:G167 #11#) (#15=#:G197 NIL) (|fc| NIL)
          (#16=#:G196 NIL) (|xx| NIL) (#17=#:G195 NIL) (|coefs| (|List| P))
          (#18=#:G194 NIL) (|lff| NIL) (#19=#:G193 NIL) (|lcont| (P))
          (|lfg|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))))
          (|ffexp| #20=(|Integer|))
          (|ffactor| #21=(|SparseUnivariatePolynomial| P)) (#22=#:G192 NIL)
          (|fact| NIL)
          (|sqqfact|
           (|List| (|Record| (|:| |factor| #21#) (|:| |exponent| #20#))))
          (|flead| (|Record| (|:| |contp| R) (|:| |factors| (|List| #8#))))
          (|sqfacs| (|Factored| (|SparseUnivariatePolynomial| P)))
          (|uum|
           (|Record| (|:| |unit| (|SparseUnivariatePolynomial| P))
                     (|:| |canonical| (|SparseUnivariatePolynomial| P))
                     (|:| |associate| (|SparseUnivariatePolynomial| P))))
          (#23=#:G188 NIL) (#24=#:G153 NIL)
          (|f1| (|SparseUnivariatePolynomial| P))
          (|mdeg| (|NonNegativeInteger|)) (#25=#:G191 NIL) (|ff| NIL)
          (#26=#:G190 NIL) (|lfact| #1#)
          (|umv| (|SparseUnivariatePolynomial| R)) (|lvar| #27=(|List| OV))
          (#28=#:G144 NIL) (#29=#:G143 #27#) (#30=#:G145 #27#) (#31=#:G189 NIL)
          (|cf| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |um| (QREFELT $ 20))
             (|INNMFACT;convertPUP|
              (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT $ 21)) |ufactor| $)
              $))
            (#32='T
             (SEQ
              (LETT |lvar|
                    (PROGN
                     (LETT #28# NIL . #33=(|INNMFACT;supFactor|))
                     (SEQ (LETT |cf| NIL . #33#)
                          (LETT #31# (SPADCALL |um| (QREFELT $ 23)) . #33#)
                          G190
                          (COND
                           ((OR (ATOM #31#)
                                (PROGN (LETT |cf| (CAR #31#) . #33#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #30# (SPADCALL |cf| (QREFELT $ 25)) . #33#)
                             (COND
                              (#28#
                               (LETT #29# (SPADCALL #29# #30# (QREFELT $ 26))
                                     . #33#))
                              ('T
                               (PROGN
                                (LETT #29# #30# . #33#)
                                (LETT #28# 'T . #33#)))))))
                          (LETT #31# (CDR #31#) . #33#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#28# #29#) (#32# (|IdentityError| '|setUnion|))))
                    . #33#)
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ
                  (LETT |umv| (SPADCALL (ELT $ 27) |um| (QREFELT $ 31)) . #33#)
                  (LETT |lfact| (SPADCALL |umv| |ufactor|) . #33#)
                  (EXIT
                   (CONS
                    (SPADCALL (SPADCALL |lfact| (QREFELT $ 33)) (QREFELT $ 34))
                    (PROGN
                     (LETT #26# NIL . #33#)
                     (SEQ (LETT |ff| NIL . #33#)
                          (LETT #25# (SPADCALL |lfact| (QREFELT $ 37)) . #33#)
                          G190
                          (COND
                           ((OR (ATOM #25#)
                                (PROGN (LETT |ff| (CAR #25#) . #33#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #26#
                                  (CONS
                                   (CONS
                                    (SPADCALL (ELT $ 38) (QCAR |ff|)
                                              (QREFELT $ 41))
                                    (QCDR |ff|))
                                   #26#)
                                  . #33#)))
                          (LETT #25# (CDR #25#) . #33#) (GO G190) G191
                          (EXIT (NREVERSE #26#))))))))
                (#32#
                 (SEQ (LETT |flead| (CONS (|spadConstant| $ 43) NIL) . #33#)
                      (LETT |factorlist| NIL . #33#)
                      (LETT |mdeg| (SPADCALL |um| (QREFELT $ 45)) . #33#)
                      (COND
                       ((SPADCALL |mdeg| 0 (QREFELT $ 46))
                        (SEQ
                         (LETT |f1|
                               (SPADCALL (|spadConstant| $ 48) |mdeg|
                                         (QREFELT $ 49))
                               . #33#)
                         (LETT |um|
                               (PROG2
                                   (LETT #24#
                                         (SPADCALL |um| |f1| (QREFELT $ 51))
                                         . #33#)
                                   (QCDR #24#)
                                 (|check_union2| (QEQCAR #24# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 9))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 9))
                                                  "failed")
                                                 #24#))
                               . #33#)
                         (LETT |factorlist|
                               (CONS
                                (CONS
                                 (SPADCALL (|spadConstant| $ 48) 1
                                           (QREFELT $ 49))
                                 |mdeg|)
                                |factorlist|)
                               . #33#)
                         (EXIT
                          (COND
                           ((EQL (SPADCALL |um| (QREFELT $ 52)) 0)
                            (PROGN
                             (LETT #23#
                                   (SEQ
                                    (LETT |lfg|
                                          (|INNMFACT;convertPUP|
                                           (|INNMFACT;mFactor|
                                            (SPADCALL |um| (QREFELT $ 21))
                                            |ufactor| $)
                                           $)
                                          . #33#)
                                    (EXIT
                                     (CONS (QCAR |lfg|)
                                           (APPEND |factorlist|
                                                   (QCDR |lfg|)))))
                                   . #33#)
                             (GO #34=#:G187))))))))
                      (LETT |uum| (SPADCALL |um| (QREFELT $ 54)) . #33#)
                      (LETT |um| (QVELT |uum| 1) . #33#)
                      (LETT |sqfacs| (SPADCALL |um| (QREFELT $ 57)) . #33#)
                      (LETT |lcont|
                            (SPADCALL
                             (SPADCALL (QVELT |uum| 0)
                                       (SPADCALL |sqfacs| (QREFELT $ 58))
                                       (QREFELT $ 59))
                             (QREFELT $ 21))
                            . #33#)
                      (LETT |flead|
                            (|INNMFACT;convertPUP|
                             (|INNMFACT;mFactor| |lcont| |ufactor| $) $)
                            . #33#)
                      (LETT |factorlist| (APPEND (QCDR |flead|) |factorlist|)
                            . #33#)
                      (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 62))
                            . #33#)
                      (SEQ (LETT |fact| NIL . #33#)
                           (LETT #22# |sqqfact| . #33#) G190
                           (COND
                            ((OR (ATOM #22#)
                                 (PROGN (LETT |fact| (CAR #22#) . #33#) NIL))
                             (GO G191)))
                           (SEQ (LETT |ffactor| (QCAR |fact|) . #33#)
                                (LETT |ffexp| (QCDR |fact|) . #33#)
                                (EXIT
                                 (COND
                                  ((ZEROP (SPADCALL |ffactor| (QREFELT $ 52)))
                                   (SEQ
                                    (LETT |lfg|
                                          (|INNMFACT;mFactor|
                                           (SPADCALL |ffactor| (QREFELT $ 21))
                                           |ufactor| $)
                                          . #33#)
                                    (LETT |lcont|
                                          (SPADCALL (QCAR |lfg|) |lcont|
                                                    (QREFELT $ 63))
                                          . #33#)
                                    (EXIT
                                     (LETT |factorlist|
                                           (APPEND |factorlist|
                                                   (PROGN
                                                    (LETT #19# NIL . #33#)
                                                    (SEQ
                                                     (LETT |lff| NIL . #33#)
                                                     (LETT #18# (QCDR |lfg|)
                                                           . #33#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #18#)
                                                           (PROGN
                                                            (LETT |lff|
                                                                  (CAR #18#)
                                                                  . #33#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #19#
                                                             (CONS
                                                              (CONS
                                                               (SPADCALL
                                                                (QCAR |lff|)
                                                                (QREFELT $ 18))
                                                               (* (QCDR |lff|)
                                                                  |ffexp|))
                                                              #19#)
                                                             . #33#)))
                                                     (LETT #18# (CDR #18#)
                                                           . #33#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #19#)))))
                                           . #33#))))
                                  ('T
                                   (SEQ
                                    (LETT |coefs|
                                          (SPADCALL |ffactor| (QREFELT $ 23))
                                          . #33#)
                                    (LETT |ldeg|
                                          (PROGN
                                           (LETT #17# NIL . #33#)
                                           (SEQ (LETT |xx| NIL . #33#)
                                                (LETT #16# |lvar| . #33#) G190
                                                (COND
                                                 ((OR (ATOM #16#)
                                                      (PROGN
                                                       (LETT |xx| (CAR #16#)
                                                             . #33#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #17#
                                                        (CONS
                                                         (PROGN
                                                          (LETT #12# NIL
                                                                . #33#)
                                                          (SEQ
                                                           (LETT |fc| NIL
                                                                 . #33#)
                                                           (LETT #15# |coefs|
                                                                 . #33#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #15#)
                                                                 (PROGN
                                                                  (LETT |fc|
                                                                        (CAR
                                                                         #15#)
                                                                        . #33#)
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (PROGN
                                                              (LETT #14#
                                                                    (SPADCALL
                                                                     |fc| |xx|
                                                                     (QREFELT $
                                                                              64))
                                                                    . #33#)
                                                              (COND
                                                               (#12#
                                                                (LETT #13#
                                                                      (MAX #13#
                                                                           #14#)
                                                                      . #33#))
                                                               ('T
                                                                (PROGN
                                                                 (LETT #13#
                                                                       #14#
                                                                       . #33#)
                                                                 (LETT #12# 'T
                                                                       . #33#)))))))
                                                           (LETT #15#
                                                                 (CDR #15#)
                                                                 . #33#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                          (COND (#12# #13#)
                                                                ('T
                                                                 (|IdentityError|
                                                                  '|max|))))
                                                         #17#)
                                                        . #33#)))
                                                (LETT #16# (CDR #16#) . #33#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #17#))))
                                          . #33#)
                                    (LETT |lf|
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |ffactor|
                                                       (QREFELT $ 65))
                                             (QREFELT $ 66))
                                            (|INNMFACT;mfconst| |ffactor|
                                             |lvar| |ldeg| |ufactor| $))
                                           ('T
                                            (|INNMFACT;mfpol| |ffactor| |lvar|
                                             |ldeg| |ufactor| $)))
                                          . #33#)
                                    (LETT |auxfl|
                                          (PROGN
                                           (LETT #10# NIL . #33#)
                                           (SEQ (LETT |lfp| NIL . #33#)
                                                (LETT #9# |lf| . #33#) G190
                                                (COND
                                                 ((OR (ATOM #9#)
                                                      (PROGN
                                                       (LETT |lfp| (CAR #9#)
                                                             . #33#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #10#
                                                        (CONS
                                                         (CONS |lfp| |ffexp|)
                                                         #10#)
                                                        . #33#)))
                                                (LETT #9# (CDR #9#) . #33#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #10#))))
                                          . #33#)
                                    (EXIT
                                     (LETT |factorlist|
                                           (APPEND |factorlist| |auxfl|)
                                           . #33#)))))))
                           (LETT #22# (CDR #22#) . #33#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |lcfacs|
                            (PROGN
                             (LETT #3# NIL . #33#)
                             (SEQ (LETT |f| NIL . #33#)
                                  (LETT #7# |factorlist| . #33#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |f| (CAR #7#) . #33#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QCAR |f|)
                                                       (QREFELT $ 65))
                                             (QREFELT $ 67))
                                            (PROG1 (LETT #6# (QCDR |f|) . #33#)
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            (QREFELT $ 68))
                                           . #33#)
                                     (COND
                                      (#3#
                                       (LETT #4#
                                             (SPADCALL #4# #5# (QREFELT $ 69))
                                             . #33#))
                                      ('T
                                       (PROGN
                                        (LETT #4# #5# . #33#)
                                        (LETT #3# 'T . #33#)))))))
                                  (LETT #7# (CDR #7#) . #33#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#3# #4#) (#32# (|spadConstant| $ 47))))
                            . #33#)
                      (LETT |uum1|
                            (SPADCALL (SPADCALL (QVELT |uum| 0) (QREFELT $ 70))
                                      (QREFELT $ 71))
                            . #33#)
                      (EXIT
                       (CONS
                        (SPADCALL |uum1|
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |um| (QREFELT $ 65))
                                              (QREFELT $ 67))
                                             |lcfacs| (QREFELT $ 72))
                                            . #33#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT $ 8)
                                                    (|Union| (QREFELT $ 8)
                                                             "failed")
                                                    #2#))
                                  (QREFELT $ 69))
                        |factorlist|))))))))))
          #34# (EXIT #23#)))) 

(SDEFUN |INNMFACT;factor;SupMF;3|
        ((|um| |SparseUnivariatePolynomial| P)
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Factored| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((#1=#:G204 NIL)
          (#2=#:G203 #3=(|Factored| (|SparseUnivariatePolynomial| P)))
          (#4=#:G205 #3#) (#5=#:G209 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| P))
                            (|:| |pow| (|Integer|))))))))
         (SEQ
          (LETT |flist| (|INNMFACT;supFactor| |um| |ufactor| $)
                . #6=(|INNMFACT;factor;SupMF;3|))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 38)) (QREFELT $ 18))
            (PROGN
             (LETT #1# NIL . #6#)
             (SEQ (LETT |u| NIL . #6#) (LETT #5# (QCDR |flist|) . #6#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL (QCAR |u|) (QCDR |u|) (QREFELT $ 73))
                           . #6#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 74)) . #6#))
                      ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                  (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T (|spadConstant| $ 75))))
            (QREFELT $ 76)))))) 

(SDEFUN |INNMFACT;varChoose|
        ((|m| P) (|lvar| |List| OV) (|ldeg| |List| #1=(|NonNegativeInteger|))
         ($ |Record| (|:| |npol| (|SparseUnivariatePolynomial| P))
          (|:| |nvar| (|List| OV))
          (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|x| (OV)) (|i| (|Integer|)) (|k| #1#) (#2=#:G212 NIL)
          (#3=#:G211 #1#) (#4=#:G213 #1#) (#5=#:G217 NIL) (|d| NIL))
         (SEQ
          (LETT |k|
                (PROGN
                 (LETT #2# NIL . #6=(|INNMFACT;varChoose|))
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
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 64)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 80)) |lvar|
                     |ldeg|))
            (#7#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 82)) . #6#)
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 83)) . #6#)
                  (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 84)))
                        . #6#)
                  (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 85)))
                        . #6#)
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT $ 80)) |lvar|
                           |ldeg|))))))))) 

(SDEFUN |INNMFACT;localNorm|
        ((|lum| |List| (|SparseUnivariatePolynomial| R)) ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G222 NIL) (#3=#:G221 #1#) (#4=#:G223 #1#) (#5=#:G225 NIL)
          (#6=#:G224 #1#) (#7=#:G226 #1#) (|cc| (R)) (#8=#:G230 NIL) (|i| NIL)
          (#9=#:G229 NIL) (|ff| NIL) (#10=#:G219 NIL) (#11=#:G218 #1#)
          (#12=#:G220 #1#) (#13=#:G228 NIL))
         (SEQ
          (COND
           ((|domainEqual| (QREFELT $ 8) (|AlgebraicNumber|))
            (PROGN
             (LETT #10# NIL . #14=(|INNMFACT;localNorm|))
             (SEQ (LETT |ff| NIL . #14#) (LETT #13# |lum| . #14#) G190
                  (COND
                   ((OR (ATOM #13#) (PROGN (LETT |ff| (CAR #13#) . #14#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #12# (SPADCALL |ff| (QREFELT $ 86)) . #14#)
                     (COND (#10# (LETT #11# (MAX #11# #12#) . #14#))
                           ('T
                            (PROGN
                             (LETT #11# #12# . #14#)
                             (LETT #10# 'T . #14#)))))))
                  (LETT #13# (CDR #13#) . #14#) (GO G190) G191 (EXIT NIL))
             (COND (#10# #11#) (#15='T (|IdentityError| '|max|)))))
           (#15#
            (PROGN
             (LETT #2# NIL . #14#)
             (SEQ (LETT |ff| NIL . #14#) (LETT #9# |lum| . #14#) G190
                  (COND
                   ((OR (ATOM #9#) (PROGN (LETT |ff| (CAR #9#) . #14#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #5# NIL . #14#)
                            (SEQ (LETT |i| 0 . #14#)
                                 (LETT #8# (SPADCALL |ff| (QREFELT $ 87))
                                       . #14#)
                                 G190 (COND ((|greater_SI| |i| #8#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (LETT |cc|
                                            (SPADCALL |ff| |i| (QREFELT $ 88))
                                            . #14#)
                                      (|spadConstant| $ 43) (QREFELT $ 89))
                                     (PROGN
                                      (LETT #7# (SPADCALL |cc| (QREFELT $ 90))
                                            . #14#)
                                      (COND (#5# (LETT #6# (+ #6# #7#) . #14#))
                                            ('T
                                             (PROGN
                                              (LETT #6# #7# . #14#)
                                              (LETT #5# 'T . #14#)))))))))
                                 (LETT |i| (|inc_SI| |i|) . #14#) (GO G190)
                                 G191 (EXIT NIL))
                            (COND (#5# #6#) ('T 0)))
                           . #14#)
                     (COND (#2# (LETT #3# (MAX #3# #4#) . #14#))
                           ('T
                            (PROGN
                             (LETT #3# #4# . #14#)
                             (LETT #2# 'T . #14#)))))))
                  (LETT #9# (CDR #9#) . #14#) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#15# (|IdentityError| '|max|))))))))) 

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
          (|unifact| (|List| (|SparseUnivariatePolynomial| R))) (#3=#:G292 NIL)
          (|uf| NIL) (#4=#:G291 NIL) (|leadtest| (|Boolean|)) (#5=#:G290 NIL)
          (#6=#:G289 NIL) (#7=#:G274 NIL) (#8=#:G288 NIL) (#9=#:G287 NIL)
          (#10=#:G286 NIL) (#11=#:G285 NIL) (#12=#:G284 NIL) (|ff| NIL)
          (#13=#:G283 NIL) (#14=#:G282 NIL) (#15=#:G281 NIL)
          (|nf| (|NonNegativeInteger|)) (|lffc1| (R))
          (|lunivf|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|Integer|)))))
          (|luniv| #1#) (|range| (|NonNegativeInteger|))
          (|newm| (|SparseUnivariatePolynomial| R)) (#16=#:G246 NIL)
          (#17=#:G240 NIL) (#18=#:G239 #19=(|Boolean|)) (#20=#:G241 #19#)
          (#21=#:G280 NIL) (|epl| NIL) (|leadcomp1| #2#) (#22=#:G279 NIL)
          (|pol| NIL) (#23=#:G278 NIL) (|lval| (|List| R)) (#24=#:G277 NIL)
          (|i| NIL) (#25=#:G276 NIL) (#26=#:G275 NIL)
          (|newunifact| (|List| (|SparseUnivariatePolynomial| R)))
          (|testp| (|Boolean|)) (|ctf1| (R)) (|nvar1| (|NonNegativeInteger|))
          (|degum| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |degum| (SPADCALL |um| (QREFELT $ 52))
                  . #27=(|INNMFACT;intChoose|))
            (LETT |nvar1| (LENGTH |lvar|) . #27#) (LETT |range| 5 . #27#)
            (LETT |ctf1| (|spadConstant| $ 47) . #27#)
            (LETT |testp| (COND ((NULL |plist|) 'NIL) ('T 'T)) . #27#)
            (LETT |leadcomp| (LETT |leadcomp1| NIL . #27#) . #27#)
            (LETT |nfatt| (+ |degum| 1) . #27#)
            (LETT |lffc| (|spadConstant| $ 47) . #27#)
            (LETT |lffc1| |lffc| . #27#) (LETT |newunifact| NIL . #27#)
            (LETT |leadtest| 'T . #27#) (LETT |int| NIL . #27#)
            (SEQ
             (EXIT
              (SEQ G190 (COND ((NULL 'T) (GO G191)))
                   (SEQ
                    (COND
                     (|testp|
                      (COND
                       ((SPADCALL (LENGTH |ltry|) 10 (QREFELT $ 46))
                        (EXIT
                         (PROGN
                          (LETT #26# (CONS 1 "failed") . #27#)
                          (GO #28=#:G273)))))))
                    (LETT |lval|
                          (PROGN
                           (LETT #25# NIL . #27#)
                           (SEQ (LETT |i| 1 . #27#) (LETT #24# |nvar1| . #27#)
                                G190 (COND ((|greater_SI| |i| #24#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #25#
                                        (CONS (SPADCALL |range| (QREFELT $ 92))
                                              #25#)
                                        . #27#)))
                                (LETT |i| (|inc_SI| |i|) . #27#) (GO G190) G191
                                (EXIT (NREVERSE #25#))))
                          . #27#)
                    (EXIT
                     (COND
                      ((SPADCALL |lval| |ltry| (QREFELT $ 95))
                       (LETT |range| (SPADCALL 2 |range| (QREFELT $ 96))
                             . #27#))
                      ('T
                       (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #27#)
                            (LETT |leadcomp1|
                                  (PROGN
                                   (LETT #23# NIL . #27#)
                                   (SEQ (LETT |pol| NIL . #27#)
                                        (LETT #22# |plist| . #27#) G190
                                        (COND
                                         ((OR (ATOM #22#)
                                              (PROGN
                                               (LETT |pol| (CAR #22#) . #27#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #23#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |pol| |lvar| |lval|
                                                            (QREFELT $ 97))
                                                  (QREFELT $ 71))
                                                 #23#)
                                                . #27#)))
                                        (LETT #22# (CDR #22#) . #27#) (GO G190)
                                        G191 (EXIT (NREVERSE #23#))))
                                  . #27#)
                            (COND
                             (|testp|
                              (COND
                               ((PROGN
                                 (LETT #17# NIL . #27#)
                                 (SEQ (LETT |epl| NIL . #27#)
                                      (LETT #21# |leadcomp1| . #27#) G190
                                      (COND
                                       ((OR (ATOM #21#)
                                            (PROGN
                                             (LETT |epl| (CAR #21#) . #27#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #20#
                                               (SPADCALL |epl| (QREFELT $ 98))
                                               . #27#)
                                         (COND
                                          (#17#
                                           (LETT #18#
                                                 (COND (#18# 'T) ('T #20#))
                                                 . #27#))
                                          ('T
                                           (PROGN
                                            (LETT #18# #20# . #27#)
                                            (LETT #17# 'T . #27#)))))))
                                      (LETT #21# (CDR #21#) . #27#) (GO G190)
                                      G191 (EXIT NIL))
                                 (COND (#17# #18#) ('T 'NIL)))
                                (EXIT
                                 (LETT |range|
                                       (SPADCALL 2 |range| (QREFELT $ 96))
                                       . #27#))))))
                            (LETT |newm|
                                  (SPADCALL |um| |lvar| |lval| (QREFELT $ 99))
                                  . #27#)
                            (COND
                             ((OR
                               (SPADCALL |degum|
                                         (SPADCALL |newm| (QREFELT $ 87))
                                         (QREFELT $ 100))
                               (SPADCALL (SPADCALL |newm| (QREFELT $ 101)) 0
                                         (QREFELT $ 100)))
                              (EXIT
                               (LETT |range|
                                     (SPADCALL 2 |range| (QREFELT $ 96))
                                     . #27#))))
                            (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 102))
                                  . #27#)
                            (LETT |newm|
                                  (PROG2
                                      (LETT #16#
                                            (SPADCALL |newm| |lffc1|
                                                      (QREFELT $ 103))
                                            . #27#)
                                      (QCDR #16#)
                                    (|check_union2| (QEQCAR #16# 0)
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 8))
                                                    (|Union|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 8))
                                                     "failed")
                                                    #16#))
                                  . #27#)
                            (COND
                             (|testp|
                              (COND
                               (|leadtest|
                                (COND
                                 ((NULL
                                   (SPADCALL
                                    (SPADCALL |lffc1| |clc| (QREFELT $ 69))
                                    (LENGTH |plist|) |leadcomp1|
                                    (QREFELT $ 105)))
                                  (EXIT
                                   (LETT |range|
                                         (SPADCALL 2 |range| (QREFELT $ 96))
                                         . #27#))))))))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (LIST |newm|
                                        (SPADCALL |newm| (QREFELT $ 106)))
                                  (QREFELT $ 108))
                                 (QREFELT $ 87))
                                0 (QREFELT $ 100))
                               (LETT |range|
                                     (SPADCALL 2 |range| (QREFELT $ 96))
                                     . #27#))
                              ('T
                               (SEQ
                                (LETT |luniv| (SPADCALL |newm| |ufactor|)
                                      . #27#)
                                (LETT |lunivf|
                                      (SPADCALL |luniv| (QREFELT $ 37)) . #27#)
                                (LETT |lffc1|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |luniv| (QREFELT $ 33))
                                        (QREFELT $ 34))
                                       |lffc1| (QREFELT $ 69))
                                      . #27#)
                                (LETT |nf| (LENGTH |lunivf|) . #27#)
                                (COND
                                 ((OR (EQL |nf| 0)
                                      (SPADCALL |nf| |nfatt| (QREFELT $ 46)))
                                  (EXIT "next values")))
                                (COND
                                 ((EQL |nf| 1)
                                  (SEQ (LETT |unifact| (LIST |newm|) . #27#)
                                       (EXIT
                                        (PROGN
                                         (LETT #7# |$NoValue| . #27#)
                                         (GO #29=#:G271))))))
                                (EXIT
                                 (COND
                                  ((EQL |nfatt| |nf|)
                                   (SEQ
                                    (COND
                                     (|leadtest|
                                      (SEQ
                                       (LETT |unifact|
                                             (PROGN
                                              (LETT #15# NIL . #27#)
                                              (SEQ (LETT |uf| NIL . #27#)
                                                   (LETT #14# |lunivf| . #27#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #14#)
                                                         (PROGN
                                                          (LETT |uf| (CAR #14#)
                                                                . #27#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #15#
                                                           (CONS (QCAR |uf|)
                                                                 #15#)
                                                           . #27#)))
                                                   (LETT #14# (CDR #14#)
                                                         . #27#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #15#))))
                                             . #27#)
                                       (LETT |int| |lval| . #27#)
                                       (LETT |lffc| |lffc1| . #27#)
                                       (EXIT
                                        (COND
                                         (|testp|
                                          (LETT |leadcomp| |leadcomp1|
                                                . #27#))))))
                                     ((SPADCALL
                                       (|INNMFACT;localNorm| |unifact| $)
                                       (|INNMFACT;localNorm|
                                        (PROGN
                                         (LETT #13# NIL . #27#)
                                         (SEQ (LETT |ff| NIL . #27#)
                                              (LETT #12# |lunivf| . #27#) G190
                                              (COND
                                               ((OR (ATOM #12#)
                                                    (PROGN
                                                     (LETT |ff| (CAR #12#)
                                                           . #27#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #13#
                                                      (CONS (QCAR |ff|) #13#)
                                                      . #27#)))
                                              (LETT #12# (CDR #12#) . #27#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #13#))))
                                        $)
                                       (QREFELT $ 109))
                                      (COND
                                       (|testp|
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |lffc1| |clc|
                                                     (QREFELT $ 69))
                                           (LENGTH |plist|) |leadcomp1|
                                           (QREFELT $ 105))
                                          (SEQ
                                           (LETT |unifact|
                                                 (PROGN
                                                  (LETT #11# NIL . #27#)
                                                  (SEQ (LETT |uf| NIL . #27#)
                                                       (LETT #10# |lunivf|
                                                             . #27#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #10#)
                                                             (PROGN
                                                              (LETT |uf|
                                                                    (CAR #10#)
                                                                    . #27#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #11#
                                                               (CONS
                                                                (QCAR |uf|)
                                                                #11#)
                                                               . #27#)))
                                                       (LETT #10# (CDR #10#)
                                                             . #27#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #11#))))
                                                 . #27#)
                                           (LETT |int| |lval| . #27#)
                                           (LETT |lffc| |lffc1| . #27#)
                                           (EXIT
                                            (COND
                                             (|testp|
                                              (LETT |leadcomp| |leadcomp1|
                                                    . #27#))))))))
                                       ('T
                                        (SEQ
                                         (LETT |unifact|
                                               (PROGN
                                                (LETT #9# NIL . #27#)
                                                (SEQ (LETT |uf| NIL . #27#)
                                                     (LETT #8# |lunivf| . #27#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #8#)
                                                           (PROGN
                                                            (LETT |uf|
                                                                  (CAR #8#)
                                                                  . #27#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #9#
                                                             (CONS (QCAR |uf|)
                                                                   #9#)
                                                             . #27#)))
                                                     (LETT #8# (CDR #8#)
                                                           . #27#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #9#))))
                                               . #27#)
                                         (LETT |int| |lval| . #27#)
                                         (LETT |lffc| |lffc1| . #27#)
                                         (EXIT
                                          (COND
                                           (|testp|
                                            (LETT |leadcomp| |leadcomp1|
                                                  . #27#)))))))))
                                    (EXIT
                                     (PROGN
                                      (LETT #7# |$NoValue| . #27#)
                                      (GO #29#)))))
                                  ((SPADCALL |nfatt| |degum| (QREFELT $ 46))
                                   (SEQ
                                    (LETT |unifact|
                                          (PROGN
                                           (LETT #6# NIL . #27#)
                                           (SEQ (LETT |uf| NIL . #27#)
                                                (LETT #5# |lunivf| . #27#) G190
                                                (COND
                                                 ((OR (ATOM #5#)
                                                      (PROGN
                                                       (LETT |uf| (CAR #5#)
                                                             . #27#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #6#
                                                        (CONS (QCAR |uf|) #6#)
                                                        . #27#)))
                                                (LETT #5# (CDR #5#) . #27#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #6#))))
                                          . #27#)
                                    (LETT |lffc| |lffc1| . #27#)
                                    (COND
                                     (|testp|
                                      (LETT |leadcomp| |leadcomp1| . #27#)))
                                    (LETT |int| |lval| . #27#)
                                    (LETT |leadtest| 'NIL . #27#)
                                    (EXIT (LETT |nfatt| |nf| . #27#))))
                                  ((SPADCALL |nfatt| |nf| (QREFELT $ 46))
                                   (SEQ
                                    (COND
                                     (|testp|
                                      (LETT |leadtest|
                                            (COND
                                             ((SPADCALL
                                               (SPADCALL |lffc| |clc|
                                                         (QREFELT $ 69))
                                               (LENGTH |plist|) |leadcomp|
                                               (QREFELT $ 105))
                                              'NIL)
                                             ('T 'T))
                                            . #27#))
                                     ('T (LETT |leadtest| 'NIL . #27#)))
                                    (COND
                                     ((NULL |leadtest|)
                                      (SEQ
                                       (LETT |unifact|
                                             (PROGN
                                              (LETT #4# NIL . #27#)
                                              (SEQ (LETT |uf| NIL . #27#)
                                                   (LETT #3# |lunivf| . #27#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #3#)
                                                         (PROGN
                                                          (LETT |uf| (CAR #3#)
                                                                . #27#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #4#
                                                           (CONS (QCAR |uf|)
                                                                 #4#)
                                                           . #27#)))
                                                   (LETT #3# (CDR #3#) . #27#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #4#))))
                                             . #27#)
                                       (LETT |lffc| |lffc1| . #27#)
                                       (COND
                                        (|testp|
                                         (LETT |leadcomp| |leadcomp1| . #27#)))
                                       (EXIT (LETT |int| |lval| . #27#)))))
                                    (EXIT
                                     (LETT |nfatt| |nf| . #27#)))))))))))))))
                   NIL (GO G190) G191 (EXIT NIL)))
             #29# (EXIT #7#))
            (EXIT
             (CONS 0
                   (VECTOR (CONS |int| |ltry|) |unifact| |lffc| |leadcomp|)))))
          #28# (EXIT #26#)))) 

(SDEFUN |INNMFACT;simplify|
        ((|m| P) (|lvar| |List| OV) (|lmdeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))))
        (SPROG
         ((|flead|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))))
          (#1=#:G299 NIL)
          (|factorlist|
           (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))
          (|pol1| (P)) (|i| (|NonNegativeInteger|)) (#2=#:G305 NIL) (|x| NIL))
         (SEQ (LETT |factorlist| NIL . #3=(|INNMFACT;simplify|))
              (LETT |pol1| (|spadConstant| $ 48) . #3#)
              (SEQ (LETT |x| NIL . #3#) (LETT #2# |lvar| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT $ 110))
                                    (QREFELT $ 111))
                          . #3#)
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| $ 48)
                                                       |x| |i| (QREFELT $ 112))
                                             (QREFELT $ 113))
                                   . #3#)
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT $ 114)) |i|)
                                     |factorlist|)
                                    . #3#)))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2
                        (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 115)) . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                      (|Union| (QREFELT $ 9) "failed") #1#))
                    . #3#)
              (EXIT
               (COND
                ((SPADCALL |m| (QREFELT $ 66))
                 (CONS (SPADCALL |m| (QREFELT $ 71)) |factorlist|))
                ('T
                 (SEQ (LETT |flead| (|INNMFACT;mFactor| |m| |ufactor| $) . #3#)
                      (PROGN
                       (RPLACD |flead| (APPEND |factorlist| (QCDR |flead|)))
                       (QCDR |flead|))
                      (EXIT |flead|)))))))) 

(SDEFUN |INNMFACT;intfact|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|tleadpol| |Record| (|:| |contp| R)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|))))))
         (|ltry| |List| (|List| R))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|factfin| (|List| (|SparseUnivariatePolynomial| P))) (#1=#:G503 NIL)
          (|ff| NIL) (#2=#:G502 NIL)
          (|ffin| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|umd| (|SparseUnivariatePolynomial| P)) (#3=#:G484 NIL)
          (|unifact| (|List| (|SparseUnivariatePolynomial| R))) (#4=#:G501 NIL)
          (|unif| NIL) (#5=#:G500 NIL) (|dd| (R)) (|lpol| (|List| P))
          (|dist|
           (|Record| (|:| |polfac| (|List| P)) (|:| |correct| R)
                     (|:| |corrfact|
                          (|List| (|SparseUnivariatePolynomial| R)))))
          (#6=#:G497 NIL)
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
          (#7=#:G233 NIL)
          (|check|
           (|Union|
            (|Record| (|:| |inval| (|List| (|List| R)))
                      (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                      (|:| |lu| R) (|:| |complead| (|List| R)))
            #8="failed"))
          (|leadpol| (|List| P)) (#9=#:G499 NIL) (#10=#:G498 NIL)
          (|polcase| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |polcase| (COND ((NULL (QCDR |tleadpol|)) 'NIL) (#11='T 'T))
                  . #12=(|INNMFACT;intfact|))
            (LETT |vfchoo|
                  (COND
                   (|polcase|
                    (SEQ
                     (LETT |leadpol|
                           (PROGN
                            (LETT #10# NIL . #12#)
                            (SEQ (LETT |ff| NIL . #12#)
                                 (LETT #9# (QCDR |tleadpol|) . #12#) G190
                                 (COND
                                  ((OR (ATOM #9#)
                                       (PROGN
                                        (LETT |ff| (CAR #9#) . #12#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #10# (CONS (QCAR |ff|) #10#) . #12#)))
                                 (LETT #9# (CDR #9#) . #12#) (GO G190) G191
                                 (EXIT (NREVERSE #10#))))
                           . #12#)
                     (LETT |check|
                           (|INNMFACT;intChoose| |um| |lvar| (QCAR |tleadpol|)
                            |leadpol| |ltry| |ufactor| $)
                           . #12#)
                     (EXIT
                      (COND
                       ((QEQCAR |check| 1)
                        (PROGN
                         (LETT #6#
                               (|INNMFACT;monicMfpol| |um| |lvar| |ldeg|
                                |ufactor| $)
                               . #12#)
                         (GO #13=#:G496)))
                       (#11# (QCDR |check|))))))
                   (#11#
                    (PROG2
                        (LETT #7#
                              (|INNMFACT;intChoose| |um| |lvar|
                               (|spadConstant| $ 47) NIL NIL |ufactor| $)
                              . #12#)
                        (QCDR #7#)
                      (|check_union2| (QEQCAR #7# 0)
                                      (|Record|
                                       (|:| |inval|
                                            (|List| (|List| (QREFELT $ 8))))
                                       (|:| |unvfact|
                                            (|List|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 8))))
                                       (|:| |lu| (QREFELT $ 8))
                                       (|:| |complead| (|List| (QREFELT $ 8))))
                                      (|Union|
                                       (|Record|
                                        (|:| |inval|
                                             (|List| (|List| (QREFELT $ 8))))
                                        (|:| |unvfact|
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 8))))
                                        (|:| |lu| (QREFELT $ 8))
                                        (|:| |complead|
                                             (|List| (QREFELT $ 8))))
                                       #8#)
                                      #7#))))
                  . #12#)
            (LETT |unifact| (QVELT |vfchoo| 1) . #12#)
            (LETT |nfact| (LENGTH |unifact|) . #12#)
            (EXIT
             (COND ((EQL |nfact| 1) (LIST |um|))
                   (#11#
                    (SEQ (LETT |ltry| (QVELT |vfchoo| 0) . #12#)
                         (LETT |lval| (|SPADfirst| |ltry|) . #12#)
                         (LETT |dd| (QVELT |vfchoo| 2) . #12#)
                         (LETT |leadval| NIL . #12#) (LETT |lpol| NIL . #12#)
                         (COND
                          (|polcase|
                           (SEQ (LETT |leadval| (QVELT |vfchoo| 3) . #12#)
                                (LETT |distf|
                                      (SPADCALL (QVELT |vfchoo| 2) |unifact|
                                                |tleadpol| |leadval| |lvar|
                                                |lval| (QREFELT $ 121))
                                      . #12#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |distf| 1)
                                   (PROGN
                                    (LETT #6#
                                          (|INNMFACT;intfact| |um| |lvar|
                                           |ldeg| |tleadpol| |ltry| |ufactor|
                                           $)
                                          . #12#)
                                    (GO #13#)))
                                  (#11#
                                   (SEQ (LETT |dist| (QCDR |distf|) . #12#)
                                        (LETT |lpol| (QVELT |dist| 0) . #12#)
                                        (LETT |dd| (QVELT |dist| 1) . #12#)
                                        (EXIT
                                         (LETT |unifact| (QVELT |dist| 2)
                                               . #12#)))))))))
                         (COND
                          ((SPADCALL |dd| (|spadConstant| $ 47) (QREFELT $ 89))
                           (SEQ
                            (LETT |unifact|
                                  (PROGN
                                   (LETT #5# NIL . #12#)
                                   (SEQ (LETT |unif| NIL . #12#)
                                        (LETT #4# |unifact| . #12#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |unif| (CAR #4#) . #12#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |dd| |unif|
                                                           (QREFELT $ 122))
                                                 #5#)
                                                . #12#)))
                                        (LETT #4# (CDR #4#) . #12#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  . #12#)
                            (EXIT
                             (LETT |umd|
                                   (SPADCALL
                                    (SPADCALL
                                     (QVELT (SPADCALL |dd| (QREFELT $ 123)) 0)
                                     (SPADCALL
                                      (SPADCALL |dd|
                                                (PROG1
                                                    (LETT #3# (- |nfact| 1)
                                                          . #12#)
                                                  (|check_subtype2| (>= #3# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #3#))
                                                (QREFELT $ 68))
                                      (QREFELT $ 38))
                                     (QREFELT $ 63))
                                    |um| (QREFELT $ 124))
                                   . #12#))))
                          (#11# (LETT |umd| |um| . #12#)))
                         (LETT |ffin|
                               (SPADCALL |umd| |lvar| |unifact| |lval| |lpol|
                                         |ldeg| (QREFELT $ 16) (QREFELT $ 127))
                               . #12#)
                         (EXIT
                          (COND
                           ((QEQCAR |ffin| 1)
                            (|INNMFACT;intfact| |um| |lvar| |ldeg| |tleadpol|
                             |ltry| |ufactor| $))
                           (#11#
                            (SEQ (LETT |factfin| (QCDR |ffin|) . #12#)
                                 (COND
                                  ((SPADCALL |dd| (|spadConstant| $ 47)
                                             (QREFELT $ 89))
                                   (LETT |factfin|
                                         (PROGN
                                          (LETT #2# NIL . #12#)
                                          (SEQ (LETT |ff| NIL . #12#)
                                               (LETT #1# |factfin| . #12#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |ff| (CAR #1#)
                                                            . #12#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (SPADCALL |ff|
                                                                  (QREFELT $
                                                                           128))
                                                        #2#)
                                                       . #12#)))
                                               (LETT #1# (CDR #1#) . #12#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         . #12#)))
                                 (EXIT |factfin|)))))))))))
          #13# (EXIT #6#)))) 

(SDEFUN |INNMFACT;mfconst|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((#1=#:G515 NIL) (|uf| NIL) (#2=#:G514 NIL)
          (|lum|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|Integer|)))))
          (|factfin| (|List| (|SparseUnivariatePolynomial| P))))
         (SEQ (LETT |factfin| NIL . #3=(|INNMFACT;mfconst|))
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ
                  (LETT |lum|
                        (SPADCALL
                         (SPADCALL (SPADCALL (ELT $ 27) |um| (QREFELT $ 31))
                                   |ufactor|)
                         (QREFELT $ 37))
                        . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |uf| NIL . #3#) (LETT #1# |lum| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |uf| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL (ELT $ 38) (QCAR |uf|)
                                            (QREFELT $ 41))
                                  #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))
                ('T
                 (|INNMFACT;intfact| |um| |lvar| |ldeg|
                  (CONS (|spadConstant| $ 43) NIL) NIL |ufactor| $))))))) 

(SDEFUN |INNMFACT;monicize|
        ((|um| |SparseUnivariatePolynomial| P) (|c| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|ans| (|SparseUnivariatePolynomial| P)) (|prod| (P)) (#1=#:G518 NIL)
          (|n| #2=(|NonNegativeInteger|)) (|lc| (P)) (|i| #2#) (#3=#:G516 NIL))
         (SEQ
          (LETT |n| (SPADCALL |um| (QREFELT $ 52)) . #4=(|INNMFACT;monicize|))
          (LETT |ans| (SPADCALL (|spadConstant| $ 48) |n| (QREFELT $ 49))
                . #4#)
          (LETT |n|
                (PROG1 (LETT #3# (- |n| 1) . #4#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #4#)
          (LETT |prod| (|spadConstant| $ 48) . #4#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |um| (SPADCALL |um| (QREFELT $ 129)) . #4#)
                            (|spadConstant| $ 130) (QREFELT $ 131)))
                 (GO G191)))
               (SEQ (LETT |i| (SPADCALL |um| (QREFELT $ 52)) . #4#)
                    (LETT |lc| (SPADCALL |um| (QREFELT $ 65)) . #4#)
                    (LETT |prod|
                          (SPADCALL |prod|
                                    (SPADCALL |c|
                                              (PROG1
                                                  (LETT #1#
                                                        (- |n|
                                                           (LETT |n| |i|
                                                                 . #4#))
                                                        . #4#)
                                                (|check_subtype2| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #1#))
                                              (QREFELT $ 132))
                                    (QREFELT $ 113))
                          . #4#)
                    (EXIT
                     (LETT |ans|
                           (SPADCALL |ans|
                                     (SPADCALL
                                      (SPADCALL |prod| |lc| (QREFELT $ 113))
                                      |i| (QREFELT $ 49))
                                     (QREFELT $ 133))
                           . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |INNMFACT;unmonicize|
        ((|m| |SparseUnivariatePolynomial| P) (|c| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPADCALL
         (SPADCALL |m| (SPADCALL |c| 1 (QREFELT $ 49)) (QREFELT $ 134))
         (QREFELT $ 128))) 

(SDEFUN |INNMFACT;monicMfpol|
        ((|um| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|))
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |List| (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|nldeg| (|List| (|NonNegativeInteger|)))
          (|monpol| (|SparseUnivariatePolynomial| P)) (|l| (P)))
         (SEQ
          (LETT |l| (SPADCALL |um| (QREFELT $ 65))
                . #1=(|INNMFACT;monicMfpol|))
          (LETT |monpol| (|INNMFACT;monicize| |um| |l| $) . #1#)
          (LETT |nldeg| (SPADCALL |monpol| |lvar| (QREFELT $ 135)) . #1#)
          (EXIT
           (SPADCALL (CONS #'|INNMFACT;monicMfpol!0| (VECTOR $ |l|))
                     (|INNMFACT;mfconst| |monpol| |lvar| |nldeg| |ufactor| $)
                     (QREFELT $ 138)))))) 

(SDEFUN |INNMFACT;monicMfpol!0| ((|z1| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1) . #1=(|INNMFACT;monicMfpol|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
                                     (|:| |pow| (|Integer|))))))))
         (SEQ
          (COND
           ((|HasCategory| (QREFELT $ 8) '(|Field|))
            (|INNMFACT;monicMfpol| |um| |lvar| |ldeg| |ufactor| $))
           ('T
            (SEQ
             (LETT |tleadpol|
                   (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT $ 65)) |ufactor|
                    $)
                   |INNMFACT;mfpol|)
             (EXIT
              (|INNMFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL |ufactor|
               $)))))))) 

(SDEFUN |INNMFACT;mFactor|
        ((|m| P)
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Record| (|:| |contp| R)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))))
        (SPROG
         ((#1=#:G581 NIL) (|lcfacs| (R)) (#2=#:G576 NIL) (#3=#:G575 (R))
          (#4=#:G577 (R)) (#5=#:G579 NIL) (#6=#:G593 NIL) (|f| NIL)
          (|factorlist|
           (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))
          (|auxfl|
           (|List| #7=(|Record| (|:| |irr| P) (|:| |pow| (|Integer|)))))
          (#8=#:G592 NIL) (|lfp| NIL) (#9=#:G591 NIL)
          (|lf| (|List| (|SparseUnivariatePolynomial| P)))
          (|um| (|SparseUnivariatePolynomial| P))
          (|ldeg| (|List| (|NonNegativeInteger|))) (#10=#:G590 NIL)
          (|lcterm| NIL) (|ffactor| (P)) (#11=#:G558 NIL) (|pc| (P))
          (|lvar| (|List| OV)) (|x| (OV))
          (|varch|
           (|Record| (|:| |npol| (|SparseUnivariatePolynomial| P))
                     (|:| |nvar| (|List| OV))
                     (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
          (#12=#:G589 NIL) (#13=#:G546 NIL) (|lcont| (P))
          (|ffexp| #14=(|Integer|)) (#15=#:G588 NIL) (|fact| NIL)
          (|sqqfact|
           (|List| (|Record| (|:| |factor| P) (|:| |exponent| #14#))))
          (|flead| (|Record| (|:| |contp| R) (|:| |factors| (|List| #7#))))
          (|sqfacs| (|Factored| P)) (#16=#:G535 NIL)
          (#17=#:G534 #18=(|Boolean|)) (#19=#:G536 #18#) (#20=#:G587 NIL)
          (|n| NIL) (|lmdeg| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL |m| (QREFELT $ 66))
            (CONS (SPADCALL |m| (QREFELT $ 71)) NIL))
           (#21='T
            (SEQ
             (LETT |lvar| (SPADCALL |m| (QREFELT $ 25))
                   . #22=(|INNMFACT;mFactor|))
             (LETT |flead| (CONS (|spadConstant| $ 43) NIL) . #22#)
             (LETT |factorlist| NIL . #22#)
             (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 139)) . #22#)
             (EXIT
              (COND
               ((PROGN
                 (LETT #16# NIL . #22#)
                 (SEQ (LETT |n| NIL . #22#) (LETT #20# |lmdeg| . #22#) G190
                      (COND
                       ((OR (ATOM #20#)
                            (PROGN (LETT |n| (CAR #20#) . #22#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #19# (SPADCALL |n| 0 (QREFELT $ 46)) . #22#)
                         (COND
                          (#16# (LETT #17# (COND (#17# 'T) ('T #19#)) . #22#))
                          ('T
                           (PROGN
                            (LETT #17# #19# . #22#)
                            (LETT #16# 'T . #22#)))))))
                      (LETT #20# (CDR #20#) . #22#) (GO G190) G191 (EXIT NIL))
                 (COND (#16# #17#) (#21# 'NIL)))
                (|INNMFACT;simplify| |m| |lvar| |lmdeg| |ufactor| $))
               (#21#
                (SEQ (LETT |sqfacs| (SPADCALL |m| (QREFELT $ 141)) . #22#)
                     (LETT |lcont| (SPADCALL |sqfacs| (QREFELT $ 143)) . #22#)
                     (COND
                      ((SPADCALL |lcont| (QREFELT $ 66))
                       (PROGN
                        (RPLACA |flead| (SPADCALL |lcont| (QREFELT $ 71)))
                        (QCAR |flead|)))
                      (#21#
                       (LETT |flead| (|INNMFACT;mFactor| |lcont| |ufactor| $)
                             . #22#)))
                     (LETT |factorlist| (QCDR |flead|) . #22#)
                     (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 146))
                           . #22#)
                     (SEQ (LETT |fact| NIL . #22#) (LETT #15# |sqqfact| . #22#)
                          G190
                          (COND
                           ((OR (ATOM #15#)
                                (PROGN (LETT |fact| (CAR #15#) . #22#) NIL))
                            (GO G191)))
                          (SEQ (LETT |ffactor| (QCAR |fact|) . #22#)
                               (LETT |ffexp| (QCDR |fact|) . #22#)
                               (LETT |lvar| (SPADCALL |ffactor| (QREFELT $ 25))
                                     . #22#)
                               (LETT |x| (|SPADfirst| |lvar|) . #22#)
                               (LETT |ldeg|
                                     (SPADCALL |ffactor| |lvar|
                                               (QREFELT $ 147))
                                     . #22#)
                               (EXIT
                                (COND
                                 ((SPADCALL 1 |ldeg| (QREFELT $ 152))
                                  (SEQ
                                   (LETT |x|
                                         (SPADCALL |lvar|
                                                   (SPADCALL 1 |ldeg|
                                                             (QREFELT $ 82))
                                                   (QREFELT $ 83))
                                         . #22#)
                                   (LETT |lcont|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |ffactor| |x|
                                                     (QREFELT $ 80))
                                           (QREFELT $ 23))
                                          (QREFELT $ 153))
                                         . #22#)
                                   (LETT |ffactor|
                                         (PROG2
                                             (LETT #13#
                                                   (SPADCALL |ffactor| |lcont|
                                                             (QREFELT $ 115))
                                                   . #22#)
                                             (QCDR #13#)
                                           (|check_union2| (QEQCAR #13# 0)
                                                           (QREFELT $ 9)
                                                           (|Union|
                                                            (QREFELT $ 9)
                                                            #23="failed")
                                                           #13#))
                                         . #22#)
                                   (LETT |factorlist|
                                         (CONS (CONS |ffactor| |ffexp|)
                                               |factorlist|)
                                         . #22#)
                                   (EXIT
                                    (SEQ (LETT |lcterm| NIL . #22#)
                                         (LETT #12#
                                               (QCDR
                                                (|INNMFACT;mFactor| |lcont|
                                                 |ufactor| $))
                                               . #22#)
                                         G190
                                         (COND
                                          ((OR (ATOM #12#)
                                               (PROGN
                                                (LETT |lcterm| (CAR #12#)
                                                      . #22#)
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
                                                 . #22#)))
                                         (LETT #12# (CDR #12#) . #22#)
                                         (GO G190) G191 (EXIT NIL)))))
                                 ('T
                                  (SEQ
                                   (LETT |varch|
                                         (|INNMFACT;varChoose| |ffactor| |lvar|
                                          |ldeg| $)
                                         . #22#)
                                   (LETT |um| (QVELT |varch| 0) . #22#)
                                   (LETT |x| (|SPADfirst| |lvar|) . #22#)
                                   (LETT |ldeg| (CDR |ldeg|) . #22#)
                                   (LETT |lvar| (CDR |lvar|) . #22#)
                                   (COND
                                    ((SPADCALL (|SPADfirst| (QVELT |varch| 1))
                                               |x| (QREFELT $ 154))
                                     (SEQ
                                      (LETT |lvar| (QVELT |varch| 1) . #22#)
                                      (LETT |x| (|SPADfirst| |lvar|) . #22#)
                                      (EXIT
                                       (LETT |lvar| (CDR |lvar|) . #22#)))))
                                   (LETT |pc|
                                         (SPADCALL
                                          (SPADCALL |um| (QREFELT $ 23))
                                          (QREFELT $ 153))
                                         . #22#)
                                   (COND
                                    ((SPADCALL |pc| (|spadConstant| $ 48)
                                               (QREFELT $ 155))
                                     (SEQ
                                      (LETT |um|
                                            (PROG2
                                                (LETT #11#
                                                      (SPADCALL |um| |pc|
                                                                (QREFELT $
                                                                         156))
                                                      . #22#)
                                                (QCDR #11#)
                                              (|check_union2| (QEQCAR #11# 0)
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 9))
                                                              (|Union|
                                                               (|SparseUnivariatePolynomial|
                                                                (QREFELT $ 9))
                                                               "failed")
                                                              #11#))
                                            . #22#)
                                      (LETT |ffactor|
                                            (SPADCALL |um| |x| (QREFELT $ 157))
                                            . #22#)
                                      (EXIT
                                       (SEQ (LETT |lcterm| NIL . #22#)
                                            (LETT #10#
                                                  (QCDR
                                                   (|INNMFACT;mFactor| |pc|
                                                    |ufactor| $))
                                                  . #22#)
                                            G190
                                            (COND
                                             ((OR (ATOM #10#)
                                                  (PROGN
                                                   (LETT |lcterm| (CAR #10#)
                                                         . #22#)
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
                                                    . #22#)))
                                            (LETT #10# (CDR #10#) . #22#)
                                            (GO G190) G191 (EXIT NIL))))))
                                   (LETT |ldeg|
                                         (SPADCALL |ffactor| |lvar|
                                                   (QREFELT $ 147))
                                         . #22#)
                                   (LETT |um| (SPADCALL |um| (QREFELT $ 158))
                                         . #22#)
                                   (COND
                                    ((SPADCALL (SPADCALL |um| (QREFELT $ 65))
                                               (QREFELT $ 66))
                                     (LETT |lf|
                                           (|INNMFACT;mfconst| |um| |lvar|
                                            |ldeg| |ufactor| $)
                                           . #22#))
                                    ('T
                                     (LETT |lf|
                                           (|INNMFACT;mfpol| |um| |lvar| |ldeg|
                                            |ufactor| $)
                                           . #22#)))
                                   (LETT |auxfl|
                                         (PROGN
                                          (LETT #9# NIL . #22#)
                                          (SEQ (LETT |lfp| NIL . #22#)
                                               (LETT #8# |lf| . #22#) G190
                                               (COND
                                                ((OR (ATOM #8#)
                                                     (PROGN
                                                      (LETT |lfp| (CAR #8#)
                                                            . #22#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #9#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL
                                                          (SPADCALL |lfp| |x|
                                                                    (QREFELT $
                                                                             157))
                                                          (QREFELT $ 159))
                                                         |ffexp|)
                                                        #9#)
                                                       . #22#)))
                                               (LETT #8# (CDR #8#) . #22#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #9#))))
                                         . #22#)
                                   (EXIT
                                    (LETT |factorlist|
                                          (APPEND |factorlist| |auxfl|)
                                          . #22#)))))))
                          (LETT #15# (CDR #15#) . #22#) (GO G190) G191
                          (EXIT NIL))
                     (LETT |lcfacs|
                           (PROGN
                            (LETT #2# NIL . #22#)
                            (SEQ (LETT |f| NIL . #22#)
                                 (LETT #6# |factorlist| . #22#) G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT |f| (CAR #6#) . #22#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (SPADCALL
                                           (SPADCALL (QCAR |f|) (QREFELT $ 67))
                                           (PROG1 (LETT #5# (QCDR |f|) . #22#)
                                             (|check_subtype2| (>= #5# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #5#))
                                           (QREFELT $ 68))
                                          . #22#)
                                    (COND
                                     (#2#
                                      (LETT #3#
                                            (SPADCALL #3# #4# (QREFELT $ 69))
                                            . #22#))
                                     ('T
                                      (PROGN
                                       (LETT #3# #4# . #22#)
                                       (LETT #2# 'T . #22#)))))))
                                 (LETT #6# (CDR #6#) . #22#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#2# #3#) (#21# (|spadConstant| $ 47))))
                           . #22#)
                     (EXIT
                      (CONS
                       (PROG2
                           (LETT #1#
                                 (SPADCALL (SPADCALL |m| (QREFELT $ 67))
                                           |lcfacs| (QREFELT $ 72))
                                 . #22#)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 8)
                                         (|Union| (QREFELT $ 8) #23#) #1#))
                       |factorlist|)))))))))))) 

(SDEFUN |INNMFACT;factor;PMF;15|
        ((|m| P)
         (|ufactor| |Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
          (|SparseUnivariatePolynomial| R))
         ($ |Factored| P))
        (SPROG
         ((#1=#:G597 NIL) (#2=#:G596 #3=(|Factored| P)) (#4=#:G598 #3#)
          (#5=#:G601 NIL) (|u| NIL)
          (|flist|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|Integer|))))))))
         (SEQ
          (LETT |flist| (|INNMFACT;mFactor| |m| |ufactor| $)
                . #6=(|INNMFACT;factor;PMF;15|))
          (EXIT
           (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 38))
                     (PROGN
                      (LETT #1# NIL . #6#)
                      (SEQ (LETT |u| NIL . #6#) (LETT #5# (QCDR |flist|) . #6#)
                           G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (SPADCALL (QCAR |u|) (QCDR |u|)
                                              (QREFELT $ 160))
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 161))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 151))))
                     (QREFELT $ 162)))))) 

(DECLAIM (NOTINLINE |InnerMultFact;|)) 

(DEFUN |InnerMultFact| (&REST #1=#:G602)
  (SPROG NIL
         (PROG (#2=#:G603)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerMultFact|)
                                               '|domainEqualList|)
                    . #3=(|InnerMultFact|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerMultFact;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|InnerMultFact|)))))))))) 

(DEFUN |InnerMultFact;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerMultFact|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|InnerMultFact| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 164) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              (|Record| (|:| |factor| 28) (|:| |exponent| 12)) (|List| 35)
              (68 . |factors|) (73 . |coerce|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 28 9 17) (78 . |map|)
              (84 . |Zero|) (88 . |Zero|) (|NonNegativeInteger|)
              (92 . |minimumDegree|) (97 . >) (103 . |One|) (107 . |One|)
              (111 . |monomial|) (|Union| $ '"failed") (117 . |exquo|)
              (123 . |degree|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (128 . |unitNormal|) (|Factored| 17)
              (|MultivariateSquareFree| 7 6 8 9) (133 . |squareFree|)
              (138 . |unit|) (143 . *)
              (|Record| (|:| |factor| 17) (|:| |exponent| 12)) (|List| 60)
              (149 . |factors|) (154 . *) (160 . |degree|)
              (166 . |leadingCoefficient|) (171 . |ground?|)
              (176 . |leadingCoefficient|) (181 . ^) (187 . *)
              (193 . |retract|) (198 . |retract|) (203 . |exquo|)
              (209 . |primeFactor|) (215 . *) (221 . |One|) (225 . *)
              (|Mapping| 32 28) |INNMFACT;factor;SupMF;3|
              (|SparseUnivariatePolynomial| $) (231 . |univariate|) (|List| 44)
              (237 . |position|) (243 . |elt|) (249 . |delete|)
              (255 . |delete|) (261 . |numberOfMonomials|) (266 . |degree|)
              (271 . |coefficient|) (277 . ~=) (283 . |euclideanSize|)
              (|FactoringUtilities| 7 6 8 9) (288 . |ran|) (|List| 8)
              (|List| 93) (293 . |member?|) (299 . *) (305 . |eval|)
              (312 . |unit?|) (317 . |completeEval|) (324 . ~=)
              (330 . |minimumDegree|) (335 . |content|) (340 . |exquo|)
              (|LeadingCoefDetermination| 6 7 8 9) (346 . |polCase|)
              (353 . |differentiate|) (|List| $) (358 . |gcd|) (363 . >)
              (369 . |position|) (375 . |elt|) (381 . |monomial|) (388 . *)
              (394 . |coerce|) (399 . |exquo|)
              (|Record| (|:| |polfac| 22) (|:| |correct| 8)
                        (|:| |corrfact| 118))
              (|Union| 116 '"failed") (|List| 28)
              (|Record| (|:| |irr| 9) (|:| |pow| 12))
              (|Record| (|:| |contp| 8) (|:| |factors| (|List| 119)))
              (405 . |distFact|) (415 . *) (421 . |unitNormal|) (426 . *)
              (|Union| 137 '"failed") (|MultivariateLifting| 7 6 8 9)
              (432 . |lifting|) (443 . |primitivePart|) (448 . |reductum|)
              (453 . |Zero|) (457 . ~=) (463 . ^) (469 . +) (475 . |elt|)
              (481 . |degree|) (|Mapping| 17 17) (|List| 17) (487 . |map|)
              (493 . |minimumDegree|) (|Factored| $) (499 . |squareFree|)
              (|Factored| 9) (504 . |unit|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 12)) (|List| 144)
              (509 . |factors|) (514 . |degree|) (520 . |One|) (524 . |One|)
              (528 . |One|) (532 . |One|) (536 . |member?|) (542 . |gcd|)
              (547 . ~=) (553 . ~=) (559 . |exquo|) (565 . |multivariate|)
              (571 . |unitCanonical|) (576 . |unitCanonical|)
              (581 . |primeFactor|) (587 . *) (593 . *)
              |INNMFACT;factor;PMF;15|)
           '#(|factor| 599) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 163
                                                 '(2 10 0 0 10 11 1 13 12 12 14
                                                   1 8 0 12 15 1 17 0 9 18 1 17
                                                   19 0 20 1 17 9 0 21 1 17 22
                                                   0 23 1 9 24 0 25 2 24 0 0 0
                                                   26 1 9 8 0 27 2 30 28 29 17
                                                   31 1 32 28 0 33 1 28 8 0 34
                                                   1 32 36 0 37 1 9 0 8 38 2 40
                                                   17 39 28 41 0 7 0 42 0 8 0
                                                   43 1 17 44 0 45 2 44 19 0 0
                                                   46 0 8 0 47 0 9 0 48 2 17 0
                                                   9 44 49 2 17 50 0 0 51 1 17
                                                   44 0 52 1 17 53 0 54 1 56 55
                                                   17 57 1 55 17 0 58 2 17 0 0
                                                   0 59 1 55 61 0 62 2 9 0 8 0
                                                   63 2 9 44 0 6 64 1 17 9 0 65
                                                   1 9 19 0 66 1 9 8 0 67 2 8 0
                                                   0 44 68 2 8 0 0 0 69 1 17 9
                                                   0 70 1 9 8 0 71 2 8 50 0 0
                                                   72 2 55 0 17 12 73 2 55 0 0
                                                   0 74 0 55 0 75 2 55 0 17 0
                                                   76 2 9 79 0 6 80 2 81 12 44
                                                   0 82 2 24 6 0 12 83 2 81 0 0
                                                   12 84 2 24 0 0 12 85 1 28 44
                                                   0 86 1 28 44 0 87 2 28 8 0
                                                   44 88 2 8 19 0 0 89 1 8 44 0
                                                   90 1 91 8 12 92 2 94 19 93 0
                                                   95 2 44 0 10 0 96 3 9 0 0 24
                                                   93 97 1 8 19 0 98 3 91 28 17
                                                   24 93 99 2 44 19 0 0 100 1
                                                   28 44 0 101 1 28 8 0 102 2
                                                   28 50 0 8 103 3 104 19 8 44
                                                   93 105 1 28 0 0 106 1 28 0
                                                   107 108 2 12 19 0 0 109 2 24
                                                   12 6 0 110 2 81 44 0 12 111
                                                   3 9 0 0 6 44 112 2 9 0 0 0
                                                   113 1 9 0 6 114 2 9 50 0 0
                                                   115 6 104 117 8 118 120 93
                                                   24 93 121 2 28 0 8 0 122 1 8
                                                   53 0 123 2 17 0 9 0 124 7
                                                   126 125 17 24 118 93 22 81 8
                                                   127 1 17 0 0 128 1 17 0 0
                                                   129 0 17 0 130 2 17 19 0 0
                                                   131 2 9 0 0 44 132 2 17 0 0
                                                   0 133 2 17 0 0 0 134 2 91 81
                                                   17 24 135 2 137 0 136 0 138
                                                   2 9 81 0 24 139 1 9 140 0
                                                   141 1 142 9 0 143 1 142 145
                                                   0 146 2 9 81 0 24 147 0 17 0
                                                   148 0 28 0 149 0 32 0 150 0
                                                   142 0 151 2 81 19 44 0 152 1
                                                   9 0 107 153 2 6 19 0 0 154 2
                                                   9 19 0 0 155 2 17 50 0 9 156
                                                   2 9 0 79 6 157 1 17 0 0 158
                                                   1 9 0 0 159 2 142 0 9 12 160
                                                   2 142 0 0 0 161 2 142 0 9 0
                                                   162 2 0 55 17 77 78 2 0 142
                                                   9 77 163)))))
           '|lookupComplete|)) 
