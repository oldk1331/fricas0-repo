
(SDEFUN |PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((|answer| (|List| (|SparseUnivariatePolynomial| S))) (#1=#:G171 NIL)
          (|c| NIL) (#2=#:G172 NIL) (|d| NIL) (#3=#:G170 NIL) (#4=#:G162 NIL)
          (|recAns|
           (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
          (|ppx| (|SparseUnivariatePolynomial| R)) (|i| NIL) (#5=#:G169 NIL)
          (|u| NIL) (#6=#:G168 NIL)
          (|lpolysLower| (|List| (|SparseUnivariatePolynomial| R)))
          (#7=#:G167 NIL) (#8=#:G166 NIL) (|rhsdeg| #9=(|NonNegativeInteger|))
          (#10=#:G129 NIL) (#11=#:G128 #9#) (#12=#:G130 #9#) (#13=#:G165 NIL)
          (|v| NIL) (|lhsdeg| #9#) (#14=#:G123 NIL) (#15=#:G122 #9#)
          (#16=#:G124 #9#) (#17=#:G126 NIL) (#18=#:G125 #9#) (#19=#:G127 #9#)
          (#20=#:G164 NIL) (#21=#:G163 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lhsdeg|
                  (PROGN
                   (LETT #14# NIL
                         . #22=(|PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1|))
                   (SEQ (LETT |u| NIL . #22#) (LETT #21# |lpolys| . #22#) G190
                        (COND
                         ((OR (ATOM #21#)
                              (PROGN (LETT |u| (CAR #21#) . #22#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #16#
                                 (PROGN
                                  (LETT #17# NIL . #22#)
                                  (SEQ (LETT |v| NIL . #22#)
                                       (LETT #20# (SPADCALL |u| (QREFELT $ 10))
                                             . #22#)
                                       G190
                                       (COND
                                        ((OR (ATOM #20#)
                                             (PROGN
                                              (LETT |v| (CAR #20#) . #22#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (PROGN
                                          (LETT #19#
                                                (SPADCALL |v| (QREFELT $ 12))
                                                . #22#)
                                          (COND
                                           (#17#
                                            (LETT #18# (MAX #18# #19#) . #22#))
                                           ('T
                                            (PROGN
                                             (LETT #18# #19# . #22#)
                                             (LETT #17# 'T . #22#)))))))
                                       (LETT #20# (CDR #20#) . #22#) (GO G190)
                                       G191 (EXIT NIL))
                                  (COND (#17# #18#)
                                        ('T (|IdentityError| '|max|))))
                                 . #22#)
                           (COND (#14# (LETT #15# (MAX #15# #16#) . #22#))
                                 ('T
                                  (PROGN
                                   (LETT #15# #16# . #22#)
                                   (LETT #14# 'T . #22#)))))))
                        (LETT #21# (CDR #21#) . #22#) (GO G190) G191
                        (EXIT NIL))
                   (COND (#14# #15#) (#23='T (|IdentityError| '|max|))))
                  . #22#)
            (LETT |rhsdeg|
                  (PROGN
                   (LETT #10# NIL . #22#)
                   (SEQ (LETT |v| NIL . #22#)
                        (LETT #13# (SPADCALL |pp| (QREFELT $ 10)) . #22#) G190
                        (COND
                         ((OR (ATOM #13#)
                              (PROGN (LETT |v| (CAR #13#) . #22#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #12# (SPADCALL |v| (QREFELT $ 12)) . #22#)
                           (COND (#10# (LETT #11# (MAX #11# #12#) . #22#))
                                 ('T
                                  (PROGN
                                   (LETT #11# #12# . #22#)
                                   (LETT #10# 'T . #22#)))))))
                        (LETT #13# (CDR #13#) . #22#) (GO G190) G191
                        (EXIT NIL))
                   (COND (#10# #11#) (#23# (|IdentityError| '|max|))))
                  . #22#)
            (EXIT
             (COND
              ((EQL |lhsdeg| 0)
               (SEQ
                (LETT |lpolysLower|
                      (PROGN
                       (LETT #8# NIL . #22#)
                       (SEQ (LETT |u| NIL . #22#) (LETT #7# |lpolys| . #22#)
                            G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |u| (CAR #7#) . #22#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #8# (CONS (|PFBRU;lower| |u| $) #8#)
                                    . #22#)))
                            (LETT #7# (CDR #7#) . #22#) (GO G190) G191
                            (EXIT (NREVERSE #8#))))
                      . #22#)
                (LETT |answer|
                      (PROGN
                       (LETT #6# NIL . #22#)
                       (SEQ (LETT |u| NIL . #22#) (LETT #5# |lpolys| . #22#)
                            G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |u| (CAR #5#) . #22#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6# (CONS (|spadConstant| $ 15) #6#)
                                    . #22#)))
                            (LETT #5# (CDR #5#) . #22#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #22#)
                (SEQ (LETT |i| 0 . #22#) G190
                     (COND ((|greater_SI| |i| |rhsdeg|) (GO G191)))
                     (SEQ
                      (LETT |ppx|
                            (SPADCALL
                             (CONS
                              #'|PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1!0|
                              (VECTOR $ |i|))
                             |pp| (QREFELT $ 20))
                            . #22#)
                      (EXIT
                       (COND ((SPADCALL |ppx| (QREFELT $ 22)) "next")
                             ('T
                              (SEQ
                               (LETT |recAns|
                                     (SPADCALL |lpolysLower| |ppx|
                                               (QREFELT $ 26))
                                     . #22#)
                               (EXIT
                                (COND
                                 ((QEQCAR |recAns| 1)
                                  (PROGN
                                   (LETT #4# (CONS 1 "failed") . #22#)
                                   (GO #24=#:G161)))
                                 ('T
                                  (LETT |answer|
                                        (PROGN
                                         (LETT #3# NIL . #22#)
                                         (SEQ (LETT |d| NIL . #22#)
                                              (LETT #2# |answer| . #22#)
                                              (LETT |c| NIL . #22#)
                                              (LETT #1# (QCDR |recAns|) . #22#)
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |c| (CAR #1#)
                                                           . #22#)
                                                     NIL)
                                                    (ATOM #2#)
                                                    (PROGN
                                                     (LETT |d| (CAR #2#)
                                                           . #22#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #3#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (|spadConstant| $ 27)
                                                          |i| (QREFELT $ 29))
                                                         (|PFBRU;raise| |c| $)
                                                         (QREFELT $ 30))
                                                        |d| (QREFELT $ 31))
                                                       #3#)
                                                      . #22#)))
                                              (LETT #1#
                                                    (PROG1 (CDR #1#)
                                                      (LETT #2# (CDR #2#)
                                                            . #22#))
                                                    . #22#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #3#))))
                                        . #22#)))))))))
                     (LETT |i| (|inc_SI| |i|) . #22#) (GO G190) G191
                     (EXIT NIL))
                (EXIT (CONS 0 |answer|))))
              (#23# (SPADCALL |lpolys| |pp| (QREFELT $ 35)))))))
          #24# (EXIT #4#)))) 

(SDEFUN |PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1!0|
        ((|z1| NIL) ($$ NIL))
        (PROG (|i| $)
          (LETT |i| (QREFELT $$ 1)
                . #1=(|PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |i| (QREFELT $ 16)))))) 

(SDEFUN |PFBRU;hensel|
        ((|pp| |SparseUnivariatePolynomial| S) (|r| R)
         (|factors| . #1=(|List| #2=(|SparseUnivariatePolynomial| S)))
         ($ |Union|
          (|Record| (|:| |fctrs| (|List| (|SparseUnivariatePolynomial| S))))
          "failed"))
        (SPROG
         ((|pn| (S)) (|n| (|PositiveInteger|)) (|totdegree| (|Integer|))
          (#3=#:G226 NIL) (#4=#:G225 #5=(|Integer|)) (#6=#:G227 #5#)
          (#7=#:G229 NIL) (#8=#:G228 #5#) (#9=#:G230 #5#) (#10=#:G249 NIL)
          (|u| NIL) (#11=#:G248 NIL) (|u1| NIL) (#12=#:G239 NIL)
          (|foundFactors| (|List| (|SparseUnivariatePolynomial| S)))
          (|origFactors| #1#) (|proddegree| #13=(|Integer|)) (#14=#:G219 NIL)
          (#15=#:G218 #16=(|Integer|)) (#17=#:G220 #16#) (#18=#:G247 NIL)
          (|pp1| (|Union| (|SparseUnivariatePolynomial| S) "failed"))
          (#19=#:G245 NIL) (|a| NIL) (#20=#:G246 NIL) (|c| NIL)
          (#21=#:G243 NIL) (#22=#:G244 NIL) (|b| NIL) (#23=#:G242 NIL)
          (|step| (|Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
          (|Ecart| (|Union| (|SparseUnivariatePolynomial| S) "failed"))
          (#24=#:G208 NIL) (#25=#:G207 #2#) (#26=#:G209 #2#) (#27=#:G241 NIL)
          (#28=#:G104 NIL) (|prime| (S)) (#29=#:G178 NIL) (#30=#:G177 #13#)
          (#31=#:G179 #13#) (#32=#:G240 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |origFactors| |factors| . #33=(|PFBRU;hensel|))
                (LETT |totdegree| 0 . #33#)
                (LETT |proddegree|
                      (PROGN
                       (LETT #29# NIL . #33#)
                       (SEQ (LETT |u| NIL . #33#)
                            (LETT #32# (SPADCALL |pp| (QREFELT $ 10)) . #33#)
                            G190
                            (COND
                             ((OR (ATOM #32#)
                                  (PROGN (LETT |u| (CAR #32#) . #33#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #31# (SPADCALL |u| (QREFELT $ 12)) . #33#)
                               (COND (#29# (LETT #30# (MAX #30# #31#) . #33#))
                                     ('T
                                      (PROGN
                                       (LETT #30# #31# . #33#)
                                       (LETT #29# 'T . #33#)))))))
                            (LETT #32# (CDR #32#) . #33#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#29# #30#) ('T (|IdentityError| '|max|))))
                      . #33#)
                (LETT |n| 1 . #33#)
                (LETT |pn|
                      (LETT |prime|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 27) 1 (QREFELT $ 29))
                             (SPADCALL |r| (QREFELT $ 37)) (QREFELT $ 38))
                            . #33#)
                      . #33#)
                (LETT |foundFactors| NIL . #33#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |totdegree| |proddegree| (QREFELT $ 40)))
                       (GO G191)))
                     (SEQ
                      (LETT |Ecart|
                            (SPADCALL
                             (SPADCALL |pp|
                                       (PROGN
                                        (LETT #24# NIL . #33#)
                                        (SEQ (LETT #28# NIL . #33#)
                                             (LETT #27# |factors| . #33#) G190
                                             (COND
                                              ((OR (ATOM #27#)
                                                   (PROGN
                                                    (LETT #28# (CAR #27#)
                                                          . #33#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #26# #28# . #33#)
                                                (COND
                                                 (#24#
                                                  (LETT #25#
                                                        (SPADCALL #25# #26#
                                                                  (QREFELT $
                                                                           41))
                                                        . #33#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #25# #26# . #33#)
                                                   (LETT #24# 'T . #33#)))))))
                                             (LETT #27# (CDR #27#) . #33#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#24# #25#)
                                              ('T (|spadConstant| $ 42))))
                                       (QREFELT $ 43))
                             |pn| (QREFELT $ 45))
                            . #33#)
                      (EXIT
                       (COND
                        ((QEQCAR |Ecart| 1)
                         (|error| "failed lifting in hensel in PFBRU"))
                        ((SPADCALL (QCDR |Ecart|) (QREFELT $ 46))
                         (PROGN
                          (LETT #12#
                                (CONS 0
                                      (LIST (APPEND |foundFactors| |factors|)))
                                . #33#)
                          (GO #34=#:G238)))
                        ('T
                         (SEQ
                          (LETT |step|
                                (SPADCALL |origFactors|
                                          (SPADCALL
                                           (CONS #'|PFBRU;hensel!0|
                                                 (VECTOR $ |r|))
                                           (QCDR |Ecart|) (QREFELT $ 49))
                                          (QREFELT $ 50))
                                . #33#)
                          (EXIT
                           (COND
                            ((QEQCAR |step| 1)
                             (PROGN
                              (LETT #12# (CONS 1 "failed") . #33#)
                              (GO #34#)))
                            ('T
                             (SEQ
                              (LETT |factors|
                                    (PROGN
                                     (LETT #23# NIL . #33#)
                                     (SEQ (LETT |b| NIL . #33#)
                                          (LETT #22# (QCDR |step|) . #33#)
                                          (LETT |a| NIL . #33#)
                                          (LETT #21# |factors| . #33#) G190
                                          (COND
                                           ((OR (ATOM #21#)
                                                (PROGN
                                                 (LETT |a| (CAR #21#) . #33#)
                                                 NIL)
                                                (ATOM #22#)
                                                (PROGN
                                                 (LETT |b| (CAR #22#) . #33#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #23#
                                                  (CONS
                                                   (SPADCALL |a|
                                                             (SPADCALL |b| |pn|
                                                                       (QREFELT
                                                                        $ 51))
                                                             (QREFELT $ 31))
                                                   #23#)
                                                  . #33#)))
                                          (LETT #21#
                                                (PROG1 (CDR #21#)
                                                  (LETT #22# (CDR #22#)
                                                        . #33#))
                                                . #33#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #23#))))
                                    . #33#)
                              (SEQ (LETT |c| NIL . #33#)
                                   (LETT #20# |origFactors| . #33#)
                                   (LETT |a| NIL . #33#)
                                   (LETT #19# |factors| . #33#) G190
                                   (COND
                                    ((OR (ATOM #19#)
                                         (PROGN
                                          (LETT |a| (CAR #19#) . #33#)
                                          NIL)
                                         (ATOM #20#)
                                         (PROGN
                                          (LETT |c| (CAR #20#) . #33#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |pp1|
                                          (SPADCALL |pp| |a| (QREFELT $ 52))
                                          . #33#)
                                    (EXIT
                                     (COND ((QEQCAR |pp1| 1) "next")
                                           ('T
                                            (SEQ
                                             (LETT |pp| (QCDR |pp1|) . #33#)
                                             (LETT |proddegree|
                                                   (- |proddegree|
                                                      (PROGN
                                                       (LETT #14# NIL . #33#)
                                                       (SEQ
                                                        (LETT |u| NIL . #33#)
                                                        (LETT #18#
                                                              (SPADCALL |a|
                                                                        (QREFELT
                                                                         $ 10))
                                                              . #33#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #18#)
                                                              (PROGN
                                                               (LETT |u|
                                                                     (CAR #18#)
                                                                     . #33#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (PROGN
                                                           (LETT #17#
                                                                 (SPADCALL |u|
                                                                           (QREFELT
                                                                            $
                                                                            12))
                                                                 . #33#)
                                                           (COND
                                                            (#14#
                                                             (LETT #15#
                                                                   (MAX #15#
                                                                        #17#)
                                                                   . #33#))
                                                            ('T
                                                             (PROGN
                                                              (LETT #15# #17#
                                                                    . #33#)
                                                              (LETT #14# 'T
                                                                    . #33#)))))))
                                                        (LETT #18# (CDR #18#)
                                                              . #33#)
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                       (COND (#14# #15#)
                                                             ('T
                                                              (|IdentityError|
                                                               '|max|)))))
                                                   . #33#)
                                             (LETT |factors|
                                                   (SPADCALL |a| |factors|
                                                             (QREFELT $ 53))
                                                   . #33#)
                                             (LETT |origFactors|
                                                   (SPADCALL |c| |origFactors|
                                                             (QREFELT $ 53))
                                                   . #33#)
                                             (EXIT
                                              (LETT |foundFactors|
                                                    (CONS |a| |foundFactors|)
                                                    . #33#)))))))
                                   (LETT #19#
                                         (PROG1 (CDR #19#)
                                           (LETT #20# (CDR #20#) . #33#))
                                         . #33#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND
                                ((< (LENGTH |factors|) 2)
                                 (PROGN
                                  (LETT #12#
                                        (CONS 0
                                              (LIST
                                               (COND
                                                ((NULL |factors|)
                                                 |foundFactors|)
                                                ('T
                                                 (CONS |pp| |foundFactors|)))))
                                        . #33#)
                                  (GO #34#)))
                                ('T
                                 (SEQ
                                  (LETT |totdegree|
                                        (PROGN
                                         (LETT #3# NIL . #33#)
                                         (SEQ (LETT |u1| NIL . #33#)
                                              (LETT #11# |factors| . #33#) G190
                                              (COND
                                               ((OR (ATOM #11#)
                                                    (PROGN
                                                     (LETT |u1| (CAR #11#)
                                                           . #33#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (PROGN
                                                 (LETT #6#
                                                       (PROGN
                                                        (LETT #7# NIL . #33#)
                                                        (SEQ
                                                         (LETT |u| NIL . #33#)
                                                         (LETT #10#
                                                               (SPADCALL |u1|
                                                                         (QREFELT
                                                                          $
                                                                          10))
                                                               . #33#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #10#)
                                                               (PROGN
                                                                (LETT |u|
                                                                      (CAR
                                                                       #10#)
                                                                      . #33#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #9#
                                                                  (SPADCALL |u|
                                                                            (QREFELT
                                                                             $
                                                                             12))
                                                                  . #33#)
                                                            (COND
                                                             (#7#
                                                              (LETT #8#
                                                                    (MAX #8#
                                                                         #9#)
                                                                    . #33#))
                                                             ('T
                                                              (PROGN
                                                               (LETT #8# #9#
                                                                     . #33#)
                                                               (LETT #7# 'T
                                                                     . #33#)))))))
                                                         (LETT #10# (CDR #10#)
                                                               . #33#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                        (COND (#7# #8#)
                                                              ('T
                                                               (|IdentityError|
                                                                '|max|))))
                                                       . #33#)
                                                 (COND
                                                  (#3#
                                                   (LETT #4# (+ #4# #6#)
                                                         . #33#))
                                                  ('T
                                                   (PROGN
                                                    (LETT #4# #6# . #33#)
                                                    (LETT #3# 'T . #33#)))))))
                                              (LETT #11# (CDR #11#) . #33#)
                                              (GO G190) G191 (EXIT NIL))
                                         (COND (#3# #4#) ('T 0)))
                                        . #33#)
                                  (LETT |n| (+ |n| 1) . #33#)
                                  (EXIT
                                   (LETT |pn|
                                         (SPADCALL |pn| |prime| (QREFELT $ 54))
                                         . #33#)))))))))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 1 "failed"))))
          #34# (EXIT #12#)))) 

(SDEFUN |PFBRU;hensel!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|PFBRU;hensel|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1| (SPADCALL |r| (QREFELT $ 37)) (QREFELT $ 47)))))) 

(SDEFUN |PFBRU;chooseFSQViableSubstitutions|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Record| (|:| |substnsField| R)
          (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
        (SPROG
         ((#1=#:G257 NIL) (|ppR| (|SparseUnivariatePolynomial| R))
          (|substns| (R)))
         (SEQ
          (SEQ
           (EXIT
            (SEQ G190 (COND ((NULL 'T) (GO G191)))
                 (SEQ
                  (LETT |substns| (SPADCALL (QREFELT $ 55))
                        . #2=(|PFBRU;chooseFSQViableSubstitutions|))
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL (SPADCALL |pp| (QREFELT $ 56)) |substns|
                                (QREFELT $ 57))
                      (QREFELT $ 58))
                     "next")
                    ('T
                     (SEQ
                      (LETT |ppR|
                            (SPADCALL
                             (CONS #'|PFBRU;chooseFSQViableSubstitutions!0|
                                   (VECTOR $ |substns|))
                             |pp| (QREFELT $ 20))
                            . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL
                           (SPADCALL |ppR| (SPADCALL |ppR| (QREFELT $ 59))
                                     (QREFELT $ 60))
                           (QREFELT $ 61))
                          0 (QREFELT $ 62))
                         "next")
                        ('T
                         (PROGN
                          (LETT #1# |$NoValue| . #2#)
                          (GO #3=#:G254))))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #3# (EXIT #1#))
          (EXIT (CONS |substns| |ppR|))))) 

(SDEFUN |PFBRU;chooseFSQViableSubstitutions!0| ((|z1| NIL) ($$ NIL))
        (PROG (|substns| $)
          (LETT |substns| (QREFELT $$ 1)
                . #1=(|PFBRU;chooseFSQViableSubstitutions|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |substns| (QREFELT $ 57)))))) 

(SDEFUN |PFBRU;raise|
        ((|supR| |SparseUnivariatePolynomial| R)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL (ELT $ 37) |supR| (QREFELT $ 65))) 

(SDEFUN |PFBRU;lower|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| R))
        (SPADCALL (ELT $ 66) |pp| (QREFELT $ 20))) 

(SDEFUN |PFBRU;factorSFBRlcUnitInner|
        ((|pp| |SparseUnivariatePolynomial| S) (|r| R)
         ($ |Union| (|Factored| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((#1=#:G282 NIL) (|u| NIL) (#2=#:G281 NIL)
          (|hen|
           (|Union|
            (|Record| (|:| |fctrs| (|List| (|SparseUnivariatePolynomial| S))))
            "failed"))
          (|factors| (|List| (|SparseUnivariatePolynomial| S))) (#3=#:G280 NIL)
          (#4=#:G279 NIL)
          (|fDown| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|ppR| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (LETT |ppR|
                (SPADCALL
                 (CONS #'|PFBRU;factorSFBRlcUnitInner!0| (VECTOR $ |r|)) |pp|
                 (QREFELT $ 20))
                . #5=(|PFBRU;factorSFBRlcUnitInner|))
          (EXIT
           (COND
            ((OR
              (< (SPADCALL |ppR| (QREFELT $ 61))
                 (SPADCALL |pp| (QREFELT $ 67)))
              (SPADCALL
               (SPADCALL
                (SPADCALL |ppR| (SPADCALL |ppR| (QREFELT $ 59)) (QREFELT $ 60))
                (QREFELT $ 61))
               0 (QREFELT $ 62)))
             (CONS 1 "failed"))
            ('T
             (SEQ
              (LETT |factors|
                    (SEQ (LETT |fDown| (SPADCALL |ppR| (QREFELT $ 69)) . #5#)
                         (EXIT
                          (CONS
                           (|PFBRU;raise|
                            (SPADCALL (SPADCALL |fDown| (QREFELT $ 71))
                                      (QVELT
                                       (|SPADfirst|
                                        (SPADCALL |fDown| (QREFELT $ 75)))
                                       1)
                                      (QREFELT $ 76))
                            $)
                           (PROGN
                            (LETT #4# NIL . #5#)
                            (SEQ (LETT |u| NIL . #5#)
                                 (LETT #3#
                                       (CDR (SPADCALL |fDown| (QREFELT $ 75)))
                                       . #5#)
                                 G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS (|PFBRU;raise| (QVELT |u| 1) $)
                                               #4#)
                                         . #5#)))
                                 (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #4#)))))))
                    . #5#)
              (EXIT
               (COND
                ((EQL (LENGTH |factors|) 1)
                 (CONS 0
                       (SPADCALL (|spadConstant| $ 42)
                                 (LIST (VECTOR (CONS 2 "irred") |pp| 1))
                                 (QREFELT $ 80))))
                (#6='T
                 (SEQ (LETT |hen| (|PFBRU;hensel| |pp| |r| |factors| $) . #5#)
                      (EXIT
                       (COND ((QEQCAR |hen| 1) (CONS 1 "failed"))
                             (#6#
                              (CONS 0
                                    (SPADCALL (|spadConstant| $ 42)
                                              (PROGN
                                               (LETT #2# NIL . #5#)
                                               (SEQ (LETT |u| NIL . #5#)
                                                    (LETT #1#
                                                          (QCAR (QCDR |hen|))
                                                          . #5#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #1#)
                                                          (PROGN
                                                           (LETT |u| (CAR #1#)
                                                                 . #5#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #2#
                                                            (CONS
                                                             (VECTOR
                                                              (CONS 2 "irred")
                                                              |u| 1)
                                                             #2#)
                                                            . #5#)))
                                                    (LETT #1# (CDR #1#) . #5#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #2#))))
                                              (QREFELT $ 80))))))))))))))))) 

(SDEFUN |PFBRU;factorSFBRlcUnitInner!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|PFBRU;factorSFBRlcUnitInner|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |r| (QREFELT $ 57)))))) 

(SDEFUN |PFBRU;factorSFBRlcUnit;SupF;7|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G291 NIL) (|val| (R)) (|val1| (|Union| R "failed"))
          (|tempAns|
           (|Union| (|Factored| (|SparseUnivariatePolynomial| S)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |val| (|spadConstant| $ 81)
                  . #2=(|PFBRU;factorSFBRlcUnit;SupF;7|))
            (EXIT
             (SEQ G190 (COND ((NULL 'T) (GO G191)))
                  (SEQ
                   (LETT |tempAns| (|PFBRU;factorSFBRlcUnitInner| |pp| |val| $)
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |tempAns| 1)
                      (SEQ (LETT |val1| (SPADCALL |val| (QREFELT $ 82)) . #2#)
                           (EXIT
                            (COND
                             ((QEQCAR |val1| 1)
                              (|error|
                               "at this point, we know we have a finite field"))
                             ('T (LETT |val| (QCDR |val1|) . #2#))))))
                     ('T
                      (PROGN
                       (LETT #1# (QCDR |tempAns|) . #2#)
                       (GO #3=#:G290))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |PFBRU;factorSFBRlcUnit;SupF;8|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G296 NIL) (|val| (R))
          (|tempAns|
           (|Union| (|Factored| (|SparseUnivariatePolynomial| S)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |val| (SPADCALL (QREFELT $ 55))
                  . #2=(|PFBRU;factorSFBRlcUnit;SupF;8|))
            (EXIT
             (SEQ G190 (COND ((NULL 'T) (GO G191)))
                  (SEQ
                   (LETT |tempAns| (|PFBRU;factorSFBRlcUnitInner| |pp| |val| $)
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |tempAns| 1)
                      (LETT |val| (SPADCALL (QREFELT $ 55)) . #2#))
                     ('T
                      (PROGN
                       (LETT #1# (QCDR |tempAns|) . #2#)
                       (GO #3=#:G295))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |PFBRU;randomR;R;9| (($ R))
        (SPROG ((|v| (|Union| R "failed")))
               (SEQ
                (LETT |v| (SPADCALL (QREFELT $ 84) (QREFELT $ 82))
                      |PFBRU;randomR;R;9|)
                (EXIT
                 (COND
                  ((QEQCAR |v| 1)
                   (SEQ (SAY "Taking another set of random values")
                        (SETELT $ 84 (|spadConstant| $ 81))
                        (EXIT (QREFELT $ 84))))
                  ('T (SEQ (SETELT $ 84 (QCDR |v|)) (EXIT (QREFELT $ 84))))))))) 

(SDEFUN |PFBRU;randomR;R;10| (($ R)) (SPADCALL (QREFELT $ 85))) 

(SDEFUN |PFBRU;randomR;R;11| (($ R)) (SPADCALL (RANDOM 100) (QREFELT $ 86))) 

(SDEFUN |PFBRU;factorByRecursion;SupF;12|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G312 NIL) (|c| (S)) (#2=#:G307 NIL) (#3=#:G306 #4=(|Boolean|))
          (#5=#:G308 #4#) (#6=#:G319 NIL) (|u| NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #2# NIL . #7=(|PFBRU;factorByRecursion;SupF;12|))
             (SEQ (LETT |u| NIL . #7#)
                  (LETT #6# (SPADCALL |pp| (QREFELT $ 10)) . #7#) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |u| (CAR #6#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #5# (ZEROP (SPADCALL |u| (QREFELT $ 12))) . #7#)
                     (COND (#2# (LETT #3# (COND (#3# #5#) ('T 'NIL)) . #7#))
                           ('T
                            (PROGN
                             (LETT #3# #5# . #7#)
                             (LETT #2# 'T . #7#)))))))
                  (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#8='T 'T)))
            (SPADCALL (CONS (|function| |PFBRU;raise|) $)
                      (SPADCALL (|PFBRU;lower| |pp| $) (QREFELT $ 87))
                      (QREFELT $ 90)))
           (#8#
            (SEQ (LETT |c| (SPADCALL |pp| (QREFELT $ 91)) . #7#)
                 (EXIT
                  (COND
                   ((SPADCALL |c| (QREFELT $ 92))
                    (SPADCALL (SPADCALL |pp| (QREFELT $ 94)) (ELT $ 95)
                              (QREFELT $ 98)))
                   (#8#
                    (SEQ
                     (LETT |pp|
                           (PROG2
                               (LETT #1# (SPADCALL |pp| |c| (QREFELT $ 45))
                                     . #7#)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7))
                                             (|Union|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))
                                              "failed")
                                             #1#))
                           . #7#)
                     (EXIT
                      (SPADCALL
                       (SPADCALL (SPADCALL |pp| (QREFELT $ 94)) (ELT $ 95)
                                 (QREFELT $ 98))
                       (SPADCALL (ELT $ 99) (SPADCALL |c| (QREFELT $ 100))
                                 (QREFELT $ 104))
                       (QREFELT $ 105))))))))))))) 

(SDEFUN |PFBRU;factorSquareFreeByRecursion;SupF;13|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G364 NIL) (|w| NIL) (#2=#:G363 NIL) (#3=#:G341 NIL)
          (|factors| (|List| (|SparseUnivariatePolynomial| S))) (#4=#:G344 NIL)
          (|lcppPow| (S)) (|lc| (S)) (#5=#:G362 NIL) (#6=#:G361 NIL)
          (#7=#:G354 NIL)
          (|hen|
           (|Union|
            (|Record| (|:| |fctrs| (|List| (|SparseUnivariatePolynomial| S))))
            "failed"))
          (OK (|Boolean|)) (|ppAdjust| (|SparseUnivariatePolynomial| S))
          (#8=#:G360 NIL) (|u| NIL) (#9=#:G359 NIL) (#10=#:G332 NIL)
          (#11=#:G358 NIL) (#12=#:G357 NIL) (|lcppR| (R))
          (|oldnfact| (|NonNegativeInteger|)) (#13=#:G355 NIL)
          (|nfact| (|NonNegativeInteger|))
          (|factorsR| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|newppR| (|SparseUnivariatePolynomial| R))
          (|cVS|
           (|Record| (|:| |substnsField| R)
                     (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
          (|lcpp| (S)) (#14=#:G321 NIL) (#15=#:G320 #16=(|Boolean|))
          (#17=#:G322 #16#) (#18=#:G356 NIL))
         (SEQ
          (EXIT
           (COND
            ((PROGN
              (LETT #14# NIL
                    . #19=(|PFBRU;factorSquareFreeByRecursion;SupF;13|))
              (SEQ (LETT |u| NIL . #19#)
                   (LETT #18# (SPADCALL |pp| (QREFELT $ 10)) . #19#) G190
                   (COND
                    ((OR (ATOM #18#) (PROGN (LETT |u| (CAR #18#) . #19#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #17# (ZEROP (SPADCALL |u| (QREFELT $ 12))) . #19#)
                      (COND
                       (#14# (LETT #15# (COND (#15# #17#) ('T 'NIL)) . #19#))
                       ('T
                        (PROGN
                         (LETT #15# #17# . #19#)
                         (LETT #14# 'T . #19#)))))))
                   (LETT #18# (CDR #18#) . #19#) (GO G190) G191 (EXIT NIL))
              (COND (#14# #15#) (#20='T 'T)))
             (SPADCALL (CONS (|function| |PFBRU;raise|) $)
                       (SPADCALL (|PFBRU;lower| |pp| $) (QREFELT $ 69))
                       (QREFELT $ 90)))
            ((SPADCALL (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 56)) . #19#)
                       (QREFELT $ 92))
             (SPADCALL |pp| (QREFELT $ 83)))
            (#20#
             (SEQ (LETT |oldnfact| 999999 . #19#)
                  (SEQ
                   (EXIT
                    (SEQ G190 (COND ((NULL 'T) (GO G191)))
                         (SEQ
                          (LETT |cVS|
                                (|PFBRU;chooseFSQViableSubstitutions| |pp| $)
                                . #19#)
                          (LETT |newppR|
                                (SPADCALL (QCDR |cVS|) (QREFELT $ 107)) . #19#)
                          (LETT |factorsR| (SPADCALL |newppR| (QREFELT $ 69))
                                . #19#)
                          (LETT |nfact| (SPADCALL |factorsR| (QREFELT $ 108))
                                . #19#)
                          (EXIT
                           (COND
                            ((EQL |nfact| 1)
                             (PROGN
                              (LETT #13#
                                    (SPADCALL (|spadConstant| $ 42)
                                              (LIST
                                               (VECTOR (CONS 2 "irred") |pp|
                                                       1))
                                              (QREFELT $ 80))
                                    . #19#)
                              (GO #21=#:G353)))
                            ((SPADCALL |nfact| |oldnfact| (QREFELT $ 62))
                             "next")
                            ('T
                             (SEQ (LETT |oldnfact| |nfact| . #19#)
                                  (LETT |lcppR|
                                        (SPADCALL (QCDR |cVS|) (QREFELT $ 109))
                                        . #19#)
                                  (LETT |factors|
                                        (PROGN
                                         (LETT #12# NIL . #19#)
                                         (SEQ (LETT |u| NIL . #19#)
                                              (LETT #11#
                                                    (SPADCALL |factorsR|
                                                              (QREFELT $ 75))
                                                    . #19#)
                                              G190
                                              (COND
                                               ((OR (ATOM #11#)
                                                    (PROGN
                                                     (LETT |u| (CAR #11#)
                                                           . #19#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #12#
                                                      (CONS
                                                       (|PFBRU;raise|
                                                        (SPADCALL
                                                         (PROG2
                                                             (LETT #10#
                                                                   (SPADCALL
                                                                    |lcppR|
                                                                    (SPADCALL
                                                                     (QVELT |u|
                                                                            1)
                                                                     (QREFELT $
                                                                              109))
                                                                    (QREFELT $
                                                                             110))
                                                                   . #19#)
                                                             (QCDR #10#)
                                                           (|check_union2|
                                                            (QEQCAR #10# 0)
                                                            (QREFELT $ 6)
                                                            (|Union|
                                                             (QREFELT $ 6)
                                                             #22="failed")
                                                            #10#))
                                                         (QVELT |u| 1)
                                                         (QREFELT $ 111))
                                                        $)
                                                       #12#)
                                                      . #19#)))
                                              (LETT #11# (CDR #11#) . #19#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #12#))))
                                        . #19#)
                                  (LETT |factors|
                                        (PROGN
                                         (LETT #9# NIL . #19#)
                                         (SEQ (LETT |u| NIL . #19#)
                                              (LETT #8# |factors| . #19#) G190
                                              (COND
                                               ((OR (ATOM #8#)
                                                    (PROGN
                                                     (LETT |u| (CAR #8#)
                                                           . #19#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #9#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL |lcpp|
                                                                  (SPADCALL |u|
                                                                            (QREFELT
                                                                             $
                                                                             67))
                                                                  (QREFELT $
                                                                           112))
                                                        (SPADCALL |u|
                                                                  (QREFELT $
                                                                           113))
                                                        (QREFELT $ 31))
                                                       #9#)
                                                      . #19#)))
                                              (LETT #8# (CDR #8#) . #19#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #9#))))
                                        . #19#)
                                  (LETT |ppAdjust|
                                        (SPADCALL
                                         (LETT |lcppPow|
                                               (SPADCALL |lcpp|
                                                         (LENGTH
                                                          (CDR |factors|))
                                                         (QREFELT $ 114))
                                               . #19#)
                                         |pp| (QREFELT $ 30))
                                        . #19#)
                                  (LETT OK 'T . #19#)
                                  (LETT |hen|
                                        (|PFBRU;hensel| |ppAdjust| (QCAR |cVS|)
                                         |factors| $)
                                        . #19#)
                                  (EXIT
                                   (COND ((QEQCAR |hen| 1) "next")
                                         ('T
                                          (SEQ
                                           (LETT |factors| (QCAR (QCDR |hen|))
                                                 . #19#)
                                           (EXIT
                                            (PROGN
                                             (LETT #7# |$NoValue| . #19#)
                                             (GO #23=#:G339))))))))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #23# (EXIT #7#))
                  (LETT |factors|
                        (PROGN
                         (LETT #6# NIL . #19#)
                         (SEQ (LETT |w| NIL . #19#) (LETT #5# |factors| . #19#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |w| (CAR #5#) . #19#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (SEQ
                                        (LETT |lc|
                                              (SPADCALL |w| (QREFELT $ 91))
                                              . #19#)
                                        (LETT |lcppPow|
                                              (PROG2
                                                  (LETT #3#
                                                        (SPADCALL |lcppPow|
                                                                  |lc|
                                                                  (QREFELT $
                                                                           115))
                                                        . #19#)
                                                  (QCDR #3#)
                                                (|check_union2| (QEQCAR #3# 0)
                                                                (QREFELT $ 7)
                                                                (|Union|
                                                                 (QREFELT $ 7)
                                                                 #22#)
                                                                #3#))
                                              . #19#)
                                        (EXIT
                                         (PROG2
                                             (LETT #4#
                                                   (SPADCALL |w| |lc|
                                                             (QREFELT $ 45))
                                                   . #19#)
                                             (QCDR #4#)
                                           (|check_union2| (QEQCAR #4# 0)
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 7))
                                                           (|Union|
                                                            (|SparseUnivariatePolynomial|
                                                             (QREFELT $ 7))
                                                            "failed")
                                                           #4#))))
                                       #6#)
                                      . #19#)))
                              (LETT #5# (CDR #5#) . #19#) (GO G190) G191
                              (EXIT (NREVERSE #6#))))
                        . #19#)
                  (COND
                   ((NULL (SPADCALL |lcppPow| (QREFELT $ 92)))
                    (EXIT
                     (|error|
                      "internal error in factorSquareFreeByRecursion"))))
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (PROG2
                         (LETT #3# (SPADCALL |lcppPow| (QREFELT $ 116)) . #19#)
                         (QCDR #3#)
                       (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                       (|Union| (QREFELT $ 7) #22#) #3#))
                     (QREFELT $ 99))
                    (PROGN
                     (LETT #2# NIL . #19#)
                     (SEQ (LETT |w| NIL . #19#) (LETT #1# |factors| . #19#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |w| (CAR #1#) . #19#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (VECTOR (CONS 2 "irred") |w| 1) #2#)
                                  . #19#)))
                          (LETT #1# (CDR #1#) . #19#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 80)))))))
          #21# (EXIT #13#)))) 

(DECLAIM (NOTINLINE |PolynomialFactorizationByRecursionUnivariate;|)) 

(DEFUN |PolynomialFactorizationByRecursionUnivariate| (&REST #1=#:G365)
  (SPROG NIL
         (PROG (#2=#:G366)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialFactorizationByRecursionUnivariate|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialFactorizationByRecursionUnivariate|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |PolynomialFactorizationByRecursionUnivariate;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialFactorizationByRecursionUnivariate|)))))))))) 

(DEFUN |PolynomialFactorizationByRecursionUnivariate;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|PolynomialFactorizationByRecursionUnivariate|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$|
                (LIST '|PolynomialFactorizationByRecursionUnivariate| DV$1
                      DV$2)
                . #1#)
          (LETT $ (GETREFV 117) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|PolynomialFactorizationByRecursionUnivariate|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|StepThrough|))
            (QSETREFV $ 83
                      (CONS
                       (|dispatchFunction| |PFBRU;factorSFBRlcUnit;SupF;7|)
                       $)))
           ('T
            (QSETREFV $ 83
                      (CONS
                       (|dispatchFunction| |PFBRU;factorSFBRlcUnit;SupF;8|)
                       $))))
          (COND
           ((|HasCategory| |#1| '(|StepThrough|))
            (PROGN
             (QSETREFV $ 84 (|spadConstant| $ 81))
             (QSETREFV $ 55
                       (CONS (|dispatchFunction| |PFBRU;randomR;R;9|) $))))
           ((|HasSignature| |#1| (LIST '|random| (LIST (|devaluate| |#1|))))
            (QSETREFV $ 55 (CONS (|dispatchFunction| |PFBRU;randomR;R;10|) $)))
           ('T
            (QSETREFV $ 55
                      (CONS (|dispatchFunction| |PFBRU;randomR;R;11|) $))))
          $))) 

(MAKEPROP '|PolynomialFactorizationByRecursionUnivariate| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 7)
              (|SparseUnivariatePolynomial| 7) (0 . |coefficients|)
              (|NonNegativeInteger|) (5 . |degree|) (10 . |Zero|) (14 . |Zero|)
              (18 . |Zero|) (22 . |coefficient|)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 9 6 17) (28 . |map|)
              (|Boolean|) (34 . |zero?|) (|Union| 24 '"failed") (|List| 25)
              (|SparseUnivariatePolynomial| $)
              (39 . |solveLinearPolynomialEquation|) (45 . |One|) (49 . |One|)
              (53 . |monomial|) (59 . *) (65 . +) (|Union| 33 '"failed")
              (|List| 9) (|LinearPolynomialEquationByFractions| 7)
              (71 . |solveLinearPolynomialEquationByFractions|)
              |PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1|
              (77 . |coerce|) (82 . -) (|Integer|) (88 . <=) (94 . *)
              (100 . |One|) (104 . -) (|Union| $ '"failed") (110 . |exquo|)
              (116 . |zero?|) (121 . |elt|) (|Mapping| 7 7) (127 . |map|)
              (133 . |solveLinearPolynomialEquation|) (139 . *) (145 . |exquo|)
              (151 . |remove|) (157 . *) (163 . |randomR|)
              (167 . |leadingCoefficient|) (172 . |elt|) (178 . |zero?|)
              (183 . |differentiate|) (188 . |gcd|) (194 . |degree|) (199 . >)
              (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 17 7 9) (205 . |map|)
              (211 . |retract|) (216 . |degree|) (|Factored| 25)
              (221 . |factorSquareFreePolynomial|) (|Factored| 17)
              (226 . |unit|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 72) (|:| |fctr| 17) (|:| |xpnt| 39))
              (|List| 73) (231 . |factorList|) (236 . *)
              (|Record| (|:| |flg| 72) (|:| |fctr| 9) (|:| |xpnt| 39))
              (|List| 77) (|Factored| 9) (242 . |makeFR|) (248 . |init|)
              (252 . |nextItem|) (257 . |factorSFBRlcUnit|) '|randomCount|
              (262 . |random|) (266 . |coerce|) (271 . |factorPolynomial|)
              (|Mapping| 9 17) (|FactoredFunctions2| 17 9) (276 . |map|)
              (282 . |content|) (287 . |unit?|) (|Factored| $)
              (292 . |squareFree|) |PFBRU;factorSquareFreeByRecursion;SupF;13|
              (|Mapping| 79 9) (|FactoredFunctionUtilities| 9) (297 . |refine|)
              (303 . |coerce|) (308 . |factor|) (|Mapping| 9 7) (|Factored| 7)
              (|FactoredFunctions2| 7 9) (313 . |map|) (319 . |mergeFactors|)
              |PFBRU;factorByRecursion;SupF;12| (325 . |primitivePart|)
              (330 . |numberOfFactors|) (335 . |leadingCoefficient|)
              (340 . |exquo|) (346 . *) (352 . |monomial|) (358 . |reductum|)
              (363 . ^) (369 . |exquo|) (375 . |recip|))
           '#(|solveLinearPolynomialEquationByRecursion| 380 |randomR| 386
              |factorSquareFreeByRecursion| 390 |factorSFBRlcUnit| 395
              |factorByRecursion| 400)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 116
                                                 '(1 9 8 0 10 1 7 11 0 12 0 6 0
                                                   13 0 7 0 14 0 9 0 15 2 7 6 0
                                                   11 16 2 19 17 18 9 20 1 17
                                                   21 0 22 2 6 23 24 25 26 0 6
                                                   0 27 0 7 0 28 2 7 0 6 11 29
                                                   2 9 0 7 0 30 2 9 0 0 0 31 2
                                                   34 32 33 9 35 1 7 0 6 37 2 7
                                                   0 0 0 38 2 39 21 0 0 40 2 9
                                                   0 0 0 41 0 9 0 42 2 9 0 0 0
                                                   43 2 9 44 0 7 45 1 9 21 0 46
                                                   2 7 0 0 0 47 2 9 0 48 0 49 2
                                                   7 23 24 25 50 2 9 0 0 7 51 2
                                                   9 44 0 0 52 2 33 0 9 0 53 2
                                                   7 0 0 0 54 0 0 6 55 1 9 7 0
                                                   56 2 7 6 0 6 57 1 6 21 0 58
                                                   1 17 0 0 59 2 17 0 0 0 60 1
                                                   17 11 0 61 2 11 21 0 0 62 2
                                                   64 9 63 17 65 1 7 6 0 66 1 9
                                                   11 0 67 1 6 68 25 69 1 70 17
                                                   0 71 1 70 74 0 75 2 17 0 0 0
                                                   76 2 79 0 9 78 80 0 6 0 81 1
                                                   6 44 0 82 1 0 79 9 83 0 6 0
                                                   85 1 6 0 39 86 1 6 68 25 87
                                                   2 89 79 88 70 90 1 9 7 0 91
                                                   1 7 21 0 92 1 9 93 0 94 2 97
                                                   79 79 96 98 1 9 0 7 99 1 7
                                                   93 0 100 2 103 79 101 102
                                                   104 2 97 79 79 79 105 1 17 0
                                                   0 107 1 70 11 0 108 1 17 6 0
                                                   109 2 6 44 0 0 110 2 17 0 6
                                                   0 111 2 9 0 7 11 112 1 9 0 0
                                                   113 2 7 0 0 11 114 2 7 44 0
                                                   0 115 1 7 44 0 116 2 0 32 33
                                                   9 36 0 0 6 55 1 0 79 9 95 1
                                                   0 79 9 83 1 0 79 9 106)))))
           '|lookupComplete|)) 
