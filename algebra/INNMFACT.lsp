
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
                     (LETT #27# NIL . #32=(|INNMFACT;supFactor|))
                     (SEQ (LETT |cf| NIL . #32#)
                          (LETT #30# (SPADCALL |um| (QREFELT $ 23)) . #32#)
                          G190
                          (COND
                           ((OR (ATOM #30#)
                                (PROGN (LETT |cf| (CAR #30#) . #32#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #29# (SPADCALL |cf| (QREFELT $ 25)) . #32#)
                             (COND
                              (#27#
                               (LETT #28# (SPADCALL #28# #29# (QREFELT $ 26))
                                     . #32#))
                              ('T
                               (PROGN
                                (LETT #28# #29# . #32#)
                                (LETT #27# 'T . #32#)))))))
                          (LETT #30# (CDR #30#) . #32#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#27# #28#) (#31# (|IdentityError| '|setUnion|))))
                    . #32#)
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ
                  (LETT |umv| (SPADCALL (ELT $ 27) |um| (QREFELT $ 31)) . #32#)
                  (LETT |lfact| (SPADCALL |umv| |ufactor|) . #32#)
                  (EXIT
                   (CONS
                    (SPADCALL (SPADCALL |lfact| (QREFELT $ 33)) (QREFELT $ 34))
                    (PROGN
                     (LETT #25# NIL . #32#)
                     (SEQ (LETT |ff| NIL . #32#)
                          (LETT #24# (SPADCALL |lfact| (QREFELT $ 38)) . #32#)
                          G190
                          (COND
                           ((OR (ATOM #24#)
                                (PROGN (LETT |ff| (CAR #24#) . #32#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #25#
                                  (CONS
                                   (CONS
                                    (SPADCALL (ELT $ 39) (QVELT |ff| 1)
                                              (QREFELT $ 42))
                                    (QVELT |ff| 2))
                                   #25#)
                                  . #32#)))
                          (LETT #24# (CDR #24#) . #32#) (GO G190) G191
                          (EXIT (NREVERSE #25#))))))))
                (#31#
                 (SEQ (LETT |flead| (CONS (|spadConstant| $ 44) NIL) . #32#)
                      (LETT |factorlist| NIL . #32#)
                      (LETT |mdeg| (SPADCALL |um| (QREFELT $ 46)) . #32#)
                      (COND
                       ((SPADCALL |mdeg| 0 (QREFELT $ 47))
                        (SEQ
                         (LETT |f1|
                               (SPADCALL (|spadConstant| $ 49) |mdeg|
                                         (QREFELT $ 50))
                               . #32#)
                         (LETT |um|
                               (PROG2
                                   (LETT #23#
                                         (SPADCALL |um| |f1| (QREFELT $ 52))
                                         . #32#)
                                   (QCDR #23#)
                                 (|check_union2| (QEQCAR #23# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 9))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 9))
                                                  "failed")
                                                 #23#))
                               . #32#)
                         (LETT |factorlist|
                               (CONS
                                (CONS
                                 (SPADCALL (|spadConstant| $ 49) 1
                                           (QREFELT $ 50))
                                 |mdeg|)
                                |factorlist|)
                               . #32#)
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
                                           $)
                                          . #32#)
                                    (EXIT
                                     (CONS (QCAR |lfg|)
                                           (SPADCALL |factorlist| (QCDR |lfg|)
                                                     (QREFELT $ 56)))))
                                   . #32#)
                             (GO #33=#:G186))))))))
                      (LETT |uum| (SPADCALL |um| (QREFELT $ 58)) . #32#)
                      (LETT |um| (QVELT |uum| 1) . #32#)
                      (LETT |sqfacs| (SPADCALL |um| (QREFELT $ 61)) . #32#)
                      (LETT |lcont|
                            (SPADCALL
                             (SPADCALL (QVELT |uum| 0)
                                       (SPADCALL |sqfacs| (QREFELT $ 62))
                                       (QREFELT $ 63))
                             (QREFELT $ 21))
                            . #32#)
                      (LETT |flead|
                            (|INNMFACT;convertPUP|
                             (|INNMFACT;mFactor| |lcont| |ufactor| $) $)
                            . #32#)
                      (LETT |factorlist|
                            (SPADCALL (QCDR |flead|) |factorlist|
                                      (QREFELT $ 56))
                            . #32#)
                      (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 66))
                            . #32#)
                      (SEQ (LETT |fact| NIL . #32#)
                           (LETT #21# |sqqfact| . #32#) G190
                           (COND
                            ((OR (ATOM #21#)
                                 (PROGN (LETT |fact| (CAR #21#) . #32#) NIL))
                             (GO G191)))
                           (SEQ (LETT |ffactor| (QVELT |fact| 1) . #32#)
                                (LETT |ffexp| (QVELT |fact| 2) . #32#)
                                (EXIT
                                 (COND
                                  ((ZEROP (SPADCALL |ffactor| (QREFELT $ 53)))
                                   (SEQ
                                    (LETT |lfg|
                                          (|INNMFACT;mFactor|
                                           (SPADCALL |ffactor| (QREFELT $ 21))
                                           |ufactor| $)
                                          . #32#)
                                    (LETT |lcont|
                                          (SPADCALL (QCAR |lfg|) |lcont|
                                                    (QREFELT $ 67))
                                          . #32#)
                                    (EXIT
                                     (LETT |factorlist|
                                           (SPADCALL |factorlist|
                                                     (PROGN
                                                      (LETT #18# NIL . #32#)
                                                      (SEQ
                                                       (LETT |lff| NIL . #32#)
                                                       (LETT #17# (QCDR |lfg|)
                                                             . #32#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #17#)
                                                             (PROGN
                                                              (LETT |lff|
                                                                    (CAR #17#)
                                                                    . #32#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #18#
                                                               (CONS
                                                                (CONS
                                                                 (SPADCALL
                                                                  (QCAR |lff|)
                                                                  (QREFELT $
                                                                           18))
                                                                 (*
                                                                  (QCDR |lff|)
                                                                  |ffexp|))
                                                                #18#)
                                                               . #32#)))
                                                       (LETT #17# (CDR #17#)
                                                             . #32#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #18#))))
                                                     (QREFELT $ 56))
                                           . #32#))))
                                  ('T
                                   (SEQ
                                    (LETT |coefs|
                                          (SPADCALL |ffactor| (QREFELT $ 23))
                                          . #32#)
                                    (LETT |ldeg|
                                          (PROGN
                                           (LETT #16# NIL . #32#)
                                           (SEQ (LETT |xx| NIL . #32#)
                                                (LETT #15# |lvar| . #32#) G190
                                                (COND
                                                 ((OR (ATOM #15#)
                                                      (PROGN
                                                       (LETT |xx| (CAR #15#)
                                                             . #32#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #16#
                                                        (CONS
                                                         (PROGN
                                                          (LETT #11# NIL
                                                                . #32#)
                                                          (SEQ
                                                           (LETT |fc| NIL
                                                                 . #32#)
                                                           (LETT #14# |coefs|
                                                                 . #32#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #14#)
                                                                 (PROGN
                                                                  (LETT |fc|
                                                                        (CAR
                                                                         #14#)
                                                                        . #32#)
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (PROGN
                                                              (LETT #13#
                                                                    (SPADCALL
                                                                     |fc| |xx|
                                                                     (QREFELT $
                                                                              68))
                                                                    . #32#)
                                                              (COND
                                                               (#11#
                                                                (LETT #12#
                                                                      (MAX #12#
                                                                           #13#)
                                                                      . #32#))
                                                               ('T
                                                                (PROGN
                                                                 (LETT #12#
                                                                       #13#
                                                                       . #32#)
                                                                 (LETT #11# 'T
                                                                       . #32#)))))))
                                                           (LETT #14#
                                                                 (CDR #14#)
                                                                 . #32#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                          (COND (#11# #12#)
                                                                ('T
                                                                 (|IdentityError|
                                                                  '|max|))))
                                                         #16#)
                                                        . #32#)))
                                                (LETT #15# (CDR #15#) . #32#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #16#))))
                                          . #32#)
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
                                             |ldeg| |ufactor| $)))
                                          . #32#)
                                    (LETT |auxfl|
                                          (PROGN
                                           (LETT #9# NIL . #32#)
                                           (SEQ (LETT |lfp| NIL . #32#)
                                                (LETT #8# |lf| . #32#) G190
                                                (COND
                                                 ((OR (ATOM #8#)
                                                      (PROGN
                                                       (LETT |lfp| (CAR #8#)
                                                             . #32#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #9#
                                                        (CONS
                                                         (CONS |lfp| |ffexp|)
                                                         #9#)
                                                        . #32#)))
                                                (LETT #8# (CDR #8#) . #32#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #9#))))
                                          . #32#)
                                    (EXIT
                                     (LETT |factorlist|
                                           (SPADCALL |factorlist| |auxfl|
                                                     (QREFELT $ 56))
                                           . #32#)))))))
                           (LETT #21# (CDR #21#) . #32#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |lcfacs|
                            (PROGN
                             (LETT #3# NIL . #32#)
                             (SEQ (LETT |f| NIL . #32#)
                                  (LETT #6# |factorlist| . #32#) G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN
                                         (LETT |f| (CAR #6#) . #32#)
                                         NIL))
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
                                            (QCDR |f|) (QREFELT $ 72))
                                           . #32#)
                                     (COND
                                      (#3#
                                       (LETT #4#
                                             (SPADCALL #4# #5# (QREFELT $ 73))
                                             . #32#))
                                      ('T
                                       (PROGN
                                        (LETT #4# #5# . #32#)
                                        (LETT #3# 'T . #32#)))))))
                                  (LETT #6# (CDR #6#) . #32#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#3# #4#) (#31# (|spadConstant| $ 48))))
                            . #32#)
                      (LETT |uum1|
                            (SPADCALL (SPADCALL (QVELT |uum| 0) (QREFELT $ 74))
                                      (QREFELT $ 75))
                            . #32#)
                      (EXIT
                       (CONS
                        (SPADCALL |uum1|
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |um| (QREFELT $ 69))
                                              (QREFELT $ 71))
                                             |lcfacs| (QREFELT $ 76))
                                            . #32#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT $ 8)
                                                    (|Union| (QREFELT $ 8)
                                                             "failed")
                                                    #2#))
                                  (QREFELT $ 73))
                        |factorlist|))))))))))
          #33# (EXIT #22#)))) 

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
         (SEQ
          (LETT |flist| (|INNMFACT;supFactor| |um| |ufactor| $)
                . #6=(|INNMFACT;factor;SupMF;3|))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 39)) (QREFELT $ 18))
            (PROGN
             (LETT #1# NIL . #6#)
             (SEQ (LETT |u| NIL . #6#) (LETT #5# (QCDR |flist|) . #6#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL (QCAR |u|) (QCDR |u|) (QREFELT $ 77))
                           . #6#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 78)) . #6#))
                      ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                  (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
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
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 68)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 84)) |lvar|
                     |ldeg|))
            (#7#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 86)) . #6#)
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 87)) . #6#)
                  (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 88)))
                        . #6#)
                  (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 89)))
                        . #6#)
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
             (LETT #10# NIL . #14=(|INNMFACT;localNorm|))
             (SEQ (LETT |ff| NIL . #14#) (LETT #13# |lum| . #14#) G190
                  (COND
                   ((OR (ATOM #13#) (PROGN (LETT |ff| (CAR #13#) . #14#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #12# (SPADCALL |ff| (QREFELT $ 90)) . #14#)
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
                                 (LETT #8# (SPADCALL |ff| (QREFELT $ 91))
                                       . #14#)
                                 G190 (COND ((|greater_SI| |i| #8#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (LETT |cc|
                                            (SPADCALL |ff| |i| (QREFELT $ 92))
                                            . #14#)
                                      (|spadConstant| $ 44) (QREFELT $ 93))
                                     (PROGN
                                      (LETT #7# (SPADCALL |cc| (QREFELT $ 94))
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
           (SEQ
            (LETT |degum| (SPADCALL |um| (QREFELT $ 53))
                  . #27=(|INNMFACT;intChoose|))
            (LETT |nvar1| (LENGTH |lvar|) . #27#) (LETT |range| 5 . #27#)
            (LETT |ctf1| (|spadConstant| $ 48) . #27#)
            (LETT |testp| (NULL (NULL |plist|)) . #27#)
            (LETT |leadcomp| (LETT |leadcomp1| NIL . #27#) . #27#)
            (LETT |nfatt| (+ |degum| 1) . #27#)
            (LETT |lffc| (|spadConstant| $ 48) . #27#)
            (LETT |lffc1| |lffc| . #27#) (LETT |newunifact| NIL . #27#)
            (LETT |leadtest| 'T . #27#) (LETT |int| NIL . #27#)
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
                          (LETT #26# (CONS 1 "failed") . #27#)
                          (GO #28=#:G272)))))))
                    (LETT |lval|
                          (PROGN
                           (LETT #25# NIL . #27#)
                           (SEQ (LETT |i| 1 . #27#) (LETT #24# |nvar1| . #27#)
                                G190 (COND ((|greater_SI| |i| #24#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #25#
                                        (CONS (SPADCALL |range| (QREFELT $ 96))
                                              #25#)
                                        . #27#)))
                                (LETT |i| (|inc_SI| |i|) . #27#) (GO G190) G191
                                (EXIT (NREVERSE #25#))))
                          . #27#)
                    (EXIT
                     (COND
                      ((SPADCALL |lval| |ltry| (QREFELT $ 99))
                       (LETT |range| (SPADCALL 2 |range| (QREFELT $ 100))
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
                                                            (QREFELT $ 101))
                                                  (QREFELT $ 75))
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
                                               (SPADCALL |epl| (QREFELT $ 102))
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
                                 (COND (#17# #18#) ('T NIL)))
                                (EXIT
                                 (LETT |range|
                                       (SPADCALL 2 |range| (QREFELT $ 100))
                                       . #27#))))))
                            (LETT |newm|
                                  (SPADCALL |um| |lvar| |lval| (QREFELT $ 103))
                                  . #27#)
                            (COND
                             ((OR
                               (SPADCALL |degum|
                                         (SPADCALL |newm| (QREFELT $ 91))
                                         (QREFELT $ 104))
                               (SPADCALL (SPADCALL |newm| (QREFELT $ 105)) 0
                                         (QREFELT $ 104)))
                              (EXIT
                               (LETT |range|
                                     (SPADCALL 2 |range| (QREFELT $ 100))
                                     . #27#))))
                            (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 106))
                                  . #27#)
                            (LETT |newm|
                                  (PROG2
                                      (LETT #16#
                                            (SPADCALL |newm| |lffc1|
                                                      (QREFELT $ 107))
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
                                    (SPADCALL |lffc1| |clc| (QREFELT $ 73))
                                    (LENGTH |plist|) |leadcomp1|
                                    (QREFELT $ 109)))
                                  (EXIT
                                   (LETT |range|
                                         (SPADCALL 2 |range| (QREFELT $ 100))
                                         . #27#))))))))
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
                                     (SPADCALL 2 |range| (QREFELT $ 100))
                                     . #27#))
                              ('T
                               (SEQ
                                (LETT |luniv| (SPADCALL |newm| |ufactor|)
                                      . #27#)
                                (LETT |lunivf|
                                      (SPADCALL |luniv| (QREFELT $ 38)) . #27#)
                                (LETT |lffc1|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |luniv| (QREFELT $ 33))
                                        (QREFELT $ 34))
                                       |lffc1| (QREFELT $ 73))
                                      . #27#)
                                (LETT |nf| (LENGTH |lunivf|) . #27#)
                                (COND
                                 ((OR (EQL |nf| 0)
                                      (SPADCALL |nf| |nfatt| (QREFELT $ 47)))
                                  (EXIT "next values")))
                                (COND
                                 ((EQL |nf| 1)
                                  (SEQ (LETT |unifact| (LIST |newm|) . #27#)
                                       (EXIT
                                        (PROGN
                                         (LETT #7# |$NoValue| . #27#)
                                         (GO #29=#:G270))))))
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
                                                           (CONS (QVELT |uf| 1)
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
                                                      (CONS (QVELT |ff| 1)
                                                            #13#)
                                                      . #27#)))
                                              (LETT #12# (CDR #12#) . #27#)
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
                                                                (QVELT |uf| 1)
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
                                                             (CONS
                                                              (QVELT |uf| 1)
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
                                  ((SPADCALL |nfatt| |degum| (QREFELT $ 47))
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
                                                        (CONS (QVELT |uf| 1)
                                                              #6#)
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
                                    (LETT |leadtest| NIL . #27#)
                                    (EXIT (LETT |nfatt| |nf| . #27#))))
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
                                              (QREFELT $ 109)))
                                            . #27#))
                                     ('T (LETT |leadtest| NIL . #27#)))
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
                                                           (CONS (QVELT |uf| 1)
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
         (SEQ (LETT |factorlist| NIL . #3=(|INNMFACT;simplify|))
              (LETT |pol1| (|spadConstant| $ 49) . #3#)
              (SEQ (LETT |x| NIL . #3#) (LETT #2# |lvar| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT $ 114))
                                    (QREFELT $ 115))
                          . #3#)
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| $ 49)
                                                       |x| |i| (QREFELT $ 116))
                                             (QREFELT $ 117))
                                   . #3#)
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT $ 118)) |i|)
                                     |factorlist|)
                                    . #3#)))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2
                        (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 119)) . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                      (|Union| (QREFELT $ 9) "failed") #1#))
                    . #3#)
              (EXIT
               (COND
                ((SPADCALL |m| (QREFELT $ 70))
                 (CONS (SPADCALL |m| (QREFELT $ 75)) |factorlist|))
                ('T
                 (SEQ (LETT |flead| (|INNMFACT;mFactor| |m| |ufactor| $) . #3#)
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
           (SEQ
            (LETT |polcase| (NULL (NULL (QCDR |tleadpol|)))
                  . #11=(|INNMFACT;intfact|))
            (LETT |vfchoo|
                  (COND
                   (|polcase|
                    (SEQ
                     (LETT |leadpol|
                           (PROGN
                            (LETT #10# NIL . #11#)
                            (SEQ (LETT |ff| NIL . #11#)
                                 (LETT #9# (QCDR |tleadpol|) . #11#) G190
                                 (COND
                                  ((OR (ATOM #9#)
                                       (PROGN
                                        (LETT |ff| (CAR #9#) . #11#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #10# (CONS (QCAR |ff|) #10#) . #11#)))
                                 (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                                 (EXIT (NREVERSE #10#))))
                           . #11#)
                     (LETT |check|
                           (|INNMFACT;intChoose| |um| |lvar| (QCAR |tleadpol|)
                            |leadpol| |ltry| |ufactor| $)
                           . #11#)
                     (EXIT
                      (COND
                       ((QEQCAR |check| 1)
                        (PROGN
                         (LETT #6#
                               (|INNMFACT;monicMfpol| |um| |lvar| |ldeg|
                                |ufactor| $)
                               . #11#)
                         (GO #12=#:G451)))
                       (#13='T (QCDR |check|))))))
                   (#13#
                    (PROG2
                        (LETT #7#
                              (|INNMFACT;intChoose| |um| |lvar|
                               (|spadConstant| $ 48) NIL NIL |ufactor| $)
                              . #11#)
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
                  . #11#)
            (LETT |unifact| (QVELT |vfchoo| 1) . #11#)
            (LETT |nfact| (LENGTH |unifact|) . #11#)
            (EXIT
             (COND ((EQL |nfact| 1) (LIST |um|))
                   (#13#
                    (SEQ (LETT |ltry| (QVELT |vfchoo| 0) . #11#)
                         (LETT |lval| (|SPADfirst| |ltry|) . #11#)
                         (LETT |dd| (QVELT |vfchoo| 2) . #11#)
                         (LETT |leadval| NIL . #11#) (LETT |lpol| NIL . #11#)
                         (COND
                          (|polcase|
                           (SEQ (LETT |leadval| (QVELT |vfchoo| 3) . #11#)
                                (LETT |distf|
                                      (SPADCALL (QVELT |vfchoo| 2) |unifact|
                                                |tleadpol| |leadval| |lvar|
                                                |lval| (QREFELT $ 127))
                                      . #11#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |distf| 1)
                                   (PROGN
                                    (LETT #6#
                                          (|INNMFACT;intfact| |um| |lvar|
                                           |ldeg| |tleadpol| |ltry| |ufactor|
                                           $)
                                          . #11#)
                                    (GO #12#)))
                                  (#13#
                                   (SEQ (LETT |dist| (QCDR |distf|) . #11#)
                                        (LETT |lpol| (QVELT |dist| 0) . #11#)
                                        (LETT |dd| (QVELT |dist| 1) . #11#)
                                        (EXIT
                                         (LETT |unifact| (QVELT |dist| 2)
                                               . #11#)))))))))
                         (COND
                          ((SPADCALL |dd| (|spadConstant| $ 48) (QREFELT $ 93))
                           (SEQ
                            (LETT |unifact|
                                  (PROGN
                                   (LETT #5# NIL . #11#)
                                   (SEQ (LETT |unif| NIL . #11#)
                                        (LETT #4# |unifact| . #11#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |unif| (CAR #4#) . #11#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |dd| |unif|
                                                           (QREFELT $ 128))
                                                 #5#)
                                                . #11#)))
                                        (LETT #4# (CDR #4#) . #11#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  . #11#)
                            (EXIT
                             (LETT |umd|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |dd|
                                               (PROG1
                                                   (LETT #3# (- |nfact| 1)
                                                         . #11#)
                                                 (|check_subtype2| (>= #3# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #3#))
                                               (QREFELT $ 72))
                                     (QREFELT $ 39))
                                    |um| (QREFELT $ 129))
                                   . #11#))))
                          (#13# (LETT |umd| |um| . #11#)))
                         (LETT |ffin|
                               (SPADCALL |umd| |lvar| |unifact| |lval| |lpol|
                                         |ldeg| (QREFELT $ 16) (QREFELT $ 132))
                               . #11#)
                         (EXIT
                          (COND
                           ((QEQCAR |ffin| 1)
                            (|INNMFACT;intfact| |um| |lvar| |ldeg| |tleadpol|
                             |ltry| |ufactor| $))
                           (#13#
                            (SEQ (LETT |factfin| (QCDR |ffin|) . #11#)
                                 (COND
                                  ((SPADCALL |dd| (|spadConstant| $ 48)
                                             (QREFELT $ 93))
                                   (LETT |factfin|
                                         (PROGN
                                          (LETT #2# NIL . #11#)
                                          (SEQ (LETT |ff| NIL . #11#)
                                               (LETT #1# |factfin| . #11#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |ff| (CAR #1#)
                                                            . #11#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (SPADCALL |ff|
                                                                  (QREFELT $
                                                                           133))
                                                        #2#)
                                                       . #11#)))
                                               (LETT #1# (CDR #1#) . #11#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         . #11#)))
                                 (EXIT |factfin|)))))))))))
          #12# (EXIT #6#)))) 

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
         (SEQ (LETT |factfin| NIL . #3=(|INNMFACT;mfconst|))
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ
                  (LETT |lum|
                        (SPADCALL
                         (SPADCALL (SPADCALL (ELT $ 27) |um| (QREFELT $ 31))
                                   |ufactor|)
                         (QREFELT $ 38))
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
                                  (SPADCALL (ELT $ 39) (QVELT |uf| 1)
                                            (QREFELT $ 42))
                                  #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
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
         (SEQ
          (LETT |n| (SPADCALL |um| (QREFELT $ 53)) . #4=(|INNMFACT;monicize|))
          (LETT |ans| (SPADCALL (|spadConstant| $ 49) |n| (QREFELT $ 50))
                . #4#)
          (LETT |n|
                (PROG1 (LETT #3# (- |n| 1) . #4#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #4#)
          (LETT |prod| (|spadConstant| $ 49) . #4#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |um| (SPADCALL |um| (QREFELT $ 134)) . #4#)
                            (|spadConstant| $ 135) (QREFELT $ 136)))
                 (GO G191)))
               (SEQ (LETT |i| (SPADCALL |um| (QREFELT $ 53)) . #4#)
                    (LETT |lc| (SPADCALL |um| (QREFELT $ 69)) . #4#)
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
                                              (QREFELT $ 137))
                                    (QREFELT $ 117))
                          . #4#)
                    (EXIT
                     (LETT |ans|
                           (SPADCALL |ans|
                                     (SPADCALL
                                      (SPADCALL |prod| |lc| (QREFELT $ 117))
                                      |i| (QREFELT $ 50))
                                     (QREFELT $ 138))
                           . #4#)))
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
         (SEQ
          (LETT |l| (SPADCALL |um| (QREFELT $ 69))
                . #1=(|INNMFACT;monicMfpol|))
          (LETT |monpol| (|INNMFACT;monicize| |um| |l| $) . #1#)
          (LETT |nldeg| (SPADCALL |monpol| |lvar| (QREFELT $ 140)) . #1#)
          (EXIT
           (SPADCALL (CONS #'|INNMFACT;monicMfpol!0| (VECTOR $ |l|))
                     (|INNMFACT;mfconst| |monpol| |lvar| |nldeg| |ufactor| $)
                     (QREFELT $ 143)))))) 

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
                                     (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ
          (COND
           ((|HasCategory| (QREFELT $ 8) '(|Field|))
            (|INNMFACT;monicMfpol| |um| |lvar| |ldeg| |ufactor| $))
           ('T
            (SEQ
             (LETT |tleadpol|
                   (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT $ 69)) |ufactor|
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
            (SEQ
             (LETT |lvar| (SPADCALL |m| (QREFELT $ 25))
                   . #21=(|INNMFACT;mFactor|))
             (LETT |flead| (CONS (|spadConstant| $ 44) NIL) . #21#)
             (LETT |factorlist| NIL . #21#)
             (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 144)) . #21#)
             (EXIT
              (COND
               ((PROGN
                 (LETT #15# NIL . #21#)
                 (SEQ (LETT |n| NIL . #21#) (LETT #19# |lmdeg| . #21#) G190
                      (COND
                       ((OR (ATOM #19#)
                            (PROGN (LETT |n| (CAR #19#) . #21#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #18# (SPADCALL |n| 0 (QREFELT $ 47)) . #21#)
                         (COND
                          (#15# (LETT #16# (COND (#16# 'T) ('T #18#)) . #21#))
                          ('T
                           (PROGN
                            (LETT #16# #18# . #21#)
                            (LETT #15# 'T . #21#)))))))
                      (LETT #19# (CDR #19#) . #21#) (GO G190) G191 (EXIT NIL))
                 (COND (#15# #16#) (#20# NIL)))
                (|INNMFACT;simplify| |m| |lvar| |lmdeg| |ufactor| $))
               (#20#
                (SEQ (LETT |sqfacs| (SPADCALL |m| (QREFELT $ 146)) . #21#)
                     (LETT |lcont| (SPADCALL |sqfacs| (QREFELT $ 148)) . #21#)
                     (COND
                      ((SPADCALL |lcont| (QREFELT $ 70))
                       (PROGN
                        (RPLACA |flead| (SPADCALL |lcont| (QREFELT $ 75)))
                        (QCAR |flead|)))
                      (#20#
                       (LETT |flead| (|INNMFACT;mFactor| |lcont| |ufactor| $)
                             . #21#)))
                     (LETT |factorlist| (QCDR |flead|) . #21#)
                     (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 151))
                           . #21#)
                     (SEQ (LETT |fact| NIL . #21#) (LETT #14# |sqqfact| . #21#)
                          G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |fact| (CAR #14#) . #21#) NIL))
                            (GO G191)))
                          (SEQ (LETT |ffactor| (QVELT |fact| 1) . #21#)
                               (LETT |ffexp| (QVELT |fact| 2) . #21#)
                               (LETT |lvar| (SPADCALL |ffactor| (QREFELT $ 25))
                                     . #21#)
                               (LETT |x| (|SPADfirst| |lvar|) . #21#)
                               (LETT |ldeg|
                                     (SPADCALL |ffactor| |lvar|
                                               (QREFELT $ 152))
                                     . #21#)
                               (EXIT
                                (COND
                                 ((SPADCALL 1 |ldeg| (QREFELT $ 154))
                                  (SEQ
                                   (LETT |x|
                                         (SPADCALL |lvar|
                                                   (SPADCALL 1 |ldeg|
                                                             (QREFELT $ 86))
                                                   (QREFELT $ 87))
                                         . #21#)
                                   (LETT |lcont|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |ffactor| |x|
                                                     (QREFELT $ 84))
                                           (QREFELT $ 23))
                                          (QREFELT $ 155))
                                         . #21#)
                                   (LETT |ffactor|
                                         (PROG2
                                             (LETT #12#
                                                   (SPADCALL |ffactor| |lcont|
                                                             (QREFELT $ 119))
                                                   . #21#)
                                             (QCDR #12#)
                                           (|check_union2| (QEQCAR #12# 0)
                                                           (QREFELT $ 9)
                                                           (|Union|
                                                            (QREFELT $ 9)
                                                            #22="failed")
                                                           #12#))
                                         . #21#)
                                   (LETT |factorlist|
                                         (CONS (CONS |ffactor| |ffexp|)
                                               |factorlist|)
                                         . #21#)
                                   (EXIT
                                    (SEQ (LETT |lcterm| NIL . #21#)
                                         (LETT #11#
                                               (QCDR
                                                (|INNMFACT;mFactor| |lcont|
                                                 |ufactor| $))
                                               . #21#)
                                         G190
                                         (COND
                                          ((OR (ATOM #11#)
                                               (PROGN
                                                (LETT |lcterm| (CAR #11#)
                                                      . #21#)
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
                                                 . #21#)))
                                         (LETT #11# (CDR #11#) . #21#)
                                         (GO G190) G191 (EXIT NIL)))))
                                 ('T
                                  (SEQ
                                   (LETT |varch|
                                         (|INNMFACT;varChoose| |ffactor| |lvar|
                                          |ldeg| $)
                                         . #21#)
                                   (LETT |um| (QVELT |varch| 0) . #21#)
                                   (LETT |x| (|SPADfirst| |lvar|) . #21#)
                                   (LETT |ldeg| (CDR |ldeg|) . #21#)
                                   (LETT |lvar| (CDR |lvar|) . #21#)
                                   (COND
                                    ((SPADCALL (|SPADfirst| (QVELT |varch| 1))
                                               |x| (QREFELT $ 156))
                                     (SEQ
                                      (LETT |lvar| (QVELT |varch| 1) . #21#)
                                      (LETT |x| (|SPADfirst| |lvar|) . #21#)
                                      (EXIT
                                       (LETT |lvar| (CDR |lvar|) . #21#)))))
                                   (LETT |pc|
                                         (SPADCALL
                                          (SPADCALL |um| (QREFELT $ 23))
                                          (QREFELT $ 155))
                                         . #21#)
                                   (COND
                                    ((SPADCALL |pc| (|spadConstant| $ 49)
                                               (QREFELT $ 157))
                                     (SEQ
                                      (LETT |um|
                                            (PROG2
                                                (LETT #10#
                                                      (SPADCALL |um| |pc|
                                                                (QREFELT $
                                                                         158))
                                                      . #21#)
                                                (QCDR #10#)
                                              (|check_union2| (QEQCAR #10# 0)
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 9))
                                                              (|Union|
                                                               (|SparseUnivariatePolynomial|
                                                                (QREFELT $ 9))
                                                               "failed")
                                                              #10#))
                                            . #21#)
                                      (LETT |ffactor|
                                            (SPADCALL |um| |x| (QREFELT $ 159))
                                            . #21#)
                                      (EXIT
                                       (SEQ (LETT |lcterm| NIL . #21#)
                                            (LETT #9#
                                                  (QCDR
                                                   (|INNMFACT;mFactor| |pc|
                                                    |ufactor| $))
                                                  . #21#)
                                            G190
                                            (COND
                                             ((OR (ATOM #9#)
                                                  (PROGN
                                                   (LETT |lcterm| (CAR #9#)
                                                         . #21#)
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
                                                    . #21#)))
                                            (LETT #9# (CDR #9#) . #21#)
                                            (GO G190) G191 (EXIT NIL))))))
                                   (LETT |ldeg|
                                         (SPADCALL |ffactor| |lvar|
                                                   (QREFELT $ 152))
                                         . #21#)
                                   (LETT |um| (SPADCALL |um| (QREFELT $ 160))
                                         . #21#)
                                   (COND
                                    ((SPADCALL (SPADCALL |um| (QREFELT $ 69))
                                               (QREFELT $ 70))
                                     (LETT |lf|
                                           (|INNMFACT;mfconst| |um| |lvar|
                                            |ldeg| |ufactor| $)
                                           . #21#))
                                    ('T
                                     (LETT |lf|
                                           (|INNMFACT;mfpol| |um| |lvar| |ldeg|
                                            |ufactor| $)
                                           . #21#)))
                                   (LETT |auxfl|
                                         (PROGN
                                          (LETT #8# NIL . #21#)
                                          (SEQ (LETT |lfp| NIL . #21#)
                                               (LETT #7# |lf| . #21#) G190
                                               (COND
                                                ((OR (ATOM #7#)
                                                     (PROGN
                                                      (LETT |lfp| (CAR #7#)
                                                            . #21#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #8#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL
                                                          (SPADCALL |lfp| |x|
                                                                    (QREFELT $
                                                                             159))
                                                          (QREFELT $ 161))
                                                         |ffexp|)
                                                        #8#)
                                                       . #21#)))
                                               (LETT #7# (CDR #7#) . #21#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #8#))))
                                         . #21#)
                                   (EXIT
                                    (LETT |factorlist|
                                          (SPADCALL |factorlist| |auxfl|
                                                    (QREFELT $ 122))
                                          . #21#)))))))
                          (LETT #14# (CDR #14#) . #21#) (GO G190) G191
                          (EXIT NIL))
                     (LETT |lcfacs|
                           (PROGN
                            (LETT #2# NIL . #21#)
                            (SEQ (LETT |f| NIL . #21#)
                                 (LETT #5# |factorlist| . #21#) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |f| (CAR #5#) . #21#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (SPADCALL
                                           (SPADCALL (QCAR |f|) (QREFELT $ 71))
                                           (QCDR |f|) (QREFELT $ 72))
                                          . #21#)
                                    (COND
                                     (#2#
                                      (LETT #3#
                                            (SPADCALL #3# #4# (QREFELT $ 73))
                                            . #21#))
                                     ('T
                                      (PROGN
                                       (LETT #3# #4# . #21#)
                                       (LETT #2# 'T . #21#)))))))
                                 (LETT #5# (CDR #5#) . #21#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#2# #3#) (#20# (|spadConstant| $ 48))))
                           . #21#)
                     (EXIT
                      (CONS
                       (PROG2
                           (LETT #1#
                                 (SPADCALL (SPADCALL |m| (QREFELT $ 71))
                                           |lcfacs| (QREFELT $ 76))
                                 . #21#)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 8)
                                         (|Union| (QREFELT $ 8) #22#) #1#))
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
         (SEQ
          (LETT |flist| (|INNMFACT;mFactor| |m| |ufactor| $)
                . #6=(|INNMFACT;factor;PMF;15|))
          (EXIT
           (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 39))
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
                                              (QREFELT $ 162))
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 163))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL))
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
    (LETT $ (GETREFV 167) . #1#)
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
