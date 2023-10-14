
(SDEFUN |PFBR;hensel|
        ((|pp| |SparseUnivariatePolynomial| S) (|vv| |VarSet|) (|r| R)
         (|factors| |List| #1=(|SparseUnivariatePolynomial| S))
         ($ |Union|
          (|Record| (|:| |fctrs| (|List| (|SparseUnivariatePolynomial| S))))
          "failed"))
        (SPROG
         ((|n| (|PositiveInteger|)) (|totdegree| (|Integer|)) (#2=#:G182 NIL)
          (#3=#:G181 #4=(|Integer|)) (#5=#:G183 #4#) (#6=#:G185 NIL)
          (#7=#:G184 #4#) (#8=#:G186 #4#) (#9=#:G207 NIL) (|u| NIL)
          (#10=#:G206 NIL) (|u1| NIL) (#11=#:G195 NIL)
          (|foundFactors| (|List| (|SparseUnivariatePolynomial| S)))
          (|origFactors| (|List| (|SparseUnivariatePolynomial| S)))
          (|proddegree| #12=(|Integer|)) (#13=#:G175 NIL)
          (#14=#:G174 #15=(|Integer|)) (#16=#:G176 #15#) (#17=#:G205 NIL)
          (|pp1| (|Union| (|SparseUnivariatePolynomial| S) "failed"))
          (#18=#:G203 NIL) (|a| NIL) (#19=#:G204 NIL) (|c| NIL)
          (#20=#:G201 NIL) (#21=#:G202 NIL) (|b| NIL) (#22=#:G200 NIL)
          (|step| (|Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
          (|Ecart| (|Union| (|SparseUnivariatePolynomial| S) "failed"))
          (#23=#:G164 NIL) (#24=#:G163 #1#) (#25=#:G165 #1#) (#26=#:G199 NIL)
          (#27=#:G103 NIL) (|pn| (S)) (|prime| (S)) (#28=#:G134 NIL)
          (#29=#:G133 #12#) (#30=#:G135 #12#) (#31=#:G198 NIL) (#32=#:G197 NIL)
          (|f| NIL) (#33=#:G196 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |origFactors|
                  (PROGN
                   (LETT #33# NIL . #34=(|PFBR;hensel|))
                   (SEQ (LETT |f| NIL . #34#) (LETT #32# |factors| . #34#) G190
                        (COND
                         ((OR (ATOM #32#)
                              (PROGN (LETT |f| (CAR #32#) . #34#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #33#
                                (CONS
                                 (SPADCALL
                                  (CONS #'|PFBR;hensel!0| (VECTOR $ |r| |vv|))
                                  |f| (QREFELT $ 13))
                                 #33#)
                                . #34#)))
                        (LETT #32# (CDR #32#) . #34#) (GO G190) G191
                        (EXIT (NREVERSE #33#))))
                  . #34#)
            (LETT |totdegree| 0 . #34#)
            (LETT |proddegree|
                  (PROGN
                   (LETT #28# NIL . #34#)
                   (SEQ (LETT |u| NIL . #34#)
                        (LETT #31# (SPADCALL |pp| (QREFELT $ 15)) . #34#) G190
                        (COND
                         ((OR (ATOM #31#)
                              (PROGN (LETT |u| (CAR #31#) . #34#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #30# (SPADCALL |u| |vv| (QREFELT $ 17))
                                 . #34#)
                           (COND (#28# (LETT #29# (MAX #29# #30#) . #34#))
                                 ('T
                                  (PROGN
                                   (LETT #29# #30# . #34#)
                                   (LETT #28# 'T . #34#)))))))
                        (LETT #31# (CDR #31#) . #34#) (GO G190) G191
                        (EXIT NIL))
                   (COND (#28# #29#) ('T (|IdentityError| '|max|))))
                  . #34#)
            (LETT |n| 1 . #34#)
            (LETT |prime|
                  (SPADCALL (SPADCALL |vv| (QREFELT $ 18))
                            (SPADCALL |r| (QREFELT $ 19)) (QREFELT $ 20))
                  . #34#)
            (LETT |foundFactors| NIL . #34#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |totdegree| |proddegree| (QREFELT $ 23)))
                   (GO G191)))
                 (SEQ (LETT |pn| (SPADCALL |prime| |n| (QREFELT $ 25)) . #34#)
                      (LETT |Ecart|
                            (SPADCALL
                             (SPADCALL |pp|
                                       (PROGN
                                        (LETT #23# NIL . #34#)
                                        (SEQ (LETT #27# NIL . #34#)
                                             (LETT #26# |factors| . #34#) G190
                                             (COND
                                              ((OR (ATOM #26#)
                                                   (PROGN
                                                    (LETT #27# (CAR #26#)
                                                          . #34#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #25# #27# . #34#)
                                                (COND
                                                 (#23#
                                                  (LETT #24#
                                                        (SPADCALL #24# #25#
                                                                  (QREFELT $
                                                                           26))
                                                        . #34#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #24# #25# . #34#)
                                                   (LETT #23# 'T . #34#)))))))
                                             (LETT #26# (CDR #26#) . #34#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#23# #24#)
                                              ('T (|spadConstant| $ 27))))
                                       (QREFELT $ 28))
                             |pn| (QREFELT $ 30))
                            . #34#)
                      (EXIT
                       (COND
                        ((QEQCAR |Ecart| 1)
                         (|error| "failed lifting in hensel in PFBR"))
                        ((SPADCALL (QCDR |Ecart|) (QREFELT $ 31))
                         (PROGN
                          (LETT #11#
                                (CONS 0
                                      (LIST (APPEND |foundFactors| |factors|)))
                                . #34#)
                          (GO #35=#:G194)))
                        ('T
                         (SEQ
                          (LETT |step|
                                (SPADCALL |origFactors|
                                          (SPADCALL
                                           (CONS #'|PFBR;hensel!1|
                                                 (VECTOR $ |r| |vv|))
                                           (QCDR |Ecart|) (QREFELT $ 13))
                                          (QREFELT $ 35))
                                . #34#)
                          (EXIT
                           (COND
                            ((QEQCAR |step| 1)
                             (PROGN
                              (LETT #11# (CONS 1 "failed") . #34#)
                              (GO #35#)))
                            ('T
                             (SEQ
                              (LETT |factors|
                                    (PROGN
                                     (LETT #22# NIL . #34#)
                                     (SEQ (LETT |b| NIL . #34#)
                                          (LETT #21# (QCDR |step|) . #34#)
                                          (LETT |a| NIL . #34#)
                                          (LETT #20# |factors| . #34#) G190
                                          (COND
                                           ((OR (ATOM #20#)
                                                (PROGN
                                                 (LETT |a| (CAR #20#) . #34#)
                                                 NIL)
                                                (ATOM #21#)
                                                (PROGN
                                                 (LETT |b| (CAR #21#) . #34#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #22#
                                                  (CONS
                                                   (SPADCALL |a|
                                                             (SPADCALL |b| |pn|
                                                                       (QREFELT
                                                                        $ 36))
                                                             (QREFELT $ 37))
                                                   #22#)
                                                  . #34#)))
                                          (LETT #20#
                                                (PROG1 (CDR #20#)
                                                  (LETT #21# (CDR #21#)
                                                        . #34#))
                                                . #34#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #22#))))
                                    . #34#)
                              (SEQ (LETT |c| NIL . #34#)
                                   (LETT #19# |origFactors| . #34#)
                                   (LETT |a| NIL . #34#)
                                   (LETT #18# |factors| . #34#) G190
                                   (COND
                                    ((OR (ATOM #18#)
                                         (PROGN
                                          (LETT |a| (CAR #18#) . #34#)
                                          NIL)
                                         (ATOM #19#)
                                         (PROGN
                                          (LETT |c| (CAR #19#) . #34#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |pp1|
                                          (SPADCALL |pp| |a| (QREFELT $ 38))
                                          . #34#)
                                    (EXIT
                                     (COND ((QEQCAR |pp1| 1) "next")
                                           ('T
                                            (SEQ
                                             (LETT |pp| (QCDR |pp1|) . #34#)
                                             (LETT |proddegree|
                                                   (- |proddegree|
                                                      (PROGN
                                                       (LETT #13# NIL . #34#)
                                                       (SEQ
                                                        (LETT |u| NIL . #34#)
                                                        (LETT #17#
                                                              (SPADCALL |a|
                                                                        (QREFELT
                                                                         $ 15))
                                                              . #34#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #17#)
                                                              (PROGN
                                                               (LETT |u|
                                                                     (CAR #17#)
                                                                     . #34#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (PROGN
                                                           (LETT #16#
                                                                 (SPADCALL |u|
                                                                           |vv|
                                                                           (QREFELT
                                                                            $
                                                                            17))
                                                                 . #34#)
                                                           (COND
                                                            (#13#
                                                             (LETT #14#
                                                                   (MAX #14#
                                                                        #16#)
                                                                   . #34#))
                                                            ('T
                                                             (PROGN
                                                              (LETT #14# #16#
                                                                    . #34#)
                                                              (LETT #13# 'T
                                                                    . #34#)))))))
                                                        (LETT #17# (CDR #17#)
                                                              . #34#)
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                       (COND (#13# #14#)
                                                             ('T
                                                              (|IdentityError|
                                                               '|max|)))))
                                                   . #34#)
                                             (LETT |factors|
                                                   (SPADCALL |a| |factors|
                                                             (QREFELT $ 40))
                                                   . #34#)
                                             (LETT |origFactors|
                                                   (SPADCALL |c| |origFactors|
                                                             (QREFELT $ 40))
                                                   . #34#)
                                             (EXIT
                                              (LETT |foundFactors|
                                                    (CONS |a| |foundFactors|)
                                                    . #34#)))))))
                                   (LETT #18#
                                         (PROG1 (CDR #18#)
                                           (LETT #19# (CDR #19#) . #34#))
                                         . #34#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND
                                ((< (LENGTH |factors|) 2)
                                 (PROGN
                                  (LETT #11#
                                        (CONS 0
                                              (LIST
                                               (COND
                                                ((NULL |factors|)
                                                 |foundFactors|)
                                                ('T
                                                 (CONS |pp| |foundFactors|)))))
                                        . #34#)
                                  (GO #35#)))
                                ('T
                                 (SEQ
                                  (LETT |totdegree|
                                        (PROGN
                                         (LETT #2# NIL . #34#)
                                         (SEQ (LETT |u1| NIL . #34#)
                                              (LETT #10# |factors| . #34#) G190
                                              (COND
                                               ((OR (ATOM #10#)
                                                    (PROGN
                                                     (LETT |u1| (CAR #10#)
                                                           . #34#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (PROGN
                                                 (LETT #5#
                                                       (PROGN
                                                        (LETT #6# NIL . #34#)
                                                        (SEQ
                                                         (LETT |u| NIL . #34#)
                                                         (LETT #9#
                                                               (SPADCALL |u1|
                                                                         (QREFELT
                                                                          $
                                                                          15))
                                                               . #34#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #9#)
                                                               (PROGN
                                                                (LETT |u|
                                                                      (CAR #9#)
                                                                      . #34#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #8#
                                                                  (SPADCALL |u|
                                                                            |vv|
                                                                            (QREFELT
                                                                             $
                                                                             17))
                                                                  . #34#)
                                                            (COND
                                                             (#6#
                                                              (LETT #7#
                                                                    (MAX #7#
                                                                         #8#)
                                                                    . #34#))
                                                             ('T
                                                              (PROGN
                                                               (LETT #7# #8#
                                                                     . #34#)
                                                               (LETT #6# 'T
                                                                     . #34#)))))))
                                                         (LETT #9# (CDR #9#)
                                                               . #34#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                        (COND (#6# #7#)
                                                              ('T
                                                               (|IdentityError|
                                                                '|max|))))
                                                       . #34#)
                                                 (COND
                                                  (#2#
                                                   (LETT #3# (+ #3# #5#)
                                                         . #34#))
                                                  ('T
                                                   (PROGN
                                                    (LETT #3# #5# . #34#)
                                                    (LETT #2# 'T . #34#)))))))
                                              (LETT #10# (CDR #10#) . #34#)
                                              (GO G190) G191 (EXIT NIL))
                                         (COND (#2# #3#) ('T 0)))
                                        . #34#)
                                  (EXIT
                                   (LETT |n| (+ |n| 1) . #34#)))))))))))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #35# (EXIT #11#)))) 

(SDEFUN |PFBR;hensel!1| ((|z1| NIL) ($$ NIL))
        (PROG (|vv| |r| $)
          (LETT |vv| (QREFELT $$ 2) . #1=(|PFBR;hensel|))
          (LETT |r| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |vv| |r| (QREFELT $ 10)))))) 

(SDEFUN |PFBR;hensel!0| ((|z1| NIL) ($$ NIL))
        (PROG (|vv| |r| $)
          (LETT |vv| (QREFELT $$ 2) . #1=(|PFBR;hensel|))
          (LETT |r| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |vv| |r| (QREFELT $ 10)))))) 

(SDEFUN |PFBR;factorSFBRlcUnitInner|
        ((|lvpp| |List| |VarSet|) (|pp| |SparseUnivariatePolynomial| S) (|r| R)
         ($ |Union| (|Factored| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((#1=#:G235 NIL) (|u| NIL) (#2=#:G234 NIL)
          (|hen|
           (|Union|
            (|Record| (|:| |fctrs| (|List| (|SparseUnivariatePolynomial| S))))
            "failed"))
          (|factors| (|List| (|SparseUnivariatePolynomial| S))) (#3=#:G233 NIL)
          (|uu| NIL) (#4=#:G232 NIL)
          (|fSame| (|Factored| (|SparseUnivariatePolynomial| S)))
          (#5=#:G231 NIL) (#6=#:G230 NIL)
          (|fDown| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|ppR| (|SparseUnivariatePolynomial| S)))
         (SEQ
          (LETT |ppR|
                (SPADCALL
                 (CONS #'|PFBR;factorSFBRlcUnitInner!0| (VECTOR |r| $ |lvpp|))
                 |pp| (QREFELT $ 13))
                . #7=(|PFBR;factorSFBRlcUnitInner|))
          (EXIT
           (COND
            ((OR
              (< (SPADCALL |ppR| (QREFELT $ 45))
                 (SPADCALL |pp| (QREFELT $ 45)))
              (SPADCALL
               (SPADCALL
                (SPADCALL |ppR| (SPADCALL |ppR| (QREFELT $ 46)) (QREFELT $ 47))
                (QREFELT $ 45))
               0 (QREFELT $ 48)))
             (CONS 1 "failed"))
            ('T
             (SEQ
              (LETT |factors|
                    (COND
                     ((NULL (CDR |lvpp|))
                      (SEQ
                       (LETT |fDown|
                             (SPADCALL
                              (SPADCALL (ELT $ 49) |ppR| (QREFELT $ 53))
                              (QREFELT $ 55))
                             . #7#)
                       (EXIT
                        (CONS
                         (|PFBR;raise|
                          (SPADCALL (SPADCALL |fDown| (QREFELT $ 57))
                                    (QVELT
                                     (|SPADfirst|
                                      (SPADCALL |fDown| (QREFELT $ 61)))
                                     1)
                                    (QREFELT $ 62))
                          $)
                         (PROGN
                          (LETT #6# NIL . #7#)
                          (SEQ (LETT |u| NIL . #7#)
                               (LETT #5#
                                     (CDR (SPADCALL |fDown| (QREFELT $ 61)))
                                     . #7#)
                               G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |u| (CAR #5#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS (|PFBR;raise| (QVELT |u| 1) $)
                                             #6#)
                                       . #7#)))
                               (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                               (EXIT (NREVERSE #6#))))))))
                     (#8='T
                      (SEQ
                       (LETT |fSame|
                             (SPADCALL (CDR |lvpp|) |ppR| (QREFELT $ 64))
                             . #7#)
                       (EXIT
                        (CONS
                         (SPADCALL (SPADCALL |fSame| (QREFELT $ 65))
                                   (QVELT
                                    (|SPADfirst|
                                     (SPADCALL |fSame| (QREFELT $ 68)))
                                    1)
                                   (QREFELT $ 26))
                         (PROGN
                          (LETT #4# NIL . #7#)
                          (SEQ (LETT |uu| NIL . #7#)
                               (LETT #3#
                                     (CDR (SPADCALL |fSame| (QREFELT $ 68)))
                                     . #7#)
                               G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |uu| (CAR #3#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4# (CONS (QVELT |uu| 1) #4#) . #7#)))
                               (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                               (EXIT (NREVERSE #4#)))))))))
                    . #7#)
              (EXIT
               (COND
                ((EQL (LENGTH |factors|) 1)
                 (CONS 0
                       (SPADCALL (|spadConstant| $ 27)
                                 (LIST (VECTOR (CONS 2 "irred") |pp| 1))
                                 (QREFELT $ 69))))
                (#8#
                 (SEQ
                  (LETT |hen|
                        (|PFBR;hensel| |pp| (|SPADfirst| |lvpp|) |r| |factors|
                         $)
                        . #7#)
                  (EXIT
                   (COND ((QEQCAR |hen| 1) (CONS 1 "failed"))
                         (#8#
                          (CONS 0
                                (SPADCALL (|spadConstant| $ 27)
                                          (PROGN
                                           (LETT #2# NIL . #7#)
                                           (SEQ (LETT |u| NIL . #7#)
                                                (LETT #1# (QCAR (QCDR |hen|))
                                                      . #7#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #1#)
                                                      (PROGN
                                                       (LETT |u| (CAR #1#)
                                                             . #7#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #2#
                                                        (CONS
                                                         (VECTOR
                                                          (CONS 2 "irred") |u|
                                                          1)
                                                         #2#)
                                                        . #7#)))
                                                (LETT #1# (CDR #1#) . #7#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#))))
                                          (QREFELT $ 69))))))))))))))))) 

(SDEFUN |PFBR;factorSFBRlcUnitInner!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpp| $ |r|)
          (LETT |lvpp| (QREFELT $$ 2) . #1=(|PFBR;factorSFBRlcUnitInner|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |r| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z1| (SPADCALL |lvpp| (QREFELT $ 44)) |r|
                      (QREFELT $ 10)))))) 

(SDEFUN |PFBR;factorSFBRlcUnit;LSupF;3|
        ((|lvpp| |List| |VarSet|) (|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G244 NIL) (|val| (R)) (|val1| (|Union| R "failed"))
          (|tempAns|
           (|Union| (|Factored| (|SparseUnivariatePolynomial| S)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |val| (|spadConstant| $ 70)
                  . #2=(|PFBR;factorSFBRlcUnit;LSupF;3|))
            (EXIT
             (SEQ G190 (COND ((NULL 'T) (GO G191)))
                  (SEQ
                   (LETT |tempAns|
                         (|PFBR;factorSFBRlcUnitInner| |lvpp| |pp| |val| $)
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |tempAns| 1)
                      (SEQ (LETT |val1| (SPADCALL |val| (QREFELT $ 71)) . #2#)
                           (EXIT
                            (COND
                             ((QEQCAR |val1| 1)
                              (|error|
                               "at this point, we know we have a finite field"))
                             ('T (LETT |val| (QCDR |val1|) . #2#))))))
                     ('T
                      (PROGN
                       (LETT #1# (QCDR |tempAns|) . #2#)
                       (GO #3=#:G243))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |PFBR;factorSFBRlcUnit;LSupF;4|
        ((|lvpp| |List| |VarSet|) (|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G249 NIL) (|val| (R))
          (|tempAns|
           (|Union| (|Factored| (|SparseUnivariatePolynomial| S)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |val| (SPADCALL (QREFELT $ 72))
                  . #2=(|PFBR;factorSFBRlcUnit;LSupF;4|))
            (EXIT
             (SEQ G190 (COND ((NULL 'T) (GO G191)))
                  (SEQ
                   (LETT |tempAns|
                         (|PFBR;factorSFBRlcUnitInner| |lvpp| |pp| |val| $)
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |tempAns| 1)
                      (LETT |val| (SPADCALL (QREFELT $ 72)) . #2#))
                     ('T
                      (PROGN
                       (LETT #1# (QCDR |tempAns|) . #2#)
                       (GO #3=#:G248))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |PFBR;randomR;R;5| (($ R)) (SPADCALL (QREFELT $ 73))) 

(SDEFUN |PFBR;randomR;R;6| (($ R)) (SPADCALL (|random|) (QREFELT $ 74))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;7|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S) (|v| |VarSet|)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((#1=#:G272 NIL) (|w| NIL) (#2=#:G271 NIL)
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
          (#3=#:G270 NIL) (|u| NIL) (#4=#:G269 NIL))
         (SEQ
          (LETT |lpolysR|
                (PROGN
                 (LETT #4# NIL . #5=(|PFBR;bivariateSLPEBR;LSupVarSetU;7|))
                 (SEQ (LETT |u| NIL . #5#) (LETT #3# |lpolys| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS (SPADCALL (ELT $ 75) |u| (QREFELT $ 79))
                                    #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |ppR| (SPADCALL (ELT $ 75) |pp| (QREFELT $ 79)) . #5#)
          (LETT |ans| (SPADCALL |lpolysR| |ppR| (QREFELT $ 80)) . #5#)
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
                                         #'|PFBR;bivariateSLPEBR;LSupVarSetU;7!0|
                                         (VECTOR $ |v|))
                                        |w| (QREFELT $ 85))
                                       #2#)
                                      . #5#)))
                              (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;7!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;bivariateSLPEBR;LSupVarSetU;7|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 82)))))) 

(SDEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;8|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S) (|v| |VarSet|)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPADCALL |lpolys| |pp| (QREFELT $ 89))) 

(SDEFUN |PFBR;chooseFSQViableSubstitutions|
        ((|lvpp| |List| |VarSet|) (|pp| |SparseUnivariatePolynomial| S)
         ($ |Record| (|:| |substnsField| (|List| R))
          (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
        (SPROG
         ((#1=#:G287 NIL) (|ppR| (|SparseUnivariatePolynomial| R))
          (|substns| (|List| R)) (#2=#:G289 NIL) (|v| NIL) (#3=#:G288 NIL))
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
                                (LETT #3# (CONS (SPADCALL (QREFELT $ 72)) #3#)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL (SPADCALL |pp| (QREFELT $ 90)) |lvpp| |substns|
                                (QREFELT $ 92))
                      (QREFELT $ 93))
                     "next")
                    ('T
                     (SEQ
                      (LETT |ppR|
                            (SPADCALL
                             (CONS #'|PFBR;chooseFSQViableSubstitutions!0|
                                   (VECTOR $ |substns| |lvpp|))
                             |pp| (QREFELT $ 53))
                            . #4#)
                      (EXIT
                       (COND
                        ((OR
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |ppR| (SPADCALL |ppR| (QREFELT $ 94))
                                      (QREFELT $ 95))
                            (QREFELT $ 96))
                           0 (QREFELT $ 48))
                          (NULL
                           (SPADCALL (SPADCALL |ppR| (QREFELT $ 98))
                                     (QREFELT $ 99))))
                         "next")
                        ('T
                         (PROGN
                          (LETT #1# |$NoValue| . #4#)
                          (GO #5=#:G284))))))))))
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
            (SPADCALL (SPADCALL |z1| |lvpp| |substns| (QREFELT $ 92))
                      (QREFELT $ 49)))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions|
        ((|lvpolys| |List| |VarSet|)
         (|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Record| (|:| |substnsField| (|List| R))
          (|:| |lpolysRField| (|List| (|SparseUnivariatePolynomial| R)))
          (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
        (SPROG
         ((|ppR| (|SparseUnivariatePolynomial| R)) (#1=#:G312 NIL)
          (|uu| #2=(|List| (|SparseUnivariatePolynomial| R))) (#3=#:G311 NIL)
          (#4=#:G299 NIL) (#5=#:G298 #6=(|Boolean|)) (#7=#:G300 #6#)
          (#8=#:G318 NIL) (|v| NIL) (|lpolysR| #2#) (#9=#:G317 NIL) (|u| NIL)
          (#10=#:G316 NIL) (#11=#:G293 NIL) (#12=#:G292 #13=(|Boolean|))
          (#14=#:G294 #13#) (#15=#:G315 NIL) (|substns| (|List| R))
          (#16=#:G314 NIL) (#17=#:G313 NIL))
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
                                      (CONS (SPADCALL (QREFELT $ 72)) #17#)
                                      . #18#)))
                              (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                              (EXIT (NREVERSE #17#))))
                        . #18#)
                  (EXIT
                   (COND
                    ((OR
                      (SPADCALL
                       (SPADCALL (SPADCALL |pp| (QREFELT $ 90)) |lvpolys|
                                 |substns| (QREFELT $ 92))
                       (QREFELT $ 93))
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
                                      (SPADCALL (SPADCALL |u| (QREFELT $ 90))
                                                |lvpolys| |substns|
                                                (QREFELT $ 92))
                                      (QREFELT $ 93))
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
                                            |u| (QREFELT $ 53))
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
                                                            |v| (QREFELT $ 95))
                                                  (QREFELT $ 96))
                                                 0 (QREFELT $ 48))
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
                                  (GO #19=#:G302)))
                                ('T (LETT |uu| (CDR |uu|) . #18#)))))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #19# (EXIT #3#))
                      (COND ((NULL (NULL |uu|)) (EXIT "next")))
                      (EXIT
                       (PROGN
                        (LETT #1# |$NoValue| . #18#)
                        (GO #20=#:G307))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #20# (EXIT #1#))
          (LETT |ppR|
                (SPADCALL
                 (CONS #'|PFBR;chooseSLPEViableSubstitutions!1|
                       (VECTOR $ |substns| |lvpolys|))
                 |pp| (QREFELT $ 53))
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
            (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 92))
                      (QREFELT $ 49)))))) 

(SDEFUN |PFBR;chooseSLPEViableSubstitutions!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lvpolys| |substns| $)
          (LETT |lvpolys| (QREFELT $$ 2)
                . #1=(|PFBR;chooseSLPEViableSubstitutions|))
          (LETT |substns| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 92))
                      (QREFELT $ 49)))))) 

(SDEFUN |PFBR;raise|
        ((|supR| |SparseUnivariatePolynomial| R)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL (ELT $ 19) |supR| (QREFELT $ 102))) 

(SDEFUN |PFBR;lower|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| R))
        (SPADCALL (ELT $ 49) |pp| (QREFELT $ 53))) 

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
          (#3=#:G361 NIL) (|uu| NIL) (#4=#:G360 NIL) (#5=#:G349 NIL)
          (|ppR| (|SparseUnivariatePolynomial| R))
          (|lpolysR| (|List| (|SparseUnivariatePolynomial| R))) (#6=#:G359 NIL)
          (|u| NIL) (#7=#:G358 NIL) (#8=#:G357 NIL)
          (|pp1|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| S)))
          (#9=#:G356 NIL)
          (|ans|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| S))))
          (#10=#:G354 NIL) (|a| NIL) (#11=#:G355 NIL) (|a1| NIL)
          (#12=#:G353 NIL) (|d| (|NonNegativeInteger|)) (|ans1| #2#)
          (#13=#:G352 NIL) (|m| (|List| |VarSet|)) (#14=#:G351 NIL)
          (#15=#:G350 NIL) (|v| (|VarSet|)))
         (SEQ
          (EXIT
           (COND
            ((NULL
              (NULL
               (LETT |m| (SPADCALL |lvpp| |lvpolys| (QREFELT $ 103))
                     . #16=(|PFBR;SLPEBR|))))
             (SEQ (LETT |v| (|SPADfirst| |m|) . #16#)
                  (LETT |lvpp| (SPADCALL |v| |lvpp| (QREFELT $ 104)) . #16#)
                  (LETT |pp1|
                        (SPADCALL
                         (SPADCALL (CONS #'|PFBR;SLPEBR!0| (VECTOR $ |v|)) |pp|
                                   (QREFELT $ 109))
                         (QREFELT $ 111))
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
                                (LETT #15# (CONS (|spadConstant| $ 112) #15#)
                                      . #16#)))
                              (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                              (EXIT (NREVERSE #15#))))
                        . #16#)
                  (SEQ (LETT |m| NIL . #16#)
                       (LETT #13# (NREVERSE (SPADCALL |pp1| (QREFELT $ 114)))
                             . #16#)
                       G190
                       (COND
                        ((OR (ATOM #13#)
                             (PROGN (LETT |m| (CAR #13#) . #16#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ans1|
                              (|PFBR;SLPEBR| |lpolys| |lvpolys|
                               (SPADCALL |m| (QREFELT $ 115)) |lvpp| $)
                              . #16#)
                        (EXIT
                         (COND
                          ((QEQCAR |ans1| 1)
                           (PROGN
                            (LETT #5# (CONS 1 "failed") . #16#)
                            (GO #17=#:G348)))
                          ('T
                           (SEQ
                            (LETT |d| (SPADCALL |m| (QREFELT $ 116)) . #16#)
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
                                                (LETT |a| (CAR #10#) . #16#)
                                                NIL)
                                               (ATOM #11#)
                                               (PROGN
                                                (LETT |a1| (CAR #11#) . #16#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #12#
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |a1| |d|
                                                             (QREFELT $ 117))
                                                   |a| (QREFELT $ 118))
                                                  #12#)
                                                 . #16#)))
                                         (LETT #10#
                                               (PROG1 (CDR #10#)
                                                 (LETT #11# (CDR #11#) . #16#))
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
                                         (SPADCALL |pp1| (QREFELT $ 111))
                                         (QREFELT $ 121))
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
                                     (SPADCALL (ELT $ 49) |u| (QREFELT $ 53))
                                     #7#)
                                    . #16#)))
                            (LETT #6# (CDR #6#) . #16#) (GO G190) G191
                            (EXIT (NREVERSE #7#))))
                      . #16#)
                (LETT |ppR| (SPADCALL (ELT $ 49) |pp| (QREFELT $ 53)) . #16#)
                (LETT |ansR| (SPADCALL |lpolysR| |ppR| (QREFELT $ 122)) . #16#)
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
                                        (SPADCALL (ELT $ 19) |uu|
                                                  (QREFELT $ 102))
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
                      (SPADCALL (QVELT |cVS| 1) (QVELT |cVS| 2)
                                (QREFELT $ 122))
                      . #16#)
                (EXIT
                 (COND ((QEQCAR |ansR| 1) (CONS 1 "failed"))
                       ((EQL (LENGTH |lvpolys|) 1)
                        (SPADCALL |lpolys| |pp| (|SPADfirst| |lvpolys|)
                                  (QREFELT $ 87)))
                       (#18# (SPADCALL |lpolys| |pp| (QREFELT $ 89)))))))))))
          #17# (EXIT #5#)))) 

(SDEFUN |PFBR;SLPEBR!1| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;SLPEBR|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 81)))))) 

(SDEFUN |PFBR;SLPEBR!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;SLPEBR|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 105)))))) 

(SDEFUN |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;14|
        ((|lpolys| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPROG
         ((|lvpp| #1=(|List| |VarSet|)) (#2=#:G375 NIL) (|z| NIL)
          (#3=#:G374 NIL) (|lvpolys| #1#) (#4=#:G373 NIL) (#5=#:G372 NIL)
          (#6=#:G371 NIL) (|u| NIL) (#7=#:G370 NIL) (#8=#:G369 NIL)
          (#9=#:G368 NIL))
         (SEQ
          (COND
           ((SPADCALL |pp| (|spadConstant| $ 124) (QREFELT $ 125))
            (CONS 0
                  (PROGN
                   (LETT #9# NIL
                         . #10=(|PFBR;solveLinearPolynomialEquationByRecursion;LSupU;14|))
                   (SEQ (LETT |u| NIL . #10#) (LETT #8# |lpolys| . #10#) G190
                        (COND
                         ((OR (ATOM #8#)
                              (PROGN (LETT |u| (CAR #8#) . #10#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #9# (CONS (|spadConstant| $ 124) #9#) . #10#)))
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
                                                 (SPADCALL |u| (QREFELT $ 15))
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
                                                              (QREFELT $ 126))
                                                    #5#)
                                                   . #10#)))
                                           (LETT #4# (CDR #4#) . #10#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #5#))))
                                     (QREFELT $ 127))
                                    #7#)
                                   . #10#)))
                           (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                           (EXIT (NREVERSE #7#))))
                     (QREFELT $ 127))
                    (QREFELT $ 128))
                   . #10#)
             (LETT |lvpp|
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #3# NIL . #10#)
                      (SEQ (LETT |z| NIL . #10#)
                           (LETT #2# (SPADCALL |pp| (QREFELT $ 15)) . #10#)
                           G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |z| (CAR #2#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS (SPADCALL |z| (QREFELT $ 126)) #3#)
                                   . #10#)))
                           (LETT #2# (CDR #2#) . #10#) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     (QREFELT $ 127))
                    (QREFELT $ 128))
                   . #10#)
             (EXIT (|PFBR;SLPEBR| |lpolys| |lvpolys| |pp| |lvpp| $)))))))) 

(SDEFUN |PFBR;factorByRecursion;SupF;15|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G380 NIL) (|c| (S)) (|lv| (|List| |VarSet|)) (#2=#:G388 NIL)
          (|z| NIL) (#3=#:G387 NIL))
         (SEQ
          (LETT |lv|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL . #4=(|PFBR;factorByRecursion;SupF;15|))
                   (SEQ (LETT |z| NIL . #4#)
                        (LETT #2# (SPADCALL |pp| (QREFELT $ 15)) . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |z| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3# (CONS (SPADCALL |z| (QREFELT $ 126)) #3#)
                                . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 127))
                 (QREFELT $ 128))
                . #4#)
          (EXIT
           (COND
            ((NULL |lv|)
             (SPADCALL (CONS (|function| |PFBR;raise|) $)
                       (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 130))
                       (QREFELT $ 133)))
            (#5='T
             (SEQ (LETT |c| (SPADCALL |pp| (QREFELT $ 134)) . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL |c| (QREFELT $ 135))
                     (SPADCALL (SPADCALL |pp| (QREFELT $ 137)) (ELT $ 138)
                               (QREFELT $ 141)))
                    (#5#
                     (SEQ
                      (LETT |pp|
                            (PROG2
                                (LETT #1# (SPADCALL |pp| |c| (QREFELT $ 30))
                                      . #4#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 9))
                                             #1#))
                            . #4#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |pp| (QREFELT $ 137)) (ELT $ 138)
                                  (QREFELT $ 141))
                        (SPADCALL (ELT $ 142) (SPADCALL |c| (QREFELT $ 143))
                                  (QREFELT $ 146))
                        (QREFELT $ 147)))))))))))))) 

(SDEFUN |PFBR;factorSquareFreeByRecursion;SupF;16|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#1=#:G441 NIL) (|w| NIL) (#2=#:G440 NIL) (#3=#:G399 NIL)
          (|factors| (|List| (|SparseUnivariatePolynomial| S))) (#4=#:G417 NIL)
          (|lcppPow| (S)) (|lc| (S)) (#5=#:G439 NIL) (#6=#:G438 NIL)
          (#7=#:G428 NIL) (#8=#:G427 NIL) (OK (|Boolean|))
          (|hen|
           (|Union|
            (|Record| (|:| |fctrs| (|List| (|SparseUnivariatePolynomial| S))))
            "failed"))
          (#9=#:G437 NIL) (|f| NIL) (#10=#:G436 NIL) (|lcpp1| (S))
          (|ppa| (|SparseUnivariatePolynomial| S)) (|sl| #11=(|List| R))
          (|lvppList| #12=(|List| |VarSet|)) (#13=#:G434 NIL) (|u| NIL)
          (#14=#:G435 NIL) (|v| NIL)
          (|ppAdjust| (|SparseUnivariatePolynomial| S)) (#15=#:G433 NIL)
          (#16=#:G432 NIL) (|lcpp0| (S)) (|oldnfact| (|NonNegativeInteger|))
          (#17=#:G429 NIL) (|nfact| (|NonNegativeInteger|))
          (|factorsR| (|Factored| (|SparseUnivariatePolynomial| R)))
          (|cVS|
           (|Record| (|:| |substnsField| #11#)
                     (|:| |ppRField| (|SparseUnivariatePolynomial| R))))
          (|lcpp| (S)) (|lv| #12#) (#18=#:G431 NIL) (|z| NIL) (#19=#:G430 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lv|
                  (SPADCALL
                   (SPADCALL
                    (PROGN
                     (LETT #19# NIL
                           . #20=(|PFBR;factorSquareFreeByRecursion;SupF;16|))
                     (SEQ (LETT |z| NIL . #20#)
                          (LETT #18# (SPADCALL |pp| (QREFELT $ 15)) . #20#)
                          G190
                          (COND
                           ((OR (ATOM #18#)
                                (PROGN (LETT |z| (CAR #18#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #19#
                                  (CONS (SPADCALL |z| (QREFELT $ 126)) #19#)
                                  . #20#)))
                          (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #19#))))
                    (QREFELT $ 127))
                   (QREFELT $ 128))
                  . #20#)
            (EXIT
             (COND
              ((NULL |lv|)
               (SPADCALL (CONS (|function| |PFBR;raise|) $)
                         (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 130))
                         (QREFELT $ 133)))
              ((SPADCALL (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 90)) . #20#)
                         (QREFELT $ 135))
               (SPADCALL |lv| |pp| (QREFELT $ 64)))
              ('T
               (SEQ (LETT |oldnfact| 999999 . #20#)
                    (SEQ
                     (EXIT
                      (SEQ G190 (COND ((NULL 'T) (GO G191)))
                           (SEQ
                            (LETT |cVS|
                                  (|PFBR;chooseFSQViableSubstitutions| |lv|
                                   |pp| $)
                                  . #20#)
                            (LETT |factorsR|
                                  (SPADCALL (QCDR |cVS|) (QREFELT $ 55))
                                  . #20#)
                            (LETT |nfact| (SPADCALL |factorsR| (QREFELT $ 149))
                                  . #20#)
                            (EXIT
                             (COND
                              ((EQL |nfact| 1)
                               (PROGN
                                (LETT #17#
                                      (SPADCALL (|spadConstant| $ 27)
                                                (LIST
                                                 (VECTOR (CONS 2 "irred") |pp|
                                                         1))
                                                (QREFELT $ 69))
                                      . #20#)
                                (GO #21=#:G426)))
                              ((SPADCALL |nfact| |oldnfact| (QREFELT $ 48))
                               "next")
                              ('T
                               (SEQ (LETT |oldnfact| |nfact| . #20#)
                                    (LETT |lcpp0|
                                          (SPADCALL |lcpp| |lv| (QCAR |cVS|)
                                                    (QREFELT $ 92))
                                          . #20#)
                                    (LETT |factors|
                                          (PROGN
                                           (LETT #16# NIL . #20#)
                                           (SEQ (LETT |u| NIL . #20#)
                                                (LETT #15#
                                                      (SPADCALL |factorsR|
                                                                (QREFELT $ 61))
                                                      . #20#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #15#)
                                                      (PROGN
                                                       (LETT |u| (CAR #15#)
                                                             . #20#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #16#
                                                        (CONS
                                                         (SPADCALL
                                                          (PROG2
                                                              (LETT #3#
                                                                    (SPADCALL
                                                                     |lcpp0|
                                                                     (SPADCALL
                                                                      (QVELT
                                                                       |u| 1)
                                                                      (QREFELT
                                                                       $ 150))
                                                                     (QREFELT $
                                                                              151))
                                                                    . #20#)
                                                              (QCDR #3#)
                                                            (|check_union|
                                                             (QEQCAR #3# 0)
                                                             (QREFELT $ 9)
                                                             #3#))
                                                          (|PFBR;raise|
                                                           (QVELT |u| 1) $)
                                                          (QREFELT $ 152))
                                                         #16#)
                                                        . #20#)))
                                                (LETT #15# (CDR #15#) . #20#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #16#))))
                                          . #20#)
                                    (LETT |ppAdjust|
                                          (SPADCALL
                                           (LETT |lcppPow|
                                                 (SPADCALL |lcpp|
                                                           (LENGTH
                                                            (CDR |factors|))
                                                           (QREFELT $ 153))
                                                 . #20#)
                                           |pp| (QREFELT $ 152))
                                          . #20#)
                                    (LETT |lvppList| |lv| . #20#)
                                    (LETT |sl| (QCAR |cVS|) . #20#)
                                    (LETT OK 'T . #20#)
                                    (SEQ
                                     (EXIT
                                      (SEQ (LETT |v| NIL . #20#)
                                           (LETT #14# (QCAR |cVS|) . #20#)
                                           (LETT |u| NIL . #20#)
                                           (LETT #13# |lv| . #20#) G190
                                           (COND
                                            ((OR (ATOM #13#)
                                                 (PROGN
                                                  (LETT |u| (CAR #13#) . #20#)
                                                  NIL)
                                                 (ATOM #14#)
                                                 (PROGN
                                                  (LETT |v| (CAR #14#) . #20#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |lvppList| (CDR |lvppList|)
                                                  . #20#)
                                            (LETT |sl| (CDR |sl|) . #20#)
                                            (LETT |ppa|
                                                  (SPADCALL
                                                   (CONS
                                                    #'|PFBR;factorSquareFreeByRecursion;SupF;16!0|
                                                    (VECTOR $ |sl| |lvppList|))
                                                   |ppAdjust| (QREFELT $ 13))
                                                  . #20#)
                                            (LETT |lcpp1|
                                                  (SPADCALL |lcpp| |lvppList|
                                                            |sl|
                                                            (QREFELT $ 92))
                                                  . #20#)
                                            (LETT |factors|
                                                  (PROGN
                                                   (LETT #10# NIL . #20#)
                                                   (SEQ (LETT |f| NIL . #20#)
                                                        (LETT #9# |factors|
                                                              . #20#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #9#)
                                                              (PROGN
                                                               (LETT |f|
                                                                     (CAR #9#)
                                                                     . #20#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #10#
                                                                (CONS
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |lcpp1|
                                                                   (SPADCALL
                                                                    |f|
                                                                    (QREFELT $
                                                                             45))
                                                                   (QREFELT $
                                                                            154))
                                                                  (SPADCALL |f|
                                                                            (QREFELT
                                                                             $
                                                                             155))
                                                                  (QREFELT $
                                                                           37))
                                                                 #10#)
                                                                . #20#)))
                                                        (LETT #9# (CDR #9#)
                                                              . #20#)
                                                        (GO G190) G191
                                                        (EXIT
                                                         (NREVERSE #10#))))
                                                  . #20#)
                                            (LETT |hen|
                                                  (|PFBR;hensel| |ppa| |u| |v|
                                                   |factors| $)
                                                  . #20#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |hen| 1)
                                               (SEQ (LETT OK 'NIL . #20#)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #8# |$NoValue|
                                                            . #20#)
                                                      (GO #22=#:G412)))))
                                              ('T
                                               (LETT |factors|
                                                     (QCAR (QCDR |hen|))
                                                     . #20#)))))
                                           (LETT #13#
                                                 (PROG1 (CDR #13#)
                                                   (LETT #14# (CDR #14#)
                                                         . #20#))
                                                 . #20#)
                                           (GO G190) G191 (EXIT NIL)))
                                     #22# (EXIT #8#))
                                    (EXIT
                                     (COND
                                      (OK
                                       (PROGN
                                        (LETT #7# |$NoValue| . #20#)
                                        (GO #23=#:G415))))))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #23# (EXIT #7#))
                    (LETT |factors|
                          (PROGN
                           (LETT #6# NIL . #20#)
                           (SEQ (LETT |w| NIL . #20#)
                                (LETT #5# |factors| . #20#) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |w| (CAR #5#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SEQ
                                          (LETT |lc|
                                                (SPADCALL |w| (QREFELT $ 134))
                                                . #20#)
                                          (LETT |lcppPow|
                                                (PROG2
                                                    (LETT #3#
                                                          (SPADCALL |lcppPow|
                                                                    |lc|
                                                                    (QREFELT $
                                                                             156))
                                                          . #20#)
                                                    (QCDR #3#)
                                                  (|check_union| (QEQCAR #3# 0)
                                                                 (QREFELT $ 9)
                                                                 #3#))
                                                . #20#)
                                          (EXIT
                                           (PROG2
                                               (LETT #4#
                                                     (SPADCALL |w| |lc|
                                                               (QREFELT $ 30))
                                                     . #20#)
                                               (QCDR #4#)
                                             (|check_union| (QEQCAR #4# 0)
                                                            (|SparseUnivariatePolynomial|
                                                             (QREFELT $ 9))
                                                            #4#))))
                                         #6#)
                                        . #20#)))
                                (LETT #5# (CDR #5#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          . #20#)
                    (COND
                     ((NULL (SPADCALL |lcppPow| (QREFELT $ 135)))
                      (EXIT
                       (|error|
                        "internal error in factorSquareFreeByRecursion"))))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (PROG2
                           (LETT #3# (SPADCALL |lcppPow| (QREFELT $ 157))
                                 . #20#)
                           (QCDR #3#)
                         (|check_union| (QEQCAR #3# 0) (QREFELT $ 9) #3#))
                       (QREFELT $ 142))
                      (PROGN
                       (LETT #2# NIL . #20#)
                       (SEQ (LETT |w| NIL . #20#) (LETT #1# |factors| . #20#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |w| (CAR #1#) . #20#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (VECTOR (CONS 2 "irred") |w| 1) #2#)
                                    . #20#)))
                            (LETT #1# (CDR #1#) . #20#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT $ 69)))))))))
          #21# (EXIT #17#)))) 

(SDEFUN |PFBR;factorSquareFreeByRecursion;SupF;16!0| ((|z| NIL) ($$ NIL))
        (PROG (|lvppList| |sl| $)
          (LETT |lvppList| (QREFELT $$ 2)
                . #1=(|PFBR;factorSquareFreeByRecursion;SupF;16|))
          (LETT |sl| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z| |lvppList| |sl| (QREFELT $ 92)))))) 

(DECLAIM (NOTINLINE |PolynomialFactorizationByRecursion;|)) 

(DEFUN |PolynomialFactorizationByRecursion| (&REST #1=#:G442)
  (SPROG NIL
         (PROG (#2=#:G443)
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
    (LETT $ (GETREFV 158) . #1#)
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
     ((|HasCategory| |#1| '(|StepThrough|))
      (QSETREFV $ 64
                (CONS (|dispatchFunction| |PFBR;factorSFBRlcUnit;LSupF;3|) $)))
     ('T
      (QSETREFV $ 64
                (CONS (|dispatchFunction| |PFBR;factorSFBRlcUnit;LSupF;4|)
                      $))))
    (COND
     ((|HasSignature| |#1| (LIST '|random| (LIST (|devaluate| |#1|))))
      (QSETREFV $ 72 (CONS (|dispatchFunction| |PFBR;randomR;R;5|) $)))
     ('T (QSETREFV $ 72 (CONS (|dispatchFunction| |PFBR;randomR;R;6|) $))))
    (COND
     ((|HasCategory| |#1| '(|FiniteFieldCategory|))
      (QSETREFV $ 87
                (CONS (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;7|)
                      $)))
     ('T
      (QSETREFV $ 87
                (CONS (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;8|)
                      $))))
    $))) 

(MAKEPROP '|PolynomialFactorizationByRecursion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |eval|) (|Mapping| 9 9)
              (|SparseUnivariatePolynomial| 9) (7 . |map|) (|List| 9)
              (13 . |coefficients|) (|NonNegativeInteger|) (18 . |degree|)
              (24 . |coerce|) (29 . |coerce|) (34 . -) (|Boolean|) (|Integer|)
              (40 . <=) (|PositiveInteger|) (46 . ^) (52 . *) (58 . |One|)
              (62 . -) (|Union| $ '"failed") (68 . |exquo|) (74 . |zero?|)
              (|Union| 33 '"failed") (|List| 34)
              (|SparseUnivariatePolynomial| $)
              (79 . |solveLinearPolynomialEquation|) (85 . *) (91 . +)
              (97 . |exquo|) (|List| 12) (103 . |remove|) (109 . |One|)
              (113 . |One|) (|List| 8) (117 . |first|) (122 . |degree|)
              (127 . |differentiate|) (132 . |gcd|) (138 . >) (144 . |retract|)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 12 6 50)
              (149 . |map|) (|Factored| 34)
              (155 . |factorSquareFreePolynomial|) (|Factored| 50)
              (160 . |unit|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 58) (|:| |fctr| 50) (|:| |xpnt| 22))
              (|List| 59) (165 . |factorList|) (170 . *) (|Factored| 12)
              (176 . |factorSFBRlcUnit|) (182 . |unit|)
              (|Record| (|:| |flg| 58) (|:| |fctr| 12) (|:| |xpnt| 22))
              (|List| 66) (187 . |factorList|) (192 . |makeFR|) (198 . |init|)
              (202 . |nextItem|) (207 . |randomR|) (211 . |random|)
              (215 . |coerce|) (220 . |univariate|)
              (|SparseUnivariatePolynomial| 50) (|Mapping| 50 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 12 50 76)
              (225 . |map|) (231 . |solveLinearPolynomialEquation|)
              (237 . |multivariate|) (243 . |multivariate|) (|Mapping| 9 50)
              (|UnivariatePolynomialCategoryFunctions2| 50 76 9 12)
              (249 . |map|) (|Union| 39 '"failed") (255 . |bivariateSLPEBR|)
              (|LinearPolynomialEquationByFractions| 9)
              (262 . |solveLinearPolynomialEquationByFractions|)
              (268 . |leadingCoefficient|) (|List| 6) (273 . |eval|)
              (280 . |zero?|) (285 . |differentiate|) (290 . |gcd|)
              (296 . |degree|) (301 . |Zero|) (305 . |content|) (310 . |unit?|)
              (|Mapping| 9 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 50 9 12)
              (315 . |map|) (321 . |setDifference|) (327 . |remove|)
              (333 . |univariate|) (|SparseUnivariatePolynomial| 12)
              (|Mapping| 12 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 12 12 106)
              (339 . |map|) (|CommuteUnivariatePolynomialCategory| 9 12 106)
              (345 . |swap|) (350 . |Zero|) (|List| $) (354 . |monomials|)
              (359 . |leadingCoefficient|) (364 . |degree|) (369 . |monomial|)
              (375 . +) (|Mapping| 9 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 106 9 12)
              (381 . |map|) (387 . |solveLinearPolynomialEquation|)
              (393 . |Zero|) (397 . |Zero|) (401 . =) (407 . |variables|)
              (412 . |concat|) (417 . |removeDuplicates!|)
              |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;14|
              (422 . |factorPolynomial|) (|Mapping| 12 50)
              (|FactoredFunctions2| 50 12) (427 . |map|) (433 . |content|)
              (438 . |unit?|) (|Factored| $) (443 . |squareFree|)
              |PFBR;factorSquareFreeByRecursion;SupF;16| (|Mapping| 63 12)
              (|FactoredFunctionUtilities| 12) (448 . |refine|)
              (454 . |coerce|) (459 . |factor|) (|Factored| 9)
              (|FactoredFunctions2| 9 12) (464 . |map|) (470 . |mergeFactors|)
              |PFBR;factorByRecursion;SupF;15| (476 . |numberOfFactors|)
              (481 . |leadingCoefficient|) (486 . |exquo|) (492 . *) (498 . ^)
              (504 . |monomial|) (510 . |reductum|) (515 . |exquo|)
              (521 . |recip|))
           '#(|solveLinearPolynomialEquationByRecursion| 526 |randomR| 532
              |factorSquareFreeByRecursion| 536 |factorSFBRlcUnit| 541
              |factorByRecursion| 547 |bivariateSLPEBR| 552)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 157
                                                 '(3 9 0 0 8 6 10 2 12 0 11 0
                                                   13 1 12 14 0 15 2 9 16 0 8
                                                   17 1 9 0 8 18 1 9 0 6 19 2 9
                                                   0 0 0 20 2 22 21 0 0 23 2 9
                                                   0 0 24 25 2 12 0 0 0 26 0 12
                                                   0 27 2 12 0 0 0 28 2 12 29 0
                                                   9 30 1 12 21 0 31 2 9 32 33
                                                   34 35 2 12 0 0 9 36 2 12 0 0
                                                   0 37 2 12 29 0 0 38 2 39 0
                                                   12 0 40 0 6 0 41 0 9 0 42 1
                                                   43 8 0 44 1 12 16 0 45 1 12
                                                   0 0 46 2 12 0 0 0 47 2 16 21
                                                   0 0 48 1 9 6 0 49 2 52 50 51
                                                   12 53 1 6 54 34 55 1 56 50 0
                                                   57 1 56 60 0 61 2 50 0 0 0
                                                   62 2 0 63 43 12 64 1 63 12 0
                                                   65 1 63 67 0 68 2 63 0 12 67
                                                   69 0 6 0 70 1 6 29 0 71 0 0
                                                   6 72 0 6 0 73 1 6 0 22 74 1
                                                   9 50 0 75 2 78 76 77 12 79 2
                                                   50 32 33 34 80 2 9 0 34 8 81
                                                   2 9 0 50 8 82 2 84 12 83 76
                                                   85 3 0 86 39 12 8 87 2 88 86
                                                   39 12 89 1 12 9 0 90 3 9 0 0
                                                   43 91 92 1 9 21 0 93 1 50 0
                                                   0 94 2 50 0 0 0 95 1 50 16 0
                                                   96 0 6 0 97 1 50 6 0 98 1 6
                                                   21 0 99 2 101 12 100 50 102
                                                   2 43 0 0 0 103 2 43 0 8 0
                                                   104 2 9 34 0 8 105 2 108 106
                                                   107 12 109 1 110 106 106 111
                                                   0 106 0 112 1 106 113 0 114
                                                   1 106 12 0 115 1 106 16 0
                                                   116 2 106 0 12 16 117 2 106
                                                   0 0 0 118 2 120 12 119 106
                                                   121 2 6 32 33 34 122 0 7 0
                                                   123 0 12 0 124 2 12 21 0 0
                                                   125 1 9 43 0 126 1 43 0 113
                                                   127 1 43 0 0 128 1 6 54 34
                                                   130 2 132 63 131 56 133 1 12
                                                   9 0 134 1 9 21 0 135 1 12
                                                   136 0 137 2 140 63 63 139
                                                   141 1 12 0 9 142 1 9 136 0
                                                   143 2 145 63 107 144 146 2
                                                   140 63 63 63 147 1 56 16 0
                                                   149 1 50 6 0 150 2 9 29 0 6
                                                   151 2 12 0 9 0 152 2 9 0 0
                                                   16 153 2 12 0 9 16 154 1 12
                                                   0 0 155 2 9 29 0 0 156 1 9
                                                   29 0 157 2 0 86 39 12 129 0
                                                   0 6 72 1 0 63 12 138 2 0 63
                                                   43 12 64 1 0 63 12 148 3 0
                                                   86 39 12 8 87)))))
           '|lookupComplete|)) 
