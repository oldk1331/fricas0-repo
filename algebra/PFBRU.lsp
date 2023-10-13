
(/VERSIONCHECK 2) 

(DEFUN |PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1|
       (|lpolys| |pp| $)
  (PROG (|answer| #1=#:G191 |c| #2=#:G192 |d| #3=#:G190 #4=#:G182 |recAns|
         |ppx| |i| #5=#:G189 |u| #6=#:G188 |lpolysLower| #7=#:G187 #8=#:G186
         |rhsdeg| #9=#:G150 #10=#:G149 #11=#:G151 #12=#:G185 |v| |lhsdeg|
         #13=#:G144 #14=#:G143 #15=#:G145 #16=#:G147 #17=#:G146 #18=#:G148
         #19=#:G184 #20=#:G183)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lhsdeg|
              (PROGN
               (LETT #13# NIL
                     . #21=(|PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1|))
               (SEQ (LETT |u| NIL . #21#) (LETT #20# |lpolys| . #21#) G190
                    (COND
                     ((OR (ATOM #20#) (PROGN (LETT |u| (CAR #20#) . #21#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #15#
                             (PROGN
                              (LETT #16# NIL . #21#)
                              (SEQ (LETT |v| NIL . #21#)
                                   (LETT #19# (SPADCALL |u| (QREFELT $ 10))
                                         . #21#)
                                   G190
                                   (COND
                                    ((OR (ATOM #19#)
                                         (PROGN
                                          (LETT |v| (CAR #19#) . #21#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #18# (SPADCALL |v| (QREFELT $ 12))
                                            . #21#)
                                      (COND
                                       (#16#
                                        (LETT #17# (MAX #17# #18#) . #21#))
                                       ('T
                                        (PROGN
                                         (LETT #17# #18# . #21#)
                                         (LETT #16# 'T . #21#)))))))
                                   (LETT #19# (CDR #19#) . #21#) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#16# #17#) ('T (|IdentityError| '|max|))))
                             . #21#)
                       (COND (#13# (LETT #14# (MAX #14# #15#) . #21#))
                             ('T
                              (PROGN
                               (LETT #14# #15# . #21#)
                               (LETT #13# 'T . #21#)))))))
                    (LETT #20# (CDR #20#) . #21#) (GO G190) G191 (EXIT NIL))
               (COND (#13# #14#) (#22='T (|IdentityError| '|max|))))
              . #21#)
        (LETT |rhsdeg|
              (PROGN
               (LETT #9# NIL . #21#)
               (SEQ (LETT |v| NIL . #21#)
                    (LETT #12# (SPADCALL |pp| (QREFELT $ 10)) . #21#) G190
                    (COND
                     ((OR (ATOM #12#) (PROGN (LETT |v| (CAR #12#) . #21#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #11# (SPADCALL |v| (QREFELT $ 12)) . #21#)
                       (COND (#9# (LETT #10# (MAX #10# #11#) . #21#))
                             ('T
                              (PROGN
                               (LETT #10# #11# . #21#)
                               (LETT #9# 'T . #21#)))))))
                    (LETT #12# (CDR #12#) . #21#) (GO G190) G191 (EXIT NIL))
               (COND (#9# #10#) (#22# (|IdentityError| '|max|))))
              . #21#)
        (EXIT
         (COND
          ((EQL |lhsdeg| 0)
           (SEQ
            (LETT |lpolysLower|
                  (PROGN
                   (LETT #8# NIL . #21#)
                   (SEQ (LETT |u| NIL . #21#) (LETT #7# |lpolys| . #21#) G190
                        (COND
                         ((OR (ATOM #7#)
                              (PROGN (LETT |u| (CAR #7#) . #21#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #8# (CONS (|PFBRU;lower| |u| $) #8#) . #21#)))
                        (LETT #7# (CDR #7#) . #21#) (GO G190) G191
                        (EXIT (NREVERSE #8#))))
                  . #21#)
            (LETT |answer|
                  (PROGN
                   (LETT #6# NIL . #21#)
                   (SEQ (LETT |u| NIL . #21#) (LETT #5# |lpolys| . #21#) G190
                        (COND
                         ((OR (ATOM #5#)
                              (PROGN (LETT |u| (CAR #5#) . #21#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #6# (CONS (|spadConstant| $ 15) #6#) . #21#)))
                        (LETT #5# (CDR #5#) . #21#) (GO G190) G191
                        (EXIT (NREVERSE #6#))))
                  . #21#)
            (SEQ (LETT |i| 0 . #21#) G190
                 (COND ((|greater_SI| |i| |rhsdeg|) (GO G191)))
                 (SEQ
                  (LETT |ppx|
                        (SPADCALL
                         (CONS
                          #'|PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1!0|
                          (VECTOR $ |i|))
                         |pp| (QREFELT $ 20))
                        . #21#)
                  (EXIT
                   (COND ((SPADCALL |ppx| (QREFELT $ 22)) "next")
                         ('T
                          (SEQ
                           (LETT |recAns|
                                 (SPADCALL |lpolysLower| |ppx| (QREFELT $ 26))
                                 . #21#)
                           (EXIT
                            (COND
                             ((QEQCAR |recAns| 1)
                              (PROGN
                               (LETT #4# (CONS 1 "failed") . #21#)
                               (GO #4#)))
                             ('T
                              (LETT |answer|
                                    (PROGN
                                     (LETT #3# NIL . #21#)
                                     (SEQ (LETT |d| NIL . #21#)
                                          (LETT #2# |answer| . #21#)
                                          (LETT |c| NIL . #21#)
                                          (LETT #1# (QCDR |recAns|) . #21#)
                                          G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |c| (CAR #1#) . #21#)
                                                 NIL)
                                                (ATOM #2#)
                                                (PROGN
                                                 (LETT |d| (CAR #2#) . #21#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #3#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (|spadConstant| $ 27) |i|
                                                      (QREFELT $ 29))
                                                     (|PFBRU;raise| |c| $)
                                                     (QREFELT $ 30))
                                                    |d| (QREFELT $ 31))
                                                   #3#)
                                                  . #21#)))
                                          (LETT #1#
                                                (PROG1 (CDR #1#)
                                                  (LETT #2# (CDR #2#) . #21#))
                                                . #21#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #3#))))
                                    . #21#)))))))))
                 (LETT |i| (|inc_SI| |i|) . #21#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |answer|))))
          (#22# (SPADCALL |lpolys| |pp| (QREFELT $ 35)))))))
      #4# (EXIT #4#))))) 

(DEFUN |PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1!0| (|z1| $$)
  (PROG (|i| $)
    (LETT |i| (QREFELT $$ 1)
          . #1=(|PFBRU;solveLinearPolynomialEquationByRecursion;LSupU;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |i| (QREFELT $ 16)))))) 

(DEFUN |PFBRU;hensel| (|pp| |r| |factors| $)
  (PROG (|pn| |n| |totdegree| #1=#:G246 #2=#:G245 #3=#:G247 #4=#:G249 #5=#:G248
         #6=#:G250 #7=#:G268 |u| #8=#:G267 |u1| #9=#:G258 |foundFactors|
         |origFactors| |proddegree| #10=#:G239 #11=#:G238 #12=#:G240 #13=#:G266
         |pp1| #14=#:G264 |a| #15=#:G265 |c| #16=#:G262 #17=#:G263 |b|
         #18=#:G261 |step| |Ecart| #19=#:G228 #20=#:G227 #21=#:G229 #22=#:G260
         #23=#:G125 |prime| #24=#:G198 #25=#:G197 #26=#:G199 #27=#:G259)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |origFactors| |factors| . #28=(|PFBRU;hensel|))
            (LETT |totdegree| 0 . #28#)
            (LETT |proddegree|
                  (PROGN
                   (LETT #24# NIL . #28#)
                   (SEQ (LETT |u| NIL . #28#)
                        (LETT #27# (SPADCALL |pp| (QREFELT $ 10)) . #28#) G190
                        (COND
                         ((OR (ATOM #27#)
                              (PROGN (LETT |u| (CAR #27#) . #28#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #26# (SPADCALL |u| (QREFELT $ 12)) . #28#)
                           (COND (#24# (LETT #25# (MAX #25# #26#) . #28#))
                                 ('T
                                  (PROGN
                                   (LETT #25# #26# . #28#)
                                   (LETT #24# 'T . #28#)))))))
                        (LETT #27# (CDR #27#) . #28#) (GO G190) G191
                        (EXIT NIL))
                   (COND (#24# #25#) ('T (|IdentityError| '|max|))))
                  . #28#)
            (LETT |n| 1 . #28#)
            (LETT |pn|
                  (LETT |prime|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 27) 1 (QREFELT $ 29))
                         (SPADCALL |r| (QREFELT $ 37)) (QREFELT $ 38))
                        . #28#)
                  . #28#)
            (LETT |foundFactors| NIL . #28#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |totdegree| |proddegree| (QREFELT $ 40)))
                   (GO G191)))
                 (SEQ
                  (LETT |Ecart|
                        (SPADCALL
                         (SPADCALL |pp|
                                   (PROGN
                                    (LETT #19# NIL . #28#)
                                    (SEQ (LETT #23# NIL . #28#)
                                         (LETT #22# |factors| . #28#) G190
                                         (COND
                                          ((OR (ATOM #22#)
                                               (PROGN
                                                (LETT #23# (CAR #22#) . #28#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #21# #23# . #28#)
                                            (COND
                                             (#19#
                                              (LETT #20#
                                                    (SPADCALL #20# #21#
                                                              (QREFELT $ 41))
                                                    . #28#))
                                             ('T
                                              (PROGN
                                               (LETT #20# #21# . #28#)
                                               (LETT #19# 'T . #28#)))))))
                                         (LETT #22# (CDR #22#) . #28#)
                                         (GO G190) G191 (EXIT NIL))
                                    (COND (#19# #20#)
                                          ('T (|spadConstant| $ 42))))
                                   (QREFELT $ 43))
                         |pn| (QREFELT $ 45))
                        . #28#)
                  (EXIT
                   (COND
                    ((QEQCAR |Ecart| 1)
                     (|error| "failed lifting in hensel in PFBRU"))
                    ((SPADCALL (QCDR |Ecart|) (QREFELT $ 46))
                     (PROGN
                      (LETT #9#
                            (CONS 0 (LIST (APPEND |foundFactors| |factors|)))
                            . #28#)
                      (GO #9#)))
                    ('T
                     (SEQ
                      (LETT |step|
                            (SPADCALL |origFactors|
                                      (SPADCALL
                                       (CONS #'|PFBRU;hensel!0| (VECTOR $ |r|))
                                       (QCDR |Ecart|) (QREFELT $ 49))
                                      (QREFELT $ 50))
                            . #28#)
                      (EXIT
                       (COND
                        ((QEQCAR |step| 1)
                         (PROGN (LETT #9# (CONS 1 "failed") . #28#) (GO #9#)))
                        ('T
                         (SEQ
                          (LETT |factors|
                                (PROGN
                                 (LETT #18# NIL . #28#)
                                 (SEQ (LETT |b| NIL . #28#)
                                      (LETT #17# (QCDR |step|) . #28#)
                                      (LETT |a| NIL . #28#)
                                      (LETT #16# |factors| . #28#) G190
                                      (COND
                                       ((OR (ATOM #16#)
                                            (PROGN
                                             (LETT |a| (CAR #16#) . #28#)
                                             NIL)
                                            (ATOM #17#)
                                            (PROGN
                                             (LETT |b| (CAR #17#) . #28#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #18#
                                              (CONS
                                               (SPADCALL |a|
                                                         (SPADCALL |b| |pn|
                                                                   (QREFELT $
                                                                            51))
                                                         (QREFELT $ 31))
                                               #18#)
                                              . #28#)))
                                      (LETT #16#
                                            (PROG1 (CDR #16#)
                                              (LETT #17# (CDR #17#) . #28#))
                                            . #28#)
                                      (GO G190) G191 (EXIT (NREVERSE #18#))))
                                . #28#)
                          (SEQ (LETT |c| NIL . #28#)
                               (LETT #15# |origFactors| . #28#)
                               (LETT |a| NIL . #28#)
                               (LETT #14# |factors| . #28#) G190
                               (COND
                                ((OR (ATOM #14#)
                                     (PROGN (LETT |a| (CAR #14#) . #28#) NIL)
                                     (ATOM #15#)
                                     (PROGN (LETT |c| (CAR #15#) . #28#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |pp1| (SPADCALL |pp| |a| (QREFELT $ 52))
                                      . #28#)
                                (EXIT
                                 (COND ((QEQCAR |pp1| 1) "next")
                                       ('T
                                        (SEQ (LETT |pp| (QCDR |pp1|) . #28#)
                                             (LETT |proddegree|
                                                   (- |proddegree|
                                                      (PROGN
                                                       (LETT #10# NIL . #28#)
                                                       (SEQ
                                                        (LETT |u| NIL . #28#)
                                                        (LETT #13#
                                                              (SPADCALL |a|
                                                                        (QREFELT
                                                                         $ 10))
                                                              . #28#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #13#)
                                                              (PROGN
                                                               (LETT |u|
                                                                     (CAR #13#)
                                                                     . #28#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (PROGN
                                                           (LETT #12#
                                                                 (SPADCALL |u|
                                                                           (QREFELT
                                                                            $
                                                                            12))
                                                                 . #28#)
                                                           (COND
                                                            (#10#
                                                             (LETT #11#
                                                                   (MAX #11#
                                                                        #12#)
                                                                   . #28#))
                                                            ('T
                                                             (PROGN
                                                              (LETT #11# #12#
                                                                    . #28#)
                                                              (LETT #10# 'T
                                                                    . #28#)))))))
                                                        (LETT #13# (CDR #13#)
                                                              . #28#)
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                       (COND (#10# #11#)
                                                             ('T
                                                              (|IdentityError|
                                                               '|max|)))))
                                                   . #28#)
                                             (LETT |factors|
                                                   (SPADCALL |a| |factors|
                                                             (QREFELT $ 53))
                                                   . #28#)
                                             (LETT |origFactors|
                                                   (SPADCALL |c| |origFactors|
                                                             (QREFELT $ 53))
                                                   . #28#)
                                             (EXIT
                                              (LETT |foundFactors|
                                                    (CONS |a| |foundFactors|)
                                                    . #28#)))))))
                               (LETT #14#
                                     (PROG1 (CDR #14#)
                                       (LETT #15# (CDR #15#) . #28#))
                                     . #28#)
                               (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (COND
                            ((< (LENGTH |factors|) 2)
                             (PROGN
                              (LETT #9#
                                    (CONS 0
                                          (LIST
                                           (COND
                                            ((NULL |factors|) |foundFactors|)
                                            ('T (CONS |pp| |foundFactors|)))))
                                    . #28#)
                              (GO #9#)))
                            ('T
                             (SEQ
                              (LETT |totdegree|
                                    (PROGN
                                     (LETT #1# NIL . #28#)
                                     (SEQ (LETT |u1| NIL . #28#)
                                          (LETT #8# |factors| . #28#) G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |u1| (CAR #8#) . #28#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #3#
                                                   (PROGN
                                                    (LETT #4# NIL . #28#)
                                                    (SEQ (LETT |u| NIL . #28#)
                                                         (LETT #7#
                                                               (SPADCALL |u1|
                                                                         (QREFELT
                                                                          $
                                                                          10))
                                                               . #28#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #7#)
                                                               (PROGN
                                                                (LETT |u|
                                                                      (CAR #7#)
                                                                      . #28#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #6#
                                                                  (SPADCALL |u|
                                                                            (QREFELT
                                                                             $
                                                                             12))
                                                                  . #28#)
                                                            (COND
                                                             (#4#
                                                              (LETT #5#
                                                                    (MAX #5#
                                                                         #6#)
                                                                    . #28#))
                                                             ('T
                                                              (PROGN
                                                               (LETT #5# #6#
                                                                     . #28#)
                                                               (LETT #4# 'T
                                                                     . #28#)))))))
                                                         (LETT #7# (CDR #7#)
                                                               . #28#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                    (COND (#4# #5#)
                                                          ('T
                                                           (|IdentityError|
                                                            '|max|))))
                                                   . #28#)
                                             (COND
                                              (#1#
                                               (LETT #2# (+ #2# #3#) . #28#))
                                              ('T
                                               (PROGN
                                                (LETT #2# #3# . #28#)
                                                (LETT #1# 'T . #28#)))))))
                                          (LETT #8# (CDR #8#) . #28#) (GO G190)
                                          G191 (EXIT NIL))
                                     (COND (#1# #2#) ('T 0)))
                                    . #28#)
                              (LETT |n| (+ |n| 1) . #28#)
                              (EXIT
                               (LETT |pn|
                                     (SPADCALL |pn| |prime| (QREFELT $ 54))
                                     . #28#)))))))))))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
      #9# (EXIT #9#))))) 

(DEFUN |PFBRU;hensel!0| (|z1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|PFBRU;hensel|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |z1| (SPADCALL |r| (QREFELT $ 37)) (QREFELT $ 47)))))) 

(DEFUN |PFBRU;chooseFSQViableSubstitutions| (|pp| $)
  (PROG (#1=#:G273 |ppR| |substns|)
    (RETURN
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
                    ('T (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#))))))))))
             NIL (GO G190) G191 (EXIT NIL)))
       #1# (EXIT #1#))
      (EXIT (CONS |substns| |ppR|)))))) 

(DEFUN |PFBRU;chooseFSQViableSubstitutions!0| (|z1| $$)
  (PROG (|substns| $)
    (LETT |substns| (QREFELT $$ 1) . #1=(|PFBRU;chooseFSQViableSubstitutions|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |substns| (QREFELT $ 57)))))) 

(DEFUN |PFBRU;raise| (|supR| $) (SPADCALL (ELT $ 37) |supR| (QREFELT $ 65))) 

(DEFUN |PFBRU;lower| (|pp| $) (SPADCALL (ELT $ 66) |pp| (QREFELT $ 20))) 

(DEFUN |PFBRU;factorSFBRlcUnitInner| (|pp| |r| $)
  (PROG (#1=#:G300 |u| #2=#:G299 |hen| |factors| #3=#:G298 #4=#:G297 |fDown|
         |ppR|)
    (RETURN
     (SEQ
      (LETT |ppR|
            (SPADCALL (CONS #'|PFBRU;factorSFBRlcUnitInner!0| (VECTOR $ |r|))
                      |pp| (QREFELT $ 20))
            . #5=(|PFBRU;factorSFBRlcUnitInner|))
      (EXIT
       (COND
        ((OR (< (SPADCALL |ppR| (QREFELT $ 61)) (SPADCALL |pp| (QREFELT $ 67)))
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
                             (LETT #3# (CDR (SPADCALL |fDown| (QREFELT $ 75)))
                                   . #5#)
                             G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #4#
                                     (CONS (|PFBRU;raise| (QVELT |u| 1) $) #4#)
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
                                                (LETT #1# (QCAR (QCDR |hen|))
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
                                                          (CONS 2 "irred") |u|
                                                          1)
                                                         #2#)
                                                        . #5#)))
                                                (LETT #1# (CDR #1#) . #5#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#))))
                                          (QREFELT $ 80)))))))))))))))))) 

(DEFUN |PFBRU;factorSFBRlcUnitInner!0| (|z1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|PFBRU;factorSFBRlcUnitInner|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |r| (QREFELT $ 57)))))) 

(DEFUN |PFBRU;factorSFBRlcUnit;SupF;7| (|pp| $)
  (PROG (#1=#:G308 |val| |val1| |tempAns|)
    (RETURN
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
                 ('T (PROGN (LETT #1# (QCDR |tempAns|) . #2#) (GO #1#))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PFBRU;factorSFBRlcUnit;SupF;8| (|pp| $)
  (PROG (#1=#:G312 |val| |tempAns|)
    (RETURN
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
                 ('T (PROGN (LETT #1# (QCDR |tempAns|) . #2#) (GO #1#))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PFBRU;randomR;R;9| ($)
  (PROG (|v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (QREFELT $ 84) (QREFELT $ 82)) |PFBRU;randomR;R;9|)
      (EXIT
       (COND
        ((QEQCAR |v| 1)
         (SEQ (SAY "Taking another set of random values")
              (SETELT $ 84 (|spadConstant| $ 81)) (EXIT (QREFELT $ 84))))
        ('T (SEQ (SETELT $ 84 (QCDR |v|)) (EXIT (QREFELT $ 84)))))))))) 

(DEFUN |PFBRU;randomR;R;10| ($) (SPADCALL (QREFELT $ 85))) 

(DEFUN |PFBRU;randomR;R;11| ($) (SPADCALL (RANDOM 100) (QREFELT $ 86))) 

(DEFUN |PFBRU;factorByRecursion;SupF;12| (|pp| $)
  (PROG (#1=#:G328 |c| #2=#:G323 #3=#:G322 #4=#:G324 #5=#:G335 |u|)
    (RETURN
     (SEQ
      (COND
       ((PROGN
         (LETT #2# NIL . #6=(|PFBRU;factorByRecursion;SupF;12|))
         (SEQ (LETT |u| NIL . #6#)
              (LETT #5# (SPADCALL |pp| (QREFELT $ 10)) . #6#) G190
              (COND
               ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #4# (ZEROP (SPADCALL |u| (QREFELT $ 12))) . #6#)
                 (COND (#2# (LETT #3# (COND (#3# #4#) ('T 'NIL)) . #6#))
                       ('T
                        (PROGN (LETT #3# #4# . #6#) (LETT #2# 'T . #6#)))))))
              (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
         (COND (#2# #3#) (#7='T 'T)))
        (SPADCALL (CONS (|function| |PFBRU;raise|) $)
                  (SPADCALL (|PFBRU;lower| |pp| $) (QREFELT $ 87))
                  (QREFELT $ 90)))
       (#7#
        (SEQ (LETT |c| (SPADCALL |pp| (QREFELT $ 91)) . #6#)
             (EXIT
              (COND
               ((SPADCALL |c| (QREFELT $ 92))
                (SPADCALL (SPADCALL |pp| (QREFELT $ 94)) (ELT $ 95)
                          (QREFELT $ 98)))
               (#7#
                (SEQ
                 (LETT |pp|
                       (PROG2
                           (LETT #1# (SPADCALL |pp| |c| (QREFELT $ 45)) . #6#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0)
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))
                                        #1#))
                       . #6#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |pp| (QREFELT $ 94)) (ELT $ 95)
                             (QREFELT $ 98))
                   (SPADCALL (ELT $ 99) (SPADCALL |c| (QREFELT $ 100))
                             (QREFELT $ 104))
                   (QREFELT $ 105)))))))))))))) 

(DEFUN |PFBRU;factorSquareFreeByRecursion;SupF;13| (|pp| $)
  (PROG (#1=#:G378 |w| #2=#:G377 #3=#:G357 |factors| #4=#:G360 |lcppPow| |lc|
         #5=#:G376 #6=#:G375 #7=#:G355 |hen| OK |ppAdjust| #8=#:G374 |u|
         #9=#:G373 #10=#:G348 #11=#:G372 #12=#:G371 |lcppR| |oldnfact|
         #13=#:G369 |nfact| |factorsR| |newppR| |cVS| |lcpp| #14=#:G337
         #15=#:G336 #16=#:G338 #17=#:G370)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((PROGN
          (LETT #14# NIL . #18=(|PFBRU;factorSquareFreeByRecursion;SupF;13|))
          (SEQ (LETT |u| NIL . #18#)
               (LETT #17# (SPADCALL |pp| (QREFELT $ 10)) . #18#) G190
               (COND
                ((OR (ATOM #17#) (PROGN (LETT |u| (CAR #17#) . #18#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (PROGN
                  (LETT #16# (ZEROP (SPADCALL |u| (QREFELT $ 12))) . #18#)
                  (COND (#14# (LETT #15# (COND (#15# #16#) ('T 'NIL)) . #18#))
                        ('T
                         (PROGN
                          (LETT #15# #16# . #18#)
                          (LETT #14# 'T . #18#)))))))
               (LETT #17# (CDR #17#) . #18#) (GO G190) G191 (EXIT NIL))
          (COND (#14# #15#) (#19='T 'T)))
         (SPADCALL (CONS (|function| |PFBRU;raise|) $)
                   (SPADCALL (|PFBRU;lower| |pp| $) (QREFELT $ 69))
                   (QREFELT $ 90)))
        ((SPADCALL (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 56)) . #18#)
                   (QREFELT $ 92))
         (SPADCALL |pp| (QREFELT $ 83)))
        (#19#
         (SEQ (LETT |oldnfact| 999999 . #18#)
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL 'T) (GO G191)))
                     (SEQ
                      (LETT |cVS| (|PFBRU;chooseFSQViableSubstitutions| |pp| $)
                            . #18#)
                      (LETT |newppR| (SPADCALL (QCDR |cVS|) (QREFELT $ 107))
                            . #18#)
                      (LETT |factorsR| (SPADCALL |newppR| (QREFELT $ 69))
                            . #18#)
                      (LETT |nfact| (SPADCALL |factorsR| (QREFELT $ 108))
                            . #18#)
                      (EXIT
                       (COND
                        ((EQL |nfact| 1)
                         (PROGN
                          (LETT #13#
                                (SPADCALL (|spadConstant| $ 42)
                                          (LIST
                                           (VECTOR (CONS 2 "irred") |pp| 1))
                                          (QREFELT $ 80))
                                . #18#)
                          (GO #13#)))
                        ((SPADCALL |nfact| |oldnfact| (QREFELT $ 62)) "next")
                        ('T
                         (SEQ (LETT |oldnfact| |nfact| . #18#)
                              (LETT |lcppR|
                                    (SPADCALL (QCDR |cVS|) (QREFELT $ 109))
                                    . #18#)
                              (LETT |factors|
                                    (PROGN
                                     (LETT #12# NIL . #18#)
                                     (SEQ (LETT |u| NIL . #18#)
                                          (LETT #11#
                                                (SPADCALL |factorsR|
                                                          (QREFELT $ 75))
                                                . #18#)
                                          G190
                                          (COND
                                           ((OR (ATOM #11#)
                                                (PROGN
                                                 (LETT |u| (CAR #11#) . #18#)
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
                                                                 (QVELT |u| 1)
                                                                 (QREFELT $
                                                                          109))
                                                                (QREFELT $
                                                                         110))
                                                               . #18#)
                                                         (QCDR #10#)
                                                       (|check_union|
                                                        (QEQCAR #10# 0)
                                                        (QREFELT $ 6) #10#))
                                                     (QVELT |u| 1)
                                                     (QREFELT $ 111))
                                                    $)
                                                   #12#)
                                                  . #18#)))
                                          (LETT #11# (CDR #11#) . #18#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #12#))))
                                    . #18#)
                              (LETT |factors|
                                    (PROGN
                                     (LETT #9# NIL . #18#)
                                     (SEQ (LETT |u| NIL . #18#)
                                          (LETT #8# |factors| . #18#) G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |u| (CAR #8#) . #18#)
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
                                                                         $ 67))
                                                              (QREFELT $ 112))
                                                    (SPADCALL |u|
                                                              (QREFELT $ 113))
                                                    (QREFELT $ 31))
                                                   #9#)
                                                  . #18#)))
                                          (LETT #8# (CDR #8#) . #18#) (GO G190)
                                          G191 (EXIT (NREVERSE #9#))))
                                    . #18#)
                              (LETT |ppAdjust|
                                    (SPADCALL
                                     (LETT |lcppPow|
                                           (SPADCALL |lcpp|
                                                     (LENGTH (CDR |factors|))
                                                     (QREFELT $ 114))
                                           . #18#)
                                     |pp| (QREFELT $ 30))
                                    . #18#)
                              (LETT OK 'T . #18#)
                              (LETT |hen|
                                    (|PFBRU;hensel| |ppAdjust| (QCAR |cVS|)
                                     |factors| $)
                                    . #18#)
                              (EXIT
                               (COND ((QEQCAR |hen| 1) "next")
                                     ('T
                                      (SEQ
                                       (LETT |factors| (QCAR (QCDR |hen|))
                                             . #18#)
                                       (EXIT
                                        (PROGN
                                         (LETT #7# |$NoValue| . #18#)
                                         (GO #7#))))))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #7# (EXIT #7#))
              (LETT |factors|
                    (PROGN
                     (LETT #6# NIL . #18#)
                     (SEQ (LETT |w| NIL . #18#) (LETT #5# |factors| . #18#)
                          G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |w| (CAR #5#) . #18#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SEQ
                                    (LETT |lc| (SPADCALL |w| (QREFELT $ 91))
                                          . #18#)
                                    (LETT |lcppPow|
                                          (PROG2
                                              (LETT #3#
                                                    (SPADCALL |lcppPow| |lc|
                                                              (QREFELT $ 115))
                                                    . #18#)
                                              (QCDR #3#)
                                            (|check_union| (QEQCAR #3# 0)
                                                           (QREFELT $ 7) #3#))
                                          . #18#)
                                    (EXIT
                                     (PROG2
                                         (LETT #4#
                                               (SPADCALL |w| |lc|
                                                         (QREFELT $ 45))
                                               . #18#)
                                         (QCDR #4#)
                                       (|check_union| (QEQCAR #4# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 7))
                                                      #4#))))
                                   #6#)
                                  . #18#)))
                          (LETT #5# (CDR #5#) . #18#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #18#)
              (COND
               ((NULL (SPADCALL |lcppPow| (QREFELT $ 92)))
                (EXIT
                 (|error| "internal error in factorSquareFreeByRecursion"))))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (PROG2 (LETT #3# (SPADCALL |lcppPow| (QREFELT $ 116)) . #18#)
                     (QCDR #3#)
                   (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                 (QREFELT $ 99))
                (PROGN
                 (LETT #2# NIL . #18#)
                 (SEQ (LETT |w| NIL . #18#) (LETT #1# |factors| . #18#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |w| (CAR #1#) . #18#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (VECTOR (CONS 2 "irred") |w| 1) #2#)
                              . #18#)))
                      (LETT #1# (CDR #1#) . #18#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 80)))))))
      #13# (EXIT #13#))))) 

(DEFUN |PolynomialFactorizationByRecursionUnivariate| (&REST #1=#:G379)
  (PROG ()
    (RETURN
     (PROG (#2=#:G380)
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
                   (|function| |PolynomialFactorizationByRecursionUnivariate;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|PolynomialFactorizationByRecursionUnivariate|))))))))))) 

(DEFUN |PolynomialFactorizationByRecursionUnivariate;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|PolynomialFactorizationByRecursionUnivariate|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$|
            (LIST '|PolynomialFactorizationByRecursionUnivariate| DV$1 DV$2)
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
                  (CONS (|dispatchFunction| |PFBRU;factorSFBRlcUnit;SupF;7|)
                        $)))
       ('T
        (QSETREFV $ 83
                  (CONS (|dispatchFunction| |PFBRU;factorSFBRlcUnit;SupF;8|)
                        $))))
      (COND
       ((|HasCategory| |#1| '(|StepThrough|))
        (PROGN
         (QSETREFV $ 84 (|spadConstant| $ 81))
         (QSETREFV $ 55 (CONS (|dispatchFunction| |PFBRU;randomR;R;9|) $))))
       ((|HasSignature| |#1| (LIST '|random| (LIST (|devaluate| |#1|))))
        (QSETREFV $ 55 (CONS (|dispatchFunction| |PFBRU;randomR;R;10|) $)))
       ('T (QSETREFV $ 55 (CONS (|dispatchFunction| |PFBRU;randomR;R;11|) $))))
      $)))) 

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
