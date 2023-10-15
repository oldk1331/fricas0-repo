
(SDEFUN |PFBR;gen_solv|
        ((|fl| |List| (|SparseUnivariatePolynomial| R))
         ($ |Mapping|
          (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed")
          (|SparseUnivariatePolynomial| R)))
        (SPROG NIL (CONS #'|PFBR;gen_solv!0| (VECTOR $ |fl|)))) 

(SDEFUN |PFBR;gen_solv!0| ((|pr| NIL) ($$ NIL))
        (PROG (|fl| $)
          (LETT |fl| (QREFELT $$ 1) . #1=(|PFBR;gen_solv|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |fl| |pr| (QREFELT $ 13)))))) 

(SDEFUN |PFBR;randomR;R;2| (($ R)) (SPADCALL (QREFELT $ 14))) 

(SDEFUN |PFBR;randomR;R;3| (($ R)) (SPADCALL (|random|) (QREFELT $ 17))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;4|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S) (|v| |VarSet|)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((#1=#:G147 NIL) (|w| NIL) (#2=#:G146 NIL)
          (|ans|
           (|Union|
            (|List|
             (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| R)))
            "failed"))
          (|ppR|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| R)))
          (|lpolysR|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| R))))
          (#3=#:G145 NIL) (|u| NIL) (#4=#:G144 NIL))
         (SEQ
          (LETT |lpolysR|
                (PROGN
                 (LETT #4# NIL . #5=(|PFBR;bivariateSLPEBR;LSupVarSetU;4|))
                 (SEQ (LETT |u| NIL . #5#) (LETT #3# |lpolys| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS (SPADCALL (ELT $ 19) |u| (QREFELT $ 24))
                                    #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |ppR| (SPADCALL (ELT $ 19) |pp| (QREFELT $ 24)) . #5#)
          (LETT |ans| (SPADCALL |lpolysR| |ppR| (QREFELT $ 25)) . #5#)
          (EXIT
           (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL . #5#)
                         (SEQ (LETT |w| NIL . #5#)
                              (LETT #1# (QCDR |ans|) . #5#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |w| (CAR #1#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL
                                        (CONS
                                         #'|PFBR;bivariateSLPEBR;LSupVarSetU;4!0|
                                         (VECTOR $ |v|))
                                        |w| (QREFELT $ 30))
                                       #2#)
                                      . #5#)))
                              (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;4!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;bivariateSLPEBR;LSupVarSetU;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 27)))))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;5|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S) (|v| |VarSet|)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPADCALL |lpolys| |pp| (QREFELT $ 35))) 

(SDEFUN |PFBR;chooseFSQViableSubstitutions|
        ((|lvpp| |List| |VarSet|) (|pp| |SparseUnivariatePolynomial| S)
         ($ |Record| (|:| |substnsField| (|List| R))
          (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
        (SPROG
         ((#1=#:G162 NIL) (|ppR| (|SparseUnivariatePolynomial| R))
          (|substns| (|List| R)) (#2=#:G164 NIL) (|v| NIL) (#3=#:G163 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ G190 (COND ((NULL 'T) (GO G191)))
                 (SEQ
                  (LETT |substns|
                        (PROGN
                         (LETT #3# NIL
                               . #4=(|PFBR;chooseFSQViableSubstitutions|))
                         (SEQ (LETT |v| NIL . #4#) (LETT #2# |lvpp| . #4#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |v| (CAR #2#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3# (CONS (SPADCALL (QREFELT $ 15)) #3#)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL (SPADCALL |pp| (QREFELT $ 36)) |lvpp| |substns|
                                (QREFELT $ 39))
                      (QREFELT $ 41))
                     "next")
                    ('T
                     (SEQ
                      (LETT |ppR|
                            (SPADCALL
                             (CONS #'|PFBR;chooseFSQViableSubstitutions!0|
                                   (VECTOR $ |substns| |lvpp|))
                             |pp| (QREFELT $ 45))
                            . #4#)
                      (EXIT
                       (COND
                        ((OR
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |ppR| (SPADCALL |ppR| (QREFELT $ 46))
                                      (QREFELT $ 47))
                            (QREFELT $ 49))
                           0 (QREFELT $ 51))
                          (NULL
                           (SPADCALL (SPADCALL |ppR| (QREFELT $ 52))
                                     (QREFELT $ 53))))
                         "next")
                        ('T
                         (PROGN
                          (LETT #1# |$NoValue| . #4#)
                          (GO #5=#:G159))))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #1#))
          (EXIT (CONS |substns| |ppR|))))) 

(SDEFUN |PFBR;chooseFSQViableSubstitutions!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpp| |substns| $)
          (LETT |lvpp| (QREFELT $$ 2)
                . #1=(|PFBR;chooseFSQViableSubstitutions|))
          (LETT |substns| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpp| |substns| (QREFELT $ 39))
                      (QREFELT $ 42)))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions|
        ((|lvpolys| |List| |VarSet|)
         (|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Record| (|:| |substnsField| (|List| R))
          (|:| |lpolysRField| (|List| (|SparseUnivariatePolynomial| R)))
          (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
        (SPROG
         ((|ppR| (|SparseUnivariatePolynomial| R)) (#1=#:G187 NIL)
          (|uu| #2=(|List| (|SparseUnivariatePolynomial| R))) (#3=#:G186 NIL)
          (#4=#:G174 NIL) (#5=#:G173 #6=(|Boolean|)) (#7=#:G175 #6#)
          (#8=#:G193 NIL) (|v| NIL) (|lpolysR| #2#) (#9=#:G192 NIL) (|u| NIL)
          (#10=#:G191 NIL) (#11=#:G168 NIL) (#12=#:G167 #13=(|Boolean|))
          (#14=#:G169 #13#) (#15=#:G190 NIL) (|substns| (|List| R))
          (#16=#:G189 NIL) (#17=#:G188 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ G190 (COND ((NULL 'T) (GO G191)))
                 (SEQ
                  (LETT |substns|
                        (PROGN
                         (LETT #17# NIL
                               . #18=(|PFBR;chooseSLPEViableSubstitutions|))
                         (SEQ (LETT |v| NIL . #18#)
                              (LETT #16# |lvpolys| . #18#) G190
                              (COND
                               ((OR (ATOM #16#)
                                    (PROGN (LETT |v| (CAR #16#) . #18#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #17#
                                      (CONS (SPADCALL (QREFELT $ 15)) #17#)
                                      . #18#)))
                              (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                              (EXIT (NREVERSE #17#))))
                        . #18#)
                  (EXIT
                   (COND
                    ((OR
                      (SPADCALL
                       (SPADCALL (SPADCALL |pp| (QREFELT $ 36)) |lvpolys|
                                 |substns| (QREFELT $ 39))
                       (QREFELT $ 41))
                      (PROGN
                       (LETT #11# NIL . #18#)
                       (SEQ (LETT |u| NIL . #18#) (LETT #15# |lpolys| . #18#)
                            G190
                            (COND
                             ((OR (ATOM #15#)
                                  (PROGN (LETT |u| (CAR #15#) . #18#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #14#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |u| (QREFELT $ 36))
                                                |lvpolys| |substns|
                                                (QREFELT $ 39))
                                      (QREFELT $ 41))
                                     . #18#)
                               (COND
                                (#11#
                                 (LETT #12# (COND (#12# 'T) ('T #14#)) . #18#))
                                ('T
                                 (PROGN
                                  (LETT #12# #14# . #18#)
                                  (LETT #11# 'T . #18#)))))))
                            (LETT #15# (CDR #15#) . #18#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#11# #12#) ('T 'NIL))))
                     "next")
                    ('T
                     (SEQ
                      (LETT |lpolysR|
                            (PROGN
                             (LETT #10# NIL . #18#)
                             (SEQ (LETT |u| NIL . #18#)
                                  (LETT #9# |lpolys| . #18#) G190
                                  (COND
                                   ((OR (ATOM #9#)
                                        (PROGN
                                         (LETT |u| (CAR #9#) . #18#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #10#
                                          (CONS
                                           (SPADCALL
                                            (CONS
                                             #'|PFBR;chooseSLPEViableSubstitutions!0|
                                             (VECTOR $ |substns| |lvpolys|))
                                            |u| (QREFELT $ 45))
                                           #10#)
                                          . #18#)))
                                  (LETT #9# (CDR #9#) . #18#) (GO G190) G191
                                  (EXIT (NREVERSE #10#))))
                            . #18#)
                      (LETT |uu| |lpolysR| . #18#)
                      (SEQ
                       (EXIT
                        (SEQ G190
                             (COND
                              ((NULL (COND ((NULL |uu|) 'NIL) ('T 'T)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((PROGN
                                  (LETT #4# NIL . #18#)
                                  (SEQ (LETT |v| NIL . #18#)
                                       (LETT #8# (CDR |uu|) . #18#) G190
                                       (COND
                                        ((OR (ATOM #8#)
                                             (PROGN
                                              (LETT |v| (CAR #8#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (PROGN
                                          (LETT #7#
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL (|SPADfirst| |uu|)
                                                            |v| (QREFELT $ 47))
                                                  (QREFELT $ 49))
                                                 0 (QREFELT $ 51))
                                                . #18#)
                                          (COND
                                           (#4#
                                            (LETT #5# (COND (#5# 'T) ('T #7#))
                                                  . #18#))
                                           ('T
                                            (PROGN
                                             (LETT #5# #7# . #18#)
                                             (LETT #4# 'T . #18#)))))))
                                       (LETT #8# (CDR #8#) . #18#) (GO G190)
                                       G191 (EXIT NIL))
                                  (COND (#4# #5#) ('T 'NIL)))
                                 (PROGN
                                  (LETT #3# |$NoValue| . #18#)
                                  (GO #19=#:G177)))
                                ('T (LETT |uu| (CDR |uu|) . #18#)))))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #19# (EXIT #3#))
                      (COND ((NULL (NULL |uu|)) (EXIT "next")))
                      (EXIT
                       (PROGN
                        (LETT #1# |$NoValue| . #18#)
                        (GO #20=#:G182))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #20# (EXIT #1#))
          (LETT |ppR|
                (SPADCALL
                 (CONS #'|PFBR;chooseSLPEViableSubstitutions!1|
                       (VECTOR $ |substns| |lvpolys|))
                 |pp| (QREFELT $ 45))
                . #18#)
          (EXIT (VECTOR |substns| |lpolysR| |ppR|))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions!1| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpolys| |substns| $)
          (LETT |lvpolys| (QREFELT $$ 2)
                . #1=(|PFBR;chooseSLPEViableSubstitutions|))
          (LETT |substns| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 39))
                      (QREFELT $ 42)))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpolys| |substns| $)
          (LETT |lvpolys| (QREFELT $$ 2)
                . #1=(|PFBR;chooseSLPEViableSubstitutions|))
          (LETT |substns| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 39))
                      (QREFELT $ 42)))))) 

(SDEFUN |PFBR;raise|
        ((|supR| |SparseUnivariatePolynomial| R)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL (ELT $ 54) |supR| (QREFELT $ 57))) 

(SDEFUN |PFBR;lower|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| R))
        (SPADCALL (ELT $ 42) |pp| (QREFELT $ 45))) 

(SDEFUN |PFBR;SLPEBR|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|lvpolys| . #1=(|List| |VarSet|))
         (|pp| |SparseUnivariatePolynomial| S) (|lvpp| . #1#)
         ($ . #2=(|Union| (|List| (|SparseUnivariatePolynomial| S)) "failed")))
        (SPROG
         ((|ansR| (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
          (|cVS|
           (|Record| (|:| |substnsField| (|List| R))
                     (|:| |lpolysRField|
                          (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
          (#3=#:G236 NIL) (|uu| NIL) (#4=#:G235 NIL) (#5=#:G224 NIL)
          (|ppR| (|SparseUnivariatePolynomial| R))
          (|lpolysR| (|List| (|SparseUnivariatePolynomial| R))) (#6=#:G234 NIL)
          (|u| NIL) (#7=#:G233 NIL) (#8=#:G232 NIL)
          (|pp1|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| S)))
          (#9=#:G231 NIL)
          (|ans|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| S))))
          (#10=#:G229 NIL) (|a| NIL) (#11=#:G230 NIL) (|a1| NIL)
          (#12=#:G228 NIL) (|d| (|NonNegativeInteger|)) (|ans1| #2#)
          (#13=#:G227 NIL) (|m| (|List| |VarSet|)) (#14=#:G226 NIL)
          (#15=#:G225 NIL) (|v| (|VarSet|)))
         (SEQ
          (EXIT
           (COND
            ((NULL
              (NULL
               (LETT |m| (SPADCALL |lvpp| |lvpolys| (QREFELT $ 58))
                     . #16=(|PFBR;SLPEBR|))))
             (SEQ (LETT |v| (|SPADfirst| |m|) . #16#)
                  (LETT |lvpp| (SPADCALL |v| |lvpp| (QREFELT $ 59)) . #16#)
                  (LETT |pp1|
                        (SPADCALL
                         (SPADCALL (CONS #'|PFBR;SLPEBR!0| (VECTOR $ |v|)) |pp|
                                   (QREFELT $ 64))
                         (QREFELT $ 66))
                        . #16#)
                  (LETT |ans|
                        (PROGN
                         (LETT #15# NIL . #16#)
                         (SEQ (LETT |u| NIL . #16#) (LETT #14# |lpolys| . #16#)
                              G190
                              (COND
                               ((OR (ATOM #14#)
                                    (PROGN (LETT |u| (CAR #14#) . #16#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #15# (CONS (|spadConstant| $ 67) #15#)
                                      . #16#)))
                              (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                              (EXIT (NREVERSE #15#))))
                        . #16#)
                  (SEQ (LETT |m| NIL . #16#)
                       (LETT #13# (NREVERSE (SPADCALL |pp1| (QREFELT $ 69)))
                             . #16#)
                       G190
                       (COND
                        ((OR (ATOM #13#)
                             (PROGN (LETT |m| (CAR #13#) . #16#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ans1|
                              (|PFBR;SLPEBR| |lpolys| |lvpolys|
                               (SPADCALL |m| (QREFELT $ 70)) |lvpp| $)
                              . #16#)
                        (EXIT
                         (COND
                          ((QEQCAR |ans1| 1)
                           (PROGN
                            (LETT #5# (CONS 1 "failed") . #16#)
                            (GO #17=#:G223)))
                          ('T
                           (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 71)) . #16#)
                                (EXIT
                                 (LETT |ans|
                                       (PROGN
                                        (LETT #12# NIL . #16#)
                                        (SEQ (LETT |a1| NIL . #16#)
                                             (LETT #11# (QCDR |ans1|) . #16#)
                                             (LETT |a| NIL . #16#)
                                             (LETT #10# |ans| . #16#) G190
                                             (COND
                                              ((OR (ATOM #10#)
                                                   (PROGN
                                                    (LETT |a| (CAR #10#)
                                                          . #16#)
                                                    NIL)
                                                   (ATOM #11#)
                                                   (PROGN
                                                    (LETT |a1| (CAR #11#)
                                                          . #16#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #12#
                                                     (CONS
                                                      (SPADCALL
                                                       (SPADCALL |a1| |d|
                                                                 (QREFELT $
                                                                          72))
                                                       |a| (QREFELT $ 73))
                                                      #12#)
                                                     . #16#)))
                                             (LETT #10#
                                                   (PROG1 (CDR #10#)
                                                     (LETT #11# (CDR #11#)
                                                           . #16#))
                                                   . #16#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #12#))))
                                       . #16#)))))))
                       (LETT #13# (CDR #13#) . #16#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS 0
                         (PROGN
                          (LETT #9# NIL . #16#)
                          (SEQ (LETT |pp1| NIL . #16#) (LETT #8# |ans| . #16#)
                               G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |pp1| (CAR #8#) . #16#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #9#
                                       (CONS
                                        (SPADCALL
                                         (CONS #'|PFBR;SLPEBR!1|
                                               (VECTOR $ |v|))
                                         (SPADCALL |pp1| (QREFELT $ 66))
                                         (QREFELT $ 76))
                                        #9#)
                                       . #16#)))
                               (LETT #8# (CDR #8#) . #16#) (GO G190) G191
                               (EXIT (NREVERSE #9#))))))))
            ('T
             (COND
              ((NULL |lvpolys|)
               (SEQ
                (LETT |lpolysR|
                      (PROGN
                       (LETT #7# NIL . #16#)
                       (SEQ (LETT |u| NIL . #16#) (LETT #6# |lpolys| . #16#)
                            G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |u| (CAR #6#) . #16#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #7#
                                    (CONS
                                     (SPADCALL (ELT $ 42) |u| (QREFELT $ 45))
                                     #7#)
                                    . #16#)))
                            (LETT #6# (CDR #6#) . #16#) (GO G190) G191
                            (EXIT (NREVERSE #7#))))
                      . #16#)
                (LETT |ppR| (SPADCALL (ELT $ 42) |pp| (QREFELT $ 45)) . #16#)
                (LETT |ansR| (SPADCALL |lpolysR| |ppR| (QREFELT $ 13)) . #16#)
                (EXIT
                 (COND
                  ((QEQCAR |ansR| 1)
                   (PROGN (LETT #5# (CONS 1 "failed") . #16#) (GO #17#)))
                  (#18='T
                   (CONS 0
                         (PROGN
                          (LETT #4# NIL . #16#)
                          (SEQ (LETT |uu| NIL . #16#)
                               (LETT #3# (QCDR |ansR|) . #16#) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |uu| (CAR #3#) . #16#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (SPADCALL (ELT $ 54) |uu|
                                                  (QREFELT $ 57))
                                        #4#)
                                       . #16#)))
                               (LETT #3# (CDR #3#) . #16#) (GO G190) G191
                               (EXIT (NREVERSE #4#))))))))))
              (#18#
               (SEQ
                (LETT |cVS|
                      (|PFBR;chooseSLPEViableSubstitutions| |lvpolys| |lpolys|
                       |pp| $)
                      . #16#)
                (LETT |ansR|
                      (SPADCALL (QVELT |cVS| 1) (QVELT |cVS| 2) (QREFELT $ 13))
                      . #16#)
                (EXIT
                 (COND ((QEQCAR |ansR| 1) (CONS 1 "failed"))
                       ((EQL (LENGTH |lvpolys|) 1)
                        (SPADCALL |lpolys| |pp| (|SPADfirst| |lvpolys|)
                                  (QREFELT $ 33)))
                       (#18# (SPADCALL |lpolys| |pp| (QREFELT $ 35)))))))))))
          #17# (EXIT #5#)))) 

(SDEFUN |PFBR;SLPEBR!1| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;SLPEBR|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 26)))))) 

(SDEFUN |PFBR;SLPEBR!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;SLPEBR|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 60)))))) 

(SDEFUN |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;11|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((|lvpp| #1=(|List| |VarSet|)) (#2=#:G250 NIL) (|z| NIL)
          (#3=#:G249 NIL) (|lvpolys| #1#) (#4=#:G248 NIL) (#5=#:G247 NIL)
          (#6=#:G246 NIL) (|u| NIL) (#7=#:G245 NIL) (#8=#:G244 NIL)
          (#9=#:G243 NIL))
         (SEQ
          (COND
           ((SPADCALL |pp| (|spadConstant| $ 78) (QREFELT $ 79))
            (CONS 0
                  (PROGN
                   (LETT #9# NIL
                         . #10=(|PFBR;solveLinearPolynomialEquationByRecursion;LSupU;11|))
                   (SEQ (LETT |u| NIL . #10#) (LETT #8# |lpolys| . #10#) G190
                        (COND
                         ((OR (ATOM #8#)
                              (PROGN (LETT |u| (CAR #8#) . #10#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #9# (CONS (|spadConstant| $ 78) #9#) . #10#)))
                        (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                        (EXIT (NREVERSE #9#))))))
           ('T
            (SEQ
             (LETT |lvpolys|
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #7# NIL . #10#)
                      (SEQ (LETT |u| NIL . #10#) (LETT #6# |lpolys| . #10#)
                           G190
                           (COND
                            ((OR (ATOM #6#)
                                 (PROGN (LETT |u| (CAR #6#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #7#
                                   (CONS
                                    (SPADCALL
                                     (PROGN
                                      (LETT #5# NIL . #10#)
                                      (SEQ (LETT |z| NIL . #10#)
                                           (LETT #4#
                                                 (SPADCALL |u| (QREFELT $ 81))
                                                 . #10#)
                                           G190
                                           (COND
                                            ((OR (ATOM #4#)
                                                 (PROGN
                                                  (LETT |z| (CAR #4#) . #10#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #5#
                                                   (CONS
                                                    (SPADCALL |z|
                                                              (QREFELT $ 82))
                                                    #5#)
                                                   . #10#)))
                                           (LETT #4# (CDR #4#) . #10#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #5#))))
                                     (QREFELT $ 83))
                                    #7#)
                                   . #10#)))
                           (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                           (EXIT (NREVERSE #7#))))
                     (QREFELT $ 83))
                    (QREFELT $ 84))
                   . #10#)
             (LETT |lvpp|
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #3# NIL . #10#)
                      (SEQ (LETT |z| NIL . #10#)
                           (LETT #2# (SPADCALL |pp| (QREFELT $ 81)) . #10#)
                           G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |z| (CAR #2#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3# (CONS (SPADCALL |z| (QREFELT $ 82)) #3#)
                                   . #10#)))
                           (LETT #2# (CDR #2#) . #10#) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (QREFELT $ 83))
                    (QREFELT $ 84))
                   . #10#)
             (EXIT (|PFBR;SLPEBR| |lpolys| |lvpolys| |pp| |lvpp| $)))))))) 

(SDEFUN |PFBR;factorByRecursion;SupF;12|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G255 NIL) (|c| (S)) (|lv| (|List| |VarSet|)) (#2=#:G263 NIL)
          (|z| NIL) (#3=#:G262 NIL))
         (SEQ
          (LETT |lv|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL . #4=(|PFBR;factorByRecursion;SupF;12|))
                   (SEQ (LETT |z| NIL . #4#)
                        (LETT #2# (SPADCALL |pp| (QREFELT $ 81)) . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |z| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3# (CONS (SPADCALL |z| (QREFELT $ 82)) #3#)
                                . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 83))
                 (QREFELT $ 84))
                . #4#)
          (EXIT
           (COND
            ((NULL |lv|)
             (SPADCALL (CONS (|function| |PFBR;raise|) $)
                       (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 87))
                       (QREFELT $ 92)))
            (#5='T
             (SEQ (LETT |c| (SPADCALL |pp| (QREFELT $ 93)) . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL |c| (QREFELT $ 94))
                     (SPADCALL (SPADCALL |pp| (QREFELT $ 96)) (ELT $ 97)
                               (QREFELT $ 100)))
                    (#5#
                     (SEQ
                      (LETT |pp|
                            (PROG2
                                (LETT #1# (SPADCALL |pp| |c| (QREFELT $ 102))
                                      . #4#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 9))
                                               "failed")
                                              #1#))
                            . #4#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |pp| (QREFELT $ 96)) (ELT $ 97)
                                  (QREFELT $ 100))
                        (SPADCALL (ELT $ 103) (SPADCALL |c| (QREFELT $ 104))
                                  (QREFELT $ 107))
                        (QREFELT $ 108)))))))))))))) 

(SDEFUN |PFBR;factorSquareFreeByRecursion;SupF;13|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G307 NIL) (#2=#:G322 NIL) (|w| NIL) (#3=#:G321 NIL)
          (#4=#:G294 NIL) (|factors| (|List| (|SparseUnivariatePolynomial| S)))
          (#5=#:G271 NIL) (|lcppPow| (S)) (|lc| (S)) (#6=#:G320 NIL)
          (#7=#:G319 NIL)
          (|flu| (|Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
          (|llc| (|List| S)) (#8=#:G318 NIL) (|f1| NIL) (#9=#:G317 NIL)
          (|ppAdjust| (|SparseUnivariatePolynomial| S))
          (|fl2| (|List| (|SparseUnivariatePolynomial| R))) (#10=#:G284 NIL)
          (#11=#:G316 NIL) (#12=#:G315 NIL) (|lcppR| (R))
          (|fl1| (|List| (|SparseUnivariatePolynomial| R))) (#13=#:G314 NIL)
          (|u| NIL) (#14=#:G313 NIL) (|nfact| (|NonNegativeInteger|))
          (|factorsR| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|newppR| (|SparseUnivariatePolynomial| R))
          (|cVS|
           (|Record| (|:| |substnsField| (|List| R))
                     (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
          (|oldnfact| (|NonNegativeInteger|)) (|lcpp| (S)) (|lcu| (S))
          (|v_degs| (|List| (|NonNegativeInteger|))) (#15=#:G266 NIL)
          (#16=#:G265 #17=(|NonNegativeInteger|)) (#18=#:G267 #17#)
          (#19=#:G312 NIL) (|z| NIL) (#20=#:G311 NIL) (|v| NIL)
          (#21=#:G310 NIL) (|lv| (|List| |VarSet|)) (#22=#:G309 NIL)
          (#23=#:G308 NIL) (|cpp| (|List| S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cpp| (SPADCALL |pp| (QREFELT $ 81))
                  . #24=(|PFBR;factorSquareFreeByRecursion;SupF;13|))
            (LETT |lv|
                  (SPADCALL
                   (SPADCALL
                    (PROGN
                     (LETT #23# NIL . #24#)
                     (SEQ (LETT |z| NIL . #24#) (LETT #22# |cpp| . #24#) G190
                          (COND
                           ((OR (ATOM #22#)
                                (PROGN (LETT |z| (CAR #22#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #23#
                                  (CONS (SPADCALL |z| (QREFELT $ 82)) #23#)
                                  . #24#)))
                          (LETT #22# (CDR #22#) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #23#))))
                    (QREFELT $ 83))
                   (QREFELT $ 84))
                  . #24#)
            (LETT |v_degs|
                  (PROGN
                   (LETT #21# NIL . #24#)
                   (SEQ (LETT |v| NIL . #24#) (LETT #20# |lv| . #24#) G190
                        (COND
                         ((OR (ATOM #20#)
                              (PROGN (LETT |v| (CAR #20#) . #24#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #21#
                                (CONS
                                 (PROGN
                                  (LETT #15# NIL . #24#)
                                  (SEQ (LETT |z| NIL . #24#)
                                       (LETT #19# |cpp| . #24#) G190
                                       (COND
                                        ((OR (ATOM #19#)
                                             (PROGN
                                              (LETT |z| (CAR #19#) . #24#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (PROGN
                                          (LETT #18#
                                                (SPADCALL |z| |v|
                                                          (QREFELT $ 110))
                                                . #24#)
                                          (COND
                                           (#15#
                                            (LETT #16# (MAX #16# #18#) . #24#))
                                           ('T
                                            (PROGN
                                             (LETT #16# #18# . #24#)
                                             (LETT #15# 'T . #24#)))))))
                                       (LETT #19# (CDR #19#) . #24#) (GO G190)
                                       G191 (EXIT NIL))
                                  (COND (#15# #16#)
                                        ('T (|IdentityError| '|max|))))
                                 #21#)
                                . #24#)))
                        (LETT #20# (CDR #20#) . #24#) (GO G190) G191
                        (EXIT (NREVERSE #21#))))
                  . #24#)
            (EXIT
             (COND
              ((NULL |lv|)
               (SPADCALL (CONS (|function| |PFBR;raise|) $)
                         (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 87))
                         (QREFELT $ 92)))
              ('T
               (SEQ (LETT |lcu| (|spadConstant| $ 111) . #24#)
                    (COND
                     ((SPADCALL
                       (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 36)) . #24#)
                       (QREFELT $ 94))
                      (SEQ (LETT |lcu| |lcpp| . #24#)
                           (LETT |pp|
                                 (PROG2
                                     (LETT #5#
                                           (SPADCALL |pp| |lcu|
                                                     (QREFELT $ 102))
                                           . #24#)
                                     (QCDR #5#)
                                   (|check_union2| (QEQCAR #5# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 9))
                                                    #25="failed")
                                                   #5#))
                                 . #24#)
                           (EXIT
                            (LETT |lcpp| (|spadConstant| $ 111) . #24#)))))
                    (LETT |oldnfact| (+ (SPADCALL |pp| (QREFELT $ 112)) 1)
                          . #24#)
                    (EXIT
                     (SEQ G190 (COND ((NULL 'T) (GO G191)))
                          (SEQ
                           (LETT |cVS|
                                 (|PFBR;chooseFSQViableSubstitutions| |lv| |pp|
                                  $)
                                 . #24#)
                           (LETT |newppR|
                                 (SPADCALL (QCDR |cVS|) (QREFELT $ 113))
                                 . #24#)
                           (LETT |factorsR| (SPADCALL |newppR| (QREFELT $ 114))
                                 . #24#)
                           (LETT |nfact| (SPADCALL |factorsR| (QREFELT $ 115))
                                 . #24#)
                           (EXIT
                            (COND
                             ((EQL |nfact| 1)
                              (PROGN
                               (LETT #1#
                                     (SPADCALL (SPADCALL |lcu| (QREFELT $ 103))
                                               (LIST
                                                (VECTOR (CONS 2 "irred") |pp|
                                                        1))
                                               (QREFELT $ 120))
                                     . #24#)
                               (GO #26=#:G306)))
                             ((SPADCALL |nfact| |oldnfact| (QREFELT $ 51))
                              "next")
                             ('T
                              (SEQ
                               (LETT |fl1|
                                     (PROGN
                                      (LETT #14# NIL . #24#)
                                      (SEQ (LETT |u| NIL . #24#)
                                           (LETT #13#
                                                 (SPADCALL |factorsR|
                                                           (QREFELT $ 123))
                                                 . #24#)
                                           G190
                                           (COND
                                            ((OR (ATOM #13#)
                                                 (PROGN
                                                  (LETT |u| (CAR #13#) . #24#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #14#
                                                   (CONS (QVELT |u| 1) #14#)
                                                   . #24#)))
                                           (LETT #13# (CDR #13#) . #24#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #14#))))
                                     . #24#)
                               (LETT |lcppR|
                                     (SPADCALL (QCDR |cVS|) (QREFELT $ 124))
                                     . #24#)
                               (LETT |fl2|
                                     (PROGN
                                      (LETT #12# NIL . #24#)
                                      (SEQ (LETT |f1| NIL . #24#)
                                           (LETT #11# |fl1| . #24#) G190
                                           (COND
                                            ((OR (ATOM #11#)
                                                 (PROGN
                                                  (LETT |f1| (CAR #11#) . #24#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #12#
                                                   (CONS
                                                    (SPADCALL
                                                     (PROG2
                                                         (LETT #10#
                                                               (SPADCALL
                                                                |lcppR|
                                                                (SPADCALL |f1|
                                                                          (QREFELT
                                                                           $
                                                                           124))
                                                                (QREFELT $
                                                                         125))
                                                               . #24#)
                                                         (QCDR #10#)
                                                       (|check_union2|
                                                        (QEQCAR #10# 0)
                                                        (QREFELT $ 6)
                                                        (|Union| (QREFELT $ 6)
                                                                 #27="failed")
                                                        #10#))
                                                     |f1| (QREFELT $ 126))
                                                    #12#)
                                                   . #24#)))
                                           (LETT #11# (CDR #11#) . #24#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #12#))))
                                     . #24#)
                               (LETT |ppAdjust|
                                     (SPADCALL
                                      (LETT |lcppPow|
                                            (SPADCALL |lcpp|
                                                      (LENGTH (CDR |fl2|))
                                                      (QREFELT $ 127))
                                            . #24#)
                                      |pp| (QREFELT $ 128))
                                     . #24#)
                               (LETT |llc|
                                     (PROGN
                                      (LETT #9# NIL . #24#)
                                      (SEQ (LETT |f1| NIL . #24#)
                                           (LETT #8# |fl2| . #24#) G190
                                           (COND
                                            ((OR (ATOM #8#)
                                                 (PROGN
                                                  (LETT |f1| (CAR #8#) . #24#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #9# (CONS |lcpp| #9#)
                                                   . #24#)))
                                           (LETT #8# (CDR #8#) . #24#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #9#))))
                                     . #24#)
                               (LETT |flu|
                                     (SPADCALL |ppAdjust| |lv| |fl2|
                                               (QCAR |cVS|) |llc| |v_degs|
                                               (CONS
                                                (|function| |PFBR;gen_solv|) $)
                                               (QREFELT $ 135))
                                     . #24#)
                               (EXIT
                                (COND ((QEQCAR |flu| 1) "next")
                                      ('T
                                       (SEQ
                                        (LETT |factors| (QCDR |flu|) . #24#)
                                        (LETT |factors|
                                              (PROGN
                                               (LETT #7# NIL . #24#)
                                               (SEQ (LETT |w| NIL . #24#)
                                                    (LETT #6# |factors| . #24#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #6#)
                                                          (PROGN
                                                           (LETT |w| (CAR #6#)
                                                                 . #24#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #7#
                                                            (CONS
                                                             (SEQ
                                                              (LETT |lc|
                                                                    (SPADCALL
                                                                     |w|
                                                                     (QREFELT $
                                                                              93))
                                                                    . #24#)
                                                              (LETT |lcppPow|
                                                                    (PROG2
                                                                        (LETT
                                                                         #4#
                                                                         (SPADCALL
                                                                          |lcppPow|
                                                                          |lc|
                                                                          (QREFELT
                                                                           $
                                                                           136))
                                                                         . #24#)
                                                                        (QCDR
                                                                         #4#)
                                                                      (|check_union2|
                                                                       (QEQCAR
                                                                        #4# 0)
                                                                       (QREFELT
                                                                        $ 9)
                                                                       (|Union|
                                                                        (QREFELT
                                                                         $ 9)
                                                                        #27#)
                                                                       #4#))
                                                                    . #24#)
                                                              (EXIT
                                                               (PROG2
                                                                   (LETT #5#
                                                                         (SPADCALL
                                                                          |w|
                                                                          |lc|
                                                                          (QREFELT
                                                                           $
                                                                           102))
                                                                         . #24#)
                                                                   (QCDR #5#)
                                                                 (|check_union2|
                                                                  (QEQCAR #5#
                                                                          0)
                                                                  (|SparseUnivariatePolynomial|
                                                                   (QREFELT $
                                                                            9))
                                                                  (|Union|
                                                                   (|SparseUnivariatePolynomial|
                                                                    (QREFELT $
                                                                             9))
                                                                   #25#)
                                                                  #5#))))
                                                             #7#)
                                                            . #24#)))
                                                    (LETT #6# (CDR #6#) . #24#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #7#))))
                                              . #24#)
                                        (COND
                                         ((NULL
                                           (SPADCALL |lcppPow| (QREFELT $ 94)))
                                          (EXIT
                                           (|error|
                                            "internal error in factorSquareFreeByRecursion"))))
                                        (EXIT
                                         (PROGN
                                          (LETT #1#
                                                (SPADCALL
                                                 (SPADCALL |lcu|
                                                           (SPADCALL
                                                            (PROG2
                                                                (LETT #4#
                                                                      (SPADCALL
                                                                       |lcppPow|
                                                                       (QREFELT
                                                                        $ 137))
                                                                      . #24#)
                                                                (QCDR #4#)
                                                              (|check_union2|
                                                               (QEQCAR #4# 0)
                                                               (QREFELT $ 9)
                                                               (|Union|
                                                                (QREFELT $ 9)
                                                                #27#)
                                                               #4#))
                                                            (QREFELT $ 103))
                                                           (QREFELT $ 128))
                                                 (PROGN
                                                  (LETT #3# NIL . #24#)
                                                  (SEQ (LETT |w| NIL . #24#)
                                                       (LETT #2# |factors|
                                                             . #24#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #2#)
                                                             (PROGN
                                                              (LETT |w|
                                                                    (CAR #2#)
                                                                    . #24#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #3#
                                                               (CONS
                                                                (VECTOR
                                                                 (CONS 2
                                                                       "irred")
                                                                 |w| 1)
                                                                #3#)
                                                               . #24#)))
                                                       (LETT #2# (CDR #2#)
                                                             . #24#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #3#))))
                                                 (QREFELT $ 120))
                                                . #24#)
                                          (GO #26#))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #26# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |PolynomialFactorizationByRecursion;|)) 

(DEFUN |PolynomialFactorizationByRecursion| (&REST #1=#:G323)
  (SPROG NIL
         (PROG (#2=#:G324)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialFactorizationByRecursion|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialFactorizationByRecursion|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PolynomialFactorizationByRecursion;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialFactorizationByRecursion|)))))))))) 

(DEFUN |PolynomialFactorizationByRecursion;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialFactorizationByRecursion|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$|
          (LIST '|PolynomialFactorizationByRecursion| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 138) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|PolynomialFactorizationByRecursion|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasSignature| |#1| (LIST '|random| (LIST (|devaluate| |#1|))))
      (QSETREFV $ 15 (CONS (|dispatchFunction| |PFBR;randomR;R;2|) $)))
     ('T (QSETREFV $ 15 (CONS (|dispatchFunction| |PFBR;randomR;R;3|) $))))
    (COND
     ((|HasCategory| |#1| '(|FiniteFieldCategory|))
      (QSETREFV $ 33
                (CONS (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;4|)
                      $)))
     ('T
      (QSETREFV $ 33
                (CONS (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;5|)
                      $))))
    $))) 

(MAKEPROP '|PolynomialFactorizationByRecursion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Union| 11 '"failed") (|List| 12)
              (|SparseUnivariatePolynomial| $)
              (0 . |solveLinearPolynomialEquation|) (6 . |random|)
              (10 . |randomR|) (|Integer|) (14 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (19 . |univariate|)
              (|SparseUnivariatePolynomial| 18) (|Mapping| 18 9)
              (|SparseUnivariatePolynomial| 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 22 18 20)
              (24 . |map|) (30 . |solveLinearPolynomialEquation|)
              (36 . |multivariate|) (42 . |multivariate|) (|Mapping| 9 18)
              (|UnivariatePolynomialCategoryFunctions2| 18 20 9 22)
              (48 . |map|) (|Union| 32 '"failed") (|List| 22)
              (54 . |bivariateSLPEBR|)
              (|LinearPolynomialEquationByFractions| 9)
              (61 . |solveLinearPolynomialEquationByFractions|)
              (67 . |leadingCoefficient|) (|List| 8) (|List| 6) (72 . |eval|)
              (|Boolean|) (79 . |zero?|) (84 . |retract|) (|Mapping| 6 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 22 6 18) (89 . |map|)
              (95 . |differentiate|) (100 . |gcd|) (|NonNegativeInteger|)
              (106 . |degree|) (111 . |Zero|) (115 . >) (121 . |content|)
              (126 . |unit?|) (131 . |coerce|) (|Mapping| 9 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 18 9 22)
              (136 . |map|) (142 . |setDifference|) (148 . |remove|)
              (154 . |univariate|) (|SparseUnivariatePolynomial| 22)
              (|Mapping| 22 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 22 22 61)
              (160 . |map|) (|CommuteUnivariatePolynomialCategory| 9 22 61)
              (166 . |swap|) (171 . |Zero|) (|List| $) (175 . |monomials|)
              (180 . |leadingCoefficient|) (185 . |degree|) (190 . |monomial|)
              (196 . +) (|Mapping| 9 22)
              (|UnivariatePolynomialCategoryFunctions2| 22 61 9 22)
              (202 . |map|) (208 . |Zero|) (212 . |Zero|) (216 . =) (|List| 9)
              (222 . |coefficients|) (227 . |variables|) (232 . |concat|)
              (237 . |removeDuplicates!|)
              |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;11|
              (|Factored| 12) (242 . |factorPolynomial|) (|Factored| 22)
              (|Mapping| 22 18) (|Factored| 18) (|FactoredFunctions2| 18 22)
              (247 . |map|) (253 . |content|) (258 . |unit?|) (|Factored| $)
              (263 . |squareFree|) |PFBR;factorSquareFreeByRecursion;SupF;13|
              (|Mapping| 88 22) (|FactoredFunctionUtilities| 22)
              (268 . |refine|) (|Union| $ '"failed") (274 . |exquo|)
              (280 . |coerce|) (285 . |factor|) (|Factored| 9)
              (|FactoredFunctions2| 9 22) (290 . |map|) (296 . |mergeFactors|)
              |PFBR;factorByRecursion;SupF;12| (302 . |degree|) (308 . |One|)
              (312 . |degree|) (317 . |primitivePart|)
              (322 . |factorSquareFreePolynomial|) (327 . |numberOfFactors|)
              (332 . |One|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 117) (|:| |fctr| 22) (|:| |xpnt| 16))
              (|List| 118) (336 . |makeFR|)
              (|Record| (|:| |flg| 117) (|:| |fctr| 18) (|:| |xpnt| 16))
              (|List| 121) (342 . |factorList|) (347 . |leadingCoefficient|)
              (352 . |exquo|) (358 . *) (364 . ^) (370 . *) (|List| 18)
              (|List| 48) (|Union| 129 '"failed") (|Mapping| 131 18)
              (|Mapping| 132 129) (|MultivariateLifting| 7 8 6 9)
              (376 . |lifting|) (387 . |exquo|) (393 . |recip|))
           '#(|solveLinearPolynomialEquationByRecursion| 398 |randomR| 404
              |factorSquareFreeByRecursion| 408 |factorByRecursion| 413
              |bivariateSLPEBR| 418)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 137
                                                 '(2 6 10 11 12 13 0 6 0 14 0 0
                                                   6 15 1 6 0 16 17 1 9 18 0 19
                                                   2 23 20 21 22 24 2 18 10 11
                                                   12 25 2 9 0 12 8 26 2 9 0 18
                                                   8 27 2 29 22 28 20 30 3 0 31
                                                   32 22 8 33 2 34 31 32 22 35
                                                   1 22 9 0 36 3 9 0 0 37 38 39
                                                   1 9 40 0 41 1 9 6 0 42 2 44
                                                   18 43 22 45 1 18 0 0 46 2 18
                                                   0 0 0 47 1 18 48 0 49 0 6 0
                                                   50 2 48 40 0 0 51 1 18 6 0
                                                   52 1 6 40 0 53 1 9 0 6 54 2
                                                   56 22 55 18 57 2 37 0 0 0 58
                                                   2 37 0 8 0 59 2 9 12 0 8 60
                                                   2 63 61 62 22 64 1 65 61 61
                                                   66 0 61 0 67 1 61 68 0 69 1
                                                   61 22 0 70 1 61 48 0 71 2 61
                                                   0 22 48 72 2 61 0 0 0 73 2
                                                   75 22 74 61 76 0 7 0 77 0 22
                                                   0 78 2 22 40 0 0 79 1 22 80
                                                   0 81 1 9 37 0 82 1 37 0 68
                                                   83 1 37 0 0 84 1 6 86 12 87
                                                   2 91 88 89 90 92 1 22 9 0 93
                                                   1 9 40 0 94 1 22 95 0 96 2
                                                   99 88 88 98 100 2 22 101 0 9
                                                   102 1 22 0 9 103 1 9 95 0
                                                   104 2 106 88 62 105 107 2 99
                                                   88 88 88 108 2 9 48 0 8 110
                                                   0 9 0 111 1 22 48 0 112 1 18
                                                   0 0 113 1 6 86 12 114 1 90
                                                   48 0 115 0 6 0 116 2 88 0 22
                                                   119 120 1 90 122 0 123 1 18
                                                   6 0 124 2 6 101 0 0 125 2 18
                                                   0 6 0 126 2 9 0 0 48 127 2
                                                   22 0 9 0 128 7 134 31 22 37
                                                   129 38 80 130 133 135 2 9
                                                   101 0 0 136 1 9 101 0 137 2
                                                   0 31 32 22 85 0 0 6 15 1 0
                                                   88 22 97 1 0 88 22 109 3 0
                                                   31 32 22 8 33)))))
           '|lookupComplete|)) 
